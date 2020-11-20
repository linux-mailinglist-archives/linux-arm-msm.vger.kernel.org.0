Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543252BA170
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Nov 2020 05:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgKTEYo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 23:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgKTEYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 23:24:44 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEEDC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 20:24:43 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id h16so7587737otq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 20:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h7WuwHFiMngmuwO68KF9/HezTioINw/cSHUf/pGNYRU=;
        b=lisRmeRhOXD4a8T6k2e6pfhp8n0joXPQ/mJYTlG0wjPzVC1NUMQ16JuhZx92CDkqa0
         bVPO4tF+wVarxzjHw8LIwMHSvMie+uoBWP74YQEQK6Le57zEqgZ6xwAiPBRbWtZKQVtC
         YCdQMT9ZblVhGznTJJwKWXsFKM0ErSiOKyQJoyQLg6yjoJU92Tm/VM8k9x559P3J5wn8
         R+vE2/1VM3eLb8oHD/qhwgm1INFXLxP4QbzIrCE2sAZWxkd1WWvlDqtNdN0m99yUkalO
         dnrMgIsarSnpjFr4B7mUCqEYMEdUOjrzCuE+d1rNAQLYI36CdrBLyrZdEABeBPsCIfnK
         R83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h7WuwHFiMngmuwO68KF9/HezTioINw/cSHUf/pGNYRU=;
        b=ZXBUSPCuovWyQXGKuEVFTMVlWG6Wvtqbhp1feleMVWWxCnR3B5RyRvvQzq7IaS6oOH
         mpHp8c8RhNFwrutXOFeV74XWA7C3qNa43FNIh8LEI34obRaiin0Y3kNrZZlZ1HMY7anN
         v/pr0HtYQnXd0tiFZHP1c4z5VTybgulT33ArRCu8Tu0g6bbEI0mAy6dRKuEBou9nZRAE
         5kvM1M7ypGi7DbEfZ+Y1xq4GpbQ+USs248MVTy6rzC3WEYh67b9UFi7GeWdgi4RJ9O6+
         rLjvpnaoYjwKLpVY3nFrUrsY5/pZHdg7+je0DMkRoUjkEiaJmr44nVRd36NI8QXQVUH1
         bCUA==
X-Gm-Message-State: AOAM530MextEr3aiEtHS6jIlpIeSr6SpbyTwET11EImfDxVl0V/Gf8OS
        tpPH3pwa3SovAKXO9cb4tN7wajTOwQQBgg==
X-Google-Smtp-Source: ABdhPJwByh8JFpQbDfuRz86C6Hsku5xHXImoqPiYlUIFt4m7uYcvwmMUfgdaC9OwVizRS/Zjm5ZZEA==
X-Received: by 2002:a05:6830:1f11:: with SMTP id u17mr12860028otg.287.1605846282990;
        Thu, 19 Nov 2020 20:24:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v73sm677319oif.30.2020.11.19.20.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 20:24:42 -0800 (PST)
Date:   Thu, 19 Nov 2020 22:24:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH V1 3/3] arm64: dts: qcom: sm8150: Add LLC support for
 sm8150
Message-ID: <20201120042440.GL8532@builder.lan>
References: <cover.1601452132.git.schowdhu@codeaurora.org>
 <8f0e818485941076d62a8dc9f711b0fb868ba080.1601452132.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f0e818485941076d62a8dc9f711b0fb868ba080.1601452132.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 30 Sep 03:14 CDT 2020, Souradeep Chowdhury wrote:

> Add LLCC system cache controller entry for sm8150 to support sm8150
> for LLCC.
> 

Thank you for your patches Souradeep, unfortunately there where some
indentation issues that you would have seen if you ran
./scripts/checkpatch.pl --strict.

I fixed these issues up and applied the patches towards v5.11.

Thank you,
Bjorn

> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index f0a872e02686..71037a1bb217 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -490,7 +490,14 @@
>  			qcom,bcm-voters = <&apps_bcm_voter>;
>  		};
>  
> -		ufs_mem_hc: ufshc@1d84000 {
> +	        system-cache-controller@9200000 {
> +                        compatible = "qcom,sm8150-llcc";
> +                        reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
> +                        reg-names = "llcc_base", "llcc_broadcast_base";
> +                        interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
> +                 };
> +
> +        	ufs_mem_hc: ufshc@1d84000 {
>  			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
>  				     "jedec,ufs-2.0";
>  			reg = <0 0x01d84000 0 0x2500>;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
