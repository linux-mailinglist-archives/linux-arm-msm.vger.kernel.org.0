Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4DA21AC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 17:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729169AbfEQPkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 11:40:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38510 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbfEQPkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 11:40:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id t5so5841827wmh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A2JLxlWuEH6j0Jh7jAHHHzHa1EMwyEMqpv3GEMW1UVs=;
        b=OnNLFUnou1xM7X9pYuJqa+LVW0qwSMf+DVBI6GQs7SanL/bRMnBwUzh0kMmXsYqszC
         Mc1FUipe50YAXj5jxDdDe1nIwoWb900P47imnAlMwtwvZ6EwlhrSaeO1Z1Y7Vy2WLc7k
         wwXuBikra23V6CL/9FaNnJTwMS0+FBDDfHZzOm2C7I/JnH2n/zELxzvbSxmiaj0ro/8k
         rjnl49Py8dOupgUfyZYxUpWEBPVYVIHbnl1HD0dV53jf2AtEIhk3lJkmkMlF4nFcbcEG
         k8R4BJUhGf3f1okowhT5Q4bOmLSVlCxZEdoPmRz4LwSiuaAdMWpuIgFbYOYjNBuvvfjG
         FoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A2JLxlWuEH6j0Jh7jAHHHzHa1EMwyEMqpv3GEMW1UVs=;
        b=toqabiOwIY8kL9ce/3ltzatSniuovDRnyBLaq/4bvlkAXMIyVnzcY/H+PpCoUbpMoR
         GbsX7vyGlcdu/FwrbjwoRNgXMT1lpgoj4ITE1dSyNWpVuCMAylR3IjS39CLlMtFpSOwG
         5v7LvpXekVgsQJRPnaMpbsoveCxVQmfJo+GjdAvx0WRji9Pf+QCX3VHc010y4Z8JeZLp
         E78seN8Cc2ppnBOZiiBofQwNg7JJFWUX5h5e1bbCmfCxMkI8VecEiP2gfCfVlLYOZUj1
         5IOtJngjAudG4pXq8KidFunOInHa2lbURP1DIM4Y7Q3es3jaqxahQ+XmddatelNX5XWw
         EnlA==
X-Gm-Message-State: APjAAAWFYwF1kd60jRM4ZLbISx48tVmQ2DYZo3yebNEfi+10x0Lm+Xta
        ELK52TvZpPzHPnoRIGcHdgBfPA==
X-Google-Smtp-Source: APXvYqyBEseYF+JOeF1EzQIGYvflNRNaMOYKQCUeq9NX4feFVh2lSJ0/WgBMHsfh9zDaJfJaXKuALA==
X-Received: by 2002:a1c:65c3:: with SMTP id z186mr2681206wmb.93.1558107611140;
        Fri, 17 May 2019 08:40:11 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id h13sm7028152wrv.6.2019.05.17.08.40.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 08:40:10 -0700 (PDT)
Subject: Re: [PATCHv1 3/8] arm64: dts: qcom: msm8916: Add entry-method
 property for the idle-states node
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, andy.gross@linaro.org,
        David Brown <david.brown@linaro.org>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc:     devicetree@vger.kernel.org
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <030b5d9c6dc2e872466b7132e4fd65c473f9883f.1557486950.git.amit.kucheria@linaro.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <35c77a53-d8cb-0b32-6b60-ce57fabd5243@linaro.org>
Date:   Fri, 17 May 2019 17:40:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <030b5d9c6dc2e872466b7132e4fd65c473f9883f.1557486950.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2019 13:29, Amit Kucheria wrote:
> The idle-states binding documentation[1] mentions that the
> 'entry-method' property is required on 64-bit platforms and must be set
> to "psci".
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 0803ca8c02da..ded1052e5693 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -158,6 +158,8 @@
>  		};
>  
>  		idle-states {
> +			entry-method="psci";
> +
>  			CPU_SPC: spc {
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x40000002>;
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

