Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021A6693312
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 19:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbjBKSrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 13:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjBKSry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 13:47:54 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC6910405
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 10:47:53 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id s13-20020a05600c45cd00b003ddca7a2bcbso866088wmo.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 10:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xJiQZwtrdvFqzP9AQNrrS98B8QLfVWaIK9De0rMt+NE=;
        b=HPUMHiaHxlrcKkprkzSsbhY84HYu7ZgJI5Txyh3C7JOn3gNS5PIbcHY9cJIqo8lYO8
         dXTCyOZKYU8jnAduCfFUtSOEHOJMcLRh5zMvYKcbGJ11Xhmy3kER2iAsLAvYYtpyx0aF
         OB7BWrwWVlFk3gnx7PXqv+8jvkwIFVJk8HiUGuxLHYe6NHEw3UfMcL69C626OXpb1L2T
         EKRQt9lOGwAGrUfHJNPy8YfLtmiGXVO8KyQz87mbfJ7IZNWwkvIRKmGY+gFF+RBshqDy
         7xQVi8GNDLiPAAIjrPqSGu269qsE1o1yGwaw8CnFW5XUUgbR/aNOSuOpYlZL5lC6vHDj
         p/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJiQZwtrdvFqzP9AQNrrS98B8QLfVWaIK9De0rMt+NE=;
        b=GYT24kBjB+QJbZjD1YlibMWpxHK5o77VYWHpoBoKxRxq2yPbMW1L7ovDdab9mVDnX/
         MLQfOOOQIr/ISb4siSEyBeOgpSFE7XxbdC9DbAH1LdKrVtwfklFWOlWU719q/MKXqfKx
         xVcUB1njaiq7o9e5dxtOv+pH9YbgdOJqwRXHKQJkM7xfUoCnk0rYaEdpF3t+sXcwCfsr
         kMYQeNhf/eovdJpfWrnsszLWYIbJa6s9ZWho7WWmGgoTdSXDqmhZPb16+JcyjmBCbzLF
         wLGfFOOXwrOeJ3Wzmfb3fVOo+L6TyNuwbbEh6pjUbtkzL61/tB1bfUEGGXsA5R/UtjW3
         qdpg==
X-Gm-Message-State: AO0yUKUDEbHoSupzbRBAFPJLMnEDX3Yhjz1ouutGVxW4oXN312fePzOz
        YroMeD5MioLsVbVUzw/4tGIduvy67OcAQ5b/
X-Google-Smtp-Source: AK7set+x+KuGBZ1IXNDFnZScIb/BItTOtkRliMrR+Ru3OGXKFnIP9o5bSTmC1tTMMqAoOiqg+YSMoQ==
X-Received: by 2002:a05:600c:44d3:b0:3dc:4c4f:6dc5 with SMTP id f19-20020a05600c44d300b003dc4c4f6dc5mr15491671wmo.9.1676141272174;
        Sat, 11 Feb 2023 10:47:52 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b18-20020a05600c4e1200b003e00c453447sm12289096wmq.48.2023.02.11.10.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 10:47:51 -0800 (PST)
Date:   Sat, 11 Feb 2023 20:47:50 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: add QRD8550
Message-ID: <Y+fi1iJRMrjFVQze@linaro.org>
References: <20230210163844.765074-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210163844.765074-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-02-10 17:38:43, Krzysztof Kozlowski wrote:
> Add board compatible for QRD8550 - a mobile-like development board with
> SM8550.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 8b90b8d7e858..b1c6f0ad8c36 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -903,6 +903,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sm8550-mtp
> +              - qcom,sm8550-qrd
>            - const: qcom,sm8550
>  
>    # Board compatibles go above
> -- 
> 2.34.1
> 
