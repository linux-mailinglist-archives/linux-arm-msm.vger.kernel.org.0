Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166481B30E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 22:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDUUBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 16:01:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:21540 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726039AbgDUUBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 16:01:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587499293; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0UuX/wSK45nkB5sU+cHphiivnPfpWOi1oe6fznQzbCU=; b=h7QQyaa8XHsIUyqo92DU35ch5Qj3Kd4ObARLws+wnHdn4AZoLR6qm3lhmM7Dsc5WFXOtFTTZ
 1+CQSr1OQxzCuRnYKNuMuI+H2zR+fSnjR+aGLWbaJ5teKC13Oe8VQEokKzPVvJ3M2E/ESk+r
 WXSJZlYeLbuMS6wZJJ6AaBEZcj4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f5101.7f0d00545180-smtp-out-n04;
 Tue, 21 Apr 2020 20:01:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5DE0AC44793; Tue, 21 Apr 2020 20:01:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.8.111] (cpe-70-95-153-89.san.res.rr.com [70.95.153.89])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 21053C432C2;
        Tue, 21 Apr 2020 20:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 21053C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Avri Altman <Avri.Altman@wdc.com>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1586374414.git.asutoshd@codeaurora.org>
 <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
 <SN6PR04MB4640E5A6BAAD89DDC3F2FFE0FCDC0@SN6PR04MB4640.namprd04.prod.outlook.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <87344180-7da6-ee3a-3503-39a64a41d552@codeaurora.org>
