Return-Path: <linux-arm-msm+bounces-51718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F44A673CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F99916831C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC05D20C015;
	Tue, 18 Mar 2025 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cP/aKPBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33042206F30
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300662; cv=none; b=es6/TWSjBevpU1VEOZZNl4OWV6oBw6f3SzYD4jNO6vfd1SPf278S4zK4meipbmEKZxDQITqtxGjuTSoTD/XNv9das3uDDC7F7CluQj4LWMq7EUucqp6PCTt6xxca9ZTkWLzIYvqWIhjxr1KIRl9vtO9jEs3dD55asttkUS5W3mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300662; c=relaxed/simple;
	bh=sNvJN2vGT2RT+QbgWURA39suTphTrFu0EeK6I0taKiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeDCmChs49nF09pa4+QFyB5LKs0AwioAgtqoHSrUhBxDNdTbmbdC1S68Yaspe8QTlnv/ot6sXSiNcQVwCo2XHs6cCMiY6mLnFe3IXNIq8Nj4cl6Vzd5VODudckhrwaeHJeswnv+Hu5NyS7TLq9B3ZSda3zy0NQlT/lZcIWetAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cP/aKPBG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAqdnM020847
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EDN4zD1N+DunuKV6N3O+L5Yt
	WP/lxLEnoiHEUOXeOZo=; b=cP/aKPBG9s3vx4Hdf72/D3QdvS1KhRO5zz17XOnk
	7cjlNesi62VajSyHwTUYBfZ0xRhoOdp1/Oct7T3ABolIZ+39zcc2CetYT9SnVata
	y29IhJSV4MrjFv7KpcPrYOitMsdbuKDTUfuHd1lM49gkivSu/ag5rXprxfYeeAJV
	jPN2ZRnKb8VOwUmbKxP07dOQbg1Rc7at7Olr7smEA4TGo02DYTAHr6snVWfFCAEl
	p1xTyQH1os5oXAgISy/XorPaGgp/GMG3AIIAlTbQE3UhKqO5XuuO8NFakOXhY+0/
	EFN7U5mT/+bkB2ggfiXhff+0d5+ARnt3dKgvjn323KGNCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbhqfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 12:24:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ed78717eso102046476d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300659; x=1742905459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDN4zD1N+DunuKV6N3O+L5YtWP/lxLEnoiHEUOXeOZo=;
        b=C1XP35iVgq/NZv437sffWy0IvzyjG0XAYUZ2CyjvAVe2UiYO4YFzzFBxACijsI4gq7
         /kN3/32WYbWnBsz6llyAI/hrLmfT8qCc5F7QYJWxzdqSJuGjZkMLjtS6uOjB/zG8jyl2
         FUMHGBWipxfcuD+WMC1Z+X6hbpbx/JGkFQY9nXEcyAGFr2G+O8zqgPgokGrdJo/56lHs
         mXc+3MYf1aJ+SoMxsGXJ6DhHgSYTpnFk0raqEWuqiLr17lFD9I2qNs1MwsCoMFOalYTq
         5jcBt5wNPf7Jlp4wX5D5+FGbJi3wxe1szf01XUoTjBKPgkcWemgZze1YRfm0Cs1KnYpW
         ngdw==
X-Forwarded-Encrypted: i=1; AJvYcCVxafQZgEWgJV82oOGNTnf+kqc/earjBKUwfHzHcoSHgMsAABbIFYTOq3XymS8WDAZhkPUAYD+f4XVPWAQ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz71Sda7oyAHHW2S/9r/GF3oTkgQL0touF0LdH5+f9TNtx6zbAR
	GPKpa1M6rjMcDNAxBAOVopm0ZAwrAELJDcygHOXWhxR3T/7+QScwim9S8sm6SdPk5QKWYY6+r21
	hf9tHcoRk8Oio5Sa3Rp57tVu7cFO8puPxHaknCn3ukBU7LEGC+cKdcrGLOxB2SXMv
