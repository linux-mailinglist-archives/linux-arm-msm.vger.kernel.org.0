Return-Path: <linux-arm-msm+bounces-71475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2200B3F38F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309B21A84583
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03772E11B0;
	Tue,  2 Sep 2025 04:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9SeDsfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527DE2E11A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756786348; cv=none; b=P1uNERTFRXKvIU91Nw/q/3maS9m7MiGcqU7PFdSmdznEbpqmMysNiRsVU4fV/zL/nRB9+CyCX8wXETgMAsemuPr2PKg39l2zDzEytGJkdj0XjBXxcJKrLMDrB32Gp5o676kXxeo72eJFIaEthUaiQrPioHBWl7bgCjuAJdkHbmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756786348; c=relaxed/simple;
	bh=zbdpW7G8dg6+El5YE34lASj1j6xTuEzXUpc9aYPaKXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LizXuFpyk4wIDRL6HDVJ/xGalXm6lyryBYbw2yKVI8DfZttv59g8O4PXJ3CRiUrOFgwkoLxYM+mLINcD5E4EF2BYckFg+EMPZI9+07U9stzOODHRax0YVeUpoBIT6uklx/k/MvX8ZXZyShHIoXbpJZj19OC+8xYAa4FP3TbGI3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9SeDsfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SLVK030358
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4hytzX8xBTH7gMfyLEWCSqte
	MJOdC0UJlFb3/TsaAvk=; b=Z9SeDsfd7UR2aP6UdZhf4hrBgbBGC1EzAHPEkhDA
	D/pTRAWMyO/YqiQDK7WNra9wKwIevfeaO8OJ6sSVsOK5kVc0JU/XMBv+4iD0jD04
	eyiU70lUY6ligxbRzieTemKS287oDglSpqF3GzqOr4UpQZS1PScCF1dhtSvHFRSZ
	H0JT52dXo3SHy0ZZh9gixIBAUGDz5oKKGH73zEU7KRIWaOnF9rzbY8HGuGzsHLdD
	02XagceP1tFhJAEwZGZijtOtJyVYvS7IZwzsYz4S41stgJkPXs+AqbNe2+Rgl04H
	s6/6LGFP9jFO17iKFRb7tBwAKk1rufKIpdqhoEXJZoDWZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy28d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:12:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b308e4de16so114749891cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756786345; x=1757391145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hytzX8xBTH7gMfyLEWCSqteMJOdC0UJlFb3/TsaAvk=;
        b=gbW8QKsfM80vjZOglqLSjGM7vJ7lWSDBg0Duq17565C/sUpg+ezLPT/kKtLg5zhvcO
         UOjTeOt0P9Ofaw1emMKXxpxwm+3KXvnqfDPBoL3vt+zCLI0taZJlndc92D0a8iqooSPR
         n0QVMSaeB0K0rKpH2isFO6tpWABl8cFet7XL9DLwOikzQTkl7c3CaYIajtDDC1PMTA2h
         ljL6FijUWImabcLWEWAbne55LC0wT/TlsukWpJzX8eeVqWNuO3glA2qljRU0Ir2ueqa5
         fgdOoOWFeI/ckirTIOapuzTnhqL7NrqpdwSj6s7rsNPkmn3z67dA+fcepWZ9hv6f9dxb
         EQTw==
X-Forwarded-Encrypted: i=1; AJvYcCWHCm62xRQUtV7wZNWsqYxjr5yyglMy1Dc0GWf6WOKBOJbuqJv0mh+cf0dOjBIfMNPB40VvFYUeBwVSGHKK@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMY29Nwj6Gwpv5Rq2W4cEXkqqk+KoaaXAmyYmYcQ520SNXXUL
	B6Xexv1qBYCFXE0XxLDbK4ja60RjzGu7YTqTLHJJnrk1/FARzntDbMw7BLDB7O+ShcvQsVlPPZf
	esboBpjfFk7At4kfq81c4f/9DerekHGPMINWao5cGV68nmFZZGpRf+q8hrM5YWvbgEDOb
