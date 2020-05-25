Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFE31E0D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390277AbgEYLal convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:30:41 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46961 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390238AbgEYLai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:30:38 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id E7905CECDB;
        Mon, 25 May 2020 13:40:20 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590399072-32407-1-git-send-email-zijuhu@codeaurora.org>
Date:   Mon, 25 May 2020 13:30:34 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Hemantg <hemantg@codeaurora.org>, mka@chromium.org,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1FEE6EDA-B25E-4A3C-BEBF-6A17613693BD@holtmann.org>
References: <1590399072-32407-1-git-send-email-zijuhu@codeaurora.org>
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
> drivers/bluetooth/btqca.c   |  8 ++++----
> drivers/bluetooth/hci_qca.c | 27 +++++++++++++++++++++++++++
> 2 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index 3ea866d..7bbdf4d 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -74,10 +74,10 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
> 
> 	ver = (struct qca_btsoc_version *)(edl->data);
> 
> -	BT_DBG("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
> -	BT_DBG("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
> -	BT_DBG("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
> -	BT_DBG("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));
> +	BT_INFO("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
> +	BT_INFO("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
> +	BT_INFO("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
> +	BT_INFO("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));

if you do this then switch to bt_dew_info() please. However it should be a separate patch since it has nothing to do with what you are fixing.

> 
> 	/* QCA chipset version can be decided by patch and SoC
> 	 * version, combination with upper 2 bytes from SoC
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..a4f86e4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1975,6 +1975,32 @@ static void qca_serdev_remove(struct serdev_device *serdev)
> 	hci_uart_unregister_device(&qcadev->serdev_hu);
> }
> 
> +static void qca_serdev_shutdown(struct device *dev)
> +{
> +	int res;
> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
> +	struct serdev_device *serdev = to_serdev_device(dev);
> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> +	u8 ibs_wake_cmd[] = {0xfd};
> +	u8 edl_reset_soc_cmd[] = {0x01, 0x00, 0xfc, 0x01, 0x05};

{ 0xAB, 0x12 } please. And these can be const.

> +
> +	if (qcadev->btsoc_type == QCA_QCA6390) {
> +		serdev_device_write_flush(serdev);
> +		res = serdev_device_write_buf(serdev,
> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
> +		BT_INFO("%s: send ibs_wake_cmd res = %d", __func__, res);

We are not printing __func__ with BT_INFO. Use BT_DBG here.

> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +
> +		serdev_device_write_flush(serdev);
> +		res = serdev_device_write_buf(serdev,
> +				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
> +		BT_INFO("%s: send edl_reset_soc_cmd res = %d", __func__, res);
> +		serdev_device_wait_until_sent(serdev, timeout);
> +		usleep_range(8000, 10000);
> +	}
> +}
> +
> static int __maybe_unused qca_suspend(struct device *dev)
> {
> 	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> @@ -2100,6 +2126,7 @@ static struct serdev_device_driver qca_serdev_driver = {
> 		.name = "hci_uart_qca",
> 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
> 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
> +		.shutdown = qca_serdev_shutdown,
> 		.pm = &qca_pm_ops,
> 	},
> };

Regards

Marcel

