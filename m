Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656B1745E91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 16:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjGCOgc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 10:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjGCOgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 10:36:31 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388C5E52
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 07:36:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9741caaf9d4so390687166b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688394987; x=1690986987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FwSFN2B3q4pOkpwZeay/wdDuIxAW6S0AFh0Jd3gvkfM=;
        b=Oa+fYspv3ZKtY2fQHGu5S7yYsVL7t+GeXWps/Nl60EW+etL/Vm7ylbCxnxkWRXHvrg
         GjB1ASEM5XOUKMni+QfdfJEO07Rr11Qx2mTcWzcA68VHmgXvPcctNpRq/MNLEMPlAoy6
         hS+y3WZnIUdKemWFwiQV7Y55Px2IOuYdBYZoUHp7i4eCgAnMZ00XZnO1NIsXBbwiEkBe
         JIgqd39dSsSJ5SC3m80U75uFgS1A66+VLLS5GaO+0wE6QNXBU8sb0y/7LXx0eNCIPcV1
         /aELJrXoxAiCnAXRB1x4A77rlQj41spAY0cIIlbpaz+dbqAYRT2HAezomCDwayqNoBZs
         MGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688394987; x=1690986987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwSFN2B3q4pOkpwZeay/wdDuIxAW6S0AFh0Jd3gvkfM=;
        b=Hr7VT91XGCi4kkH7wVgCUvyPcoq1UDN1zFoDuNcqOHGIfkS/JJcJ17uA/4iXGhV+3A
         uHFWsgt+SWwFwLSWHLEme/5edHJyHv9ogUHrfYkkCXg4Xg0L7MIoSGKoHFHRVlqqeVUw
         6u+YecRwgXcdyyqA4UzxDdFrTVl6wmoUmsiw7xGbqtiiy1RYALWsSYjvEoVPAnE8ca2l
         iEIuBcnVJPxMVu2f5DeM9cMrJUYqye0tHQkQaqVZlihn8+xwBBaQ1mL7YLOx9aysIyHY
         1eQFpMDHs1hbjbr/pigqBTLnH22K+HlQqC2+YM7ob7iR20hkE2GMRrtCsesXGQ5wihES
         +CUw==
X-Gm-Message-State: ABy/qLaCtg3iPOn5RJ1IWNDGWaKxM3WBCJ81bnBaQiNf4oSUsFRqwxzY
        5Ou1rm3A7ZaT5IQuBE9xxB/kuw==
X-Google-Smtp-Source: APBJJlEYjzsoPj1nUdAXyYbSBB+F4ZZ8F5ulOIcOtt+iKgjz3IkRAUBNkYgDO0v/2N6TBLu9KI/hvQ==
X-Received: by 2002:a17:906:90d6:b0:98f:c9b:24ed with SMTP id v22-20020a17090690d600b0098f0c9b24edmr7752067ejw.67.1688394987701;
        Mon, 03 Jul 2023 07:36:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id zh18-20020a170906881200b00992b71d8f19sm5650170ejb.133.2023.07.03.07.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:36:27 -0700 (PDT)
Message-ID: <05869d6f-972b-75e1-6c0f-46baeafca5ff@linaro.org>
Date:   Mon, 3 Jul 2023 16:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] dt-bindings: i2c: qcom,i2c-geni: Allow no qup-core
 icc path
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230703-topic-8250_qup_icc-v1-0-fea39aa07525@linaro.org>
 <20230703-topic-8250_qup_icc-v1-3-fea39aa07525@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703-topic-8250_qup_icc-v1-3-fea39aa07525@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/07/2023 15:31, Konrad Dybcio wrote:
> Some SoCs (like SM8150 and SM8250) don't seem to provide a qup-core path.
> Allow such case.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

