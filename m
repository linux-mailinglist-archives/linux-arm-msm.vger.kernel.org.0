Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E02187655
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 00:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732842AbgCPXqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 19:46:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18843 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732897AbgCPXqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 19:46:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584402373; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QMWBcPTAmVmJ/FNCGGfUCtypb9h4vyvjMsrxHp0Wri4=; b=WRQ7g3JnSJ5ip8b+DOpWyIsdQvxpuKxXtsyHqm385RnsrrwDAnB6VDjmaKI8r0n83VSDZeBl
 yf13DQ5SAOfuOurMgDFTIljrbn4zSu2AHrTUvvtHsLg3LVIw5dSnfDvX7rfuf6OJqP+mvqn8
 4EZUHUedhB6h9KxF6LRyuMdubJ4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e700fb2.7f607d05de30-smtp-out-n02;
 Mon, 16 Mar 2020 23:45:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B956C44788; Mon, 16 Mar 2020 23:45:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.8.111] (cpe-70-95-153-89.san.res.rr.com [70.95.153.89])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B056C433CB;
        Mon, 16 Mar 2020 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B056C433CB
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
 <MN2PR04MB69913E95017D4D865297AE9EFCEF0@MN2PR04MB6991.namprd04.prod.outlook.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <bb07c606-d4e9-370e-fd67-74d5db66b13c@codeaurora.org>
Date:   Mon, 16 Mar 2020 16:45:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <MN2PR04MB69913E95017D4D865297AE9EFCEF0@MN2PR04MB6991.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/23/2020 1:03 AM, Avri Altman wrote:
> Hi,
>>
>>
> Maybe add few words explaining what this feature is all about.
> 
>> Write Booster enable: SW will enable the feature
>> when clocks are scaled up.
>> Once clocks and gear are scaled up,
>> SW will set “fWriteBoosterEn” flag
>> before exiting from ufshcd_devfreq_scale() function.
>>
>> Write Booster disable: SW will disable the feature,
>> when clocks are scaled down. Once clocks and gear
>> are scaled down, SW will clear “fWriteBoosterEn” flag
>> before exiting from ufshcd_devfreq_scale() function.
> At this point I am not convinced that all readers are interesting which flag does what.
> Maybe just saying that you are intending to use the clock scaling mechanism to set WB on/off,
> Which is, IMHO, an excellent design choice.
> Also here is a good place to explain that although it is not lun-specific and will turn WB on for reads as well,
> It is a second order miss and has negligible impact of the overall performance.
> 
> Before the next paragraph you need to explain about the various WB buffer flush options -
> Not all readers are familiar with the latest spec to its details.
> 
>>
>> Write Booster Buffer flush will be enabled in following cases:
>>   1. During runtime suspend, driver would query
>>      bAvailableWriteBoosterBufferSize attribute and enable the
>>      Write Booster Buffer Flush if less than 30% Write Booster
>>      Buffer is available.
> Again, just explain why make your flush part of the power management flow,
> Without the gory details of the exact attribute, etc.
> 
>>
>> Write Booster Buffer flush will be disabled in following case:
>> During runtime suspend, if available buffer size is >30%,
>> then Write Booster Flush will be stopped by
>> clearing fWriteBoosterBufferFlushEn flag.
>>
> 
> And here a word of the various user space configuration option,
> Although I would look for ways to minimize the exposure of the WB driver,
> To the way the platform vendor provision its device.
>   
>> In non-reduction case, during runtime-suspend,
>> dCurrentWriteBoosterBufferSize attribute would determine
>> if flush is possible.
>> If this value is > 0 and availBuf is less
>> than 30% then flush is needed and vcc needs to be ON.
>>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
> 
> For RFC its fine, but when you'll send it for review,
> This patch should be divided into 4-5 patches, minimum.
> 

Looking at the number of comments, I'll send out another v2 RFC before 
sending out a patchset.

