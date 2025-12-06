Return-Path: <linux-arm-msm+bounces-84538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3709CA9EDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 03:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EA963009AA1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 02:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EFA287246;
	Sat,  6 Dec 2025 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0gRS5Iq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAGVNG5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E62857C7
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764988221; cv=none; b=Path1NS6GyUBkOJ81HcuIG3LJLj+VS1EBTOFX7Wzm66r6/IRMr/aUWKK3CkI6jpNA3zIKl3cbIvkCpg6p6p0zQK07+TEdSC4RCi1punnFGgZdUeKSoa4O7+NCzyGMdK0oweekJ2Ot36kZnlES1BOkXk1sFobGyMwTvhsRilMSQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764988221; c=relaxed/simple;
	bh=y95t5sbCpWE/qjf2W4Oq3AblvS3Nkj7jJw+vhDwxF1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3PsLwCQgbmXo9rvR38fUOVsTAer2alf1cPVvB0yHcsQQD+RqWlyA11o5KZiNG/U+F2teCd5xT1U0enUAptibH5DGpaHqMIyKJdzeeQryGuh/Z5PSC+hdP/W3PGfRABVwjL8h+Wq1arddVdXPpRbcIXMqUGY+K2BCA/11QlERbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0gRS5Iq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAGVNG5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B62CeXF2704437
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 02:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e/d8kbaoJ3LT3xXOy/67lazS
	UfWaZHogOBoRsULFs8s=; b=U0gRS5IqU9anCNVHl1AGrAnaK3DKXMgiILzynFwl
	8EVfs4ZlkrfkjR/w+4D1mxReQJa1WZ4QH3L2JYcmfPJI5R5dZ9O/HOcMsQxTHHlq
	4nQNvKqJWKJPeZRRANtQoVO+5D1NlhF1VK6koWrNUA7Oq/lQ2J2RrkC78OKD+Yf5
	gxFVjpZo0MUIk8dc/bYe48WDJZNuIS9e4y43tHPfQmzxKj92C8UifRXeQDRsrKs1
	+mlrVI9OtvHccOYgJdRTbLNnsuN4Bf8xZyCavw6rwRr35yMyNw8noSosfJ8dkuSZ
	MTe/IvRm5Flb+s1U9/Mxhg/WXGB34guf7TVLSENPLVPnuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avbga00uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 02:30:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2657cfcdaso360334285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 18:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764988218; x=1765593018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/d8kbaoJ3LT3xXOy/67lazSUfWaZHogOBoRsULFs8s=;
        b=XAGVNG5A3zils83PFmjtdzX0sIj0MTWMKcN+vpHDSdYrDqBeTbyqL5LapGhv3I8jLK
         2XtpUKmwCguQXIBR47ty46Ec++IyhstIcRQAeWAEhEKdjv1rhDE4YT2f/Zo8G0qcSG02
         uKxhMqf7N99ZajNhbuwpA+bM7/n9W5jZOlesJvD0HKJigSjS4YFVVcN5+kKZZ2K9x47n
         s7uTesrjCRPNekZu2JGCazzlGGWFVBonJnIk2xcEGq9MWrWNjQt3Mh+Q9OWvJdIKMPqU
         iULhfyE4GIKkih36OHv7GrasBO6ldNM7owhTuh286rrqnzEDzI8ub6YnO/6nJvscxV4v
         xBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764988218; x=1765593018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/d8kbaoJ3LT3xXOy/67lazSUfWaZHogOBoRsULFs8s=;
        b=L7+WSyG1zGfkSzOrJH6p8SDfjy99wLK1vpaCVlZQVsw4ouK8UXzet2AFgiB7pYPxnt
         oEWp8D72IQv881Nl4ASemDMV8YgQNr0vQ7brM4dQzUy6ws9bIFNx6ZYjkMm4s+CxDQZG
         hdC5ZVQ2ymc4UttyEipB2RsXOYESWNkXh9dnAXpnSll+s/UlGPNvxlRu4xg5gk6AJFvF
         wmnLANlJCweL6Vmr4o9s00Bf50HgnrezvC0m689lrT5HTdh77L/9FI2lZcBH/KR+gGHo
         ZpaMZGANDNW1pQMlrGoM6s57fUUyF44rt67Rwvqia8pqlzv8hD2HY4KXxNRvnuBc3NvI
         O4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP6WZ48/kLmGdvSr///l50c24MQ9YqHqgjcxhGLBulcvfLeP3Fc2DBkxrfMlt+t3ZQ59nRBkO2td2tcvLf@vger.kernel.org
