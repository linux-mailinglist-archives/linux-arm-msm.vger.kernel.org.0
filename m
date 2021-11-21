Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2DD458165
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 01:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbhKUAk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 19:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhKUAk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 19:40:57 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D725C06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 16:37:53 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id bj13so29734223oib.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 16:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5VKCOuUsIsBCMyP4tx8hkXna4i3u2mIRI6h11/hs8kI=;
        b=oYUR+Z8gAiYWl1SG0Lx26Sl7qwQ8LbY3O0bGLj5PgJ2Jr23B2RU7q3BynVGFd+pUEZ
         nElKFa7Fn9A/Mr3qehJ3ujCkTtR63vOUEMz58w0yH+8vQihWdqZ9KY1Y3BbI5/Dg0eFY
         wbdYGR4i16+YGcVVnbmPczS+wk+nXERGZXrBdVKJCutR0Mku8L02qOZmltKGcE20gS/Q
         H8eUOf0KAM/OHc4QeW07xwRLcT3mzRujGyZg4GMf+ekSJrR1Pd5MmHUCbBMvmq+kvul2
         37U77owPmO35JulHXvTRt+RZuqavUfWzTzDEcLVljkldvpwrElB8oajjlyT4ZesCIz3u
         zmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5VKCOuUsIsBCMyP4tx8hkXna4i3u2mIRI6h11/hs8kI=;
        b=hQNBJ3qLa7fjC4sqI6bcHNhySCc1EVqfOknE6w6GPeuOzDo0a+JzTkMETxQrDKEEnG
         aKlvlTzkC4Mfij3NKtbbXkk8YVKlyzWIG0BULL94aVDmumbzcQC+oZfweT50HmvNRrHI
         PN55YpyXNGvws5tZJNoi287xKdjbtKfHkMvNexxKBIBgF4wBTvf+tbamDniZ56GCArwg
         1jviTwwQwTIoXP2+2goAoHtrwS9K6cPGVJeVrnU4UXjGzY6XEj/F/juU43WqNDa6VxQp
         GHubT583aYfKE7CVdQ5T6VsCNf9IB7GRHFL/+1BaUgWvV+JNkTUNKeWRd09ohNuC/cjO
         k6KA==
X-Gm-Message-State: AOAM531e61detsYXdL4a6NYwz0RzHITQ1HSLMa309uMAlAB3U4MeUy1Q
        3tKxFvy1HhDKrPh34fhBiMqzSQ==
X-Google-Smtp-Source: ABdhPJwn7W4OOFP+NzH/pExMf1vizWjgFtUTuF88Qck+521CtcSM6dROg7l8uLT5cn86jQEqSuSaFg==
X-Received: by 2002:aca:230b:: with SMTP id e11mr10560925oie.22.1637455072570;
        Sat, 20 Nov 2021 16:37:52 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x17sm802729oot.30.2021.11.20.16.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 16:37:52 -0800 (PST)
Date:   Sat, 20 Nov 2021 16:39:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: qcom: stats: Document
 compatibles with fixed offset
Message-ID: <YZmVSgVzUigHzrdt@ripper>
References: <20211119213953.31970-1-stephan@gerhold.net>
 <20211119213953.31970-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119213953.31970-2-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 19 Nov 13:39 PST 2021, Stephan Gerhold wrote:

> Document additional compatibles that can be used similarly to qcom,rpm-stats
> for older RPM firmware versions that have the sleep stats at a fixed offset
> rather than a dynamic one. The exact offset might vary depending on the SoC
> so use SoC-specific compatible names to avoid confusion.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> Changes in v2:
>   - Use SoC-specific compatibles instead of qcom,rpm-legacy-stats
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> index 99dff7d73b7e..473adca4e973 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
> @@ -21,6 +21,11 @@ properties:
>      enum:
>        - qcom,rpmh-stats
>        - qcom,rpm-stats
> +      # For older RPM firmware versions with fixed offset for the sleep stats
> +      - qcom,apq8084-rpm-stats
> +      - qcom,msm8226-rpm-stats
> +      - qcom,msm8916-rpm-stats
> +      - qcom,msm8974-rpm-stats
>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.0
> 