>> ---
>>   drivers/scsi/ufs/ufs-sysfs.c |  41 ++++++-
>>   drivers/scsi/ufs/ufs.h       |  61 ++++++++-
>>   drivers/scsi/ufs/ufshcd.c    | 286
>> ++++++++++++++++++++++++++++++++++++++++++-
>>   drivers/scsi/ufs/ufshcd.h    |   9 ++
>>   4 files changed, 390 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/scsi/ufs/ufs-sysfs.c b/drivers/scsi/ufs/ufs-sysfs.c
>> index dbdf8b0..4505e27 100644
>> --- a/drivers/scsi/ufs/ufs-sysfs.c
>> +++ b/drivers/scsi/ufs/ufs-sysfs.c
>> @@ -274,6 +274,10 @@ UFS_DEVICE_DESC_PARAM(device_version,
>> _DEV_VER, 2);
>>   UFS_DEVICE_DESC_PARAM(number_of_secure_wpa, _NUM_SEC_WPA, 1);
>>   UFS_DEVICE_DESC_PARAM(psa_max_data_size, _PSA_MAX_DATA, 4);
>>   UFS_DEVICE_DESC_PARAM(psa_state_timeout, _PSA_TMT, 1);
>> +UFS_DEVICE_DESC_PARAM(ext_feature_sup, _EXT_UFS_FEATURE_SUP, 4);
>> +UFS_DEVICE_DESC_PARAM(wb_presv_us_en, _WB_US_RED_EN, 1);
>> +UFS_DEVICE_DESC_PARAM(wb_type, _WB_TYPE, 1);
>> +UFS_DEVICE_DESC_PARAM(wb_shared_alloc_units,
>> _WB_SHARED_ALLOC_UNITS, 4);
>>
>>   static struct attribute *ufs_sysfs_device_descriptor[] = {
>>          &dev_attr_device_type.attr,
>> @@ -302,6 +306,10 @@ static struct attribute
>> *ufs_sysfs_device_descriptor[] = {
>>          &dev_attr_number_of_secure_wpa.attr,
>>          &dev_attr_psa_max_data_size.attr,
>>          &dev_attr_psa_state_timeout.attr,
>> +       &dev_attr_ext_feature_sup.attr,
>> +       &dev_attr_wb_presv_us_en.attr,
>> +       &dev_attr_wb_type.attr,
>> +       &dev_attr_wb_shared_alloc_units.attr,
>>          NULL,
>>   };
>>
>> @@ -371,6 +379,12 @@
>> UFS_GEOMETRY_DESC_PARAM(enh4_memory_max_alloc_units,
>>          _ENM4_MAX_NUM_UNITS, 4);
>>
>> UFS_GEOMETRY_DESC_PARAM(enh4_memory_capacity_adjustment_factor,
>>          _ENM4_CAP_ADJ_FCTR, 2);
>> +UFS_GEOMETRY_DESC_PARAM(wb_max_alloc_units,
>> _WB_MAX_ALLOC_UNITS, 4);
>> +UFS_GEOMETRY_DESC_PARAM(wb_max_wb_luns, _WB_MAX_WB_LUNS,
>> 1);
>> +UFS_GEOMETRY_DESC_PARAM(wb_buff_cap_adj, _WB_BUFF_CAP_ADJ,
>> 1);
>> +UFS_GEOMETRY_DESC_PARAM(wb_sup_red_type, _WB_SUP_RED_TYPE,
>> 1);
>> +UFS_GEOMETRY_DESC_PARAM(wb_sup_wb_type, _WB_SUP_WB_TYPE, 1);
>> +
>>
>>   static struct attribute *ufs_sysfs_geometry_descriptor[] = {
>>          &dev_attr_raw_device_capacity.attr,
>> @@ -402,6 +416,11 @@ static struct attribute
>> *ufs_sysfs_geometry_descriptor[] = {
>>          &dev_attr_enh3_memory_capacity_adjustment_factor.attr,
>>          &dev_attr_enh4_memory_max_alloc_units.attr,
>>          &dev_attr_enh4_memory_capacity_adjustment_factor.attr,
>> +       &dev_attr_wb_max_alloc_units.attr,
>> +       &dev_attr_wb_max_wb_luns.attr,
>> +       &dev_attr_wb_buff_cap_adj.attr,
>> +       &dev_attr_wb_sup_red_type.attr,
>> +       &dev_attr_wb_sup_wb_type.attr,
>>          NULL,
>>   };
>>
>> @@ -608,7 +627,7 @@ static ssize_t _name##_show(struct device *dev,
>> \
>>          if (ufshcd_query_flag(hba, UPIU_QUERY_OPCODE_READ_FLAG,         \
>>                  QUERY_FLAG_IDN##_uname, &flag))                         \
>>                  return -EINVAL;                                         \
>> -       return sprintf(buf, "%s\n", flag ? "true" : "false");           \
>> +       return snprintf(buf, PAGE_SIZE, "%s\n", flag ? "true" : "false"); \
> This should be sent as a separate bug fix - not as part of the WB series
> 
>>   }                                                                      \
>>   static DEVICE_ATTR_RO(_name)
>>
>> @@ -620,6 +639,9 @@ UFS_FLAG(life_span_mode_enable,
>> _LIFE_SPAN_MODE_ENABLE);
>>   UFS_FLAG(phy_resource_removal, _FPHYRESOURCEREMOVAL);
>>   UFS_FLAG(busy_rtc, _BUSY_RTC);
>>   UFS_FLAG(disable_fw_update, _PERMANENTLY_DISABLE_FW_UPDATE);
>> +UFS_FLAG(wb_enable, _WB_EN);
>> +UFS_FLAG(wb_flush_en, _WB_BUFF_FLUSH_EN);
>> +UFS_FLAG(wb_flush_during_h8, _WB_BUFF_FLUSH_DURING_HIBERN8);
>>
>>   static struct attribute *ufs_sysfs_device_flags[] = {
>>          &dev_attr_device_init.attr,
>> @@ -630,6 +652,9 @@ static struct attribute *ufs_sysfs_device_flags[] = {
>>          &dev_attr_phy_resource_removal.attr,
>>          &dev_attr_busy_rtc.attr,
>>          &dev_attr_disable_fw_update.attr,
>> +       &dev_attr_wb_enable.attr,
>> +       &dev_attr_wb_flush_en.attr,
>> +       &dev_attr_wb_flush_during_h8.attr,
>>          NULL,
>>   };
>>
>> @@ -647,7 +672,7 @@ static ssize_t _name##_show(struct device *dev,
>> \
>>          if (ufshcd_query_attr(hba, UPIU_QUERY_OPCODE_READ_ATTR,         \
>>                  QUERY_ATTR_IDN##_uname, 0, 0, &value))                  \
>>                  return -EINVAL;                                         \
>> -       return sprintf(buf, "0x%08X\n", value);                         \
>> +       return snprintf(buf, PAGE_SIZE, "0x%08X\n", value);             \
> ditto
> 
>>   }                                                                      \
>>   static DEVICE_ATTR_RO(_name)
>>
>> @@ -667,6 +692,11 @@ UFS_ATTRIBUTE(exception_event_status,
>> _EE_STATUS);
>>   UFS_ATTRIBUTE(ffu_status, _FFU_STATUS);
>>   UFS_ATTRIBUTE(psa_state, _PSA_STATE);
>>   UFS_ATTRIBUTE(psa_data_size, _PSA_DATA_SIZE);
>> +UFS_ATTRIBUTE(wb_flush_status, _WB_FLUSH_STATUS);
>> +UFS_ATTRIBUTE(wb_avail_buf, _AVAIL_WB_BUFF_SIZE);
>> +UFS_ATTRIBUTE(wb_life_time_est, _WB_BUFF_LIFE_TIME_EST);
>> +UFS_ATTRIBUTE(wb_cur_buf, _CURR_WB_BUFF_SIZE);
>> +
>>
>>   static struct attribute *ufs_sysfs_attributes[] = {
>>          &dev_attr_boot_lun_enabled.attr,
>> @@ -685,6 +715,10 @@ static struct attribute *ufs_sysfs_attributes[] = {
>>          &dev_attr_ffu_status.attr,
>>          &dev_attr_psa_state.attr,
>>          &dev_attr_psa_data_size.attr,
>> +       &dev_attr_wb_flush_status.attr,
>> +       &dev_attr_wb_avail_buf.attr,
>> +       &dev_attr_wb_life_time_est.attr,
>> +       &dev_attr_wb_cur_buf.attr,
>>          NULL,
>>   };
>>
>> @@ -736,6 +770,8 @@ UFS_UNIT_DESC_PARAM(provisioning_type,
>> _PROVISIONING_TYPE, 1);
>>   UFS_UNIT_DESC_PARAM(physical_memory_resourse_count,
>> _PHY_MEM_RSRC_CNT, 8);
>>   UFS_UNIT_DESC_PARAM(context_capabilities, _CTX_CAPABILITIES, 2);
>>   UFS_UNIT_DESC_PARAM(large_unit_granularity, _LARGE_UNIT_SIZE_M1,
>> 1);
>> +UFS_UNIT_DESC_PARAM(wb_buf_alloc_units, _WB_BUF_ALLOC_UNITS,
>> 4);
>> +
>>
>>   static struct attribute *ufs_sysfs_unit_descriptor[] = {
>>          &dev_attr_boot_lun_id.attr,
>> @@ -751,6 +787,7 @@ static struct attribute *ufs_sysfs_unit_descriptor[] =
>> {
>>          &dev_attr_physical_memory_resourse_count.attr,
>>          &dev_attr_context_capabilities.attr,
>>          &dev_attr_large_unit_granularity.attr,
>> +       &dev_attr_wb_buf_alloc_units.attr,
>>          NULL,
>>   };
> 
> You might want to consider exposing the clock scaling governor attribute here as well,
> Because
> a) we should do that already as it control an essential part of the ufs driver, and
> b) it control WB now as well
> 
Which clock scaling governor attributes are you alluding to so that 
we're on the same page.

>>
>> diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
>> index 990cb48..ffc4e18 100644
>> --- a/drivers/scsi/ufs/ufs.h
>> +++ b/drivers/scsi/ufs/ufs.h
>> @@ -63,6 +63,7 @@
>>   #define UFS_UPIU_MAX_UNIT_NUM_ID       0x7F
>>   #define UFS_MAX_LUNS           (SCSI_W_LUN_BASE +
>> UFS_UPIU_MAX_UNIT_NUM_ID)
>>   #define UFS_UPIU_WLUN_ID       (1 << 7)
>> +#define UFS_UPIU_MAX_GENERAL_LUN       8
> Are you using this for “LU dedicated buffer" case?
> In that case maybe MAX_DEDICATED_BUFFERS?
> 
Currently, in LU dedicated buffer case, only 1 WB buffer can be 
supported. In the current code, I use it to check if WB is configured in 
at least 1 Lun.
>>
>>   /* Well known logical unit id in LUN field of UPIU */
>>   enum {
>> @@ -140,6 +141,9 @@ enum flag_idn {
>>          QUERY_FLAG_IDN_BUSY_RTC                         = 0x09,
>>          QUERY_FLAG_IDN_RESERVED3                        = 0x0A,
>>          QUERY_FLAG_IDN_PERMANENTLY_DISABLE_FW_UPDATE    = 0x0B,
>> +       QUERY_FLAG_IDN_WB_EN                            = 0x0E,
>> +       QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN                 = 0x0F,
>> +       QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8     = 0x10,
>>   };
>>
>>   /* Attribute idn for Query requests */
>> @@ -168,6 +172,10 @@ enum attr_idn {
>>          QUERY_ATTR_IDN_PSA_STATE                = 0x15,
>>          QUERY_ATTR_IDN_PSA_DATA_SIZE            = 0x16,
>>          QUERY_ATTR_IDN_REF_CLK_GATING_WAIT_TIME = 0x17,
>> +       QUERY_ATTR_IDN_WB_FLUSH_STATUS          = 0x1C,
>> +       QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
>> +       QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
>> +       QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
>>   };
>>
>>   /* Descriptor idn for Query requests */
>> @@ -191,7 +199,7 @@ enum desc_header_offset {
>>   };
>>
>>   enum ufs_desc_def_size {
>> -       QUERY_DESC_DEVICE_DEF_SIZE              = 0x40,
>> +       QUERY_DESC_DEVICE_DEF_SIZE              = 0x59,
>>          QUERY_DESC_CONFIGURATION_DEF_SIZE       = 0x90,
>>          QUERY_DESC_UNIT_DEF_SIZE                = 0x23,
>>          QUERY_DESC_INTERCONNECT_DEF_SIZE        = 0x06,
>> @@ -219,6 +227,7 @@ enum unit_desc_param {
>>          UNIT_DESC_PARAM_PHY_MEM_RSRC_CNT        = 0x18,
>>          UNIT_DESC_PARAM_CTX_CAPABILITIES        = 0x20,
>>          UNIT_DESC_PARAM_LARGE_UNIT_SIZE_M1      = 0x22,
>> +       UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS      = 0x29,
>>   };
> We should really come up with a way to avoid this annoying habit of jedec to keep changing the descriptor sizes.
> But this is out of scope of this patchset.
> 
Yeah - now I use the 0x59 as one of the checks for WB support. I guess, 
I can just check the version to be 3.1 and if so, check for WB 
configuration.

>>
>>   /* Device descriptor parameters offsets in bytes*/
>> @@ -258,6 +267,10 @@ enum device_desc_param {
>>          DEVICE_DESC_PARAM_PSA_MAX_DATA          = 0x25,
>>          DEVICE_DESC_PARAM_PSA_TMT               = 0x29,
>>          DEVICE_DESC_PARAM_PRDCT_REV             = 0x2A,
>> +       DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP   = 0x4F,
>> +       DEVICE_DESC_PARAM_WB_US_RED_EN          = 0x53,
>> +       DEVICE_DESC_PARAM_WB_TYPE               = 0x54,
>> +       DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS = 0x55,
>>   };
>>
>>   /* Interconnect descriptor parameters offsets in bytes*/
>> @@ -302,6 +315,11 @@ enum geometry_desc_param {
>>          GEOMETRY_DESC_PARAM_ENM4_MAX_NUM_UNITS  = 0x3E,
>>          GEOMETRY_DESC_PARAM_ENM4_CAP_ADJ_FCTR   = 0x42,
>>          GEOMETRY_DESC_PARAM_OPT_LOG_BLK_SIZE    = 0x44,
>> +       GEOMETRY_DESC_PARAM_WB_MAX_ALLOC_UNITS  = 0x4F,
>> +       GEOMETRY_DESC_PARAM_WB_MAX_WB_LUNS      = 0x53,
>> +       GEOMETRY_DESC_PARAM_WB_BUFF_CAP_ADJ     = 0x54,
>> +       GEOMETRY_DESC_PARAM_WB_SUP_RED_TYPE     = 0x55,
>> +       GEOMETRY_DESC_PARAM_WB_SUP_WB_TYPE      = 0x56,
>>   };
>>
>>   /* Health descriptor parameters offsets in bytes*/
>> @@ -333,6 +351,11 @@ enum {
>>          UFSHCD_AMP              = 3,
>>   };
>>
>> +/* Possible values for dExtendedUFSFeaturesSupport */
>> +enum {
>> +       UFS_DEV_WRITE_BOOSTER_SUP       = BIT(8),
>> +};
>> +
>>   #define POWER_DESC_MAX_SIZE                    0x62
>>   #define POWER_DESC_MAX_ACTV_ICC_LVLS           16
>>
>> @@ -447,6 +470,38 @@ enum ufs_dev_pwr_mode {
>>          UFS_POWERDOWN_PWR_MODE  = 3,
>>   };
>>
>> +enum ufs_dev_wb_buf_avail_size {
>> +       UFS_WB_0_PERCENT_BUF_REMAIN = 0x0,
>> +       UFS_WB_10_PERCENT_BUF_REMAIN = 0x1,
>> +       UFS_WB_20_PERCENT_BUF_REMAIN = 0x2,
>> +       UFS_WB_30_PERCENT_BUF_REMAIN = 0x3,
>> +       UFS_WB_40_PERCENT_BUF_REMAIN = 0x4,
>> +       UFS_WB_50_PERCENT_BUF_REMAIN = 0x5,
>> +       UFS_WB_60_PERCENT_BUF_REMAIN = 0x6,
>> +       UFS_WB_70_PERCENT_BUF_REMAIN = 0x7,
>> +       UFS_WB_80_PERCENT_BUF_REMAIN = 0x8,
>> +       UFS_WB_90_PERCENT_BUF_REMAIN = 0x9,
>> +       UFS_WB_100_PERCENT_BUF_REMAIN = 0xA,
>> +};
> Why do need all this?
> Just define the threshold you need.
Ok.

> 
>> +
>> +enum ufs_dev_wb_buf_life_time_est {
>> +       UFS_WB_0_10_PERCENT_USED = 0x1,
>> +       UFS_WB_10_20_PERCENT_USED = 0x2,
>> +       UFS_WB_20_30_PERCENT_USED = 0x3,
>> +       UFS_WB_30_40_PERCENT_USED = 0x4,
>> +       UFS_WB_40_50_PERCENT_USED = 0x5,
>> +       UFS_WB_50_60_PERCENT_USED = 0x6,
>> +       UFS_WB_60_70_PERCENT_USED = 0x7,
>> +       UFS_WB_70_80_PERCENT_USED = 0x8,
>> +       UFS_WB_80_90_PERCENT_USED = 0x9,
>> +       UFS_WB_90_100_PERCENT_USED = 0xA,
>> +       UFS_WB_MAX_USED = 0xB,
>> +};
> Here also.
Ok.
> 
> 
>> +
>> +enum ufs_dev_wb_buf_user_cap_config {
>> +       UFS_WB_BUFF_PRESERVE_USER_SPACE = 1,
>> +       UFS_WB_BUFF_USER_SPACE_RED_EN = 2,
>> +};
>>   /**
>>    * struct utp_cmd_rsp - Response UPIU structure
>>    * @residual_transfer_count: Residual transfer count DW-3
>> @@ -537,6 +592,10 @@ struct ufs_dev_info {
>>          u8 *model;
>>          u16 wspecversion;
>>          u32 clk_gating_wait_us;
>> +       u32 d_ext_ufs_feature_sup;
>> +       u8 b_wb_buffer_type;
>> +       bool wb_config_lun;
>> +       bool keep_vcc_on;
> doc please - proper struct doc this time
I didn't understand this comment. What exactly should I change/add here?
> 
>>   };
>>
>>   /**
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index f4aa10f..4cc1fb4 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -47,6 +47,7 @@
>>   #include "unipro.h"
>>   #include "ufs-sysfs.h"
>>   #include "ufs_bsg.h"
>> +#include <linux/blkdev.h>
>>
>>   #define CREATE_TRACE_POINTS
>>   #include <trace/events/ufs.h>
>> @@ -263,6 +264,13 @@ static int ufshcd_scale_clks(struct ufs_hba *hba,
>> bool scale_up);
>>   static irqreturn_t ufshcd_intr(int irq, void *__hba);
>>   static int ufshcd_change_power_mode(struct ufs_hba *hba,
>>                               struct ufs_pa_layer_attr *pwr_mode);
>> +static bool ufshcd_wb_sup(struct ufs_hba *hba);
>> +static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
>> +static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba);
>> +static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
>> +static bool ufshcd_wb_is_buf_flush_needed(struct ufs_hba *hba);
>> +static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool
>> set);
>> +
>>   static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
>>   {
>>          return tag >= 0 && tag < hba->nutrs;
>> @@ -284,6 +292,38 @@ static inline void ufshcd_disable_irq(struct ufs_hba
>> *hba)
>>          }
>>   }
>>
>> +static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba)
>> +{
>> +       /*
>> +        * Query dAvailableWriteBoosterBufferSize attribute and enable
>> +        * the Write BoosterBuffer Flush if only 30% Write Booster
>> +        * Buffer is available.
>> +        * In reduction case, flush only if 10% is available
>> +        */
>> +       if (ufshcd_wb_is_buf_flush_needed(hba))
>> +               ufshcd_wb_buf_flush_enable(hba);
>> +       else
>> +               ufshcd_wb_buf_flush_disable(hba);
>> +}
> There are voices calling to set flush on hibernate on init, and never touch it again.
> I think you need, both in your commit log, and here as well,
> add a comment explaining why toggling is even needed.
Yes - I heard those voices too :) I'll change this.
> 
>> +
>> +static inline void ufshcd_wb_config(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +
>> +       if (!ufshcd_wb_sup(hba))
>> +               return;
>> +
>> +       ret = ufshcd_wb_ctrl(hba, true);
>> +       if (ret)
>> +               dev_err(hba->dev, "%s: Enable WB failed: %d\n", __func__, ret);
>> +       else
>> +               dev_info(hba->dev, "%s: Write Booster Configured\n", __func__);
>> +       ret = ufshcd_wb_toggle_flush_during_h8(hba, true);
>> +       if (ret)
>> +               dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
>> +                       __func__, ret);
>> +}
>> +
>>   static void ufshcd_scsi_unblock_requests(struct ufs_hba *hba)
>>   {
>>          if (atomic_dec_and_test(&hba->scsi_block_reqs_cnt))
>> @@ -1139,6 +1179,8 @@ static int ufshcd_devfreq_scale(struct ufs_hba
>> *hba, bool scale_up)
>>          }
>>
>>          ret = ufshcd_vops_clk_scale_notify(hba, scale_up, POST_CHANGE);
>> +       /* Enable Write Booster if we have scaled up else disable it */
>> +       ufshcd_wb_ctrl(hba, scale_up);
>>
>>   out:
>>          ufshcd_clock_scaling_unprepare(hba);
>> @@ -4572,6 +4614,37 @@ static int ufshcd_get_lu_wp(struct ufs_hba *hba,
>>          return ret;
>>   }
>>
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
>> +                 (hba->dev_info.b_wb_buffer_type
>> +                  || hba->dev_info.wb_config_lun));
>> +}
>> +
>> +static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
>> +{
>> +       int ret;
>> +       enum query_opcode opcode;
>> +
>> +       if (!ufshcd_wb_sup(hba))
>> +               return 0;
>> +
>> +       if (enable)
>> +               opcode = UPIU_QUERY_OPCODE_SET_FLAG;
>> +       else
>> +               opcode = UPIU_QUERY_OPCODE_CLEAR_FLAG;
> If already wb_enabled is enabled/disabled no point to send the query request
True. I'll add a check before sending the query request.

> 
>> +
>> +       ret = ufshcd_query_flag_retry(hba, opcode,
>> +                                     QUERY_FLAG_IDN_WB_EN, NULL);
> If we are in a non-shared-buffer mode - you need to send the flag to the applicable lun.
> WB introduces the first not-device-level flags.
> Need to adjust ufshcd_query_flag for it - in a preparatory patch...
Ok. This current patch didn't support dedicated buffer mode. It 
supported only shared-buffer mode. I'll add a comment clarifying that.
I'll add the dedicated buffer mode support at a later stage, not with 
this series.

> 
> Same goes to the rest of your code that query flags and attributes
> 
Explained in the comment above.
>> +       if (ret) {
>> +               dev_err(hba->dev, "%s write booster %s failed %d\n",
>> +                       __func__, enable ? "enable" : "disable", ret);
>> +               return ret;
>> +       }
>> +
>> +       hba->wb_enabled = enable;
>> +       dev_dbg(hba->dev, "%s write booster %s %d\n",
>> +                       __func__, enable ? "enable" : "disable", ret);
>> +
>> +       return ret;
>> +}
>> +
>> +static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
>> +{
>> +       int val;
>> +
>> +       if (set)
>> +               val =  UPIU_QUERY_OPCODE_SET_FLAG;
>> +       else
>> +               val = UPIU_QUERY_OPCODE_CLEAR_FLAG;
>> +
>> +       return ufshcd_query_flag_retry(hba, val,
>> +                              QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8,
>> +                                      NULL);
>> +}
>> +
>> +static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +
>> +       if (!ufshcd_wb_sup(hba) || hba->wb_buf_flush_enabled)
>> +               return 0;
>> +
>> +       ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_SET_FLAG,
>> +                                     QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
>> +       if (ret)
>> +               dev_err(hba->dev, "%s WB - buf flush enable failed %d\n",
>> +                       __func__, ret);
>> +       else
>> +               hba->wb_buf_flush_enabled = true;
>> +
>> +       dev_dbg(hba->dev, "WB - Flush enabled: %d\n", ret);
>> +       return ret;
>> +}
>> +
>> +static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
>> +{
>> +       int ret;
>> +
>> +       if (!ufshcd_wb_sup(hba) || !hba->wb_buf_flush_enabled)
>> +               return 0;
>> +
>> +       ret = ufshcd_query_flag_retry(hba,
>> UPIU_QUERY_OPCODE_CLEAR_FLAG,
>> +                                     QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
>> +       if (ret) {
>> +               dev_warn(hba->dev, "%s: WB - buf flush disable failed %d\n",
>> +                       __func__, ret);
>> +       } else {
>> +               hba->wb_buf_flush_enabled = false;
>> +               dev_dbg(hba->dev, "WB - Flush disabled: %d\n", ret);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
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
> Not sure I understand how flush is related to the reduced/non-reduced buffer config?
Its not. Current code distinguishes both the buffer configs to check for 
current_buffer capacity (dCurrentWriteBoosterBufferSize).
In case of user-space reduction config, there's no need to check the 
current buffer capacity.
> 
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
> Responding to urgent flush exception event, should you decide to add it,
> Should be done as part of ufshcd_exception_event_handler, and not here.
> 
This code checks for the exception status because its being invoked from 
suspend. I think its a good practice to proactively check for the ee 
status here and keep the vcc on if the device needs it.

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
>> +                   (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)) {
>> +                       hba->dev_info.keep_vcc_on = true;
>> +                       return true;
>> +               }
>> +       }
>> +       return false;
> This function follow some wired logic, that needs to be further explained
> 
This is what it tries to achieve:
Invoked from suspend:
  Check the avail_buf status:
	If preserve_user_space enabled:
		Check for current_buf status:
	If cur_buf == 0:
		Return - No point enabling flush, since it can't flush
	Check if there's a bkops exception || if the avail_buf < 40%:
		keep_vcc_on = true
This is to achieve the delicate balance between power and performance.

>> +}
>> +
>>   /**
>>    * ufshcd_exception_event_handler - handle exceptions raised by device
>>    * @work: pointer to work data
>> @@ -6629,7 +6861,8 @@ static int ufs_get_device_desc(struct ufs_hba
>> *hba)
>>          int err;
>>          size_t buff_len;
>>          u8 model_index;
>> -       u8 *desc_buf;
>> +       u8 *desc_buf, wb_buf[4];
>> +       u32 lun, res;
>>          struct ufs_dev_info *dev_info = &hba->dev_info;
>>
>>          buff_len = max_t(size_t, hba->desc_size.dev_desc,
>> @@ -6660,6 +6893,40 @@ static int ufs_get_device_desc(struct ufs_hba
>> *hba)
>>                                        desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
>>
>>          model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
>> +       /* Enable WB only for UFS-3.1 OR if desc len >= 0x59 */
>> +       if (dev_info->wspecversion >= 0x310) {
>> +               hba->dev_info.d_ext_ufs_feature_sup =
>> +                       desc_buf[DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP]
>> +                                                               << 24 |
>> +                       desc_buf[DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 1]
>> +                                                               << 16 |
>> +                       desc_buf[DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 2]
>> +                                                               << 8 |
>> +                       desc_buf[DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 3];
>> +
>> +               hba->dev_info.b_wb_buffer_type =
>> +                       desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
>> +
>> +               if (hba->dev_info.b_wb_buffer_type)
>> +                       goto skip_unit_desc;
> Comment please, e.g.:
> /* bWriteBoosterBufferType indicates that the WB buffer is configured as a shared buffer mode */
> And instead the goto pack iterating the unit descriptors in a helper?Sure. I'll try and rework and reword this.

> 
>> +
>> +               hba->dev_info.wb_config_lun = false;
>> +               for (lun = 0; lun < UFS_UPIU_MAX_GENERAL_LUN; lun++) {
>> +                       memset(wb_buf, 0, sizeof(wb_buf));
>> +                       err = ufshcd_get_wb_alloc_units(hba, lun, wb_buf);
>> +                       if (err)
>> +                               break;
>> +
>> +                       res = wb_buf[0] << 24 | wb_buf[1] << 16 |
>> +                               wb_buf[2] << 8 | wb_buf[3];
>> +                       if (res) {
>> +                               hba->dev_info.wb_config_lun = true;
>> +                               break;
> Maybe you want to be aware which luns has a WB buffer, and of its WB buffer size.
> And as the clock scaling mechanism is unware of which writes goes to which lun,
> Explain that as well.
> 
This series doesn't support per lun WB buffer configuration.
But yes, I can explain that here.

>> +                       }
>> +               }
>> +       }
>> +
>> +skip_unit_desc:
>>          err = ufshcd_read_string_desc(hba, model_index,
>>                                        &dev_info->model, SD_ASCII_STD);
>>          if (err < 0) {
>> @@ -7162,6 +7429,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba,
>> bool async)
>>
>>          /* set the state as operational after switching to desired gear */
>>          hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
>> +       ufshcd_wb_config(hba);
> Enabling WB regardless of clock scaling on init?
> Why not just ufshcd_wb_toggle_flush_during_h8()
I'll look into this. Thanks!

