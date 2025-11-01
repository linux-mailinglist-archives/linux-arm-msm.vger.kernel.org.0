Return-Path: <linux-arm-msm+bounces-79985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7C4C279D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 09:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4C5324E160E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 08:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AD29BDA3;
	Sat,  1 Nov 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lZwJB1G1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PCUlI/8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE43299AAC
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761986595; cv=none; b=sV4x5zGNSD9RuehUtrc4BrnE3x6228Kkqw2FrGVpSAyNOu687X2Eoiq6iaL1nYW6nebWMZx0eaBE9SvkGFEVt1nqzHbXXW6i0IG8KWH2lfWiqurqP9rAwOH2bumaNzsFSfi7PU+S8siokO8MEEoc/FsOk32ZUMpjGQ7p1Ey+FRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761986595; c=relaxed/simple;
	bh=Gcc4WfI7cosZeD8n8HiCMCxxzhy6/BxEn4onVPGuHP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU+lkSzj49+OxCVmNadp7qo+sysJZgsY3XWysx8OsUYRIp9y0Oo1qfmDTD+GSiWm+wvHSukSJKMql0etE90JvF4vBC1C1aNA5fBPUAIDvSB+psrm4dA+XBfhUDKm4ITVSLc5FjOJwUd9XUWMmLqtdtZgGoreEEVAavFeK/P0AHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lZwJB1G1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PCUlI/8s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A13lVK2560738
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 08:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfqyUh7o2Ampai6FJH2BnCnB2E+AjfrQoXU2Q/OvGIU=; b=lZwJB1G1MfIzJ5ee
	eCHmfmB7Lz8H/8Q2US+o8ChU4JMGl054yS4ASue2ujK4+GXNUjO722NMV2Hu6AgJ
	BfJtttfXbvPgCWoYmeRd1yWo0E9brbl8vL/xKsFQrU4NzFe3dQOBwjviSK4t48QS
	Y8DKtE6r9EV3RUkiWhEdh0Pn5XKg3a/7CGuOOYgsRlJkuQxhtR3FhWb231Bxskx1
	7/AhzCt20T//ABORENNOjGv6Mr8+cIexqZKe7LECox+znwUHjHY+4mK3O+nNhYcO
	FmO70YI01OcG8hMnhKqIFxJhJnz3Bc9FpQADHd0RCHous2u+nTbF0OHUIcCYjVEL
	BCHO2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8gbx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 08:43:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ecf8faf8bdso32357641cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 01:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761986592; x=1762591392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EfqyUh7o2Ampai6FJH2BnCnB2E+AjfrQoXU2Q/OvGIU=;
        b=PCUlI/8sdX2ZGF0ZJg6PhJVeJKz9kEnxz67318JxLO3coEoD83wnyJo57XljGoQQTh
         qFB7+znyC7Jwc/VoEYMQH5U2I/OMetIBZWQ4LHaavwysRCkpGg9zAIvK7mYrY1gBNsvJ
         jX3sDOFCDcSA7NeddlNxs4oUr7L/IeZe28rB5T1FpW/eeSC8K8hYijaSeD5qVSJU74wm
         rcRx0Sr2qvNunVq1vSfDbrULkSGDczJyWPbV4OTXEhMjRvTEHy7rACXE01/iW/W8IHzw
         IlP04khcqJBEH80pDhlheFhwP9Q3xDfHMYlbt6ilv+n4vKOS9lb5FkyPN0E45nkw+J3Y
         KL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761986592; x=1762591392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EfqyUh7o2Ampai6FJH2BnCnB2E+AjfrQoXU2Q/OvGIU=;
        b=X9rQAMb/+k+1MVGPcxhZLKmzSlYM+ZgkbNEY2bbyi6o2Ah56p7vwOUDx+42tVvhe4+
         cJJwXx/ZAT93iG22teVsMXr0I+RQvS6lC9s90iZmEB4BZfRomPuS1SnV0kbc30p5B56k
         g61cBname5zcH/S9q6ZXUlVAhBkNUg830dWtaRyrLgVtaWPobrtFycO3hILCv8esOR6u
         OW/Ouc8ZG0tM+IG4NHg8xvvrW8znFDrE+cxKe0dxB0D36L5wQhUzWRWuRZr7KIeuBzl/
         izlpPpjBJ/2wbIISodqTGplz4LhUpqzeofAiVzzOhYE13/53OGcaB//hw4RMlv89JeQZ
         rfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc1dpTpdeM1vejGuoYF2BB6c4bUVB3+Gv/3HGRjZhv7FyF4OgBiOMAnTY6JGl0KgVi6gpIp5fCh3FYjxna@vger.kernel.org
