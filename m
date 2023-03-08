Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED316B016B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbjCHIaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjCHIaZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:30:25 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590B938EA4
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:29:58 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id nn12so1105128pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5U2IG1AypESC+EkIy4YzGJf5Ic7GNHzkZ8sq+KWZHoA=;
        b=Bpa6ve9/0Q1l6RoE8n9Fsvo1DXeVlef3y1ItMtQAdjXNwVFMKcvUFAfCiWeSVBGBro
         n6BvPCktbVUX1kz8qy6we93h+/vBSBr6tevaxyXC6MZeP+H9iB7LIxvERqEYYMBF+J2+
         ZmuFE0/DlzekqzRjuuODwP3eu8/W0fNYagq8PmrxKG8eSsw020E4XRqj5v0mvmtmk6JN
         0Dbtd0Cq4tI/0QNeMa1m8LPuuiGEo3CnwniWuwfYZd3Gn5/s5NWULW8yPSNGDNeTQ2HB
         TfHtCgL30BSw1Mkag5cHBJMdX/BU6UtGaJAl2SQYZqyZBzNXId1AMrMY4cV2vS+cBGHz
         zBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5U2IG1AypESC+EkIy4YzGJf5Ic7GNHzkZ8sq+KWZHoA=;
        b=WKhOY4314V/grEB7jY4ZaLPjeOyXyF+yYcbtoQ4HGTN5aF6xyqeFTwIZIuvDyEoX4w
         ux6/i98n2X4h6pnDT5fL1WYKpJPPOIbIXp/7WbKKQSklXiaywZ1r5R2+NJoggmXXRBuS
         cz1P/1dhQ4W7f0UXwj2Gmre1t7uGatZljpOubC06/vn9usRO1ms3sBMf6vcvJ1egFZKx
         3lEhm7YFdGr8rUQaB4tCzrE2xpr7iszP9HG/qBzFn1Mz/o+z5ORznXP2dI32uBPjZqcf
         gDYkUicZWzVOhCRPnpSJedHV1j2VRF8GcmKOkjaUdH/1mNQPubfzx2U7zrKEcXvb5mzW
         9qIg==
X-Gm-Message-State: AO0yUKV3kh4Mc+JDJ60PImDrUbetXSlyc6+iPCBedCu+CHV3SQ/UCrup
        WuLPUlr+0GlJdSXSeJceTMT6
X-Google-Smtp-Source: AK7set88VoilOQlxTjoa8t1HcvfxrI+V4qFAQ1QRtxur5FuNqUqXdQuM+jawCe3BaXgon86/Blfexg==
X-Received: by 2002:a17:90a:fe8c:b0:237:64dc:4b65 with SMTP id co12-20020a17090afe8c00b0023764dc4b65mr18245871pjb.21.1678264175895;
        Wed, 08 Mar 2023 00:29:35 -0800 (PST)
Received: from thinkpad ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id n11-20020a17090ac68b00b00230b572e90csm8420281pjt.35.2023.03.08.00.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:29:35 -0800 (PST)
Date:   Wed, 8 Mar 2023 13:59:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 13/19] dt-bindings: PCI: qcom-ep: Rename "mmio" region to
 "mhi"
Message-ID: <20230308082930.GB134293@thinkpad>
References: <20230306153222.157667-1-manivannan.sadhasivam@linaro.org>
 <20230306153222.157667-14-manivannan.sadhasivam@linaro.org>
 <ef6ce2bf-3fb9-50ac-ce4b-f8a0d5a8f099@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef6ce2bf-3fb9-50ac-ce4b-f8a0d5a8f099@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 07, 2023 at 09:18:41AM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2023 16:32, Manivannan Sadhasivam wrote:
> > As per Qualcomm's internal documentation, the name of the region is "mhi"
> > and not "mmio". So let's rename it to follow the convention.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > index 89cfdee4b89f..c2d50f42cb4c 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> > @@ -22,7 +22,7 @@ properties:
> >        - description: External local bus interface registers
> >        - description: Address Translation Unit (ATU) registers
> >        - description: Memory region used to map remote RC address space
> > -      - description: BAR memory region
> > +      - description: MHI register region used as BAR
> >  
> >    reg-names:
> >      items:
> > @@ -31,7 +31,7 @@ properties:
> >        - const: elbi
> >        - const: atu
> >        - const: addr_space
> > -      - const: mmio
> > +      - const: mhi
> 
> That literally breaks ABI just for convention. I don't think it's right
> approach.
> 

Hmm. I'll drop these two patches in next revision.

Thanks,
Mani

> Best regards,
> Krzysztof
> 

-- 
மணிவண்ணன் சதாசிவம்
