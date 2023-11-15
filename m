Return-Path: <linux-arm-msm+bounces-700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B87EC433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319881F26D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 13:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854281EB58;
	Wed, 15 Nov 2023 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9j2CsHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160331EB3C;
	Wed, 15 Nov 2023 13:58:28 +0000 (UTC)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AC6C8;
	Wed, 15 Nov 2023 05:58:27 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4abf86c5ae1so2837540e0c.3;
        Wed, 15 Nov 2023 05:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700056706; x=1700661506; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbdCxcW1bM04wm/L/s8Y2gRMdaMFjHOvymiH7hppgtY=;
        b=V9j2CsHIAvAH/q92nHBJkNQKuQRIToHS5k2JP0PyDl+NZidkS5NR9HYVKt2Dr3bYnj
         0u4Pj+nOBNq/wjSFYNdZqzf0FRepo0n6n6SUSu3r2FjxKjyFd9whncmwExVqtAGG14Yz
         xsQRuAPYbv6BG2L5YFxf35MWPjJI512SmZBb8QIZ9z8a68YY8LeCffqarC/uJ3NEdLbF
         2QQAg6bLaUB0PKLJd+S5tfeI1G9pdDFpxqgQh6glliDubL83MQLTnmNw2fh/7fQMsOpK
         kxvAaE91C74bUATkh30v1Tc1HCd6YTKqTkTUj3N+8dACf3Fcrb+a3kUZ/OjAOygfb4yr
         ohbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700056706; x=1700661506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbdCxcW1bM04wm/L/s8Y2gRMdaMFjHOvymiH7hppgtY=;
        b=sqNvLFkwY281FtZ4wD0cgLk9f4Tv4bbV/OXF1xqXefpEYWKJzRsLom0QLP4Hl7Kfae
         HIUEDcKg6JwiYWtgKvSr8jt16rbKVPyitEBvDuj3kdBwEEGp8E/WilxQ7EvMWY18D81i
         P1n/UzwgcO3A7e8naa9tgIKM0UBtbaRj/iMeOgH0xLmfELJVQN8HfVmOOsHbUE3p3MnF
         BkEtk0LYuhTOHotaZvWQIIR4Dg0JoIZ7n+AEhAb/IzNXCXiINNW1lSVQGdcTQU5lVz2N
         3wrOdAh656pIGpaIhjUD5sMwsJgrzMJUn8m0Qe3THy7iI03/RoP8As05sMPUJJiwW2ds
         dynQ==
X-Gm-Message-State: AOJu0YytGr0Nyc5G2wDD82QZxoA0NRTmPdlNVnQufUx+l9JQeAbzcu/g
	3FbmUpP9fVaHazPzNqpxAqLbsz8g+CdDG8DO12e/z5AEJJLqEd7h8go=
X-Google-Smtp-Source: AGHT+IG45llVTSM7aCPzbHEMcmkhcPZSZqYorahRKlAy4i7Fc7oXeo0hcYVQiy+3tUKeSk0gbpGXkwD643QbuSi0JeM=
X-Received: by 2002:a05:6122:788:b0:4ac:6a9d:a51e with SMTP id
 k8-20020a056122078800b004ac6a9da51emr14199862vkr.9.1700056706261; Wed, 15 Nov
 2023 05:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com>
 <a3e35d3b-906a-4540-924c-0103cf32efa4@linaro.org>
In-Reply-To: <a3e35d3b-906a-4540-924c-0103cf32efa4@linaro.org>
From: Legale Legale <legale.legale@gmail.com>
Date: Wed, 15 Nov 2023 16:58:13 +0300
Message-ID: <CACDmYydnLQd0n9ACnTQ6P4wYf38eMzokyHrF7r6LisG4oTFtyg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

update:

---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index e59b9df96..822ac51a0 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -506,6 +506,21 @@ blsp1_i2c3: i2c@78b7000 {
                        dma-names = "tx", "rx";
                        status = "disabled";
                };
+
+               blsp1_i2c6: i2c@78ba000 {
+                       compatible = "qcom,i2c-qup-v2.2.1";
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+                       reg = <0x078ba000 0x600>;
+                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+                       clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
+                                <&gcc GCC_BLSP1_AHB_CLK>;
+                       clock-names = "core", "iface";
+                       clock-frequency = <400000>;
+                       dmas = <&blsp_dma 22>, <&blsp_dma 23>;
+                       dma-names = "tx", "rx";
+                       status = "disabled";
+               };

                qpic_bam: dma-controller@7984000 {
                        compatible = "qcom,bam-v1.7.0";
--
2.42.0



On Wed, 15 Nov 2023 at 14:32, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 15/11/2023 09:55, Legale Legale wrote:
> > Add node to support this bus inside of IPQ6018.
> > For example, this bus is used to work with the
> > voltage regulator (mp5496) on the Yuncore AX840 wireless AP.
> >
> > Signed-off-by: Isaev Ruslan <legale.legale@gmail.com>
> > ---
> >   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 +++++++++++++++
> >   1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > index e59b9df96c7e..745bfc6e2907 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> > @@ -507,6 +507,21 @@ blsp1_i2c3: i2c@78b7000 {
> >                          status = "disabled";
> >                  };
> >
> > +               blsp1_i2c6: i2c@78ba000 {
> > +                       compatible = "qcom,i2c-qup-v2.2.1";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       reg = <0x078ba000 0x600>;
>
> reg = <0x0 0x078ba000 0x0 0x600>;
> like the other regs here
>
> > +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
> > +                                <&gcc GCC_BLSP1_AHB_CLK>;
> > +                       clock-names = "core", "iface";
> > +                       clock-frequency = <100000>;
>
> Why not <400000>; as with other nodes ?
This is typo.

>
> > +                       dmas = <&blsp_dma 22>, <&blsp_dma 23>;
> > +                       dma-names = "tx", "rx";
> > +                       status = "disabled";
> > +               };
> > +
> >                  qpic_bam: dma-controller@7984000 {
> >                          compatible = "qcom,bam-v1.7.0";
> >                          reg = <0x0 0x07984000 0x0 0x1a000>;
> > --
> > 2.42.0
> >
>
> What tree does this apply to ?
this is master branch
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-6.7-rc1.tar.gz
--branch master --depth=1 ./kernel
>
> git checkout -b linux-next-6.7-rc1 v6.7-rc1
> Switched to a new branch 'linux-next-6.7-rc1'
>
> deckard@sagittarius-a:~/Development/qualcomm/qlt-kernel$ b4 shazam
> CACDmYyf4hxbuw+cpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com
>
> Grabbing thread from
> lore.kernel.org/all/CACDmYyf4hxbuw%2BcpKqEDnqmHpS9yPXuE5MPD5_XZ3hjmYuViUQ@mail.gmail.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 1 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>    [PATCH] arm64: dts: qcom: ipq6018: add QUP5 I2C node
>    ---
>    NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 1
> ---
> Applying: arm64: dts: qcom: ipq6018: add QUP5 I2C node
> Patch failed at 0001 arm64: dts: qcom: ipq6018: add QUP5 I2C node
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: git diff header lacks filename information when removing 1
> leading pathname component (line 6)
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
>
> ---
> bod

