Return-Path: <linux-arm-msm+bounces-33899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61360998B1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 17:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61E961C24415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8FA1CC880;
	Thu, 10 Oct 2024 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eu1yqvo1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489961CC14A
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573142; cv=none; b=UuIknv2z2eTxb76Ywc5NfLBUybm03DcL5MhFkC/7eWEz93zk7gx1S/dRhpizhe+63+zSh2MvqgURIgAWDMtCSis7kOz6j67C3/GlFMCpqdWJH2j48FdyfOGA2aOGAsbGL7AN4FEc86XtDlxIDcXWPIq7164oXZMcBspPiTJWWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573142; c=relaxed/simple;
	bh=xO+xrsV0m6ktnljEcqpoAG1lE8azlumTtyyOZH61p8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvqSlYW+XWT3BpKz55pqidi8xhwYad82SyWKji9vWVNlSP9cqxOlWVUWJ643jxo5sAGz/EbUQqfjsE3Xpvx91AevFsHYGerDV3aSTNPgQDKhR1ZMrQsK4/ebgT2w8SSLvKJjgBGk06eGHYQLDvEHcNHJgXvugVMoYDiYRS1fQ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eu1yqvo1; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e290d6d286eso743138276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728573137; x=1729177937; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8r9lf5vsYGAZg3qoBN90Qx8Rz8zTJDhUxvIq7CGMNYg=;
        b=eu1yqvo1k0jl+i7FS9kr6OszcjHNFc2QBwrvwATsCNEHQHsYdf4+bD6O1R1+RSD4I3
         yBwkWxZu3z6hXXY07vXWBmFa6S2rgmNaaJbyjCP9xjIahmekER+euySLAGvPa8zmEVgg
         kETpYcVfJ0Hzzf/OEYUAsoBX6ovhJf2eBYQDf6zzaNRmhi+6JFVTYCGKGcxItKR+H7sl
         jZ/xwElBE7zUzFqkFBlV3GEJWQnA2llIUeeVnpVkYeaaYA1qQIqPdINL9jLNGycGbMPC
         T4mrDGOZAh+WG1t0mP6pdV3a3IeJU2lXTfPUxN31ajGIf6onbwxf4d5s1cO+FfP914bh
         Flgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573137; x=1729177937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r9lf5vsYGAZg3qoBN90Qx8Rz8zTJDhUxvIq7CGMNYg=;
        b=FPOJ3uRz6Wg6jyx5ZyuHgNzDWUV+mQK973PqrKBIGeZvtahEpnhPsUB/6jFeaEeM0K
         AjPYWPZDY0v3Lmi1JVpgByUKeV7CLSUfyys/dr5E9lDfy1bQy9ZdbEUcCOYDduRJ+ITD
         X5xQU6kkEkMcCddKjFpU136XX0jGgzsirwwbsSixY9+birxYPcPed41gjS4khaPWtMQp
         1nHhwK/NA0pYO/utxVugZK0D5ZF/IaloVPilbt8o33LK+UKJ1DgfK5Ibq44PMg6Zp3jW
         8p560Z2I+ubtm5vMG0qm8Ztx8ZXvSITsNH2VH44CRwNk77Wlls+kB/kccN6S36CjkUtW
         6sRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQxozpTSvPWuizSxTeXa3ooogcA8DeBgnQYVHI2BqAU9LqvEgp0WP5mkjGhg//a+XozyrOCPv/zhGKlcx9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Y+Ukw7QDXSieh9virdy/4Q7vF+QA4GqKjBq/ZzLn0a924j99
	Z0f2auPA8fqI21R46M1kezuZGY9D+zON9AAyyYMZv7HvLFMjWgXx1jhuMUprArEhja9nvmD0xes
	VREIEwTU8UuPntwCFCdy4CVFZe/JIzencqVqF+A==
