Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8801E7B34A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 16:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbjI2OQH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 10:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbjI2OQE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 10:16:04 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3261B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 07:16:03 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-405524e6769so4714115e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1695996961; x=1696601761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=ii2XP09kdIAgGjv8/mEcrLElJXeEzsrBBF+GqqhRu1dhciMnJOgNzsWOEcIeargaxR
         NZiBx9aZ2GfaEghBrlmtG+zoVoW045c1zaXuu6KQE8Nz2OylJv6Yg/mSDWrrabGX1wst
         gGgSqTSk8Dtl0nQ0mt8sNonpP9C/QMXj9lr7O8WuINhqIrebMVZh0P3oWqiDOI4x1KUH
         1Xdef+0vLpCFdvGPLGv11GVIV43uBa5/BOWWqVs3Yd61QzZ6Lx0qkWufurWNAPxVlw3M
         OMcn1Lyyy7aEsdV8i2YlFLAayIAaE+BZskfRJZ0OgGpOF4UYE6f4A8vbKAErdVpabZGI
         mZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996961; x=1696601761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=fDJ+MmDAlvvey7fLV+9Hljn/W2IAaRaDJiMndv2L9Qw2IrSLgvWIfN10t3/Lrz5mzI
         ZW0X5ZQ8CZBDqplt8xyblVfVJ+tss9t721CpHj5WKRW+6LRZZoSI0cEXUWjdv2qCgH9S
         bQee1Rw3tLpLUlBcpS5HI1+Q8w1crvoGSBNd/CWG2fzk1SeGvpnicLPDhEFBssuha2xJ
         FImkeNt7Rr9pgehXYgBmYAGSkwfFQ4zod/80b6eMh2647QZYk4YhnrPnJa+PCXFkbOUV
         FJ++uIHc6eSVR26oDkyeKeqaer6o2i9KjI07sFcfEP3ov0otNaMrmq2zAH5llkWCHQEL
         3sVQ==
X-Gm-Message-State: AOJu0Yxu3FkMT/d0V1bDfwr5nUcafbpY1ehqs4ZM3dpu8lpdS4mX2vZa
        BxskFF692LYGq98z1XeOyystiQ==
X-Google-Smtp-Source: AGHT+IGupaz5r81Ti0rvQWeOc0Lhh8lSxqvscVDL1xvsH8kzwpVqJL8vHtFolRSxf76MRDlECmyZxw==
X-Received: by 2002:a7b:cc95:0:b0:406:51a0:17ea with SMTP id p21-20020a7bcc95000000b0040651a017eamr3957651wma.10.1695996960715;
        Fri, 29 Sep 2023 07:16:00 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d698c000000b0031c8a43712asm21607937wru.69.2023.09.29.07.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:16:00 -0700 (PDT)
Message-ID: <27778ef0-53db-453a-acde-ad81154c8dd0@nexus-software.ie>
Date:   Fri, 29 Sep 2023 15:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SC7280
 compatible
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-1-16c7d386f062@fairphone.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20230929-sc7280-cci-v1-1-16c7d386f062@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2023 09:01, Luca Weiss wrote:
> Document the compatible for the CCI block found on SC7280 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 042d4dc636ee..158588236749 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sc7280-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
