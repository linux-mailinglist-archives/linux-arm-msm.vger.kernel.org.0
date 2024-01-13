Return-Path: <linux-arm-msm+bounces-7197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC482CCFD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 15:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 792BD1F21D83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F77621360;
	Sat, 13 Jan 2024 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+zH+3lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78C21357
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e734251f48so58261137b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 06:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705155638; x=1705760438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jRR1fEiQ+S1I9X2qmIA0v7+k3czhnEi8Cft1wc0vvhE=;
        b=w+zH+3ljkTP09TlVIgs5Q4i24T+Hp0RTgaKVZCgTqSmMZaobtdjmbuecdP3RbYmDYy
         iOGss32HRNdpwT9dCeMQpzNSHyDXtIZjwbY6Xxy6r+wBFafWpv9i4dtrNBhsmhgfBUsT
         12XWybJCGR83S9lkRTtpecO28iciOlXbGo84YpyYf+7BSdqNSLVIxHKYAAbXhITTqu+m
         wk6Au+gJS2jv/Up+c5xNbvR8DlIvQVGWfVvQql465GhXSuiq/L/SA/CebOqM0Ybw8bL6
         7f6TFV63HmdDHG7I2+ryGOUElyYaoAok4p5nJa0B8X5G16bUdq4Z3PDQdRVgfEfHA4/U
         MMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705155638; x=1705760438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRR1fEiQ+S1I9X2qmIA0v7+k3czhnEi8Cft1wc0vvhE=;
        b=pXrQylU3jnFDHpnUh/2XfFTaYob74+kuwB+XHDD+YBI5l/JmjAOraSnW+XKcRhXTfb
         nq7nAzl+3i4oc3u/kzH/uQLDoXuRQLPWwb2taD7Z5929Sx8BQ1EOddXJ7saT9qFxSz4+
         7ybnNGfQBw5KYuZZrIHuEThpHxVA6vB3EbcfpCmdD8Tkvl4lPHdUsMO+97sRIP3+Vzz+
         cTCWU+FBeiqDnwTQX8X37JRJbScWNuqzZUxfirZRL25zTpmuf+jOu2dl6hrJtiaVd1x5
         6XevghH/vGEwMH8uIFnuw+aVij72XnlWxl8N8X62rsFXTwGeR09oAUpuV5wp35J2AkcJ
         rkpQ==
X-Gm-Message-State: AOJu0YyoPGSYCyGMaBKdwMfoVL+6G5mZrBC7K8BFDzokmMBnMDn66X4C
	shVnVaNTIeRXeI5VhRfK7MBpIUM27f/pt7NhzLvM2bi8Jb4kRw==
X-Google-Smtp-Source: AGHT+IGvo0IxPUVD2gocSeoHYbVLdOkAGs/NP7wXxyLktENyxzaCT4fyggCnTGZ6grFAcFnKiUnA42Y8RGlLW9f9i1w=
X-Received: by 2002:a05:690c:fcd:b0:5e2:78d8:f3a7 with SMTP id
 dg13-20020a05690c0fcd00b005e278d8f3a7mr2319832ywb.7.1705155638454; Sat, 13
 Jan 2024 06:20:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-13-de7dfd459353@linaro.org> <75fdcb64-69b2-49b6-a6a6-2e231e3730d9@linaro.org>
In-Reply-To: <75fdcb64-69b2-49b6-a6a6-2e231e3730d9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 16:20:26 +0200
Message-ID: <CAA8EJpogN-Pq9w4pEyhPJ_S64ungSETd8YKMMNZ8E6DDeGpVCQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jan 2024 at 12:52, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> > Plug in USB-C related bits and pieces to enable USB role switching and
> > USB-C orientation handling for the Qualcomm RB2 board.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 62 ++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm6115.dtsi     | 38 ++++++++++++++++++++
> >  2 files changed, 100 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > index 52f31f3166c2..a96e3afb65bc 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -6,8 +6,10 @@
> >  /dts-v1/;
> >
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/usb/pd.h>
> >  #include "sm4250.dtsi"
> >  #include "pm6125.dtsi"
> > +#include "pmi632.dtsi"
> >
> >  / {
> >       model = "Qualcomm Technologies, Inc. QRB4210 RB2";
> > @@ -256,6 +258,53 @@ kypd_vol_up_n: kypd-vol-up-n-state {
> >       };
> >  };
> >
> > +&pmi632_typec {
> > +     status = "okay";
> > +
> > +     connector {
> > +             compatible = "usb-c-connector";
> > +
> > +             power-role = "dual";
> > +             data-role = "dual";
> > +             self-powered;
> > +
> > +             source-pdos = <PDO_FIXED(5000, 3000,
> > +                                      PDO_FIXED_DUAL_ROLE |
> > +                                      PDO_FIXED_USB_COMM |
> > +                                      PDO_FIXED_DATA_SWAP)>;
> > +             sink-pdos = <PDO_FIXED(5000, 500,
> > +                                      PDO_FIXED_DUAL_ROLE |
> > +                                      PDO_FIXED_USB_COMM |
> > +                                      PDO_FIXED_DATA_SWAP)>;
> > +             op-sink-microwatt = <10000000>;
> So RB2 can provide 15 watts over the USB-C port, consume 2.5 but
> requires 10? That doesn't make a whole lot of sense..
>
> Unless I'm reading this wrong..

Let me double-check the properties and the docs before answering.

>
> > +&usb_dwc3 {
> > +     usb-role-switch;
>
> Since this is a dual-role controller, I think this could live in the SoC

Sure. Should we update other boards too?

> DT
>
> > +};
> > +
> > +&usb_dwc3_hs {
> > +     remote-endpoint = <&pmi632_hs_in>;
> > +};
> > +
> >  &usb_hsphy {
> >       vdd-supply = <&vreg_l4a_0p9>;
> >       vdda-pll-supply = <&vreg_l12a_1p8>;
> > @@ -618,10 +675,15 @@ &usb_hsphy {
> >  &usb_qmpphy {
> >       vdda-phy-supply = <&vreg_l4a_0p9>;
> >       vdda-pll-supply = <&vreg_l12a_1p8>;
> > +     orientation-switch;
>
> Similarly, if this doesn't kaboom w/ our implementation too much, the
> PHY itself has orientation detection capabilities
>
> Konrad



-- 
With best wishes
Dmitry

