Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFC9206839
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387718AbgFWXWE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387465AbgFWXWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:22:03 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FF8C061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:22:03 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id s14so144734plq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CuB8LyKWU3gQTO8KTHP4chGB4nHsVZRexxd8DJQlhT4=;
        b=RdFfuEeBS/PDR2M6Vg8ybL7SXg24nMU7l0WJ9uLHmp+KqG8z51R72UWFRIZNk4J0gs
         f8ko8Zir2Wai94W3DHoFg9LiKrKzWpqC07baNkPSxTXV17wW1Jcqf4E/dJ2x+lqPAEEa
         SiPQhg2ZTI5r3jjpJsH/aQyLLsLMydKItNVxpNoigHSu/oeqGAtd2p7WxxXGb7KzTgGo
         QbTL+yEu2CeEGnmet0gGQO7rCFWnf8UcRoQtCTTBKL4gCFoS9K74THN26JtRRvlBRCpm
         A11gWfspW9Z49mLEnHJCOR5k+YWBYSPdxn5N2j8zuIvLJFakw0WlbF4XvZUUgfiiqYju
         jZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CuB8LyKWU3gQTO8KTHP4chGB4nHsVZRexxd8DJQlhT4=;
        b=JdbnapXPE0hHfInn/N1+4/lrWmJGf84vMgX0S/WqM9OCR6r3wqqtTSZfy6kYRZggdY
         gZIX+hRmKDfzr04DG3apc1t70o/lEPLGpu27AA/XAdNQTtGq8x5TJoxCWtMxAXUnsdZv
         JitCcQUULxH3kR/fgtX3dXy2CoQ9fIoUf/IjgTL5R0KUEfPQV56HbS1IIiHsERiOFomH
         CI1sE+QxqHvwKivOi+k3MZXwHaJ3sMMqK0gBeNQTLmzWLF+++MwamhJFublEC/IaNVSb
         CY45qi+gY/7GP3QpsjHSoFMpahKFFrTbKARwACWvYlEmVy+AyAmsmbvYsTZShn04NWak
         Wihg==
X-Gm-Message-State: AOAM530UEEXA1MQEMylEUSwyIysVWlKxf98O43+RXSA1rrNoiKD67s80
        nQmuSKsqpxwik2XNa/6F6UdtLA==
X-Google-Smtp-Source: ABdhPJx3gGUWnUZGIMU7UpWpvBUlSg0qBFeDf43EeDNUB7n4gVumN6S9IsR3biHWhJK/YAd1aX1H0w==
X-Received: by 2002:a17:90a:1d46:: with SMTP id u6mr26949001pju.146.1592954522548;
        Tue, 23 Jun 2020 16:22:02 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s23sm3357374pju.35.2020.06.23.16.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:22:01 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:19:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/12] arm64: dts: qcom: msm8994: Add SCM node
Message-ID: <20200623231919.GL128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-7-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-7-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index f989530ffa90..838ffc0d9c16 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -142,6 +142,12 @@ core3 {
>  		};
>  	};
>  
> +	firmware {
> +		scm {
> +			compatible = "qcom,scm-msm8992";

Shouldn't this be "qcom,scm-msm8992", "qcom,scm" ?

(Or rather "qcom,scm-msm8994", "qcom,scm")

Regards,
Bjorn

> +		};
> +	};
> +
>  	memory {
>  		device_type = "memory";
>  		/* We expect the bootloader to fill in the reg */
> -- 
> 2.27.0
> 
