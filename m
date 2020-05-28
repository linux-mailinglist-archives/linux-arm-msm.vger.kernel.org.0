Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474DB1E5A99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 10:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgE1IT4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 04:19:56 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33797 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgE1IT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 04:19:56 -0400
Received: from marcel-macpro.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 03C0FCECB0;
        Thu, 28 May 2020 10:29:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590644248-9373-1-git-send-email-zijuhu@codeaurora.org>
Date:   Thu, 28 May 2020 10:19:53 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <00A6B08C-CFDB-43A1-B813-CE3DF241FF33@holtmann.org>
References: <1590644248-9373-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> Warm reboot can not restore qca6390 controller baudrate
> to default due to lack of controllable BT_EN pin or power
> supply, so fails to download firmware after warm reboot.
> 
> Fixed by sending EDL_SOC_RESET VSC to reset controller
> within added device shutdown implementation.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..8e03bfe 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1975,6 +1975,38 @@ static void qca_serdev_remove(struct serdev_device *serdev)
> 	hci_uart_unregister_device(&qcadev->serdev_hu);
> }
> 
> +static void qca_serdev_shutdown(struct device *dev)
> +{
> +	int ret;
> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	const u8 ibs_wake_cmd[] = { 0xFD };
> +	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };

struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);

> +
> +	if (qcadev->btsoc_type == QCA_QCA6390) {
> +		serdev_device_write_flush(serdev);
> +		ret = serdev_device_write_buf(serdev,
> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
> +		if (ret < 0) {
> +			BT_ERR("QCA send IBS_WAKE_IND error: %d", ret);

And then use bt_dev_err here.

> +			return;
> +		}
> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +
> +		serdev_device_write_flush(serdev);
> +		ret = serdev_device_write_buf(serdev,
> +				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
> +		if (ret < 0) {
> +			BT_ERR("QCA send EDL_RESET_REQ error: %d", ret);
> +			return;
> +		}
> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +	}
> +}
> +
> static int __maybe_unused qca_suspend(struct device *dev)
> {
> 	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> @@ -2100,6 +2132,7 @@ static struct serdev_device_driver qca_serdev_driver = {
> 		.name = "hci_uart_qca",
> 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
> 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
> +		.shutdown = qca_serdev_shutdown,
> 		.pm = &qca_pm_ops,
> 	},
> };

Regards

Marcel

