Return-Path: <linux-arm-msm+bounces-88911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 573DCD1CA35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 07:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC6173009261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 06:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F6C36C0B1;
	Wed, 14 Jan 2026 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P51OLQiH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cOfG7e8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76338262FFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768370960; cv=none; b=po3PNiTQ8ZBoqpH6Zydb4MMuv5RtRYqCgZ2g0hokrU/iF4USQ1jMGoZ5F/iBdIVuyqgohfPshx6eGCBM8G/W10yUImOVnDyvjuU2ezAXcEaNWaDhJeUIwd1ru+pvSS+5nQtOjCkEYahVLv5FVdgmiuLPCFgPtXba8HlOkarIul8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768370960; c=relaxed/simple;
	bh=A7Yjh1ilXgNEn5j4OWYI6qnxQwYvh8K19GYr0XwIkTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GOeoE7gBEHqxBBkOjTJ0a8m13qinirNAQ+xvo1NzKVtRPwqfmUDyphio89HcXq88+dOK0pGVz6dBanew0uaUAWWPOpH2qC+TUlmcKQNNDnYdxoHeXzYKmdDigK5rcNmtZlFNF8nmnzJoF5ytOmxthjC9SEfiW35ZxNyB76vtEZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P51OLQiH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cOfG7e8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E66GYe4131325
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=; b=P51OLQiH4tW6vauQ
	tLofs9EBbTILhvMW9syi9hQ4fn52RtUwc9qBNhgUVwfs5vZOTdzDprcfzDO/FyFI
	fJvSNg+VM+/kND2Pr2NNLOL8np06ybk049JbviOT+1oRz/GjLO6hbszRSwA4tqcT
	LEylCNRAH8yvJ5XX0B7BHPD5iGxCiNwzo4doM6Av+pLVKaryuH9sz4QFK+PVJ8jV
	uLSLwFBilKyaYtXLALaHy2Aitjzdt9p3kD9Svz4ZOHCstuBRgk2YgQtuhfWecTrj
	luvM4NCiYgiOfFZ2uwuslt+jyU5Nl+lbS8LsyH0VOLKlHVrbG2jrdfjVhpnNu7Uu
	Qe4O4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbmay9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 06:09:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5329ed28bso55913485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 22:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768370950; x=1768975750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=;
        b=cOfG7e8qvs0F8aZ33vBlOjwLXu89Aa8G6BSXP55MuyVUWRiRRI3z2y/qZrZn3DCRRL
         TfDAfVQ0gAup19ua3NQEg7G3yzmzPuK3FQyniF1keeMaLwaa32GNeEdWygwrg7kz2Wbo
         qc/NaAKisDjfb1/yUSMBu5WDKrQ23vWfzjYsTxgPjrWQEBvAkj3r6mxyMEpUDiDnwyDW
         9rYkgdDu0s8qn2/EB8N9FLEUfnl0WRgDhKpkvPtSZ7c0u6B+fSotCf6Q9vcxeQncQBMk
         pw7kvTTjcoxmFtB1ADJdtS0JpgAuFgNkjBs8HYKNo/EvO5SKdyWEz72TZVknVdAuyvoT
         jY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768370950; x=1768975750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1h4g2wKN0nIzSG+gugjdS+tH1AxQN8ueKnGhYuUmjk=;
        b=a+YO/Rq+gZdfJLIwAUuo5xVV8q0gbZkBJkLgnEd0yTvbgeBEWfcFVex1kVetn7gQ3T
         tY160dggjE+fuURz+YE8Fq01sUBBQ9dmJxf7zzNZJ82SA4aNYdRM/VC5U1FiZRLxng5/
         6Z3gl/YtHhTxEpNp/xwOhqyCNGX9Yt7Cwg+2QdDsFA7bk5ttWYtWD/Qw00C1UTcb+z99
         7Edk12BnC4rXZNiih4DgNzPZz2FgIf87FUPMCbziOUzbn0nBIsArTCX15Xxce1yIfm8h
         R+KmMiSylxnO3Jk4XFrHgxIioedDXW/2yJoW7yYP5g5+BQUf1hHl68g3uCJtIKdW9Q83
         KxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViuwm2eTRsUNVbVlKl1qybMHe+XGUb9HCIs2GmOuKFwYzZvlEYgRMQEECrtjDFrxTGswVA7rfgmT1tkeSh@vger.kernel.org
X-Gm-Message-State: AOJu0YypVnU8Z+d2oWwMvtXrKL7WbHGYaJfFMVlKoiA0MhsD/dBC/Pg0
	okcUUtaL58NDCXkQA1SuF7Iw96CzaPzzxxj8eYVp2sHBfQINUp0d3PYrVEsFmjS1sIDZWcXCKYt
	OGPLZHVE9kN8HYo00sofmyk1d9xE0H79NqeUMGZFPlff7yuRPqvtNMye6nGf7S4GtW4PI
