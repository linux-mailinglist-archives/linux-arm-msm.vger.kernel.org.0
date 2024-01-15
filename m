Return-Path: <linux-arm-msm+bounces-7265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3E882D7A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 11:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19DF4B21632
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jan 2024 10:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63A31E867;
	Mon, 15 Jan 2024 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YORKCG1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820F1426C
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5edbcdc323dso80009607b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 02:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705315436; x=1705920236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HA6dETEZb2YlMZXe35z+WXi3pfyS/JU2XsCgeGueIkw=;
        b=YORKCG1lMiQb6tzUJn2RqVTXyZWW0oR0DETCD1wPlanLfSigIJaOhUZoPBr5e5GCvq
         Ij8h/G2YlQhUJNB64xWcAmc9rdTtubCBK6yAzF9vb/Y1hCi6O+USoQN6/0PBdr2Io4k+
         ionpv1ApPosx4gkbswdSOsx4FvrZU+aDAY/wFr2FK15fcU2mba9l4s4P3bc41eLA9BqE
         u6jw768PAvTfNXBPml3ZQuK/pu88hdDXZMFiBJySgwZyoya2Uvy/pFftJ+gj69c9TeOl
         5OZF5Iy3w+lli8R9eU48aSG0Yb1o7DFDaSMGsvKcKnNgWUTOZj4imyMKS0/II8gCydK4
         TAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705315436; x=1705920236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HA6dETEZb2YlMZXe35z+WXi3pfyS/JU2XsCgeGueIkw=;
        b=CgVC78Ji0mMr773zr74K0ZnSFctB8URdDKwL/RuQ0ZhQqTr4YR5OXzk96kEAmVYwal
         3GeK8U3VHVirZBRQy/qOHGBDZc2zkVxfGRnTfYZ3sT51TVs6MjZQgG5Lbr27SBNnx1Mp
         /pzt8SgQ7msgJUgDHE97CFGxACc5LR8F7FKTvBbiEd8tPkY/2UFu4/Q9ZCZouRL04++R
         wEFVyUzdnvR9mt1IBu5J/fjXBE2eZq6XoKSOhHwMnmqCAczG0Fc1aN50eUzwiV/FlRft
         8+m8wAk00dwdiSFaT4a1DipiwyzNs9FiHyc3ctdbDS8Auqu627q4hK3a90g4bKZcPpj5
         p7/w==
X-Gm-Message-State: AOJu0YxBFkmpsV7GS5aWOK450KnYp0GZbtJC7iSQ/62vnuWKHfWUeSZP
	F0xuCTzYPZVvXePBZvgndnpXHexQfRdqNpklNihrxt1AuK+j+w==
X-Google-Smtp-Source: AGHT+IGSoK9Aydw953TCiawvx9g+x41cQzH86HonYlpmGY30jz93dCBlM0QgZSjihyn5b4D/aw0E4Jtzzn6D1JGAHxA=
X-Received: by 2002:a05:690c:248:b0:5ef:77a2:c1ae with SMTP id
 ba8-20020a05690c024800b005ef77a2c1aemr3870605ywb.76.1705315435935; Mon, 15
 Jan 2024 02:43:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-13-182d9aa0a5b3@linaro.org> <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
In-Reply-To: <1d0d325d-d15e-4e86-b8e3-9f91b99e78bf@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jan 2024 12:43:44 +0200
Message-ID: <CAA8EJpo7qH43FyvO-N9vFH=6K3rMdPpnGp9w6pGW2cz4bMK+0g@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: pmi632: define USB-C related blocks
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jan 2024 at 12:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.01.2024 21:55, Dmitry Baryshkov wrote:
> > Define VBUS regulator and the Type-C handling block as present on the
> > Quacomm PMI632 PMIC.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pmi632.dtsi | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > index 4eb79e0ce40a..d6832f0b7b80 100644
> > --- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
> > @@ -45,6 +45,36 @@ pmic@2 {
> >               #address-cells = <1>;
> >               #size-cells = <0>;
> >
> > +             pmi632_vbus: usb-vbus-regulator@1100 {
> > +                     compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
> > +                     reg = <0x1100>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             pmi632_typec: typec@1500 {
> > +                     compatible = "qcom,pmi632-typec";
> > +                     reg = <0x1500>;
> > +                     interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
> > +                                  <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
> > +                                  <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
> > +                                  <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
> > +                                  <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
> > +                                  <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
> > +                                  <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
> > +                                  <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
> This differs from the downstream irq types:
>
> <0x2 0x15 0x0 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x1 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x2 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x3 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x4 IRQ_TYPE_EDGE_BOTH>,
> <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x6 IRQ_TYPE_EDGE_RISING>,
> <0x2 0x15 0x7 IRQ_TYPE_EDGE_RISING>;

I must admit, I copied the IRQs from the pm8150b rather than from the
vendor kernel.

Bryan, any idea which set of flags is more correct?

> Is it intended?
>
> Thanks a lot for working on this!


-- 
With best wishes
Dmitry

