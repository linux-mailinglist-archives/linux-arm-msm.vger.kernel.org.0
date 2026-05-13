Return-Path: <linux-arm-msm+bounces-107253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKklMlBXBGqjHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:49:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A0B531A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1B9A3093387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D348C3EF64E;
	Wed, 13 May 2026 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y7suu8JB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gs2uRsmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FD3E8688
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669135; cv=none; b=cryJSl4VZSn1gnMRrEltayBAp/xJT0uwfy9CL7K00oZY7J8Spd1noH8xhQ0kQOxBbReI7B9diU/vX19XRYKAKU8KmP0YEwO5mDpSm3MeBrkl9HyJG6xBiORGJWB13XOLAZFiWdoYgglheqVwZpeZwya9SgfN7zXVgLuMGr16c2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669135; c=relaxed/simple;
	bh=oJ2fqk1W/16s9nzcDQBXojhk/XMkE0ss/He9zlma3kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwX+7tpHe0t02Q2JX9Xxl9nHUWBbNoAnlhP9EbQjDoPx8PGaAYuv4ZJM3bLYZuGoV/KQZb+0cAG2TfrXYU/jOeAqyJYb1MqRGRBv5LWYzcmUDWFdGHICLhf850z6SWbH9XDqoCTDxfXsYgy0VPf9hMMgCNXm4X+4owe5M0VHZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y7suu8JB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gs2uRsmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mEFL3474773
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vENCCUHbcJ7o6OBuExz9lMOn
	FO5tArtUpU8fistw/ck=; b=Y7suu8JBR7AtIXRgSJaj4wd5KgDq76p/XN/VddF/
	fM4gHi1tSxjLrwBmDWg4+O9P7AIS5buRo3HCPogxKZT5jHrPTw4rhV0EfHXOugDz
	TBG8/udvCC+wHQQvMbt2Ab1VDKscp0b7h2mM8tr2yyCogUx2XTUmrqSp9nZUyKad
	UWh9u0ZGFvXzhjdptLEi7a+fEUrfVLt3gJtb4BEilAEpdRDlgnKwhDxjJRmX+SPc
	c4JkDEV5X8awUVkxUYMC4Ne5dOqTJpTjOSgaGY1Aevq/o/eiiWIna3n/5F42A2bw
	gs2TDXYNhl9iljpSxb2UTdJ+htK7+pqlKnTMWmTSERN07g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p418e9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:45:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so102361541cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778669132; x=1779273932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vENCCUHbcJ7o6OBuExz9lMOnFO5tArtUpU8fistw/ck=;
        b=gs2uRsmz9M4E73mJ6q5OoQX6ip5fCujiCQtLJ50cTdRx1qbLyHYcpAz76TMq3oQ1Xw
         9YDiZlpFED3zyHvJTnCjSfHcMaFhojEyEvBWegQ2Qnow+LIah74Zswc8swSWnoUq86PS
         8PEPI27t3jBIWY4Io+CB4YMrjhEPD3VAEi48OZaoMyJjvJTEegN6lncNGdIciqPRIIiE
         PcZ3W2/wSJHxCrGkf8V1wstP3Gujx6PZPgkQfcVSRF+ATnMAAsU3GC1sez+f2xFxPrNW
         8WZXB6h55o+djS8sS8N0KAFBFldtSDiW/xnIw5OX1dOixOqKlQwj2LheBN8XnwYcw8O1
         6epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669132; x=1779273932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vENCCUHbcJ7o6OBuExz9lMOnFO5tArtUpU8fistw/ck=;
        b=haxyc0CS4HCoynqxNswOlA/BRqKozVBCRwgt4C14zdcRW8DBVhiZq5XlYIXnmkVdde
         piw6fGnBqhu3WvXVXrbBqa9IcQ4hT+XWw/qY43WgoYg0rNEgITs0HG3JDzlpfPJQ+Wmd
         GA+OmWzp1rh1mv3V8ZiNWzOKmiWTo3pwDVyKEEGGUrt+uR/+fpE78grcIRTY1j/bx3pZ
         UWcROXvX/XExhUg8/FMdn/AzoMCdJW7wQdV6VJraWBR7ndXduCsbQdQEWdeWPdwCOjLd
         3w6SH39xD+NG8B9EtSW17RXN2/rzB7+84d4KYW1glUXWEomM3a7oJK9oDJxNDmMRFSNc
         tY7A==
