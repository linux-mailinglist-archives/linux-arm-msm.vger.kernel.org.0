Return-Path: <linux-arm-msm+bounces-88686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9AD172BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3DA73013D5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B7A36D515;
	Tue, 13 Jan 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrfGh8ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOjy34U3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD535502A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291381; cv=none; b=rD5FUdTUxovkfVuZ10ukCBVVRQa66fN9Er5kYoa3CQS4Fm9ahKZVz50bcOILC/ykbn7XxiD+0jKtZJY+jaGrnvM7pSgXyqcMCf4D2WKgZIrBGXnHn1ygWIdlLJ3Vt8dPKTmTrbOIK0ii5WIBMgLkeK5teLReTb6KPIMiYE1ZDuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291381; c=relaxed/simple;
	bh=nkBL5kRLdo/zoDrr0XI7fSJ1DukrlAYjv88wfR7CXfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZyvrZZYU3Ww1xG0zpPYWulXJtmteARnqLz459QUUfs0IEvBKCkR0gj4Zh1uWaCe2+AK+plsRImWyvFiFcjCCv4mFAO1COvyHS/k4g51G/WcIpwI7VqmqpjK1a9XPlB7C6WI/diE4Us6bvkuqnID8OhkFJSOTWIMlTCYWZwLWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrfGh8ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOjy34U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5aqUb3636924
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=; b=VrfGh8aefgQ4i/R5
	2SdeaYdk9NCKB6biEt/FPsVLgbCGSTXpZeAyGx+FLgPwKoz9vCU/j09fjZ+agOjS
	HnAzHEq1gjwR+R2XOifMzFjbchYV4QHga1bAMK+z9fdY4pnbArOnXLoiYUUumJRx
	yiMb49UstLZfQGiIxf9lo+5u3Ih8ZqkSdF6dT+380H87o5TrtDkukNU79gXkeoG6
	r8DO7dtCPj3K55FVVSYlIS/YX8HFrRKcO7h2rB6lwmBbSCMoll/Iz5l1VDdBIhX1
	ONwGySP0qlJb4LfesHLom6Pg44NHpIYJNz5+VHyWfT7DrJux2y8pLD7SO1SG7jVu
	rSe7Eg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng2c0dxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:02:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890805821c0so257371836d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291373; x=1768896173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=;
        b=HOjy34U3BwI9apMRQJHmljKby2SM0nVk6MAzVOWiMC7jrmx+RNk2HWUOUiQLd9w3TE
         Pv0X+aUyYLf4z/NViWCK0gjj9ZgDuDlNPD0UroB2q9V31QtSlWEhLneGScME/TcW7b7s
         r+ZcygCAyrAmD2xekJl5TPjn8Jp70k373nzHhWTaGzPtznzMejfd897oUttz24uw024p
         1KQSB4Pnq7/YnII28PuleQ+d2PZq2WKRwPyO+w5fbDJ/otGyqMZYcqVWKpUMaw4EfZoy
         5pm//W2B8LyyGOgiC0jTWNJ/ADskAFlpJjSR250rWMlYS5gkGm9VhOHsPScQ4T2g8i6x
         TInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291373; x=1768896173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6N9oyam4luPWb3/lWFVBCNIH3UwuJUcQqBFJqUvP+c=;
        b=gkZVdpoTy8Nx60/A7v95A3z4pDB5lFxV6rJt+fIEjUIjRg6T9S057XKZDVo7AW4Lem
         LRZPu3vJ+P0AVucSOLkPoNvbRI3I0HwqXsQ8KwTW9RGO0EYbn56aFIukDF8SzPcvpeEN
         /dU2pEDjpdxhjN2lLH95vB03eaeD8+W7SPvagk4i73XDqAOmxHtNPjUnabxw724PfK7T
         8wOMtcQQ41yEbs+8NxnXkXDl2KXlpI7RtkPf/RxuSwWnLMIHKn5xY+3tuGMIkLdGPvhy
         SX9qDApiXFI9D45Ih9ravlMcv4QoeMzgTsZEJMJ50AX5DciMt1L4NjB0vRB+lPU1pQ1U
         vwcg==
X-Forwarded-Encrypted: i=1; AJvYcCWlylDhJ6eCd2XO8ZAshRSiRKimZ6Vae5YWw9j7Jjc1uo5wDn05J5GY8WKo5GC67LLZDAYa+uMARtjtNpR9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwdVN2XeTY24UuJMteAYicG+eI7Gg8n0z9T8OcEUqbCQkk5VH
	MCnX1IWs45W+DdUnyePR2lpLUSQmXWqw1sIUhYIbhExaAPRBataBplfhxcv8wM34vI1NyjSkzw5
	5dfgWNJ1Y+WFzxkogJiaVEQeFcyiJtTdfRWtWhhQzw+M/u5xIlskDRrGC3yqJ18KDEYCfuyFIUM
	LT38iCS69VUIj672i4LYWXnvAY1SobqITdLFlVCY0MHQ8=
