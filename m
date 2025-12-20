Return-Path: <linux-arm-msm+bounces-86042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AECD3431
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 18:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28B1E300E7AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7720830BF6F;
	Sat, 20 Dec 2025 17:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwxzYt1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy5JGyLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E82E11C5
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766250343; cv=none; b=uf208/f5Cr0iYQjxAyTqIIaZjte343fUD5DQ9WKcod8500GYli1a6I5OhS1jFkRTYfh2QuE2P5obFrRHF5xk4axnLj9qfWcmHxHM38n8wWYR+EBluxVgmOhraeJIYyEXj6aJAznOuEV8fhEmYqf05y3UdwDgt3jJ0hI37C7/t9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766250343; c=relaxed/simple;
	bh=wy399q2snPIHBq2I9pbpxwUzOFh6Dug2sOJqY4CNyXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YipIWZ5StNyNfWIGQITPji/fv5Ws/g1e8PZtBpU418Mj2fUzzjP9/QhHWeX3H1qR3SYXJmFZ4N4dHuKbMp23mfVkazA9XxQs5PYrJ2IYXAKILM2XGr0swlG6ks5W317wOfZn92/c9nHjsqLe9cK5q9WV0GeUGdbvPDWRVGLP+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwxzYt1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy5JGyLP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBP3t3244545
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tE7IIBbTtFjvkImZs4r3P5wE
	RLLfG813si5ungSPtEE=; b=XwxzYt1mE4t4k9vQds7FpkAycB0XLAr1zCUNz1rF
	JIthdbI9c82fdcwYottbt63Kj697ohqVo0HfwzrvNTmGt7wGWDtw0oKH/Vplfmhf
	m2pHK28OEvf/zjB+KbYZ0yS/DavFA4kgN0QJQmx2jH2wOSOjSSR35UuUNW76d3QW
	nKimxDKdKm6eifDSqrSvIg9NzRoeDkn6feYnlUsXCee2hdQ4w9XB01dBlpY2zY6o
	HWkjC7RbG03b1laVkqnmbZdrKrPlDuxbtoJtzwxAgOyGisXnBRqKac0/P5omSoOi
	HA0u6WSwFyRVP4lDuV7N6gA/8+z7c9bLuqwmmHGorjtccQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mubh0f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 17:05:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9433e125af6so4060089241.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766250339; x=1766855139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tE7IIBbTtFjvkImZs4r3P5wERLLfG813si5ungSPtEE=;
        b=Zy5JGyLPLoJjLSKC6Fid8aJRUHyrfjlTQBNd+rslGaNRp0/Ue2Mnw3rJTWgmXCLeJW
         dfleiIDaCIssArCqvMqksIMh/HVc5doHyz+Bf0mVSXCqtDvyTXWAJtwKnFftLeJbVB1c
         /8n6W7Opx9hH3s5oPGmylS55MzuH/jBijTnfha6QFfyTS6s/pDrhnhiwE68T99B+46Fm
         xamnlsmwD2JuHrOqytohCvjoGOS1mBJO+QR4lq8aPe34b2W9V4Vcp35Hwco8oJp76J+n
         pDqLZp9nMn8KkCNq9jUBuNWfBggr2LzijFiDsN1T3JpHWp4TWR2jfyU9bMQAvR8gDLAq
         a0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766250339; x=1766855139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE7IIBbTtFjvkImZs4r3P5wERLLfG813si5ungSPtEE=;
        b=KPwAO1ubtK6Y5PjG7if4N6S+9cDBiV38rnr1buSwaAIsHBBaSQQSX3d6qZdgWgFer0
         TQr136o15BioLJpa5ATjHtcU3mB5S0uHp2Sbb1K9yHOVANRV9ToEu9Kjg1Ph92sd9+2A
         ua58vj2nOnQJBccBMm3pU4Nz52xhTuF+do5Mhk2RcD33RP+ReagFoVJ6a+e1d93Nqj22
         Ies+DmYwPatO6HUJa/U0pk3zkOAhI7fMSgmmoRrdoQGOEkYc0QXuT8zZUU+fRcj8hNRk
         AOXt80iqVbP3uRvKpTCWvcrK7lQvTYh/oc4t4jr+ZkR/Bg8vK8LZYQ/LRWftXUKXDUAi
         PydA==
