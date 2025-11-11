Return-Path: <linux-arm-msm+bounces-81231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA11DC4D5A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39F71882845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF753546F0;
	Tue, 11 Nov 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdKzcTHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pl+Ig9VC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2379351FB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762859444; cv=none; b=WdgOXrvfqhke+vRYCJIvAscfV7rWxEgI/X7+VldrgPrqpJe6mpkg+ucLQeNp28zKvfm3NyyC39oevPSNzC/dGxqkwA+ijxCcDtraLo6o2+T51LyacQqzwSavlE8HkM+DMaoRR6MOXh7pGApXh9Tg9inG0wtU2AQpdQiBm+aBV/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762859444; c=relaxed/simple;
	bh=o9XDCEPOsW0pCvBrF5pRJYiZzRgCBxL2IDMOwMA7mHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQNdaKpO5r2PEENji3pLSNso5KQ9iKEIrtuhnD07EFuTcRbvQoqhy5bnpFiJPQLDwMj52PJnYXH7Zm2EqtbHyHKZX+BwKVoEbzZmvPm8QoDEDg5gCnRIogOsVDJG448dt7reUMaBhC9+13h6JMa3HyrGTl94q2zlTSpUqaOjCO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdKzcTHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pl+Ig9VC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4sWcB1326684
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=By6tizRWgXa7/zGKbE684xmY
	l8CoT4gArMCpph0OYeE=; b=BdKzcTHJQ57SWzBhomVLb/45DTgzZz8yKOGuUyu8
	/rMOb0/F3pygSOYfTuPGmIr+EHzAmiaY6nsAMMoE9JY1AvGIabd+0nWGaewjypeD
	I3ri0d8V/syTVucwAR7D6cObgppu0y+0V4XeCjrDz+GIqVCmMHyIlHRJSBMY7IYS
	Z71WDn1j/ioIdjfa/0i2RCuJy17dJSNWwdYTuCmoyTkdGuOyh2JAWRYDaUuJTlmZ
	2hOgFSdMy4Cc/1f/zGue0jU9KeFxz/ATxfTrTELdvC6BerhQP7emh7nE3nv/5d5P
	ZBnnHOXokRgZrzIa56RlbhaGwRC8u58mY9ITau9U/FNg7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxhhh2n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:10:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb31eed49so55916431cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762859441; x=1763464241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=By6tizRWgXa7/zGKbE684xmYl8CoT4gArMCpph0OYeE=;
        b=Pl+Ig9VCh6AVV+ulmRNrBr+Ib6V7jyZmvBOLQiUTEkm8xVIs0puCQgyleOmANBvpNy
         5eHc5lhTnwP6hT+ys9fHatLX3JIlSEpmLB5B44mDv3Dv9A5s8hYSuJdinr9QUghKqRr2
         ABE9hKYaCszUsopcH7EVVAP5I+Jt3QOKTYnSGJTLWyOdq5n+3OpH+4b9ENko5FmJkOFv
         sNVFOsIei0sJQ3+Vcup9wyV/9oIbHnzxbPx3MZ1oxyRhW7h5pH+SQKz2N5YqN2eKb4Iq
         f77dfQsPnSHudLIijJZgpTdyEX89UK9+MtFupKcfDisuDvjVvPQFSn72MMr4dK1ZKrt6
         2B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762859441; x=1763464241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By6tizRWgXa7/zGKbE684xmYl8CoT4gArMCpph0OYeE=;
        b=LurzVBUd8axes/6Rumd7LrNyofSPwJ9IbEHkIJkUiniyLfvDFZnGa3ZtxmRgsZ/AO4
         c7JeRLNakbqbURe/7EYM/zkcwUprANVL+Z4NE72U7kNEKKin8/yLcwlmQDD13cNhRrib
         rFjdvzLjMsIzPJG13EgFFi693iV2c9E1R1DDp87Tox/wViPeGXnsAitxkY/RTuwk6M0K
         Ng5oVPfgGiUg+67uV2wnbSaiLxYarhnSaxWPgIkVf6S9vnWII+Pxx+QcCT5d2DynXoIP
         TYjEyt/h722MYC7AR29nDUtfp9W356JsqMKeWvMe0nT8zXZKDfUQymrWVZg83Aclg25g
         D+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuecIMUIsl3RYjUWIAk2OhQ3mtgY6rbsxKVB0aMajYcLLMP+00WbZaP2EYKuKCAcRuZ8xoVWS5EhMDIfvV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx08RNRmQuifDiB8hERfTlNSfPOWUC0rr60EsEx33S6o2gYXP45
	DwUtjQmrOOz8GZNRLJjTK2HGOSlgpDjDxJxNY7p67KjEH+yQGtXuEpwVq29ur975K0b9AQgxIgA
	i872Cd8VB1s46WVRMhXojhj7w7dtdJI8mP4pvpjOoFlAxd5Mmat49CTLSfIqb6f8rnRipBWnGj0
	Bs
