Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CE51B525B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 04:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDWCXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 22:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgDWCXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 22:23:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9EBC03C1AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:23:52 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id ay1so1744507plb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 19:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eqFUKGkgi/7711Wd38R/oVpsnZqk153pOxex7VFlhKU=;
        b=Gve4+ZOSbBsFD7X0/46iWM+Blcp+bEInJawIuG4DDAMMxWQXY8av0kd1/fY24V6zdT
         ELy8Vh8MTreWostHMbb8auwZwm66HdtXBA9EKl7wRW+v112NjfOXIZ2ArntK/RJVlh1Z
         uhalFEqrBscwkRCDYvmvaRkXL5CoGQuM1dCeRK6LXsqoSA2yJZYAvr5JGWPkH09U1AsT
         mkavbEi4lPMDXu+O2riYe908bm3/sPNsuq+8gmWdMhYSB0QRf6rHMHyRdBKqrmhEqiE7
         jXTP4pjwsGNm9HnsQTCJVv/ExMF1I5EFbjDGZYM2iHNqbh01gwuoll9vNLavKQkwmPyT
         8fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eqFUKGkgi/7711Wd38R/oVpsnZqk153pOxex7VFlhKU=;
        b=W7O1xY4iWfbH2Mq7nxKtlgdXAnDH1AFvIfNxoKZhXKT2sgcE6y0eV/l+LQvhtsRnFc
         AaagmqtACkPyXmJvpu+kVtLpr//3yVWYZlM5N/nNAS+t2kGMZntONgSHWQRVjeTAQLzK
         W4IqKixRODOp2X0fsP3eRY5fIX9iTv/smCYh4DODB68hEsEXdfcFTDhWGXJT98WcHaE1
         3LU99csRb2s0wNmjf9My3tOJ/8cOSFY+821FrT39k4gUisVvaZTOhkhG15xZpxV6ktZL
         x98BNcyeJ4Gt2znrQBgN0g3jws2I57zVttDUUeA6KS9Gz4VzV+m4UfS8GL+bDmOstJQu
         Ei5A==
X-Gm-Message-State: AGi0PubJNNJjDBrKu7zy5Oed3XkXJUuZzsmv8UDXGzcUNNtGUeyonGOw
        /iMS8l1qiOd0opa7W0479QE0hw==
X-Google-Smtp-Source: APiQypK1wUBVfNamJOHbWROPygChJ+zXEaD4hi3JQ65lkp1FVEmTMJ3Mzo7b2yTja1eNX2IbCHqx5A==
X-Received: by 2002:a17:902:76c4:: with SMTP id j4mr1627192plt.177.1587608631391;
        Wed, 22 Apr 2020 19:23:51 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x26sm854034pfo.218.2020.04.22.19.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 19:23:50 -0700 (PDT)
Date:   Wed, 22 Apr 2020 19:24:17 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: qcom: c630: fix asm dai setup
Message-ID: <20200423022417.GT20625@builder.lan>
References: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Apr 03:20 PDT 2020, Srinivas Kandagatla wrote:

> "direction" property is only valid for asm compressed dais,
> so remove it for non compressed dais
> 
> Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 3b617a75fafa..51a670ad15b2 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -359,12 +359,10 @@
>  &q6asmdai {
>  	dai@0 {
>  		reg = <0>;
> -		direction = <2>;
>  	};
>  
>  	dai@1 {
>  		reg = <1>;
> -		direction = <1>;
>  	};
>  };
>  
> -- 
> 2.21.0
> 
