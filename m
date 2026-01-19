Return-Path: <linux-arm-msm+bounces-89659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E915D3A908
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BADB306026C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BD0313E21;
	Mon, 19 Jan 2026 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+z2yB8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDY39Vi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE428FFE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826075; cv=none; b=FyibLvkI1S28AfNljgcNLS/cbLYR7Go4/hgey3Bx+N4J+5cDAVfkZpNZzJQd1VTfBXEr3JbEin4sGpyCoAgOFYGAdYtP77KUST56eb6CiqZZtDbubvs85Wx+pN/cT5fz9icqBnVdXV7DXEa1MuRTxkHLVy54j2pyt+F9giVx64U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826075; c=relaxed/simple;
	bh=aAc8NpjpnL2ckoSgA+HRiyfmb/ZV68Gnp/6N5MP/jbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aN7/L/V3bxRVyQ4MwwwCGtVIo2KVJwrQzfm5hAqUSaCT3ymJABFpA2c5BpGsKq4BE1b813vV8HInZEmU2pwOOpOsWiJs++2TXGNmIKSWl3VlsCeijSEmZ9P4W+TTHRyqykx18qOko/MSSBy1ZuGUebCMZtnvT7Om7pZEywJ8Pkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+z2yB8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDY39Vi4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9107Q1044289
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NafDNOWh2Yw0HDpwvNJ6p5kI
	hs263x8t/XdpfBo68qE=; b=o+z2yB8Ys5JwKzfiMysVNipfjtRKrDmyGGrJYSuC
	8cHA44itrDb6H6Aa7hFgB0enljKGzTROb9F5HSH1SILQKzq1QVlP9yVyjDvbI6ri
	ADJRm3kz8jLcWTqFcMjeE2Tu8qB0v1gwqBL52s2geE1ty1F5GuCIgWvME6SNDZZi
	rduk4kPIwE0Mygid/y4A6rwnCRcrT/1I/Fr70khsRZ5GE7lbSky1CShn9wpSmFKH
	8KPCfNaBSNhjL2A+qnpUPcGYM3BQ/VEarPkUEx9e/nH5A7N4mL88B5dJYqf8xqtR
	RIf5YJ7D+uETfWNxdStl91EsXJXpj9PKpxMAiiRezWNCdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ej42j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:34:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b4058909so422716685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768826073; x=1769430873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
        b=VDY39Vi4qBJuNWWI3NCuw7lXr+OLrH+DOpZ9Tl9YoEiGjkdT6pMe01tdWWFBUSWyCY
         ME81/Xbmed607gQ4DqDMY/4l9dV5Jj/asqaNsDzCcIUuIMQBESu+5esn/F+Wrj2ykYfo
         Mnh1iebxcXsINfCr3oQcOZtEBL2pyGOaWlofRCxcdb/qpVj4imkN8KdaWHUDwXLUUi5h
         X2ZHu0dAbrgd9srQSr5ROW5Iqx/Ze3WdujrFZ7IRqMzyR3CozQNAYi9PWYekHWuWAq8S
         +N8gT6pOkWXxRc/V7uHqsCkJhSjxz+C41SOUwnW0Qeb5TVQZLaYbR2OqKu0De3jBhhfk
         7+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826073; x=1769430873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NafDNOWh2Yw0HDpwvNJ6p5kIhs263x8t/XdpfBo68qE=;
        b=lcg2pMw0ZzBe+1c2vrU4v76YnWjrsOSxV+sjCBqJMDbIM5AJIJZl7pVYKlSMMyY+sD
         AUXvBRFfYBbwnsYre9JKAct8nQWPwPAIlEnAQGbBBBLgfomfSo1KDTXRsPvvPBNWzaxa
         IEim9BuW6qVaaPNssUFg8kFfuzj5F12F5tHtb/q1Oura6LU/NDD1FhY48KM57L54HbDp
         D0jmNsOitK5xHrUgqLlVUAUGYgAtu59Rfq1XnnE9P3jb1aRdpwUN0LZJoGHBEeCKg3am
         8opSVdBSgrBC+Th2pegn32iuBieWxQ8ZbQQd1KHzPxhkP8A2bzgvNAqig3ALI9nvl9sW
         MRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkXbGDqe6s2liNYz1HN5wad5oT2IG0pn+ZLUVC+svwlFOCUhh+yz4B5MzN7n5gGhAtsn3bw1DPfyDrXKyP@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsavEOATgAWSMlwGQVCQ8QwyU3XlOPgR2utvIM13mbk8RQ3nk
	4PweC2xW172tU2teDMmvrbbWBX0JERO8c5HUvY7UrUfve0fa/aY5Hp9/OHCd2gmKf5zMZdbQrAT
	AvG6/38TNuuPsvjPU/hEUMaePkgzioI1SSskRUKNN0ROQJnPbGM/LgmabBEnfuX0I5NEu
