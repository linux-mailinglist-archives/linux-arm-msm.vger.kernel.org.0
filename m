Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AEC228EB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 05:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731793AbgGVDoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 23:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731860AbgGVDob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 23:44:31 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C42DC0619DB
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 20:44:31 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so299988plo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2020 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k2fq/wKunbTQtbzxcjBzbGBCQHEpu9nN54onX0ypqsk=;
        b=zB2iU0yhHVsIhc9sLkETqFqT64wFAAmTr9FJaI4TY2wjlC1gXDdEC9JHN77r0d+3G0
         IqvsyYyem4cI8PUKDz5xhSKjssYiFvUn2vdIrWqZg+f/BSbXdmPVL1GRuPpeer90z4RC
         CF5xPurma3D2HuEC/lhnQW32yhWdCKfOAFkQvREwXzSHK6boGivVzxtJq+m7Q+ZAk2hN
         QvljAzI1DDHm6iwhNcBaFdJVhyeASUsiVL3xdNxNeDWLDBusEGANTq00tEfMaoYoA4N2
         vXMrcJk3xlt76dL1HhBsKSEsLAvJjuhixSmGHUhVogb4AB5Q/GIK0uX5+0fkN7tu+sgQ
         o8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k2fq/wKunbTQtbzxcjBzbGBCQHEpu9nN54onX0ypqsk=;
        b=V8bT/NdVBsH4UJP3tWa0Q4ZCGiB89j8ug8JbwMrYlBkYTVgO77UBKQpCDwWboY3aO0
         hDma0iDxaRDVp9WjGA3E1Zh7wwm9HHrOTGo2yCD6Yhgo1jU6assWc7f+/OKDCQXkKAsE
         Nkou5D6kGi+C31KZuTy9pubX1f8+pvjPjsUCe6HMwxtABfCs6/IyWdrAK4GrOWbeuBGy
         T4P0Vns0LvbjNsP4zApdBrvKr0jEciI/SMgFZIEUJOn96RbWrSrlvgMZJdn0XqtL8XBW
         C9RechMcHyHcHKykDwRwhT/SIFr0auzpLyY+1GWKuIxH6C911cDg8wMYfBynIGN6NXg2
         +56Q==
X-Gm-Message-State: AOAM533ulUBgDxR/CUoGurmVYqULKjovzNP6kN9Cr2XNfUoSfuX6+n31
        3YGRCE0wSJ3xfwoewYIp4h6Pig==
X-Google-Smtp-Source: ABdhPJzBM2aYSCdVc4QOXQOyCvsU/uDe0OrcBNBWaNPtGtrsnL22/ZqJPVGLM4aPMfe/ux8lJoOPtA==
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr6555524pjb.111.1595389470800;
        Tue, 21 Jul 2020 20:44:30 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z2sm22098713pff.36.2020.07.21.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 20:44:30 -0700 (PDT)
Date:   Tue, 21 Jul 2020 20:42:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: SD-card GPIO pin set
 bias-pull up
Message-ID: <20200722034237.GO388985@builder.lan>
References: <1595328245-29328-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595328245-29328-1-git-send-email-sbhanu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 Jul 03:44 PDT 2020, Shaik Sajida Bhanu wrote:

> From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> 
> On some sc7180 based platforms where external pull is not present on cd-gpio,
> this gpio state is getting read as HIGH when sleep config is applied on it.
> This is resulting in SDcard rescan after suspend-resume even though SDcard
> is not present.
> 

This is exactly why pinconf properties (such as bias, drive-strength)
should be defined in the board specific file.

Please move the "pinconf-sd-cd" node to sc7180-idp.dts.

Regards,
Bjorn

> Update cd-gpio sleep config with bais-pull to fix this issue.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
> 
> Changes since V1:
> 	- Incorporated review comments by Bjorn Andersson.
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d78a066..a3527c3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1819,7 +1819,7 @@
>  
>  				pinconf-sd-cd {
>  					pins = "gpio69";
> -					bias-disable;
> +					bias-pull-up;
>  					drive-strength = <2>;
>  				};
>  			};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
