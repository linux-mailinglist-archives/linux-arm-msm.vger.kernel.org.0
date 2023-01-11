Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FAC665E48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 15:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbjAKOsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 09:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjAKOsW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 09:48:22 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E774EEE18
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 06:48:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso14518379wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 06:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+nGZwBomQ0rgKcoolLhiqCzaPxS+W8MlYERKRLh8fQ=;
        b=Bn+OPgcpB2U665mWeTgjVovI39deyP4tlCFeCdsmfdrOYgr1MH+uBCIrw+vvq/wbwJ
         D1nSEZoeScQ4eTNUgRs0h6zSTAv1UEHQ2vwHxRALbVP/aoYBdOsYApi8a3B5M6hpeiym
         p45lJV2udTsiQXVtrx18GzJebJc/zZDK0iaHemkGlIyTykcF4dCttyV2TvAO4k5/z09+
         dUpS9P1OHphhd687x6zArueFQgiaRY3A6YMq9p7F7sT5tJp2A1D3JF4ev3KqVLZ9B+NU
         YT6cipnF5iSSYs2cig3c1+YgDXD2FXw8yOir42GsIVCfN2UzkrtK+jrGt3iO+IMqb/li
         cJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+nGZwBomQ0rgKcoolLhiqCzaPxS+W8MlYERKRLh8fQ=;
        b=5J7j62I3OT8y5+EEaezzLtySmhpLT6iDz1xxkBd5WdIXunFHqtkd0+J6aeu+fDw+S6
         wWHnS0TNt+1Dfnq5s9p4ejcXeT3XWT7a+Gf7EoJAroneSNRLwoaeFa8QTq1irOoDkLVU
         ZlDrmarlV+WtVYRe1GOfQaxsqRX3vmbHfgSdRR59t/et6KYMN/fHvsa3Epfnaq8C4n49
         +gQmZ8li/wF6IWcUF1dtBllRsC7QmP2WGiY/zx1lfrQNKQVuFYfpNx+YGlFMVx3WDKBr
         lp2z+fJbTEUm19EYpcycMNKjXhZL+uGPJn2MI75tZNTWru4lWg9ss1CiDSGN7iAfW6R3
         yhkQ==
X-Gm-Message-State: AFqh2ko6dOqxyOkvzzVkDv0ZFjZlX31sMhrXZeHDcC9fOo2jDRUrwYh8
        KdxDSIpAOMiCVCFhS8ZDT9sRmLjBEjAZk0fW
X-Google-Smtp-Source: AMrXdXslNJ7yVj0lRuNSNs2ubbMmzgioKnG+548Pg5KlaJLSRNDjavuSrZS/Qb4sVjJ/8Jf3R1obgw==
X-Received: by 2002:a05:600c:1f0a:b0:3d9:ed39:8998 with SMTP id bd10-20020a05600c1f0a00b003d9ed398998mr9849602wmb.32.1673448498432;
        Wed, 11 Jan 2023 06:48:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm25633961wmq.35.2023.01.11.06.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 06:48:17 -0800 (PST)
Message-ID: <b4ad9dba-f9bd-f115-a613-4e784d703a44@linaro.org>
Date:   Wed, 11 Jan 2023 15:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add thwc
Content-Language: en-US
To:     Yang Xiwen <forbidden405@foxmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jaime Breva <jbreva@nayarsystems.com>,
        Nikita Travkin <nikita@trvn.ru>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230111141311.14682-1-forbidden405@foxmail.com>
 <tencent_3880CBDD2FF871E636A391C2596AE7D11509@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_3880CBDD2FF871E636A391C2596AE7D11509@qq.com>
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

On 11/01/2023 15:13, Yang Xiwen wrote:
> Shenzhen Tong Heng Wei Chuang Technology Co., Ltd. (hereinafter referred
> to as "Tong Heng Wei Chuang") is a focus on wireless communications
> equipment brand manufacturers.
> 
> Link: http://www.szthwc.com/en/about.html
> Signed-off-by: Yang Xiwen <forbidden405@foxmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 3893c45963a26..8d4c1e5c0d21a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1335,6 +1335,8 @@ patternProperties:
>      description: Tecon Microprocessor Technologies, LLC.
>    "^topeet,.*":
>      description: Topeet
> +  "^thwc,.*":
> +    description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.

These are ordered by prefix, so you need to move it up.

Best regards,
Krzysztof

