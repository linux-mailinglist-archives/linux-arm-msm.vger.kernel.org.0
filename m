Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 740E342DFBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 18:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhJNQ4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 12:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbhJNQ4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 12:56:38 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A44EC061753
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 09:54:33 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g36so12994790lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FB7jURQ/cloxZX95b1lZK2eA7ZD1Fvj6ppcELfN+v1Y=;
        b=Fva9P2qYbLMXvPYYCUTLzGQVBRium3jhyc/Vv5l8krP4vjJdvYXkE7bn49sOnLidY7
         EhIpcHZPJqGAdSZ860b58YbSqb0K7oSR4zUYfUF7RFlK8zPrJ9ZQzoejl1ttjuwlT9wZ
         ehEZ8Jm6pYVhDh1KoMwD460X2rxoXq91Chtd4zyy3yYNqYSpUMKPTTkQZspa1s/iJ69D
         TMcdTy8fm0obj9E20VLM6GEHyCEkGBbJ0HN8ySi9YcnLwVRzCG+HNwK8rKEtXQE7O22Y
         KUZycXk/IZAfV2gOieqT1m7wzIeiouQL+gzeZr+sTDnHDM6wrX04aXcvw+luBY5m3mNE
         U79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FB7jURQ/cloxZX95b1lZK2eA7ZD1Fvj6ppcELfN+v1Y=;
        b=hd07wQQKPHLy3TsJtndym9cYec4jKKUWdbiaLsp5fAR88ccLD3bdeZwalfh7pXsLai
         eO9uMNY7Q7CD/Tq+klCR8rQt1MMir9+b6CowD3BbheLqlHnWVKbcWeRwiMnc7GYMy4Kk
         Uq2oP9TwdE15Azj0Cv6lNRnjou07nO73sSs+q6YWA8OUxvCA2QVqGGIDAoqd7A8XJL4v
         31Loil3TQ/M9c+kBq0HE+vscOCBA3UPs0hD4AbgoiMNiQO9oG8er1xkN+rT9UQrm+jqy
         NEUov+FAYm3SDlEUTTWrLX8tZarsolt/6QeoMRja29KGDZ+m5JMso3t+J07bLw4tu3bL
         Djiw==
X-Gm-Message-State: AOAM532vKNPkIj8Mal+zdyjK+qgtC7mFaaN/77SbBcXUsxcJfzUKJojI
        CrmPc4Y5wWTwXY1/OHzv6e8WuA==
X-Google-Smtp-Source: ABdhPJxF+akf386pidSJ6bww34Ya7ziich6BCGwkslriO2XJi8SbN0D5iMJNBzDIq7se8Wcrm9rKHA==
X-Received: by 2002:ac2:5627:: with SMTP id b7mr6096938lff.670.1634230471954;
        Thu, 14 Oct 2021 09:54:31 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id b9sm302732ljq.137.2021.10.14.09.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 09:54:31 -0700 (PDT)
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
 node for sm8250 target"
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <3af41112-7ccd-5da8-c189-3ed8d22273c0@linaro.org>
Date:   Thu, 14 Oct 2021 19:54:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 10/14/21 4:54 PM, Dmitry Baryshkov wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
> 
> This upstream commit broke AOSP (post Android 12 merge) build
> on RB5. The device either silently crashes into USB crash mode
> after android boot animation or we see a blank blue screen
> with following dpu errors in dmesg:
> 
> [  T444] hw recovery is not complete for ctl:3
> [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
> [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

your sob tag is missing.

> ---
>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 8c15d9fed08f..d12e4cbfc852 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2590,9 +2590,10 @@
>   			power-domains = <&dispcc MDSS_GDSC>;
>   
>   			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
>   				 <&gcc GCC_DISP_SF_AXI_CLK>,
>   				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> -			clock-names = "iface", "nrt_bus", "core";
> +			clock-names = "iface", "bus", "nrt_bus", "core";
>   
>   			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
>   			assigned-clock-rates = <460000000>;
> 

--
Best wishes,
Vladimir
