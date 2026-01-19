Return-Path: <linux-arm-msm+bounces-89624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E373D3A6DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B9103091B22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9944631065B;
	Mon, 19 Jan 2026 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MM31kRt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DrA4vU0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7430FC2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768822066; cv=none; b=rlTdduvtBMQZRGWh4rbp1j19b0xtCNHSMaLYxlq+FuHlduXH09u3S03zdpyy1aR0vM3WInTcP/uQAst1/wEgYD3yK/+Ogq6vtfjEp4IeQULfpJmUTjc3TO/ea3d5NCeLz3kfZorBmm525kSn0eZ13vbOsq3GQY7fi31JLHwUY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768822066; c=relaxed/simple;
	bh=/fRgpPDFrFjyPylu72jbzbQOGgll0O3VhJWFU/lUqJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8eQgZFoNcxNwecZ9odB/7FL2KzHhT3AQQqGFWGl0KV2Ou+bd6PvlFJYYAsZ8PE1dK+Z5kCgtLOXposABxK/D5sushA8qVeTviEs6jI3yLKbgfnG+QC8a2v3c5durZ8mxwxyYdxI/uwwSj/ZfOn5OHpUL/a7KpXC2JLznYlMBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MM31kRt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DrA4vU0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90gMH227781
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YuV0fhRi68aQUo3arYwp0jdp
	xbF2bng4GId0KIEDBMo=; b=MM31kRt3LRCi0X7MXfkvoUzuW5Liia/0wuqyKjRd
	DtQtHzrFoi/UEj7kkpM7mAzCrJusM/zWH1Tj0dWBfytE20pUGuEBZwaTeXswbi4c
	2FcrQc/SLI8t2c1CYZvQqrO2lw3zXD5azw0zvZAGH/GRauFlrpSuGtGV3ipQ7v3L
	DPr2iIrYqVgbaeDFZc1TvBF/K/+ddPQhW3sWEdcZBSIzCFnf1DDG0OhOje4uWUAi
	2simUt6wBA10a/EiOSZ/5SdO83wsoM89a/jMojHGfpcClZsZdHGP65Lyk+MRaGzZ
	+LFcMPRhY9nixmu7gUGK0ePgx0j/7W6G2ODlmj71XgjtYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8rkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:27:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so936906285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768822063; x=1769426863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YuV0fhRi68aQUo3arYwp0jdpxbF2bng4GId0KIEDBMo=;
        b=DrA4vU0gCShV0o77OeWIOjmdBfqUCNUVyJ+waoTUOcSXg+U/bfQ/9krQIx7oBNCBH6
         RRNfceh5oun6pUVArZmy9RieZWvpdfwjwfWusVH3m3TJaaBgWWT6QC/7BiQGjyBjwwKW
         +tJZig6BBBOfqLklvaIMtO+vB7kXbfj4V/d5EptdSJi2/zl18cswBntsoWf26FXW25uq
         01RhTGWwxffUulzkGoyrQ+ilQ7UdDzm9KgbxqFBdGPCk4gXhm03ZFCVYq3bvTp66/PC7
         6jcZA03BXmVQngvy/KydnuNIqjHJNWpcoEhiOFdsyb4tPOn+u9IaGIWE738ssZ9GVYvx
         s6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822063; x=1769426863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuV0fhRi68aQUo3arYwp0jdpxbF2bng4GId0KIEDBMo=;
        b=utCt63Xwh/Ud+AxfbXrCbYTzKgMSw/YbRzWVlJ2WmR2hXOR7tk9MMsqm/M4gD62tiL
         Pibe6jn86AEdUMWRezhuKmi7TRLMhc7zVYkp1gkgg8WskHX33ifGsCI79GVf3fuyEeAK
         TOdR9eJ+wFmC5BRHs6JzxMruiAvG8YQCL3nEZuCXmg2OElI++GmsM8JHWsv6ttdh/yXE
         5DBGFztnsIbjXyuDdb50der5zoBrAFivMWlbfPU5PR9hruc273HqMjN3z1jE4TdknfJG
         wB2yOUitj6vXXbz1J6Y8ep8CdXelTmbbAfjknMS77skydBEVUzGl9ERpRylAsCC33oTl
         wYBA==
X-Forwarded-Encrypted: i=1; AJvYcCWBu9oMDuZdU/skDIuvSgip+UDB0kPTO1SIVUru7M3H6mk6B/HcD4mFvh96NQSeFNcNI7vI0GzbjRppV9W3@vger.kernel.org
X-Gm-Message-State: AOJu0YxmEMi72+pPJ6jCypN9GRMAe/B3Ks/67tjRe4kavmLWYlBkfyH4
	QyqUqfRwzXXIQPIbsbkKVqFww5p0c/K++nAAQg638doKSARLNBRuO0QSuej1dxgZuyVirAeiYWW
	0nR09vyxFrlhu9vdcmwWhc9H+W9we15jD3/ErmAOMY4KPtF3Fz+OB3JjvYQewqtx/gonI
