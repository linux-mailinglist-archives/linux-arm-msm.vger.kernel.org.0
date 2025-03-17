Return-Path: <linux-arm-msm+bounces-51630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BAA65538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 16:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6F6A3A60F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E1F2459F4;
	Mon, 17 Mar 2025 15:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StjnEUDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45624502E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742224389; cv=none; b=qzr6u2ekGITpm3JIJnCuR5q2FRWo9B3R5q/ZSADWIMFxuKXc6eHBPd+vAgRKDzJ4T2rq6urJ6oBN/1TKd7g+qFe7OAFB11Co3dc30zphlnqOTiXQ3qLNCNQ6f9Aad+9S1eUrhKYSPwv0cHos6rEoYwAqwfPe0A1/IBph6jvV3uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742224389; c=relaxed/simple;
	bh=SDvhxwcv7TdKOadxWFuLJ0D8uidUwI4ZDk4N4XVcyBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/q0YLXLW7IUE4aAOZr4vIGRYxLJuzaMVqWMR2Aiae6jD3XG+qzFREcaa57ITFUu3b5PloFQqYa9GZCMkNmXx7dTUAdLGP2YUoU5vJMWwwf3d7qu9N2ng8dIznWlBoh0pXBL9V7feipPpmpz/hiJPhlAx1mRFqxDSGXP/hoz75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StjnEUDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4FYZ016310
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 15:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XrJDaL888EkzEDNTms51lcge
	hu13HyvkuZYeEeKlbI0=; b=StjnEUDG6HNwZOosjSO4sPdkSWSEerifWKGBiaKE
	lVmmEaBjWxY/W1GS1rwaD72c56MBuTFnAiS+7SWgqHdLz6LiE614la/w/GE0Nouh
	FRz3T4GWz3FLsabJgWRTIYorrhZOhwAXUmiwFnCAycFSDS40LKvBulGgykavLe20
	jMy7vr32YepPTu3TFX8ZnCtSGkEN/HD/iepI4D+QGJZeyhL1aCM5vKxzvXEbeQy9
	B+jAMn7ys/OxeDc+lMZNq6yj5f/5izIJKnxFbt36dVvbTI0WqeKb4wdNCgbixtGL
	g+PJb2H5pV9J1hO1/nzndns7nJukZQ4XeaZDShFqgbeNwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1rdn5mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 15:13:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b7ee195bso840309285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 08:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742224385; x=1742829185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrJDaL888EkzEDNTms51lcgehu13HyvkuZYeEeKlbI0=;
        b=ww5row/rxxXf6/Z9SjbtW4z8i+ZQrItOYWx13NA48cTBoGABTxPlz4KgLxNtag5Y+1
         KfiVHktcauNy2H/CeJ3R8lkygUB6bmcGl75O//btSVcwS8OzAshjomuxztqh4GGKO2dL
         rFJiX2njxzyciOYPi69laWaVwROTuQnlABzU41fSjZWU0WvkBZKFE5GuKNl2KlH+8Ge5
         XgN2Ng0Y2fZ96vEcq+SsdV8HVafidt97Hsm/w8WFRnsUf0sHgb7Ir+jgk3bWjuk185n9
         QxO3ZmlLU2cs42y6y35GZaQkPeTjTgHlZqAug4sypJ6mJ8YZIY59UAshLeopOgbLk/wP
         /kaw==
X-Forwarded-Encrypted: i=1; AJvYcCX2EcBVHzgqvsRdfO09CL+w/1uKGs7yixedFVkx+Y70m/2PWsbu1D3cpemDTTv/OHpLTUxq4Cz3YZgjVdYO@vger.kernel.org
X-Gm-Message-State: AOJu0YxdrwS59mPWhiheVmIPctYAsirkntUVXV2cAmsSwVfNxkI+lXQs
	2s2qDzlFhcs5+B48yyIBxHozxuUkZ+G5GqxJLQhhlfcCFfNKGYGgsvjllTAP581YUoGClrXt40O
	tgVU6LsprfyI2wHb+rPHo2cbPeodJmzd4wPq/RpaQQLbs9tVla6DPJfhd/oehHB2Y
