Return-Path: <linux-arm-msm+bounces-19951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D58C7DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 22:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E601F222FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 20:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5E0157A76;
	Thu, 16 May 2024 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B6fdpm9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9D157496;
	Thu, 16 May 2024 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715891328; cv=none; b=jl/S/r7iAOfFFJGZzm2+laaq8icxDg/tTLklQ7Z6IFjYZDh7rL0vubryIzXGbKGE2RvLdoCH5HwP25jiEX975uLlVg4bJ6hDXdeb8W2REx3Poet5b7SuHyG5gLH5dCzDD/ix5sX+LB6E8NXXvIIRMUJYrufh5ZLcddmwTiKbAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715891328; c=relaxed/simple;
	bh=A6GTmEn1va+O6ILYB4gpqbBPN6mVLHunur1FRlhF+S4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asImB7lMVHIPT9PrWIbPfYpWAeAveAjrF5x59KoQ+QGvGeEz3kVVwMBYnMtPmAwqpshRbLZKvvAJU+RsOYubpZAuWCGkmao8h4JQxrzD8aV36QC2EvVXzTueUIOxeu0XoV4ixgvHgnHcIY6s9PQXChkDIhq2zgfAru1/cpE2pxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B6fdpm9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMhKu017378;
	Thu, 16 May 2024 20:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=XGbIMWQAdRvunb+y8FS+o
	7goARG0nCguoOakNb6SYok=; b=B6fdpm9LM0O9LKGR0KGQBpzrHbUucFY/Y+mvU
	cRYmV23XTd7+q6kAV9lEjdlfyWddXJllTdvAsDvjAiCnCWHGM9iuVddbOSo6yO36
	/0XSCop6fQWPYorEyHElJ3Rn+XfOSZQJCmAvg/vkNP01YeLY2qf74dcmDOl0rtSq
	uLK5CJyd0yBsD+dSsZuKCuz5C93Tu5ma19WJpHoETg+PPk//zx0Maq9dkf0saXoB
	Ytrd5ZDAVZoioSNsb4Xg2m//b7GsOTsMdXOmAM/OuGfKbQ6USJ48LCT9JPmIJlz0
	K+RnHq62RyF08OsUba2HRgB7Txp7gXR7402Kir9E+GthAgwAg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28sanw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 20:28:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GKSgUg002924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 20:28:42 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 13:28:41 -0700
Date: Thu, 16 May 2024 13:28:41 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom_scm: Give page_aligned size for dma api's
Message-ID: <20240516131759140-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <1715887976-1288-1-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1715887976-1288-1-git-send-email-quic_mojha@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5X42Y8q-3yzS901mDWlYYypIg5PtnISS
X-Proofpoint-GUID: 5X42Y8q-3yzS901mDWlYYypIg5PtnISS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160148

On Fri, May 17, 2024 at 01:02:56AM +0530, Mukesh Ojha wrote:
> If we disable CONFIG_ZONE_DMA32 to make the selection of DMA
> memory from higher 4GB range. dma_alloc_coherant() api usage
                                dma_alloc_coherent()
> inside qcom_scm_pas_init_image() which usage scm 32bit device
> will fail for size of data passed less than PAGE_SIZE and
> it will fallback to buddy pool to allocate memory from which
> will fail.

I interpreted this as:

When CONFIG_ZONE_DMA32 is disabled, dma_alloc_coherent() fails when size
is < PAGE_SIZE. qcom_scm_pas_init_image() will fail to allocate using
dma_alloc_coherent() and incorrectly fall back to buddy pool.

This justification seems incorrect to me. None of the other
dma_alloc_coherent() users are page-aligning their requests in scm
driver. Is something else going on?

> 
> Convert the size to aligned to PAGE_SIZE before it gets pass
> to dma_alloc_coherant(), so that it gets coherant memory in
     dma_alloc_coherent                    coherent
> lower 4GB from linux cma region.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 029ee5edbea6..6616048f1c33 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -562,6 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  			    struct qcom_scm_pas_metadata *ctx)
>  {
> +	size_t page_aligned_size;
>  	dma_addr_t mdata_phys;
>  	void *mdata_buf;
>  	int ret;
> @@ -579,7 +580,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	 * data blob, so make sure it's physically contiguous, 4K aligned and
>  	 * non-cachable to avoid XPU violations.
>  	 */
> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> +	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);

Isn't PAGE_ALIGN(size) good enough? Why do you need to round up to the
2nd page? Maybe you thought PAGE_ALIGN was PAGE_ALIGN_DOWN ?

> +	mdata_buf = dma_alloc_coherent(__scm->dev, page_aligned_size, &mdata_phys,
>  				       GFP_KERNEL);
>  	if (!mdata_buf)
>  		return -ENOMEM;
> @@ -604,11 +606,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  
>  out:
>  	if (ret < 0 || !ctx) {
> -		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> +		dma_free_coherent(__scm->dev, page_aligned_size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
>  		ctx->ptr = mdata_buf;
>  		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +		ctx->size = page_aligned_size;
>  	}
>  
>  	return ret ? : res.result[0];
> -- 
> 2.7.4
> 
> 

