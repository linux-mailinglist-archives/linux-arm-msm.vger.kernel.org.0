Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5895F616E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 09:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiJFHMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 03:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJFHMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 03:12:31 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD8E50527
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 00:12:29 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id by36so1191480ljb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RRQC6Wj4SRQwXMivBVk6nrMKjf+fL4ckDTulVeUseAI=;
        b=ibvOgFJ4E3EzifdMOmymD5VZmflpKgcJUadj7VxP3zl3bCGIu1f/3tcH7ctf6QdgJm
         m5dJTiX5Yi922iCO/gLeWufufmDcp5l3lHQnu4e9HgCv6Xsai5KZ14RXgK5GOiWcWUb+
         i10FUcoqUPqPGxwZM9At5J/tF0i/pZtqrpARkkORISKHqE7RgGeVIJ5KzKF8XRtP7arh
         3tRjnBxVI/IWK+omgtSnA5h6m1ymzwSF/95YT4SluUN448iOWGmSSQQUx2LrAbqEAUf5
         KAkSxcl9xeNpZPTe2MHulYbRETwHkpOl0U2BR2nGSS1qGWaIsIu1Yh4Yhu7Fbx7LjKMU
         lCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RRQC6Wj4SRQwXMivBVk6nrMKjf+fL4ckDTulVeUseAI=;
        b=DQKzotkOERk5eIvkQL5eEQDa1X5yk0x9CTmwfOxWymeAw7xG/FX15+4pkoSqkhyPgx
         MGCPvlJupoKFj33xa15c3gvcec+O/w525uRMB2YCkyaxu3zdbRxVeyD9bR+G5uWxasRb
         /Cpra3cRl74Qd/C/m9vcEHa3PK9Z5ntroyqgF8sgR/n2rM0tQpCLaCYKZjODbkBsO3+w
         rZsnAQI+BuEhNR/x6JjEm72zbsKORYjhNv6TRbTWdH5HhGDLk10vTRrpNGiSA1z5IFbj
         apYG985j3X31OYuxJnCaiIF8yjiVvUXzLQGITQPqqSTKGeA4xrcH445gXiCEP9xI3icb
         Lwlg==
X-Gm-Message-State: ACrzQf0DWUUJRF67t+jvDUTozdvtUYHMtDHQBa2mVXLeQOJ0kF5MB2Al
        Q2jyIdgprMsXvWxZe52E8alznw==
X-Google-Smtp-Source: AMsMyM7it0Q+ACFG66IGbbQ/sIH0rHZdAo1arHDout6kheiT690vrJfKBG29TFot4GqwLVwkLj0j2g==
X-Received: by 2002:a2e:8e77:0:b0:26d:ffc3:6237 with SMTP id t23-20020a2e8e77000000b0026dffc36237mr1212007ljk.32.1665040348302;
        Thu, 06 Oct 2022 00:12:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p4-20020a05651212c400b00497ac6b2b15sm2596916lfg.157.2022.10.06.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:12:27 -0700 (PDT)
Message-ID: <14aca742-4a27-c1d9-3015-eade31a4a3ca@linaro.org>
Date:   Thu, 6 Oct 2022 09:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] dt-bindings: remoteproc: qcom: adsp: Add ADSP on
 MSM8953
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20221006044745.286264-1-sireeshkodali1@gmail.com>
 <20221006044745.286264-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006044745.286264-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/10/2022 06:47, Sireesh Kodali wrote:
> Add support for booting the Audio DSP on the MSM8953 platform. This is
> used by SoCs like SDM450, SDM625, SDM626, APQ8053, etc. Since the
> configuration is the same on all SoCs, a single compatible string is
> used.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 3072af5f9d79..c9d69f6160a1 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,msm8226-adsp-pil
>        - qcom,msm8974-adsp-pil
> +      - qcom,msm8953-adsp-pil

Alphanumeric order.

Same in other places.

Best regards,
Krzysztof

