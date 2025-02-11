Return-Path: <linux-arm-msm+bounces-47547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24C6A3087D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460B516528B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567D81F4182;
	Tue, 11 Feb 2025 10:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EiwYPo/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ED11F37BC;
	Tue, 11 Feb 2025 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269737; cv=none; b=hbvQ50yE/T/4Od1WiNbX93/cWENREI4ED0+QPsoPA3Qua0DWhhNFsM+if9KjNHp9BN8HHDTXQzNfSp/WWjD8okGYVHUhRLcDbYUta8vlAOo1M0g+qDbc5PgeGJqpRclBneoM0faAr0aqerNsP8tzaMw/DY2FWiNjDa0ajStxTT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269737; c=relaxed/simple;
	bh=ynQunNA9DkLEka57Mai3bSUDNP+xpo2IOYyyr3pLzcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=inLlX4fI4k2OuZHPCS8gn7XBsBESKWn4XzQnqtwgj0YF4L1c3LTy51HXnET4w9QiUvE8yU+I1SInkKABqRNpZToeN/mxR1mwSPOmP8bP5DHEraqvjNydIHmM6QQ30zX4U5WdBqZ7SoIOfvnkbPJMYjR0WUW8NztlLo40KgnDCOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EiwYPo/I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8wcqK008240;
	Tue, 11 Feb 2025 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WBZsc18HSHh6XL1jDUTlDZh3I+PuQToecs7ziSZm5Y=; b=EiwYPo/Izi0HnIIv
	ydtu9V/d150ExyLZXOMNMOGx9IaGcXJgxdg7dppnVJTcNNaIv4mHWnR/RT9UJ4Ab
	OFNfE0FCH8fEbyQ01zoSnSoKy2NlbhgsHbsQrt7+QJzs4Y1I+u81tejCzi65g1LZ
	GPwUOMgtI1u7UFWaWeD8ETEvtad01Vf26PH3gXGn0QG7Pq9abkcQs3RMAQCCjR7L
	A1Hnax4UD5EVXFSNWDLe8jtNVYXXpzN9wn69nzd2m2pS5Q4N1OQFZimgKP2k8rPD
	wNp5UA75Iy9urCmSaS5HXBnhqan2ghBN7x+rcVOTJsingWIDK9aenDSqmoqpVTMK
	VgQ2VA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh3mn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:28:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BASGpK022686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:28:16 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 02:28:12 -0800
Message-ID: <59bf7be9-47bf-43f3-bc45-1af69b05ea91@quicinc.com>
Date: Tue, 11 Feb 2025 18:28:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "quic_rampraka@quicinc.com"
	<quic_rampraka@quicinc.com>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "mani@kernel.org" <mani@kernel.org>,
        "martin.petersen@oracle.com"
	<martin.petersen@oracle.com>
CC: "ahalaney@redhat.com" <ahalaney@redhat.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "alim.akhtar@samsung.com"
	<alim.akhtar@samsung.com>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
 <20250210100212.855127-6-quic_ziqichen@quicinc.com>
 <5c2ae6c27ef0679d6664a759959ae604e560f60a.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <5c2ae6c27ef0679d6664a759959ae604e560f60a.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Aa3z4lOIMtEMPr8Gl3XsdjhiO8I6v7fQ
X-Proofpoint-GUID: Aa3z4lOIMtEMPr8Gl3XsdjhiO8I6v7fQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110065