Date:   Tue, 21 Apr 2020 13:01:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR04MB4640E5A6BAAD89DDC3F2FFE0FCDC0@SN6PR04MB4640.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/12/2020 5:43 AM, Avri Altman wrote:
> Hi,
> 
>>
>>   enum ufs_desc_def_size {
>> -       QUERY_DESC_DEVICE_DEF_SIZE              = 0x40,
>> +       QUERY_DESC_DEVICE_DEF_SIZE              = 0x59,
>>          QUERY_DESC_CONFIGURATION_DEF_SIZE       = 0x90,
>>          QUERY_DESC_UNIT_DEF_SIZE                = 0x23,
> Might as well update the unit descriptor size - its 0x2D now,
> As you are adding its new fields
> 
>>          QUERY_DESC_INTERCONNECT_DEF_SIZE        = 0x06,
>> @@ -219,6 +226,7 @@ enum unit_desc_param {
>>          UNIT_DESC_PARAM_PHY_MEM_RSRC_CNT        = 0x18,
>>          UNIT_DESC_PARAM_CTX_CAPABILITIES        = 0x20,
>>          UNIT_DESC_PARAM_LARGE_UNIT_SIZE_M1      = 0x22,
>> +       UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS      = 0x29,
>>   };
>>
>>   /* Device descriptor parameters offsets in bytes*/
>> @@ -258,6 +266,9 @@ enum device_desc_param {
>>          DEVICE_DESC_PARAM_PSA_MAX_DATA          = 0x25,
>>          DEVICE_DESC_PARAM_PSA_TMT               = 0x29,
>>          DEVICE_DESC_PARAM_PRDCT_REV             = 0x2A,
>> +       DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP   = 0x4F,
> DEVICE_DESC_PARAM_WB_USER_TYPE               = 0x53,
> 
>> +       DEVICE_DESC_PARAM_WB_TYPE               = 0x54,
>> +       DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS = 0x55,
>>   };
>>
> 
> 
>> +enum ufs_dev_wb_buf_user_cap_config {
>> +       UFS_WB_BUFF_PRESERVE_USER_SPACE = 1,
>> +       UFS_WB_BUFF_USER_SPACE_RED_EN = 2,
>> +};
> Maybe better to follow the spec here:
> Reduced - 0
> Preserve - 1
>
I don't think these enums would be needed. Let me check and remove these 
otherwise.
  >> +static inline void ufshcd_wb_config(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +
>> +       if (!ufshcd_wb_sup(hba))
>> +               return;
>> +
>> +       ret = ufshcd_wb_ctrl(hba, true);
> Why are you setting WB on init?
During init the clocks are scaled-up. Hence, WB is set at init.
It gets disabled when the clocks are scaled down, which is almost 
immediate anyway.

> 
>> +       if (ret)
>> +               dev_err(hba->dev, "%s: Enable WB failed: %d\n", __func__, ret);
>> +       else
>> +               dev_info(hba->dev, "%s: Write Booster Configured\n", __func__);
>> +       ret = ufshcd_wb_toggle_flush_during_h8(hba, true);
>> +       if (ret)
>> +               dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
>> +                       __func__, ret);
>> +       ufshcd_wb_toggle_flush(hba, true);
> Why set explicit flush on init?
The design is to enable flush and let the device handle flush when DB's 
are empty on its own. Hence I'm setting flush at init itself.
> 
> 
>> +
>> +
>> +static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +       u32 cur_buf, avail_buf;
>> +
>> +       if (!ufshcd_wb_sup(hba))
>> +               return false;
>> +       /*
>> +        * The ufs device needs the vcc to be ON to flush.
>> +        * With user-space reduction enabled, it's enough to enable flush
>> +        * by checking only the available buffer. The threshold
>> +        * defined here is > 90% full.
>> +        * With user-space preserved enabled, the current-buffer
>> +        * should be checked too because the wb buffer size can reduce
>> +        * when disk tends to be full. This info is provided by current
>> +        * buffer (dCurrentWriteBoosterBufferSize). There's no point in
>> +        * keeping vcc on when current buffer is empty.
>> +        */
>> +       ret = ufshcd_query_attr_retry(hba,
>> UPIU_QUERY_OPCODE_READ_ATTR,
>> +                                     QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE,
>> +                                     0, 0, &avail_buf);
>> +       if (ret) {
>> +               dev_warn(hba->dev, "%s dAvailableWriteBoosterBufferSize read
>> failed %d\n",
>> +                        __func__, ret);
>> +               return false;
>> +       }
>> +
>> +       ret = ufshcd_vops_get_user_cap_mode(hba);
> The Preserve User Space mode should be read from -
> bWriteBoosterBufferPreserveUserSpaceEn of the device descriptor - 0ffset 0x53.
> The driver should have no judgement here.
> Based on what is configured, better to attach a helper pointer that will perform the below check,
> e.g. ufshcd_wb_preserve_keep_vcc_on() and ufshcd_wb_reduced_keep_vcc_on().
> Which will simplify the logic here and make it much more readable.
> This makes the preparations you made for ufshcd_vops_get_user_cap_mode,
> and your second patch unneeded.
Thanks, that makes sense.
> 
> 
>>   /**
>>    * ufshcd_exception_event_handler - handle exceptions raised by device
>>    * @work: pointer to work data
>> @@ -6632,6 +6829,28 @@ static int ufs_get_device_desc(struct ufs_hba
>> *hba)
>>                                        desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
>>
>>          model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
>> +       /* Enable WB only for UFS-3.1 */
>> +       if (dev_info->wspecversion >= 0x310) {
>> +               hba->dev_info.d_ext_ufs_feature_sup =
>> +                       get_unaligned_be32(desc_buf +
>> +                               DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
>> +               /*
>> +                * WB may be supported but not configured while provisioning.
>> +                * The spec says, in dedicated wb buffer mode,
>> +                * a max of 1 lun would have wb buffer configured.
>> +                * Now only shared buffer mode is supported.
>> +                */
>> +               hba->dev_info.b_wb_buffer_type =
>> +                       desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
>> +
>> +               if (!hba->dev_info.b_wb_buffer_type)
>> +                       goto skip_alloc_unit;
>> +               hba->dev_info.d_wb_alloc_units =
>> +                       get_unaligned_be32(desc_buf +
>> +                               DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
>> +       }
> Maybe pack the above code in a wb_probe() designated helper,
> which will establish if WB is supported or not.
> If one of your validation tests fails, maybe you can just
> hba->caps &= ~UFSHCD_CAP_WB_EN;
> which will further simplify your ufshcd_wb_sup()
> 
Good idea.
>   
>>          if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
>> -            ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
>> -              !ufshcd_is_runtime_pm(pm_op))) {
>> +           ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
>> +            !ufshcd_is_runtime_pm(pm_op))) {
> Redundant space removal
> 
> 
> 
> Thanks,
> Avri
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
