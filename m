Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C22742C8E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 20:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238651AbhJMSmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 14:42:05 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:34342 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238605AbhJMSmB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 14:42:01 -0400
Received: by mail-oi1-f177.google.com with SMTP id v77so772653oie.1;
        Wed, 13 Oct 2021 11:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ee9Mfm79HavJztDFWBrSKDkfsQnGf2g86BvsAcLfSiQ=;
        b=LqZpzPZp/gLw6sSmtFdWtAtuRRVNApIlWDhTLNG43eB8lKYJKdia+7VcbvktiEBUNP
         SM6pxuLYc8YWe7utUIQYgYllbtQWz1wk/4UOBGIzMlRvgAN5Kff3oQTBikwLeASYt5TQ
         AYmRIA4ikLym3ImL+TygGFlJv3ao/yyTl0OY92IlKU252JL8Seqcm5SX2HuUHDzEkXrW
         10BKU4bqd/F7lSVo/3UBgty1yWQGMlCgwhrZF3bdp1QqRom1MDObjmPhGzwo26nXPosF
         Vh+PVXUJ3hwChNu2MD6O1TLM7m+1J+XaG7+QWhV6v9P54TUtTmJAxp5Dj+mW4uDsVzut
         nObw==
X-Gm-Message-State: AOAM532k+05Iz6grg03ksgwuWMbAl/gyMW91JQQA4nZAq6YcNW9E9cOF
        I9eTHW+Dy+XdiQUQG/EzJCdrw9WgUw==
X-Google-Smtp-Source: ABdhPJwP/OCyJi30KvE2d06vsdqYxu963qu8ohog2qg3hK+dU9JdICzT6x9vRPfVV4NFfu5wvB8jcQ==
X-Received: by 2002:a05:6808:1513:: with SMTP id u19mr537152oiw.27.1634150397437;
        Wed, 13 Oct 2021 11:39:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w17sm71649otm.50.2021.10.13.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:39:56 -0700 (PDT)
Received: (nullmailer pid 1324768 invoked by uid 1000);
        Wed, 13 Oct 2021 18:39:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     herbert@gondor.apana.org.au, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Thara Gopinath <thara.gopinath@linaro.org>,
        bhupesh.linux@gmail.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        davem@davemloft.net, Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20211013105541.68045-6-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org> <20211013105541.68045-6-bhupesh.sharma@linaro.org>
Subject: Re: [PATCH v4 05/20] dt-bindings: qcom-bam: Add 'interconnects' & 'interconnect-names' to optional properties
Date:   Wed, 13 Oct 2021 13:39:52 -0500
Message-Id: <1634150392.555106.1324767.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 16:25:26 +0530, Bhupesh Sharma wrote:
> Add new optional properties - 'interconnects' and
> 'interconnect-names' to the device-tree binding documentation for
> qcom-bam DMA IP.
> 
> These properties describe the interconnect path between bam and main
> memory and the interconnect type respectively.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1540390


dma@12142000: $nodename:0: 'dma@12142000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

dma@12182000: $nodename:0: 'dma@12182000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
	arch/arm/boot/dts/qcom-ipq8064-ap148.dt.yaml
	arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml
	arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dt.yaml

dma@121c2000: $nodename:0: 'dma@121c2000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml

dma@12402000: $nodename:0: 'dma@12402000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-cm-qs600.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-ifc6410.dt.yaml
	arch/arm/boot/dts/qcom-apq8064-sony-xperia-yuga.dt.yaml
	arch/arm/boot/dts/qcom-ipq8064-ap148.dt.yaml
	arch/arm/boot/dts/qcom-ipq8064-rb3011.dt.yaml

dma@1dc4000: $nodename:0: 'dma@1dc4000' does not match '^dma-controller(@.*)?$'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml

dma@1dc4000: 'iommus' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml

dma@1dc4000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml

dma@704000: $nodename:0: 'dma@704000' does not match '^dma-controller(@.*)?$'
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

dma@704000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

dma@7544000: $nodename:0: 'dma@7544000' does not match '^dma-controller(@.*)?$'
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

dma@7584000: $nodename:0: 'dma@7584000' does not match '^dma-controller(@.*)?$'
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

dma@7884000: $nodename:0: 'dma@7884000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml

dma@7984000: $nodename:0: 'dma@7984000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml

dma@8e04000: $nodename:0: 'dma@8e04000' does not match '^dma-controller(@.*)?$'
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac-bit.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dt.yaml
	arch/arm/boot/dts/qcom-ipq4018-jalapeno.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c3.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dt.yaml
	arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c2.dt.yaml

dma@c184000: $nodename:0: 'dma@c184000' does not match '^dma-controller(@.*)?$'
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

dma-controller@17184000: 'iommus' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml

dma-controller@704000: 'qcom,config-pipe-trust-reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@704000: qcom,controlled-remotely: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names:0: 'bam_clk' was expected
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names: Additional items are not allowed ('bam_clk' was unexpected)
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk'] is too long
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clocks: [[9, 138], [9, 137]] is too long
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

