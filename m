Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0424A700D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 18:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237516AbjELQwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 12:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbjELQwm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 12:52:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405D91736
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:52:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-965a68abfd4so1928928366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683910359; x=1686502359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=taY6vqOnlwfgSEUKM+GvHWsmve6rMezjk03XxW2GBtM=;
        b=YB7mprcJ1M7cWZosUXrcU9KX6AhR1MPra/gLlGmxOPlwn3zgfK5TSnI41JqGAf66p3
         sthhLP/TYi6Q5EHDYoU0U8tbi0Y0qwrljREJAl0PCaZ8948HKD8WcBe6VUFJA1/LcQQy
         VU5qmAXELTaZX2VqCkK7ZUBM/hW3JCzs+16ilzayFqwgTPBg5d++VKyinAwkiWMoTeOD
         v7BAEHU+R4HPKVzfeDWTCy9JWjr/NUTAqSh8UpbRSpgK7bY0A6Et8xcbuCnfjJufh0NN
         XVjnnjPrWiMlILwDzxOaBk38HCut10BeQFCgvr9+5qdtZx4p5e0bmP3Dh5rPFrI8SDew
         JbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683910359; x=1686502359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taY6vqOnlwfgSEUKM+GvHWsmve6rMezjk03XxW2GBtM=;
        b=jU5k9zfgeQkV37S6bmVTprn/aZkQP4eWnt8nreEKmfWWJZfOsI5VtUEifsP90Ezu5k
         FSdJnWw7S041KbzbNuLM9y1l2Gyy6pZVm5NhL8Y8qqXXCzR9vo4bxLRLAl1qsRjYnZwe
         UkMAxPMUpZniHerQdnhjTqfDgjzlAQhS0m3BA7FtIki3wq5sU+EvD2TpwSNnuiZAaUij
         dSzrsTtJ1VBxZiJ01Tr9S+JHlFaE4+tgOdM3dC30u3sxTrV5myuunv8u3srLLKTdqlQF
         LhUU3732P5DAX2e7551zj9R8Jm87/I8Rey1JRrgTZVrP5yFMrRZQgClS6LiaXAuWVIi0
         KtxQ==
X-Gm-Message-State: AC+VfDxjYqp79yUwCGt2JHZY+56MCBrpvl8FoI9AmptNSbIN7pFmRNL7
        hzSPlTK08e8VybV7aavvu0iHZg==
X-Google-Smtp-Source: ACHHUZ59eFhWe1aXjkUV2GDKtKNfDQ9z13JZWV+UAdinGaGhOsxQrTLgqX2nVUOz8lj6XNB/0/btDw==
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id gs12-20020a1709072d0c00b009665c042c5amr18475819ejc.69.1683910358651;
        Fri, 12 May 2023 09:52:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id y18-20020a170906525200b0094f7acbafe0sm5694243ejm.177.2023.05.12.09.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 09:52:38 -0700 (PDT)
Message-ID: <e3c36382-f768-bb4d-4a32-dfac079cfd3e@linaro.org>
Date:   Fri, 12 May 2023 18:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 2/5] dt-bindings: clock: qcom: Add GCC clocks for SDX75
Content-Language: en-US
To:     Taniya Das <quic_tdas@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, jkona@quicinc.com,
        quic_rohiagar@quicinc.com
References: <20230512122347.1219-1-quic_tdas@quicinc.com>
 <20230512122347.1219-3-quic_tdas@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122347.1219-3-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 14:23, Taniya Das wrote:
> From: Imran Shaik <quic_imrashai@quicinc.com>
> 
> Add support for qcom global clock controller bindings for SDX75 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

