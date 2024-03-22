Return-Path: <linux-arm-msm+bounces-14834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F360D886CAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 14:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F8E5B20D29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2554145C07;
	Fri, 22 Mar 2024 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksAuSmKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E772446B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711113601; cv=none; b=Ki63p1SLst2b5mflAGZlGTXATJiB66ZbiAVHspk7ULvLPjGBCt+ryvTf8P8m/JUnpJM6YEx9oDaP3xn9STtp1u5yQTOBWUnPBF4iXfHgYK+A6ovfyiINQFZtQc/WOE5tHWNJ3IVA+qD+JSsopEA911U3cm0Z8XHc2TqyicWKtsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711113601; c=relaxed/simple;
	bh=YAAwhajDAShwntv7VTSrLoQpHcAhajmE3DG47Tw9EbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXNWYWQ+x7MIzEyZKtwoZJ2s7dDT29BV60e+N4rp6L5aKFfBA7Q4DGnPSoo0xErh4ou7i4gVnoVaHWqs6do+fogzlR+sRrCM7E8h0dcRn4sagVrNXR7G5rPudEntXqiIHAmYH3dfVUWzTPwqJNKFhPB/8X3mtmout4e+RmovZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksAuSmKp; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcc71031680so1905416276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711113597; x=1711718397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T78z1nOSwZno9foTloy4dRS2ODcsdxPFmoFq7VTiovc=;
        b=ksAuSmKphs3bQQ8uTYv7xuU56fGhh9+8pHhCrSCz7Sqp9S/goGvzf0I/ACui2Pc0oI
         3XwMy3rw2TIqREYT9tYf1IVjEvcJ4DQ1B+KdjkkCslfTqq9rCDhuQo4ZZRoVoPR4+zGT
         ysEwZiX6Txp7+8/XLPg6u8b5CKtrdpXP07V7CbQ+QTqJvCnYvQknjbKWBPcBSSem+86b
         jpU+uNL0TRXHXI7nKh6FRscRnEeN6vnL6hOy70M3V5/iRe5CX6KoHlmBIUhr6A60/B4k
         02PIE3JY3jEvCuN6Vj91nAv6TTs/GTFXfLwoFTrspw0jrXilP50ETzIh7PxR2GL+kZZF
         QjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711113597; x=1711718397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T78z1nOSwZno9foTloy4dRS2ODcsdxPFmoFq7VTiovc=;
        b=fHcxxZS4va8jLusf+dQigd91u5dUI0CHTQqTA7iaURhMhKht86n7s+JqHcz6WgYdwN
         zid3p2DxtHjFtC/HbfIeX5QY+lDDP43tlEXz8ntz+D7cZ7OGW3lMx18lnYYT3DPykDUu
         QfL1iuRB2WEossCV/H0KwORpPtvpO0iwGANS4eqd2xvgTuWUvD3ajk2i6Xp3SwtxjxDc
         eD9NR8+JVgYMvu6bK64Lbg0u58LBvaP7DYg6UnkYM5He8O3vOZeYiNDSHM6X2GLfWj+h
         H6P73Jgp5jdM90HZircoQm4B5q6nRfR04PNVlJGjF6+Go3rC/wlPmnPmqdW3GTnGg00c
         UKSg==
X-Forwarded-Encrypted: i=1; AJvYcCXjK+qxUgfWAE0UbdZZE/3ySLK0KFmdTKx6Sr3XBeh5dM1tobk7GmGE8zvo3ed0CpfrHJ5I3GcfB4SA3/+utv5vS4sZdlXp0hiSXcv43A==
X-Gm-Message-State: AOJu0Yz0/0tq4KZqQpPq3AolbJhfE8VVnzeeOhhoVHfl/k8gZZV6MHcP
	znmJMos6sd8yzdfZR+j3m/C5Lbqi85v4KT8LS71usIqWpx30qrKVBULCR/AYZWhOy9rNulRkZge
	8dYGbnOTtXf7FHTcC4jxBaP6PjULqMU/Fp38AmA==
X-Google-Smtp-Source: AGHT+IG+SZfQK1DL1hghh4bEZkeXinAkbG2OAt0nX5blt+D+l9hJLR0PHCZqRRAPCLeNeeuIOd4XZSMRS4sju+TapJc=
X-Received: by 2002:a25:b227:0:b0:dcc:f0a:e495 with SMTP id
 i39-20020a25b227000000b00dcc0f0ae495mr1995183ybj.3.1711113597315; Fri, 22 Mar
 2024 06:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322-typec-fix-sm8250-v1-0-1ac22b333ea9@linaro.org>
 <20240322-typec-fix-sm8250-v1-2-1ac22b333ea9@linaro.org> <635f7501-82cf-4df1-9194-27f24eb40a53@linaro.org>
In-Reply-To: <635f7501-82cf-4df1-9194-27f24eb40a53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Mar 2024 15:19:46 +0200
Message-ID: <CAA8EJpoYBsB8kx8P9w9M3pd6E7iUfqWk4XYwMr2oLoZV_nuYpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8250: add a link between DWC3 and
 QMP PHY
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luca Weiss <luca.weiss@fairphone.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 14:11, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/03/2024 11:58, Dmitry Baryshkov wrote:
> > The SuperSpeed signals originate from the DWC3 host controller and then
> > are routed through the Combo QMP PHY, where they are multiplexed with
> > the DisplayPort signals. Add corresponding OF graph link.
> >
> > Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++--
> >   1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index d57039a4c3aa..e551e733ab94 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -3917,6 +3917,10 @@ port@0 {
> >
> >                               port@1 {
> >                                       reg = <1>;
> > +
> > +                                     usb_1_qmpphy_usb_ss_in: endpoint {
> > +                                             remote-endpoint = <&usb_1_dwc3_ss_out>;
> > +                                     };
> >                               };
> >
> >                               port@2 {
> > @@ -4195,8 +4199,24 @@ usb_1_dwc3: usb@a600000 {
> >                               phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
> >                               phy-names = "usb2-phy", "usb3-phy";
> >
> > -                             port {
> > -                                     usb_1_dwc3_hs_out: endpoint {};
> > +                             ports {
> > +                                     #address-cells = <1>;
> > +                                     #size-cells = <0>;
> > +
> > +                                     port@0 {
> > +                                             reg = <0>;
> > +
> > +                                             usb_1_dwc3_hs_out: endpoint {
> > +                                             };
> > +                                     };
> > +
> > +                                     port@1 {
> > +                                             reg = <1>;
> > +
> > +                                             usb_1_dwc3_ss_out: endpoint {
> > +                                                     remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
> > +                                             };
> > +                                     };
> >                               };
> >                       };
> >               };
> >
>
> I think these should go into platform definitions, there's nothing at
> the SoC level that imposes the port constraint.

The link between DWC3 and QMP PHY is fixed in the SoC, if I remember correctly.

-- 
With best wishes
Dmitry

