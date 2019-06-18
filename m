Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 082D44AB58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730284AbfFRUE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:04:27 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38582 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730189AbfFRUE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:04:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so8262182pgl.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2019 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vAeqHyw6RagaEliqavOvZJ2tWkD0tQerTi99czZ7j54=;
        b=Y0SmQ/Q9ZkciYInJWgfVb/m+PnqweV6Vw493C5o0NZIaQlRJgLvkcKIV3z/hZwMUlT
         9kY5x67BFTdBJAIUKve2catt0LClJmdpBXSauyMnrGSMj9uBjKdlSjAGX14xL22QJVWi
         DkVRnLg9/aB/JJg+bV8QbJ6H5VCPnEqpi5h7bldfNl8kJGMxU+aOpqUsPjWmKW8dC0H9
         /QFVy1hI/pwUr0tvY1VYBQVKPeVcXxHE011OTqRwczN1nFnM4thyC7UQUxPQMJiGKluU
         kYPRZykIsBCyPDuO/sulFZe397uvd084spd3dckoNkhTz9W+uIOnPE3zUIXmP+LXHyEb
         W6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vAeqHyw6RagaEliqavOvZJ2tWkD0tQerTi99czZ7j54=;
        b=sgWoUn2CH39Ya/Z3mghsmSRxCznouj291JiEZPbcgmqKBoiS6G4gT/1FQNNjrJPB+U
         S4dajSqkdoeXjOQUhGsnJWgulOcT+yDNKrevaAiE/6QWHkhsl2eHcMUEpvPXQVpNvc1z
         KetzantVEYiRUJP4qeEcIM8+qb7mIgvuoq6gotj1/KBNzx1oJTdk3CyEzpruQiYQQWnP
         +HqiNN+P2FTiBWMME3+BjrxAerUZhw/GhMqCimUhVbzmxqyT2AaJ0OuO1v0RMxsOr1oH
         iPFT2siWO35MdKzLFutoldrx0qyCYoOckx7s1PaKyoofVimA9mY9dFVVkJ/9B0FfXAhT
         /byA==
X-Gm-Message-State: APjAAAU/ZfRPRyTwyqIDDGm73QufoNeMQADNzrM2/hzmA9TVLMqUFm/F
        d3xDpps6OrazzlFjew6DbaY4Lw==
X-Google-Smtp-Source: APXvYqziW6L+bjnki/hEVBA5wM6lqP9xgFoBR8esg+frVAp27tb7dC/Sks29kliKkIUIwjigjNPdQg==
X-Received: by 2002:aa7:8acb:: with SMTP id b11mr120623855pfd.115.1560888266696;
        Tue, 18 Jun 2019 13:04:26 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l13sm2750876pjq.20.2019.06.18.13.04.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:04:26 -0700 (PDT)
Date:   Tue, 18 Jun 2019 13:04:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Rename smmu nodes
Message-ID: <20190618200424.GH4814@minitux>
References: <20190618052441.32306-1-bjorn.andersson@linaro.org>
 <fbe71878-a129-1b11-d978-48a99b292086@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe71878-a129-1b11-d978-48a99b292086@free.fr>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 18 Jun 00:39 PDT 2019, Marc Gonzalez wrote:

> On 18/06/2019 07:24, Bjorn Andersson wrote:
> 
> > Node names shouldn't include "qcom," and should whenever possible use
> > a generic identifier. Resolve this by renaming the smmu nodes "iommu".
> 
> You mention "qcom" here, but the prefix you changed is "arm"
> /me confused ^_^
> 

Thanks for proof reading my patches Marc
I'll respin this.

Regards,
Bjorn

> 
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 2ecd9d775d61..c934e00434c7 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -1163,7 +1163,7 @@
> >  			};
> >  		};
> >  
> > -		vfe_smmu: arm,smmu@da0000 {
> > +		vfe_smmu: iommu@da0000 {
> >  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> >  			reg = <0xda0000 0x10000>;
> >  
> > @@ -1314,7 +1314,7 @@
> >  			};
> >  		};
> >  
> > -		adreno_smmu: arm,smmu@b40000 {
> > +		adreno_smmu: iommu@b40000 {
> >  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> >  			reg = <0xb40000 0x10000>;
> >  
> > @@ -1331,7 +1331,7 @@
> >  			power-domains = <&mmcc GPU_GDSC>;
> >  		};
> >  
> > -		mdp_smmu: arm,smmu@d00000 {
> > +		mdp_smmu: iommu@d00000 {
> >  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> >  			reg = <0xd00000 0x10000>;
> >  
> > @@ -1347,7 +1347,7 @@
> >  			power-domains = <&mmcc MDSS_GDSC>;
> >  		};
> >  
> > -		lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
> > +		lpass_q6_smmu: iommu@1600000 {
> >  			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
> >  			reg = <0x1600000 0x20000>;
> >  			#iommu-cells = <1>;
> > 
