Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C704B1706C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 18:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgBZR5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 12:57:14 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:27212 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgBZR5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 12:57:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582739833; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1FRC7G5RLOKAqWukCp8w9mvcbOaiPX8gDDcHcTJBzI4=; b=RFLh4R/CfuaFKztJfJfyI9qUEFNyJ9HYqsh1Pr/7xarntHNX7SrB9H03KPn7PJTLeZYNROzv
 30q3Aewn2jvy5ifPxLPdtTrhK/7dB+g+SJ2CQtrliKF7qKb5gmgWzL1RGO/qGaImUz+ZsG4z
 7XC1BvtaKPGVPxESUfSB0hsFgi4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e56b171.7ff8b67de5e0-smtp-out-n02;
 Wed, 26 Feb 2020 17:57:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8774CC4479C; Wed, 26 Feb 2020 17:57:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CBACC4479F;
        Wed, 26 Feb 2020 17:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4CBACC4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [<RFC PATCH v1> 1/2] scsi: ufs: add write booster feature support
To:     Avri Altman <Avri.Altman@wdc.com>,
        "subhashj@codeaurora.org" <subhashj@codeaurora.org>,
        "cang@codeaurora.org" <cang@codeaurora.org>,
        "rnayak@codeaurora.org" <rnayak@codeaurora.org>,
        "vinholikatti@gmail.com" <vinholikatti@gmail.com>,
        "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1582330473.git.asutoshd@codeaurora.org>
 <0eb182e6731bc4ce0c1d6a97f102155d7186520f.1582330473.git.asutoshd@codeaurora.org>
 <MN2PR04MB699133FA7E3B2B7A4F1450FAFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <54fd84a6-0c20-ba96-c9a6-5c76bf2611c7@codeaurora.org>
Date:   Wed, 26 Feb 2020 09:57:00 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MN2PR04MB699133FA7E3B2B7A4F1450FAFCED0@MN2PR04MB6991.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/25/2020 4:50 AM, Avri Altman wrote:
>> +/*
>> + * ufshcd_get_wb_alloc_units - returns
>> "dLUNumWriteBoosterBufferAllocUnits"
>> + * @hba: per-adapter instance
>> + * @lun: UFS device lun id
>> + * @d_lun_wbb_au: pointer to buffer to hold the LU's alloc units info
>> + *
>> + * Returns 0 in case of success and d_lun_wbb_au would be returned
>> + * Returns -ENOTSUPP if reading d_lun_wbb_au is not supported.
>> + * Returns -EINVAL in case of invalid parameters passed to this function.
>> + */
>> +static int ufshcd_get_wb_alloc_units(struct ufs_hba *hba,
>> +                           u8 lun,
>> +                           u8 *d_lun_wbb_au)
>> +{
>> +       int ret;
>> +
>> +       if (!d_lun_wbb_au)
>> +               ret = -EINVAL;
>> +
>> +       /* WB can be supported only from LU0..LU7 */
>> +       else if (lun >= UFS_UPIU_MAX_GENERAL_LUN)
>> +               ret = -ENOTSUPP;
>> +       else
>> +               ret = ufshcd_read_unit_desc_param(hba,
>> +                                         lun,
>> +                                         UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS,
>> +                                         d_lun_wbb_au,
>> +                                         sizeof(*d_lun_wbb_au));
> You are reading here a single byte, instead of 4
> 
>> +       return ret;
>> +}
>> +
>>   /**
>>    * ufshcd_get_lu_power_on_wp_status - get LU's power on write protect
>>    * status
>> @@ -5194,6 +5267,165 @@ static void
>> ufshcd_bkops_exception_event_handler(struct ufs_hba *hba)
>>                                  __func__, err);
>>   }
>>
>> +static bool ufshcd_wb_sup(struct ufs_hba *hba)
>> +{
>> +       return ((hba->dev_info.d_ext_ufs_feature_sup &
>> +                  UFS_DEV_WRITE_BOOSTER_SUP) &&
> Don't you want to have a vendor cap as well,
> to allow the platform vendor to control this feature?
> 
>> +                 (hba->dev_info.b_wb_buffer_type
>> +                  || hba->dev_info.wb_config_lun));
>> +}
>> +
>> +
> 
> 
> 
>> +static bool ufshcd_wb_is_buf_flush_needed(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +       u32 cur_buf, status, avail_buf;
>> +
>> +       if (!ufshcd_wb_sup(hba))
>> +               return false;
>> +
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
>> +       if (ret <= 0) {
>> +               dev_dbg(hba->dev, "Get user-cap reduction mode: failed: %d\n",
>> +                       ret);
>> +               /* Most commonly used */
>> +               ret = UFS_WB_BUFF_PRESERVE_USER_SPACE;
>> +       }
>> +
>> +       hba->dev_info.keep_vcc_on = false;
>> +       if (ret == UFS_WB_BUFF_USER_SPACE_RED_EN) {
>> +               if (avail_buf <= UFS_WB_10_PERCENT_BUF_REMAIN) {
>> +                       hba->dev_info.keep_vcc_on = true;
>> +                       return true;
>> +               }
>> +               return false;
>> +       } else if (ret == UFS_WB_BUFF_PRESERVE_USER_SPACE) {
>> +               ret = ufshcd_query_attr_retry(hba,
>> UPIU_QUERY_OPCODE_READ_ATTR,
>> +                                             QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE,
>> +                                             0, 0, &cur_buf);
>> +               if (ret) {
>> +                       dev_err(hba->dev, "%s dCurWriteBoosterBufferSize read failed
>> %d\n",
>> +                                __func__, ret);
>> +                       return false;
>> +               }
>> +
>> +               if (!cur_buf) {
>> +                       dev_info(hba->dev, "dCurWBBuf: %d WB disabled until free-
>> space is available\n",
>> +                                cur_buf);
>> +                       return false;
>> +               }
>> +
>> +               ret = ufshcd_get_ee_status(hba, &status);
>> +               if (ret) {
>> +                       dev_err(hba->dev, "%s: failed to get exception status %d\n",
>> +                               __func__, ret);
>> +                       if (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN) {
>> +                               hba->dev_info.keep_vcc_on = true;
>> +                               return true;
>> +                       }
>> +                       return false;
>> +               }
>> +
>> +               status &= hba->ee_ctrl_mask;
>> +
>> +               if ((status & MASK_EE_URGENT_BKOPS) ||
> So you are getting the status, but not the bkops level.
> And what about WRITEBOOSTER_EVENT_EN? After all it was invented specifically for WB...
> 
>> +                   (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)) {
>> +                       hba->dev_info.keep_vcc_on = true;
>> +                       return true;
>> +               }
>> +       }
>> +       return false;
>> +}
> 
> Thanks,
> Avri
> 

Thanks Avri/Bart for the comments.
I'll wait for a couple of more days, if anyone else has any comments.

I'd respond/address the comments thereafter.

Thanks,
asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
