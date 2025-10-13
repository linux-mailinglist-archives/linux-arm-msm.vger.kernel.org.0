Return-Path: <linux-arm-msm+bounces-76959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63CBD2573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61DFA3497EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE082FE049;
	Mon, 13 Oct 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckwE5F9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1755A2FDC54
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760348554; cv=none; b=loGGlllxdnmfwc1ZgCdEIpvD3FKLmw04VU67BoXkWgMoVYpBQ91ugjZMnJgNJgwZu/23IT9ccLoEXdBM+R4W6+BjTSCA+eJOnxX2Ls5yKNv1BvFqOiOUo/4JEgK1F6dLcRTHMg+W+b+dg7VNv+nPuf35yUVf68beokKlTkXMEu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760348554; c=relaxed/simple;
	bh=I+VcpLD2Vwq3nTThX8kfrnW8b2lxLrLieNtKngEorpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYMPVrUKcLFEw+OwQdraNJDCCyvTqA4LXQz9Ks/ZlqTdj4olxZRPqhepkP+Ek47i+74+SSgfK4n96rKK7zpK5dApIKwpJ3RxFa3vLoZVKr4Ez1yvVKxcR6ZpmrW6azCSbWh6kQVXYZyEoxeUmh+2YqDso5AaX9Gh92UJhmroWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckwE5F9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nAxw029358
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEW469dJbFSwk5XAW8ElPGM+xdFOARugfDp8dZgFiTE=; b=ckwE5F9HjBTHQwt/
	c4Sgeg+pxNjuR+rUaRI+wmd83PQNr0eMuGO665+GUi4gQBlSeYjSBJ4nG5j/E6IP
	RkEHTbS/FTa9ihKLIsSDCecVRM2K50hjsB2LDTOVmiNra2Kx7V029yUV0xHCEXu/
	uehCiAZcgd1J+1nPcW4NIAGT//cRk35hMolbDaZ9xV9VbisTPXLKIE2GuvXuxk10
	G+qBoe3HNnN1uWymnkEAH60nTufrOIUMxi6IOa14mU4LJ5NCs5J5XXhbPAO/SX5t
	hSVTgsHIAIYN7fjTv8clFftLuxe5IRUy5aX+n2pz0E1dhsk1Bn5d+TQ7OxHpjNGU
	vJm5SQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5c3k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 09:42:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8217df6d44cso1931281985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348551; x=1760953351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEW469dJbFSwk5XAW8ElPGM+xdFOARugfDp8dZgFiTE=;
        b=HsIa6uBkMAbbM2Ud/4Kw1Pw0ZHm2oPqeH/Lnexags3ZRXhU34Yb3wo8EyBkxFC5LCg
         Qw5shzeMjJHGW1j45UoFJtP6ebJr+gUMrD4tRRo670OZCfCoDvzRpiCUuWB1DASXIiGa
         Uz+hligQ2kAVwZEjXKEYz119LXosfocwxLFVdJvBcgQZEfbQAEnpY3Dr5h89v+WxLfig
         8H4hL0ScKc6XYWDlc06IeiMfoQu22XajakG20THsBmdr3gEG+FinVQhB98E/v+VJCBaf
         Pg7TxlvUnJmb59x3GAhcjMHoMoin+SeWXMy4/V+GwH1yar9v7Sw3jPwx8W7XOYjvjKEg
         rCqw==
X-Forwarded-Encrypted: i=1; AJvYcCWkb8U8G/qnppMk6YOT4uoIW21P+YAhSht6NdNH//sUXeDj2ys3HW5equE/hhjOkb7D1FYSOFBWMd6NdeEF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1D6SuDIjhv16qentqTXppmgdApgIf3FbeTpOD138z9zGbhVR
	UIaUeBbwRf12NCIF/usFF6mKCobhi/WeMIl4Cp1r6gdxC3ZGTD8YRnIEudj6dMIR7ySULCUg1jR
	kvAPUjIOdS4U4V9GFIAb9WgVW9PQYkS1VUg/tB2r15ycDfqwp0sUBTqY2KwT1WYxe9mv0
X-Gm-Gg: ASbGnctTKy2V+9/yB8pW7L3Qp2jI1VtUZwSDKglDyC8ioHpIsDKICicQfhgK4hAQgEB
	b9jhYQQOV4JJ8z4NM2AdFp7Lrrk+KT+Q4q4GMAbvSSGo7OQJSSi8rHBmXh0Wu1c6WxXAMrnXCqx
	CHct/qSoM+AyJh29Pvyu1LXOSULCj+X7vd8mFPcvJAPozTGEStoxM2o5ZDFc9CjqzcFF4FZH2Im
	3E875ASc24aPBG+WKGpInt+rFtrPCz38nZyFYNq2fAbfVu9XFwxnvPpMYasmb4I54FoR/0vQKZ/
	dxpTsr45/EOEu/2GbQl64LpGZMbsYJ2oM43bMQJfmCsR4Zrikh/WMJ/wtEhwSQD38h3GxfwuDEq
	xg2NvMIfMFZ5qmJ4MDhAJyuICxQezmVRk5hsNH9oCK4o7nGAR+Qq9
