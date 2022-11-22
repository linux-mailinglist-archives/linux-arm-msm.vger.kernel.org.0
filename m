Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E1F633BA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 12:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233080AbiKVLnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 06:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbiKVLnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 06:43:12 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC68515A34
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 03:41:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g12so23190392lfh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 03:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uUWYFk5b+vA0k1eVQqcKqPS+FzcN0ObBmyc6c+9OCA=;
        b=MTYcvp32aEurlDJpoLy3aRq1eROXz6OXhwvHDdlr3dfX1W6lnxFnBLixAVvsNUxZ2j
         /rI18Kv5BRQOqO4lznfZc/yXBPyWHmztpX8XIuqPsbTFuvjyS1RHL4kvJkNdkrmSiVOv
         qaiuGzZYJMpGlKozMuwCKvNOZy4y1VvASvkHr6Wjx1vwPC002Bcn194dgWm3Dq9fmliy
         8i/mhiYVtsyWVE7V8CeiJATM200+fpyUZpz1XiIQPE/RbmZY/ZJtSvF5U0hEdE51vIkU
         6d8d+9biW0HQwaFzYA06NbDwKvG+sTrDKwG1xcX8vXY+pYzw1pjSF5uFF3Rk4YshJuy/
         vgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0uUWYFk5b+vA0k1eVQqcKqPS+FzcN0ObBmyc6c+9OCA=;
        b=qbBRjNpZGvURIvSnYQ2gj7vbkgW5ysvDgVliq8RvcXuPauuKpITKXwEi6C1k8eBCHJ
         4Fe6luU9w3U7p0UBX9IdsM6JiBZWMV3yoOtZMohWMGvcKWlHT9RjQer0SuwDjPQwuNQ+
         P9o8nRtDoBBnC6N0MVDBu8yA9lclV9EXW3+cvUrYGiIKtvuMaR42TbhC/2UO3nUyDtaV
         AmfFYucXA+F98RlF/Wx3417I6jwgiUjnBhwM8z0fj3hhXZ1iL7oZQWOfqzjQcF9qvjP4
         NeDr7uP64KKJJXkQVv0dPfpR7XAFOmGkY1PUsTmRddcXpUx1moqkr5vzgK9unDOES5nB
         BX7g==
X-Gm-Message-State: ANoB5pmyZMdQ+gwELfP3ziBxJSc4HE4r3mFN2Pj7nxzAqehLsdjJnBh4
        nkEMrQ2znRY5klU+g7Fue25lRamfN17F8fGF
X-Google-Smtp-Source: AA0mqf5x16RFXaA+uzVzXVBdNW/cAIqHESFswbTkuTTZxZ31wa7x9hivZsjPjLjWWs/vWqwqHFk5KA==
X-Received: by 2002:a19:4f46:0:b0:49f:5ddb:f8af with SMTP id a6-20020a194f46000000b0049f5ddbf8afmr7527780lfk.184.1669117298160;
        Tue, 22 Nov 2022 03:41:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512214100b004a45ed1ae21sm2427823lfr.224.2022.11.22.03.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 03:41:37 -0800 (PST)
Message-ID: <e7350331-5312-2f46-2914-15a3a7aef245@linaro.org>
Date:   Tue, 22 Nov 2022 12:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: soc: qcom,rpmh-rsc: Update to allow for
 generic nodes
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20221118182535.11156-1-quic_molvera@quicinc.com>
 <41010ea4-68f4-b0e2-ab30-8ca6223417cf@linaro.org>
In-Reply-To: <41010ea4-68f4-b0e2-ab30-8ca6223417cf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/11/2022 11:27, Krzysztof Kozlowski wrote:
> On 18/11/2022 19:25, Melody Olvera wrote:
>> Update the bindings to allow for generic regulator nodes instead of
>> device-specific node names.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Unreviewed, because this should include also SM8550, otherwise a new
patch will follow it immediately, which is not necessary.

On SM8550 the apps_rsc node has up to 6 PMICs, so it should be instead:
'^regulators(-[0-9])?$':

Best regards,
Krzysztof