X-Gm-Gg: ASbGncsWruNYkiSMGLtcg1s4xfnFa9Z31qPPHVJsrZ/Z2JiaMdI4BaJ9UOt5Z4G/B17
	AT3jlrF3AVwc8L77hpMiz6KIJuvHZ6oauNGlKguzfD4DIJG35eOJf9gMobKQl2SA7OMYcw/kld3
	gom3iuVThNeAspqkczi7TAKfpfq6f1qRSNom7NDcqTmwL8WVCHgP1Fbm0iT9OK0q2v3ubAsUho5
	PhW8u6DI0czzESg88QKTjKRB+1c3DqBncExMpuWuuTWr/s6E39p14u7MTCtIyfRmsI2RTbld+OG
	MfAYb5hh5tSbilYxfnfbbXv2tRV97m3pkfw3re++ZgJ67mAL9cmbcfW3FsqOApIDJWo1spGjhaQ
	tLIU=
X-Received: by 2002:a05:620a:c4e:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c597881765mr208498385a.45.1742224385485;
        Mon, 17 Mar 2025 08:13:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvAdOfSJ60Q9e2nCDna3LhjC5zfyZWJ3xn3wOOtOquU4EkmFzJJKQlq5NRNd8kCa2QmdisMw==
X-Received: by 2002:a05:620a:c4e:b0:7c5:9788:1762 with SMTP id af79cd13be357-7c597881765mr208493685a.45.1742224385093;
        Mon, 17 Mar 2025 08:13:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba865096sm1355327e87.132.2025.03.17.08.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:13:03 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:13:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ivan Belokobylskiy <belokobylskij@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Tony Luck <tony.luck@intel.com>, linux-hardening@vger.kernel.org,
        Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v5] ARM: dts: nexus4: Initial dts
Message-ID: <7z2u2almxk7rnd6cx6nq3ypgbzvttkj3jqawv5jojayjz3foix@zprthr6awbcp>
References: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
 <174221818190.3957236.3364090534153729086.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174221818190.3957236.3364090534153729086.robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=Fe83xI+6 c=1 sm=1 tr=0 ts=67d83c02 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=8B4Imti52KGAqkOr0YMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1b0LehENJutLJSghVZV9wLY7gutpP8yr
X-Proofpoint-GUID: 1b0LehENJutLJSghVZV9wLY7gutpP8yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_06,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170110

On Mon, Mar 17, 2025 at 09:18:33AM -0500, Rob Herring (Arm) wrote:
> 
> On Sun, 16 Mar 2025 23:16:55 +0100, David Heidelberg wrote:
> > From: Ivan Belokobylskiy <belokobylskij@gmail.com>
> > 
> > Add initial support for LG Nexus 4 (mako).
> > 
> > Features currently working: regulators, eMMC, and volume keys.
> > 
> > Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
> > Co-developed-by: David Heidelberg <david@ixit.cz>
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> > Changes in v5:
> > - Sorted nodes alphabetically.
> > - Link to v4: https://lore.kernel.org/r/20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz
> > 
> > Changes in v4:
> > - Sorted regulators and added regulators compatible.
> > - Corrected pmic include and references.
> > - Moved &rpm outside of / node.
> > - Moved and simplify pm8921 keypad.
> > - Added chasis-type.
> > - Dropped incomplete WiFi node, will be provided in future
> >   contributions.
> > - Link to v3: https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz
> > 
> > Changes in v3:
> > - rebased against next-20250307
> > - dropped backlight until driver gets converted to DT
> > 
> > Changes in v2:
> > - lge vendor doesn't exist anymore, rename to lg
> > - sdcc@ to mmc@ to comply with dt-schema
> > ---
> >  arch/arm/boot/dts/qcom/Makefile                    |   1 +
> >  .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
> >  2 files changed, 342 insertions(+)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz:
> 
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'reg' is a required property
> 	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: soc: replicator: 'ranges' is a required property
> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@1200000: compatible: ['syscon'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: timer@200a000: 'clocks' is a required property
> 	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@5700000: compatible: ['syscon'] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
> arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#

As far as I can see, all those are generic rather than being introduced
by the new DT. I'll send a set of fixes soon.

-- 
With best wishes
Dmitry

