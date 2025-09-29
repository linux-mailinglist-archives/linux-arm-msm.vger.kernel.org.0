Return-Path: <linux-arm-msm+bounces-75483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28262BA852E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8181B189C8A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2786A2116F6;
	Mon, 29 Sep 2025 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQfDWEqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A364335C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759132350; cv=none; b=fJsT4McrnkjQjbjOZ/rFEkOPbMc43tG0Yg9NKrBEx2CmL/+RYyJhiNtGwDsAfIsx4U+7hDJGnKxuuJqfIafabPn35Xcw0hGB0I5mPL7r91ttBNiB2TVQTD/ru352WpBZgGrzNR3hWalwaD9XZwddLNcLqJzmDWhbd1WIatZ16B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759132350; c=relaxed/simple;
	bh=OYl49xeEXpiI0RagBTycUAoRztRBz7XsSTezk35V2Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbKKsb0Bp6XSenc7Iovbj+k6kbkTCiudWi0QQ5HTL5G8EbWdj1AYaHXlgBdHuiM/6Cxx/926wXxj2wUTXopZVS9t2K0T6OT1HIQxEYkX8KG4IEaWZTQhVxAa109C9a/5y21hkZ8XWmgTJaXiKuz+LGgS0tzpGKJFr23mba78QIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQfDWEqA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNs1x2030886
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3bhZMKmMUmaTU+3BKHI6HH3EfslIEObhFbsznu1nTQ=; b=gQfDWEqA6pW8PD/O
	PKx7NeY2Dh0Ed/hKDl9I0dGNTt9/XWKHn4rXnzNpbQIWSwHqQ7WIDQvYpYZ0XXee
	VNyPBLu13ODcsT76GqdOqifsEnJM7LFkrPIUMtp7flEmZqIrd8ZOsAop3eBYuzGf
	3Or8LvKCy/WE5W2xFZQIzbCudYRNKzzOi8etky94e5PwzZfSiNaWZPqsU87pvIuX
	TJmSHMjNtfkSpEXftwCJZuSDhGTOSnzx58FEg8evOmcD+fI4OTJRdzPARKWOpddw
	7p3YTQfWSfFJYFiOogqjRfcBLF+m7E5Cg0Iwi2DrOUf8xrzL68hOm7Z+AFjxk7i+
	pgX5bg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59mvqny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 07:52:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d7f90350f3so102250561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 00:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759132345; x=1759737145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3bhZMKmMUmaTU+3BKHI6HH3EfslIEObhFbsznu1nTQ=;
        b=iaFg/nABa5LSihXOrPZ205zcOgGS2+2LatzR7ZxlmpRz+W+Sr5HxLbOHJ27O7Z49FN
         pIJ9FpuomFKxQQR+4QejxsdyTw8LW2R0ymYZ3OZEnsIIIlnUCHq1R/sOi7ctng556Opb
         UuKRJdv2hQFKQzXxVkC3DyCYYlvnVvS1V0RYgaQyuQli6PRE2LrxN/42Zl5whMrjWh5H
         BuCu92CvCQGitJW9jbLU2OAoc27zvuqd0ggBRT7mgk+2Ez/SI9xUtRpy6fs1VRFS7UTI
         EPQEZ1Ec3JfHKGQGYBYU3jjdjK2J/VeeEPyAP2InSr1nu0diLxVMtsefmR+j6/zImaeh
         ci2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9FCXMNIUvJ+PhVoUzxGim6KjldXpWMWHG1nTw2kznM4KlqwoNASLEUuS7Il8/WofZc7x2CUKZ2T3IZ2I3@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLDuFdSlXmThicfadI4x1/nS3MQMq5lZg0lK+/uJxPCsmhNWw
	1vR/1o6vdYFnNE+E3dW8LZgd11B0Drbc7G1KeS4yoXFRf5WjmbOYC4Qexa9MdgPw4KTkfsjuI2U
	nUFVXVLNh5Vqs8APssXNBSnKOEn/4NDUFgEkQeCQVvNxemd/cDv1A3PJZVV5egcdkfOU7QGn4fx
	oX3nxXGD4iFsmn1099gcDaIfjlJGiKK008VBheMHckHQI=
X-Gm-Gg: ASbGncsJLqLxXoIxzs3dLg4Fd2pkHOXhEbgqDFzVaD911TStGb8hLMhfCZPb6TdV7Fx
	d/J3Bafwh2Akaxl5aqhqWs2VLRaabzAhybeEw/dVdfvX7Ngzelmk27SSY55Q8R9hTpYQtMz4KUh
	DqHJqcOawfwOu9dVZCgrBDdZy6xVq/TQoty+EUdf2SytVwsDyAryxx6BzsCiTpE9O2Q3VM8NaR+
	YYzMkGLIPk=
X-Received: by 2002:a05:622a:19a7:b0:4d0:b31:e63d with SMTP id d75a77b69052e-4ded5b24c34mr111775081cf.35.1759132345311;
        Mon, 29 Sep 2025 00:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwO8ztuFh5yRJFV/G0DsFEp5rqg88Rqt4skhMXTedmpDojowQVpiAMDQ3BA2b1xWzYqlOph04xzyNszTgwz3s=
X-Received: by 2002:a05:622a:19a7:b0:4d0:b31:e63d with SMTP id
 d75a77b69052e-4ded5b24c34mr111774841cf.35.1759132344766; Mon, 29 Sep 2025
 00:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
 <LAizvAKB21pYsBNwprUFqHcf56-GeWV5IFNd-yzGM688kLehFGW9bQ-LgO3uS6zSt5cXJKjwg8HAGa2ev9E4mw==@protonmail.internalid>
 <20250926073421.17408-4-loic.poulain@oss.qualcomm.com> <35402c21-bef8-44ac-844b-1cc97ff83c6f@kernel.org>
