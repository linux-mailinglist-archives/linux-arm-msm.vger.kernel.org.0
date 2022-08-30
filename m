Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E965A6298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 13:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiH3L5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 07:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiH3L5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 07:57:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E8BD83E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 04:57:28 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so4556359pja.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=VuqtagyKtA4/dl6tqxoSG7e1PY/tdisIi6TZ+/J5Vhc=;
        b=CD0pb5hyTtMpTa0viEmL0ZdXrAxHv91tx7llcQSFpYoDMqgOE8cKHCmOa2w0ulqxbM
         BqRSBqB3xmf5kUP4hg6yv++AdcB2Cg0NKU7Alv+jsqm2SYmGr565acJ/rAb8UmFEfgnS
         9eeAQ62A/TR6nh6coI2K+OqWy5dLNv3Vw022FCQCjoaVIQjTcBVK2a3YGARLjsa4IYfO
         uG/BbiGUyB2nF34tVMHFWW2FKwc93eqWdtHenGSCVgc5dxe74ANPrRSw55iQzhnAxgA1
         RFq/IzDYE2SnQxW04bjv75Y3HJakRADBxOyaxGTx1yWbsA0GFQlTHpNpHZ9dmU6OqyCi
         vDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=VuqtagyKtA4/dl6tqxoSG7e1PY/tdisIi6TZ+/J5Vhc=;
        b=Pu/omBXd5688pd4DJf/7VMNu5KSWQWVhd80fOsgVNNxQcnALwxNHp6ZEr4uqM6yQ3t
         JFFGDn4TcZ4k9JpeIP4CCVFbQuyjUy1Luq8wiMmlqUPTmmkzZ7KDJtmb1u2/ed7C9Mmu
         AZBV7OTgS2oFRzjLUdEhD4C0jxwOl2MRCMEATDUXcD7pLmh9Z950UgtcaCsOhFkZkY/o
         NrvkEs1zoiXSOFi9Xc0gBqst417p5nBy303sr0etKpLqdGoYkL/Zu+WiKe9k/hjYUGuW
         H0xMhGmVsCux4lsH8Nh+17QrpCiqJlFC1ztBle9mcttPrMcK7Q/KKBxCSpzucOtq3QbY
         +Nqw==
X-Gm-Message-State: ACgBeo23PNocvGAebsKIZhcFOra7LBgahJiiFS+pRijx7saJ2v9fiVpz
        QFLHNrZZBcVUH0nCZmSbXoHU
X-Google-Smtp-Source: AA6agR6KSZoACgPWIZiJrygkINu8nPOhh7IgucQwM8gZJU8Ys7AEtxyAmvui2CvR58iqKJp/ZESNkQ==
X-Received: by 2002:a17:902:7586:b0:172:d0de:7a3c with SMTP id j6-20020a170902758600b00172d0de7a3cmr21300245pll.38.1661860647978;
        Tue, 30 Aug 2022 04:57:27 -0700 (PDT)
Received: from thinkpad ([117.217.182.234])
        by smtp.gmail.com with ESMTPSA id c8-20020a170903234800b0016d3935eff0sm7549406plh.176.2022.08.30.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 04:57:27 -0700 (PDT)
Date:   Tue, 30 Aug 2022 17:27:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org,
        kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 10/11] dt-bindings: PCI: qcom-ep: Add support for SM8450
 SoC
Message-ID: <20220830115721.GF135982@thinkpad>
References: <20220826181923.251564-1-manivannan.sadhasivam@linaro.org>
 <20220826181923.251564-11-manivannan.sadhasivam@linaro.org>
 <53897584-f9a1-d305-4024-79a73d2837d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53897584-f9a1-d305-4024-79a73d2837d8@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 28, 2022 at 06:17:43PM +0300, Krzysztof Kozlowski wrote:
> On 26/08/2022 21:19, Manivannan Sadhasivam wrote:
> > Add devicetree bindings support for SM8450 SoC. Only the clocks are
> > different on this platform, rest is same as SDX55.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie-ep.yaml | 27 +++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > index 83a2cfc63bc1..9914d575ec41 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > @@ -12,6 +12,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      const: qcom,sdx55-pcie-ep
> > +    const: qcom,sm8450-pcie-ep
> 
> You need to test the bindings with `make dt_binding_check`. This
> requires an enum instead of two consts.

Sorry! Usually I do but somehow missed on this series.

Thanks,
Mani

> 
> 
> Best regards,
> Krzysztof

-- 
மணிவண்ணன் சதாசிவம்
