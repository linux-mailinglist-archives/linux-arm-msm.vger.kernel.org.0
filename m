Return-Path: <linux-arm-msm+bounces-79290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D47C16FFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9421889479
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5915350D63;
	Tue, 28 Oct 2025 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyzmT0E2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="St60gymg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AADB355036
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686647; cv=none; b=XZAC9r5dYHWjz+AoNWQlkIbbNzzk1SRU10VB5CDtbRhR7Y2XVVUO0uIdiquRrvnArUGXGPUVFZBPhkQKzakju+ik21IOF9wQ5mTxcxGJZSWj8zWFLp5TtF1tPr2GQklqVBRk1fZ0GaK58qAFyppjrWlffJM0sLLiV12PPYPKsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686647; c=relaxed/simple;
	bh=4n3A9q1y6Wg4cwx6UGPOep2eOOOce3iW1xgLNMubNV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPfmkvaT1+enarAImOfUqRhIPP7WzoIWGv1mDBFbDd7B5RbRxKBFc58hyOLh8H3vTYeTTXAq3lU8IXRa843HL+TK87+DO5TaJPKll0erzvA3s30GDJQzmRNY00fDdgA1xRD9xWTBYkclBmXYQVIKgUqcBpXcg3FKTP+3TESOGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyzmT0E2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=St60gymg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlA752616640
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ABfUVFah1hyptug17CT9PCLT
	6YKSwLKR44p2mhENPxY=; b=nyzmT0E2zUZcOTuJNcY9dPI/G0QV6X+vN1PlNWiS
	hEVln05paPS+i65KuvyPhRfjRYAXkmg5L+mRskypLVCLxmlfnKa2dchwJ1r48hA7
	hY+9nSiKsVIZASoObXecgJwnPFB5SUAItW5KKwAxH4MfAHcoI5NVo/3yVZWwX+VS
	XmgE9Bp+nONz+qTjmBmDwzsILtzFTckjj6G00vgWY1/edOhuV4+Tj2ZaNvX2Ixdm
	H6GDFfMCkfBhy/6OiB1fBT6IB68cqMKVfQpRSB9pGaolPpWgaTJ6GhLvM7k94XEj
	WjXXYFqWKkMs4GqYZEITm5Iis2f6GTVfVC7C82Vzxd6JhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y07hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:24:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e899262975so202261101cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686644; x=1762291444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABfUVFah1hyptug17CT9PCLT6YKSwLKR44p2mhENPxY=;
        b=St60gymgZGulAeqnPHReeP96ElbrVHz7SumhurCMPlcyy8nd1A9Z3AdxZcn8I2yTCh
         SkP7a2ByYef0+lOnVxzPmGIJbRfsNnmu6HSLDoFU4P4Hk06cF1kV94t/hVdrAtYZTgD9
         5xVtS8SpiXG3FELhIhudCO7KYATzN09e8iV5ZgbmgWUX9noeg0H49rUlL80Fs+ITkuXZ
         9ow5i4MVOGngQsszKHouyTFZK0a8/m6Xrg2NLceTY7vRqRagAr8QSkVyGWnnKutuAf5C
         LgGILdDHUwNu279QADuojtLxADMIojIjGnDzT8yaJpyVjxzX0r4EnRJ2rxG/Jona6R+0
         swNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686644; x=1762291444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABfUVFah1hyptug17CT9PCLT6YKSwLKR44p2mhENPxY=;
        b=wloJf2+7pnf/ki0PSOE35zcsPjsTwmjeABTdqYAxgpWuWmyHUBg4QNwaC8mD08/rSj
         dcLz4yDQzVp76piLPiwFAsYP0k8tpwbV4dzpa6Tg9LrDIHxBfmI1/MWJY50/+V3agDDa
         kX6XeaVb3zTV4yx/KH1rpA5L33YPUbq/pqEliJ2s9iBVjT7tXWnzKABkUbNiKddGnF2b
         +ZNWpmAKNcLZvRfroI+SyFzeHs8HiZAb0nf2LBpE8TFyOKk9uiAIZdi+2mg852hZS//8
         +S5fz//bGhk5jtLCT9CSc3cm+xPLgA2pTXVvPnLoVhxjMRln5mXdUgpEwHgv3kMM71oC
         WUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX4khZD3UED+9cc+0e/3h0S/7GUAbI+NrQR6ikYE2TLMRTPbVtTOiOsfa8u7eJgykDH4WTRTvb5B7ohVLr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mRtD0wG8Nvijxt53/9cYy4x00kkbpUQ8a8qprOdCtveO1eEm
	+rgFv1KHuLDeh9mMuRix7dNenjCDXpqBm/+r2uKK2ESXZahQwgjj/cYXTThfhLMQWQP+oE5xQM3
	pxcOUdt/z/nC5QSWnLG+6sUugjk9DA+P91JB+iSs4sawBrM5SUwBfrKpYKN3MWCgXuEqp
