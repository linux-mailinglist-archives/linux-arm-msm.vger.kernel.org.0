Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED06619F86
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 19:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbiKDSOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 14:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbiKDSOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 14:14:24 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B795D317E0
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 11:14:20 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id k26so3577435qkg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SG453khFqyybRjE2vOFnXMkjeNEeOKxNVXxdFYyvrJ4=;
        b=CBbqaRwzirUcrOflgf+F8j8t3CS6r/15sRELwbK9WOSNXraWApEkA3hYF+MKNPuLPf
         l/bzfQfu6mkRqHd1oJY6KZcWDUiq1WOZ0N54fIw1L2nTpUSmSnPDdwW8sBAQayUVCETp
         Botktr+YUjyVStmjM9YSgKb5Xzw58xnlyEksrESo2Xl9CBpDlh+Id0ehcjm7ejom7SDm
         ea0xZ281GFlMYeBgrFNh8xaxhC+UWxiWqxIZ/v3HeiobN8CkD3bPWhHSkuF8/S1M3SMG
         GrPBL7/xBE8HvkgjU9kOQhXLf039hOsFpf8HjPKjoBSwI2XR18y9nXsdjyjKPGt3IiBY
         UlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SG453khFqyybRjE2vOFnXMkjeNEeOKxNVXxdFYyvrJ4=;
        b=ZG4rAfO1zKULkbNF+hzpWoCmACyMSNaoEmJJ7dYNM9AFKFguTloR3bC1hMO7mIlk6Y
         nvgxIUOa1U00x1HX8eQ8bKlRT2on7J9uCk4a5TIDbMpGVJdqNhS0NbNgPtgHpIKm03WZ
         f2FeMMnHJ3ODpCcreD4ODrDmu9ifJjhN1QO+y0CgwzcTvCPX0NDJzwg2V1V9ojPN0Jso
         0YuXYqidDMiMU00HSNJYRgJmA8Gfh2LcSrRGTw4+4ttKgfOwHOZWgsAOg7SD180NXwLa
         X30ZCd03dX/PBoea3TLllp6N10AhIusb7CwqbC1JIHU7DuJ+nPCZRxOZvgmgwoEhFGQL
         ukCw==
X-Gm-Message-State: ACrzQf1iRJ8FnC78C0OjxiHNTuUWThJN6RiWrVFnUA9yLZFewu8D9u9i
        /YFJ93PQUrIJ8bEkQyOwf8fvSA==
X-Google-Smtp-Source: AMsMyM7aPxDIQmGMpwdNiKmoOUC2lnx5Vzmc5zPwjFKGfp6T7L/3gBdWIP87+CIoepUCVD5UOcZdzQ==
X-Received: by 2002:a05:620a:1312:b0:6fa:4b40:3347 with SMTP id o18-20020a05620a131200b006fa4b403347mr14805129qkj.256.1667585657099;
        Fri, 04 Nov 2022 11:14:17 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id p23-20020a05620a22b700b006e16dcf99c8sm3236893qkh.71.2022.11.04.11.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 11:14:15 -0700 (PDT)
Message-ID: <8a684a5e-710b-e34d-bf98-9c2be92512f9@linaro.org>
Date:   Fri, 4 Nov 2022 14:14:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: clock: qcom,sdm845-lpasscc: convert to
 dtschema
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221104170552.72242-1-krzysztof.kozlowski@linaro.org>
 <20221104181230.2A001C433D6@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104181230.2A001C433D6@smtp.kernel.org>
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

On 04/11/2022 14:12, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2022-11-04 10:05:52)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml
>> new file mode 100644
>> index 000000000000..10aa9b6e8d89
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-lpasscc.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sdm845-lpasscc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SDM845 LPASS Clock Controller
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Should fix this email.

Copy paste... I'll send a v2.

Best regards,
Krzysztof

