Return-Path: <linux-arm-msm+bounces-88768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BFD187D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 12:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24877301C0B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0F038B999;
	Tue, 13 Jan 2026 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXNhj1XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbhf3D4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60F32BE7D6
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303755; cv=none; b=TIznqQDBl07ADpWV97f2V4EfRDX+O9GOCxmXqqRoPYB91pnil7o/lTLEoy/w8RCDQJVllpMeLHemVI5DtKeLGuJb060c/1d1bfS1Mtiaqipcs9pCRFCkX/jYHR4o4dqcUtf6Z9h02R7fcpIRQv29r/j/lr/ow67RWHOF36bc0s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303755; c=relaxed/simple;
	bh=eGZZgccgcpR/JaeVYh+J2xthh+WiSwa0v3WELSPPNM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRgvL2PPlojOmWe2Z0gP/DEKiUNbal4cv7c4Epsrw/IXIVGjJ+fpLpM0OqEIoApPlo4Auf93RUHNXK8PiR21fY8fsacVd+0WZP3iAnlITm88vPneW9AC1HwKa9CenVTYIEz9t3n8qnAmVkhuxATPYLPa5zbikdGITPO15el8vcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXNhj1XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dbhf3D4z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DA5psV3799018
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF9l+fb4e/cYG5xTYkEhk0Sjq46FyphuySf0LqafbSY=; b=MXNhj1XUd9fkFqWQ
	wIcJ20ezuy58f3C/yZJuMhAnTbAV7/aNefHmX0mW1wQjyE//szBQGXrseEkZuyOB
	m1MIYN+LGKrFLfXZV6CA62Sem6fViVRfOIcFY82JaWDA22QuLXvk32x4tPNn8YCB
	mlgzbeskuj61oEaFyI5ezY8dTgsCY4TWz01nCflWKdIDCXUxcevkL1sc5VxrJP/I
	9P1NDkzpaW/jxAn5kDxEVsIGwvs4+K1f5yJ+mXBSdNbS8b+4+9gU803B9LBcOJ3m
	qfRzYGTV3d+kwmsDR3XIaDM1S8F8zTxP2EhlCFmyUceDafzrvPKMRlq9YRgS2HWA
	i2PzCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0dr8hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 11:29:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5297cfe68so47766685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 03:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768303752; x=1768908552; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vF9l+fb4e/cYG5xTYkEhk0Sjq46FyphuySf0LqafbSY=;
        b=Dbhf3D4z1VaQSg1IgDkfZVsz4Y6RRZOPktLMJ4/maeEBLmztslIRBHpll3m4AEt7Vc
         PrdXIoiLDsmh28hOnab+R7TisH2VIQZpIcoc+utXEqCtYyL1lyk5Q/2qlVhhkHBEnu2P
         Y43uHArwcBELHv3ImExuvrV+3CGV6q3hjFNwsqhYkn1fqd/zfCfoX2GIey/wV2H0EdZv
         dKmj3KXVoxtd7Tuil8o91TXKldJkJSkYhDFBV8CaclV+GirnvBtSBtgFa7S746hNFWbM
         tVJ7rEpoavNWK/nWiI+nZM2Ss2FUA4kd3nQjBM5DYCYTQ9Rm1qQuNp2mhQaY/uJG+H7h
         Pi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768303752; x=1768908552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vF9l+fb4e/cYG5xTYkEhk0Sjq46FyphuySf0LqafbSY=;
        b=uZSeFuSgnoEzEIkr7YELN6ac/RBwn7KZ6xY4HF8xOliIE/MNtDTtpzxRote5TgHQG1
         pwts/pah9Ks1CxGhi+aY21WPgp+GSprdO7+RJZNqaUKeFKL5sgIAX2GdQ+kFLPjPJSfs
         FA9QB9lXbFP4doue/3lJ7TGlnGhoEBd1N12RGfjx6Uymp7CaIFpn4P4bcfthp/nvMctc
         7R6+dVIxdDgoB6f+FbccKYzKcw6QQ2AyQ3d1QFze4BgkgM/xq50HplllN7J2r005vKCw
         Vxu9CeMi+Ojqt4tuHwT+RIbIux9PyaAsG0cvpkDH7LDSiphHwuHcH+a6EtzX/g3Kukay
         Pn/g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3mOynqWHGX/QAwk8G+g3XkGmRpCVA0hTXiXkBcmE/d6De2LSQsynghocIPEFdU4Xqk8POGGvUqlnBWFa@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyFzyTNiG0ZzYMy9e7wK8FZVejSPC6hW0AZ+gTqxaLAWXxcon
	xDk0ErJm33u9tdbdzzS5G/GA7RgwdolKP1smT9o19lV9oUQ9Pwc9OR6iKsnuf6U3dbfuAIZivL8
	JwodkNA80ToCCJ9KoaIDtDUVEBobuifi/yrAOsiOHsJNgmBTgfvyJP7jkuOgfOaExdH2X