X-Gm-Message-State: AOJu0YxXCOK7fSxVlymmMRpnAFQ6MaxZd+rTcDGEj11DvJLtALdIE7L+
	sINNENlOg/OtY8b4qSumSStbXx5Rzjv7z4Ncds9qrHBWMyK274O717MbdYDA0oLx7mwForO9Q26
	OKLUBTxQfYBapcwrjMrnAWUSKLGFb5AMtgNEydPVb6/tE+emz1HVW6r1fjuIHNQfEmsEA
X-Gm-Gg: ASbGncvF4DSkf+uG+9D9Zmx+0/EtG/SJd9W3svcmTka5iFmPRrdFNiXlwtKmSjPhqLN
	jWs/RjaBN9cXpcM8dj4HY8mtv/JiukCiD3qSvJzOnqBT6TVrOJiG4eWjrUd3e0WHDAgGx4lkS/G
	sOu54sjSzNYTN1DAXScQ9+1Gn1CdiiCCiNIS58IR0qXftrCP3507x2C3/xUCWIdSV58oZjEoaF4
	IhKjpOKeH/vCfdapoRWMtM4bqZZO+6Tj/xjxu+J+4isugH4MOF4zccVEUcCrNRG0wwdKTnWrJcJ
	KUI30eSJ3lUA8ZWB1dMQHJ4vnPN1XYxb3mfrWynjJNcUoYvlldvLwgwpi8KCpZUhoJ2V5DMhFB4
	aiaPMdQ7SiBs+54N6qX67VY9uCRW7KqFUlW8RdNQl48PQ08CReW87/8TqXRB0iZrS0+viBfkiXf
	uhD8tje/ycKFfBfRKgezaQvB0=
X-Received: by 2002:a05:620a:4620:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8b6a23e0558mr191001985a.69.1764988217552;
        Fri, 05 Dec 2025 18:30:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbFasjoPYgeV0zAyrFao6Ix4m/Qiro6WgeULAnmE2a4FYE4mruIM3gzGDMgLoYDTwXaP7xJA==
X-Received: by 2002:a05:620a:4620:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8b6a23e0558mr190996385a.69.1764988216880;
        Fri, 05 Dec 2025 18:30:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e7067cbadsm18852901fa.50.2025.12.05.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 18:30:16 -0800 (PST)
Date: Sat, 6 Dec 2025 04:30:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <mlyaklczl4ngeckk7nle2xwmmzmqlphi6d47octomc5tewohh7@ipc2ik3kqj6q>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
 <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4z4CBjE c=1 sm=1 tr=0 ts=6933953a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NQApBsomutaRK4veD-8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 02yvN21oNS9SUa_TyVSWd3gn5NTH0Jko
X-Proofpoint-ORIG-GUID: 02yvN21oNS9SUa_TyVSWd3gn5NTH0Jko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAxNyBTYWx0ZWRfXzZAezzNhkJXV
 LBm5bG7vIfdEIjMVhaVdV7bB5LloSx0I53KeCTK9KUOH9u8n61vERbfDCZkWXHjVEUCx5Vbk/rH
 BL/i+1JPeB79oOCu+GeiYV8aNsy0WH6B3kBAZx6eJvYRWq//m6IJSplgxfL1nGv5S1GOGJIQhi0
 S4e3cAlpeLYi1HGQZwjubMK8mtLTMwAxfPN78k5ZgDvvmyS3sjc+XeAB9UdvMP3ioLsXQoQ9dHE
 7sHn14MLRKo9DQX9Y2RiLF0+CgXLO+tH+r86zvZ3zEGjm9o+93xTWzRR+Wvfd2qLoh4G9wzLXyz
 KaUEuYnGJ9MXBHQ/U1+pdrhByA5sPgW8e5LUBJAO22A9Bla25tpLj5YgZyXfpPzl+D9czC7gpOz
 ePTtUj+AzcSRYgMaCYKnp7mzHU6u6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060017

