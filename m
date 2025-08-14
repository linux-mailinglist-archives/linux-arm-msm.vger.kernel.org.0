Return-Path: <linux-arm-msm+bounces-69109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F9B25C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AE71162C59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 06:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE6525A33E;
	Thu, 14 Aug 2025 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWf9WJA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D78B25A348
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755154332; cv=none; b=gwjtDazHxWmF39myww6VdGCRNYu3uThFu3PEOaKKYp7SSTQ6WswEg0b1OLDlwd6mBggYu52IsVbGBhTx0VNiDkyRIf/yfPYk/13ASfY2dKhkuv89E/sQ2+MhzeYPhoOAblQhruZGBgRMmHArEprn4h/Akdz1TWIjrxD6xrvwuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755154332; c=relaxed/simple;
	bh=735zI8v6gCWPco16jb2nXsuda3pPS6+dALJsF6E93Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPilf92rQYM6BshTx6PmGgBhahpZgn34Ey971nHWtNBTgumCaBkMBBiUCABeVJXi9ow7RkFYwp0QaJHdOBvj3Kup5KFvnTYRoTZ8K9uU2PA0Eup1R6HZXS807Xx73pkLA07pvIvZFNzxVRntE9tqzYMg/Ia3u13qSeSl6GyykXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWf9WJA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMh1YO023960
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=owhi08C/M/NN6d0s604Ju+m1
	uDGPJY3DmSHO26z2ljg=; b=HWf9WJA4YNEMkKYqHshBP/5z3OILqxFW/kix8dkM
	vK7hhkcNIW6Z6wLB0qzaxVobXrjPpm0oHj/cf+9I8ekd/7n6sCapHX0xL+7OYFUO
	tlphFb/YO+WjWPA77qQo9NyWmiIzZp///U1dSDaniiwTO6+HOLofNpXqS4UvXm21
	Rrmxj9m4pUAlhrZTpRYAKGiZKP5U/t4mOcJbUA+Y079iS3GQtjJJKDeJEgvgH3vf
	FlbrLIP2J2Cb6dW/swQDMycluZponh4VUfKH4zGf0g6i5KqdVxtVwF5ZQ048dOXu
	mTkeCQF3aFCfHT8WLdIVG7NGqsmIaVT9u2ToswO/rwA4Jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9ruae5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 06:52:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109be41a1so26051751cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755154329; x=1755759129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owhi08C/M/NN6d0s604Ju+m1uDGPJY3DmSHO26z2ljg=;
        b=N5T0iRNNMHF3QqpjYEVmWsIntoQsAfmUmaLhqpFPgigA7sl31A1/HBaYrOdUy5YIlU
         E2gabicI+lPs4JBpyjlhSjLTLxLOUiU1hdLY8p1MVyg1DZqfeDvcPKa1uQiVJtqDna1H
         l0y97eN579Rqh5Hh9XKNrDGxvAQz3aV6wB9QmQTbpn+wKijBdkr894rSiIo+isZN+XeK
         kKfjs6SwLrfW+apsR7dN7Qk1VhYgbVSiAO+5KGlMNgAT5Z9guF2t8drIThItUCzJE1KJ
         VEpxSfzwwr0Tx0oPtd7g/to5Cb8oDsTB4dfldh+KEyNrO8vLmQLjiakLPdk3h88R1qGG
         W9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVvDTdAyzRibfHTyisXrJC1ThVhzhTl14unJOOkaby/6TM0j5yoCAZne/6uYBnBbkKtZSzKyn6Ra2U6/Q/h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lYvhRA5/ayeQ/8oAiNgw5Jh2923Y07cq04I8IgEy8ynyO/WU
	+2oasOootJLZXzBQfdEsj1X09DcPAlNkWT9itIFygSS+A/hYWPrLLlbg/DkMVEzXwDnAD6uyPWf
	NcZkyUYOF1NRmc/TgTM8YJqfnizeVjNan94V3veMel+SacZHjGS3cVZramc5S+4n/3mC/
