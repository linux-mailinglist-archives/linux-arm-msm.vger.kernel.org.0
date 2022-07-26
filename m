Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3ABA5811A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238702AbiGZLJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238632AbiGZLJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:09:22 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19D472F01E
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:09:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id p11so17294618lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Galfa6fiwztAylzaq1oA7j4HXueFEDLD87xP1hor7s0=;
        b=fmb6unt4Tc2hC2CxaNg3IwYjnpI7YNuR3yFMj3wk5ErbixuzWIhIlaQh/ckmppZ+Ev
         zkK4oLyEiRDNmKYlkKITatag3DhOz1JEbtS6r5MZ1PR4mUArAr3y8wBDiMVJNjhOvhCw
         WTta6cEm1uOD/v8idhLdBEI7eTBiSBd3HvKanyysb01GCB5JLtvMJUXywWS9dzL2BzYw
         pIW999nn9GcSkC+pF53iVxrCAblTSq3mLftF3askR73UctWmtl5JCxF9P5DszISNj7BH
         Eiqn7Nz3SH5fF4p20nmTWWiOz6PmTqKH8MuW4FgCj8peZyuYEFYSkB+9kmovXXsM8Lrq
         Bwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Galfa6fiwztAylzaq1oA7j4HXueFEDLD87xP1hor7s0=;
        b=tJZ+g7NNGdi4pvDpYcwROJEADBfbcvwX6HeyXlPU+PX0SDQrKtl+e6MLFzHkgEvsMd
         etqC8TTV4WEA0ZuCNuP2caW+KMxF1EDsVuJMVmuF8WbAaHOXqfh3TUNaCDsRrZire54p
         vFE0yydZ6Akm7f1myL/H6jMNOk9ubNTEG1Q0liBsnjeqs+QPu9VnsDnSZ6KqIO6xgEh2
         iQMAY1AL9wKRpNqj9Q2pQN3W5nHrqOJJQj0MjlEgrvo2XddaeBd15VZqbpIn64wLuwhN
         Z5xR/kFHv7lmnPPtHKtk4HmIWUIHsDhm9Dez5ifSm77BNBHUBtZxW+5WMGwAYlCUEqLg
         QCSQ==
X-Gm-Message-State: AJIora/TgSJe1ebpwk8iEWC5S4ec2cI61VbLcOmdgtV2ggOr1fn6HfoT
        GfW5SVSJDm4lWqHrP/vA/3EbbQ==
X-Google-Smtp-Source: AGRyM1t2Kw18dOAJpkOFuUZl9kWjyBzkc5AUe/i16RtsVrnotZwfBlpbjcKEFLDXO8evCbDQlf4V1Q==
X-Received: by 2002:a19:5f4d:0:b0:48a:7001:dbf8 with SMTP id a13-20020a195f4d000000b0048a7001dbf8mr5857089lfj.251.1658833759467;
        Tue, 26 Jul 2022 04:09:19 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id e16-20020a05651236d000b0048a72437127sm132635lfs.42.2022.07.26.04.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:09:19 -0700 (PDT)
Message-ID: <671045c5-1c1a-f209-440c-710c860f960b@linaro.org>
Date:   Tue, 26 Jul 2022 13:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/7] dt-bindings: arm: qcom: separate msm8996pro bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> Xiaomi Mi 5s Plus (natrium) and Xiaomi Mi Note 2 (scorpio) use
> MSM8996Pro rather than plain MSM8996. Describe this in the arm/qcom.yaml
> bindings.
> 
> Since MSM8996Pro is largely compatible with MSM8996, keep old compatible
> too rather than insiting on qcom,msm8996pro only. This allows the code
> that doesn't yet know about msm8996pro to continue supporting these
> devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