X-Gm-Gg: ASbGncu2UzP1iD5gSesFpt818pYsbgmFZoItsc+DpgV4zyQ5lehhFtvhG3d/d+r5Ikf
	EUOTFffEHEiF+MuAn1YfjnqJ4qMQ63/MDSDVcqw4S27i8fbBhEdREoTWxINY1Wi9+O5fUW7v/3m
	ygF9AW/BnYKa5sV8VvdW6tiD2x6Wvz/8bJ52+mH+rDq3dFXnkJqM0jqN1abjq8nrpmwWq45qvAw
	68jOp66j4mzAPFofThSCFPGuHbXigpaWv+wWdfoWK/pJPv/gyPD/wMReldliJNzq4pUGK9fe2Tp
	9kB9qPXPe3snSYwFkz9feoAGib0JFR9Oc5ER044tBofiJMZHAdYNqoEZrMcBTGHLmIxDrN9tr9c
	VShwXEeo+01kfTe0swRrJbj9zPzBWYZnC5JTQTqmocykTRLkzhAniQo8X8U3WDY9WbJ9OMC+aWS
	yhgzARrCfoBUyF
X-Received: by 2002:a05:622a:1c11:b0:4ec:fb62:fcc5 with SMTP id d75a77b69052e-4ed15c04a96mr10327051cf.49.1761686644173;
        Tue, 28 Oct 2025 14:24:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBhHm7sDSm0SNn4923M5bA+i3GKL7HcAL70JWJZ8fxnsCfd+ylfQkS7TGD0NAfopfgQklzAA==
X-Received: by 2002:a05:622a:1c11:b0:4ec:fb62:fcc5 with SMTP id d75a77b69052e-4ed15c04a96mr10326691cf.49.1761686643711;
        Tue, 28 Oct 2025 14:24:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59303ec8b95sm2955835e87.98.2025.10.28.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:24:03 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:24:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/msm/dpu: Fix allocation of RGB SSPPs without
 scaling
Message-ID: <5ijdhvmmqgt3xdfajgumv46ifsgnt7h4amtrbfoklcl5do4xjz@ks4ufzfzpyij>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-1-40ce5993eeb6@gmail.com>
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=69013475 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sCrT992wuxv5weLG16oA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: B3cf0DBPFauzN3Cz2srMMRAQ0ZV70oKE
X-Proofpoint-ORIG-GUID: B3cf0DBPFauzN3Cz2srMMRAQ0ZV70oKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX9fXu+qriKs1C
 R6Y3JBHYahX3TRA4JqgM2ZrOUZvFh5EFhK71kUcdP+RmDG+WYvX6/DF/c/kZKP7TT+MuxCnoovG
 eyMzl4tJUW1kqVKAsAxW4913pMUGiS+PDZnXGdSKN2ChWvnDU5uxRA6glN9qerqWVpUc/Pe0eux
 n5IrNLHLt22dvfqiLBRE/h3bxNhMn6XJDFz+M5qhNf5DWulkQlo4xUQw4Xpb6+kGFmFomR7Tx72
 amFM8BtATKcvzWXr+FSJPm1Fj10hqrxkCrae0LHmN1T0UObzGB7ZdCvE3ffdJrP8yycgit5qp3x
 RHl53yeic1+eKX7/hvQgKTkOyEVj70KzuTSDypWYvXrrZgV1ZZFOfNKg0g+9F00AsVypH57iiz/
 mlQ3lpiq39WG2boDLRBQ3LO0DqtqNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180

On Fri, Oct 17, 2025 at 07:58:35PM +0000, Vladimir Lypak wrote:
> Due to condition in dpu_rm_reserve_sspp, RGB SSPPs are only tried when
> scaling is requested, which prevents those SSPPs from being reserved if
> we don't need scaling at all. Instead we should check if YUV support is
> requested, since scaling on RGB SSPPs is optional and is not implemented
> in driver yet.
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