X-Gm-Gg: ASbGnctlUxVd6FvJ2D3zKmBKnOcxbXin6ok/KA4DgE/FX4PNVy0w1yoTJL14wQX/X1U
	rRec1I094zbKMRNg7lYolbUOR11VrhJc8ytxyDpTnL2A040MEE6iFS2yOVjF4vI5LxAIW1ynudR
	xuw6v0N3HIkbLZQCcCfqNtjUcoitZOm+JMb5wnn/BqChJ979iicilnBIZiqCvZOzzo6GOPX++tC
	99b6nvzEQYgA5axS0AFPo3ynl63F/d4hqiM3e7oGht1GlMH2e1eAnIQgAf9jhi/IaTvW2Vapvnd
	we08WlPolcHbjqs7KdjArk76JO9vOqWs8qsAVUDZHu63Vj3s5qp4D8yrkmp8EQwnyREYBCOZSa9
	oFzb/VDY3PmSDsE6/dIA1rTVIQHZfaMKrEruPSE2qzJ2zMwUvj1BS
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31568031cf.43.1755154328713;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM0qr1LVcYRMByeamQSKE14P39HiE+Ci5RWjhuXSylU1tRHSO3/y8Hd3syjoumZhxu28HzQw==
X-Received: by 2002:ac8:5808:0:b0:4b0:7f93:3cdb with SMTP id d75a77b69052e-4b10ab647c5mr31567601cf.43.1755154328087;
        Wed, 13 Aug 2025 23:52:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bdcfsm5494037e87.32.2025.08.13.23.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 23:52:07 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