X-Gm-Gg: AY/fxX5AdEbll6ohnvhFLWENTqqYF/wd9NcLKt9zdZibbx8mB+gGzsCv3IHPFCHZsqT
	r/fFAYMCNGr4jY8c8vCRjLMyCex3jeca28v6v+wdhgbitQnh6y9YblErUPEJU3F0VIJUnl3xGLO
	hrFpJWMVFca5tZNX43RNaYAW+JcxVgX+WADgRnaZ/Uj7D6O9oMyJZx12qC9m3LDJ6wwD3eHuWlH
	RFm7ez4jTds+fybByIaJhJZHEjyUejUROZKs/dS4GvU9I02VX2W/YUioiHFsQQOuUq8LsBMMHeJ
	PNz9EKQrHluOHxsIpzJ/r5jNpREpkFX5fxj9IbhNjugQnd3nDVdPa6vUfnaycqY68H6Sa4BGExw
	8DX8Au0YvZvRa93OSkAuEyvv6WajdzaGEmuWq6kYhC1IuBHhvqKMyCXF/8O1Q/SfKheZnsI2Qk9
	phezSHR/UwIsSICTR3P7oPNwo=
X-Received: by 2002:a05:620a:414f:b0:8b2:f2c5:e7fc with SMTP id af79cd13be357-8c3893757femr2856796985a.7.1768303752102;
        Tue, 13 Jan 2026 03:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpjrF4n+gdyf96X8il7mrinkoUjfQiSc/k+X+vdYSmWzaD8NIKkyhZkIC4RqiENTrPc+Q/8g==
X-Received: by 2002:a05:620a:414f:b0:8b2:f2c5:e7fc with SMTP id af79cd13be357-8c3893757femr2856793885a.7.1768303751609;
        Tue, 13 Jan 2026 03:29:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6c634631sm5129949e87.13.2026.01.13.03.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 03:29:10 -0800 (PST)
Date: Tue, 13 Jan 2026 13:29:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary
 USB controller in host mode
Message-ID: <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
 <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=69662c88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=o7B0pVO_YLVwEXfCrecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6cfdUzT61PChihIgeKKlAlYLP2Ms9hAF
X-Proofpoint-GUID: 6cfdUzT61PChihIgeKKlAlYLP2Ms9hAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA5NyBTYWx0ZWRfXwTKvipYajEdm
 r1sYzqKBoVqN0eq2ryswFeeZET5bWxx+DdKsuRjtuhSuln2jDiKLs+QCZWAJJMQ8LAzQZZlgyuC
 Ii1HKzgvq4qKjuS+6U89yDLGHKo4lDzDYKql+d0casrbFo8uzsfLQBUujXW+0sbzUDx5z/lMEzm
 RsbZ2KuFiGzhRLTtCAJropJ+AvdXrAqKXfuXYN11tzUUdM+Y6MyAQG5kQcOPDYqI7AxvnqLXAEP
 FggFTzdqo1oPYjxbxV45pYgCirV+1CPHtALk7grJ0bYsUZsfETnVRNqVholcwmks0BENDjdiNHp
 IlZwA9e05oaTL9tCPoYJ0HENMYySPsItCq1/AHOHFK3sFogApaH5OpGBE9Ny1UqImBu9iDF5J+a
 Gz7LbhiQzQpJAT4xfPlw5E7Lntz/LVeLxjKJaw8O1hH6zm9HYuOLPR/f3DeYQ2GUzt8dE0k7mUn
 ELOAW1bJVBRhWjotXOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130097

