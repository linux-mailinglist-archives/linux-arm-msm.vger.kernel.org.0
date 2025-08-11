Return-Path: <linux-arm-msm+bounces-68320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11CB205AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8563018A29DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9BA2253E9;
	Mon, 11 Aug 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuQzg8J+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0274623C518
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908509; cv=none; b=qZjl8k056OGmR6NIVfBeuWH6nWbpXZh/UqsxpeNANWr5HxevKfaDV0B4a9BWQeLB+bVmTd0lqR8apB9VP1mMpHisfldC54mWEjkL8Rs2gOFU3wDXCPpe25IQms3qJ013NGEzA5f6nEdf+wmROpCQO7RInfei/yUOQcPk+lXwHxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908509; c=relaxed/simple;
	bh=bmQlxUXXqyRd/mIf8K3AoOou+MqJRLfIh/bynmy2eE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ti9TLMtCXG2cNqEggCq/V3RQc4yg2Gqveu1iyPPlYWyX02wutp9CUMUk7VYIAZMT2F0oWEo3q68/DDv6Z5j3UTbv1jngqOACSIuB6mCzrbaTma1w/Is0AQY4ypLTqFncUYvWxINqpaHqPU/GFDbIbdjFf/0LLCSdQOcXFq2mgf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuQzg8J+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9kB000643
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PE6gchWgUhiQ/wADu4ACCMtr
	JWOkRrEv9QXoDjpuWRo=; b=TuQzg8J+9bNzLvszHl0wheo/9IGGjtChvXLsCwO2
	y73TqgwF55KLwjVWLrhBwLXoggVdelQUYVadf3P9rQ2TlQWKZ8w8SSneV85Ui7lH
	BTwIIkYjfXO6wAbWxelBGfn7KV5OdBcaCuwYBAa+f0L3+M/Bo42bTqJL99e/751s
	GZ32yVAC8gi7Ywwv9hQtlURN4ndCWg5np1NQ3rh9IbLy6j6QJiCZoUVDfntaEVtC
	NXf6yNm5NaUGMWSH7opBibEBjmtgbF0bbcnzEM3NBaQ0lb6F3g8W4/r1qWVstbGS
	rWsMxs1Yo/15XCANUnJj9YB+oem3thraVjryUrp6row0eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0add6d192so61638121cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908506; x=1755513306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PE6gchWgUhiQ/wADu4ACCMtrJWOkRrEv9QXoDjpuWRo=;
        b=sA/txdovhKBuuEmRQtJb7dHiPpG002AFDBXUj30ZrqhUnb28WgNVd3BKgAigL+0p73
         jJh2DNpfsr5Cxbtmt6zGfkNRyhwAF/2MYunGJ71hrC37ESQDgS/vpT8oBTKcB8PxOJPE
         dU8Hp+gHrVSsP/CwT+pOpLpfNrim9Mk8YRgknwXq3ApMZ0+sQbW8EigeEZVzSmNRTIb9
         YR1ag6x+TPylQMKtX2wjLTYH+8nEAGZ2Op3gjpCpriZCZeS9WX+A8nUFq2p60+z7pL0C
         6peQuf/TwDVO16bj5F7bmb6+/Dyq62+F8G6TTSUbXH0TVrPF2f8US7c6BSw81fEhWnrT
         aTcA==
X-Forwarded-Encrypted: i=1; AJvYcCXbb1NZ6wA27ZSaTWrC0daBS2QXfEtAQAQLozn7UpISR2daOviQ8Xo7hdqsOwj8ngo+SuEOZ2kb4yRoNulj@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsHXeEx7fxRXY+h9NCENtnhksYfl7VuxBdRAYTHXAJsRZxS4S
	TsZq9rEJvqEfSLyNywQCPno3W3cI6du/FvtldoD1Z2tcTVgglzExokgoz+g8Tv4vEWAM1SyJ9/x
	taFF+0HcOgru9zKU9dmm7GdcJUDspent7dxFksv5oFpIqWQirAj95HyAPZ65tq8gNpme2
X-Gm-Gg: ASbGncurWIYH4510z4Pz/QKXMdXMN0E3wujD+76tx8CG2+2/k0Q87+8uW01d08NP8Ey
	lxGYdWSOkwyM0go8MF0C50oc75AUknpRmpVje58BMNfeEGGzbXpbl3YaBEuj+E1BeTZCtenBt/z
	bKYAWqcTtl88JTxx1R8GHio4lMTb+GabOmQ5NmvHb74NYEasATaQx5SRlbO2Z0DM7agx5eFhwO/
	M6InSb7xc63TqOpmI164hp12KYNhoXlWmdjqC6k8DYUepp6Ztfp27323fEkiTrawm8H8Uu/9jUM
	jcmHBsku0reoBc6Bj4EY0iS3nbXeia3tD7bGnTWn+HSPXtcrVTtWpFv56QO+O/WjAMHmjmxb8RQ
	wDOAXFkqKhMY6CG2xEV3+6XlckiZzWKrjp6oO/VBt2gZrheuhyFga
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b0aed4bf82mr177683031cf.26.1754908505861;
        Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5z1smTUet+hX/GcT1aT/9S2JjVbf9QV8q4hC/iCGMx16KAq7C3GFwGhrpRcaCu48ZUqvWAA==
X-Received: by 2002:a05:622a:1105:b0:4b0:82d9:7cb5 with SMTP id d75a77b69052e-4b0aed4bf82mr177682791cf.26.1754908505440;
        Mon, 11 Aug 2025 03:35:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cac7626fasm2255259e87.174.2025.08.11.03.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:35:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate()
 to determine_rate()
Message-ID: <2q7yo7ad7xvxkij3jtelrqxxctmaatdyi6zavsfhwq6oga4w2u@woq2yrvdt5u2>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfXwjG68TcezoHF
 uSbIvt5FKX2nXf0u5lgCjmDbPUGGbiMZm01CFZKSTZQDTTHUnBwF3GqxJVUIl/3D7CCP/s2f2qL
 1jC+boxRPVhtf8GmfOuJfBTo1K1UoJwtMZDdkFA/f3RC4iSHkuNfD9Jh58113yrG6PphnX/LU9R
 qXRTajDOW5lYxCcFQwW2+c5Sen2hlIct4bp2jvf6hIgdbHc6vhHueunSE2mVQsL7Hmo8FPkkLLE
 KlcIETBAo//EjcGUX19cW2xVfHp9jqe1PYJFOLE/eX2yHtxVGIFe59AFd0Y4p2Dmq27/cBFazci
 X54D0bIc/4HSxKqQuRbXy+SH2+MeSTA/dZp9bp0ZMoNVcdg2leZwjhRGH77NE3Kkn9+ai6Ic+Rd
 kAr2bG2B
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c75a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uo_JwncFnXXoUuJAWNqCfodXI41oMZVw
X-Proofpoint-ORIG-GUID: uo_JwncFnXXoUuJAWNqCfodXI41oMZVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On Sun, Aug 10, 2025 at 06:57:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

