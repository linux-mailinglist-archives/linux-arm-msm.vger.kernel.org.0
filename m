Return-Path: <linux-arm-msm+bounces-35784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F449AF94A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 07:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA78AB2127E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FB918CC01;
	Fri, 25 Oct 2024 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c/CKEtQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FA176AAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729835343; cv=none; b=JhdFd3oy8imE+Gziw8emho6pnRAq1oZo6yg3bvn+S4yJ7h0Q4jH3roCz9wXB0pw4QDDw+vhf6Fp7+4n0qA7YqwPf0lcf5iO3f9bDq3hhS9BwI6CUu4JhcWvOyRRk9Xmo6d0nCSd1ngo8WbCQ/Z1g0psiik2759ZW58024d2ncOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729835343; c=relaxed/simple;
	bh=3YLKOAKdedA794EBEEELdq9D/mc6G2/g5JyWa14ZmW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2PTy81u5g7y2eSEiAkz8A9PEDMzje7rsVcblW6dJjyIGPAUPaSpp0o961lrXVDGCAPRl3q/dKJ+PEph95Tsa8o7Ti0jxfnS26Ib4OqOMDugDx6WG+LIx4sIchU5NKl+fJguBvaX5txA7ZrbPyX06+AVpq8BXwYhPEC/Uda5L2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c/CKEtQf; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e35bf59cf6so27819747b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729835339; x=1730440139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HuBj6jHH+2hH/HnRC6bTykIAkOcHwoEScoSLgxcpErQ=;
        b=c/CKEtQfgEKQcf05zAJtGEoeWRcVnWisyYVEHG0qNpNwbfN/etepON+YpfHJQobOrP
         IcheKezQ4ObZnV4KzwPsv/sXWCSImDQ6nwX+DNZJ2MEPYi02ohWcQL+jFhgwJL2qlTqD
         e82aqj02ahASm/zlpAU3gG1ZaccUH5llWSPG7l6Tqkonz2sCgMODeSWiZCAzo0vFatr9
         aYxFVCpqv60yKLz6/pKbubwirvm2e7EOkzdJoklop7HdH+AGztlPoeNobPwLlDPDps8R
         Vp+C/Xokc83Luj8ceCctUngWf7XHT+eXjHVOJiXoigtYrzFPnetCWv7wrIyN3tx2WzjP
         54vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729835339; x=1730440139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuBj6jHH+2hH/HnRC6bTykIAkOcHwoEScoSLgxcpErQ=;
        b=QY3hB2cZGYqB0L7A5cm1EIMxmeOtiOeIznoSCUIfcWWkzr3pOvL6BxlNlPEo3yD+Ik
         xTuU3xuiCy6jG2x+xhPUJ22JsS1ufpA6jYzXS19/1y7Whlje1nFeWEX3xacUo2NAo0/p
         7F+RmNDfZnWh9f5bWtLPbnIhduz1FTl00ADP7hP6OMYe7gMr+tvJzyEA2TadbqQHJXDh
         JCiUXw89LJJMDHPeZutPRfjzevEn0h70PXKtDHImXn3tNnERbHHPWJZ3xajQNEh/KRZZ
         9cEK8uhq1Sy1DCiVTesflbv9mSbaY4XK9XxyjqGlNBAKIwI634OMghOEw/FvqKagn7nN
         D3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMIU0/Bl4szBzpRsMOX751JrttMoEDEsZE8SOhJpXn8+Jlwylrm1CkJCFLHBIc75I7mUX54tuljp4EjpIA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6JJtSqy6WcwD3PlE9Jf2yttYfYihq1/VufZhb7HiNcP/U4Lsl
	hlqS8uyoWGmBhuHm+qindWv03H08yKo/61dKopD9khWijxN9EqQQaFaB5QXO0cBKMeoe9v5zwJU
	jGeGRgU0argsIv8k4fyvZslxEwgAixrTUYXg7zA==
