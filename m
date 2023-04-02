Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE0E56D36B9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Apr 2023 11:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjDBJwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Apr 2023 05:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbjDBJwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Apr 2023 05:52:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FCB2952A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Apr 2023 02:51:44 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eh3so106208450edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Apr 2023 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680429100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtpKmFwiRWVvKgjdJEqRBjQAY2R7xfBVK1CctuD/jnI=;
        b=a1OauSmnroqA92tm72U2fJaJ7jeeyA+4iIRmLXGjfKsEUjn4ixg50kd6UXIgiv4KcF
         9vpBKxSavL4zgKlZAVjwGxeoeiRBCazsL4Lw9+i8pVVWvA/EQZOzSDmpMu9wDD5PfcSX
         W3MEs6xHpIJdqV/2YSw44DQT0jaiI9RrS3FeZPHa2Xqoe2xFNMaaCqnO5PQHdfpEtVGO
         7E56lInEGU7Pz4LJwN54dF+BRs0ZYqDJWtwJdCh7bHfc0dEv/O/rT9hfAvpGm/vO6RJb
         igr0bn7Yt2VxpOVPT/lXWNklJ8IhYZLgkH/pGzRErqyEDK7dPFGS1xovr9jS89oTXUEz
         qa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtpKmFwiRWVvKgjdJEqRBjQAY2R7xfBVK1CctuD/jnI=;
        b=ttAJrC1eqnQEZJwdHqpyFGK67Nve3ujLfrIc2x/WqfqGfHzN+dFZKkJJ0V+gwJOlGh
         bmgW90uhkMbQVtW+ydf1epOrZMXvRDUKFPgOA/P4mxXXVAR5VAx1RR4cXWx3gLcneGol
         ezHfFQ0KgIuWUkY1FqmBJtHVV/cgTcM5cSOgx3fRdMuFbfKvdaKMVUm1PlSSAzi4SIv+
         pDYKd8HFh3T0U5plII6xQ9jwkbnKcbNGpsPPgplFgHHdoPprFvlmRghtKWqUZGIQSRew
         u75n8OKIAzJ8IJ+8sX6U1o+3hivcT4wDRH1AVP5qgyPHM2qCr1a4+6QqM13QbrRhGScp
         FW/g==
X-Gm-Message-State: AAQBX9fTg0MOZO/yFoqGqfh1C4HlTCNclglVXuodRlqWmGsmwytjHCOP
        zbu9qSTKvuvnuzG32kB4q03lKw==
X-Google-Smtp-Source: AKy350bUhaStaDcQ/WmJ1j53zqULVe4euLitHguszu0+zPX9A/KeQLZ+ZOUC29jeFcchmqIOUEXN4Q==
X-Received: by 2002:a17:906:a04a:b0:8b1:bab0:aa3d with SMTP id bg10-20020a170906a04a00b008b1bab0aa3dmr31676898ejb.8.1680429100553;
        Sun, 02 Apr 2023 02:51:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7f7f:6a30:7a20:94d5? ([2a02:810d:15c0:828:7f7f:6a30:7a20:94d5])
        by smtp.gmail.com with ESMTPSA id e27-20020a50d4db000000b004fadc041e13sm3085894edj.42.2023.04.02.02.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 02:51:40 -0700 (PDT)
Message-ID: <af18b9a3-2960-8fbb-0d19-ee7d3b3f89ab@linaro.org>
Date:   Sun, 2 Apr 2023 11:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 21/22] arch: arm64: dts: qcom: pm8150: support SID
 greater that 9
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org
References: <20230401220810.3563708-1-dmitry.baryshkov@linaro.org>
 <20230401220810.3563708-22-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230401220810.3563708-22-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/04/2023 00:08, Dmitry Baryshkov wrote:
> Supporting SIDs greater than 9 required additional handling in order to
> properly generatae hex values. Apply this customization to pm8150.dtsi.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi          | 16 ++++++++--------
>  arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi |  6 ++++++
>  arch/arm64/boot/dts/qcom/pmic-dyn-header.dtsi |  6 ++++++
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 

> diff --git a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> index 83a2bada48ff..f3743ef3aa13 100644
> --- a/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmic-dyn-footer.dtsi
> @@ -11,6 +11,12 @@
>  
>  #undef NODE
>  
> +#undef HEX
> +#undef _HEX
> +
> +#undef PMIC_SID_HEX
> +#undef PMIC_SID1_HEX
> +
>  #undef PMIC_SID
>  #undef PMIC_SID1
>  #undef PMIC_LABEL

Same comment as for previous patches - all undefs must be gone.

Maybe I should not have acked all these changes customized SID ("include
sid into defines") because it looks like it opened can of worms.

Best regards,
Krzysztof

