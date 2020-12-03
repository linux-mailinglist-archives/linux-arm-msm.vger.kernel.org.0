Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B342CD856
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgLCN65 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Thu, 3 Dec 2020 08:58:57 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46552 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgLCN65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 08:58:57 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 90937CECFD;
        Thu,  3 Dec 2020 15:05:28 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Add support to read FW build
 version for WCN3991 BTSoC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1606998001-17424-1-git-send-email-gubbaven@codeaurora.org>
Date:   Thu, 3 Dec 2020 14:58:14 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        BlueZ development <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        abhishekpandit@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <AD0B5336-49BA-49D2-90DB-1D18A74C2883@holtmann.org>
References: <1606998001-17424-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Add support to read FW build version from debugfs node.
> This info can be read from
> /sys/kernel/debug/bluetooth/hci0/ibs/fw_build_info
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> drivers/bluetooth/btqca.c   | 48 +++++++++++++++++++++++++++++++++++++++++++++
> drivers/bluetooth/btqca.h   |  8 ++++++++
> drivers/bluetooth/hci_qca.c | 34 ++++++++++++++++++++++++++++++++
> 3 files changed, 90 insertions(+)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index f85a55a..660eea5 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -94,6 +94,54 @@ int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
> }
> EXPORT_SYMBOL_GPL(qca_read_soc_version);
> 
> +int qca_read_fw_build_info(struct hci_dev *hdev, u8 *fw_build)
> +{
> +	struct sk_buff *skb;
> +	struct edl_event_hdr *edl;
> +	char cmd;
> +	int err = 0;
> +	int build_lbl_len;
> +
> +	bt_dev_dbg(hdev, "QCA read fw build info");
> +
> +	cmd = EDL_GET_BUILD_INFO_CMD;
> +	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
> +				&cmd, 0, HCI_INIT_TIMEOUT);
> +	if (IS_ERR(skb)) {
> +		err = PTR_ERR(skb);
> +		bt_dev_err(hdev, "Reading QCA fw build info failed (%d)",
> +			   err);
> +		return err;
> +	}
> +
> +	edl = (struct edl_event_hdr *)(skb->data);
> +	if (!edl) {
> +		bt_dev_err(hdev, "QCA read fw build info with no header");
> +		err = -EILSEQ;
> +		goto out;
> +	}
> +
> +	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
> +	    edl->rtype != EDL_GET_BUILD_INFO_CMD) {
> +		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
> +			   edl->rtype);
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +	build_lbl_len = edl->data[0];
> +	if (build_lbl_len <= QCA_FW_BUILD_VER_LEN - 2) {
> +		memcpy(fw_build, &edl->data[1], build_lbl_len);
> +		*(fw_build + build_lbl_len) = '\n';
> +		*(fw_build + build_lbl_len + 1) = '\0';
> +	}
> +
> +out:
> +	kfree_skb(skb);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(qca_read_fw_build_info);
> +
> static int qca_send_reset(struct hci_dev *hdev)
> {
> 	struct sk_buff *skb;
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index e73b8f8..ac1b76a 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -11,6 +11,7 @@
> #define EDL_PATCH_CMD_LEN		(1)
> #define EDL_PATCH_VER_REQ_CMD		(0x19)
> #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
> +#define EDL_GET_BUILD_INFO_CMD		(0x20)
> #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
> #define MAX_SIZE_PER_TLV_SEGMENT	(243)
> #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
> @@ -154,6 +155,7 @@ int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
> 			 enum qca_btsoc_type);
> int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
> +int qca_read_fw_build_info(struct hci_dev *hdev, u8 *fw_build);
> static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
> {
> 	return soc_type == QCA_WCN3990 || soc_type == QCA_WCN3991 ||
> @@ -195,4 +197,10 @@ static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
> {
> 	return -EOPNOTSUPP;
> }
> +
> +static inline int qca_read_fw_build_info(struct hci_dev *hdev, u8 *fw_build)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> #endif
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 4a96368..56616b0 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -180,6 +180,7 @@ struct qca_data {
> 	u64 rx_votes_off;
> 	u64 votes_on;
> 	u64 votes_off;
> +	u8 fw_build[QCA_FW_BUILD_VER_LEN];
> };
> 
> enum qca_speed_type {
> @@ -621,12 +622,33 @@ static int qca_open(struct hci_uart *hu)
> 	return 0;
> }
> 
> +static ssize_t fw_build_read(struct file *file, char __user *user_buf,
> +			     size_t count, loff_t *ppos)
> +{
> +	struct hci_dev *hdev = file->private_data;
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	struct qca_data *qca = hu->priv;
> +	u8 length = 0;
> +
> +	length = strlen(qca->fw_build);
> +
> +	return simple_read_from_buffer(user_buf, count, ppos, qca->fw_build,
> +				       length);
> +}
> +
> +static const struct file_operations fw_build_fops = {
> +	.open = simple_open,
> +	.read = fw_build_read,
> +};
> +
> static void qca_debugfs_init(struct hci_dev *hdev)
> {
> 	struct hci_uart *hu = hci_get_drvdata(hdev);
> 	struct qca_data *qca = hu->priv;
> 	struct dentry *ibs_dir;
> 	umode_t mode;
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> +	int ret;
> 
> 	if (!hdev->debugfs)
> 		return;
> @@ -659,12 +681,24 @@ static void qca_debugfs_init(struct hci_dev *hdev)
> 	debugfs_create_u64("votes_off", mode, ibs_dir, &qca->votes_off);
> 	debugfs_create_u32("vote_on_ms", mode, ibs_dir, &qca->vote_on_ms);
> 	debugfs_create_u32("vote_off_ms", mode, ibs_dir, &qca->vote_off_ms);
> +	if (soc_type == QCA_WCN3991) {
> +		debugfs_create_file("fw_build_info", mode, ibs_dir, hdev,
> +				    &fw_build_fops);
> +	}

what is wrong with using hci_set_fw_info?

Regards

Marcel

