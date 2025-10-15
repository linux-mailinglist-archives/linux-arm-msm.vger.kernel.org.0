Return-Path: <linux-arm-msm+bounces-77353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA0BDDE9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE2334FEDD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16B131BCA9;
	Wed, 15 Oct 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/duVX+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAC731BC8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760522870; cv=none; b=b1JObaY3EgVe0+768nC1o4w7isU3Oz0GB1yr36l4CPMKVHFC4iiyEMUivdPKDdU+7TBvKtUCRNyHEe9vayQut8yXRXIsQ71iBL/wcQ6Ndzbq1X8zZnTKDraCKaEiZnjfMnl8ABzw7b94s1SZiHd56SgwjSgSHh4A/pqoIJbwpIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760522870; c=relaxed/simple;
	bh=AyERBfq+RQvAoN1T4iTzBY9LK80j7jh40Ick5el4NFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObPAT/43YqlS+E0xg/LUA+3yuvq0204iG+J8sgT/DIq9UxCF71DghsKDRa3CeJs6tZ34ciDcx7Xd8377/GG9RjbC7XSniSJOFnCckL8e2oYYkk+dqgxRirs2KHnXicDlyPXKBrG6p3U+EjK8J/NbwCPHJ0wNkEcBIr3Cr9Gxit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/duVX+7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2slYg005001
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Plo72r9vuYhq4837E+ASzQQ2
	vnfrofTlUlT0CX2gzYU=; b=h/duVX+7IQp+5tGiv//K47kPEZI6Sd+OSPcI2CLa
	9bT52LvhylH+y/nrtLRNw7kR+bEr6GrNI1yRfEMNWOWQZXnA3vmeD7VABIBDPqYa
	yAsgZHcWcyUZkRdToQDtaEQW/gfMqxJfPpUX+HnicxRctVxLf4o8mCUUHQDYtsnC
	SkG9P7Q+Bia6h3m6pMddEZi5kiGo9QCmQ/tst0oFwKu3On+k82nGHtk8UpK52xQf
	ABYdzboo2MR6C47R2YOlKhmbCEc70AnSCebok9N5RzwyMT5tnO8I3Fix2NjSmJud
	fNJG9JCUGmU4MiSkEQ7kuUS8j0bh6xExyi2H1bJYfqqRLg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwp9ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:07:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-818bf399f8aso398736666d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760522867; x=1761127667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Plo72r9vuYhq4837E+ASzQQ2vnfrofTlUlT0CX2gzYU=;
        b=fwvFZwVQ56Fo/5PA6yh6q5XGwb5/Ni3L9u2OZCBrWzr2sPglmADCJTwim90DyzUprH
         r8kMkyt1NBIYffdg1Mfvldv5/nmY9f0WhjClXF7z5fayB+jm3dMuz1DQf57qf9nFKdLh
         6GAwRAAZcLo5g0ddY4/2aT+eWU5SwpRFS+vxr1qvFH74MNGdsrSggmz4pUx1EG7AbQnI
         RfVUVl8papfc4VVkBBFIcfWBMt4w9HLGhB9vKH9Xs79Z7n+DzsfS+ZQID8CW4gQSRvNt
         ikdGwYpvpN+vQmVeJ8RW4CNHCVQ7s+2WCirwWPnAJAoL0UmZTaSWaNKAvg15FQLaNsZG
         0CwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRylNd+fjLzR2gbC62F1RrB4T+P95vxNpW/irigeMUyfIJiW9VWrxXkjy3dxanN5DIv251a93y68xMlWC@vger.kernel.org
X-Gm-Message-State: AOJu0YwobjZ+MFmsjIRZF/THxZu062p8vJ74oN1AaTHM6dA8rspmEtV2
	dTRu8Axhb3Gkdqgxe/DyWQ0ngCMmMIJjDLMsdLBvGZ7XC46ACgObbwOS5ryAhbxlJlpbAN9WZKM
	HWN7NMeudit52Vin0xJKBZwzyC+oeObPUQ1Z/a2vQjecLM/TAJ2oC0KKQGYIHbI7y2NS3
X-Gm-Gg: ASbGncsTVVLymELOraMS7fSySDj4o8wvBtAGmA5nlks6kqvItam5nNFMlFJ17U6z5pH
	JB9uu400AyIXADBSp1PvDv5fasjWGX9KC3CatvlPkepkZPWt4LGIl7MhPwQpnQKkPdpK7JKNWQ1
	vuLiGvPsSZo+QNr770i4+3aA0ijp5hNXrkaikHZLUclyo4pTL8HvUpJWZJm+FNqFnSR90I1JNAw
	U1wP9fy3F8bZHsJ1wOVqg9J6LsW38mGZ6FW3GLCY0VBLwbJQrqIbt+nmNttSYa8pgGzFFdg5Rj4
	RVXwb985VXUsoERpXoVdb2TC4iOa31uikEFA79ZDQpJu+lS7gUiGmGQPxDbE1w/TNAgzPokEDpE
	XG/31Jlr2OAnSZLzvFKD20u9YOiLV+dfBse3GH2/auQGApzsUt/NX