X-Forwarded-Encrypted: i=1; AFNElJ+2M66jfk4yHphZ7VFy73lDJ1TV81ixJj6yhuL0+iCxNf7oAcwa+DcVroUHY/LYbUo8hwWpi/3jUne4ILNS@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoruzeZwwufpLLnDiiivMYhiOYVP5LNu9eyAwtFtzMyB9Qndz
	9JdtB20nz6/eHwiawHDPzA1DBQfs65dLFBUNyihDTVELvMUQrIVr7dhW+f6bKHlfn2zT9LcYKz0
	yNoRFALwY5a3xMzOpWFBeX1TAv9xMPnIPkF75g81lCtrlz8IgY4MmVjdtVsG+6BpLG7sg
X-Gm-Gg: Acq92OHv1T1NeauFq3Vq55LAyjBHQDtZDJHRG1sgcd0FATHl+EY5tf9dzAAbpmH3p7K
	JLV+afdgjJ3Byrrsf+CjBfTPItPhfdKAneECwlGbyZhzMpJbpjRk1v4XicSo2hX/BQwwj9iQsrx
	OA/8DVyGv7eApl86cNKp28sMx+D1Mlt5eny8PqSTnQZUGVNCDZp5i88f9SLXcaXfDzLBLyiCmRv
	HifY1E0X0t1fB15O0fPJ/ZcDfQMZpbBeoVkBYIt7IJ5APRplset2KVKn0JOHgBrpDceP3zQFvdE
	kHteo5B2O+o6llOy4rw6XsOOwXS3xMVasHNMX4XIFX34uN3+nCCGBugwEQbLkBMQA2BhsV650k+
	6K/c8cgcW7PlHU7aeEpoQtOJy2+Jfb1+J7JspSBLdKw5mrKAHYGe0qLvh0YKgmrscHnPJNKVBEo
	t8UfJgniNL74gs4wCSMWBXlcr8fwuUzma9QEs=
X-Received: by 2002:ac8:594c:0:b0:514:d48c:f69f with SMTP id d75a77b69052e-5162f5eae22mr34218171cf.51.1778669132580;
        Wed, 13 May 2026 03:45:32 -0700 (PDT)
X-Received: by 2002:ac8:594c:0:b0:514:d48c:f69f with SMTP id d75a77b69052e-5162f5eae22mr34217831cf.51.1778669132178;
        Wed, 13 May 2026 03:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b225sm3922286e87.83.2026.05.13.03.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:45:31 -0700 (PDT)
Date: Wed, 13 May 2026 13:45:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
Message-ID: <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a04564d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=Nvab_HKmlmOO6rdt0l0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMiBTYWx0ZWRfXxz6+8alT6B8R
 UBZurbF+wZepP6h2kX9H7H776zjskKE3kaWNPObhiimEV5JstmkEp6D4zuNEM+0Nt9V/po3saOQ
 z+VVktqVM/63MgWDvh6U19k8mP4uTmPn2kwomTbZCW2UzX+sXV/KPC3F5/lweWVubIjmKseVPJ3
 pyWC3fOQ0ZeYcP5XIJGqkXvbGtnQzKtIYf7iW8S1PcZ0qO+IVSBdsF8f0y9UEVe4DqmZOgbdsvy
 okrd0YXzcmiajefYsV3skIgQMQy5ZwZ8Ov/ffRKLfUyDyiQgVXySASTrqocVhyGRzmQK5L5YOdq
 7VmTjx1JzffSZUA03fQR+V+T9GxvlTIm7C/i0Jqh0D2iY8kNc4tz7FUyULLeQQgFJJMTNbgnfue
 /pjcacBRraK9h0aG4RrjCyzWjYTy/5aMqwe/GQlnSQbUm9PVPtiXnRTzVJ0usomrboxemy+rWFU
 bLYYm1qKyr1A9jzjRDw==
X-Proofpoint-GUID: OBxay6AL32YbxGRXXlk0nWWQIKdX0VFS
X-Proofpoint-ORIG-GUID: OBxay6AL32YbxGRXXlk0nWWQIKdX0VFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130112
X-Rspamd-Queue-Id: 35A0B531A09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107253-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
> Add the necessary bits into the gen2 platforms tables and handlers
> to allow decoding streams into 10bit pixel formats.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>  drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>  4 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 0541e02d7507..b6d815c01f1d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>  	pixmp_ip->width = width;
>  	pixmp_ip->height = height;
>  
> +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
> +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
> +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;

Do we support decoding of 10-bit videos to NV12 buffers?

> +
>  	switch (pixmp_op->pixelformat) {
>  	case V4L2_PIX_FMT_P010:
>  		pixmp_op->width = ALIGN(width, 128);

-- 
With best wishes
Dmitry

