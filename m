Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E35B649A5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 09:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiLLIug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 03:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbiLLIuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 03:50:35 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7CCE082
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 00:50:32 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b9so11766846ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 00:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jI1OaOD4zYv+GMXooOxYiYkoWIspbT01nwkFL3b41Zw=;
        b=vtG27djnDlxQPP+gt2UERYPQYHEz36rzlqnZwpyetB5yiPDse8bhlaLJ3grsX+YHaQ
         ftSjkG9M5R/muWJgmfuf2IVOvwVkjG4yKIz8nXnWpcmHPO5qpDFgkXiPSYLG6PGRRfku
         cLwFbIHMUrSIqLwFWpj4K30QFBM3QooeQ2nB0S0v1Bp4EBOMWyo9ig/6QXezxRsUGBNc
         SMvOplKKPjlJvkbRW2+robdOeytZJNG/CkPyvb4INEZZoCB2MjX67U9l/VmkUKr+MbCS
         yzTUU8/Ch/EQaG93pYmj4lKrg0K+g3C7VGuaS3azPQ/Br4Nj/8cgIuhT6h7J68BD81Vf
         zFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jI1OaOD4zYv+GMXooOxYiYkoWIspbT01nwkFL3b41Zw=;
        b=GLncWSR5Er+NE/dyDBecLyrChkhNqfyutu1TY+OCF6UK5XcE/MqiU4Fr8ezWkI4T24
         /OZVixUJOkb5TCE0G5WCdEk/g6yK6zzDuu7knSZVzLPFzohNhQ5VmO+uvHNqhslNftYj
         upyQ+vNAF3o3FGYmOvRhSA5D9A3l8w2az98LTBGt8cO8ZRucfbk0EsumpNgY0K9LRv30
         foIrQnEALuevyLglpSTDOd5uSzatp+LrvL51Sej7zS22mRLK2CXvsn2Ye4mSNdb8Ui9S
         MnAD7xdWzGyVXGNP0UghWku7cT4WFskv78Wgge/ZkN3KF7Y3yJ0Isg/sDk2YwkfqhDZv
         RG7A==
X-Gm-Message-State: ANoB5pnOeKytwAvtcXE251WNSzFC6EZM1unMvTLC38x9JVjnthq6CNcC
        PbFtxhX9EXKpem+5oQirOKjvAA==
X-Google-Smtp-Source: AA0mqf7zeOimlWAmKA/szuz53f9S4WXpLbMRSVjDPhdREfV0CNwgjviZQ143aQR2M99Vw8wWRUTFMw==
X-Received: by 2002:a2e:7008:0:b0:27a:170c:1938 with SMTP id l8-20020a2e7008000000b0027a170c1938mr3703767ljc.25.1670835031320;
        Mon, 12 Dec 2022 00:50:31 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e3c16000000b0027711dbd000sm1092346lja.69.2022.12.12.00.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 00:50:30 -0800 (PST)
Message-ID: <064d6fc7-1efa-3272-c9c8-191efde8ba8f@linaro.org>
Date:   Mon, 12 Dec 2022 09:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/5] dt-bindings: interconnect: Add UFS clocks to MSM8996
 A2NoC
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
 <20221210200353.418391-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221210200353.418391-2-konrad.dybcio@linaro.org>
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

On 10/12/2022 21:03, Konrad Dybcio wrote:
> MSM8996 A2NoC contains a UFS master, which means the UFS hardware is
> accessed every time sync_state is called within the interconnect
> framework. It's all good on devices where this clock is already enabled
> (most likely from the bootloader), but devices with eMMC storage are
> rather unlikely to have it like that. Add the missing 2 clocks to the
> binding.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

