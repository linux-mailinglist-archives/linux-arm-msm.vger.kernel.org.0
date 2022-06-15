Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6DC54D4A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 00:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350128AbiFOWgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 18:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349509AbiFOWgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 18:36:24 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA45A562C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 15:36:22 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id i15so11612940plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 15:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mV7iuGUs7Sd/EB7Y6IVDAes2u13Cf7xlNc9ZNwwInH8=;
        b=l1vqRhqJpsnPX9adoCyvZMhxiUUjd7Ueb+/3PJLRf7TL5d79Yyh3174drC0uOTCmY8
         +H60mhgJ9Nui98dSrZtr3UT0xELEzJJp7i5px5nR62LbqJ54x3vKGHRtxCMC0toddiUK
         NB4gyX+qNJsr5b9A1vEFnvtqliTMnmX1oZLl8inbURAi1fht92bxIE7PfrFp8oEK7VY1
         FLtZX0ElS69VxnZnJ68z+0106vRZ7jAenVO5MiZ1cwRwi0kGGgk1I5/cG6A/W2GfXGGW
         iFt7vqRDVLY2y3JCxEMrDIJV/Q+Wnstsl2HdNx6CpIUJTzWiWe2xI33cV47MOu9cwRGA
         aySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mV7iuGUs7Sd/EB7Y6IVDAes2u13Cf7xlNc9ZNwwInH8=;
        b=Vk9Lv4o9BcHjROJjW8UxrVtM344FP/PbH0tOkHwJKRPBfTmOXxZX9RzpAYrt+TVqBs
         N1LIf+NBmtGsuFXInDlmuRA8j5HeOCfbZWLsQpytyfFXaswfdswByRoPA3qI/EkVZpRV
         mRkR7cdfbhQeQ6g67EroS/jF6Dx9mzc+3XuMOc64gqu9pKowFPjctrNDjR10CsEL+NUh
         I4DBNmmH8+lE9JCHUb6+KHEUPzfyA+SuzW9PXwU07VmxqsMdGovBCXiZxtXpp6oX+RwQ
         +38RHJWD0yO1XWNEK9pbmCX+0FGHlPUBybDjk+Q0uBZGPV0SgsdYG0lS1hHRqVOk5C9T
         8Myw==
X-Gm-Message-State: AJIora8Q5BRlC0Mi2CboTZJWT2PEjC6Yk/JwJjt9OhM6oaJl+nak/W+9
        lrxrC4BiD4zi4ZEU32lXewjLGw==
X-Google-Smtp-Source: AGRyM1twssaYQfVWyMrshZxeSWZ9mwJyA7gkNlEydiGHiNrG9KJ0HMdkIjzpZ/ZbD9PxDuj+ED5jWA==
X-Received: by 2002:a17:903:2341:b0:167:4b11:a8e with SMTP id c1-20020a170903234100b001674b110a8emr1943077plh.10.1655332582397;
        Wed, 15 Jun 2022 15:36:22 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id w9-20020a17090a780900b001ead46e77e2sm107763pjk.13.2022.06.15.15.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:36:21 -0700 (PDT)
Date:   Wed, 15 Jun 2022 23:36:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,tcsr: Convert to dtschema
Message-ID: <Yqpe5EkBHCT6e12v@google.com>
References: <20220607133443.182468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220607133443.182468-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 07 Jun 2022, Krzysztof Kozlowski wrote:

> Convert the Qualcomm Top Control and Status Register to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mfd/qcom,tcsr.txt     | 24 ---------
>  .../devicetree/bindings/mfd/qcom,tcsr.yaml    | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
