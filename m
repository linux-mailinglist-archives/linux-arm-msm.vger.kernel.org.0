Return-Path: <linux-arm-msm+bounces-73673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CB6B593AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6A27A8A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2652BE020;
	Tue, 16 Sep 2025 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfyAVtDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C43043D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018563; cv=none; b=Nk2L6YX5xJjYektjjJukeoEQLxf/V6poVbnHJI15nREFH3t3ZKlTRDLk35FZr4ar9uPjWMKEqFaPaLXrGcOcHfRJwcWI1M8i0ePVXiUmBRfMplBFyV/fcFNYeEKwAPSbXznx6aAWACVpP0HIotQ5VLDo899Fn4YRnJz3/ul66rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018563; c=relaxed/simple;
	bh=W41XG+VcXt43LUvirb/AV12HcyVDg1aJXstceROvD1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz+4MfKJqmKVbUSrIyF+0+3s2OJoPkm8uwYbZAksW+uCfRSZ13csh5RR48/2pvFBy84zQbbHGWpN3Gd6rvONIc8KEbcojd5x03+sdndwAhiip2p5Ze75qyhMmgggx/5xxpgbCKb3Lgi6lhBJ5T4ntRu2yc/NEn2F9ts3M9U49XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfyAVtDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAKkSo010528
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjc236GagAAuG1GjVxN5vmBCcQ2QaumH8QuL7GP8Krc=; b=dfyAVtDwQvq5KdOz
	Ggs5DIzcIKeF4anPCYkTsYZZBYu1r5pZwAGWa6fSA1DT2gO/nG3bPScSkeGpYOGR
	q9uJu1PgUpF6dbrNNMRR5NetstUdN2PGfx0Z/92LYtRoPgE2/OkNFszi79bvnJCv
	XDeNhVOsc4if2eiwOtDPzzAH4HK7fsjKdU7jwc6O8zaSZNfqf1bChsRghrd6arvJ
	resSivQKyd8m54lqdQuwyVvLAGuv8iSCdukRGHr/rHOj/vWh1yvSVSgKFLhKKd0y
	PPRV1sEADcHzrtU0mLTmXE2zbeJA7QgoazpSCZcndzVhdbyEb7A94IYIe+dH55ZO
	RhmAjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snrap4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:29:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-817ecd47971so1385431185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018560; x=1758623360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjc236GagAAuG1GjVxN5vmBCcQ2QaumH8QuL7GP8Krc=;
        b=fFpJHvStea/GTMvhoogHGlZ/aSLLVyx8QFvPffMAPx5OfCPqUdXBfFkDgdQ0wff1I+
         o6KEolIASTJoX8miY6igUYDcjAC5/GRkUy2esdv6EmyiLKVKuIYfTDzKCLhXPjPIPVSN
         AwyuumTQ9m/90XatKDJukVb1wg//+KYDCePTLc7vh17b9MdTPaEitOtFRLphOQBYipPK
         v/MGo3UAkkX9kskAPL9dPQwBXtIMRP+Bb4DeXEBl75r6kmP2l65Tb+ZCb7hYQqVdxGaG
         bhHGKawzPutiSKdoAVA4f5myyqX1iBGIOGSU0mnvt9HRyU95Zp3dT0cNlEseLn9kxxX/
         VsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsJpHdEpC3FCF3pdCcOxZWoCoIFgP/vM/VUUmk/jVvmlBBHfG/qnRp9+7xwN4dWJNebPpySoP+jt+3UZO4@vger.kernel.org
X-Gm-Message-State: AOJu0YxAz/aWQpcpS5YKY6ziMe+0w6Lqug6iQPrt6rAencTb2fUbqavk
	PFC7TXsGlcAwnddLTzIIF+kBegxUQbRB/DCLTgGHCzZltWYl3Cetne1uw4pMNMarWUfbrrjwDns
	hPZYc7Xn15f7NYacrJA9HpI/f4peq/uoX8olnWdumfLphBu7gDm8EY3v9LFvqKh4mFtLT
X-Gm-Gg: ASbGncvaFYrozisgm8NNoQqDRlt6uoR14x2SNLRVPS67QwPMAhmag77Yptwx/eL9QMq
	dwyb1NQDeYU/znTgTi8+pqbNSwok4efS/FdzDJFJzu3qTemAiKETSkdMljHqfOPiSKtfVoV7hrF
	tT728/8oYEg7CALdMp6QhRe+wNuSt2644aDxPlAPcbaEzhF4l4jILGAkly1TEw5f34rbTILf/FY
	UujSIu/HYdcnSB0DbGQSxyzO504SaPxJmvWs/nU7nZtNB2TqDpEO0tH9hqxk3C/2R2NRfy0fDx3
	GZ+BJF/K59IhMoJfuZeQ1Ge33gEjqtqpQyQt5bZb0z0IhEtpSE3FiT3Y5XYIWDDV4k97jLle0Bp
	ALIbj8nHVSUJeAmN7clpP3oLyDQgJnq8/AJ0+dIqYoNVIQYt1cRA5
X-Received: by 2002:a05:6214:20ac:b0:780:a69f:d7a8 with SMTP id 6a1803df08f44-78d5e5ef10dmr13227256d6.21.1758018559766;
        Tue, 16 Sep 2025 03:29:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHlOk6xxLvmgGoKl9Oz0VBGIlnFZcTk1O6pZfk8xFUIOuu/r3qlX4woNj4vW/bK9oeM9aVww==
X-Received: by 2002:a05:6214:20ac:b0:780:a69f:d7a8 with SMTP id 6a1803df08f44-78d5e5ef10dmr13226936d6.21.1758018559048;
        Tue, 16 Sep 2025 03:29:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65d11f49sm4346755e87.142.2025.09.16.03.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:29:18 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:29:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingweiz@qti.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for QCS615 talos evk
 board