X-Gm-Message-State: AOJu0YwBow0KJ4Uq6RnkHZ1r1WfuT3+t4xA9KtQM1I8WEZbzHAHr7+Z9
	azYntiHPlBcF/H56h2msNNLi0n02uIWEasyZkx4VPjnx+c18R0R/3K18ostDMDnhnKeBNHJTH//
	SLDM53uS/ryHYcEsxwI/HnC+DZgfOokJvqPhh7cwfsWGtOUjgcB1m0t+25WAZFHdctBNV
X-Gm-Gg: ASbGncuOCV+whjgHYk+Cn7v+BaYx2boYfg6++t5xpFSipIKwPIocSP4kD/D+fG6nPTS
	r8wCHanIj4KQM2eCfeZbrnq+d36Gh77tu6S7xQSLOjBJjLgGJ4phm3iH1Pus+RbKvnXP32znXVn
	GAnDplVdzzth9u/vyjv86BI80U5hv0WQVSmBcnwwPDJRjqQ1dGxVnW3os3PFOR3fBCgaUiRBjSy
	gZUMqveUHomgzxHlV27DPyBD1tbiAZ0M0kp5C1SN4oD9n8wsIv0hRg5rk9eZ3xkQJeOgMtNHsMg
	9BLzxJxLuh9HJKlssyS2WvUGN6uBoK6Q0qEDHUp8KvAtsvjUCVktyRMMlGE/6/gC/Q1T1gAkPIs
	yObxC5yMhSilBM50BtiHBYZM57RZVgH/iHUcg/u2qPSOM8uZJdZDf91xANNMihj3Tk6KNTGx6Hq
	pq0UbjP3MJwd5O
X-Received: by 2002:ac8:57c3:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4ed30d4d0b2mr82308181cf.17.1761986591764;
        Sat, 01 Nov 2025 01:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9vl/ZeceDq5qPZj91Yx8Lh2DmzSyst1fJqqvipGnlWsAKyiWPr4peWPX3C7h14PXePIRC4A==
X-Received: by 2002:ac8:57c3:0:b0:4eb:a07a:5fce with SMTP id d75a77b69052e-4ed30d4d0b2mr82307991cf.17.1761986591306;
        Sat, 01 Nov 2025 01:43:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a2e1141fbsm427011fa.2.2025.11.01.01.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 01:43:09 -0700 (PDT)
Date: Sat, 1 Nov 2025 10:43:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
Message-ID: <3genyggxae5ejlpi2k2zflliaujdov6f2nd5nppzxtg7fmerff@52dac4oh2c3z>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
 <fvtwdsthi242vxxlaqsbvqec4xkduch3fcslwqsjzkz4fidewn@mku374rrwlp7>
 <90185600-c08d-4548-8e66-16d3d0de8765@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90185600-c08d-4548-8e66-16d3d0de8765@gmail.com>
X-Proofpoint-ORIG-GUID: 8B44izfHLrEXsDzYYhzeJiRjvCeUrLbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDA3MyBTYWx0ZWRfX8SmXk+askG72
 SGg9rAKAQR4dbTG9sN2kNmgFmGLJCJjGNEbtHQfyKnBJFwngAyCMzZHNbHFEVE2928ogHJlMZfS
 rA+d98auoKRu5vI4hMSif3Pt6uUj1F3mL5HWg63wwX6n36QIscV8M3Ev+fIlXzoenYwDrq3ghyF
 yBPCcuzirzEN6V+WEdLooo4kGLuVcwfQbsDvgZN/9hF1F1raDyo4CM2vU7JzNNigl/ps3apSbv+
 D4GsVaqgZQZcnfaVFgffhSvClRSK6+1+40sJFmouo268oZRvXGFtGiI4zNaS0ijtsedlF2vzZh2
 JDp62ZJo9XolXgTcRW11aXOJTzCM4kXi1zsYipgoZJnYbSi8AUsvQDYuZ0B1eApDO6ZiU9nKQfU
 KLiz4JfJK157PYmE7tH4jNijho/8jQ==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6905c820 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rzCUXBBmrDPBhJRWehYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8B44izfHLrEXsDzYYhzeJiRjvCeUrLbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-01_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010073

On Fri, Oct 31, 2025 at 02:42:05PM +0530, Tessolve Upstream wrote:
> 
> 
> On 29/10/25 21:18, Bjorn Andersson wrote:
> > On Tue, Oct 28, 2025 at 11:46:36AM +0530, Sudarshan Shetty wrote:
> >> This patch introduces a new device tree for the QCS615 Talos
> > 
> > "This patch" doesn't make sense when you look at the git log once the
> > patch has been accepted, please avoid it.
> > 
> > Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > Start your commit message with a "problem description", describe what
> > this LVDS talos is, why it should have it's own dts file etc.
> 
> Okay, will update in next patch.
> > 
> >> EVK platform with dual-channel LVDS display support.
> >>
> >> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> >> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> >> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> >>
> >> where channel-A carries odd pixel and channel-B carries even pixel
> >> on the QCS615 talos evk platform.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
> >>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
> >>  2 files changed, 129 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index d5a3dd98137d..6e7b04e67287 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds.dtb
> >>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> >>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> >> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >> new file mode 100644
> >> index 000000000000..7ba4ab96ada6
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> >> @@ -0,0 +1,128 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +/dts-v1/;
> >> +#include "talos-evk.dts"
> > 
> > We don't include .dts files, split the existing one in a dtsi and dts
> > file and then include the dtsi here. Or provide provide this as a dtso
> > overlay on top of the dts.
> > 
> > It's not clear to me which is the correct way, because you didn't
> > adequately described how the SN65DSI84 enter the picture. Is it always
> > there, but not part of the standard dip-switch configuration? Or is this
> > some mezzanine?
> 
> Thanks for the feedback.

You didn't answer the question. It was about the hardware, not about
DTs.

> Currently, the Talos device tree hierarchy is organized as follows:
> 
> talos-som.dtsi — defines SoM-specific interfaces
> talos-evk.dts — adds carrier board (CB) interfaces such as MicroSD, power
> button, and HDMI
> talos-evk-lvds.dts — enables the LVDS display (includes SoM + CB +
> LVDS + disables HDMI)

So, is LVDS a part of the standard board or is it a mezzanine?

> 
> The LVDS and HDMI displays share a common DSI output, so only one 
> interface can be active at a time. At present, talos-evk-lvds.dts 
> includes talos-evk.dts directly so that the base SoM and carrier 
> interfaces (e.g., MicroSD, power button) remain available.
> 
> However, as you pointed out, including a .dts file directly is not
> recommended upstream. To address this, I am considering the following 
> restructuring options:
> 
> Option 1: Introduce a talos-cb.dtsi
> 
> talos-som.dtsi: SoM-specific interfaces
> talos-cb.dtsi: common carrier board interfaces (MicroSD, power button, etc.)
> talos-evk.dts: includes talos-som.dtsi + talos-cb.dtsi + HDMI
> talos-evk-lvds.dts: includes talos-som.dtsi + talos-cb.dtsi + LVDS
> 
> This approach avoids including .dts files directly and keeps the carrier
> board interfaces centralized and reusable.It also cleanly separates SoM
> and CB content and is consistent with how other Qualcomm platforms 
> structure their EVK variants.

This sounds okay, but please respond to previous questions.

> 
> Option 2: Move CB interfaces to talos-som.dtsi (disabled by default)

Why? What happens when somebody reuses the SoM with some other base
board?

> 
> Move MicroSD, power button, etc., to talos-som.dtsi with status = "disabled";
> Enable these interfaces in each top-level DTS (e.g., talos-evk.dts,
> talos-evk-lvds.dts)
> While this also avoids .dts inclusion, it may make the SoM DTS 
> unnecessarily complex and less reusable, as those CB-specific 
> peripherals don’t belong to the SoM hardware.
> 
> Let me know your prepared approach here.

If you yourself don't like the second option, why do you propose it?

-- 
With best wishes
Dmitry

