Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B70710447
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 05:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfEADfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 23:35:48 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38255 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfEADfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 23:35:48 -0400
Received: by mail-pg1-f195.google.com with SMTP id j26so7790415pgl.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2019 20:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gGBpQ22cZo82jHTD+I/IUsk4JyChaD+a56lPIrNlXmk=;
        b=nb2i+PCTIok5TAkKk9GQAGUtcUVingIVwTXaSRJmDsoOBurOnYP9VlBxM5ebKoJtly
         WbvyUfzELfhkzRIGjHkYKqhPAQEcU8aEAdkaz8g3ohGDupHNY5kYenizzOlnYCjpUkX3
         Lha+vJ+1z4VROs4YjbGWyGRyXyyhjH8n4ydkhpRq+kY+INp0OJst6I9obvyGvVbxBEAW
         a0IQFPL/lsSeKgiUxHOyxg6h6zEduyKhwfE3NOOw1Du8EYN3kpamAIw0gHuz8uDd9ZVn
         wBQHE1gH5dV3yAPRiqq2PQc23QBetX04oScuJu0bej9g6tCLB7dwmZQ29Fp8j/Bghqs4
         iHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gGBpQ22cZo82jHTD+I/IUsk4JyChaD+a56lPIrNlXmk=;
        b=kewyhJCBWtUmwu9f51aDoUeTpv6wFMXP6DO4DfFBUtwqkIc2sD+Lqoy5F4q2dtX00b
         1wpX14+kljf/9OgzVnQOQ7uPwWCPWFwfTCWHeVN92hj4B9aFY30tXrLM9nRlx51M9Tq0
         svVxUlMriQo4NYqIpB+eJMHv3PxZJxnDeKYRW0YEsPJKi7MJu3J4sVGLCNAhy8l4j26l
         6P/1HbtllvDKyHwuNGonjQViwnv8fxENZmt/ku4u0yQ5e/N1cKoInUYAge/X2rXg8KmI
         I5cn75DXJQXG60U/ayXC4ETXxWOqQt18uJg+nofwpNZmqO9nNVBStWuiAoPAKEKfdbha
         6jrg==
X-Gm-Message-State: APjAAAUvpiYRt5EMwX5OB1wvh1SDMh+jNmvRtOFUa1buLd6pKGttTuCd
        fSgRDee86ZXR7wV35ernWNTvTQ==
X-Google-Smtp-Source: APXvYqw5sLyzX8YvoNP2/r6DaJ9dgnAXuMg2wjCfm6Z1hOYZrVB3Nz+pTr3TmAlzM/OEp+xqu2zUHA==
X-Received: by 2002:a63:8e4b:: with SMTP id k72mr28880933pge.428.1556681747848;
        Tue, 30 Apr 2019 20:35:47 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 132sm29735015pfw.87.2019.04.30.20.35.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 20:35:46 -0700 (PDT)
Date:   Tue, 30 Apr 2019 20:35:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     agross@kernel.org, david.brown@linaro.org, marc.w.gonzalez@free.fr,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Message-ID: <20190501033548.GC2938@tuxbook-pro>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677531-29291-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556677531-29291-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 30 Apr 19:25 PDT 2019, Jeffrey Hugo wrote:

> GCC is a consumer of the xo clock.  Add a reference to the clock supplier
> to the gcc node.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

(Although I prefer clock-names following clocks)

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 574be78..9c88801 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -709,6 +709,8 @@
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  			reg = <0x100000 0xb0000>;
> +			clock-names = "xo";
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>  		};
>  
>  		tlmm: pinctrl@3400000 {
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