X-Gm-Gg: AY/fxX6n1Ow173h2XzHQ7vrq5i9Znn0l8BaiTOn/VaprK6uPoPZm6BgB6mYLvgKJoQ4
	PuHuoCh8Wix1U5pQiwYZjHV9twqY2TJwegekjyw+yVj6aW/E0yt4QALoG2+oTFSthhVIwwco10V
	6cveLLh7hejIstF5XMH3UzJNacTQtZlniIoQ+NPpBtuzGC2iv92Dff+UiWZkJIHwb1xLR0vkWow
	/jGL+3YPvcQNOZ0tQ9Xs/ohON2mP6oaDuu7kBRUPghTOc+HSNYJ9nuhbXiEq8EKs3h4SC83jXAq
	7JBV7PAcr/boIzO4GJ+cnNzGOMt4VC5F4bqsTqyB0YVf0k9eEaLot76tCw7Dt3b/gyeitLrS9ko
	oV/yFcQi4W9+/A5wA1q8hGjF18iSBUZokK0adm5ep72be+7O6782w2vT7b6npynz5KeBX7s1qdC
	mr7CGlCuYIUCjx9tk3/t32bxQ=
X-Received: by 2002:a05:620a:1a2a:b0:8a1:ac72:e3dc with SMTP id af79cd13be357-8c5317f0af2mr132121185a.43.1768370949900;
        Tue, 13 Jan 2026 22:09:09 -0800 (PST)
X-Received: by 2002:a05:620a:1a2a:b0:8a1:ac72:e3dc with SMTP id af79cd13be357-8c5317f0af2mr132114085a.43.1768370947809;
        Tue, 13 Jan 2026 22:09:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045964sm381373e87.68.2026.01.13.22.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:09:06 -0800 (PST)
Date: Wed, 14 Jan 2026 08:09:05 +0200
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
Message-ID: <zkvwy56jkya6eogwqlmbhoo64zlzatxsdtkhy4hqfudoqtfbkg@fwiy46l3c337>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
 <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
 <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
 <ftqb2uxp6yk73djyo3psehhqq5wamimtissgfehhziwbkprl4c@phftum3m3sdy>
 <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHz4bYtYMZQSdw4XKSB06fT2MzZHu=AgdXGrZ73XVXi1sMwyyw@mail.gmail.com>
X-Proofpoint-GUID: gRxwKiO24qtSXtdjW69uSjuFzJZ0He_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA0NSBTYWx0ZWRfX9Kyw3fXxp0/R
 HXiAHfeHvVwfPvfWjEHAfQSD8+bU64rjKDJOCDy3wQqp9z+BQqn4IpgeLkADMC8TCMKoEn6JaQ2
 dr/1Au7/+RBRoWDR/zmc2xCMLF3AglTuQkRZeme7T6zz7yqTf4QJurB7iDp94xCabUw1zOBoPbr
 MOTCh/KWFOAFGEe1tbSEk4dfMSMYt/QNcbu6H90FGoM4D04+aUURceqezveUXFhOl/a3ibtI82S
 OwFk4Pk99GqO2Rk/OaHTwbcYGEFH27ZmLa5Pnpt+XrZ4ui8uR+V+BCQaixD4lf5DSPT9eGeaV4u
 R3L3BhOI1EXHssjov37flm90BxTqNT8A3oVuYZLM21djhxw2g2wISsDKj3m+e4wp+xyWnTJaBaM
 jKsUXg89+Xyes8TZWnQXqerbqefA5ITdThIXNBzh60p/8vSQr01g6WtfjUv0qySPkt0zcL3rrVg
 A8JSVQTQTlsCtjqb5Jg==
X-Proofpoint-ORIG-GUID: gRxwKiO24qtSXtdjW69uSjuFzJZ0He_b
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69673306 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=UsA3aJdYp-BRMntT3CkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140045

