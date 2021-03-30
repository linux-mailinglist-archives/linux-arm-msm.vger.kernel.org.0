Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC32034E5D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 12:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbhC3KxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 06:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbhC3Kws (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 06:52:48 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0348CC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 03:52:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id hq27so24108592ejc.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oBnG2TakhmLmvRYGUb/04MxUlScMZhhVFfbZVw+gUk8=;
        b=QO/iA9QDZIu8GXp0AL3Lvs2JqtFzX0YqsG/jYvAPbv2DLBCb+2nmO1jCXW4SpJK8Xs
         dru4QYZR55PU74HwrxjxYBr8IQNqeAWKs89bRLOB5o3ein4RnIfG+6bak94mPZoCZPBV
         /9lzXQxl0teYtKvl94ZtT4dYUEarYNWmXIEaOA6vYc63f0rgSYQG30A6R1alsiFej/Uk
         RZqQGn+EcuaWdlIhPv1QYwB+dUYOIKhCwFSPjlk8wAhieAXzOzU6bbJuWogsYJs4LIFQ
         A6kiFP5cy2oLuqbXHrPXDMYVULH/e/Q3d6yIfsYR7e0pD6eGxpS9rnBxnGkOJKCOabzL
         m4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oBnG2TakhmLmvRYGUb/04MxUlScMZhhVFfbZVw+gUk8=;
        b=QUKUc1sRRGsTOW3zR2Hr8roG13WcXTJBr1NMXByC+OLpV7YxV/fNwvNZlugT0ms3Ey
         gz6D//wrB4gJZhtzyfK23U1hv0wv7Scb2xhfjavgZTriivddB9oLveAw+Y4HF+h/gFlv
         Cg2DIf/iR/sS0h6SMOXZj0db5JoUP3lNp9y/PgxpHfKM17BylJZbQ8vPIma4ZTyXi7c+
         djeza8QKDVYjnlpQoOKGNXILie/Q/l+tJ3/DiZsJ9epu+cwF8frlRkScmYgTEHFoKM/1
         7LLKAI7HKIyQ+1ggAOh6Gz7og3x4jkGg+qZ/Y/6VldcNPG1+kPUhWaE5sNpwBYsgICnv
         O8ZQ==
X-Gm-Message-State: AOAM532H7D5uW7fe8cAPYOSIYeQbOZQwHkcssXB3v8Ci0WQX6w3f2PGp
        DvnemI+vGeUcKKJJTDUxJp336IAsKDqqDw==
X-Google-Smtp-Source: ABdhPJwiSti2LSfBiErK0gC7qLs349y9VjSzb3XhCSCrYwvv2JKnlUDY6yBTiGdZb1mp86wjJtscMA==
X-Received: by 2002:a17:906:26d4:: with SMTP id u20mr28662103ejc.114.1617101566583;
        Tue, 30 Mar 2021 03:52:46 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id l1sm10879470edt.59.2021.03.30.03.52.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:52:46 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add SoC compatible for sc7280
To:     Rajendra Nayak <rnayak@codeaurora.org>, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b8b1c34e-8faa-857d-4508-8a24cc31c3a0@linaro.org>
Date:   Tue, 30 Mar 2021 11:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25/03/2021 05:44, Rajendra Nayak wrote:
> Document SoC compatible for sc7280
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 992777c..861b205 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -24,6 +24,7 @@ properties:
>             - qcom,msm8998-qfprom
>             - qcom,qcs404-qfprom
>             - qcom,sc7180-qfprom
> +          - qcom,sc7280-qfprom
>             - qcom,sdm845-qfprom
>         - const: qcom,qfprom
>   
> 

Applied both,
thanks,
srini
