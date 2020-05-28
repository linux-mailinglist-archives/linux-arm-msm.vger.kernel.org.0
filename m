Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601B51E5BB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 11:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgE1JSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 05:18:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61358 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728224AbgE1JSr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 05:18:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590657527; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zGtoqNo2VGm+/4eivpOXGVgnUGuQdCx0t6qeUO6nWQw=; b=NfS0GGu2U1VmhM5jbRVssWayQIUVzhn90u80gJ2na+oDnpWBEmeFAFO+886vq3K+siW586bs
 bVEOkXtXadwQjVRhryg8NbblAAA108kFXnIQ6IyUJ1IrriDSRNj9M1esxsdQpMoyLGDYCBT/
 aa/6xRM+pxVN3fPrZH0S5XUSGZE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ecf81f0c6d4683243cc39c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 09:18:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7FC6C433CB; Thu, 28 May 2020 09:18:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.253.38.28] (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47F5CC433C6;
        Thu, 28 May 2020 09:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47F5CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
Subject: Re: [PATCH v4] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org
References: <1590644248-9373-1-git-send-email-zijuhu@codeaurora.org>
 <00A6B08C-CFDB-43A1-B813-CE3DF241FF33@holtmann.org>
From:   Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <377e1840-e8e7-38f6-cb7a-2532b07249f0@codeaurora.org>
Date:   Thu, 28 May 2020 17:18:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <00A6B08C-CFDB-43A1-B813-CE3DF241FF33@holtmann.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/28/2020 4:19 PM, Marcel Holtmann wrote:
> Hi Zijun,
> 
>> Warm reboot can not restore qca6390 controller baudrate
>> to default due to lack of controllable BT_EN pin or power
>> supply, so fails to download firmware after warm reboot.
>>
>> Fixed by sending EDL_SOC_RESET VSC to reset controller
>> within added device shutdown implementation.
>>
>> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
>> ---
>> drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index e4a6823..8e03bfe 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1975,6 +1975,38 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>> 	hci_uart_unregister_device(&qcadev->serdev_hu);
>> }
>>
>> +static void qca_serdev_shutdown(struct device *dev)
>> +{
>> +	int ret;
>> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
>> +	struct serdev_device *serdev = to_serdev_device(dev);
>> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
>> +	const u8 ibs_wake_cmd[] = { 0xFD };
>> +	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
> 
> struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
> no.
this dev is serdev_device not hci_dev
>> +
>> +	if (qcadev->btsoc_type == QCA_QCA6390) {
>> +		serdev_device_write_flush(serdev);
>> +		ret = serdev_device_write_buf(serdev,
>> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
>> +		if (ret < 0) {
>> +			BT_ERR("QCA send IBS_WAKE_IND error: %d", ret);
> 
> And then use bt_dev_err here.
as explained above about dev, bt_dev_err is not a good selection at
this serdev_device shudown operation.
> 
>> +			return;
>> +		}
>> +		serdev_device_wait_until_sent(serdev, timeout);
>> +		usleep_range(8000, 10000);
>> +
>> +		serdev_device_write_flush(serdev);
>> +		ret = serdev_device_write_buf(serdev,
>> +				edl_reset_soc_cmd, sizeof(edl_reset_soc_cmd));
>> +		if (ret < 0) {
>> +			BT_ERR("QCA send EDL_RESET_REQ error: %d", ret);
>> +			return;
>> +		}
>> +		serdev_device_wait_until_sent(serdev, timeout);
>> +		usleep_range(8000, 10000);
>> +	}
>> +}
>> +
>> static int __maybe_unused qca_suspend(struct device *dev)
>> {
>> 	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
>> @@ -2100,6 +2132,7 @@ static struct serdev_device_driver qca_serdev_driver = {
>> 		.name = "hci_uart_qca",
>> 		.of_match_table = of_match_ptr(qca_bluetooth_of_match),
>> 		.acpi_match_table = ACPI_PTR(qca_bluetooth_acpi_match),
>> +		.shutdown = qca_serdev_shutdown,
>> 		.pm = &qca_pm_ops,
>> 	},
>> };
> 
> Regards
> 
> Marcel
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
