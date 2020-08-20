Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44AD024AE0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 06:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgHTEuu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 00:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgHTEut (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 00:50:49 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103C5C061383
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 21:50:48 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f5so474031plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2020 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CAQyVimWJ9WHY20IwK77VrKVM6sP38l0qgrrAA5OY2s=;
        b=JyFvunh5Qg3y12yFQAvL/e4P5UgoOEZ30z1X824W7lJIml9rMARbVbJlPrBas1rzuu
         1cAl3zjIhxzy3lOjYMBLMcurPFUi7y/LJacf8Xz9Ec4+1TENZbNiB1OStC6qx8g6mwwG
         UpTeYpCNCyxJvw9/1PXT7mKN0Qv+r5wce8cH6qaRn/pFi2YnokweYViQJGkG32TQAy67
         QrdkjFN5BIWcooD8FR5nW2Ddfmgfs+qSYtTvKgECOiiDeYmSs0n7FWKDq4TW6wFC8ZXh
         PyPXJZ9BYwDAJVwUkrRNbI7L/IhqxrhCgQxrY7dtGcJfKtJ8399eRuYKaE9J7qM3F5uc
         RFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CAQyVimWJ9WHY20IwK77VrKVM6sP38l0qgrrAA5OY2s=;
        b=pT+Re6BfdO2ypYLdeBHpHf/TNuqkeOIluA4wFLDstYVA4yDWF35P5OhCkgitw9PNmV
         uau2YDnZTshmVuy7RN2Pq261jm/tIWD4Gm/3GMIA4iqvgLdJXks/dGCVfoXS3HIxrxJd
         xt5BpO8Civqmw+Dr7ZE6+NmOUFzwNNLhrgG6L4RUylDk2jmzyi1uHNU3SYM0qT82Kcgk
         JwYfH9hi95OWsAjmmUxBGWNHCv1PJw6hewuB6vxHDjfy0OX2bC/38ncPPE8Dstts1LpI
         ftcOSUo7utuU+Q8w5hzm0NpvOgKCcJS69nU6fzK60iIFm9fGY2PDXb6SGrwwvGjeaUj/
         L82Q==
X-Gm-Message-State: AOAM531j1KW+HgEsJ2fnTQy043pX7ur+bmTBdi4hGkxXazbT6ummbctZ
        ZqCPsw1VO96Mrfhdhzue89EnCQ==
X-Google-Smtp-Source: ABdhPJzFWFtO/XgUriC6NiGEMrtDeB/+HxfF2CKo0Nogv8xWkYI65+dOTjh0M1zXA7z5WXEywaMT/A==
X-Received: by 2002:a17:902:8a82:: with SMTP id p2mr1279400plo.184.1597899048167;
        Wed, 19 Aug 2020 21:50:48 -0700 (PDT)
Received: from localhost ([122.172.43.13])
        by smtp.gmail.com with ESMTPSA id q13sm654643pjj.36.2020.08.19.21.50.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 21:50:47 -0700 (PDT)
Date:   Thu, 20 Aug 2020 10:20:45 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Barry Song <baohua@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH 3/5] ARM: dts: spear: Align L2 cache-controller
 nodename with dtschema
Message-ID: <20200820045045.2clqfw624bqc2cza@vireshk-i7>
References: <20200819175853.21492-1-krzk@kernel.org>
 <20200819175853.21492-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819175853.21492-3-krzk@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-08-20, 19:58, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>     l2-cache: $nodename:0: 'l2-cache' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/spear13xx.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> index f187da4485f4..c87b881b2c8b 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -43,7 +43,7 @@
>  			      0 7 0x04>;
>  	};
>  
> -	L2: l2-cache {
> +	L2: cache-controller {
>  		    compatible = "arm,pl310-cache";
>  		    reg = <0xed000000 0x1000>;
>  		    cache-unified;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
