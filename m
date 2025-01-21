Return-Path: <linux-arm-msm+bounces-45639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCBA17664
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 04:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18521188A224
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 03:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60723187FE4;
	Tue, 21 Jan 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GhJYkQPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B6E3208;
	Tue, 21 Jan 2025 03:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737431565; cv=none; b=W8lUkhXx9knXBxG0b1+mqhnNyjDUVRBj6OFQUhcqxfj+SGBO212RZhjVk/EbCwlUqdzElUMUcW7UNlEXQxEkN8XrqvZmynKRCbcayftyke5hpp/4Zwwqaq9HIiUUi5ahAuwQ34cKktYjIehuEwnU6jSQ6Ap3Q9h0jCzH1u9Hvsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737431565; c=relaxed/simple;
	bh=+5nUY/JbFzFgYWr/vn6xkRGP6OJDy0qJlNi0RS1frb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nerOdXxJTK/6Z4uijt+Fc7b+3AB07UVbXKNH4jn+80oXMBEEhnQ2y4np3idn9JniXBKm4o8pQr60p2MIZJqFptKwwKd7UndCTcnQdPL9AKXuePfyodFAfX6udYNZdt/n/hMrmhael5CeqP1LiFH9wIzL/Ixr/v5266Ep6QOU7N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GhJYkQPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1I3ZW005732;
	Tue, 21 Jan 2025 03:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtBR99MBLhok1xtKpZwdG/Nnn2ri5zlgdcDeVxpIjdI=; b=GhJYkQPAlRGaxRC5
	na1ZwW+B0sx79M4uN+tGUk79B7komvABafrkKarg++hmOi6oMQ3almew9X8RCxTo
	hIq9ftMt2E5vt4ucNZi5y9mqTbKt/KDnmejhXNT6PTmPlnv0+7CWQBjxLzrOPCsj
	5aDN8lrzqzTn4RAChOmb3UHiPjVgFFhUHb3Nmx2NsdxIT6jnpA4hL+h35b0LCPJ/
	ghJWLmN7jAJjnAbwdeGTfsSmGKGnrT42VCAzxDTrGzFqSioYSnsf5M9CPvggXp3P
	7VCfV5W9sCddz4vvL9H2s2WwqVnJP45WGLeYEIzuNPDPg7Qa+mgP2R60e1jGaDxq
	243X1w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a1sur94t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 03:52:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L3q778032374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 03:52:07 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 19:52:01 -0800
Message-ID: <8071cdff-05dd-4109-9d61-235d83e3a3f6@quicinc.com>
Date: Tue, 21 Jan 2025 11:51:58 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vops
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Manivannan Sadhasivam <mani@kernel.org>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <linux-scsi@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Peter Wang
	<peter.wang@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        "Eric
 Biggers" <ebiggers@google.com>,
        Minwoo Im <minwoo.im@samsung.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
        "open
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
 <20250116091150.1167739-2-quic_ziqichen@quicinc.com>
 <20250119071131.4hepn6msmh76npi7@thinkpad>
 <57d52f72-31ec-46cf-b632-74b09e29f501@quicinc.com>
 <20250120153602.wij4vbodjzi24aok@thinkpad>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <20250120153602.wij4vbodjzi24aok@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G0No91hZsa8RmICa5OeDiMcqFi-cHxty
X-Proofpoint-GUID: G0No91hZsa8RmICa5OeDiMcqFi-cHxty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210029



On 1/20/2025 11:36 PM, Manivannan Sadhasivam wrote:
> On Mon, Jan 20, 2025 at 08:01:03PM +0800, Ziqi Chen wrote:
>> Hi Mani,
>>
>> Thanks for you review~
>>
>> On 1/19/2025 3:11 PM, Manivannan Sadhasivam wrote:
>>> On Thu, Jan 16, 2025 at 05:11:42PM +0800, Ziqi Chen wrote:
>>>> From: Can Guo <quic_cang@quicinc.com>
>>>>
>>>> If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
>>>> two freqs,
>>>
>>> 'amongst more than two freqs': I couldn't parse this.
>>>
>>
>> It means that the devfreq framework will tell UFS core driver the devfreq
>> freq, then UFS core driver will find the recommended freq from our freq
>> table based on the devfreq freq. For legacy mode , we can only have 2
>> frequencies in the table. But if the OPP V2 is used, we can have 3 , 4 or
>> more freq tables. You can refer to my PATCH 8/8.
>>
> 
> I got the motive, but the wording is not correct.
> 

OK , let me express it in another way:
"Instead of only two frequencies, If OPP V2 is used, the UFS devfreq 
clock scaling may scale the clock among multiple frequencies."
How about this?