X-Gm-Gg: ASbGncssS2J2La8HDnXpOTGfI8EaGAKXBHyD6T63ggM/AdcT+M1cx3FnBFYD0TbqYfU
	XYqvRjZoPTfVDnD1ONYd5OZCaQ/SPjt2SAxPTEBKwXVCTz9QO04z7vx6rwNyLSEFNi5hhkfvYmF
	7cEvJI8bJKvR83x3AfcmCgZgrWoiOSeULRBAlam52jhrQI/osiKmhKQ/ryFbJ5YvYb+Q9IwK0uI
	31Vc8Uf2/nI5EGqifgO6RoYus/uCjCwlv6MvN1CaoqSyJzWlHUjbAm6tlyXi6K2Xk7SEQ+4zNa3
	Lhj43sAidviWuo1RgNfMdp+iUWQI8OywzkPtxRoTzz2UcP20RWbFPd7HSpeR83wK89kn/M5731x
	040dzoDvwgQ2YN7BrBebkAHG/fEteYfnw8f1/JOTCF4WjyECOZGsPSMHzXST2odHoGVl3JeIvJc
	4rqS/hLmHlRddU
X-Received: by 2002:a05:622a:1308:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4eda4fce42emr152358421cf.66.1762859440550;
        Tue, 11 Nov 2025 03:10:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkaAdyv8nvHiLN6T8nwWW70ZQV7BCDE0W7pF5rUcAFBRWXIKZmLtMzx7CpioSO3o0iF9vwVQ==
X-Received: by 2002:a05:622a:1308:b0:4ec:b599:2879 with SMTP id d75a77b69052e-4eda4fce42emr152357541cf.66.1762859439352;
        Tue, 11 Nov 2025 03:10:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a3a1c38sm4879269e87.85.2025.11.11.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:10:38 -0800 (PST)
Date: Tue, 11 Nov 2025 13:10:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Add support to validate direct
 DSI
Message-ID: <uhhe4cyv5c4nlwphbgwl22hhl225gfikqdvzxmltnr2kk4nhmi@7mexlu4oesi3>
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
 <20251111104245.3420041-2-tessolveupstream@gmail.com>
 <563a0de4-09d6-49f8-90a9-38b72e5c03ce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <563a0de4-09d6-49f8-90a9-38b72e5c03ce@kernel.org>
X-Authority-Analysis: v=2.4 cv=Pc3yRyhd c=1 sm=1 tr=0 ts=691319b1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=DnFvYW0WoMT7wKI67mAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bCxrvt7yGadS25y3tfc0Ggo2eiOz1Plc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NyBTYWx0ZWRfX/d9uwdyt3qRa
 q8fwESp+ks4jrox9nuD/VsSWw5py9PUlREgLOg0F1ImypaOxSUHDGI/NtcC0Q699LMCdmTvAtNU
 CMfWnB7/uzjCs2EICyebq72vd4gNCzAAcncqVmFGYRPnMwlnernZpc98zGW5UbC+lkXmSQJAg91
 Pv548hoOwEbki+TkC81I4wuiDoHA+IiiCk02zI4AQI66fnqqNQip29KwXTCO+ioYTymg6w5pmle
 sRyQ8G2wDxK43s8pd0PX+W50HUckPKeHmWQbjD0hpd+SJbOqaqEEjuTgiCxHQR6s8ZNp8RsMlPs
 1cvhAZVyIqRC5lV+VjQaifwwiM++BByE2Q/06cscLjuutiCaJ7tJADGMwmt0ACgcfLQDwWj3cuC
 unfpZwJK6voc5wmaM3pman1MPjy5Ug==
X-Proofpoint-GUID: bCxrvt7yGadS25y3tfc0Ggo2eiOz1Plc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110087

On Tue, Nov 11, 2025 at 11:49:41AM +0100, Krzysztof Kozlowski wrote:
> On 11/11/2025 11:42, Sudarshan Shetty wrote:
> > Adds device tree support for the Waveshare 10.1-inch
> > MIPI-DSI panel on the QCS615 talos evk platform.
> 
> Why is this a board? Panel is a hat or sort of addon, so overlay, not a
> board.

Don't waste your time. The developer completely ignored review on the
internal mailing list. I don't see a reason to believe that your review
won't get ignored.

> 
> > 
> > Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile          |  1 +
> >  arch/arm64/boot/dts/qcom/talos-evk-dsi.dts | 43 ++++++++++++++++++++++
> >  2 files changed, 44 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 282d744acd73..d5a3dd98137d 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -306,6 +306,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
> >  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
> >  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> >  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
> > new file mode 100644
> > index 000000000000..8a6dc8b6bf8f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +/dts-v1/;
> > +
> > +#include "talos-evk-cb.dtsi"
> > +
> > +&i2c1 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> > +
> > +	display_mcu: display-mcu@45 {
> > +		compatible = "waveshare,touchscreen-panel-regulator";
> 
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