X-Gm-Gg: AY/fxX7TbcyJgG11PFeknVayKx6CnFgQV1VkUwO9+ObAs2QVyoPi6zrPDGJY4uqdLub
	Y8GjOvwpLwHoNKeRxFgXNVTGBlIS3Vd5XO1d79HdBBYokmoDToCakWhE6NmGXW22wFjOU9ZEiXW
	zRSj3SAcOIawRnFXqhbWGcWxBWpMVnCQBv1HtQOmW0Fmfdlsxybzf4yw0pcwxxfSIAThe4luBTi
	zQGIVaFAKUq7LCTGoU42UsuWndH1aNvRTNeTB+TRyi4MCDeiJjlcZvlJdLM4yyTpXnjPus/py9N
	opiVqQaExNPXX4gUTrmAm9Wq8+ZLg/6ra+BzK/olV3QYrcVsTjtinrz7N/x5ZaWkHqc3kb/aEGV
	VXyT1ZMHOQwGSZpNaXTOr6J39L8T+cibt9LFXVmAVq3msnpUcSxuR7WMB5FOh8hyNL34MGP6Xav
	5Sy+TM3HnjPyYUSLDJ1R/huds=
X-Received: by 2002:a05:620a:4492:b0:8b2:76c6:a7ae with SMTP id af79cd13be357-8c6a67703f7mr1563568685a.50.1768822063442;
        Mon, 19 Jan 2026 03:27:43 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8b2:76c6:a7ae with SMTP id af79cd13be357-8c6a67703f7mr1563564785a.50.1768822062959;
        Mon, 19 Jan 2026 03:27:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ed36sm3270117e87.18.2026.01.19.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:27:42 -0800 (PST)
Date: Mon, 19 Jan 2026 13:27:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL
 programming on UBWC 5.x+
Message-ID: <fnlkcpf4dfgcy4cshl6g3ibjoon7pvdxyvmejokqygfyc2b2v3@og2xzf6fzuhj>
References: <20260119-msm-ubwc-fixes-v3-0-34aaa672c829@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v3-4-34aaa672c829@oss.qualcomm.com>
 <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc944b3-8a41-45a2-95c8-c55dbcbf0830@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zrfp-xk4nyiXVfzOhmYRDaYYsnxPnTpi
X-Proofpoint-GUID: zrfp-xk4nyiXVfzOhmYRDaYYsnxPnTpi
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e1530 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_JD9MDjJDg31YIc5yKYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX+lBaXQw/B/BI
 s5yLn7jEXs5fXuo46RtQcJwfO3VzSDclyr8iktyGqIojweB0i6qHzzSmOj4fcUOM+BeWEp8reA1
 1hIpBXPEmm9TxZyYdSgwZnMtNoy2AFdndGEpLr76AlJ5D6qzglKTLQkMMiogD7HzeMClx9Mbruq
 zXMljbhCoQqOmbVlrheWaZYnrzb+Cpn2R2d0EwvPP1vbcO+sQfdvMrR9Zzw+CrvhrpgalEunBBF
 yKAwqhzldW8uHmyuwjkvabA0rOdfcMBnEJnX3QYwCV2IL2JOvJlTIj5JLlNl7Dp14BVaH1k3fPO
 gDWw7nr1sk6hO1uzY3CAo3s+ipZNKUmSJZd5iuML5WTQgoTUQnIglYvZiIeBEeQJG2YRNniF6UC
 RFaj2s4me3INmQpQde5Qpx9cUBweR7h7Eu/f3YJH0Fc1281yiUyXm/cs3Wr0YAIqkuk9klmoslS
 kQQX28Fm59soRyHEdDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094

On Mon, Jan 19, 2026 at 12:08:07PM +0100, Konrad Dybcio wrote:
> On 1/19/26 9:17 AM, Dmitry Baryshkov wrote:
> > Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> > than 4.0. Replace switch-case with if-else checks, making sure that the
> > register is initialized on UBWC 5.x (and later) hosts.
> > 
> > Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 44 +++++++++++++++--------------
> >  1 file changed, 23 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index a99e33230514..80a9fb76b139 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -279,6 +279,7 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  
> >  	if (fmt->fetch_mode != MDP_FETCH_LINEAR) {
> >  		u32 hbb = ctx->ubwc->highest_bank_bit - 13;
> > +		u32 ctrl_val;
> >  
> >  		if (MSM_FORMAT_IS_UBWC(fmt))
> >  			opmode |= MDSS_MDP_OP_BWC_EN;
> > @@ -286,30 +287,31 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >  		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> >  			DPU_FETCH_CONFIG_RESET_VALUE |
> >  			hbb << 18);
> > -		switch (ctx->ubwc->ubwc_enc_version) {
> > -		case UBWC_1_0:
> > +
> > +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_2_0:
> > +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				BIT(8) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, ubwc_static_ctrl_off,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > -			break;
> > +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> > +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
> > +			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
> > +		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {
> > +			if (MSM_FORMAT_IS_YUV(fmt))
> > +				ctrl_val = 0;
> > +			else if (MSM_FORMAT_IS_DX(fmt)) /* or FP16, but it's unsupported */
> > +				ctrl_val = BIT(30);
> > +			else
> > +				ctrl_val = BIT(30) | BIT(31);
> 
> Can we name these magic bits?

I will raise the question internally. In general, I'd like to start
shifting towards generated reg descriptions, but it will take some time
to implement.

> 
> There's 2 more bitfields that I see downstream sets here (but it
> doesn't claim to support UBWC6).. 

For the formats which we don't support upstream. I'll add a comment
here (and I probably should send another iteration anyway, fixing the
error register too).

-- 
With best wishes
Dmitry

