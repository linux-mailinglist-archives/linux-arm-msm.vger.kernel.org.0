Return-Path: <linux-arm-msm+bounces-59330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51784AC34F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 15:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2856B3B7C13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 13:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879DF1F1515;
	Sun, 25 May 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pe7OBZkO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C819F115
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748180009; cv=none; b=Zvt/CEG63o/85RkGCjQvLtNroNCMv1FhvGZzimyzAfNTzhR3EjFFPLBgJVduJ7081bdUqyNiJNWFQH1bTlqVPWMZ2sv9XQZ9/R4kFwVTHSJXR7a73PlDRr7txL+SlPpHK/d0CzQpDbAuiCCUdruk6ErcbsuaJIMyDoyNyDNzOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748180009; c=relaxed/simple;
	bh=dT3ghWHaWph9QA520TlcqOMsonUGkfcoxxRXI43lgZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbgJJluvn13yQljpX3nIP35UgLQrxetdekfXfBf/mz/xpy2MVRQnETM7VchnrN567f9lptixO/zq9OWBv95f4ztSHVZao3Y35fo+BePtsaTPEH2fuK7Wt73nrYGIvuyOHcnAucG3UubPrsbJF+afdsLJTvhMX6A+K5e5ju79N98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pe7OBZkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P5piwl022296
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sr1TsSZVLIMUajNCFZZmPhaJ
	dSRDwjHf764TrKM8owI=; b=Pe7OBZkOEpjQwUXTxBxkuSUFMIZa1FnAlnsQNi0H
	TMe8jBEyRCqQOj53WGaJBQKhRHbRb/7v44/miRjhbVSF1+cQe1wJnr5bcHeLuU6J
	VSgUhzy+dCHiX/gkRdFhLuv1xXIT/IpgGOTkvCd+SoJzDZZVizzDl1/IjdmjCwFm
	zosk78EHlDy30o0w0Eir1IBc98+kinWLoopGYz4m+Zk5hsLHjLAHCj5FLJU4WND4
	8rBRMgpu/9Bm9IqNr1xcIi2szKJmt8upJSPaPzQ7YDy63BQw2yNUauAjF5Ymi+uB
	fEujLGgWRotPuIErS8LQnW1j6SU9crYnMZXF55oOBoRWEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc1xy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 13:33:26 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dd95985dso37474416d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 06:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748180005; x=1748784805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr1TsSZVLIMUajNCFZZmPhaJdSRDwjHf764TrKM8owI=;
        b=duEqBzzuDht443pZCPC3yONiDNCmkDbFPAh3z5cWONyDKogJQzma7cHBdQbH2Zk3sQ
         8IyJEVIfx0UoWdXACN/VwojY8P4unYIdM1Hic6hDwZngryyIH+TgPXR1NjOXGIK08+gB
         W3Dubeiswv55YkwcE2dNhAUmKcBgRv4447avnaQk9DlwvlndyNc4/kMDFOfmdFuHKiS4
         zIqspQP/1JRUZUpss/6WZmpvnZPd5ewCDc+EWmVXr+MrlYlaVDzqGvVKsho1hdmm/hiV
         fK6qy6Go/1U4ziPMjx7yEVpn3hyr/A10otRMcmX7waiU5QHty4jAu7+IbRzPUu39QhF+
         d0bw==
X-Forwarded-Encrypted: i=1; AJvYcCXg5xuYHKr/5mSGTqkrkt9TDycqQBgt+t95vp4KQir+xPbC29V1g1jND6iNvJ4IhH1L+bphC7kKgRnp7dMU@vger.kernel.org
X-Gm-Message-State: AOJu0YyQaOgF5APMdrrvWgoYLhuXxaEocj/LA51tvY/BOwmHOCIq2oGx
	Aai6b1Fsze8qlogMqtNSPbIlMlAtO+FgIMaOlfy0WSLPbCtSbSNV1k1+RiCGMt0HvU0PfBJF4hK
	RVxXzrKqzSq+Mzs6qr+3I8h1fMKbBovKLVyYweKSSj7EFS0ZoRfXvRluQqcaS0yq40iLb
