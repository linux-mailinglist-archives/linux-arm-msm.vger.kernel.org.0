Return-Path: <linux-arm-msm+bounces-42388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9319F3AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 21:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA86C188B14C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 20:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B111D358F;
	Mon, 16 Dec 2024 20:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rd4H69LO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E421D319B;
	Mon, 16 Dec 2024 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380933; cv=none; b=kMJT7aKBGEG0UnsuEH1rgyZsW5UMcve0LfJEro1TPfNN4lWW4LnXuwrKyWXwY+GVK5vOcJvXrWnPKz3l4QvDl6ofSyJ/LkcUDbQyTOBRPcl3fdjHujksKnNkf/HaUdEIlYkqar/orTTNv11IGLdRl2NNp1dVEcQhfTtGEi7gc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380933; c=relaxed/simple;
	bh=FotWk8yGNMrvtS9pnVO0+PaVtk3d/q6uE2rfZs0ZbqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=K1QsBaSJxpXsfZaBNVnms8bkQVADZl7mcbJbv05Lmgp308E+RwSylt1DgTTEen+VcUnUESPW0BeLgwW1LLFilGEnMxfijk4Fx5MjDfaTf4dJcKWRk5QMaL+HgHMWsdbeU72ZL5fKk8zURirc4xZlmINMEt4mUruIJ5Sdi/u6NpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rd4H69LO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGCk20D032589;
	Mon, 16 Dec 2024 20:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5oXif9BpDrBWmz7s8nZtlUyESt5pnsWuJi2m792Ugw=; b=Rd4H69LOL0X0PWz3
	bt34JGV2AYmPy7cAL1d2OUU8CfRtMJCVFoBJCjM2B5cX2TXWnQ3nKIzKK6bPXlXA
	AvnOvshT9Moi7fY+rMJkoIeRpAT97vcq1ynJebZerRe9Bm51K7J64MBkGiaZPWiK
	OsR5e6O9nnyfk/xsjHivFk6WuYof41h4INgcF3Qs5cAOSVz3VLQhKLVzdzmo6oVk
	meZCnm+/JjtcYdhHjOwlWyRBStn6B/YwhpjpKJqFfWDWMhntsOe/w/wk0DRRj6NC
	qHlhPQABotIXAAUf47FecmLqmHZdJcPgTvIFNEQRWffYPECBYQZgOAfL457pOleb
	A+99JA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jmgah60u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 20:28:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGKSa9g000717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 20:28:36 GMT
Received: from [10.216.59.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 12:28:33 -0800
Message-ID: <a15a7594-8793-478b-a86e-81a06812e4ff@quicinc.com>
Date: Tue, 17 Dec 2024 01:58:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Rob Clark <robdclark@gmail.com>, <iommu@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Rob
 Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
        Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM
 SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20241216171017.4881-1-robdclark@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241216171017.4881-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kIrFKqYl1sD_I1pStUItg7ckvFPQClSP
X-Proofpoint-GUID: kIrFKqYl1sD_I1pStUItg7ckvFPQClSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160168

On 12/16/2024 10:40 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On mmu-500, stall-on-fault seems to stall all context banks, causing the
> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> 
> This fixes an issue with an older mesa bug taking outo the system
> because of GMU going off into the year.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index c4c52f7bd09a..1c881e88fc4d 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>  	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
> -	priv->set_stall = qcom_adreno_smmu_set_stall;
> -	priv->resume_translation = qcom_adreno_smmu_resume_translation;
> +	if (of_device_is_compatible(np, "qcom,smmu-v2")) {
> +		priv->set_stall = qcom_adreno_smmu_set_stall;
> +		priv->resume_translation = qcom_adreno_smmu_resume_translation;
> +	}

Shall we disable this from the driver instead? A debugfs knob to trigger
coredump after a pagefault is very convenient.

-Akhil

>  	priv->set_prr_bit = NULL;
>  	priv->set_prr_addr = NULL;
>  


