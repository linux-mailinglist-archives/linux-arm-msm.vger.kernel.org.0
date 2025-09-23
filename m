Return-Path: <linux-arm-msm+bounces-74532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2853DB96898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 17:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D9A189E463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 15:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1760146588;
	Tue, 23 Sep 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LigH6/vT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB9919C546
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758640658; cv=none; b=K32jBKKeeSKDQkU/Bakr2LO1zf6Kelyw/wcbLuBiBpl0u0muhGEGFZ5Jt4ShU19ZBtG4XvxLpg/aSrlfsctCix20EyQDQRhWgi2b37IykP9DakrWX1CTv6fz6iYR9ff+EGaYsXFiuXiETMaX9aaq9Jbq0yfIOvHnL3uFFxvUp3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758640658; c=relaxed/simple;
	bh=/7kee+I8j9/Lr7ysS2tbhFYpdtuo1tTppWFv+ttxnGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+xGDeYFbM80PRgyB/4uw+4Twumz3pHAz76H+ncy1NJ8R++FA8Vy3wIt1VbdbDLC3xt28JGDGI/OtHPjDEGXbbuTuA9GdkcDpUnOKnbfgxc5Ld7ogd+zw0MfpFJrsk9wg23/Q47X0CM3RlncxjOOq79dTe2YX01PcYqI/rHmiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LigH6/vT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEpWZo014387
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zKMrwI1eQYz33WkyvRDWZnB2
	zzJf4oJ0W5w8S7iD9HI=; b=LigH6/vTaZEWPZ7Cf1S+hvgNRAcTbmd375676yYC
	emQK3bQsKjHVyhIALwXK0eRZpQPFWwogCewflIGZ0UCRTNXrJ6mf6OHIlLrSZ4UE
	1kWhN/TYLANbhwKC2iGv2gJ7fhzxI/HTtQZVBEjCapM43v3Sxlk3PoS/vEHRz3Wh
	/oC6rijCCWYF3XTq7jDDqSOQQV5KTqOn3usGSKz2GF63mYb4e7kArSgMcVJrbDzm
	vlFXqSx77tkBpEJjp0hQJOGydOYzy0PeQ05bPnte8YbanpvZ3DmcPHYOK64F+Quh
	7U79C0ef7loOnqM9ZwkU/Q8ZrV7klxvWQAU196cmtU30/Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp083h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 15:17:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-79538b281cdso87578946d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 08:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758640645; x=1759245445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKMrwI1eQYz33WkyvRDWZnB2zzJf4oJ0W5w8S7iD9HI=;
        b=b7T14zFXEW1ytP8EYyvgrCpW7JAdZYNgDBtjcQVXjkqo5S68D3QQ15ExlH1MvHd+Fy
         ab8YF5Qqv1GA0Q6lggctpmv1ZBiUjt5FE0/9Ves2+5F9T7vJupBXTDmkF49SemHvote9
         1s3MSRQCff19RuKzunNp5snFwvVyxNEGFiE+s+/R4KkwGrZeoXSk2Pr4fg8WV6o7EumU
         G+CkhoARxTa0FrioSvqcad4abYCC2ZLSeQ8BqdnFWUgIyJAodL5f5AOW43WxvnylaGUK
         cxNnyEuY5E2E9LkQKFLGCduU9fGfELd26dnnyCndlylqxASpOrHOlBAFBGSLze+dCusl
         T2sA==
X-Forwarded-Encrypted: i=1; AJvYcCXQtoxoUREq8ghYF4wxJvNkCixWFE9xAZJKqdBIGx5Mx72tlb1Q6F8XLd8g0hbjWtkFyOa4owXiDdAtBKdt@vger.kernel.org
X-Gm-Message-State: AOJu0YxR27+CiTUgXR/OfYuvzy7R2KtvLmsO9+TTIaEk3hC5Nww08gRH
	29jNzwPjgUOLPTwLJhEvv3G4ew03XWwmXD3nJC4MwE7tp4YJAt9rksE6RtQZKJQU43X6+8dhJlw
	8FdG8wVeRFV+pbb4pGMrXYjzFLBgs37RQMzUyEMDMPimHYbw0SvuVU12R50Sy5XZGbUGt
X-Gm-Gg: ASbGnctVc7SZc69UwkvLnTQCD29T8lSZm0krYAWqoHxnIDImCbx2NiGvl9kPeziib61
	BY9sePDtgQpxx5P/6DHZO64kNGLKMIOCqj8V9WSZ3NPTcazodtPi78nIDTFmrIk1G82HpV2qWLL
	LiF16oSkJUVwokEYBWc/LKBFLyuj3yUgvpuL2mVwh9/cxFZvdB+dqs+839iCwjO2m5EVjX/5qPv
	lwn0VOTRBOKfQcuCdfmuQRcs6tJnQWZ+vV80bfouUfwZnl/G/sMpWDl7zVixiqKdp8Lbn79tTRZ
	xisxH2KqVHCNoZSO/gunGCO8rTvEpBb9vkb7NMI4PbX+3U+ppSuyVM2/3aHThe/3J4TL4Lczff3
	RsDa+FgmWKOBTqBvWHcpjWH1ls+rpDZfqoACJ/VnuKBqW2LdtVzpR