X-Gm-Gg: ASbGncvzbHbfHW5heYV9hVUtcT7UxUZPZB9BCm6P2caFmTH6mVD+savEfYJAp8fhT2y
	kxPxNYnX9Ts1sH7mFuBan6HJeEJFr4k/SMOnxQkug2PAaI0WKrHFucs7etLVb/7rVZ+Ue+zZT0b
	x6h6Ie4Sj4lGmvhaOKiUyR44Pr8WEwLfkDVAGH2V1GHjmS5jzW6gbSEOep4VU3EfGZAXVwtFsuy
	JWjPOIbhqz1I4we02WMwyZnkFirZ+BnYxUW3x244cRMAMJRrKDGCg80Y3XB+O8v6HTS98t/aea6
	11K2A4zD/iGcMqeC4s4O2W64mpIAVUcD5ZmUXLCGNnXIeftOCkHKSdp1R6EufEQGDTl4C4UUrFK
	FT/GrhyzygS9jOEqoEsPr3iZ2NQ3dhcG4Bg5gAujDHmttF+yjKLjB
X-Received: by 2002:a05:622a:1452:b0:4b1:dd3:e39e with SMTP id d75a77b69052e-4b31dd23338mr114026671cf.61.1756786345090;
        Mon, 01 Sep 2025 21:12:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ5ZmDCtlOCTJ5CNy/dDBkom0CRsWFzCNRi65zEfcrO5jaS3sB1mwTAnfyqabE66OpLSYXiQ==
X-Received: by 2002:a05:622a:1452:b0:4b1:dd3:e39e with SMTP id d75a77b69052e-4b31dd23338mr114026441cf.61.1756786344501;
        Mon, 01 Sep 2025 21:12:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56082793359sm352715e87.88.2025.09.01.21.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:12:23 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:12:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 2/3] misc: fastrpc: Update context ID mask for polling
 mode support
Message-ID: <dqkd4jxzrn4l6notk45udbapcan7icph5lpaoccgenm53kt4me@n7sv2rnf37im>
References: <20250901053336.3939595-1-ekansh.gupta@oss.qualcomm.com>
 <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901053336.3939595-3-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b66eaa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ruUdINtktsOv1bkmipUA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: d3V6KyTxCnIN4Fork0Q6SMWPqwZRwUVR
X-Proofpoint-ORIG-GUID: d3V6KyTxCnIN4Fork0Q6SMWPqwZRwUVR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX3W9Bg34Z9c5D
 7+UcbIiI88yN4i6XGjjYp+b1L76p0jZQ4guJlW17t3dNEP8byC8+ZY+kx+rN6f6f2eK0F02heoI
 NOKn5Qcj/SEsOmkIRyyr0CgE8gxzX6phjzBCnTnl5GETI4boY2q1UD086hravEoCfh8mqQgz2l/
 lScK6uBcncVzewG9YwuAJY6nNb4+6Gojq5+qG+eJ27+8rVydGF3lZlEn1lqLUPSvqShtXL8+9K2
 c8WLcifFz+Imo/ARZH9dIg7+T6NlufZM7WdOnsPVerwgYBiKFVGB8yit79Bb5iNQWY3Zmac9gZy
 q70HSuSTivbw6CBd5c1J9estK+ihVpzcmX5c5DT6u2GPws5yEomlzvGB87j0VbadHQpDZoInFPU
 LQCFjIGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Mon, Sep 01, 2025 at 11:03:35AM +0530, Ekansh Gupta wrote:
> Current fastrpc message context uses a 12-bit mask where the upper
> 8 bits are context ID from idr_alloc_cyclic and the lower 4 bits
> represent PD type. This design works for normal fastrpc calls but

FastRPC (here and in several other places).

> doesn't work as expected for polling mode. To enable polling mode
> support from DSP(DSP writes to poll memory), DSP expects a 16-bit
> context where the upper 8 bits are context ID, the lower 4 bits are
> PD type and the 5th bit from the end denotes async mode(not yet
> upstreamed). If this bit is set, DSP disables polling. With the
> current design, odd context IDs set this bit, causing DSP to skip
> poll memory updates.

This looks like a description of a bugfix. In such a case, move it to
the start of the series, add necessary tatgs and change commit message
accordingly.

> Update the context mask to ensure a hole
> which won't get populated, ensuring polling mode works as expected.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 0991ac487192..57e118de6e4a 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -37,7 +37,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF00)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -487,7 +487,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 8);

#define magic value

>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -623,7 +623,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << 8;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2449,7 +2449,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 8);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