X-Google-Smtp-Source: AGHT+IE/2A2wcTRWtJIdxZFRWU2jMnFi993sbCQCkQ/aUt0tW3T8bN0qOPk5do1LQHq+4wKE6dywoyXSXH+Knynop1g=
X-Received: by 2002:a05:690c:f8a:b0:6e2:5a6f:d90b with SMTP id
 00721157ae682-6e84a7e69dfmr45932207b3.2.1729835339441; Thu, 24 Oct 2024
 22:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
 <20241023092708.604195-3-quic_yuanjiey@quicinc.com> <xfy335jzh5t5a7fdrjfswerjdze3vaybf7rvkxnae3cv3xaii7@rn7iqwga2p62>
 <ZxsJp6XtJSfnNJqH@cse-cd02-lnx.ap.qualcomm.com>
In-Reply-To: <ZxsJp6XtJSfnNJqH@cse-cd02-lnx.ap.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 08:48:48 +0300
Message-ID: <CAA8EJprVrCr11qkZjvzKhbZ=BvGRvbvCK-KsAhWiG48dOXQHvw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: qcom: qcs615: add SD and emmc node
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_tingweiz@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 06:00, Yuanjie Yang <quic_yuanjiey@quicinc.com> wrote:
>
> On Thu, Oct 24, 2024 at 11:42:26PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Oct 23, 2024 at 05:27:07PM +0800, Yuanjie Yang wrote:
> > > Add SD and emmc support to the QCS615 Ride platform. The SD controller
> > > and emmc controller of QCS615 are derived from SM6115. Include the
> > > relevant binding documents accordingly. Additionally, configure
> > > emmc-related and SD-related opp, power, and interconnect settings
> > > in the device tree.
> > >
> > > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> > >  1 file changed, 198 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > index fcba83fca7cf..3840edf13fe8 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > > @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> > >                     #size-cells = <1>;
> > >             };
> > >
> > > +           sdhc_1: mmc@7c4000 {
> > > +                   compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > > +                   reg = <0 0x7c4000 0 0x1000>,
> > > +                         <0 0x7c5000 0 0x1000>;
> >
> >  <0x0 0x007c4000 0x0 0x1000> (this applies to all address nodes, so
> >  sdhc_2 too.
> Thanks, in the next version, I will adjust all the values in the reg to hexadecimal.

Not only that. In the entry that I've posted there is a second change.

>
> >
> > > +                   reg-names = "hc",
> > > +                               "cqhci";
> > > +
> > > +                   interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> > > +                   interrupt-names = "hc_irq",
> > > +                                     "pwr_irq";
> > > +
> > > +                   clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> > > +                            <&gcc GCC_SDCC1_APPS_CLK>,
> > > +                            <&rpmhcc RPMH_CXO_CLK>,
> > > +                            <&gcc GCC_SDCC1_ICE_CORE_CLK>;
> > > +                   clock-names = "iface",
> > > +                                 "core",
> > > +                                 "xo",
> > > +                                 "ice";
> > > +
> > > +                   resets = <&gcc GCC_SDCC1_BCR>;
> > > +
> > > +                   power-domains = <&rpmhpd RPMHPD_CX>;
> > > +                   operating-points-v2 = <&sdhc1_opp_table>;
> > > +                   iommus = <&apps_smmu 0x02c0 0x0>;
> > > +                   interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
> > > +                                    &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> > > +                                   <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> > > +                                    &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
> > > +                   interconnect-names = "sdhc-ddr",
> > > +                                        "cpu-sdhc";
> > > +
> > > +                   bus-width = <8>;
> > > +                   qcom,dll-config = <0x000f642c>;
> > > +                   qcom,ddr-config = <0x80040868>;
> > > +                   supports-cqe;
> > > +                   dma-coherent;
> > > +                   mmc-ddr-1_8v;
> > > +                   mmc-hs200-1_8v;
> > > +                   mmc-hs400-1_8v;
> > > +                   mmc-hs400-enhanced-strobe;
> >
> > Are these board properties or SoC properties?
> Thanks, these properties are Soc properties, so I put them in dtsi.
>
> > > +                   status = "disabled";
> > > +
> >
> > --
> > With best wishes
> > Dmitry
>
> Thanks,
> Yuanjie



-- 
With best wishes
Dmitry

