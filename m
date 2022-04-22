Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99FA750B843
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 15:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447904AbiDVNXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 09:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447901AbiDVNWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 09:22:36 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC97A57171
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:19:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g20so10417865edw.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=c3TGvFLocCbTP8mYoGBFXEHaj/S5vPP9Sy4GCgbSxyk=;
        b=W7oUlPVEc9ewUZReoPY+V6JvX/xyJKO/FGiU3Q93ZRkdJjGax9Y7cpLSeRZtPv9Txe
         pYtGF4OKyJ4qQx0jge8knbKYkrguChO+Xt3ThM4OnSjdPTZHOrhqqnnLV/eUfbgxiRQK
         Its/nPRYUNv4mEr1DafR/CbCTZrTvXAM3MoSLHNcuoQP4ac9EgAdeSUnSWiXWGX81Oov
         7r3jANuaCnj0M9iHhPMruKhKAlkGE3WiYLvSh0osiwBXnlRkICG+ayYgtt0eyoAShCvZ
         7GB9G70GlutWkONrgT9NGX+BQiIvUq64z4H26tzJvlbRaU0jGRoEhBfLAcnThlzsvEGB
         uCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c3TGvFLocCbTP8mYoGBFXEHaj/S5vPP9Sy4GCgbSxyk=;
        b=3cOQwDiJj4ESEfp+nkQPIGzDt6fsdKHmS7LBg3ZWP+GYstU9fSydr46E7ytwix1cr+
         Z2uzNhAtv04WnGs5dW+U6zfk7LqfsX84ImlvRRiwqro4fZ6hJICiZ5qbNUW2Jl/Z1E1z
         Jr15ecObEWKkt++C/UBFxIdXanAd6ZRyI/LYNl4PhG2alJVTwWK83lCNtI3cKKVVwFC5
         v9mnadYUWsuEVJdt8BR5sFwLT/KYFZ31nrj4KQpLzqhFVMZDYbdnql1imtkhNWkQUiJq
         FDWkHjTYh8HmepghnDM1q4N61JSxZlEZK+bmLBD8lBIpUwVyG1UVMlFXEl7rLky71q5E
         W4hQ==
X-Gm-Message-State: AOAM530tplrbQdvPMwl/fOLU/65ayVfMxFgquuTVQZORp0UU3C6bSmer
        IJwC38d1nhuPPkRCmtd6DEuXSg==
X-Google-Smtp-Source: ABdhPJwp960tnHTvUocKrH2blVQKCAnzbBw1ej33zJ7Kzg4j3mrsm3dcwTS6Da3bnMzwzg9x5fclMg==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id dz17-20020a0564021d5100b0041fcf6c35a5mr4851088edb.25.1650633581311;
        Fri, 22 Apr 2022 06:19:41 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b8-20020a056402084800b004207931a9cbsm963105edz.36.2022.04.22.06.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 06:19:40 -0700 (PDT)
Message-ID: <80aff4b0-1649-26e8-78e5-6d438a987178@linaro.org>
Date:   Fri, 22 Apr 2022 15:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/6] dt-bindings: YAMLify pci/qcom,pcie schema
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2022 13:48, Dmitry Baryshkov wrote:
> Convert pci/qcom,pcie schema to YAML description. The first patch
> introduces several warnings which are fixed by the other patches in the
> series.
> 
> Note regarding the snps,dw-pcie compatibility. The Qualcomm PCIe
> controller uses Synopsys PCIe IP core. However it is not just fused to
> the address space. Accessing PCIe registers requires several clocks and
> regulators to be powered up. Thus it can be assumed that the qcom,pcie
> bindings are not fully compatible with the snps,dw-pcie schema.

You can still reference snps schema, if there are no real
imcompatibilities. Few other bindings do like this.

One thing is not being actually compatible with snps but second is being
not compatible with the schema itself, so not being able to re-use
common parts. I think only the first part is true in this case.

Best regards,
Krzysztof
