Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1EF7623C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 22:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjGYUnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 16:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjGYUmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 16:42:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B71212D
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 13:42:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99b9161b94aso421532266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690317747; x=1690922547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luoqn8Oevn7bkqgAb6fNJnOH+RZZKqe9njAp7OGyFq0=;
        b=TbDvrQE8gms3+U4G88aHi+ZQECy/VuP63cWu8W2dq0cyAMuW4okMl6e5H6YZGvHdFA
         09cT8OdwzanTzAVTAKSYmHtIwNNfGdE/62luw5mHiryktLTpk+PT2BNNvVqFAwyFYGZN
         sBrDQo0YMB61Ao/F3pwRV3nbm8415wyzaR8PxhuSqpANptSdsoxE5QwbaoaEupbkWsHL
         y73d/08ukkJUV5YJdnkCfbpstBWhOXPQjiateZyzmIzqqZ0kLAooo216anwXs3I+gpVe
         bWA2wSUbx23qnpu63RAUdMVJpNwyMQJRkmBrBvkTB1IOSjHX8KdaBgGLGOwdK0HstgAZ
         8nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690317747; x=1690922547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luoqn8Oevn7bkqgAb6fNJnOH+RZZKqe9njAp7OGyFq0=;
        b=B4NU4psNyZNIuopzqcZj1R0nB+dfzlr94hn3hPnnxYMxpP90pbBwtZnGuHfxXBTRq1
         sJgOqZmnpzRFgH8GkpZ0uJ7CC9on33OVyfwwLJvVdhcn+43ZgZ5HU6MAGuROE6T/MOzB
         tRDqtGPNxDSwGFA3Enfyv/exq/oxeu2u0VmEofb1obEr2hbCAP4of/9Fmq4tIKl5Wrf/
         kv6OWxDlp+rZXQicm1nKRThyGh+hQ6Bw/gplm5Mq9qWDMCqvqU9fZJQZCOgR77gk5rwj
         e/j6FDgZxX8aUHPN8Vzgqn8hB7gVA34qDefKtme3RUtqpFg12Rd/E1xNeqdo3+r6lvuD
         f96w==
X-Gm-Message-State: ABy/qLaJJaj1Vr+NPLKy1LPW5Amy7r0woPHJLx66w9N10BIJyez+kuHO
        F8xODjo96l6KGpEIgn3KBU+/Og==
X-Google-Smtp-Source: APBJJlEN+nPjs/HeMvPv2U7XvIehtqxdjyI+/5qdTTdyp4g8mGDSFv84MiTD2ay4Fs+0aghWfmNRYw==
X-Received: by 2002:a17:906:224c:b0:993:e752:1a70 with SMTP id 12-20020a170906224c00b00993e7521a70mr14758414ejr.19.1690317747226;
        Tue, 25 Jul 2023 13:42:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rv14-20020a17090710ce00b0099b921de301sm3930223ejb.159.2023.07.25.13.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 13:42:26 -0700 (PDT)
Message-ID: <aa2c2681-1593-2e5e-0131-2f916fbdd14a@linaro.org>
Date:   Tue, 25 Jul 2023 22:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] regulator: dt-bindings: add missing
 unevaluatedProperties for each regulator
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Robin Gong <yibin.gong@nxp.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Pascal Paillet <p.paillet@foss.st.com>,
        - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
 <246eea6e-dd34-426f-9fc7-427d808fe8f0@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <246eea6e-dd34-426f-9fc7-427d808fe8f0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 13:14, Mark Brown wrote:
> On Tue, Jul 25, 2023 at 12:54:20PM +0200, Krzysztof Kozlowski wrote:
>> Each regulator node, which references common regulator.yaml schema,
>> should disallow additional or unevaluated properties.  Otherwise
>> mistakes in properties will go unnoticed.
> 
> This doesn't apply against current code, please check and resend.
> 
>>  Documentation/devicetree/bindings/regulator/ti,tps65090.yaml  | 1 +
> 
> This doesn't seem to be upstream.

Indeed, I should exclude any work-in-progress. Apologies. I'll fix and
send v2 of this patch.

Best regards,
Krzysztof

