Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A8A44FE8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 07:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhKOGID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 01:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbhKOGIC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 01:08:02 -0500
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E778BC061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 22:05:07 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id b31-20020a4a98e2000000b002bce352296cso5519131ooj.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 22:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YcL98dcYP0M2jStnva8J9nz+JoDlg+B8cM6xTQH4RCQ=;
        b=dc0GvEaEwe22fG8jKGnx1MzaNk0hPiJuSY/aH0zd969M6SxekXRsIPnuhSJPGUj2tO
         c80PUSwnfb9d3U7dsE82NNBtmlcWLF9iNrAYIRa60UcZ0xNS3MTDiekjEowFN1cOF/Ou
         1H7cBeouxC6Zpgwg6LuUSc+pGUhYLFjf2B3H1ElO/CXxlv8GHCA4JTcEv5RDWgtzB/vO
         RemWEg/fMEp+TpWtroIFDncRWDPSnL3U/5KQX3acU/g9j6jX539N3wicz9Qc3adK5qy0
         c3iu7Ve2aJfQprUEfONHMko/o1FGO88rKMV9iunCCCxcoFUvfGTEiHbmkzqrvCbPuemV
         FKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YcL98dcYP0M2jStnva8J9nz+JoDlg+B8cM6xTQH4RCQ=;
        b=i4kVJYZjDpZvsPKceP6MjRIEzFQ/QgvLRnzjQjDD0Y+/lv9REVYb6CBlpQ9objhh90
         spTkEWoY0rmex6Tqf4khIz5vr3Le6Zr6cED6tOpePQCtNxZB+IXAYg+PY5awigypLbyp
         NcktIy2IAp2MM+RCgywtWjJhuwqj0q3X+jWMLCZYN6w8Tq6dYaL28+kunp5ecREHGOWW
         6VW6gRgHeUt+W65kPDS98hYb8kC7QkRZFjL1glGFYCjomyqXpA3ukDYCHQVE37SpKo+Z
         BIOMVOZdWu8bRKzyKv6COZ9Up3L3WF1b+WDIrrJCBypA49aRn0YT0BoedoltN5XHNP9p
         yWOA==
X-Gm-Message-State: AOAM532v9q+CT6O63HbR/M94WuV5rCvX2uuxIwu2oD1wG/35JejhAMdX
        uoDBLuvqGZaQMnG43UkGALAwzSYNs+yX/1as1Fngbw==
X-Google-Smtp-Source: ABdhPJy2e88x2dTWGeoIROKmY2ssRaLj47rFk3JxO0UxewJexSUFIh7d7O86pYVMHaBaVufQ9xcStyzMZjIc2Ltdprc=
X-Received: by 2002:a4a:ea84:: with SMTP id r4mr18628390ooh.13.1636956306909;
 Sun, 14 Nov 2021 22:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-4-bhupesh.sharma@linaro.org> <1636573460.935618.1783742.nullmailer@robh.at.kernel.org>
In-Reply-To: <1636573460.935618.1783742.nullmailer@robh.at.kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 15 Nov 2021 11:34:56 +0530
Message-ID: <CAH=2NtycQ7B40Q4oLQDa-65r5riAiCdCGLx6fkLBQS5P-dQSsw@mail.gmail.com>
Subject: Re: [PATCH v5 03/22] dt-bindings: qcom-bam: Convert binding to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        stephan@gerhold.net, bhupesh.linux@gmail.com, davem@davemloft.net,
        linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Thu, 11 Nov 2021 at 01:14, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 10 Nov 2021 16:29:03 +0530, Bhupesh Sharma wrote:
> > Convert Qualcomm BAM DMA devicetree binding to YAML.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 ----------
> >  .../devicetree/bindings/dma/qcom_bam_dma.yaml | 91 +++++++++++++++++++
> >  2 files changed, 91 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> >  create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1553369
>
>
> dma@12142000: $nodename:0: 'dma@12142000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml
>
> dma@12182000: $nodename:0: 'dma@12182000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
>         arch/arm/boot/dts/qcom-ipq8064-ap148.dt.yaml
>         arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml
>         arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml
>
> dma@121c2000: $nodename:0: 'dma@121c2000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
>
> dma@12402000: $nodename:0: 'dma@12402000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
>         arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
>         arch/arm/boot/dts/qcom-ipq8064-ap148.dt.yaml
>         arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml
>
> dma@1dc4000: $nodename:0: 'dma@1dc4000' does not match '^dma-controller(@.*)?$'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
>
> dma@1dc4000: 'iommus' does not match any of the regexes: 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
>
> dma@1dc4000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
>
> dma@704000: $nodename:0: 'dma@704000' does not match '^dma-controller(@.*)?$'
>         arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
>         arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
>         arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml
>
> dma@704000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
>         arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
>         arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
>         arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml
>
> dma@7544000: $nodename:0: 'dma@7544000' does not match '^dma-controller(@.*)?$'
>         arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
>         arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml
>
> dma@7584000: $nodename:0: 'dma@7584000' does not match '^dma-controller(@.*)?$'
>         arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
>         arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml
>
> dma@7884000: $nodename:0: 'dma@7884000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml
>
> dma@7984000: $nodename:0: 'dma@7984000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml
>
> dma@8e04000: $nodename:0: 'dma@8e04000' does not match '^dma-controller(@.*)?$'
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
>         arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml
>
> dma@c184000: $nodename:0: 'dma@c184000' does not match '^dma-controller(@.*)?$'
>         arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
>         arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml
>
> dma-controller@17184000: 'iommus' does not match any of the regexes: 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
>
> dma-controller@704000: 'qcom,config-pipe-trust-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
>
> dma-controller@704000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
>
> dma-controller@7984000: clock-names:0: 'bam_clk' was expected
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
>
> dma-controller@7984000: clock-names: Additional items are not allowed ('bam_clk' was unexpected)
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
>
> dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk'] is too long
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
>
> dma-controller@7984000: clocks: [[9, 138], [9, 137]] is too long
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

As noted with v4 review as well, all the errors reported above are
fixed via other patches in this patchset, for e.g.:

[PATCH v5 01/22] arm64: dts: qcom: msm8996: Fix
qcom,controlled-remotely property
[PATCH v5 02/22] arm64: dts: qcom: msm8996: Fix 'dma' nodes in dts
[PATCH v5 04/22] dt-bindings: qcom-bam: Add 'interconnects' &
'interconnect-names' to optional properties
[PATCH v5 05/22] dt-bindings: qcom-bam: Add 'iommus' to optional properties

Regards,
Bhupesh