X-Received: by 2002:a05:620a:aa0c:b0:887:1728:c4f4 with SMTP id af79cd13be357-8871728c59amr894422285a.83.1760348550998;
        Mon, 13 Oct 2025 02:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5rMB9HvB5AXbxg2RKZKWc68eyxTWU6vytaj2N3831Ox5tj0I0+5UFZ/Bm24Ksc00cJzA/Sw==
X-Received: by 2002:a05:620a:aa0c:b0:887:1728:c4f4 with SMTP id af79cd13be357-8871728c59amr894420685a.83.1760348550522;
        Mon, 13 Oct 2025 02:42:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e58sm3942630e87.25.2025.10.13.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:42:29 -0700 (PDT)
Date: Mon, 13 Oct 2025 12:42:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for QCS615 talos
 evk board
Message-ID: <7izkmevb43hgqxosvf5aox7lasnby67kbmyqxjh6hypqvonh7p@x5rm3ehnsoye>
References: <qq4aak33bn3mqxd2edu6zgkkshby63mmitg7zqkly2rj4c2lh7@4s7sndb7e2jr>
 <20251010114745.1897293-1-tessolveupstream@gmail.com>
 <20251010114745.1897293-2-tessolveupstream@gmail.com>
 <q32oj6ry7ixulfaxzkm63nidg7ddmdl2moaakmx6rlv77p3wzl@wd2ekastvyms>
 <2d5a3fa5-3882-4859-96fd-3ff2174e655d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d5a3fa5-3882-4859-96fd-3ff2174e655d@gmail.com>
X-Proofpoint-GUID: _I4QQe6ERe9lPEKoDv0nS0M9th_v3kxi
X-Proofpoint-ORIG-GUID: _I4QQe6ERe9lPEKoDv0nS0M9th_v3kxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX3z7v1fkShUrt
 eSsD2e51RNV0KivUVcPErEZcuQYGim50qRokFmKj1nLXB7JVoC9Okugl1/rZLtwhrdyc3NNqd9C
 epVHixvlcLCa1PfCyM/mwecarKTR0Fqkq3zRwas75AUahpvv+wyc8raAxWAC+jI5lvQWSdFgxan
 /eAt3LBI6oanHR7hEM8maSdt3m/DpYT7PMaS2RGfEWDc6d1Xck3uVH4XJeKiRSwqIUyqBFXsgzJ
 v+mUlPqf5XKCTKkNdKLJEpj7EI0LWLehRtpBjxM77jIIdxHro/0JN0Xp7W1Ry5qMdIxDE1x8hyh
 b25z86bp78pub0pxDs1FGvPYSTr/E3QUKZssMwd7bycObe5NYM3C5hwtyUTxri9TjHjzp2glQkc
 A+xa70ZVrXBoXPNe6xzW/QrsuXKERw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ecc987 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=3Jcqw9wqeHKyueRvwKwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

On Mon, Oct 13, 2025 at 02:34:10PM +0530, Tessolve Upstream wrote:
> 
> 
> On 10/10/25 17:49, Dmitry Baryshkov wrote:
> > On Fri, Oct 10, 2025 at 05:17:45PM +0530, Sudarshan Shetty wrote:
> >> Introduce the device tree support for the QCS615-based talos-evk
> >> platform, which follows the SMARC (Smart Mobility ARChitecture)
> >> standard. The platform is composed of two main hardware
> >> components: the talos-evk-som and the talos-evk carrier board.
> >>
> >> The talos-evk-som is a compact System on Module that integrates the
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
> >> QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
> >> WiFi and UART for Bluetooth), which is different from the RIDE
> >> platform. Plan to enable these in a follow-up patch series.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >> Changes in v2:
> >>  - Rename compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
> >>  - Merge enum entry with existing qcs615-ride block (suggested by Krzysztof)
> >>  - Fix subject and commit message to use imperative mood
> >>
> > 
> >> +
> >> +&usb_1 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +	dr_mode = "host";
> > 
> > Is it really host-only?
> 
> The USB1 port supports both device and host modes, and the ID pin
> is available on the hardware. By default, it operates in device mode,
> and switching to host mode requires a hardware switch on the SoM.
> In the current patch, I’ve set dr_mode = "host" for host operation.

Please provide this info as a comment (e.g. switch xyz should be
switched to 'ON' for this to work).

> I plan to add proper role-switch logic (using the ID pin) in the
> next patch version, so the controller can dynamically switch between
> device and host modes.

Yes, please. There are a lot of users who depend on USB device mode to
work (e.g. to connect to the board via ADB).


-- 
With best wishes
Dmitry