In-Reply-To: <35402c21-bef8-44ac-844b-1cc97ff83c6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 09:52:14 +0200
X-Gm-Features: AS18NWDOSHkEL4yXiSPWpTN451IiyKugWRO9I8AyA7SxoQ6f_P5gemouvrFXM_s
Message-ID: <CAFEp6-3=5FLnn+uhJDaS4=szmeM6tLqoPCtweCLMV9y9vEtkig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for
 vision mezzanine
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: R8T-fzUNLPYhcPFi7KpFo8U3iBgW5dR6
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68da3aba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MUhHvKHzP_bnBK4GCF0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: R8T-fzUNLPYhcPFi7KpFo8U3iBgW5dR6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX3IqEWB2/E/Jc
 K8nNqzSV05nmjwd9mApnE2KvnNtixbtwHYCbS2eWXhgAk9OqjmN9PGUC7G2xf2M3SMU2tk38Rl6
 HAesfgt3p6+F11GNHi7+Eipc3P93qtIHUfwls1auhksns9okZo0CVw1NyiG7NH2c7/SQcdUwIdE
 91fGmb8lf2FqZIycybdAnJLvCzqvylKQX3Bh5V5jJW1OLIqYhkv9fXPJySJGq2Rl9TYGeELYyRd
 F8o0nZ78hIuJn8m+PpR9or1OVEhE1uIpxZkbNqp5FrkNap546jGD4apHgyes/qp04i3wJYj88ZI
 fQ68fT5M9IKAZ+qMyNxFMfCVfwkuZ/FRHDYhx4lhDOE4ByGDuftXTH9m7lMO8EY6eeeZEfPT/00
 h01mph3H0fRl52AQNOheHo2pX3Vapw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Hi Bryan,

On Sat, Sep 27, 2025 at 12:37=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 26/09/2025 08:34, Loic Poulain wrote:
> > This initial version includes support for OV9282 camera sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   arch/arm64/boot/dts/qcom/Makefile             |  5 ++
> >   .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 76 ++++++++++++++++++=
+
> >   2 files changed, 81 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzan=
ine.dtso
> >
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qc=
om/Makefile
> > index d7f22476d510..bee021efc249 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -138,6 +138,11 @@ dtb-$(CONFIG_ARCH_QCOM)  +=3D qcs9100-ride.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qcs9100-ride-r3.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qdu1000-idp.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb2210-rb1.dtb
> > +
> > +qrb2210-rb1-vision-mezzanine-dtbs    :=3D qrb2210-rb1.dtb qrb2210-rb1-=
vision-mezzanine.dtbo
> > +
> > +dtb-$(CONFIG_ARCH_QCOM)      +=3D qrb2210-rb1-vision-mezzanine.dtb
> > +
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb4210-rb2.dtb
> >   dtb-$(CONFIG_ARCH_QCOM)     +=3D qrb5165-rb5.dtb
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso=
 b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> > new file mode 100644
> > index 000000000000..3b6261131b75
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
> > @@ -0,0 +1,76 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +&tlmm {
> > +     cam0a_default: cam0a-default-state {
> > +             pins =3D "gpio28";
> > +             function =3D "cam_mclk";
> > +             drive-strength =3D <16>;
> > +             bias-disable;
> > +     };
> > +};
> > +
> > +&pm8008 {
> > +     status =3D "okay";
> > +};
> > +
> > +&camss {
> > +     status =3D "okay";
> > +
> > +     vdd-csiphy-1p2-supply =3D <&pm4125_l5>;
> > +     vdd-csiphy-1p8-supply =3D <&pm4125_l13>;
> > +
> > +     ports {
> > +             port@0 {
> > +                     csiphy0_ep: endpoint {
> > +                             data-lanes =3D <0 1>;
> > +                             remote-endpoint =3D <&ov9282_ep>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&cci {
> > +     status =3D "okay";
> > +};
> > +
> > +&cci_i2c1 {
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> > +     /* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
> > +     camera@60 {
> > +             compatible =3D "ovti,ov9282";
> > +             reg =3D <0x60>;
> > +
> > +             /* Note: Reset is active-low but ov9282 driver logic is i=
nverted... */
> > +             reset-gpios =3D <&tlmm 18 GPIO_ACTIVE_LOW>;
>
> This comment is confusing me a bit.
>
> Shouldn't it be that the driver polarity gets fixed and the DTS just
> declares the correct thing ?

Yes, as Konrad pointed out, this comment is no longer relevant in V2.
I overlooked removing it when applying his suggested fix to the driver.


>
> > +
> > +             pinctrl-0 =3D <&cam0a_default>;
> > +             pinctrl-names =3D "default";
> > +
> > +             clocks =3D <&gcc GCC_CAMSS_MCLK3_CLK>;
> > +             assigned-clocks =3D <&gcc GCC_CAMSS_MCLK3_CLK>;
> > +             assigned-clock-rates =3D <24000000>;
> > +
> > +             avdd-supply =3D <&vreg_l3p>;
> > +             dvdd-supply =3D <&vreg_l1p>;
> > +             dovdd-supply =3D <&vreg_l7p>;
> > +
> > +             port {
> > +                     ov9282_ep: endpoint {
> > +                             link-frequencies =3D /bits/ 64 <400000000=
>;
> > +                             data-lanes =3D <1 2>;
> > +                             remote-endpoint =3D <&csiphy0_ep>;
> > +                        };
> > +                };
> > +     };
> > +};
> > --
> > 2.34.1
> >
> >
>
> ---
> bod