X-Gm-Gg: ASbGncvka0Mid7ZBWwHE21f/bddhm8PXJZDRrzgeSgDil14Rm5EWPbBIKQEw0I/ndrZ
	1SajFBb4rWGqV8hzjQvxaoU1MCVOPjXWO7tMQ6zagAR7loPYKXIs2wFeXJEweXBIYIoZKrH+6Lf
	IDqajZYV3MJUweGKx5NyHma4V5dwh1zwKs6xyAhpJPScd56zlxxVQ2BgBbO6P4OK9K13kAca0yP
	G19rc8BNUhll8HnH1Uva1TijFdZ2YWyIV+00LcMxlOlmHaStMgUbgyC5mgMonlwx5quqpwCY2Jh
	SHX2whhqspOtyx3dTy5ybCfeKkO+Jr15Yd2PI7UrKsxWJPfnRZm/x6BI9V/23JOqxp48z1GNRp8
	=
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id 6a1803df08f44-6fa9d2b220dmr90230996d6.42.1748180005036;
        Sun, 25 May 2025 06:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+LZAYnSbnaUqWwjG/6ouEnWc4XME/bGtrC+FYOjd6420KUE0SJpeIOfIR6bCBRvvvIOAYuw==
X-Received: by 2002:a05:6214:234e:b0:6f5:3e38:6127 with SMTP id 6a1803df08f44-6fa9d2b220dmr90230616d6.42.1748180004539;
        Sun, 25 May 2025 06:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702bb0csm4649021e87.166.2025.05.25.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:33:23 -0700 (PDT)
Date: Sun, 25 May 2025 16:33:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Message-ID: <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
X-Proofpoint-GUID: yO-ZYerHg0XSf5Yfu7NhR6iS_I0VTX3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyNSBTYWx0ZWRfX2XdpIHKMctlC
 zoLo45j323tDFdbqGvwJ3JCWg7trmpZdiPi4sVe5/BZyynVCORgE0zpjdp/BHd41seigFI9lxYy
 17Op+bK/s4EdGygGXVax8cmhQ5HfoI5mk8XNS/jieidjoaPIJT1ADcfUSQN4qHYDbhMJG2siVXa
 lUpHGBqIg/zVZ+A9P/yvsCGxBt8TDe3/2vk0ovIY4nydDsnSbFpc7dy/rgWhBE4kaooZJ7jj2ht
 Epm84TrK7rU7yCRaH04I9fYap/8fBh4Rxb9H417o/M1J4kE7XhGGfxTxiJUoYrbptqLhdBYhW7H
 Vw7WLURqsytFI9DLzljtAglWHGPZ8an4ufZruuqF9/88HudfFmZy+1e7rMI+gqHMtAeLv2hSKjG
 DbLzaONOqKD2MCFadDyJHEU54onZaI61y7sNUe6EeCVMBnHTRU62N/fyBP5tc/8tafF34TX3
X-Proofpoint-ORIG-GUID: yO-ZYerHg0XSf5Yfu7NhR6iS_I0VTX3S
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=68331c26 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8
 a=LE4hBVKD_bKaGKlX-QQA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250125

