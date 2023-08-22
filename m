Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022577839F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 08:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbjHVGa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 02:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbjHVGa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 02:30:57 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261431A4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:30:47 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c1d03e124so514023666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685845; x=1693290645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VHk+06zi6qSfSbxVeYt1+fxZedarjijNYMaQFKrSq4=;
        b=Ru3E9ONucyWJmgq96yGSHyzBuRemc9gGU3F/xKoJEJAeFQRmro3vvIfIabjysDS8Rv
         DWx4BbQKYHHuUDKTgcb7RLQXppym7nipLZ04StYmpIUMt/jDqktMIKA8cIJ+os1cGQ3w
         HP6O5n4M1BqnPTicIRAYz5FyuzE2PCleiYnqCDErZ76gNLJr2Mupx5tg4bXeZspCqPph
         dJvIl9YIrOXtu4x2fHOwVwnziPmiiYysJTc8l/Gn9m5vtIdN0R/L9S5N2ne5ofOlAd7/
         +6HHDVwLk3TZyJEi1jvmNVJ/Shsd+6+XvxF1++joPyx8ZCREahWrlAF+QZHh5sT2CMDp
         dFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685845; x=1693290645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VHk+06zi6qSfSbxVeYt1+fxZedarjijNYMaQFKrSq4=;
        b=SXM/ybSp/f/JqL2VOjDjeCV4kVhF1bHHNEzp4IYQo6NXQy8fgVTxTbhk5NMNZ0MgBR
         K/E4Q5RkNm2f8XYD/HtnNq2hgBPm8RyD17DbANQzv3wocR6Ynj51t5QaQJLYpRw7hExh
         lKqUhgbC7KkjIXre3QuoOQ2JOaWj/z7eCdX3EmvTFgFZlhFH0TncKx9cfErmPggEEepZ
         W8l2KiSrSQakzmERbWz5PA+hPUvCwLHgENPMjWCT42VRiNmgzJEjqExx8bBwvVxoiMvq
         FEsiXKe02e61BeZ6PQJXlXzitupV6h2TU/uZjWuT4S8SVJ3a/aPCuiC1TnwCe4X5YkKO
         61bA==
X-Gm-Message-State: AOJu0Yya6YMn674XYmFdjPeMLs/J+DDgV2ebUaHoK+Pd1Re2lqomroJB
        jN1EkXdWKpVls76qVPi4lByCEhzJ5UCMyAikdhI=
X-Google-Smtp-Source: AGHT+IHIgYMKa283zryEdoTkbwauR/9bTyt3psWUAdiJa8GmXwLLHkWB2Xr/4z9xTMeWN/zayaTw6w==
X-Received: by 2002:a17:907:75cf:b0:9a1:6fcf:fcf9 with SMTP id jl15-20020a17090775cf00b009a16fcffcf9mr5810636ejc.62.1692685845534;
        Mon, 21 Aug 2023 23:30:45 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id v8-20020a1709060b4800b0099bc8db97bcsm7633180ejg.131.2023.08.21.23.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:30:45 -0700 (PDT)
Message-ID: <87733e12-e25f-865c-3837-6b4e0450cefa@linaro.org>
Date:   Tue, 22 Aug 2023 08:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 03/32] dt-bindings: bus: convert qcom,ssbi schema to
 YAML format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 02:13, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with bus
> bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