X-Gm-Gg: ASbGncsK1SNCjxYPnu1LYmd9bP1WFQCmzVv4vmb6mQr62cXO+kBmMRIQLDphRdHaCKS
	/zgOQDkvzEhrBpv52QmN3YiAy0q26n7B0q7A3O9uY+nPraZd9q4y1zlQf0J2TgHAGIgPlkPNTon
	XfvylGxKH15WOTYTHVI7Olx2XLy/nSUegK7PxensrBtneG5FfKTIcMjcp0qOv6l2dIddk5UleOI
	3xqpr6xx6Ted1iElFxzh4EZBKgW6BaqMUFkALq1U+HnE+/l2MEHBBlpYsvxdJ3cBlwTIbD7VX0U
	vo9hrkwyutrONOzt9mDZe077WXgJnnoCsXaOZurdtBANZ60rxqHKei9GCcq0CyvOu6dI0Q1Ry6k
	pniY=
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6eaeaa4282emr238045636d6.10.1742300658861;
        Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPP6bwgBzTV1pHyJ776Y2OqHo+uHrhx19IfFmQmbn8H0Ej5qHdf7EgW3rLl5dPKhTFj/jdAQ==
X-Received: by 2002:a05:6214:21a9:b0:6d8:ada3:26c9 with SMTP id 6a1803df08f44-6eaeaa4282emr238044836d6.10.1742300658446;
        Tue, 18 Mar 2025 05:24:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1170dbsm19027101fa.64.2025.03.18.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 05:24:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:24:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/9] ARM: dts: qcom: apq8064 merge hw splinlock into
 corresponding syscon device
Message-ID: <5g5ni3xoeliy4xs7wlhjjeust32qerutt4tdkkdvgeisdvbc6d@shlkxbzsw3vw>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-6-655c52e2ad97@oss.qualcomm.com>
 <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <579cd909-8a0f-4998-88a6-47073ecc0eae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67d965f4 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DJPKDmouk0REp9whk4oA:9 a=CjuIK1q_8ugA:10 a=IFyWz7IVXAM99tgoijJH:22
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: xMTqxJSP2xGKXyWp56ySGEr45LtyZu6E
X-Proofpoint-GUID: xMTqxJSP2xGKXyWp56ySGEr45LtyZu6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=602
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180092

On Tue, Mar 18, 2025 at 01:08:00PM +0100, Konrad Dybcio wrote:
> On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> > Follow up the expected way of describing the SFPB hwspinlock and merge
> > hwspinlock node into corresponding syscon node, fixing several dt-schema
> > warnings.
> > 
> > Fixes: 24a9baf933dc ("ARM: dts: qcom: apq8064: Add hwmutex and SMEM nodes")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index ba99e794dcd2236f65f2f3d8c49213cfdaee5f6e..3728875a5506397b36a4c0d6a5ad12c067bbdd8c 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -213,12 +213,6 @@ sleep_clk: sleep_clk {
> >  		};
> >  	};
> >  
> > -	sfpb_mutex: hwmutex {
> > -		compatible = "qcom,sfpb-mutex";
> > -		syscon = <&sfpb_wrapper_mutex 0x604 0x4>;
> > -		#hwlock-cells = <1>;
> > -	};
> > -
> >  	smem {
> >  		compatible = "qcom,smem";
> >  		memory-region = <&smem_region>;
> > @@ -305,9 +299,10 @@ tlmm_pinmux: pinctrl@800000 {
> >  			pinctrl-0 = <&ps_hold_default_state>;
> >  		};
> >  
> > -		sfpb_wrapper_mutex: syscon@1200000 {
> > -			compatible = "syscon";
> > +		sfpb_mutex: hwmutex@1200000 {
> > +			compatible = "qcom,sfpb-mutex";
> >  			reg = <0x01200000 0x8000>;
> 
> The mutex is at +0x600

Indeed...

-- 
With best wishes
Dmitry