Message-ID: <te2o47dxihjsckaigfdhbrbyqxaeqmchmtx5xbx5y2smu6yaja@t7uccvfsxmay>
References: <20250813214808.895654-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813214808.895654-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX85sTtRdqF/v3
 RhbLjUsbXKJcBiiyOxGyqDXbo7Lw2Ha02QbPg7A4PFhjsSGtaeuchRNWXd9bpI3BctJxVhpFcXm
 AnNqXFqc399gmEoRwcnHZMXmIsMFETLgxJcz5/11fAvacOay7O+iqgX9CzCCdON6qu7UYTpIlyb
 Plc/YIf4OGNke+F2l/dX9nNAwmWfwPlApseIybvsiVv4drYXFwwVvvYtQtw8DTLAk+66OoMqj+d
 ktPWHtdllfJay7+uvVa/gnzHMO4+U5dD65oUq6zoF6KuCHzbGtpNFKpZg+Zv0zx1Jl6H3epTa+Y
 PYLsYw4Qce6EAZCYjDxoKwZwg9sEyp48lYF+Ipu7b2T3Nk+NoqDFvixskabaBUmcPz1vq9Kqj8O
 9y6f3VjZ
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d879a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=8b9GpE9nAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=3NaVR53663puj-g3OQgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=T3LWEMljR5ZiDmsYVIUa:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: df3RVQp7A6i2KxlOzYdNXbSNQiRT6oEU
X-Proofpoint-GUID: df3RVQp7A6i2KxlOzYdNXbSNQiRT6oEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Wed, Aug 13, 2025 at 04:48:03PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Tested-by: Peng Fan <peng.fan@nxp.com> # i.MX93-11x11-EVK for imx_rproc.c
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v4:
>  - Rebase on v6.17-rc1. qcom_q6v5_pas.c conflicted needing s/adsp/pas/
> 
> v3:
>  - Rebase on v6.16-rc1. Move TI K3 changes to new common file.
>  - Fix double increment of "i" in xlnx_r5
> 
> v2:
>  - Use strstarts instead of strcmp for resource names as they include
>    the unit-address.
>  - Drop the unit-address from resource name for imx and st drivers
> ---
>  drivers/remoteproc/imx_dsp_rproc.c        | 45 ++++++--------
>  drivers/remoteproc/imx_rproc.c            | 68 ++++++++------------
>  drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>  drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
>  drivers/remoteproc/qcom_q6v5_pas.c        | 75 +++++++++--------------
>  drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
>  drivers/remoteproc/qcom_wcnss.c           | 23 +++----
>  drivers/remoteproc/rcar_rproc.c           | 36 +++++------
>  drivers/remoteproc/st_remoteproc.c        | 41 ++++++-------
>  drivers/remoteproc/stm32_rproc.c          | 44 ++++++-------
>  drivers/remoteproc/ti_k3_common.c         | 28 ++++-----
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  |  2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++---------
>  14 files changed, 204 insertions(+), 320 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 94af77baa7a1..a5b7cbb8fe07 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -625,26 +625,20 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  
>  static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
>  {
> -	struct reserved_mem *rmem = NULL;
> -	struct device_node *node;
> -
> -	node = of_parse_phandle(adsp->dev->of_node, "memory-region", 0);
> -	if (node)
> -		rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> +	int ret;
> +	struct resource res;
>  
> -	if (!rmem) {
> +	ret = of_reserved_mem_region_to_resource(adsp->dev->of_node, 0, &res);
> +	if (!ret) {
>  		dev_err(adsp->dev, "unable to resolve memory-region\n");
> -		return -EINVAL;
> +		return ret;

This looks strange. Shouldn't it be `if (ret) {` ?

>  	}
>  
> -	adsp->mem_phys = adsp->mem_reloc = rmem->base;
> -	adsp->mem_size = rmem->size;
> -	adsp->mem_region = devm_ioremap_wc(adsp->dev,
> -				adsp->mem_phys, adsp->mem_size);
> +	adsp->mem_phys = adsp->mem_reloc = res.start;
> +	adsp->mem_size = resource_size(&res);
> +	adsp->mem_region = devm_ioremap_resource_wc(adsp->dev, &res);
>  	if (!adsp->mem_region) {
> -		dev_err(adsp->dev, "unable to map memory region: %pa+%zx\n",
> -			&rmem->base, adsp->mem_size);
> +		dev_err(adsp->dev, "unable to map memory region: %pR\n", &res);
>  		return -EBUSY;
>  	}
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 0c0199fb0e68..0fea5f91dd1c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1961,8 +1961,8 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>  static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  {
>  	struct device_node *child;
> -	struct reserved_mem *rmem;
> -	struct device_node *node;
> +	struct resource res;
> +	int ret;
>  
>  	/*
>  	 * In the absence of mba/mpss sub-child, extract the mba and mpss
> @@ -1970,71 +1970,49 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  	 */
>  	child = of_get_child_by_name(qproc->dev->of_node, "mba");
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 0, &res);
>  	} else {
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mba memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mba region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mba_phys = rmem->base;
> -	qproc->mba_size = rmem->size;
> +	qproc->mba_phys = res.start;
> +	qproc->mba_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node,
> -					"memory-region", 1);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 1, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node) {
> -		dev_err(qproc->dev, "no mpss memory-region specified\n");
> -		return -EINVAL;
> -	}
> -
> -	rmem = of_reserved_mem_lookup(node);
> -	of_node_put(node);
> -	if (!rmem) {
> +	if (ret) {
>  		dev_err(qproc->dev, "unable to resolve mpss region\n");
> -		return -EINVAL;
> +		return ret;
>  	}
>  
> -	qproc->mpss_phys = qproc->mpss_reloc = rmem->base;
> -	qproc->mpss_size = rmem->size;
> +	qproc->mpss_phys = qproc->mpss_reloc = res.start;
> +	qproc->mpss_size = resource_size(&res);
>  
>  	if (!child) {
> -		node = of_parse_phandle(qproc->dev->of_node, "memory-region", 2);
> +		ret = of_reserved_mem_region_to_resource(qproc->dev->of_node, 2, &res);
>  	} else {
>  		child = of_get_child_by_name(qproc->dev->of_node, "metadata");
> -		node = of_parse_phandle(child, "memory-region", 0);
> +		ret = of_reserved_mem_region_to_resource(child, 0, &res);
>  		of_node_put(child);
>  	}
>  
> -	if (!node)
> +	if (ret)
>  		return 0;

Shouldn't we differentiate between an absent region (OK) and an error
during parse.

>  
> -	rmem = of_reserved_mem_lookup(node);
> -	if (!rmem) {
> -		dev_err(qproc->dev, "unable to resolve metadata region\n");
> -		return -EINVAL;
> -	}
> -
> -	qproc->mdata_phys = rmem->base;
> -	qproc->mdata_size = rmem->size;
> +	qproc->mdata_phys = res.start;
> +	qproc->mdata_size = resource_size(&res);
>  
>  	return 0;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 02e29171cbbe..b3f7209289a6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -121,7 +121,7 @@ struct qcom_pas {
>  
>  static void qcom_pas_segment_dump(struct rproc *rproc,
>  				  struct rproc_dump_segment *segment,
> -				  void *dest, size_t offset, size_t size)
> +		       void *dest, size_t offset, size_t size)

Irrelevant? (and two next chunks)

>  {
>  	struct qcom_pas *pas = rproc->priv;
>  	int total_offset;
> @@ -149,7 +149,7 @@ static void qcom_pas_minidump(struct rproc *rproc)
>  }
>  
>  static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> -			       size_t pd_count)
> +			   size_t pd_count)
>  {
>  	int ret;
>  	int i;
> @@ -176,7 +176,7 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  };
>  
>  static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
> -				 size_t pd_count)
> +			     size_t pd_count)
>  {
>  	int i;
>  

-- 
With best wishes
Dmitry

