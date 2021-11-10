Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A4244C94D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 20:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbhKJTrg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 14:47:36 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:35708 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhKJTrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 14:47:16 -0500
Received: by mail-oi1-f179.google.com with SMTP id m6so7312961oim.2;
        Wed, 10 Nov 2021 11:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jxACcC5TGHjnCJC9Ui8FOKjkYdvzVT+5ha6aT9Ynf54=;
        b=rHngdqOXy4I3uVFpidIpryGAL5g1H3a/ZEIBv5KJDyllkKFulmbDIjT6RQU1vWONhL
         JEHl2Y4j8lVxU1jXqkHtGnVijeHgb0S2vcmvv3Ytg9zDlpcU2xJX3IkZGBUu/OdzesAQ
         Orlgo87qA+RWca37P5rB9m+x+UVcjEB1bm1VeEiSEhRMc4kITBEQLITtdqQCrvLuJCiA
         BkyjfiFPzH1EZybPXEAPlK88L/dM/BaM7ztS3bU9oVEhrtggY3pQXaiTtjvADiUgPRIX
         rscLVjJuDN3BtiYeS4y9KIttvIvny5vaKTDdyyes8CjjF3NEJZ7XE0qWrcUUH69MDgSp
         IOQA==
X-Gm-Message-State: AOAM533RN46st6DD+bTo9I8iPMOP4zgaPErvCcWaHOokw810lmXoSGqH
        G9juHZhuAqjKoK72hRYdcg==
X-Google-Smtp-Source: ABdhPJx64iQIoH2bg4ZV7dSSu5wsBD5lYdkT37nMlYzZHb8Tk1YVPPYtofwACXtINRAmF9yx1SuX4g==
X-Received: by 2002:aca:d0d:: with SMTP id 13mr1381306oin.107.1636573467757;
        Wed, 10 Nov 2021 11:44:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k4sm157124oic.48.2021.11.10.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:44:26 -0800 (PST)
Received: (nullmailer pid 1783743 invoked by uid 1000);
        Wed, 10 Nov 2021 19:44:20 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        stephan@gerhold.net, bhupesh.linux@gmail.com, davem@davemloft.net,
        linux-crypto@vger.kernel.org
In-Reply-To: <20211110105922.217895-4-bhupesh.sharma@linaro.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org> <20211110105922.217895-4-bhupesh.sharma@linaro.org>
Subject: Re: [PATCH v5 03/22] dt-bindings: qcom-bam: Convert binding to YAML
Date:   Wed, 10 Nov 2021 13:44:20 -0600
Message-Id: <1636573460.935618.1783742.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Nov 2021 16:29:03 +0530, Bhupesh Sharma wrote:
> Convert Qualcomm BAM DMA devicetree binding to YAML.
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 ----------
>  .../devicetree/bindings/dma/qcom_bam_dma.yaml | 91 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1553369


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