>>>> so just passing up/down to vops clk_scale_notify() is not enough
>>>> to cover the intermediate clock freqs between the min and max freqs. Hence
>>>> pass the target_freq to clk_scale_notify() to allow the vops to perform
>>>> corresponding configurations with regard to the clock freqs.
>>>>
>>>
>>> Add a note that the 'target_freq' is not used in this commit.
>>>
>>
>> Sorry, I don't very understand this comment, I mentioned the "target_freq"
>> in the commit message,  Could you let me know what note you want me do add?
>>
> 
> This patch is introducing 'target_freq' as a parameter, but it is not used. I
> was asking you to mention that it will be used in successive commits.
> 

OK , thank you, I will add this note in next version.

-Ziqi

>>>> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>>
>>> Signed-off-by tag order is not correct here. This implies that Ziqi originally
>>> worked on it, then Can took over and submitted. But it seems the reverse.
>>
>> Thanks for your reminder. Is below tag order OK ?
>>      Signed-off-by: Can Guo <quic_cang@quicinc.com>
>>      Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>      Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>>
>>> - Mani
>>
>> -Ziqi
>>
>>>
>>>> ---
>>>>    drivers/ufs/core/ufshcd-priv.h  | 7 ++++---
>>>>    drivers/ufs/core/ufshcd.c       | 4 ++--
>>>>    drivers/ufs/host/ufs-mediatek.c | 1 +
>>>>    drivers/ufs/host/ufs-qcom.c     | 5 +++--
>>>>    include/ufs/ufshcd.h            | 2 +-
>>>>    5 files changed, 11 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
>>>> index 9ffd94ddf8c7..0549b65f71ed 100644
>>>> --- a/drivers/ufs/core/ufshcd-priv.h
>>>> +++ b/drivers/ufs/core/ufshcd-priv.h
>>>> @@ -117,11 +117,12 @@ static inline u32 ufshcd_vops_get_ufs_hci_version(struct ufs_hba *hba)
>>>>    	return ufshcd_readl(hba, REG_UFS_VERSION);
>>>>    }
>>>> -static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
>>>> -			bool up, enum ufs_notify_change_status status)
>>>> +static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba, bool up,
>>>> +					       unsigned long target_freq,
>>>> +					       enum ufs_notify_change_status status)
>>>>    {
>>>>    	if (hba->vops && hba->vops->clk_scale_notify)
>>>> -		return hba->vops->clk_scale_notify(hba, up, status);
>>>> +		return hba->vops->clk_scale_notify(hba, up, target_freq, status);
>>>>    	return 0;
>>>>    }
>>>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>>>> index acc3607bbd9c..8d295cc827cc 100644
>>>> --- a/drivers/ufs/core/ufshcd.c
>>>> +++ b/drivers/ufs/core/ufshcd.c
>>>> @@ -1157,7 +1157,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
>>>>    	int ret = 0;
>>>>    	ktime_t start = ktime_get();
>>>> -	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, PRE_CHANGE);
>>>> +	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, PRE_CHANGE);
>>>>    	if (ret)
>>>>    		goto out;
>>>> @@ -1168,7 +1168,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
>>>>    	if (ret)
>>>>    		goto out;
>>>> -	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, POST_CHANGE);
>>>> +	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, POST_CHANGE);
>>>>    	if (ret) {
>>>>    		if (hba->use_pm_opp)
>>>>    			ufshcd_opp_set_rate(hba,
>>>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
>>>> index 135cd78109e2..977dd0caaef6 100644
>>>> --- a/drivers/ufs/host/ufs-mediatek.c
>>>> +++ b/drivers/ufs/host/ufs-mediatek.c
>>>> @@ -1643,6 +1643,7 @@ static void ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
>>>>    }
>>>>    static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>>>> +				    unsigned long target_freq,
>>>>    				    enum ufs_notify_change_status status)
>>>>    {
>>>>    	if (!ufshcd_is_clkscaling_supported(hba))
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 68040b2ab5f8..b6eef975dc46 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -1333,8 +1333,9 @@ static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
>>>>    	return ufs_qcom_set_core_clk_ctrl(hba, false);
>>>>    }
>>>> -static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
>>>> -		bool scale_up, enum ufs_notify_change_status status)
>>>> +static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>>>> +				     unsigned long target_freq,
>>>> +				     enum ufs_notify_change_status status)
>>>>    {
>>>>    	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>>>    	int err;
>>>> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
>>>> index d7aca9e61684..a4dac897a169 100644
>>>> --- a/include/ufs/ufshcd.h
>>>> +++ b/include/ufs/ufshcd.h
>>>> @@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
>>>>    	void    (*exit)(struct ufs_hba *);
>>>>    	u32	(*get_ufs_hci_version)(struct ufs_hba *);
>>>>    	int	(*set_dma_mask)(struct ufs_hba *);
>>>> -	int	(*clk_scale_notify)(struct ufs_hba *, bool,
>>>> +	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
>>>>    				    enum ufs_notify_change_status);
>>>>    	int	(*setup_clocks)(struct ufs_hba *, bool,
>>>>    				enum ufs_notify_change_status);
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

