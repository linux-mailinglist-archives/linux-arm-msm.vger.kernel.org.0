Return-Path: <linux-arm-msm+bounces-47545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D97A3082F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 122321886276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E144B1F3D43;
	Tue, 11 Feb 2025 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oZ94Bng3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280921E4106;
	Tue, 11 Feb 2025 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268883; cv=none; b=OAO0oCUB+o6mtFovi0YLHysnumpCh8k/NBHxVbn1KpapNvSbGHA793hdz/Q27BUoBraEPdGRtIAyr3Bs9OTaJRGOmbYWL6nA6TvLVol8vbwTeIHUf8ewj0E3lCpynEIASUaysSc8g5Xr51u6GFE+f254zxTyQewlZuI8TSrlzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268883; c=relaxed/simple;
	bh=FdlKOc8KBQzo2vzoUlO3ARAx1VI01bXrJQ9aJ5HAfVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FTsI/UMgFXwdLD/RE/T8AbVx6YUCFK7t3M7RoIu7JForOmC4nyVmN30a1ZTlFxOANhLloSYl2rdgkSg5EaYUlkPjSEiEKs//xOMNoPGwFVrMgAf4kokHn0XE/cACIJbgu9eSkNr1JX/Bk7PSFa9/V2LQPUlRZTrxiW0yrHtCtlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oZ94Bng3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B8vDth001448;
	Tue, 11 Feb 2025 10:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvearNOGES36ne3L//usoK4/zvPHiBAzHvBkYWI1NSE=; b=oZ94Bng387yK7UzO
	4x5sAat/VWCliV7aLFvq8/ywV8Cb+Bu73pxzTIHW2HYGIyApOT4e7tDY44INj3ax
	K346rxry25lLdgA6MtXfhMpcy1tMd+lv8aaKSfwuyDGMH59lngcCJLsBdH6wjnn8
	y5CILiReIZ9hrQs1/+vyXEkmcpBzU3bP2G0aHY891W7RtrV7tPdQXW4VyTrTL+qw
	CylVJvdTYs17PuscYBTf/wxAcxjzwyqVxuIGVab+Yj+5IGJQHga4ffU53tpjo0nf
	xGeCGae31ipSAi2qjcgGLLsR6wKmUwtMCj0n0+yiqDA0S6blqWqV55ZSL36ioieM
	2oiG6Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxkj8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:14:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BAENPo015150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:14:23 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 02:14:16 -0800
Message-ID: <c20ff2ea-5546-4e4a-b813-f5736696b042@quicinc.com>
Date: Tue, 11 Feb 2025 18:14:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
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
CC: "ebiggers@google.com" <ebiggers@google.com>,
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
        "minwoo.im@samsung.com"
	<minwoo.im@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
 <20250210100212.855127-4-quic_ziqichen@quicinc.com>
 <cb88b16e4207c649da8eba66f976c5039df7c77c.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <cb88b16e4207c649da8eba66f976c5039df7c77c.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LN0kZQBdk9jqH1K5WUf7gOy93Bp8v9NC
X-Proofpoint-ORIG-GUID: LN0kZQBdk9jqH1K5WUf7gOy93Bp8v9NC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110064



On 2/11/2025 2:02 PM, Peter Wang (王信友) wrote:
> On Mon, 2025-02-10 at 18:02 +0800, Ziqi Chen wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> From: Can Guo <quic_cang@quicinc.com>
>>
>> Add a vop to map UFS host controller clock frequencies to the
>> corresponding
>> maximum supported UFS high speed gear speeds. During clock scaling,
>> we can
>> map the target clock frequency, demanded by devfreq, to the maximum
>> supported gear speed, so that devfreq can scale the gear to the
>> highest
>> gear speed supported at the target clock frequency, instead of just
>> scaling
>> up/down the gear between the min and max gear speeds.
>>
>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Reviewed-by: Bean Huo <beanhuo@micron.com>
>> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> v2 ->v3:
>> 1. Remove the parameter 'gear' and use it as function return result.
>> 2. Change "vops" into "vop" in commit message.
>> ---
>>   drivers/ufs/core/ufshcd-priv.h | 8 ++++++++
>>   include/ufs/ufshcd.h           | 2 ++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/ufs/core/ufshcd-priv.h
>> b/drivers/ufs/core/ufshcd-priv.h
>> index 0549b65f71ed..4da3e65c6735 100644
>> --- a/drivers/ufs/core/ufshcd-priv.h
>> +++ b/drivers/ufs/core/ufshcd-priv.h
>> @@ -277,6 +277,14 @@ static inline int
>> ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
>>          return -EOPNOTSUPP;
>>   }
>>
>> +static inline int ufshcd_vops_freq_to_gear_speed(struct ufs_hba
> 
> Hi Ziqi,
> 
> Gear speed type in struct ufs_pa_layer_attr is u32.
> I think it would be better to unify the type here.
> 
> 
Hi Peter,

I changed the type of new_gear since V3 sue to I use it as return result 
of vop ufshcd_vops_freq_to_gear_speed(). I think you already find the 
reason in patch 4/8 and 5/8. I think your suggestion in patch 5/8 is 
make sense. Let me discuss more with you in the patch 5/8.

-Ziqi

> 
>> *hba, unsigned long freq)
>> +{
>> +       if (hba->vops && hba->vops->freq_to_gear_speed)
>> +               return hba->vops->freq_to_gear_speed(hba, freq);
>> +
>> +       return -EOPNOTSUPP;
>> +}
>> +
>>   extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
>>
>>   /**
>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>> index f51d425696e7..cdb853f5b871 100644
>> --- a/include/ufs/ufshcd.h
>> +++ b/include/ufs/ufshcd.h
>> @@ -336,6 +336,7 @@ struct ufs_pwr_mode_info {
>>    * @get_outstanding_cqs: called to get outstanding completion queues
>>    * @config_esi: called to config Event Specific Interrupt
>>    * @config_scsi_dev: called to configure SCSI device parameters
>> + * @freq_to_gear_speed: called to map clock frequency to the max
>> supported gear speed
>>    */
>>   struct ufs_hba_variant_ops {
>>          const char *name;
>> @@ -387,6 +388,7 @@ struct ufs_hba_variant_ops {
>>                                         unsigned long *ocqs);
>>          int     (*config_esi)(struct ufs_hba *hba);
>>          void    (*config_scsi_dev)(struct scsi_device *sdev);
>> +       int (*freq_to_gear_speed)(struct ufs_hba *hba, unsigned long
>> freq);
>>
> 
> Please keep the indentation consistent too.
> 
> Thanks
> Peter
> 
>>   };
>>
>>   /* clock gating state  */
>> --
>> 2.34.1
>>
> 