Message-ID: <4e5hygjnmbnxm7gmdqce5w75nupwxo3b6ehgocmrjmfuhlomf5@6ydkk2yaxazj>
References: <20250909125255.1124824-1-tessolveupstream@gmail.com>
 <20250909125255.1124824-2-tessolveupstream@gmail.com>
 <f6kaau5sxgleuim7cgdw6hsvlwl73ye7emwjtrxwvtpl3pxsvr@frxbvtv6ixho>
 <98a92bff-db74-4b14-8a19-1171e60e87bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98a92bff-db74-4b14-8a19-1171e60e87bd@gmail.com>
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c93c01 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=t2fj3te4-gpxl8S1CQ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: B1TE15Thxxa6Qc0FAafm6vKzQn1SLYNM
X-Proofpoint-GUID: B1TE15Thxxa6Qc0FAafm6vKzQn1SLYNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX2BBCX6Vk4oj2
 Nv19sW8iwf75+4iRZ1Tnu8FzbjZ5DphCSJyR6djc4E7tzrDCJI3w2qYoX/aS0iAqoEL1eOyE+BL
 IInEx1BJITAPNC3gN+CJ5+FhyntChh06XPLqH+j/owpYcqy3/a5NGnZOQoiNUzr2+xmxiaAhVpm
 UWtwJggibCPg909IS8rKca32FQc7THzrUrf1VZhLNSR+EBUuXAUsMpBSh1sZh0JM8I/ciNU2+RY
 kyWZRBe8q5NZWBUDQBJvuBdxLCMJLqP1x0BtDM+JZcHuzPdzoZcEyvldVqP9sX9tLcb7Uc09qsU
 j+kadopE5A8BFMHu22uklihUCGZRj0CWV+k2Fado4h03FVjLo5zFmrSSS0BoyCE4WSuY84802s/
 e0zKbDXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040

On Tue, Sep 16, 2025 at 11:17:31AM +0530, Tessolve Upstream wrote:
> 
> 
> On 09/09/25 19:56, Bjorn Andersson wrote:
> > On Tue, Sep 09, 2025 at 06:22:55PM +0530, Sudarshan Shetty wrote:
> >> Introduce the device tree support for the QCS615-based talos-evk
> >> platform, which follows the SMARC (Smart Mobility ARChitecture)
> >> standard. The platform is composed of two main hardware
> >> components: the IQ-QCS615-SOM and the talos-evk carrier board.
> >>
> >> The IQ-QCS615-SOM is a compact System on Module that integrates the
> >> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> >> SMARC standard, which defines a modular form factor allowing the SoM
> >> to be paired with different carrier boards for varied applications.
> >>
> >> The talos-evk is one such carrier board, designed for evaluation
> >> and development purposes. It provides additional peripherals
> >> such as UART, USB, and other interfaces to enable rapid
> >> prototyping and hardware bring-up.
> >>
> >> This initial device tree provides the basic configuration needed
> >> to boot the platform to a UART shell. Further patches will extend
> >> support for additional peripherals and subsystems.
> >>
> >> The initial device tree includes basic support for:
> >>
> >> - CPU and memory
> >>
> >> - UART
> >>
> >> - GPIOs
> >>
> >> - Regulators
> >>
> >> - PMIC
> >>
> >> - Early console
> >>
> >> - AT24MAC602 EEPROM
> >>
> >> - MCP2515 SPI to CAN
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>
> >> This series depend on the below patch changes
> >> https://lore.kernel.org/linux-arm-msm/20250625063213.1416442-1-quic_ziyuzhan@quicinc.com/T/#t
> > 
> > This was merged August 11.
> > 
> >> https://lore.kernel.org/all/20241224-fix-board-clocks-v3-0-e9b08fbeadd3@linaro.org/
> > 
> > This was merged December 27.
> > 
> >> https://lore.kernel.org/linux-arm-msm/20250604-qcs615-sm6150-v1-0-2f01fd46c365@oss.qualcomm.com/T/#t
> > 
> > This was merged July 16.
> > 
> > You just wasted 5 minutes of my time, tracking down the status of these
> > dependencies. Don't list dependencies that are already in linux-next (or
> > actual releases), or even better, only send patches once the
> > dependencies has landed (or send them together with the dependencies).
> > 
> >> ---
> >>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
> >>  arch/arm64/boot/dts/qcom/qcs615-som.dtsi | 414 +++++++++++++++++++++++
> >>  arch/arm64/boot/dts/qcom/talos-evk.dts   |  42 +++
> >>  3 files changed, 457 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/qcs615-som.dtsi
> >>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> >> index 4bfa926b6a08..588dc55995c5 100644
> >> --- a/arch/arm64/boot/dts/qcom/Makefile
> >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> >> @@ -117,6 +117,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
> >> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> > 
> > If you look a little bit harder, you can see that all other entries in
> > this file is sorted alphabetically.
> 
> Yes, Will sort it in v2 patch. 
> > 
> >>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> >>  
> >>  qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vision-mezzanine.dtbo
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-som.dtsi b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
> >> new file mode 100644
> >> index 000000000000..1b9b2581af42
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-som.dtsi
> >> @@ -0,0 +1,414 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
> > 
> > This is not the correct copyright statement.
> 
> Thanks for the review. 
> I used above copyright since qcs615-ride.dts in the same platform tree already follows this format.
> If you’d prefer me to switch to The Linux Foundation for consistency with older DTS files, I can respin the patch accordingly.

Please check current marketing guidelines, then you won't have to ask
such a question. Also please fix your mailer to wrap your responses on a
useful boundary (usually 72-75 chars per line).


-- 
With best wishes
Dmitry