X-Gm-Gg: AY/fxX70jDIqYoSezeWSdhEqd873S5UqyNYJzd89TuUd/33CXLtXzZCuIFN/+d3DFeK
	q08mQnln0ELaZP8b1wNp2x8ybr/ufhGf/kekxMqT5ke9YU5K2hhv9KawxQjP+QvsNw/1xG5HsnK
	t+drwL4EgY2aLlH46qTrnha0ZqrNyGFAzT4equb9V/wD6HwbXzoEwmHOgKr6DteOjWoj7RaFV3J
	oVk1cUtALWESI6ZwnsSzfNawB6Zbt86Rn2TcwIy8yiTu7xUmyCdzbA4AxE3w5stEGrsak++WAJH
	0Wx/ojfCpxkmvCrNkgPvpD/A5+jB/W3geXxX930OfZsuHP5rBB7NtmirRTSr4rpPTDWrhOGrnLA
	fIbEMuPW/Pia5tPC6DGrcRFJ6kyCc0x+LD93yaqWx3UnObl7FDo6P7a/GnMt1a+X7ZUXNW2swu6
	7kRp8+S9DjDfl3450T5fm36H8=
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id af79cd13be357-8c6a676da9fmr1441157685a.49.1768826072689;
        Mon, 19 Jan 2026 04:34:32 -0800 (PST)
X-Received: by 2002:a05:620a:4047:b0:8b2:7726:c7cd with SMTP id af79cd13be357-8c6a676da9fmr1441153285a.49.1768826072151;
        Mon, 19 Jan 2026 04:34:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm3340662e87.66.2026.01.19.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:34:31 -0800 (PST)
Date: Mon, 19 Jan 2026 14:34:29 +0200
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
Subject: Re: [PATCH v4 4/4] drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL
 programming on UBWC 5.x+
Message-ID: <3cvigxba6lkhbolzf4hsdn4a4psvkvqeaztgjkd66ctkuaykyk@jtocgpnugygy>
References: <20260119-msm-ubwc-fixes-v4-0-0987acc0427f@oss.qualcomm.com>
 <20260119-msm-ubwc-fixes-v4-4-0987acc0427f@oss.qualcomm.com>
 <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35fababe-11ec-48a8-a6a1-d1aa1ab95dca@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX9ATOB4rr8s4m
 T8JPhrT6G/OJ+x4MI+a4LzHonp4GkBRr85MYFlJkoUXEvIehSC2iWxrEsmfEPqpVmWw0psAzKkI
 7t9HyiAHwdmSSM7JdThZLsHeA06SXbyXueCp3usz2HI0Yh3gQ0vsMHKMDgey0Dsn9aqpr/gkhkb
 6QSUHq5+3LirTUJ86ci7vcvPuhJdynDmpQq2LJZ0kNT7buuwqCw2XTBnC1YQcn91x2wlpdjgQsL
 89hvzIfMFBY3GIkDvE8NzYqNoTOpQ++SN9FI5HFPvsFpEuBKl5LKwWlhfa4LrtYcyaS3Qk21ckm
 Z1YvTkRkDT72fOQPqw4Ab5gxUkKgOERfhTnZlLZJvtOWD8ElzjTytPaTWQmWzB5/ZZZ/XLA99w1
 qS84r8j001sZRhR9dh1dQDW4wwKOQKfQm/RjlpUJDtZBubZYXNdwhXgg2kWKUMUSqPe4sdnferu
 4Sf3i7RIrgthtS2cbMw==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e24d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nqBBLIHtStSxbiTUqcoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: H9UMEx9-J-JBdSEkAx1eSI4VPAGONKzR
X-Proofpoint-GUID: H9UMEx9-J-JBdSEkAx1eSI4VPAGONKzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190104

On Mon, Jan 19, 2026 at 01:24:58PM +0100, Konrad Dybcio wrote:
> On 1/19/26 1:16 PM, Dmitry Baryshkov wrote:
> > Code in dpu_hw_sspp_setup_format() doesn't handle UBWC versions bigger
> > than 4.0. Replace switch-case with if-else checks, making sure that the
> > register is initialized on UBWC 5.x (and later) hosts.
> > 
> > Fixes: c2577fc1740d ("drm/msm/dpu: Add support for SM8750")
> > Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > -					BIT(8) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_2_0:
> > +			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> > +				BIT(8) | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
> >  			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					fast_clear | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_3_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> > -					(hbb << 4));
> > -			break;
> > -		case UBWC_4_0:
> > -			DPU_REG_WRITE(c, ubwc_ctrl_off,
> > -					MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> > -			break;
> > +			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
> > +		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
> > +			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
> 
> This is pre-existing, but BIT(30) is not unconditional in SDE for v3

When somebody adds inline rotator support for DPU 6.x (SM8250, SM6350,
SM7250 or SM7350), this bit will become conditional.

> 
> For this patch
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

-- 
With best wishes
Dmitry

