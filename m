Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2823E62F2F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 11:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241624AbiKRKqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 05:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241569AbiKRKqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 05:46:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9BD970BA
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 02:46:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j4so7643488lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 02:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeMvN6MbIutm3HuzW/RoMf+6yOP31RHrL3pEC9uw6ts=;
        b=RzzRCIZGbzerL8T5KMqjYaEOMywCYt7iANXi2sq0u5ACJAxqWp+Rh1payRLZIGVhJw
         6VXPtEsRZlWiY9sH2Ddflqyxi8kP3YHXlMgudu2MSawkij710IiAmQfzP2S66v1PE627
         ZELOZivclDiYIwyGGC3vT4Yah9roD1OQJWZDoaGV52Fshr4Z+tnAk0WxajlameBTOaIi
         vhWrC3i42Az4nPRrU23BHWV91uLr06cC4mAGT9mzON1+XWmDcDQSlMHvoEJaWT2Sdg+E
         s9+mCa77OahJrKfdv/8sB70sD+8ur8Tl1g37+x6S4P5SteYWgyae1oAYqHxZNJ1xdKmb
         D5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeMvN6MbIutm3HuzW/RoMf+6yOP31RHrL3pEC9uw6ts=;
        b=7kPYCqJgzabeXNh1i4iaCwd/JUD7EJhQkTAFZA7hzLg2TdTbbDwrS4jK3lK3viwDlj
         nWqB3j0vnZJFTj4X4QKNMmYUfuXJPghGyms5kBK+93kHzzAqVuq4OgEpAh5K0A0npbo0
         XM/FLS9pU33r6+EmYIgevwx+pvmXF1os/4Ew8xgKRLTYRO5re2YL3ZCtxrbuMp55ECdm
         +D1nXxE9N6HB+NVXRN5joOo4r4bQi5trELtCRKWR2+VwnEd2rSFhhVCUqfG7Uw5zCEvZ
         CJeqGvPbFmf48GaNeDkndnkIToqDqI2v06NRsSKPfg+QP9TDN7c7nCfvQSYrq7bvo3VW
         iTEA==
X-Gm-Message-State: ANoB5pn9QhnkiFXNnp1g95fu+v8V27giT+h/HK/ezOlUakXflzIjQAc8
        2ntAZn1WzgsM5j7ln6CTgXDmZA==
X-Google-Smtp-Source: AA0mqf49JNy4r6BC3Mg7hLhBh3xuqRsAE09Rp7Bd2/7JWubm7a159AC91boqgP78FId8oRQU2U9K0Q==
X-Received: by 2002:a19:7502:0:b0:4a2:4b90:1ea8 with SMTP id y2-20020a197502000000b004a24b901ea8mr2522439lfe.155.1668768380697;
        Fri, 18 Nov 2022 02:46:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q18-20020ac246f2000000b00497feee98basm603525lfo.274.2022.11.18.02.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 02:46:20 -0800 (PST)
Message-ID: <0e8ed125-beba-8f74-b3aa-728e9dc5a09d@linaro.org>
Date:   Fri, 18 Nov 2022 11:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: reserved-memory: document Qualcomm
 MPSS DSM memory
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-0-f7c65d6f0e55@linaro.org>
 <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-1-f7c65d6f0e55@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-1-f7c65d6f0e55@linaro.org>
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

On 18/11/2022 09:53, Neil Armstrong wrote:
> Document the Qualcomm Modem Processing SubSystem DSM shared memory.
> 
> This memory zone is shared between the APPS and the MPSS subsystem,
> and must be configured during the whole lifetime of the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../reserved-memory/qcom,mpss-dsm-mem.yaml         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml
> new file mode 100644
> index 000000000000..226d0dfc422c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,mpss-dsm-mem.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/qcom,mpss-dsm-mem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Processing SubSystem DSM Memory
> +

Discussion in v1 is still going. Memory region is not a device.

Best regards,
Krzysztof