On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Relay wrote:
> > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > >
> > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > >
> > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> > >
> > > Supported features:
> > >
> > > - USB type-c and type-a ports
> > > - Keyboard
> > > - Touchpad (all that are described in the dsdt)
> > > - Touchscreen (described in the dsdt, no known SKUss)
> > > - Display including PWM backlight control
> > > - PCIe devices
> > > - nvme
> > > - SDHC card reader
> > > - ath12k WCN7850 Wifi and Bluetooth
> > > - ADSP and CDSP
> > > - GPIO keys (Lid switch)
> > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > - DP Altmode with 2 lanes (as all of these still do)
> > > - Integrated fingerprint reader (FPC)
> > > - Integrated UVC camera
> > >
> > > Not supported yet:
> > >
> > > - HDMI port.
> > > - EC and some fn hotkeys.
> > >
> > > Limited support yet:
> > >
> > > - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> > > the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> > > but not UHS-I (SD104) and UHS-II.
> > >
> > > - The GPU is not yet supported. Graphics is only software rendered.
> > >
> > > This work was done without any schematics or non-public knowledge of the device.
> > > So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
> > > ARM64, and pure guesswork. It has been confirmed, however, that the device really
> > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> > > @43).
> > >
> > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
> > >  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
> > >  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1655 ++++++++++++++++++++
> > >  3 files changed, 1659 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > index 669b888b27a1daa93ac15f47e8b9a302bb0922c2..aff4fe3e81ec0d6f6d52e2aa0da327b7576632d8 100644
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -327,3 +327,6 @@ x1e80100-qcp-el2-dtbs     := x1e80100-qcp.dtb x1-el2.dtbo
> > >  dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
> > >  x1p42100-crd-el2-dtbs        := x1p42100-crd.dtb x1-el2.dtbo
> > >  dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-crd.dtb x1p42100-crd-el2.dtb
> > > +x1p42100-lenovo-thinkbook-16-el2-dtbs        := x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
> > > +dtb-$(CONFIG_ARCH_QCOM)      += x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
> > > +
> >
> > No need for an extra empty line.
> >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > index c02fd4d15c9649c222caaafa5ed2c777a10fb4f5..551b392eca4ef3b6041e03ad1385fef11cec1690 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> > > @@ -170,7 +170,7 @@ trip1 {
> > >                       };
> > >               };
> > >
> > > -             pm8010-thermal {
> > > +             pm8010_thermal: pm8010-thermal {
> > >                       polling-delay-passive = <100>;
> > >
> > >                       thermal-sensors = <&pm8010_temp_alarm>;
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..7089219ed08c1c4a60cc007f9d043a34a8071b4f
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
> > > @@ -0,0 +1,1655 @@
> > > +// SPDX-License-Identifier: BSD-3-Clause
> > > +/*
> > > + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) 2024, Linaro Limited
> > > + * Copyright (c) 2025, Jens Glathe
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/gpio-keys.h>
> > > +#include <dt-bindings/input/input.h>
> > > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > > +
> > > +#include "x1p42100.dtsi"
> > > +#include "x1e80100-pmics.dtsi"
> > > +
> > > +/delete-node/ &pmc8380_6;
> > > +/delete-node/ &pmc8380_6_thermal;
> > > +/delete-node/ &pm8010;
> > > +/delete-node/ &pm8010_thermal;
> > > +
> > > +/ {
> > > +     model = "Lenovo ThinkBook 16 Gen 7 QOY";
> > > +     compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
> > > +     chassis-type = "laptop";
> > > +
> > > +     aliases {
> > > +             serial0 = &uart21;
> > > +             serial1 = &uart14;
> > > +     };
> > > +
> > > +     wcd938x: audio-codec {
> > > +             compatible = "qcom,wcd9385-codec";
> > > +
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&wcd_default>;
> > > +
> > > +             qcom,micbias1-microvolt = <1800000>;
> > > +             qcom,micbias2-microvolt = <1800000>;
> > > +             qcom,micbias3-microvolt = <1800000>;
> > > +             qcom,micbias4-microvolt = <1800000>;
> > > +             qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> > > +             qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> > > +             qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> > > +             qcom,rx-device = <&wcd_rx>;
> > > +             qcom,tx-device = <&wcd_tx>;
> > > +
> > > +             reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> > > +
> > > +             vdd-buck-supply = <&vreg_l15b_1p8>;
> > > +             vdd-rxtx-supply = <&vreg_l15b_1p8>;
> > > +             vdd-io-supply = <&vreg_l15b_1p8>;
> > > +             vdd-mic-bias-supply = <&vreg_bob1>;
> > > +
> > > +             #sound-dai-cells = <1>;
> > > +     };
> > > +
> > > +     backlight: backlight {
> > > +             compatible = "pwm-backlight";
> > > +             pwms = <&pm8550_pwm 3 500000>;
> > > +
> > > +             power-supply = <&vreg_edp_bl>;
> > > +     };
> > > +
> > > +     camera {
> > > +             compatible = "usb5986,1198";
> > > +
> > > +             vdd-supply = <&vreg_cam_5p0>;
> > > +
> > > +             status = "okay";
> >
> > This is default, please drop.
> >
> > > +     };
> >
> > Camera isn't randomly wire to the board, it is on the USB bus. Please
> > follow DT bindings and put it accordingly, describing topology of the
> > bus.
> >
> > > +
> > > +     gpio-keys {
> > > +             compatible = "gpio-keys";
> > > +
> > > +             pinctrl-0 = <&hall_int_n_default>;
> > > +             pinctrl-names = "default";
> > > +
> > > +             switch-lid {
> > > +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
> > > +                     linux,input-type = <EV_SW>;
> > > +                     linux,code = <SW_LID>;
> > > +                     wakeup-source;
> > > +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
> > > +             };
> > > +     };
> > > +
> > > +     pmic-glink {
> > > +             compatible = "qcom,x1e80100-pmic-glink",
> > > +                             "qcom,sm8550-pmic-glink",
> > > +                             "qcom,pmic-glink";
> >
> > Align vertically on the double-quote
> >
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > > +                             <&tlmm 123 GPIO_ACTIVE_HIGH>;
> >
> > And such lists should be aligned on the opening angle bracket.
> >
> > > +
> > > +             /* Display-adjacent port */
> > > +             connector@0 {
> > > +                     compatible = "usb-c-connector";
> > > +                     reg = <0>;
> > > +                     power-role = "dual";
> > > +                     data-role = "dual";
> >
> > Is it actually dual-role? What does UCSI report for it?
> >
> > > +
> > > +                     ports {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +
> > > +                                     pmic_glink_ss0_hs_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg = <1>;
> > > +
> > > +                                     pmic_glink_ss0_ss_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@2 {
> > > +                                     reg = <2>;
> > > +
> > > +                                     pmic_glink_ss0_sbu: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss0_sbu_mux>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +
> > > +             /* User-adjacent port */
> > > +             connector@1 {
> > > +                     compatible = "usb-c-connector";
> > > +                     reg = <1>;
> > > +                     power-role = "dual";
> > > +                     data-role = "dual";
> > > +
> > > +                     ports {
> > > +                             #address-cells = <1>;
> > > +                             #size-cells = <0>;
> > > +
> > > +                             port@0 {
> > > +                                     reg = <0>;
> > > +
> > > +                                     pmic_glink_ss1_hs_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@1 {
> > > +                                     reg = <1>;
> > > +
> > > +                                     pmic_glink_ss1_ss_in: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> > > +                                     };
> > > +                             };
> > > +
> > > +                             port@2 {
> > > +                                     reg = <2>;
> > > +
> > > +                                     pmic_glink_ss1_sbu: endpoint {
> > > +                                             remote-endpoint = <&usb_1_ss1_sbu_mux>;
> > > +                                     };
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     reserved-memory {
> > > +             linux,cma {
> >
> > What for?
> >
> > > +                     compatible = "shared-dma-pool";
> > > +                     size = <0x0 0x8000000>;
> > > +                     reusable;
> > > +                     linux,cma-default;
> > > +             };
> > > +     };
> > > +
> >
> > [...]
> >
> > > +
> > > +&gpu {
> > > +     status = "okay";
> >
> > I think that you wrote that GPU isn't supported (yet).
> 
> GPU is not supported on SoC level (x1p42100/purwa), not device
> specific. The idea I suggested to Jens was to mimic Asus Zenbook A14
> as per discussion abou purwa GPU and purwa firmware in general [1]: to
> already include correct filename and firmware path (since these are
> known) such that once SoC lands the GPU support laptops with that SoC
> will gain GPU support 'automatically'. As nothing consumes this
> property (on purwa) just yet, adding it already does not cause any
> harm.


Not quite. A14 specified the firmware name, but didn't enable the GPU.
This patch actually enables the GPU device. Which means, that we are
going to probe a driver on an unsupported device, using invalid GPU ids.

> 
> Jens, as per the same discussion [1] the path is wrong here,
> s/x1e80100/x1p42100/ for all purwa-specifc firmware. Unless the
> decision about firmware paths was re-evaluated in Linaro/Qcom?
> 
> >
> > > +
> > > +     zap-shader {

Please use &gpu_zap_shader {} instead.

> > > +             firmware-name = "qcom/x1e80100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
> > > +     };
> > > +};
> > > +
> > Dmitry

-- 
With best wishes
Dmitry

