Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 134E66A544E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 09:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjB1IU3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 03:20:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjB1IU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 03:20:28 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735CA298E3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 00:20:27 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id m8-20020a17090a4d8800b002377bced051so12894411pjh.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QdzoaRyb5oCo6xd8IOQ9cPgW8ozAM6ednsqQltxzExs=;
        b=BqcRyaaKyWb9pCV5Cm430K4Z3cKN1oCziWGuAk0OAtJb1BHubwxttM0A1CLlc22g5y
         OlDS01J4tPW77VAsIdcNYhslc2gk08QtUzZJi102oYFwr/AvZgha3cjFOvqK7ShhGBqd
         1PiRf4gjCLnZLx+wtlryESe6Dp7+cDxpMUWHvuMPwDm7pMGBpXUI7AxxWQcXFJoJ1NUU
         v9HvQhfedglpGHNVw4GPitVlw4IzL2iWKNRjq+hANDacKYP7xIADtpTKeUhmacsSiyM+
         ucwJDE3UHK6HfkY847R64luJflvsXLK+e+wC0FwX8DSuaRW6Nbw9HDRcv4Q08a1DeGs1
         SQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdzoaRyb5oCo6xd8IOQ9cPgW8ozAM6ednsqQltxzExs=;
        b=Bjg+ODMu2hpevKVPCU4t+s2elbsypTobgs12eDaeQYsnCEmFGKjkwFnr2N8RpDt8C+
         +QgGQLC8KSR9I1hxiWQ/OqK0uHI/+4yn2hVMFH45k9U19Cs8Uu0Kf0gDFKjTh4hQVcoF
         Uk+TCewath+QGN7VT/BRVI7jfbAqbyBw3ws4PPzZobZSyLq3U7UIHpw6OfAU4ooHu311
         QshSEuKdpY6CJEBKEi/DTIoET2qVlfMSzv0jvJJit55VodNAmAT5tlDu1OWM71owx3Zn
         zn1K/HsZ0bVVTL99hN62O82uCjABaH0EfyrGyXZBcZ2bB21YQqXEBsm8WfvhVSat2ZhW
         EzPQ==
X-Gm-Message-State: AO0yUKUf4Uc4FkYp00ZhKG9EmKZr9qhultsi2RQG+ouUNrJ/Pglhff0Y
        n+UjF0PBs9zz4Xc3rkGFS35Z
X-Google-Smtp-Source: AK7set/zVF+0d5ZD8zgYrUqh1wEePvj1EbD/gqma4J089vE1KIOxONhftRtPeMTHDGHwyS/kTrEOaw==
X-Received: by 2002:a17:90a:355:b0:237:9cc7:28a5 with SMTP id 21-20020a17090a035500b002379cc728a5mr2394542pjf.22.1677572426864;
        Tue, 28 Feb 2023 00:20:26 -0800 (PST)
Received: from thinkpad ([103.197.115.83])
        by smtp.gmail.com with ESMTPSA id k70-20020a638449000000b004b1fef0bf16sm5215067pgd.73.2023.02.28.00.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 00:20:26 -0800 (PST)
Date:   Tue, 28 Feb 2023 13:50:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/13] dt-bindings: PCI: qcom: Add iommu properties
Message-ID: <20230228082021.GB4839@thinkpad>
References: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
 <20230224105906.16540-3-manivannan.sadhasivam@linaro.org>
 <20230227195535.GA749409-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227195535.GA749409-robh@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 27, 2023 at 01:55:35PM -0600, Rob Herring wrote:
> On Fri, Feb 24, 2023 at 04:28:55PM +0530, Manivannan Sadhasivam wrote:
> > Most of the PCIe controllers require iommu support to function properly.
> > So let's add them to the binding.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > index a3639920fcbb..f48d0792aa57 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > @@ -64,6 +64,11 @@ properties:
> >  
> >    dma-coherent: true
> >  
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  iommu-map: true
> > +
> 
> I think both properties together doesn't make sense unless the PCI host 
> itself does DMA in addition to PCI bus devices doing DMA.
> 

How? With "iommus", we specify the SMR mask along with the starting SID and with
iommu-map, the individual SID<->BDF mapping is specified. This has nothing to
do with host DMA capabilities.

Thanks,
Mani

> Rob

-- 
மணிவண்ணன் சதாசிவம்
