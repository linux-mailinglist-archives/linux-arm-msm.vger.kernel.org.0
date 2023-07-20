Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176AF75AA8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 11:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjGTJYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 05:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjGTJXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 05:23:52 -0400
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6E7246DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 02:05:40 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99454855de1so88299266b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 02:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689843543; x=1692435543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkBLu4uYyOp3xFHSazf7i6rV8q2qtotWvlHN+JmTkl0=;
        b=sieHRJy6ip42dD1ij3AxzF7LqvUNV9Xd624X0gRL+hxvgEIMzGZVoTTsQUDptS/8Vq
         eR+iHRn59V6nZUuD6oemqTeTCOZoGnd/Gi6h0DXTN3zkTSL/MFxPcpM8kEY4dMcKUUkj
         /OPOdnYGm+yMxkfuvORQT1Ra7Oflhi68tq5wzXMW+63M+bbAHrtjJw2gIPcU5OIZZ4uU
         cJMLmVKECkJ/K6eU7hVqIcGxGFPPe3dogeDSBvia/VSPdrzvBOwfg0zwPgKWWXV/b1mb
         4V+5IWrEg8MH6uKaQCtXCE5g/ZPiigfITnwwiMHftlI1Pys/K54lf9T0gKmdSi3JrBkZ
         U3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843543; x=1692435543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkBLu4uYyOp3xFHSazf7i6rV8q2qtotWvlHN+JmTkl0=;
        b=IvoL/hNrDQNQCVHaedPD/9uad7CKHJj2Cea5HNAS2i6zylFvReXFAjwj160pjeBS3U
         /62EADyQNR7RlmWdRMQSsVhiQuy2FqCR7i6w5JZODGUVuLR3w0//GJtTxwa5aQ+YeYVz
         CTt98t+LffLbLjQWcwuLt+wFjia3mJm4IZ2kpJQxgZTazTrUiW5airaYi8iFIWBk8HQa
         hTYX+NdAwrY865fDQvr3T98Tb2HggwrpfgK0ygni1TadVP5UXo+XKdCTCQ3ev4onRWrG
         O5UXUaSwskb+79K4q6XCmAh5WCaptSVt3+jPFHTMQmxstZ76WlPYpx/8p9Nk4CHDZmp5
         trNg==
X-Gm-Message-State: ABy/qLbhrSVzcy1XV+22RUU8oL3qAvmXpPFFAWv8bRdIcPxbPPernRoZ
        8pvKtPA7pBGlrJuFsv2j7tZg7A==
X-Google-Smtp-Source: APBJJlGtQW5G88EO/f0Aik3FK3mpmjiVhvYfDhn8Plc1+yAgq7SkgS6nbOdkAhSKUkSy4uq6ZjuI1A==
X-Received: by 2002:a17:906:3f1c:b0:992:4d30:dc4a with SMTP id c28-20020a1709063f1c00b009924d30dc4amr4027192ejj.74.1689843543186;
        Thu, 20 Jul 2023 01:59:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id si1-20020a170906cec100b00992d70f8078sm387481ejb.106.2023.07.20.01.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:59:02 -0700 (PDT)
Message-ID: <109ec951-cd59-e590-5418-2221e166d131@linaro.org>
Date:   Thu, 20 Jul 2023 10:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Add initial support for RDP404 of IPQ5018 family
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Hariharan K <quic_harihk@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com
References: <20230720074302.13585-1-quic_harihk@quicinc.com>
 <1f2cd1ab-dac5-e8f8-bc2c-69f76d006315@linaro.org>
 <22e1915a-0d17-b2e4-8a88-651eb14c73cf@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <22e1915a-0d17-b2e4-8a88-651eb14c73cf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2023 10:15, Konrad Dybcio wrote:
> On 20.07.2023 10:12, Konrad Dybcio wrote:
>> On 20.07.2023 09:43, Hariharan K wrote:
>>> Add the initial device tree support for the Reference Design
>>> Platform(RDP) 404 based on IPQ5018 family of SoC. This patch
>>> carries the support for Console UART and eMMC.
>>>
>>> This series is based on the below series,
>>> https://lore.kernel.org/lkml/20230720072938.315
>>> 46-1-quic_harihk@quicinc.com/
>> No dependency stated, but the ipq5018 dtsi doesn't exist in -next.
> OK sorry, you breaking that line also broke the link..

Things shouldn't be too easy for the reviewers.

Best regards,
Krzysztof