X-Received: by 2002:a05:622a:5592:b0:4df:6583:a5c3 with SMTP id d75a77b69052e-4e6eacfad65mr397959691cf.31.1760522866703;
        Wed, 15 Oct 2025 03:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG720qHgaxVVn/tMDskc+Fb5CVEdJRkO+FFfXZC4YdLvxqG8hCwJFnA1hXqIvZ1BHwzYpNiuw==
X-Received: by 2002:a05:622a:5592:b0:4df:6583:a5c3 with SMTP id d75a77b69052e-4e6eacfad65mr397959141cf.31.1760522866163;
        Wed, 15 Oct 2025 03:07:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590885784e7sm6098047e87.111.2025.10.15.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:07:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 13:07:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v2 1/3] misc: fastrpc: Rename phys to dma_addr for clarity
Message-ID: <svekpvatqpymzxprc5n2tlndqlwze3tj6kr3bzszjnoay7oulk@zslcxpsyuzdo>
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015045702.3022060-2-kumari.pallavi@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfXxrzhotrddADc
 ZG8l3il2oEgPJuBXxbpqEyM2ItI9hoVj5DejyUKeFCM71K2CbMhlxszCfO0FUSVJhcP6UdfM5Zf
 XOpQJ7g0mTt6tttBcB/DWMUINOJm291Fp+xQMjU2xSFGmaKrm6CnuZpXRnsiBTRujBU0P29NjEG
 iwZyoYypGtEFO1zsRLhZcrEk+uP3hRc9KAKJg9qvy4j6qYbeg0coTV2T9Lno6W45R6Vf2momFiQ
 eskoyzENBay+5UmLlmEbod5mNrOOS9fdoolSAkMAlTZQ+jAtpsBItSmQ00vfqszJyEh5rOiMtUX
 vjUcZZLDCUAW6ZbdO7v7LJ9phhclaloLfuTSW3J/pF1HR+ZGiw6NuTDu+cIp+1fSNbmBGW8D7Z+
 aSSyflf60tuF8BqfTl3ewn3kQ8E4KA==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef7274 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ieKUWAqLYShgQCTD6ZgA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: xIZcfNQ2d2Gaobg5B8Tdl24MlGR6z04O
X-Proofpoint-ORIG-GUID: xIZcfNQ2d2Gaobg5B8Tdl24MlGR6z04O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083

On Wed, Oct 15, 2025 at 10:27:00AM +0530, Kumari Pallavi wrote:
> Update all references of buf->phys and map->phys to buf->dma_addr and
> map->dma_addr to accurately represent that these fields store DMA
> addresses, not physical addresses. This change improves code clarity
> and aligns with kernel conventions for dma_addr_t usage.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 68 +++++++++++++++++++++---------------------
>  1 file changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 621bce7e101c..975be54a2491 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -194,7 +194,7 @@ struct fastrpc_buf {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	void *virt;
> -	u64 phys;
> +	u64 dma_addr;

If it is dma_addr, why isn't it dma_addr_t?


>  	u64 size;
>  	/* Lock for dma buf attachments */
>  	struct mutex lock;
> @@ -217,7 +217,7 @@ struct fastrpc_map {
>  	struct dma_buf *buf;
>  	struct sg_table *table;
>  	struct dma_buf_attachment *attach;
> -	u64 phys;
> +	u64 dma_addr;

And this one.

>  	u64 size;
>  	void *va;
>  	u64 len;
> @@ -406,12 +406,12 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  
>  	buf->fl = fl;
>  	buf->virt = NULL;
> -	buf->phys = 0;
> +	buf->dma_addr = 0;
>  	buf->size = size;
>  	buf->dev = dev;
>  	buf->raddr = 0;
>  
> -	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->phys,
> +	buf->virt = dma_alloc_coherent(dev, buf->size, (dma_addr_t *)&buf->dma_addr,
>  				       GFP_KERNEL);

If it was dma_addr_t, you wouldn't have had to typecast here.

>  	if (!buf->virt) {
>  		mutex_destroy(&buf->lock);
> @@ -437,7 +437,7 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->phys += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += ((u64)fl->sctx->sid << 32);
>  
>  	return 0;
>  }
> @@ -682,7 +682,7 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->phys), buffer->size);
> +			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);

FASTRPC_PHYS trunates addr to 32 bits. Is it expected? Is it a DMA
address on the  Linux or on the DSP side?

>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);

-- 
With best wishes
Dmitry