X-Received: by 2002:ad4:4eec:0:b0:70d:ba79:251e with SMTP id 6a1803df08f44-7e7a4cd6a23mr27206196d6.13.1758640645022;
        Tue, 23 Sep 2025 08:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbjx8nOdd4srh2DDvcouzuNx8y7t17u070QeQCvysOaVT8ihRfB3wbeiinjQMhJI8Wz0tAxg==
X-Received: by 2002:ad4:4eec:0:b0:70d:ba79:251e with SMTP id 6a1803df08f44-7e7a4cd6a23mr27205486d6.13.1758640644122;
        Tue, 23 Sep 2025 08:17:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e079e7sm36471931fa.13.2025.09.23.08.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 08:17:23 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:17:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: rename dtsi files for sm6150,
 x1e80100 and qcs8300
Message-ID: <7o2n3wcjlb3ltbqndehfntqvsdpnn633pk4rlfq3h7fz2ygaus@na326qso5rs4>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <DD075WC7A6KR.NJJA1Q4WAJUZ@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD075WC7A6KR.NJJA1Q4WAJUZ@fairphone.com>
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d2ba06 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-__yLQ3fiRWGdVT6V6QA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tMuT8iLOWED1y38Ft8R3YNjS7HGoVccv
X-Proofpoint-ORIG-GUID: tMuT8iLOWED1y38Ft8R3YNjS7HGoVccv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX5ozVIdO8z7gR
 Mxh0D2ny2TIrHgvHJOYtfTyNR3l6VYOMSofd0yZBxZX+WyjSUGq5n+ZixFOUzHy1+EdCwPVRJsc
 +zO5Ftj64w1GPvDdZRDKaZOlROOPGr3BEIN1PseFTVDsb+zw4UOcwpslvVEL211g//wwpZe/xd2
 auCc6SM4g0eVpGo1IQJfynl0cKJyKyyqnjq2JKX3+HLxARKB7Cpq1bBU9BQLlP6DPeOOe4MmelU
 0RUabe7ASZbNmXQ+ALIXhJtd9fAcl008n2k/8RPcUNSUEectz0veNfDPLPlp7+5d3r/z2j7BdCN
 9+1GwK4cuRt0FlAjIZMu3VhCLLtZNjiUDcKoXyVz+e7+tp1YH/UToQEFK8Y5zuyiAfZC4gWRAzP
 T9uVjtFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On Tue, Sep 23, 2025 at 03:00:19PM +0200, Luca Weiss wrote:
> On Tue Sep 23, 2025 at 1:01 PM CEST, Dmitry Baryshkov wrote:
> > Bjorn said to me that he disliked the conseqeuences of renaming
> > qcs615.dtsi to sm6150.dtsi. Let's increase entropy even more and rename
> > even more base DTSI files.
> >
> > Leaving jokes aside. It's not uncommon to see different names for the
> > same SoC (or almost same SoC, with no visible differences from the Linux
> > side). The platform now known as 'lemans' is a good example, because it
> > had been using SA8775P, QCS9100 and QCS9075 in different contexts for
> > slightly different modifications. QCS8300 / QCS8275 is another example.
> > All such names cause a lot of confusion when somebody tries to follow
> > the actual SoC used by the platform.
> >
> > For 'lemans' after a lot of trial, error, Naks and reviews we've settled
> > upon having 'lemans.dtsi', the core DT file for the platform and then
> > naming individual DT files following the marketing name for the platform
> > or for the SoC.
> >
> > Apply the same approach to several other platforms, renaming the base
> > DTSI and keeping the DT names as is.
> 
> If we're doing this already, sc7280 -> kodiak? That also covers sc7280,
> qc{m,s}6490 & 5430 and sm7325.

And few other platform names with multiple SoC names per platform.

> 
> Also, does this mean that milos-based Fairphone 6 the dtsi should be
> milos.dtsi while dts should be sm7635-fairphone-fp6? The latest patch
> series uses milos-fairphone-fp6.dts.

I'd leave this to Bjorn's discretion.

> 
> Regards
> Luca
> 
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Dmitry Baryshkov (3):
> >       arm64: dts: qcom: rename qcs8300 to monaco
> >       arm64: dts: qcom: rename x1e80100 to hamoa
> >       arm64: dts: qcom: rename sm6150 to talos
> >
> >  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 ++--
> >  arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} | 0
> >  arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}             | 0
> >  arch/arm64/boot/dts/qcom/monaco-evk.dts                            | 4 ++--
> >  arch/arm64/boot/dts/qcom/{qcs8300-pmics.dtsi => monaco-pmics.dtsi} | 0
> >  arch/arm64/boot/dts/qcom/{qcs8300.dtsi => monaco.dtsi}             | 0
> >  arch/arm64/boot/dts/qcom/qcs615-ride.dts                           | 2 +-
> >  arch/arm64/boot/dts/qcom/qcs8300-ride.dts                          | 4 ++--
> >  arch/arm64/boot/dts/qcom/{sm6150.dtsi => talos.dtsi}               | 0
> >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +-
> >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +-
> >  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +-
> >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 ++--
> >  arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +-
> >  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +-
> >  arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 ++--
> >  27 files changed, 34 insertions(+), 34 deletions(-)
> > ---
> > base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
> > change-id: 20250923-rename-dts-5d74d6132f40
> >
> > Best regards,
> 

-- 
With best wishes
Dmitry

