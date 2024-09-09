Return-Path: <linux-arm-msm+bounces-31375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EB972427
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 23:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D290A1F2377D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 21:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DF718B484;
	Mon,  9 Sep 2024 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W2jHPloO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E39189903;
	Mon,  9 Sep 2024 21:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725915866; cv=none; b=YR1zcX+dfi9N8BASdm8wT0Q7St6Yi20gbRzdF1jYTfEZQiI14qwtkA9D/+RjBC+62JEYH+BO+h2k15frx+X6Wy8xhLclYARkZISFJN18SVwpVDdlgncNLgBYrZnTSqoe6GLJVwDkjz+GYTZblI2AAlqq0UEwEnrGD415GksD+Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725915866; c=relaxed/simple;
	bh=BCDj7pVkiND0zR0ebd+CxUe4DbkBZBXzPalBbwURgbs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR+QuTFRmWyMqlX5J4I4djlPbQCH6inz38R2c2/YVPoGqJS5ck5OQqYl++VpgD7K/ifVki/jLldYOD5mBwCRmCSQV2l5Bvh6NSeum+KlfnvxzgXRYB8MShdfbVS6YxsRhWWEPv0aSAIvl05ut01VEcRzCgleykR+yFrEeHATqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W2jHPloO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRgmE024814;
	Mon, 9 Sep 2024 21:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4IdZQYEBSXn2HoRB7fKSrZfy
	kCQ20FRDknlUf2S2FAs=; b=W2jHPloOVdU8LEstzrfDmgl6JLHa2/68GVlSz0Ln
	DEo+95i08AD0QDxFKRd7dE/XzmSi80Ow18auL66SrXS5/6JQnq74prGEzZZSf+pP
	UU3nwAxpP/F4lio97bZWlta2WvQnT+qn9saCN+aU2ikzfqBc9VUIe1+ORDROMxRo
	IlQXtLtqdk2cjO2vCis7eBu9J9hgYVW0IqHY7je2TvGD70c8MK6uQd7pP8V8z48r
	/tNCC2nxaYixDud6XAq/N/LbZ4hwj0sV3mpCqF+RY9mlCduYSel3CEHMXif7WV+g
	jAX+KUCXyxDTSreUX5UqwIUeaca4WdwWCyIS27SI89nV2Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6p3ydb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 21:04:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489L4Ae0015817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 21:04:10 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 14:04:09 -0700
Date: Mon, 9 Sep 2024 14:04:09 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
        Rudraksha Gupta
	<guptarud@gmail.com>,
        "Linux regression tracking (Thorsten Leemhuis)"
	<regressions@leemhuis.info>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
Message-ID: <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZFMLcB_jsrg37w3BbVrZ9o-JviB7XMjV
X-Proofpoint-GUID: ZFMLcB_jsrg37w3BbVrZ9o-JviB7XMjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090166

On Mon, Sep 09, 2024 at 08:38:45PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Older platforms don't have an actual SCM device tied into the driver
> model and so there's no struct device which to use with the TZ Mem API.
> We need to fall-back to kcalloc() when allocating the buffer for
> additional SMC arguments on such platforms which don't even probe the SCM
> driver and never create the TZMem pool.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/<S-Del>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> index 2b4c2826f572..13f72541033c 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> @@ -147,6 +147,15 @@ static int __scm_smc_do(struct device *dev, struct arm_smccc_args *smc,
>  	return 0;
>  }
>  
> +static void smc_args_free(void *ptr)
> +{
> +	if (qcom_scm_get_tzmem_pool())

I'm a little concerned about this check. I didn't think making SCM calls
without the SCM device probed was possible until this report. We do
worry about that in the downstream kernel. So, I'm not sure if this
scenario is currently possible in the upstream kernel.

It's possible that some driver makes SCM call in parallel to SCM device
probing. Then, it might be possible for qcom_scm_get_tzmem_pool() to
return NULL at beginning of function and then a valid pointer by the
time we're freeing the ptr.

- Elliot

> +		qcom_tzmem_free(ptr);
> +	else
> +		kfree(ptr);
> +}
> +
> +DEFINE_FREE(smc_args, void *, if (!IS_ERR_OR_NULL(_T)) smc_args_free(_T));
>  
>  int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>  		   enum qcom_scm_convention qcom_convention,
> @@ -155,7 +164,7 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>  	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
>  	int arglen = desc->arginfo & 0xf;
>  	int i, ret;
> -	void *args_virt __free(qcom_tzmem) = NULL;
> +	void *args_virt __free(smc_args) = NULL;
>  	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
>  	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
>  	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
> @@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>  		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
>  
>  	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> -		args_virt = qcom_tzmem_alloc(mempool,
> -					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
> -					     flag);
> +		/*
> +		 * Older platforms don't have an entry for SCM in device-tree
> +		 * and so no device is bound to the SCM driver. This means there
> +		 * is no struct device for the TZ Mem API. Fall back to
> +		 * kcalloc() on such platforms.
> +		 */
> +		if (mempool)
> +			args_virt = qcom_tzmem_alloc(
> +					mempool,
> +					SCM_SMC_N_EXT_ARGS * sizeof(u64),
> +					flag);
> +		else
> +			args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
> +					    flag);
>  		if (!args_virt)
>  			return -ENOMEM;
>  
> 
> -- 
> 2.43.0
> 