X-Gm-Gg: AY/fxX4N8FB7hAEqfPA/6pn99lF3IYM76aTKz5v87ePUmyP1FVWYLpkmuOuvo05RCCZ
	nCM7f6wzhWVwxu1DnnIqs4Xnaf4S7Q57GR0bD32Gs0z2akBIPysuilyOzO3W9TV8DaH7+kFaRdF
	LbYBPPjNbbsFe3jguqoTXHCvXlNRu+L1+1E9txqnj/0hNFqSVb9UP6VxT7FDyOldIORX3u
X-Received: by 2002:a05:6214:5687:b0:889:7c5b:8134 with SMTP id 6a1803df08f44-890841c88a5mr285816596d6.27.1768291373219;
        Tue, 13 Jan 2026 00:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDGIu4Dg8ZP94iBqh5DZqcZsX/AaRxPqITFb3eUEMO4jPYXNM8IMx4+5g371Bpd6RPfrrlIlEo1qQF/lxG1aA=
X-Received: by 2002:a05:6214:5687:b0:889:7c5b:8134 with SMTP id
 6a1803df08f44-890841c88a5mr285816066d6.27.1768291372777; Tue, 13 Jan 2026
 00:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com> <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
In-Reply-To: <qy4bp2hz3ivwydsk4sblxpgthz5hw4rn7r3ezaim5wf5fgm4sg@meispnp6wthj>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 13:32:41 +0530
X-Gm-Features: AZwV_QjkEC6ruPO6nTmB-CDI4g8kcjrgHKlljma_9lovnFDRP5LmTtxd5MA_ynw
Message-ID: <CAHz4bYvVfQke_aUx_mVO2QkCc5yr_1Cn35N6hPi1if=X7iM3+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB
 controller in host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX4evBqNJynZFc
 i/bWqv1K9Tp5enNiQFvEHrrQFQnsL36eCAYq1tvPSxLu0zgYMTwbUsia+R6Y7XSdgILVjxOY7Ic
 nDtBGuzBVVLd9tFPRKkQmP4gR3eJnH8/KT37A2iZx3DY8tI6qmujloLA+XmhsOjmQsveXxK1ury
 w/DCdOj8ml25trDiJ/90L2x7fsH9ClLUsmXAfiyJicJxR56NvlW4kwge8PXEKek4eGjrAKf337w
 WNLkcygvD9s4T7UPVN8lXZwT1V+2zMi8CFz90GUFLlZ41tQFWnOGU/b4/HIryrDdZaGxQv4uTOX
 nDirnTg9GwMXJhSO/NTMwEFL+9PGCByaIQ8Fe3ar3+0Mt5rcrE11zL/ELe8GloDa+wcAumKG2bU
 3GZW28gmbzxoiyYxvLcofu3AfAa5mYEjcH0+6AJVywAvbzz+IWRkkfLmAW78c3y7XPgQDn3+dSn
 b8mNG6dDVSM1MA1mTCQ==
X-Authority-Analysis: v=2.4 cv=C5TkCAP+ c=1 sm=1 tr=0 ts=6965fc2e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=03JeH7_DdWppPfD7oeIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: eyABtfYJGVWfqP9VZ7-CXtX2Bdq-3Cfo
X-Proofpoint-ORIG-GUID: eyABtfYJGVWfqP9VZ7-CXtX2Bdq-3Cfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130066