On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> On Sat, Dec 20, 2025 at 9:47 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > >
> > > For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> > > ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> > > lines run from the SoC through the hub to the Port controller. Mark the
> > > second USB controller as host only capable.
> > >
> > > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > > controlling vbus supply.
> > >
> > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
> > >  1 file changed, 158 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > index 70d85b6ba772..d72639479d75 100644
> > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > >               };
> > >       };
> > >
> > > +     connector-1 {
> > > +             compatible = "usb-c-connector";
> > > +             label = "USB1-Type-C";
> > > +             data-role = "host";
> > > +             power-role = "dual";
> > > +             try-power-role = "source";
> > > +
> > > +             vbus-supply = <&vbus_supply_regulator_1>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg = <0>;
> > > +
> > > +                             usb1_con_ss_ep: endpoint {
> > > +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb1_hs_in: endpoint {
> > > +                                     remote-endpoint = <&usb_hub_2_1>;
> > > +                             };
> > > +
> > > +                     };
> > > +
> > > +                     port@2 {
> > > +                             reg = <2>;
> > > +
> > > +                             usb1_ss_in: endpoint {
> > > +                                     remote-endpoint = <&usb_hub_3_1>;
> > > +                             };
> > > +
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > >       edp0-connector {
> > >               compatible = "dp-connector";
> > >               label = "EDP0";
> > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> > >               enable-active-high;
> > >       };
> > >
> > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > +             compatible = "regulator-fixed";
> > > +             regulator-name = "vbus_supply_1";
> > > +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > +             regulator-min-microvolt = <5000000>;
> > > +             regulator-max-microvolt = <5000000>;
> > > +             regulator-boot-on;
> > > +             enable-active-high;
> > > +     };
> > > +
> > >       vmmc_sdc: regulator-vmmc-sdc {
> > >               compatible = "regulator-fixed";
> > >
> > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > >                       };
> > >               };
> > >       };
> > > +
> > > +     usb-typec@47 {
> > > +             compatible = "ti,hd3ss3220";
> > > +             reg = <0x47>;
> > > +
> > > +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> > > +
> > > +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > +
> > > +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> > > +             pinctrl-names = "default";
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg = <0>;
> > > +
> > > +                             hd3ss3220_1_in_ep: endpoint {
> > > +                                     remote-endpoint = <&usb1_con_ss_ep>;
> > > +                             };
> > > +                     };
> > > +
> > > +             };
> > > +     };
> > > +
> > >  };
> > >
> > >  &i2c18 {
> > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > >               bias-pull-up;
> > >               power-source = <0>;
> > >       };
> > > +
> > > +     usb1_intr: usb1-intr-state {
> > > +             pins = "gpio6";
> > > +             function = "normal";
> > > +             input-enable;
> > > +             bias-pull-up;
> > > +             power-source = <0>;
> > > +     };
> > >  };
> > >
> > >  &qup_i2c19_default {
> > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > >               function = "gpio";
> > >               bias-pull-up;
> > >       };
> > > +
> > > +     usb1_id: usb1-id-state {
> > > +             pins = "gpio51";
> > > +             function = "gpio";
> > > +             bias-pull-up;
> > > +     };
> > >  };
> > >
> > >  &uart10 {
> > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > >       status = "okay";
> > >  };
> > >
> > > +&usb_1 {
> > > +     dr_mode = "host";
> > > +
> > > +     #address-cells = <1>;
> > > +     #size-cells = <0>;
> > > +
> > > +     status = "okay";
> > > +
> > > +     usb_hub_2_x: hub@1 {
> > > +             compatible = "usb5e3,610";
> > > +             reg = <1>;
> > > +             peer-hub = <&usb_hub_3_x>;
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             usb_hub_2_1: endpoint {
> > > +                                     remote-endpoint = <&usb1_hs_in>;
> > > +                             };
> >
> > Are all other ports disconnected? If so, why do we need a hub?
> Hi Dmitry,
> I didn't understand your query, can you give more context to it?

You have described one port of the hub. How are other ports routed? Are
they connected to outer ports? To some other devices? Unconnected?


-- 
With best wishes
Dmitry