On Wed, Jan 14, 2026 at 11:10:26AM +0530, Swati Agarwal wrote:
> On Tue, Jan 13, 2026 at 4:59 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Jan 13, 2026 at 01:32:41PM +0530, Swati Agarwal wrote:
> > > On Sat, Dec 20, 2025 at 9:47 PM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > > > > Enable secondary USB controller in host mode on lemans EVK Platform.
> > > > >
> > > > > For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
> > > > > ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
> > > > > lines run from the SoC through the hub to the Port controller. Mark the
> > > > > second USB controller as host only capable.
> > > > >
> > > > > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > > > > controlling vbus supply.
> > > > >
> > > > > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
> > > > >  1 file changed, 158 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > index 70d85b6ba772..d72639479d75 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > > > > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> > > > >               };
> > > > >       };
> > > > >
> > > > > +     connector-1 {
> > > > > +             compatible = "usb-c-connector";
> > > > > +             label = "USB1-Type-C";
> > > > > +             data-role = "host";
> > > > > +             power-role = "dual";
> > > > > +             try-power-role = "source";
> > > > > +
> > > > > +             vbus-supply = <&vbus_supply_regulator_1>;
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@0 {
> > > > > +                             reg = <0>;
> > > > > +
> > > > > +                             usb1_con_ss_ep: endpoint {
> > > > > +                                     remote-endpoint = <&hd3ss3220_1_in_ep>;
> > > > > +                             };
> > > > > +                     };
> > > > > +
> > > > > +                     port@1 {
> > > > > +                             reg = <1>;
> > > > > +
> > > > > +                             usb1_hs_in: endpoint {
> > > > > +                                     remote-endpoint = <&usb_hub_2_1>;
> > > > > +                             };
> > > > > +
> > > > > +                     };
> > > > > +
> > > > > +                     port@2 {
> > > > > +                             reg = <2>;
> > > > > +
> > > > > +                             usb1_ss_in: endpoint {
> > > > > +                                     remote-endpoint = <&usb_hub_3_1>;
> > > > > +                             };
> > > > > +
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > >       edp0-connector {
> > > > >               compatible = "dp-connector";
> > > > >               label = "EDP0";
> > > > > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> > > > >               enable-active-high;
> > > > >       };
> > > > >
> > > > > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > > > > +             compatible = "regulator-fixed";
> > > > > +             regulator-name = "vbus_supply_1";
> > > > > +             gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
> > > > > +             regulator-min-microvolt = <5000000>;
> > > > > +             regulator-max-microvolt = <5000000>;
> > > > > +             regulator-boot-on;
> > > > > +             enable-active-high;
> > > > > +     };
> > > > > +
> > > > >       vmmc_sdc: regulator-vmmc-sdc {
> > > > >               compatible = "regulator-fixed";
> > > > >
> > > > > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> > > > >                       };
> > > > >               };
> > > > >       };
> > > > > +
> > > > > +     usb-typec@47 {
> > > > > +             compatible = "ti,hd3ss3220";
> > > > > +             reg = <0x47>;
> > > > > +
> > > > > +             interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
> > > > > +
> > > > > +             id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > > > > +
> > > > > +             pinctrl-0 = <&usb1_id>, <&usb1_intr>;
> > > > > +             pinctrl-names = "default";
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@0 {
> > > > > +                             reg = <0>;
> > > > > +
> > > > > +                             hd3ss3220_1_in_ep: endpoint {
> > > > > +                                     remote-endpoint = <&usb1_con_ss_ep>;
> > > > > +                             };
> > > > > +                     };
> > > > > +
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > >  };
> > > > >
> > > > >  &i2c18 {
> > > > > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> > > > >               bias-pull-up;
> > > > >               power-source = <0>;
> > > > >       };
> > > > > +
> > > > > +     usb1_intr: usb1-intr-state {
> > > > > +             pins = "gpio6";
> > > > > +             function = "normal";
> > > > > +             input-enable;
> > > > > +             bias-pull-up;
> > > > > +             power-source = <0>;
> > > > > +     };
> > > > >  };
> > > > >
> > > > >  &qup_i2c19_default {
> > > > > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> > > > >               function = "gpio";
> > > > >               bias-pull-up;
> > > > >       };
> > > > > +
> > > > > +     usb1_id: usb1-id-state {
> > > > > +             pins = "gpio51";
> > > > > +             function = "gpio";
> > > > > +             bias-pull-up;
> > > > > +     };
> > > > >  };
> > > > >
> > > > >  &uart10 {
> > > > > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> > > > >       status = "okay";
> > > > >  };
> > > > >
> > > > > +&usb_1 {
> > > > > +     dr_mode = "host";
> > > > > +
> > > > > +     #address-cells = <1>;
> > > > > +     #size-cells = <0>;
> > > > > +
> > > > > +     status = "okay";
> > > > > +
> > > > > +     usb_hub_2_x: hub@1 {
> > > > > +             compatible = "usb5e3,610";
> > > > > +             reg = <1>;
> > > > > +             peer-hub = <&usb_hub_3_x>;
> > > > > +             #address-cells = <1>;
> > > > > +             #size-cells = <0>;
> > > > > +
> > > > > +             ports {
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     port@1 {
> > > > > +                             reg = <1>;
> > > > > +
> > > > > +                             usb_hub_2_1: endpoint {
> > > > > +                                     remote-endpoint = <&usb1_hs_in>;
> > > > > +                             };
> > > >
> > > > Are all other ports disconnected? If so, why do we need a hub?
> > > Hi Dmitry,
> > > I didn't understand your query, can you give more context to it?
> >
> > You have described one port of the hub. How are other ports routed? Are
> > they connected to outer ports? To some other devices? Unconnected?
> Hi Dmitry,
> I would like to put it this way, USB HUB has 4 ports but only one port
> of the hub is used between SOC and Type-C controller.
> Remaining 3 ports are used by other devices.

Which devices?

-- 
With best wishes
Dmitry