X-Forwarded-Encrypted: i=1; AJvYcCWgP1MyOX0009UzfGn57RLQf0uqBve6nK/SZU3j9F7K3/kfSBqEoujBLTCcYT/UQMpXAT7b7lu1YTtPae6X@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4TdO30z5aYmkFrio0V9Tdkju8gLH5NgF5288GjuMVpLKub94
	XcV5qpaOzOiSVaYEAH7WCisZl/wrZq1oHIkzSFlvgDzYp5DIP5zc5EJFLt6wq3+5yCMPkxxUAqG
	iYDZWV5EACIG1cNdhDYo/LkJ2G2z5ZbODW6/sqFMrd5weBm5bvCcTy2X8hVIteqqmKEEy
X-Gm-Gg: AY/fxX56rlGdJaL6HWjmZgtC+iTI4eIrFc71sqbOFll02FBJX7E7KQfFGjE+Bqzca5I
	xMDYyES7OE8enht1eG1wXxgoA6hHrucyFV4jtINRb96q8kZVuJOosDMg1UnAvxCG1g372WPj8Pb
	hrKtFh9Ikb40WJYx8K8hyorI7NjwwADU7Afc9ye5ggBQUDNS/Vqgtu1PY2T2ocuoVfG0AIbX34b
	0V5TOa74ay2frrq3Kl2mNvNtR/PJGjPAo6gBUtyp+IB8qsFlJUfj9R8UdWysVBFuosgakie8s/M
	uQQYz7US1gL7HhsXBXADaEyxHpriNLX6oWWRTSkrAtGhOAfFtK+b7ZYOgdqc5QTYAy0oEdxnWUv
	6irrOEyc3x4BDaQc97TBQdnKj/LYwRRsfJoDJik73i52i/9wIpGjPV/a59QKrx6Rn9e1a7Ndcrr
	PVE2Q0pVW/UsszQx6c2VPh2R8=
X-Received: by 2002:a05:6102:2c07:b0:5db:f352:afbe with SMTP id ada2fe7eead31-5eb1a628602mr2176406137.6.1766250339053;
        Sat, 20 Dec 2025 09:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyHZedOYxx+7940C9jGCMIGZYssBAKQO32fe2sN5azssAD/dadKKB494vBGqtXBoQPo0x+Yw==
X-Received: by 2002:a05:6102:2c07:b0:5db:f352:afbe with SMTP id ada2fe7eead31-5eb1a628602mr2176392137.6.1766250338615;
        Sat, 20 Dec 2025 09:05:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812262b0d1sm11972901fa.24.2025.12.20.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 09:05:37 -0800 (PST)
Date: Sat, 20 Dec 2025 19:05:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Attempt to bring up display on Milos SoC
Message-ID: <qo7aqnnsguk6u3xuyrm56aw7r3sacmzjxb4tuquveurihzuhpi@3nrengxofekn>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0OSBTYWx0ZWRfX6gez3wyrtd8S
 xJ5KTRH0FLuPCcNKz9M4k/+k9xcki2AottEY1jui5ctTI9aTDoLDxADrbEe4JxzqoqeHAC7EFs7
 wUep7PQbZGQASj/GpsBKp7IgtanVy4CGtz6JbH7kKOIfIBxdbBxMU2JYN/9TvubShR378pYZii7
 3U8JgDBSvhY5mQwc09FMdI17bVKUS4DJT9+VWfsyJM1+cFhuWxEU5VffcdREh+43uYNP9bAq3OE
 rXK58Qd/HagVuLFibUFLN0H6I0bKBWx18ZZG6uIYs3BzHXHMaq9EM8/Opu5Q/57uveKtrTdF50i
 pTag56IGvIKN7NXjyjLRIzj36eql6ZKKuAGfb6dcFYAoPO3MwAckAVZAdNuGJSOZ4bnIzKjxcql
 PsOCmNhbtnXbLIKW+qRoAsr5ChhnAlejA0Oh8tbJI8YnNbEc1356If+BHZzFKuD2sVIUxmt7Gyc
 fq/+LIc5SQED5QqzTVg==