On 2/11/2025 5:28 PM, Peter Wang (王信友) wrote:
> On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> With OPP V2 enabled, devfreq can scale clocks amongst multiple
>> frequency
>> plans. However, the gear speed is only toggled between min and max
>> during
>> clock scaling. Enable multi-level gear scaling by mapping clock
>> frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can
>> put
>> the UFS link at the appropriate gear speeds accordingly.
>>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>
>> v1 -> v2:
>> Rename the lable "do_pmc" to "config_pwr_mode".
>>
>> v2 -> v3:
>> Use assignment instead memcpy() in function ufshcd_scale_gear().
>>
>> v3 -> v4:
>> Typo fixed for commit message.
>> ---
>>   drivers/ufs/core/ufshcd.c | 51 +++++++++++++++++++++++++++++++------
>> --
>>   1 file changed, 41 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 8d295cc827cc..ebab897080a6 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -1308,16 +1308,26 @@ static int
>> ufshcd_wait_for_doorbell_clr(struct ufs_hba *hba,
>>   /**
>>    * ufshcd_scale_gear - scale up/down UFS gear
>>    * @hba: per adapter instance
>> + * @target_gear: target gear to scale to
>>    * @scale_up: True for scaling up gear and false for scaling down
>>    *
>>    * Return: 0 for success; -EBUSY if scaling can't happen at this
>> time;
>>    * non-zero for any other errors.
>>    */
>> -static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
>> +static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear,
>> bool scale_up)
>>   {
>>          int ret = 0;
>>          struct ufs_pa_layer_attr new_pwr_info;
>>
>> +       if (target_gear) {
>> +               new_pwr_info = hba->pwr_info;
>> +               new_pwr_info.gear_tx = target_gear;
>> +               new_pwr_info.gear_rx = target_gear;
>> +
>> +               goto config_pwr_mode;
>> +       }
>> +
>> +       /* Legacy gear scaling, in case vops_freq_to_gear_speed() is
>> not implemented */
>>          if (scale_up) {
>>                  memcpy(&new_pwr_info, &hba-
>>> clk_scaling.saved_pwr_info,
>>                         sizeof(struct ufs_pa_layer_attr));
>> @@ -1338,6 +1348,7 @@ static int ufshcd_scale_gear(struct ufs_hba
>> *hba, bool scale_up)
>>                  }
>>          }
>>
>> +config_pwr_mode:
>>          /* check if the power mode needs to be changed or not? */
>>          ret = ufshcd_config_pwr_mode(hba, &new_pwr_info);
>>          if (ret)
>> @@ -1408,15 +1419,26 @@ static void
>> ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool sc
>>   static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long
>> freq,
>>                                  bool scale_up)
>>   {
>> +       u32 old_gear = hba->pwr_info.gear_rx;
>> +       int new_gear = 0;
>>          int ret = 0;
>>
>> +       new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
>> +       if (new_gear < 0)
>> +               /*
>> +                * return negative value means that the
>> vops_freq_to_gear_speed() is not
>> +                * implemented or didn't find matched gear speed,
>> assign '0' to new_gear
>> +                * to switch to legacy gear scaling sequence in
>> ufshcd_scale_gear().
>> +                */
>> +               new_gear = 0;
>> +
>>
> 
> Hi Ziqi,
> 
> I think remove help function is better.
> No need change new_gear type when use.
> The readability is higher, and no need add that large amount comments.
> 
>         u32_new_gear = 0;
>         if (hba->vops && hba->vops->freq_to_gear_speed)
>                 new_gear = hba->vops->freq_to_gear_speed(hba, freq);
> 
> 
> Thanks.
> Peter
> 
> 
Hi Peter,

Thanks, Peter.
Frankly, I also think this way has low readability. However, keep the 
u32 type for new_gear is OK to me. But this vop would lose the ability 
to indicate the error types. All types of error can only return "0".

However, we don't need to deal with various types of errors up to now, I 
can submit a new version to change back the new_gear and vop return 
value type to u32 and make correspondingly change in patch 3/8 and 4/8.

-Ziqi

> 
>>          ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
>>          if (ret)
>>                  return ret;
>>
>>          /* scale down the gear before scaling down clocks */
>>          if (!scale_up) {
>> -               ret = ufshcd_scale_gear(hba, false);
>> +               ret = ufshcd_scale_gear(hba, (u32)new_gear, false);
>>                  if (ret)
>>                          goto out_unprepare;
>>          }
>> @@ -1424,13 +1446,13 @@ static int ufshcd_devfreq_scale(struct
>> ufs_hba *hba, unsigned long freq,
>>          ret = ufshcd_scale_clks(hba, freq, scale_up);
>>          if (ret) {
>>                  if (!scale_up)
>> -                       ufshcd_scale_gear(hba, true);
>> +                       ufshcd_scale_gear(hba, old_gear, true);
>>                  goto out_unprepare;
>>          }
>>
>>          /* scale up the gear after scaling up clocks */
>>          if (scale_up) {
>> -               ret = ufshcd_scale_gear(hba, true);
>> +               ret = ufshcd_scale_gear(hba, (u32)new_gear, true);
>>                  if (ret) {
>>                          ufshcd_scale_clks(hba, hba->devfreq-
>>> previous_freq,
>>                                            false);
>> @@ -1723,6 +1745,8 @@ static ssize_t
>> ufshcd_clkscale_enable_store(struct device *dev,
>>                  struct device_attribute *attr, const char *buf,
>> size_t count)
>>   {
>>          struct ufs_hba *hba = dev_get_drvdata(dev);
>> +       struct ufs_clk_info *clki;
>> +       unsigned long freq;
>>          u32 value;
>>          int err = 0;
>>
>> @@ -1746,14 +1770,21 @@ static ssize_t
>> ufshcd_clkscale_enable_store(struct device *dev,
>>
>>          if (value) {
>>                  ufshcd_resume_clkscaling(hba);
>> -       } else {
>> -               ufshcd_suspend_clkscaling(hba);
>> -               err = ufshcd_devfreq_scale(hba, ULONG_MAX, true);
>> -               if (err)
>> -                       dev_err(hba->dev, "%s: failed to scale clocks
>> up %d\n",
>> -                                       __func__, err);
>> +               goto out_rel;
>>          }
>>
>> +       clki = list_first_entry(&hba->clk_list_head, struct
>> ufs_clk_info, list);
>> +       freq = clki->max_freq;
>> +
>> +       ufshcd_suspend_clkscaling(hba);
>> +       err = ufshcd_devfreq_scale(hba, freq, true);
>> +       if (err)
>> +               dev_err(hba->dev, "%s: failed to scale clocks up
>> %d\n",
>> +                               __func__, err);
>> +       else
>> +               hba->clk_scaling.target_freq = freq;
>> +
>> +out_rel:
>>          ufshcd_release(hba);
>>          ufshcd_rpm_put_sync(hba);
>>   out:
>> --
>> 2.34.1
>>
> 


