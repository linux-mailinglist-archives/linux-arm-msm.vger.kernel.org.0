Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4A96DE418
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 20:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjDKSmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 14:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjDKSml (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 14:42:41 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564065B8D
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:42:39 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5140926a867so650544a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681238559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x6Ng2/ghiTU1RM0IxflD5v/hgT5kdOcuikWRftBe35E=;
        b=ahNrwYahrHR2Jo7NjpCTb5sYo+Mj3oe8k9O63DFO478m+0sZ9zMQxZkaLsjXmmW2ig
         ChX+7s/cOrMHL/p77BLrySaaBlgxSdQCppoTbEkJ7mTEp87pDRLSTSyrIOK6R4PfNRoo
         8BpRm33IvLsWBk6UgBFfwT+AqTb9GAGqz3K8QyRKm5Eieice1l8x1XEXWXY0rv6jHAra
         7r5UDZMN7Der+7QbDh49hAs2O9Nq6z2q9eduHsJbzBetpd9f17C1ZkhQgL4US8Im4cMf
         TebHazSea/AcFItmyKzT+tv3msPAhY390OpH80TjOFmMF9c8ImPX40oY5QgoJb2oqKNP
         zHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681238559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Ng2/ghiTU1RM0IxflD5v/hgT5kdOcuikWRftBe35E=;
        b=LcLYqfK5j2H3rKbMeZT0nEX08M72eMb5RwLZ/LmrhbVpdNfvDyX2ubKL716KLGhKp2
         m4NduV2YGFvrfnYXc+QnMW52luPwEDBr/udLwXoXUVGoYImbFcccg2qVFAMD8uEWhHxT
         bBlRvh+JCeSpagw8iSL9nuqQz2wJTU806e+wVsbBaZWbAx1xJAwwcGf2i/E3DGds6KiT
         Escjq51Roc1LCeXEUcvS5sessyzQvKO4sOVANAzm4PirlyYDk/a+bIMy3+OXOy1gKLQM
         wVaOyXEhglU33ORYNHGj1yygoa03cBHTwsAQzC4DEuIx9scISR4MVZYBs3R5caak5Bqd
         AYWg==
X-Gm-Message-State: AAQBX9dIn8WfeBCSGjQiU3py2O+22oV0uFDsu55H2rUwQ9NDPCtU+gNY
        k+NrspuL2LXk0vqbnGTeEqTC
X-Google-Smtp-Source: AKy350YuewgbMxHLTq7svnSq/upuotlWATNQt9z8vk4sDQ7z4m078rGm4F9+KcvFHKaiLPWMWZiZLQ==
X-Received: by 2002:aa7:9739:0:b0:63a:fadd:3479 with SMTP id k25-20020aa79739000000b0063afadd3479mr951955pfg.19.1681238558577;
        Tue, 11 Apr 2023 11:42:38 -0700 (PDT)
Received: from thinkpad ([117.216.120.128])
        by smtp.gmail.com with ESMTPSA id g2-20020a056a001a0200b006281273f1f5sm10105283pfv.8.2023.04.11.11.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 11:42:38 -0700 (PDT)
Date:   Wed, 12 Apr 2023 00:12:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        bhelgaas@google.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: PCI: qcom: Add iommu-map properties"
Message-ID: <20230411184231.GA59982@thinkpad>
References: <20230411121533.22454-1-manivannan.sadhasivam@linaro.org>
 <20230411174742.GA3428751-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411174742.GA3428751-robh@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 12:47:42PM -0500, Rob Herring wrote:
> On Tue, Apr 11, 2023 at 05:45:33PM +0530, Manivannan Sadhasivam wrote:
> > This reverts commit 6ebfa40b63ae65eac20834ef4f45355fc5ef6899.
> > 
> > "iommu-map" property is already documented in commit
> 
> Need the commit hash here.
> 
> > ("dt-bindings: PCI: qcom: Add SM8550 compatible") along with the "iommus"
> > property.
> 
> Shouldn't there be a patch removing "iommus" as discussed?
> 

Yeah, that was my intention after the dts patches were merged. And since the
dts patches are in linux-next now, I could finally send the patch.

- Mani

> > 
> > So let's revert the commit that just added "iommu-map" to avoid
> > duplication.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > index 5d236bac99b6..a1318a4ecadf 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > @@ -78,8 +78,6 @@ properties:
> >  
> >    dma-coherent: true
> >  
> > -  iommu-map: true
> > -
> >    interconnects:
> >      maxItems: 2
> >  
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்