On Sat, Dec 20, 2025 at 9:47=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Dec 20, 2025 at 12:05:37PM +0530, Swati Agarwal wrote:
> > Enable secondary USB controller in host mode on lemans EVK Platform.
> >
> > For secondary USB Typec port, there is a genesys USB HUB GL3590 having =
4
> > ports sitting in between SOC and HD3SS3220 Type-C port controller and S=
S
> > lines run from the SoC through the hub to the Port controller. Mark the
> > second USB controller as host only capable.
> >
> > Add HD3SS3220 Type-C port controller along with Type-c connector for
> > controlling vbus supply.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
> >  1 file changed, 158 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/=
dts/qcom/lemans-evk.dts
> > index 70d85b6ba772..d72639479d75 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
> >               };
> >       };
> >
> > +     connector-1 {
> > +             compatible =3D "usb-c-connector";
> > +             label =3D "USB1-Type-C";
> > +             data-role =3D "host";
> > +             power-role =3D "dual";
> > +             try-power-role =3D "source";
> > +
> > +             vbus-supply =3D <&vbus_supply_regulator_1>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             usb1_con_ss_ep: endpoint {
> > +                                     remote-endpoint =3D <&hd3ss3220_1=
_in_ep>;
> > +                             };
> > +                     };
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb1_hs_in: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_2_1=
>;
> > +                             };
> > +
> > +                     };
> > +
> > +                     port@2 {
> > +                             reg =3D <2>;
> > +
> > +                             usb1_ss_in: endpoint {
> > +                                     remote-endpoint =3D <&usb_hub_3_1=
>;
> > +                             };
> > +
> > +                     };
> > +             };
> > +     };
> > +
> >       edp0-connector {
> >               compatible =3D "dp-connector";
> >               label =3D "EDP0";
> > @@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
> >               enable-active-high;
> >       };
> >
> > +     vbus_supply_regulator_1: regulator-vbus-supply-1 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vbus_supply_1";
> > +             gpio =3D <&expander1 3 GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-boot-on;
> > +             enable-active-high;
> > +     };
> > +
> >       vmmc_sdc: regulator-vmmc-sdc {
> >               compatible =3D "regulator-fixed";
> >
> > @@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     usb-typec@47 {
> > +             compatible =3D "ti,hd3ss3220";
> > +             reg =3D <0x47>;
> > +
> > +             interrupts-extended =3D <&pmm8654au_2_gpios 6 IRQ_TYPE_ED=
GE_FALLING>;
> > +
> > +             id-gpios =3D <&tlmm 51 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-0 =3D <&usb1_id>, <&usb1_intr>;
> > +             pinctrl-names =3D "default";
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@0 {
> > +                             reg =3D <0>;
> > +
> > +                             hd3ss3220_1_in_ep: endpoint {
> > +                                     remote-endpoint =3D <&usb1_con_ss=
_ep>;
> > +                             };
> > +                     };
> > +
> > +             };
> > +     };
> > +
> >  };
> >
> >  &i2c18 {
> > @@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
> >               bias-pull-up;
> >               power-source =3D <0>;
> >       };
> > +
> > +     usb1_intr: usb1-intr-state {
> > +             pins =3D "gpio6";
> > +             function =3D "normal";
> > +             input-enable;
> > +             bias-pull-up;
> > +             power-source =3D <0>;
> > +     };
> >  };
> >
> >  &qup_i2c19_default {
> > @@ -849,6 +935,12 @@ usb_id: usb-id-state {
> >               function =3D "gpio";
> >               bias-pull-up;
> >       };
> > +
> > +     usb1_id: usb1-id-state {
> > +             pins =3D "gpio51";
> > +             function =3D "gpio";
> > +             bias-pull-up;
> > +     };
> >  };
> >
> >  &uart10 {
> > @@ -903,6 +995,72 @@ &usb_0_qmpphy {
> >       status =3D "okay";
> >  };
> >
> > +&usb_1 {
> > +     dr_mode =3D "host";
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     status =3D "okay";
> > +
> > +     usb_hub_2_x: hub@1 {
> > +             compatible =3D "usb5e3,610";
> > +             reg =3D <1>;
> > +             peer-hub =3D <&usb_hub_3_x>;
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_2_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_hs_in>=
;
> > +                             };
>
> Are all other ports disconnected? If so, why do we need a hub?
Hi Dmitry,
I didn't understand your query, can you give more context to it?

Regards,
Swati
>
> > +                     };
> > +
> > +             };
> > +     };
> > +
> > +     usb_hub_3_x: hub@2 {
> > +             compatible =3D "usb5e3,625";
> > +             reg =3D <2>;
> > +             peer-hub =3D <&usb_hub_2_x>;
> > +
> > +             ports {
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +
> > +                     port@1 {
> > +                             reg =3D <1>;
> > +
> > +                             usb_hub_3_1: endpoint {
> > +                                     remote-endpoint =3D <&usb1_ss_in>=
;
> > +                             };
> > +                     };
> > +
> > +             };
> > +     };
> > +};
> > +
> > +&usb_1_hsphy {
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +     vdda18-supply =3D <&vreg_l6c>;
> > +     vdda33-supply =3D <&vreg_l9a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_1_qmpphy {
> > +     vdda-phy-supply =3D <&vreg_l1c>;
> > +     vdda-pll-supply =3D <&vreg_l7a>;
> > +
> > +     status =3D "okay";
> > +};
> > +
> >  &xo_board_clk {
> >       clock-frequency =3D <38400000>;
> >  };
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

