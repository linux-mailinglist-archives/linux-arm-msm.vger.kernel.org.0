Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECBAC135B3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2019 00:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbfECWmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 May 2019 18:42:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43442 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfECWmR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 May 2019 18:42:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id t22so3370789pgi.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2019 15:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4RYvNBRihg/HZePRuAHy3LcvAniIXnKHrlXHPcftmFs=;
        b=Gt5toQv5TYcVqMJ1wYceVeXD21dLmeK2mCMoPR7QrK9DDKIzUd41u48ol33VRjGT9n
         sKoIUJqzoMrxmH3wrfCaUWkIwqdgJ8Ouoz+8PJ1G+67G3bQ0uxICS0sH1PUE5g/P1NPD
         KS+Rd22dTPYlQSuVFCyNEPAGt2Df2yw8H+EMDpBZTpSA3fZ9aHm+M2TJHGAU3z0eZ1oB
         COEI295juknojXvk2ZUc++Einpc9aqX1OufbvergGj7kNg+6BywrmZcdyWFNUPMfB8Ya
         VfVWAmCTwfzczuQXNNMlq4WCJyox4a3NMFuY2JazkLhy3Ej7lRxXwQpZjnKXqYQaZUQR
         RPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4RYvNBRihg/HZePRuAHy3LcvAniIXnKHrlXHPcftmFs=;
        b=L/AoI3wjDgFTSasrsyDepicCvxEaxvTwJQjxkO39v0j+1q/w+6Xm1f1Xtpu17TY/Qx
         0TGG24Z1vUwURXMEkWGXLNF3Xk+vrO+3xm1tZWY/sn4iLE5FqetnW5p2l3yWMOXgtqQw
         a/603cBrGr1RY2Pmqk7M4wi2BhuC588A3wNh9V8ET22okplNO73Wuh04lgFSP+804ROj
         aSeij64UTaMaq06WRdzFNNTLbEhQYpTfDl6Jb53Wv9za+CEbR92V+52BZ6d5B8pi6CdG
         g2WyH0WiyQVI+DaYcIcuqb55sNLRYBW43gibLMnBYDrojbJ3n9bTA0uQK8MpPUROf+2k
         IZyQ==
X-Gm-Message-State: APjAAAVwcwnCCFMtDWdtj8eyHDBxgm2wCb05p/Ty4ryLtOpglFIyXAIe
        56Lp5gnKJ/zMJtIQ6OggKsMKRg==
X-Google-Smtp-Source: APXvYqzJIfKn9EVufbH6skH/fjFGpac0p0raS5ruRaxpojktvkgJnhgJi8aBBww4YuTIakheArHPdQ==
X-Received: by 2002:a62:62c2:: with SMTP id w185mr14617509pfb.237.1556923336280;
        Fri, 03 May 2019 15:42:16 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e29sm3648517pgb.37.2019.05.03.15.42.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 15:42:15 -0700 (PDT)
Date:   Fri, 3 May 2019 15:42:13 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404-evb: Fix typo
Message-ID: <20190503224213.GI3137@builder>
References: <20190502121306.3374-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502121306.3374-1-vkoul@kernel.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 May 05:13 PDT 2019, Vinod Koul wrote:

> Fix the typo "dreive-strength" and use correct property drive-strength
> 
> Fixes: 7241ab944da3 ("arm64: dts: qcom: qcs404: Add sdcc1 node")
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks for spotting this, picked up.

Regards,
Bjorn

>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 2c3127167e3c..7cc0b7842ac2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -200,7 +200,7 @@
>  		data {
>  			pins = "sdc1_data";
>  			bias-pull-up;
> -			dreive-strength = <10>;
> +			drive-strength = <10>;
>  		};
>  
>  		rclk {
> @@ -225,7 +225,7 @@
>  		data {
>  			pins = "sdc1_data";
>  			bias-pull-up;
> -			dreive-strength = <2>;
> +			drive-strength = <2>;
>  		};
>  
>  		rclk {
> -- 
> 2.20.1
> 
