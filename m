Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF350CCA1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 19:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236630AbiDWRkD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 13:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbiDWRkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 13:40:02 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541871C3796
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:37:04 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id ks6so22082174ejb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tZbINIXlUl/40TFimt3iSlztPAx1Ens2saKIOxMhKsg=;
        b=x1Ks/vtbcthMBQ/q2IS9ZNaJv4J6T+AjjoE8A++C791k2EtR6zNxfBjgkDzQdIvgqV
         +bPBI2QWkWKkwCGkFtZc/WKqcdZ/oEm/QNfhV3NPYh7KFkwrp/0NdpiVwxICbBR/NwV5
         5rUpmptTDFxgat6XZg2jMxCWHmn0DRn39BUG8ey/JAysJ1Gtualkk8d/E9LS84W1bWvl
         VYhvoUac+YpE8PDtjEnFRU5XDns+lWpWIgT1rfsRkphuPtrxGORG1Q1RAPn2qdUQR6ei
         LXaBCLoILIdXEneZ1vqsK24h25uFaQPBypc1u4dU8ISjCQMmO5+PrhbUSHEiOe1+KFaq
         NVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tZbINIXlUl/40TFimt3iSlztPAx1Ens2saKIOxMhKsg=;
        b=HYHegi1xh2gbBLVdn8gRW7VJDODMqL1wBdbgx2zU6aSZxMMfgzcZhMKBYZqWmrrn2Y
         Kn0ju9RTs/lADCSWiec7qsjqHQQexxjLDOWzfK/SJSr5brZABry4waPyrn18AIxtYj/T
         76NttE1msclTYhLnBYaz9lyS776zGFg0QUIppIDm4iTHff4j7Wm8ydazNoNwC3Dd7z+L
         jDhL/ZUX+ZoaLr1b/MSR3l5LqLfho83cL4iSmtD10EO4Ci0+m8S3kg2Df7gVNUC45WDI
         ZAnjq1n9KhoY3Y5WcDXl0ZvnOwJZUzbyGLX82+RM/3dDv4DloT291ilfcYaMhN1R1IG4
         zSQw==
X-Gm-Message-State: AOAM530gX5WB92fdhku4rB351NDZQgpOToolv0BUR6VCet7Ou8ZpgOzz
        xg2CxUENZLQMbUjhShnJIxKa/g==
X-Google-Smtp-Source: ABdhPJy9BYi9YuQCm1Bju52aXZfhNjJJ0vnhGT9HSi0yGDQ6V2EY9wiQrkZLochW4NLSt6a79iAA5A==
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id c18-20020a17090618b200b006d0ee541addmr9097509ejf.499.1650735422931;
        Sat, 23 Apr 2022 10:37:02 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b25-20020a056402139900b0041904036ab1sm2447772edv.5.2022.04.23.10.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 10:37:02 -0700 (PDT)
Message-ID: <b1b0a459-5970-7a14-eb51-6a464fe83753@linaro.org>
Date:   Sat, 23 Apr 2022 19:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] dt-bindings: pci/qcom,pcie: support additional MSI
 interrupts
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220423133939.2123449-1-dmitry.baryshkov@linaro.org>
 <20220423133939.2123449-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220423133939.2123449-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/04/2022 15:39, Dmitry Baryshkov wrote:
> On Qualcomm platforms each group of 32 MSI vectors is routed to the
> separate GIC interrupt. Document mapping of additional interrupts.

Is it on every Qualcomm platform? How many per each variant? IOW, this
should have a per-compatible constraints, if possible.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml         | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index 04fda2a4bb60..71b3be5570dd 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -49,11 +49,21 @@ properties:
>          - atu # ATU address space (optional)


Best regards,
Krzysztof