X-Google-Smtp-Source: AGHT+IEaEnIgwjZvAhRFQl53GhDBElGnM3KPGeMsZ+GGPwd8gASrTFJB007EfgE2E3zzOPq9Cvir8gU+v2p8b/OdcZA=
X-Received: by 2002:a05:6902:726:b0:e28:ec71:eb87 with SMTP id
 3f1490d57ef6-e2909c00af1mr4623491276.4.1728573137216; Thu, 10 Oct 2024
 08:12:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-2-quic_kriskura@quicinc.com> <xwidjnw3fqc2slwl3vftw7yi4j7juiw6rwszjhtxepqd6zz33s@ncoi4aikbb4e>
 <fe3ebd31-946c-499f-ac96-2cf71c6752e6@quicinc.com>
In-Reply-To: <fe3ebd31-946c-499f-ac96-2cf71c6752e6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 18:12:05 +0300
Message-ID: <CAA8EJpojz9-xhoxdp78b5=6R8gpjjHQgjb_P0LGfHs4PsdS3vA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add support for usb nodes on QCS8300
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 17:57, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 10/10/2024 7:52 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 01:26:35AM GMT, Krishna Kurapati wrote:
> >> Add support for USB controllers on QCS8300. The second
> >> controller is only High Speed capable.
> >>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 165 ++++++++++++++++++++++++++
> >>   1 file changed, 165 insertions(+)
> >
> > [...]
> >
> >> +
> >> +            usb_2: usb@a4f8800 {
> >> +                    compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
> >> +                    reg = <0x0 0x0a4f8800 0x0 0x400>;
> >> +                    #address-cells = <2>;
> >> +                    #size-cells = <2>;
> >> +                    ranges;
> >> +
> >> +                    clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
> >> +                             <&gcc GCC_USB20_MASTER_CLK>,
> >> +                             <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
> >> +                             <&gcc GCC_USB20_SLEEP_CLK>,
> >> +                             <&gcc GCC_USB20_MOCK_UTMI_CLK>;
> >> +                    clock-names = "cfg_noc",
> >> +                                  "core",
> >> +                                  "iface",
> >> +                                  "sleep",
> >> +                                  "mock_utmi";
> >> +
> >> +                    assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
> >> +                                      <&gcc GCC_USB20_MASTER_CLK>;
> >> +                    assigned-clock-rates = <19200000>, <120000000>;
> >> +
> >> +                    interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> >> +                                          <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
> >> +                                          <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
> >> +                                          <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
> >> +                    interrupt-names = "pwr_event",
> >> +                                      "hs_phy_irq",
> >> +                                      "dp_hs_phy_irq",
> >> +                                      "dm_hs_phy_irq";
> >> +
> >> +                    power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
> >> +                    required-opps = <&rpmhpd_opp_nom>;
> >> +
> >> +                    resets = <&gcc GCC_USB20_PRIM_BCR>;
> >> +
> >> +                    interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
> >> +                                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
> >> +                    interconnect-names = "usb-ddr", "apps-usb";
> >
> > As this is a USB2-only host, shouldn't it also have qcom,select-utmi-as-pipe-clk ?
> >
>
> Hi Dmitry,
>
> Thanks for the catch. You are right, it needs to be added according to
> bindings. Since I would be sending another patch after this series to
> enable the second controller, would it be fine if I add it in that patch
> or do you suggest updating this one.

I think it's better to fix it from the beginning.

>
> Also I see some others are not using it as well, like sc7280 which also
> might need to be updated.

Interesting enough I don't see this option being enabled on SC7280 platforms.

>
> Regards,
> Krishna,
>
> >> +
> >> +                    status = "disabled";
> >> +
> >> +                    usb_2_dwc3: usb@a400000 {
> >> +                            compatible = "snps,dwc3";
> >> +                            reg = <0x0 0x0a400000 0x0 0xe000>;
> >> +                            interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
> >> +                            iommus = <&apps_smmu 0x20 0x0>;
> >> +                            phys = <&usb_2_hsphy>;
> >> +                            phy-names = "usb2-phy";
> >> +                            snps,dis_u2_susphy_quirk;
> >> +                            snps,dis_enblslpm_quirk;
> >> +                    };
> >> +            };
> >>      };
> >>
> >>      arch_timer: timer {
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