On Tue, Dec 02, 2025 at 11:36:27AM +0530, Kumari Pallavi wrote:
> Implement the new IOVA formatting required by the DSP architecture change
> on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> physical address. This placement is necessary for the DSPs to correctly
> identify streams and operate as intended.
> To address this, set SID position to bit 56 via OF matching on the fastrpc
> node; otherwise, default to legacy 32-bit placement.
> This change ensures consistent SID placement across DSPs.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index eb9501fe79bc..6a67daafeaa1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -33,7 +33,6 @@
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
>  #define FASTRPC_MAX_CRCLIST	64
> -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> @@ -105,6 +104,17 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Extract smmu pa from consolidated iova */

Nit: SMMU, PA, IOVA

> +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))

GENMASK?

> +/*
> + * Prepare the consolidated iova to send to dsp by prepending the sid

Nit: DSP, SID, PA

> + * to smmu pa at the appropriate position
> + */
> +static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> +{
> +	return sid << sid_pos;
> +}
> +
>  struct fastrpc_phy_page {
>  	dma_addr_t addr;	/* dma address */
>  	u64 size;		/* size of contiguous region */
> @@ -257,6 +267,10 @@ struct fastrpc_session_ctx {
>  	bool valid;
>  };
>  
> +struct fastrpc_soc_data {
> +	u32 sid_pos;
> +};
> +
>  struct fastrpc_channel_ctx {
>  	int domain_id;
>  	int sesscount;
> @@ -278,6 +292,7 @@ struct fastrpc_channel_ctx {
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> +	const struct fastrpc_soc_data *soc_data;
>  };
>  
>  struct fastrpc_device {
> @@ -390,7 +405,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  FASTRPC_PHYS(buf->dma_addr));
> +			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
>  	kfree(buf);
>  }
>  
> @@ -440,7 +455,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf = *obuf;
>  
>  	if (fl->sctx && fl->sctx->sid)
> -		buf->dma_addr += ((u64)fl->sctx->sid << 32);
> +		buf->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,

Drop type conversion

> +				 fl->cctx->soc_data->sid_pos);
>  
>  	return 0;
>  }
> @@ -685,7 +701,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
>  		return -ENOMEM;
>  
>  	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
> -			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
> +			      IPA_TO_DMA_ADDR(buffer->dma_addr,
> +					      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
>  	if (ret < 0) {
>  		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
>  		kfree(a);
> @@ -734,7 +751,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
>  	dma_resv_assert_held(dmabuf->resv);
>  
>  	return dma_mmap_coherent(buf->dev, vma, buf->virt,
> -				 FASTRPC_PHYS(buf->dma_addr), size);
> +				 IPA_TO_DMA_ADDR(buf->dma_addr,
> +						 buf->fl->cctx->soc_data->sid_pos), size);
>  }
>  
>  static const struct dma_buf_ops fastrpc_dma_buf_ops = {
> @@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		map->dma_addr = sg_phys(map->table->sgl);
>  	} else {
>  		map->dma_addr = sg_dma_address(map->table->sgl);
> -		map->dma_addr += ((u64)fl->sctx->sid << 32);
> +		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,

Drop type conversion. Hmm. Looking at it, would it be better:

map->dma_addr = fastrpc_compute_dma_addr(fl->sctx, sg_dma_address(map->table->sgl))

> +				 fl->cctx->soc_data->sid_pos);
>  	}
>  	for_each_sg(map->table->sgl, sgl, map->table->nents,
>  		sgl_index)
> @@ -2290,6 +2309,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  	return -EINVAL;
>  }
>  
> +static const struct fastrpc_soc_data kaanapali_soc_data = {
> +	.sid_pos = 56,
> +};
> +
> +static const struct fastrpc_soc_data default_soc_data = {
> +	.sid_pos = 32,
> +};
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2298,6 +2325,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	const char *domain;
>  	bool secure_dsp;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
> +	const struct fastrpc_soc_data *soc_data;
> +
> +	soc_data = device_get_match_data(rdev);
> +	if (!soc_data)
> +		soc_data = &default_soc_data;

Define it for all the entries, drop if-check.

>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
>  	if (err) {
> @@ -2350,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
> +	data->soc_data = soc_data;
>  
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
> @@ -2487,7 +2520,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  }
>  
>  static const struct of_device_id fastrpc_rpmsg_of_match[] = {
> -	{ .compatible = "qcom,fastrpc" },
> +	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
> +	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

