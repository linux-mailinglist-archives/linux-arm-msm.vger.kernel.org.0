Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F151112AE74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 21:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfLZU3x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 15:29:53 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:39210 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfLZU3w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 15:29:52 -0500
Received: from [192.168.0.171] (188.147.97.8.nat.umts.dynamic.t-mobile.pl [188.147.97.8])
        by mail.holtmann.org (Postfix) with ESMTPSA id C03E9CECEC;
        Thu, 26 Dec 2019 21:39:04 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v2 4/4] Bluetooth: hci_qca: Add HCI command timeout
 handling
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191226064554.16803-4-rjliao@codeaurora.org>
Date:   Thu, 26 Dec 2019 21:29:49 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <09B49A15-5647-4EB3-A17A-97D1A6F8E0C2@holtmann.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191226064554.16803-1-rjliao@codeaurora.org>
 <20191226064554.16803-4-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch adds the HCI command timeout handling, it will trigger btsoc
> to report its memory dump via vendor specific events when hit the defined
> max HCI command timeout count. After all the memory dump VSE are sent, the
> btsoc will also send a HCI_HW_ERROR event to host and this will cause a new
> hci down/up process and the btsoc will be re-initialized.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2:
> - Fix build error
> 
> drivers/bluetooth/hci_qca.c | 43 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7e202041ed77..34ef73daebb2 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -47,6 +47,8 @@
> #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
> #define CMD_TRANS_TIMEOUT_MS		100
> 
> +#define QCA_BTSOC_DUMP_CMD	0xFB
> +
> /* susclk rate */
> #define SUSCLK_RATE_32KHZ	32768
> 
> @@ -56,6 +58,9 @@
> /* max retry count when init fails */
> #define QCA_MAX_INIT_RETRY_COUNT 3
> 
> +/* when hit the max cmd time out count, trigger btsoc dump */
> +#define QCA_MAX_CMD_TIMEOUT_COUNT 3
> +
> enum qca_flags {
> 	QCA_IBS_ENABLED,
> 	QCA_DROP_VENDOR_EVENT,
> @@ -123,6 +128,8 @@ struct qca_data {
> 	u64 rx_votes_off;
> 	u64 votes_on;
> 	u64 votes_off;
> +
> +	u32 cmd_timeout_cnt;
> };
> 
> enum qca_speed_type {
> @@ -170,6 +177,7 @@ static int qca_regulator_enable(struct qca_serdev *qcadev);
> static void qca_regulator_disable(struct qca_serdev *qcadev);
> static void qca_power_shutdown(struct hci_uart *hu);
> static int qca_power_off(struct hci_dev *hdev);
> +static void qca_cmd_timeout(struct hci_dev *hdev);

I thought that I already mentioned that these forward declaration have to be removed. I have no plan to take patches that even add more forward declarations.

> 
> static enum qca_btsoc_type qca_soc_type(struct hci_uart *hu)
> {
> @@ -1337,6 +1345,8 @@ static int qca_setup(struct hci_uart *hu)
> 	if (!ret) {
> 		set_bit(QCA_IBS_ENABLED, &qca->flags);
> 		qca_debugfs_init(hdev);
> +		hdev->cmd_timeout = qca_cmd_timeout;

Why set it here? Set in the probe() callback.

> +		qca->cmd_timeout_cnt = 0;

This is a race conditions if not all chip types will use NON_PERSISTENT_SETUP.

> 	} else if (ret == -ENOENT) {
> 		/* No patch/nvm-config found, run with original fw/config */
> 		ret = 0;
> @@ -1467,6 +1477,39 @@ static int qca_power_off(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int qca_send_btsoc_dump_cmd(struct hci_uart *hu)
> +{
> +	int err = 0;
> +	struct sk_buff *skb = NULL;
> +	struct qca_data *qca = hu->priv;
> +
> +	BT_DBG("hu %p sending btsoc dump command", hu);
> +
> +	skb = bt_skb_alloc(1, GFP_ATOMIC);
> +	if (!skb) {
> +		BT_ERR("Failed to allocate memory for qca dump command");
> +		return -ENOMEM;
> +	}
> +
> +	skb_put_u8(skb, QCA_BTSOC_DUMP_CMD);
> +
> +	skb_queue_tail(&qca->txq, skb);
> +
> +	return err;
> +}
> +
> +

No double empty lines.

> +static void qca_cmd_timeout(struct hci_dev *hdev)
> +{
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	struct qca_data *qca = hu->priv;
> +
> +	BT_ERR("hu %p hci cmd timeout count=0x%x", hu, ++qca->cmd_timeout_cnt);
> +
> +	if (qca->cmd_timeout_cnt >= QCA_MAX_CMD_TIMEOUT_COUNT)
> +		qca_send_btsoc_dump_cmd(hu);
> +}
> +
> static int qca_regulator_enable(struct qca_serdev *qcadev)
> {
> 	struct qca_power *power = qcadev->bt_power;

Regards

Marcel

