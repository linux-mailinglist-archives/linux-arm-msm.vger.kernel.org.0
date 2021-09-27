Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5465419421
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 14:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhI0MZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 08:25:02 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:35452 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbhI0MZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 08:25:01 -0400
Received: by mail-ot1-f41.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so24195591otj.2;
        Mon, 27 Sep 2021 05:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=5uYCJrtQqPP5HTpxyuUkmMDjOGPSSsTakbwQ7ha5y4o=;
        b=TRwXNKX99yeqpAwNOAgHTVF6KBhZ1fC1rQe3JMrgy+SlXOJ0tnYABHRRgD+AXroHrn
         AF4+x6kFdIpsoLztX9LzPbcJE/JEd94XqEOXXEXzqzhTjk7xTQhONKmNXLD3QX4AsYdD
         RwnGGLjUKcf15URffgtQqLS+M9+AJAcc3HOvamaIspKnr4h0v4xjqm5tV4oA7ZUuCJPm
         d4jbnn7M7z68tz0XuF2ft65ex4eBEF9qlsgNETS8wkgawsdYnsds/nwYvMs3OBhpmkRq
         +ULtGUQoBHZMhgyDe8fAAPjY3jHlf9ek9L59TVXpgKvnWhQdq6osfgplVbke6Bws3HY3
         b5pg==
X-Gm-Message-State: AOAM530zUYkNDbIvBvusLRzkhxZtwQe+15A1Z3XmjjadCEG0ekaVJ/sC
        6RNvozNWZikHqheoT/NFoQ==
X-Google-Smtp-Source: ABdhPJwUmklYY9bvdFOjTCnNHYq4Hgtu6tp89QGCA/AOA2aGGRMuUr30JaeLlAg3mfKZ11odubvW5g==
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr4660563otr.162.1632745402799;
        Mon, 27 Sep 2021 05:23:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p9sm3694449ots.66.2021.09.27.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 05:23:22 -0700 (PDT)
Received: (nullmailer pid 3097157 invoked by uid 1000);
        Mon, 27 Sep 2021 12:23:19 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210927064829.5752-2-shawn.guo@linaro.org>
References: <20210927064829.5752-1-shawn.guo@linaro.org> <20210927064829.5752-2-shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add QCM2290 USB3 PHY
Date:   Mon, 27 Sep 2021 07:23:19 -0500
Message-Id: <1632745399.282824.3097156.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Sep 2021 14:48:28 +0800, Shawn Guo wrote:
> Add support for USB3 PHY found on Qualcomm QCM2290 SoC.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1533226


phy@1c06000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1c06000: 'lane@1c06800' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

phy@1c06000: 'lanes@1c06200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1c0a000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml

phy@1c0a000: 'lanes@1c06200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml

phy@1c0e000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml

phy@1c0e000: 'lanes@1c0e200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1c16000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1c16000: 'lanes@1c16200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1d87000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml

phy@1d87000: 'lanes@1d87400' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@1d87000: 'lanes@1d87400', 'vdda-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8350-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8350-mtp.dt.yaml

phy@1da7000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

phy@1da7000: 'lanes@1da7400' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml

phy@1da7000: 'lanes@1da7400', 'vdda-phy-max-microamp', 'vdda-pll-max-microamp', 'vddp-ref-clk-always-on', 'vddp-ref-clk-max-microamp' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

phy@1da7000: 'vdda-phy-supply' is a required property
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml

phy@1da7000: 'vdda-pll-supply' is a required property
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml

phy@34000: 'lane@35000', 'lane@36000', 'lane@37000' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

phy@58000: 'lane@58200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@58000: 'vdda-phy-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml

phy@58000: 'vdda-pll-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml

phy@627000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml

phy@627000: 'lanes@627400' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

phy@627000: 'lanes@627400', 'vdda-phy-max-microamp', 'vdda-pll-max-microamp' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml

phy@7410000: 'lane@7410200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/apq8096-db820c.dt.yaml
	arch/arm64/boot/dts/qcom/apq8096-ifc6640.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dt.yaml
	arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dt.yaml

phy@78000: 'lane@78200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@78000: 'vdda-phy-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml

phy@78000: 'vdda-pll-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml

phy@84000: 'lane@84200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

phy@86000: '#address-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: '#phy-cells', 'clock-output-names' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: 'ranges' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: '#size-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: 'vdda-phy-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@86000: 'vdda-pll-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@88e9000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dt.yaml

phy@88e9000: 'lanes@88e9200', 'reg-names' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dt.yaml

phy@88eb000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml

phy@88eb000: 'lane@88eb200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sa8155p-adp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-db845c.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dt.yaml
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dt.yaml
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dt.yaml

phy@88eb000: 'lanes@88eb200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/qrb5165-rb5.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dt.yaml
	arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dt.yaml

phy@8e000: '#address-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: '#clock-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: '#phy-cells', 'clock-output-names' do not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: 'ranges' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: '#size-cells' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: 'vdda-phy-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@8e000: 'vdda-pll-supply' is a required property
	arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c1.dt.yaml
	arch/arm64/boot/dts/qcom/ipq8074-hk10-c2.dt.yaml

phy@c010000: 'lane@c010200' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-mtp.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dt.yaml
	arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dt.yaml

phy-wrapper@88e9000: 'reg-names' does not match any of the regexes: '^phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sm8350-hdk.dt.yaml
	arch/arm64/boot/dts/qcom/sm8350-mtp.dt.yaml

