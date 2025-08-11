Return-Path: <linux-arm-msm+bounces-68321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42463B205AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639AE188FF44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71872475C3;
	Mon, 11 Aug 2025 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iabp8jC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45092230BE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908536; cv=none; b=VXrYalCiHaR389UM4S0HLyxCJF+T5nFKVH2Sn6BXtHcnPxerxLtKZws0zD5mjQImGNdV/XdywutqBLb88SJqYPDLq0urDBRqjtScZ6RTYpoSYRuzmMHeBd3qOOicWGGs40ZYVy3CQMeiHVEMXR7q8wjkNkvF1lpv5KeKKGfnI7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908536; c=relaxed/simple;
	bh=U+O2YmiUaM5zrBR2yEMYBT03LRa2SmNuFAgb0DjKNA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=he/pM80JQiBgCXoK4ITrR0O419E+2AIB7J4mmu847D52+L0Ift46gOL7ZIcxMNTyqZOMaxTjJP5GkqgKLGXkImlH9Cj9tJyw6z4/kCM8Hy9gPuXBJNmbgTyQBDn2+91MBJNajwMcfqmPGQbbbgjCEBYtuccG8NWlz48NugUPZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iabp8jC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9M4000632
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3nfN60jdUBtaQs39UNaxVpig
	z5/FB/TFepwaJ8bZmqU=; b=Iabp8jC37l+5c1heoHBD+T5SrH7/okVsULQROKRB
	4CBkj/JSZHMqZ54QQXeKxOrXHgbXoGBTBdDjtNoQM1iopYSgO5Kg3/rUdb+GyHoJ
	Zy/PeLma5V2wHjNIQwvYYaeu8RQnFBuFf9xDlPa55UVmVazVug9oUJpEx+QIGIcp
	FFI6oYnM0VaYO4I/vbi7rCii9D7n041roc5P361r663yV1C3YHwoC199KRuO1KIu
	VK5l9p3LnDvx+xpZlohvUh7wp/b516RQBrqA/poieFDWyyf3mqE/RLRLR8yOeion
	gnrszwMY/4JnQCl6Ni4juj+H7xV8NGGqda2WU1e260uNOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxq6uyxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:35:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af199d0facso134449121cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908533; x=1755513333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nfN60jdUBtaQs39UNaxVpigz5/FB/TFepwaJ8bZmqU=;
        b=TGkvRpgk+aRAk4oWiubsGL/64hqqfsPEspMWqfHMeGeGbrfunO9aXSZb3HasAc3OmT
         /f/ROVyxkejYTi1LbiG4J8XhFrGXThKFvf9frwD3IYr8P6fI4vHTeyWvSrLNIand73TP
         hgUwXv3l3c9RKFlrQ7JhkylA+MRSwPMNBuxwteGUhyL2qQKvTutOKC3tHfTh5XwOIkI/
         3Ca5Q0zLRHT7h15GDD3tcV2H0a83fqSHmByK7A/sfPRZ9yugFtrgb84y+NWNDnpNcJZj
         V1LwWR4tFka4LDZlWbrMMEXHQsg4cxPSL7pXfTAB8l1Sh4fLeBOY7KDX47zuMLH2wRGO
         eblQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUoPklbDopnSRlaCJwNq0gkELCLaGT0meKBs2hPWSzk48t4Qk45PjOsfB+jPbAOGiMcjQUb5V5TFM37DBC@vger.kernel.org
X-Gm-Message-State: AOJu0YwAMmxo/nHSphQQx3fq5uNcLTHOku4Me9vJ/qP6+lVQgHHwqG9A
	yPM32LnhL38oQa1iQBAcF7zBcMNSI4Is1w2lxFA4XfI1RSRZPilJS1bpAARYKg0I3rzmRWYJfX9
	vz0XVy9gwKj9N/hes+tiBpUhq8yCuQZVjY9Itib9R4MWAInmJ6lrMevUl9fi44u/cy1eK
X-Gm-Gg: ASbGncumQPvEkkH+qZzZWPAboYnkzHhF+VmlNIhEY3tcmqSavtuAbG8eTMdO4zcbIPD
	DoK8/TwjDe/lWRU8wHAS8Zu3lQ8TTR2hUJerJQdIXwovDjmR1pQ/7mJlSKZT9QqWATIc/a92tGB
	Q5jmZh9wcwvgHfIbYa9nMnhbQTT2aBqMonjjy031m6+UlnAJEpYz2zBLH5w9IIQ8hI8Ew0zdBzw
	LczXDIfG9Ks/v8Ja/SKz8hvXAFKEb5ZicRM33lnSxrQAVCfzOQXSSulThofgFrm3wpinVAxzn8R
	7tzG0PpU72jHv7miQHnCXh4KrNxq63mHrEtYIqmxyXIJwba9ID6NvqD51kGIzPPVl/ZAYtH74fa
	wZ1eq2hByiy9i3H7Gdwzl6Foiy8U4N2Ckwi5d3MP3lI7Bg+Ftpo5P
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b0a0718816mr236623701cf.10.1754908533245;
        Mon, 11 Aug 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyahsxVGaRdWMce+qoZBor8nKFhSp+X072mklH4pqlqFsX+5NaNxsNkaIEI2fGWy6wHtVUA==
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id d75a77b69052e-4b0a0718816mr236623311cf.10.1754908532801;
        Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55c9c847db8sm2272681e87.84.2025.08.11.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:30 +0300
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
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Message-ID: <pem6b4hf5gzo7jbo46asminbqqrnkhcx3nwsvstv76ntmeasfr@sgckrdc5s6og>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyOCBTYWx0ZWRfX3GqfWRAKZRVC
 z19aPyor0SJgh+3rP7w9toBWwwbW3zcolCN63l9nqW4j1v88pvHHJFR8IXQJm5vJEAEqbWeHZGH
 YGqIigcfPQLWfEXmYRgJQ7agM/u9eOm8mw07pTN8PicqwepSn5PSKLnxrPmSINPIkKCX3BZEf+w
 VR7CCi6LYkLetkXpPRIysm528KcfdeupVtjvvSPdoovtT7s6kDAn73zZefUy3Zk11Fq6F/bCVSt
 Qp0Vxs3sBI5/KHI2jVlztlnnh/pHKV9E7A82fgAN78gfgHY7uFvWJnS4XfBUorTRPDYxoKJ0+Yl
 iXO2tDSNnAVli5LvIPCcDEJHZ71UkFBOvC+tumaT2YOEYITlAGISMLwxwBDpdSRRfLCGqu8epW6
 R297b579
X-Authority-Analysis: v=2.4 cv=QYhmvtbv c=1 sm=1 tr=0 ts=6899c776 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HdFogi73GTa6mcbAQJ0CGPhEIZd9li_n
X-Proofpoint-ORIG-GUID: HdFogi73GTa6mcbAQJ0CGPhEIZd9li_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090028

On Sun, Aug 10, 2025 at 06:57:29PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

