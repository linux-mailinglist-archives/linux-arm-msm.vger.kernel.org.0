Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F1F2C2D92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 17:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390710AbgKXQ5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 11:57:20 -0500
Received: from z5.mailgun.us ([104.130.96.5]:45455 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390711AbgKXQ5T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 11:57:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606237039; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZqaDzmaQdZPt9r/+HWJzSzMb1fb/lC/ceBW8DiHJrBk=;
 b=PlSwrnd4cANs0mAR7xU1I6z6QwmepiUL9cH3rWEQaoqTd/VGF9MfnWOVhyP3w8cGsdIu9WQ1
 DnFlGm1tRnjIEhE8LFFb2I4Pza+nJf9nLEsYXg21BfJAaW9lYvqx52UE29MK6pxpgiqqLMr+
 1axuHdNH4quIgE0lH+PtVbo+ZqI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fbd3b5cc6fdb18c63cc8c3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 16:57:00
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C72EC433C6; Tue, 24 Nov 2020 16:57:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED6B0C433ED;
        Tue, 24 Nov 2020 16:56:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Nov 2020 22:26:58 +0530
From:   gubbaven@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v2] Bluetooth: btqca: Add support to read FW build version
 for WCN3991 BTSoC
In-Reply-To: <20201118145725.GI8532@builder.lan>
References: <1605703943-25980-1-git-send-email-gubbaven@codeaurora.org>
 <20201118145725.GI8532@builder.lan>
Message-ID: <2366096dae31651769bfe1f7f3796a16@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,
On 2020-11-18 20:27, Bjorn Andersson wrote:
> On Wed 18 Nov 06:52 CST 2020, Venkata Lakshmi Narayana Gubba wrote:
> 
>> Add support to read FW build version for WCN3991 BTSoC
> 
> Your commit message doesn't describe why you need/want this? Is it
> somehow required for BT to come up or is it simply 57 lines of code to
> print a line of build info in the kernel log?
> 
> 
> 
> Note that most people reading the kernel log won't care about what
> firmware version their BT chip is running, so if it's only for your own
> debugging purpose I would prefer if you make this available in sysfs or
> debugfs.
> 
> Regards,
> Bjorn
> 
[Venkata] :
Yes, this code is to print build info in kernel log for debugging 
purpose.
I will add this in debugfs and will post the updated patch.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  drivers/bluetooth/btqca.c | 57 
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/bluetooth/btqca.h |  3 +++
>>  2 files changed, 60 insertions(+)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index ce9dcff..dfd7ff7 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -101,6 +101,56 @@ int qca_read_soc_version(struct hci_dev *hdev, 
>> u32 *soc_version,
>>  }
>>  EXPORT_SYMBOL_GPL(qca_read_soc_version);
>> 
>> +static int qca_read_fw_build_info(struct hci_dev *hdev)
>> +{
>> +	struct sk_buff *skb;
>> +	struct edl_event_hdr *edl;
>> +	char cmd;
>> +	int err = 0;
>> +	char build_label[QCA_FW_BUILD_VER_LEN];
>> +	int build_lbl_len;
>> +
>> +	bt_dev_dbg(hdev, "QCA read fw build info");
>> +
>> +	cmd = EDL_GET_BUILD_INFO_CMD;
>> +	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, 
>> EDL_PATCH_CMD_LEN,
>> +				&cmd, HCI_EV_VENDOR, HCI_INIT_TIMEOUT);
>> +	if (IS_ERR(skb)) {
>> +		err = PTR_ERR(skb);
>> +		bt_dev_err(hdev, "Reading QCA fw build info failed (%d)",
>> +			   err);
>> +		return err;
>> +	}
>> +
>> +	edl = (struct edl_event_hdr *)(skb->data);
>> +	if (!edl) {
>> +		bt_dev_err(hdev, "QCA read fw build info with no header");
>> +		err = -EILSEQ;
>> +		goto out;
>> +	}
>> +
>> +	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
>> +	    edl->rtype != EDL_GET_BUILD_INFO_CMD) {
>> +		bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
>> +			   edl->rtype);
>> +		err = -EIO;
>> +		goto out;
>> +	}
>> +
>> +	build_lbl_len = edl->data[0];
>> +	memcpy(build_label, &edl->data[1], build_lbl_len);
>> +	*(build_label + build_lbl_len) = '\0';
>> +
>> +	bt_dev_info(hdev, "BT SoC FW Build info: %s", build_label);
>> +
>> +out:
>> +	kfree_skb(skb);
>> +	if (err)
>> +		bt_dev_err(hdev, "QCA read fw build info failed (%d)", err);
>> +
>> +	return err;
>> +}
>> +
>>  static int qca_send_reset(struct hci_dev *hdev)
>>  {
>>  	struct sk_buff *skb;
>> @@ -520,6 +570,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>>  		return err;
>>  	}
>> 
>> +	if (soc_type == QCA_WCN3991) {
>> +		/* get fw build info */
>> +		err = qca_read_fw_build_info(hdev);
>> +		if (err < 0)
>> +			return err;
>> +	}
>> +
>>  	bt_dev_info(hdev, "QCA setup on UART is completed");
>> 
>>  	return 0;
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index d81b74c..375c7fc 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -11,6 +11,7 @@
>>  #define EDL_PATCH_CMD_LEN		(1)
>>  #define EDL_PATCH_VER_REQ_CMD		(0x19)
>>  #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
>> +#define EDL_GET_BUILD_INFO_CMD		(0x20)
>>  #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
>>  #define MAX_SIZE_PER_TLV_SEGMENT	(243)
>>  #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
>> @@ -34,6 +35,8 @@
>>  #define QCA_HCI_CC_OPCODE		0xFC00
>>  #define QCA_HCI_CC_SUCCESS		0x00
>> 
>> +#define QCA_FW_BUILD_VER_LEN		255
>> +
>>  enum qca_baudrate {
>>  	QCA_BAUDRATE_115200 	= 0,
>>  	QCA_BAUDRATE_57600,
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
Regards,
Lakshmi Narayana.
