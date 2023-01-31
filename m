Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10790683698
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 20:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbjAaTbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 14:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjAaTbm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 14:31:42 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A8F5246
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:31:41 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg26so5295619wmb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 11:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8jbLQVc6c4NcLPpk4YcrEqS6jnb0zXu0aRxcozDrrDw=;
        b=ObyGEWDLK93TYPF0rI0cs3Ra6+/KcHG+nugypmJtapYohin0cVPYmSKl927VH5BZ6f
         tTbG7iU0vS8UGGKFVv/FMuS1X02C6tFQ8Kor8WycYtV9zkKeP+tf8xNYorbuSzEyMnjq
         Hs2ZEAYId9c1NvUxK/D4qbR8dNv7uJ06NiTRo2/3j8HVVqtgL/bfZLAqb/YBQ9HebI9i
         /e6l2+O80ehfwjOuKQoluOfPWA/X1iv1hTcXrkAD0GFKKyoBF0taQVxuYymXkMa8y7JB
         Alx4e9xAm1gv3SMAz+5IyYrnPaeCLborGilT21rLf9TlzeYTK2QnKkb3oamw/HLcpxOF
         BfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jbLQVc6c4NcLPpk4YcrEqS6jnb0zXu0aRxcozDrrDw=;
        b=ycYOWe2JEQu9E4U5TvnGTkAvUpVMloTNfn7Cjte8yNjRUzEZJMulzdfftI5VjJ+vpI
         Pmc9UPXHBfiJSqWm9lsB+jJe8EzY7iWvD7Z6hGEcpXrXpbaum3RuShQncbw5LLMPkYCQ
         a9W3LwdXmKO0tqIZHvCE1pY9OZuojZl/twxtjTDATwjgHyeReDOS3siZEcisHs3ZIcWH
         jGnjitGL5uzl3hatUf5dUYJm870uvoBC+OPZ1k1Cn9M6oTJxg/EsP1oZWQf0UfxjjY+B
         mN0MwMte20HefbeDlhC4x2mmQ0/lJLMJGOkyHNrbYuYonQ9XEukvgsBBQXMKL8MtQrdL
         bb2Q==
X-Gm-Message-State: AO0yUKVtcSaEyRqPXw5rR7Bx7HLVwC+Uix9XMlj/HZIcHRxiNGiFSjRD
        y0Ze+ABRTLFCnOPHphIgY67Zsw==
X-Google-Smtp-Source: AK7set9vJ0aBsq1GVkQMrZJF464MEAl8JPMUuQEAOZYkmfSVWb2hMh+knkqFl4MERo+XBGRi/BRtkQ==
X-Received: by 2002:a05:600c:3d95:b0:3dc:4636:7426 with SMTP id bi21-20020a05600c3d9500b003dc46367426mr14611454wmb.13.1675193499383;
        Tue, 31 Jan 2023 11:31:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003dc4050c97bsm189428wmo.3.2023.01.31.11.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:31:38 -0800 (PST)
Message-ID: <f87d1721-c6d6-fc7d-bcdf-f66755b89966@linaro.org>
Date:   Tue, 31 Jan 2023 20:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 1/9] dt-bindings: pinctrl: qcom: add IPQ5332 pinctrl
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130114702.20606-1-quic_kathirav@quicinc.com>
 <20230130114702.20606-2-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130114702.20606-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/01/2023 12:46, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Add device tree bindings for IPQ5332 TLMM block.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