> 
>>
>>          /* Enable Auto-Hibernate if configured */
>>          ufshcd_auto_hibern8_enable(hba);
>> @@ -7823,12 +8091,16 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba
>> *hba)
>>           *
>>           * Ignore the error returned by ufshcd_toggle_vreg() as device is anyway
>>           * in low power state which would save some power.
>> +        *
>> +        * If Write Booster is enabled and the device needs to flush the WB
>> +        * buffer OR if bkops status is urgent for WB, keep Vcc on.
> I am not sure that you want to entail WB and bkops together in the same patch.
> If you are changing the logic of this function with respect of bkops -
> Do that In a separate patch, not related to WB.
> 
I think it's kinda related, with WB some of the device's bkops would be 
related to WB as well. Can you please confirm to me if that's not the case.
I was told that's the case though.

>>           */
>>          if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
>>              !hba->dev_info.is_lu_power_on_wp) {
>>                  ufshcd_setup_vreg(hba, false);
>>          } else if (!ufshcd_is_ufs_dev_active(hba)) {
>> -               ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
>> +               if (!hba->dev_info.keep_vcc_on)
>> +                       ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
>>                  if (!ufshcd_is_link_active(hba)) {
>>                          ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
>>                          ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
>> @@ -7952,11 +8224,16 @@ static int ufshcd_suspend(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>                          /* make sure that auto bkops is disabled */
>>                          ufshcd_disable_auto_bkops(hba);
>>                  }
>> +               ufshcd_wb_toggle_flush(hba);
>> +       } else if (!ufshcd_is_runtime_pm(pm_op)) {
>> +               ufshcd_wb_buf_flush_disable(hba);
>> +               hba->dev_info.keep_vcc_on = false;
>>          }
>>
>>          if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
>> -            ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
>> -              !ufshcd_is_runtime_pm(pm_op))) {
>> +           ((ufshcd_is_runtime_pm(pm_op) && (!hba->auto_bkops_enabled)
>> +             && !hba->wb_buf_flush_enabled) ||
>> +            !ufshcd_is_runtime_pm(pm_op))) {
>>                  /* ensure that bkops is disabled */
>>                  ufshcd_disable_auto_bkops(hba);
>>                  ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
>> @@ -8078,6 +8355,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>                          goto vendor_suspend;
>>          }
>>
>> +       ufshcd_wb_buf_flush_disable(hba);
>>          if (!ufshcd_is_ufs_dev_active(hba)) {
>>                  ret = ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE);
>>                  if (ret)
>> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> index 8f516b2..6f36ff3 100644
>> --- a/drivers/scsi/ufs/ufshcd.h
>> +++ b/drivers/scsi/ufs/ufshcd.h
>> @@ -327,6 +327,7 @@ struct ufs_hba_variant_ops {
>>          void    (*dbg_register_dump)(struct ufs_hba *hba);
>>          int     (*phy_initialization)(struct ufs_hba *);
>>          void    (*device_reset)(struct ufs_hba *hba);
>> +       u32     (*get_user_cap_mode)(struct ufs_hba *hba);
> Make the name indicate that this is WB related?
> 
Ok.
>>   };
>>
>>   /* clock gating state  */
>> @@ -731,6 +732,8 @@ struct ufs_hba {
>>
>>          struct device           bsg_dev;
>>          struct request_queue    *bsg_queue;
>> +       bool wb_buf_flush_enabled;
>> +       bool wb_enabled;
>>   };
>>
>>   /* Returns true if clocks can be gated. Otherwise false */
>> @@ -1123,4 +1126,10 @@ static inline u8 ufshcd_scsi_to_upiu_lun(unsigned
>> int scsi_lun)
>>   int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
>>                       const char *prefix);
>>
>> +static inline unsigned int ufshcd_vops_get_user_cap_mode(struct ufs_hba
>> *hba)
>> +{
>> +       if (hba->vops && hba->vops->get_user_cap_mode)
>> +               return hba->vops->get_user_cap_mode(hba);
>> +       return 0;
>> +}
>>   #endif /* End of Header */
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
>> Linux Foundation Collaborative Project.
> 
> 
> Thanks,
> Avri
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
