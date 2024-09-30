Return-Path: <linux-arm-msm+bounces-32797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21898AAD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 19:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 604F0288579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFA6194ACB;
	Mon, 30 Sep 2024 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZrjHO35c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476BA5103F;
	Mon, 30 Sep 2024 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727716389; cv=none; b=ZLYlJEPHwSzhi31/cw2j8yyntq4fUJFjLCAEyWsyEyvTYN09uPcEBadeCTs2WX3AEmFkChNmAf/vlZVWMiEwZo3PIhu9Lz1bQuvE+041xfmfsWThKUyTyquN65CI8aKNhElN/h/kPtLJPeU0trrKV5ZkuGyiSsh1I9uaMZk9B0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727716389; c=relaxed/simple;
	bh=14AJRSeRfxvmwLi0dFmdbeq6u7D9PkODNFuzo6jOIOc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCf8lMxiEu9p7RFsBNe6iBVWHhNy88GBVgjIh7g/IIqDT7ytaYlCJm+lom4knguvdGD81t2MUP6MTbAfHJeUg5XC72mN7GAdagfVv+w47MQulyEbyKjRPzMLxVeRZWtF3C5lQcw78sT/t5FYqcqWafetB78s9jfONSnXLdIPhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZrjHO35c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UBQBAO025185;
	Mon, 30 Sep 2024 17:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K2r9+s9SuH8Gr71DwAy9Eays
	xmRxbEBhfH4RwCV1fH0=; b=ZrjHO35cfucMqUPQfuI8nEjthGYTUnlzirFV55T6
	LH74o6I9JMkkiRghMK4xWezkHY3NN4Vpq4jFYsgPhW60vbk/17hfnIhw8GKx8fZs
	lZsDfAOr9zgTjDZtuKU7rb+hKfbduJhAXR+q1AqKMHScKgkvKVYm+crgrpdsamQs
	BjCAEVp350zDKbfWI0AixDwwR//NC1YILphNMC7PlnUyGfrO3/kqg7RxJcuQw2Sc
	ZhjPtZuCbxvzI1txPvwD8vQfUz4GCV/GcwBUZKER4Po2K7kfGttAxOPNs5cLrB6o
	BhXV9BpsMnlBpXd1C5nW5BExQBsCJ/1G+adMfNdieBOOBQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9cydh7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:12:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UHCRfP003691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 17:12:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Sep 2024 10:12:27 -0700
Date: Mon, 30 Sep 2024 10:12:26 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Gax-c <zichenxie0106@gmail.com>
CC: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <rohitkr@codeaurora.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        Zijie Zhao
	<zzjas98@gmail.com>, Chenyuan Yang <chenyuan0y@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Message-ID: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930011521.26283-1-zichenxie0106@gmail.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ufx07w5KGn_-HNTs76H7-Rip3r15c-L5
X-Proofpoint-ORIG-GUID: Ufx07w5KGn_-HNTs76H7-Rip3r15c-L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409300123

On Sun, Sep 29, 2024 at 08:15:22PM -0500, Gax-c wrote:
> A 'devm_kzalloc' in 'asoc_qcom_lpass_cpu_platform_probe' could possibly return NULL pointer.
> NULL Pointer Dereference may be triggerred in 'asoc_qcom_lpass_cpu_platform_probe' without addtional check.
> Add a null check for the returned pointer.
> 

Your description and patch looks good to me.


But please run git log on the changed file and add a prefix to your
subject to match other changes to this file, and please wrap your commit
message at 75 characters.

A good resource to read about this is:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

Please also use the form devm_kzalloc() instead of 'devm_kzalloc' when
referring to kernel functions.

It seems reasonable to mark this for backporting to stable, so I'd also
suggest adding the following tag:

Cc: stable@vger.kernel.org
> Fixes: b5022a36d28f ("ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Reported-by: Zichen Xie <zichenxie0106@gmail.com>
> Reported-by: Zijie Zhao <zzjas98@gmail.com>
> Reported-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  sound/soc/qcom/lpass-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 5a47f661e0c6..a8e56f47f237 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1243,6 +1243,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
>  					GFP_KERNEL);
>  

Please drop this empty line.

Regards,
Bjorn

> +	if (!drvdata->i2sctl)
> +		return -ENOMEM;
> +
>  	/* Initialize bitfields for dai I2SCTL register */
>  	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
>  						drvdata->lpaif_map);
> -- 
> 2.25.1
> 
> 
> 
> 
> 

