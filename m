Return-Path: <linux-arm-msm+bounces-75121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DB8B9F8E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2CEB7BB238
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8BE23B611;
	Thu, 25 Sep 2025 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sk+X7fpI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33456235358
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806397; cv=none; b=GB201TT2gNl55pPja3VCLidwIx86z/L09tEzndHuwFi0y2ar/Y2PiDVIPKGTvCOCcElqrNHq7G5fVuy0iOcnLXk+Yt9K1KlO9uffADxLKRG1qQPO9hHZGeNlto2PswuAcyj3GGLAm/SQ9Hgnr4Hj/7kwjyd1HrHRivueGlVQffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806397; c=relaxed/simple;
	bh=LsVI8ehH/npCq5kVzjZEjj4UwNd8svrLYYvGBARdX4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3OyDAjR1lPaNmYESs1nF/xFLFu9gtOwukNtDZfqC3yTfso1dGgMnHLUNlL0Kx7BIC2z06sev9EDlyqn8g7SI24w37/t4u1ZNV0yYL00EnDf90yi53SBqTWotKHIk3qw79Q8kQzwe55YqudcI2A2coFegmYiqwsfRAPESM3paBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sk+X7fpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFEAC116C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806396;
	bh=LsVI8ehH/npCq5kVzjZEjj4UwNd8svrLYYvGBARdX4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sk+X7fpIAHEy5aPtHwjDjhFIKZDN4Tw8vGC34+pqpkEmrTZsulhoKzRdz+vuwmWOF
	 yjLVLwzQKsfKAwXjExvwqorLPu+h1lNcfF1hCnnxn498rscM0gO3/YxMFYVewXV1Hw
	 H7+akEmncqNt81AHY59hXZ/jqID821BXXuaqstuj4mal313lxwjXrZZPZ8f5/VYipi
	 X4DRH2JKXlKsjL/i74iWCBo1zlAFAESEAyftvsQRAkZi4nZ13dNj2O2I61wEbkzHNH
	 74yBjl+Gz7rhUA2dxquBwhuelV4vpWuV6fJeck92BIloRbvlmL6qeVIsMkMKPycfRz
	 /mn6nY9XRkA8w==
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55640a2e33so768450a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOwf7+yEntQA/0tMPuX4RzPsJYttJMqeyoaL9Z52brZoXn8hav2gQzNX7CwRB2pyj0BqF6uhM2ol/lrsh6@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/fOk6yjhgR2EHae7WpSREyP8FVHsWea23NKFpm9FllkrV2mo
	Te1TefkLeb4RIVdLWNnIildkMGr8Gg7L6gnEjVwcNIE2eNChTJlPAb64biXY7hkhHNG2UTuEhq+
	6KMIj8U64+mHQY/yNHT8Irx4mfvB3VII=
X-Google-Smtp-Source: AGHT+IEkZ/qcM3gWgvoH5Z23lxlGdztAh8GifS0XlFA7H2Bv0O2IQ1fOXZC+rp/hKwkBHo+Sei5HaXsHbiwpkYcWLeE=
X-Received: by 2002:a17:902:c409:b0:275:f156:965c with SMTP id
 d9443c01a7336-27ed4ade26bmr41285845ad.52.1758806396248; Thu, 25 Sep 2025
 06:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-13-3fdbc4b9e1b1@oss.qualcomm.com> <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
In-Reply-To: <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:19:42 +0900
X-Gmail-Original-Message-ID: <CAJKOXPeFKN+yV4eitGgHPUYibE1h8RH274b6N6ovz_PR5BYw4A@mail.gmail.com>
X-Gm-Features: AS18NWBEzYXM9j8AHrwCm_hkcD1rrIPELcnRoRKDYiPoFbPa_pQtmGl_AKB5sX8
Message-ID: <CAJKOXPeFKN+yV4eitGgHPUYibE1h8RH274b6N6ovz_PR5BYw4A@mail.gmail.com>
Subject: Re: [PATCH 13/20] arm64: dts: qcom: kaanapali: Add QUPv3
 configuration for serial engines
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 21:28, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/25/25 2:17 AM, Jingyi Wang wrote:
> > From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> >
> > Add device tree support for QUPv3 serial engine protocols on Kaanapali.
> > Kaanapali has 24 QUP serial engines across 4 QUP wrappers, each with
> > support of GPI DMA engines, and it also includes 5 I2C hubs.
> >
> > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +             gpi_dma2: dma-controller@800000 {
> > +                     compatible = "qcom,kaanapali-gpi-dma", "qcom,sm6350-gpi-dma";
> > +                     reg = <0x0 0x00800000 0x0 0x60000>;
> > +
> > +                     interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>;
>
> odd indentation (on almost all gpi_dma instances)
>
> [...]
>
> > -             remoteproc_soccp: remoteproc-soccp@d00000 {
> > -                     compatible = "qcom,kaanapali-soccp-pas";
> > -                     reg = <0x0 0x00d00000 0x0 0x200000>;
> > +                     i2c22: i2c@1a8c000 {
> > +                             compatible = "qcom,geni-i2c";
> > +                             reg = <0x0 0x01a8c000 0x0 0x4000>;
> >
> > -                     interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
> > -                                           <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
> > -                     interrupt-names = "wdog",
> > -                                       "fatal",
> > -                                       "ready",
> > -                                       "handover",
> > -                                       "stop-ack",
> > -                                       "pong",
> > -                                       "wake-ack";
>
> Please try to use git format-patch --patience


Well, maybe it worked help, but I claim the author did not review
their work before sending. If you remove lines you added, you clearly
wrote buggy patches without any sense of proper logical split. It's
not gits fault. It's author's fault.

Best regards,
Krzysztof

