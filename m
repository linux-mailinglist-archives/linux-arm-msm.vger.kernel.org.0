Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919795739CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 17:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236792AbiGMPNO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 11:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbiGMPNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 11:13:13 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD0D45F43
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:13:11 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so4145227pjo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nHna6q8haXF012wFoVlU3mi09UNcmJSRQ4P1JKT5xOg=;
        b=CXc23FklogJD5om5a2d6XqaWm8drlrQjWI+VzShzntPDCJYUU/32ANHo0nlRqD/jce
         RsVnYDQg8oJCKAAMA5wvHkXAT4kSRxWjsFidkXSQdduRRwqYTgtWE/BgrmuW2b9a66VE
         PfGbD6jFAsn90/GhjrmzFQrgv/wMn3kNFPmMJkNpvpXBgUSg6ZdaTlj/aGrMCn24ZdVm
         4dY9YAHKqMfCQN0B0rEBNOFHDY/MoUYWDiugzIrOPgCSdbDK5LissQcyCrAD4iElyeMb
         QFCYzDzxooZz/gGb3auvrS5VIEVtlR3RJkw+s6T+m2CjYrn666JNzP2kQcGPVHFclhF2
         s2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nHna6q8haXF012wFoVlU3mi09UNcmJSRQ4P1JKT5xOg=;
        b=xBupfyYefvCQ/lmS5/7fUKh++ybkauHT5itVHvL+hEizo97BVLkb2Pk65afl/QA0gk
         tcGgQy6pHZjMKmFQO7OARgYIAis6guN3WTvDmIteJYLVjpRblkdLVr6NwFpsYquAzT3q
         JRM8TLLS7VYokcIrFqAJlL2i2TlECYj6hy4UdwZK7H0qPKpHGc2ChsClykqimvYuF97U
         yecBoN2SfS3iLsdB/qrIt6F+VYbE+UZvMzTRQFnHkYLGrGFL28xTL6fmj+ZcXlJJqyO8
         KYb+l3yaiQ1dAvj2PEUucWhQqEgWxuboRiNo2E9jTUHdgG4lazorm57GlI5DOXXIFgXL
         eiLg==
X-Gm-Message-State: AJIora9TzJj3ZfO5TP1utT4cYOswtIT0mVBOg2Ul3VAAAI5BNBgqZZjD
        7QHhJDoHHVZUuSSi/aZK93ng
X-Google-Smtp-Source: AGRyM1vOlU7utJFqv9U8LPiuqQgbEgKciktWFPD48RHUaXgen/iU/qGci5ug+URJIdPFy938rKFaxA==
X-Received: by 2002:a17:90a:b398:b0:1ef:7e67:6 with SMTP id e24-20020a17090ab39800b001ef7e670006mr10416045pjr.123.1657725191006;
        Wed, 13 Jul 2022 08:13:11 -0700 (PDT)
Received: from workstation ([117.248.1.226])
        by smtp.gmail.com with ESMTPSA id w185-20020a6362c2000000b0041292b732fdsm8138159pgb.38.2022.07.13.08.13.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 08:13:10 -0700 (PDT)
Date:   Wed, 13 Jul 2022 20:43:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Steve Capper <Steve.Capper@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix PMU interrupt
Message-ID: <20220713151305.GA4591@workstation>
References: <20220713143429.22624-1-manivannan.sadhasivam@linaro.org>
 <Ys7c0JGAV7AAEjaO@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys7c0JGAV7AAEjaO@hovoldconsulting.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 13, 2022 at 04:55:12PM +0200, Johan Hovold wrote:
> On Wed, Jul 13, 2022 at 08:04:29PM +0530, Manivannan Sadhasivam wrote:
> > PPI interrupt should be 7 for the PMU.
> > 
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > Reported-by: Steve Capper <Steve.Capper@arm.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > index 268ab423577a..2d7823cb783c 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > @@ -477,7 +477,7 @@ memory@80000000 {
> >  
> >  	pmu {
> >  		compatible = "arm,armv8-pmuv3";
> > -		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >  	};
> >  
> >  	psci {
> 
> The interrupt number matches the vendor devicetree I have access to, but
> the vendor source also has IRQ_TYPE_LEVEL_LOW instead of
> IRQ_TYPE_LEVEL_HIGH here.
> 
> Is that another copy-paste error, perhaps?
> 

I don't have access to the documentation of this SoC now but since Steve
tried with IRQ_TYPE_LEVEL_HIGH and it worked for him, I think it is best
to leave it as it is.

Thanks,
Mani

> Johan