X-Proofpoint-GUID: V9CXOYOhUP0h5QGIuHPPnI02pZ1Bx2S9
X-Proofpoint-ORIG-GUID: V9CXOYOhUP0h5QGIuHPPnI02pZ1Bx2S9
X-Authority-Analysis: v=2.4 cv=KYbfcAYD c=1 sm=1 tr=0 ts=6946d763 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W6naqKN7AAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=xmEa5mADQUDEmEBAgy0A:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=Xp8b5NkTPdl8jt_qJiRs:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200149

On Fri, Dec 19, 2025 at 05:41:06PM +0100, Luca Weiss wrote:
> Hi all,
> 
> This is a very WIP RFC series that attempts to add display support for
> Milos, in particular on The Fairphone (Gen. 6) using the SM7635.
> 
> I have excluded sending panel driver and dt-bindings to reduce the patch
> count, since they should not be relevant for now.
> 
> The data in the patches is mostly derived from the downstream msm-6.1
> kernel for this SoC, named "volcano" downstream.
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/display-devicetree/+/refs/heads/odm/rc/target/15/fp6/display/volcano-sde-common.dtsi
> 
> While I'm fairly sure a good chunk of the data is correct (marked "OK"),
> there's still many unknowns (marked "TODO" or similar) that you can
> see in the patches.
> 
> Unfortunately it doesn't work yet, with the screen staying dark and
> these errors appearing in dmesg repeatedly.
> 
> [    6.541696] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
> [    6.587091] [drm:_dpu_encoder_phys_cmd_wait_for_idle] *ERROR* id:33 pp:2 kickoff timeout 0 cnt 1 koff_cnt 1
> [    6.587387] [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:33 ret:-110 pp:2
> [    6.589509] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
> [    6.637482] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout
> [    6.680077] [drm:dpu_encoder_phys_cmd_wait_for_commit_done] *ERROR* failed wait_for_idle: id:33 ret:-110 intf:1
> [    6.680356] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for commit done returned -110
> [    6.684517] [drm:dpu_encoder_helper_hw_reset:1763] [dpu error]enc33 ctl 1 reset failure
> [    6.729507] [drm:dpu_encoder_frame_done_timeout:2727] [dpu error]enc33 frame done timeout

I guess, that it doesn't fulfill your needs, but I'd start with checking
that WB works (you can read the image back via modetest command and
verify it manually with imagemagick). Then if your platform has DP
support, it might be easier to get it enabled.

For the DSI CMD, I'd suggest checking the clocks and then getting IRQ
traces on the downstream kernel.

> 
> The panel is the BOE BJ631JHM-T71-D900 with a Novatek NT37705 driver IC,
> running in command mode (not video mode).
> 
> The vsync/TE pin should be configured correctly:
> 
> ~ # cat /sys/kernel/debug/pinctrl/f100000.pinctrl/pinmux-pins | grep GPIO_129
> pin 129 (GPIO_129): device ae94000.dsi.0 function mdp_vsync group gpio129
> 
> A full dmesg can be found at https://public.lucaweiss.eu/tmp/milos-mdss-log-2025-12-19.txt
> 
> Schematics of the device are also available if somebody wants to take a
> look, starting on page 109:
> https://www.fairphone.com/wp-content/uploads/2025/08/Fairphone-Gen.-6_-Information-on-how-to-repair-dispose-of-and-recycle-EN-NL-FR-DE.pdf
> 
> Please let me know if you have any ideas what could be wrong and how to
> fix it. Thanks!
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (6):
>       soc: qcom: ubwc: Add config for Milos
>       drm/msm/dsi: add support for DSI-PHY on Milos
>       drm/msm: mdss: Add Milos support
>       drm/msm/dpu: Add Milos support
>       arm64: dts: qcom: milos: Add MDSS
>       arm64: dts: qcom: milos-fairphone-fp6: Enable panel
> 
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  71 +++++-
>  arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 284 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  22 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  24 ++
>  drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
>  drivers/soc/qcom/ubwc_config.c                     |  12 +
>  11 files changed, 627 insertions(+), 7 deletions(-)
> ---
> base-commit: 167013d059d5c4a09d49068408044c7a65a26cee
> change-id: 20251219-milos-mdss-fa0763693775
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry

