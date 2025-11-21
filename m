Return-Path: <linux-arm-msm+bounces-82891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB180C7AEBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3A3C4346821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5282EF673;
	Fri, 21 Nov 2025 16:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vrx3oM8O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRHhlX5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13C2E6CD2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743586; cv=none; b=QZfRVHxofAIkNX9a6k7J7HJNsWhgn24obZ80ZDgcniFlBRF9VlJe5qG9EBk6bGqvyjf1OtyL+7vb5sxGcclFernwIHQtsD7gFGofMtqcBhnL1hs1rk+lfcJsFIz4HjA/OjpXKj4VkD8HMBUSw92l3D9vZiwdQRu+gsVESNwgihs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743586; c=relaxed/simple;
	bh=fk/sn6bCoX+Lhzv8XrY+s5rPYVek4Y+4MA5RJ2Lxpuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJuQgm17jqCuD2QUUy8kZNcJw67iX8+0SYYeRgo8dtxohuKhBU/xdmYLoNnLsoWEYPU4NmDtzXXfuP+xmlOU+Qi9C3mcSaYnfutzU9QaQ6fx0kFB0bR9eOMDMfGdHcqUVPWUBIlVa8FITUP34bgTC5at1ibqDfvxbTg4+Ke8wsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vrx3oM8O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRHhlX5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALDjiFd1638661
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dish8P1D1ku8eO1qPQVS9u/K+aVmOz84EXJR4kqR5cQ=; b=Vrx3oM8O73MyLP8O
	xnpo1HIiNxfKYS8v5Fkw8JYVp94CwLswTY273Lf2TCixjH3/EHXMy+g8y4MlbM2L
	CPqPH1q9vTjLz5EWRpwpuqJnntwmYLzsS4kpcE4TT/VNV0V4JUzTjXsIi/IUl5Is
	rLw/CG47g/vlURCAjpP0BGn8BEnmVucoxzKQZS1LPIlQ7Mu9kH/Ih8wejqvBLlkj
	5VvfgTaGBq5GP19wdWZItGYxDw/DXEzEPNLjjpVQKttnf8IzbNZcTAN7UtAN0BsM
	5MrYNCsj/fkjDwL31dadUXmk04Y7GtG2q9erZL0G+2+wOi1kbf9lQozXDG/nFstN
	+xr5fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajagaudnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:46:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2657cfcdaso259138785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763743584; x=1764348384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dish8P1D1ku8eO1qPQVS9u/K+aVmOz84EXJR4kqR5cQ=;
        b=jRHhlX5ADODa2T71PGwmCr1XZ+RbgqwAfZOcANgpqopB04zuoJ4wta6kgSCvea+Y0e
         X+WRbu2MZdg/4z/qiaoeC50CdcmZ+3JawdOAon3aspFER00EVWdSgTL6IgJdNztEcYkI
         5htrwLfWxMJLQyW+KBK1BiIde0Hf6RNj0qwFT03bDuZ3rInjDHAf+O1vrgTB9n8ZTwDh
         1KR49vUjbHougOuNIcvFnzvHevCjxsgBTgs50iFcx6U9KbGPUD9TQez9dCnxskeddu87
         3n/SlomUy35KUlLEndUDw6ja4WG7Nsj+hsz1UidAqdAZdufnm12ESGkEwMdGgXzcgFUe
         FCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743584; x=1764348384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dish8P1D1ku8eO1qPQVS9u/K+aVmOz84EXJR4kqR5cQ=;
        b=X26raSrGMVHGjQiJ3XRc1mLAeQzhK130ujP7orZaRj7uD+cl1rxq+2OZkqUXgKvbTB
         MUnwMF3LpmxVFgtUX++kuQut0HE1wSJOVCN0XsDFTeZMytBujwScmDJdZfa0pL2UKSwv
         hgJH+3BK5FC8qQaXdLxCnAuia/fzCr3PKy8SxG3OtJ3iTO/CWQBpKmruAliMuU/dL5M1
         Dvfk6X7H0wsx0peIZ0C3LRbB21mXLg4TK/KeLblyzAX8givoBEYP+P8aLVvBnc27zrBN
         FDW+2Uy6DFe7n8D8kXSUjkvz7QF5Eew1TUGniRcI5Xux70Vdfsr5KQVbxsAH4UZFRA5A
         qB6A==
X-Forwarded-Encrypted: i=1; AJvYcCVZt6tvi729pihaaZwICiMcXu3LxyePYak44x+WNhhEGrF96s/GcFbkKR3N6JzDbRbQrAWnUuawUL4nWX1E@vger.kernel.org
X-Gm-Message-State: AOJu0YyAMAdoqb2OqaT7qIjpe1icXNActdTpdpRwtMLXc2FxGfhNmtG0
	4QIYHPWRp3jBo+j7YKpXeDIavVsqs0big7IlgVfdecUvNE6LOTadPQazqyVrMftFgIJyBwuzymL
	jZ6am20rMg5UdL9dLXNPXDF3fUT+KfsHgpgL6KLHmoZySKZeQ4XAmTSKtIJWVqZDvnxWE
X-Gm-Gg: ASbGncuZCI0t/LXTHdjxKtm5m3OStUntqPynIlBB0FqnW3lGm8GViF8x+mfNuZCZO0i
	ogRBoboaNXtnrtRUxbwETYTQHlu6AMXUF9Nl4kusyWOBo5Ezv7Zbpwlamx+3859phHQHEMCnKrS
	dYBYVHAyrBKFqArFr+U4xayerL7a8bUjmhGmRia2hWQray1S2IzDBs4JDZ3RVqWOgB/pax6xcJl
	FJteT1/u1B4QoTukhd8Dsl9n+oKUSOPoIqdwM2Gx2FQwj/DlyNp6nm13xRxSjofCuQzS2O+j0cR
	HWsaYIL/bEnq4ASoe/LW6wXsF0VOzDrdeGJdNfrUpFzUSuz6YRePuh91P43tGka9vCJMV2YC6er
	6B1/O9FzCuL+UHr3Io/69cY+NA840LJKvwnOQ45xkSaF7+CPwdtyHlYVyhyQkF6vJQi3+n/7fh/
	VUP2QWlftuXhhFNZQgRPJUqgU=
X-Received: by 2002:a05:620a:1708:b0:8b1:1585:225d with SMTP id af79cd13be357-8b33d497510mr382775685a.82.1763743583620;
        Fri, 21 Nov 2025 08:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRWaAqzZHl1p7u4hKa0AaNatE6ic1VlC2VdmBCj9jG6rJAGp7VmzQL9XnlDqjTM3vddA9vuw==
X-Received: by 2002:a05:620a:1708:b0:8b1:1585:225d with SMTP id af79cd13be357-8b33d497510mr382769385a.82.1763743583064;
        Fri, 21 Nov 2025 08:46:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596a0d1496csm1288609e87.71.2025.11.21.08.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:46:21 -0800 (PST)
Date: Fri, 21 Nov 2025 18:46:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tessolveupstream@gmail.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <46k4uvtoit5tty3ojh7da7yliqz27tdcscu2co5tuowy33uicc@v3f3cojpwvzp>
References: <20251118130814.3554333-1-tessolveupstream@gmail.com>
 <20251118130814.3554333-3-tessolveupstream@gmail.com>
 <ug4n5dpsg5v5jwhwmjaktvydhtfx6gagoum6lul2a27h44xexz@uvdu6ma42wei>
 <17085f43-22fc-4590-bf42-6869ca3d7bd3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17085f43-22fc-4590-bf42-6869ca3d7bd3@gmail.com>
X-Authority-Analysis: v=2.4 cv=Ce8FJbrl c=1 sm=1 tr=0 ts=69209760 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=BjXusaqdeZu2ZgiMuIEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEyNCBTYWx0ZWRfX4241LQsaRWZZ
 T3yZmZcLn9E3UN1PTzeW90mvnJ51RafDSUZ7cYRTmzLsbSwcrqWcLJA9aw2BTgdi0UMunI/Mh9+
 u339JYkVj/ibQjyuUgOOZuKud+fX/JE3zS2PvvpNcqjax4qZSIptUGfelAzJA8AT+sYtf7GqlUU
 SzzUzzFZudJu9Pc+Mo/45RPoDHjLQDSOH41//mboQD/OEQuY4Gu1/k+woLvm0AGmBoVXAhj9mTZ
 GCfluH2qPsS34PtfBA+xiyzxjFV0Y1H+4FlKDY86TFyF9rFthZhIYSJgLIJbfod2Ttv4jHQsdDp
 subaIk3Qgm8RYZjcnJUJPMrcO+JR53paqOD1rqUMCJMzpyQZpHHa1ljvRzCB38RKmZR+9cySwJx
 sZxe8A/xaktkbkm+5ccJp3SpYe5Oww==
X-Proofpoint-ORIG-GUID: C91u5N26MNsYph5iOSzkSpvaNUrME7_R
X-Proofpoint-GUID: C91u5N26MNsYph5iOSzkSpvaNUrME7_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210124

On Thu, Nov 20, 2025 at 01:02:39PM +0530, tessolveupstream@gmail.com wrote:
> 
> 
> On 19-11-2025 15:55, Dmitry Baryshkov wrote:
> > On Tue, Nov 18, 2025 at 06:38:14PM +0530, Sudarshan Shetty wrote:
> >> Add the device tree for the QCS615-based Talos EVK platform. The
> >> platform is composed of a System-on-Module following the SMARC
> >> standard, and a Carrier Board.
> >>
> >> The Carrier Board supports several display configurations, HDMI and
> >> LVDS. Both configurations use the same base hardware, with the display
> >> selection controlled by a DIP switch.
> >>
> >> To avoid duplication, use an include file, talos-evk-cb.dtsi, which
> >> defines the interfaces and peripherals common to both display
> >> variants. Two additional DTs (e.g. talos-evk and talos-evk-lvds)
> >> can describe the selected display configuration.
> >>
> >> The initial device tree includes support for:
> >> - CPU and memory
> >> - UART
> >> - GPIOs
> >> - Regulators
> >> - PMIC
> >> - Early console
> >> - AT24MAC602 EEPROM
> >> - MCP2515 SPI to CAN
> >> - ADV7535 DSI-to-HDMI bridge
> >> - DisplayPort interface
> > 
> > You got the question for v6, responded there but didn't update commit
> > message. What is not enabled here? E.g. why isn't venus enabled?
> 
> In earlier patch, we have added 'Wi-Fi/BT and ethernet is not 
> supported'as a commit message. Later,based on 
> Krzysztof Kozlowski’s review comments, we removed the same. 
> Please find the below review comment for your reference.
> https://lore.kernel.org/all/20251028053248.723560-1-tessolveupstream@gmail.com/T/#mda58996a7abac13780f8ce2cd49b84c32d4c50a6
> 
> We are not clear whether 'Wi-Fi/BT and ethernet is not supported'
> should be added back to the commit message or not. 
> Could you please confirm your preference?

If you are unsure, you can add this info to the cover letter. Or you can
write something like 'Ethernet and WiFi/BT are not (yet) supported.'.

> 
> Venus is enabled in this patch.

Ack, excuse me.

> > 
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
> >>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi  |  56 +++
> >>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 447 ++++++++++++++++++++
> >>  arch/arm64/boot/dts/qcom/talos-evk.dts      |  94 ++++
> >>  4 files changed, 598 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> >>
> > 
> 

-- 
With best wishes
Dmitry

