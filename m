Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9102A4533B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 06:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbfFNEGO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 00:06:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44999 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbfFNEGO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 00:06:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id t7so413805plr.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 21:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HYi2Erj5A4oaNpZveV/ioy8G/sKMQ9krWJqQ69RYiWk=;
        b=P2EpDp7qWge4+8ecQWnVMZOR6neN2WO+Rlvl8kxFBws0yMA8ei6dEqDewubbLCAHZ5
         vgxHS8aQNp6EOL0mH5yOipqOx1jU8jckeapXz7HXYuqDOmN1ryynO9TAuMiWkak7sYXj
         sMaM6fkTEMMUp0S6WTJsNjI7LyrIADEgcfLbds3hX/1DV9/z38CKTSArow+3sU3NlEjq
         j0ZO63hn76UMSLxp4g1JzmaNa0YDkVoi8Lrqr7TPAAgziXokSLLLmN178mLdzkIA9hfu
         sl+hsLJC8veEGQg23BCh5UBdT3EBjj/jZpUSfrfyNB/4WmvyzfNqGC7vPXpd+byORwDb
         b8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HYi2Erj5A4oaNpZveV/ioy8G/sKMQ9krWJqQ69RYiWk=;
        b=eMQGCpfNnpBiHJDwB/hod2AfC90CxT0S/3T/irEPPSjf76ISiJBnSuxBZePrD2SkEE
         K6tjsqgmNhGbLljKs8Lo4wggSXL4ls+hBg1FahOxWyQvbrBjVSs8iq15wftvnIWBFZyD
         60wH7MCyLXVVSKYzbwqEiwbrSnEnffTGh7XXhR7zMHOkmldCGsF53FEzcnT/qWrtRBXN
         iJPzKJ5RAA9M7plfcO+oxRUueP13IDrFVfhm2ZzBw40ay6x8s03kMK38jJOs9dVkjydL
         +3M2RnjmNf8hXvsoSSSx84C8syBTcuPpWMAWbHEC6gqZXVumtCvGFVkj7z6T2GsfE2Mh
         qNvA==
X-Gm-Message-State: APjAAAXP/AKVBe6B0NJN9jcQiGO7NrrpyaPipfeM8Bdnlh3alHwErho1
        eGeI/3MRN/sZpHwl8QukBpRdCg==
X-Google-Smtp-Source: APXvYqyhaMIs28kbVZNlUk+Wgt9nb24TgswP+lgjinRe2HtMOF/hf2X+O3ATUsRqbG7Qqm/WoQqjoA==
X-Received: by 2002:a17:902:9a49:: with SMTP id x9mr71030064plv.282.1560485173702;
        Thu, 13 Jun 2019 21:06:13 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t24sm1115739pfh.113.2019.06.13.21.06.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 21:06:13 -0700 (PDT)
Date:   Thu, 13 Jun 2019 21:06:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, will.deacon@arm.com,
        robin.murphy@arm.com, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        david.brown@linaro.org
Subject: Re: [PATCH v3 4/4] arm64: dts/sdm845: Enable FW implemented safe
 sequence handler on MTP
Message-ID: <20190614040659.GL22737@tuxbook-pro>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-5-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612071554.13573-5-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:

> Indicate on MTP SDM845 that firmware implements handler to
> TLB invalidate erratum SCM call where SAFE sequence is toggled
> to achieve optimum performance on real-time clients, such as
> display and camera.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 78ec373a2b18..6a73d9744a71 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2368,6 +2368,7 @@
>  			compatible = "qcom,sdm845-smmu-500", "arm,mmu-500";
>  			reg = <0 0x15000000 0 0x80000>;
>  			#iommu-cells = <2>;
> +			qcom,smmu-500-fw-impl-safe-errata;
>  			#global-interrupts = <1>;
>  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
