Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B04DA56A3C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 15:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235704AbiGGNe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 09:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235519AbiGGNe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 09:34:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9825C2BB37
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 06:34:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f39so31163364lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 06:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=voTpSZAXwWS8odcK2HkFOPNwTAarw+MRkXZUy15BjQQ=;
        b=s4W5VELoJo+1tawR1mDEEFeoZbx0tVeCLTDy9tAkyxEnXCi6mvDPF9o9jCpqEejKs5
         KQzI2htz78DE+bBBZ1R20kYDv9ClwnwmkLTKYIurC8t89L52jPGPZC+rG83sGLtuu3L6
         28O8j9b8MEKXoHRDcbgsAXji5Gh+hsfotx92SoAOBxPv7GZc60neO//0baUS7OoWJNHG
         g8KqWXfV9gZqnXebCesVK+i6EaILObEBinmy8q4W094TnSukMJNiEEWEfYTnbOJAvcvF
         UisCLla1vNNHVz+8FR+fh2xdEGnLk2s50GrPtaBZt9vdrxaYhgIoOxLK+x/10wMkjn/W
         cPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=voTpSZAXwWS8odcK2HkFOPNwTAarw+MRkXZUy15BjQQ=;
        b=OyJLDxxY7f7LspuModBc2T0Ezqw4h+Qk0vXkh9YH0tu8+hVpNj8yqg7QrP3Rabf3W2
         HxI1S9KT7GFKY50rz0iocmjDOzGlM2fLVNGesdZ0chrk+HANuEcwjJhnHU4jhqF9D9YI
         S9uG1s0oHxCdLzHWuybesxeIaKZJqeLy6XqJpSppCJgJc5mvvhpECdJBCoQtLpgEfV3o
         XLMruvTdD1qZ9ByDlAnFL/5CoICwpuReljnEyhjPqiRw9LZebzZ+AFEXpbu0tpjLjmzz
         oRGHWGEfP0wWA8naTjfM/rmCvopSlhU8ceaGVcnuqH5u6noPDJEbzYpPB7hSovRTPDJe
         6X0g==
X-Gm-Message-State: AJIora9I7FO/GK++jN/ZUS8EGOIdZ5jnXxQ4IsfKmvRKp+mhTRKNAFTO
        xKNzORAS2DycCvL5+ykTc32BrQ==
X-Google-Smtp-Source: AGRyM1vRcFCaiMIiX5IoI+FclOGigIEzTMDrnYhUmigt1L5drBH+zSyZplQxOyEfLZCbKuJ17XIngQ==
X-Received: by 2002:a05:6512:102a:b0:47f:a442:7178 with SMTP id r10-20020a056512102a00b0047fa4427178mr31562321lfr.30.1657200894881;
        Thu, 07 Jul 2022 06:34:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b0047255d21179sm6844146lfv.168.2022.07.07.06.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 06:34:54 -0700 (PDT)
Message-ID: <cab173ce-9c7c-9985-277c-3498d82b8400@linaro.org>
Date:   Thu, 7 Jul 2022 16:34:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/10] dt-bindings: PCI: qcom: Fix msi-interrupt
 conditional
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220629141000.18111-1-johan+linaro@kernel.org>
 <20220629141000.18111-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220629141000.18111-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/06/2022 17:09, Johan Hovold wrote:
> Fix the msi-interrupt conditional which always evaluated to false due to
> a misspelled property name ("compatibles" in plural).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Fixes: 6700a9b00f0a ("dt-bindings: PCI: qcom: Do not require resets on 
msm8996 platforms")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index ed9f9462a758..a1b4fc70e162 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -628,7 +628,7 @@ allOf:
>       # On older chipsets it's always 1 msi interrupt
>     - if:
>         properties:
> -        compatibles:
> +        compatible:
>             contains:
>               enum:
>                 - qcom,pcie-msm8996


-- 
With best wishes
Dmitry
