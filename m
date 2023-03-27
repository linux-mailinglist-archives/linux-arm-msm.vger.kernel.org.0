Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91DC56C9D63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjC0IPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbjC0IPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:15:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E775255
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:14:52 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eh3so32246652edb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904891;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ9/5C697ydgp86GT24/w/0BjIB/pHOZy6FLILlmTDY=;
        b=i5SShJbAHbYWCT6T+tG3lc2zagmYkY2ltdA7KGBy5XUyuJY4z3W6Abysgs8ztT+hoa
         KRQYcGuafcclzD7MFjvqbtGYCUZwaD0UZoQmGdb0/OhKkY+EMqVguV+O75bi65yexlmo
         fIlHk8cUThAzLEUDyDclLj0TmGFOdFV+lsL+r7otIRkwAtBT/QAZ9vxS1+5C+4wGl8uM
         c83EfOvR7PClbIn4LMqEEAfXCOorl46W6kbcTctR0PqBiVuUbw7N83ytH5ri+btkGyRg
         LiO1EYmjZlFNMVqy7gf1Mq+xA/23CJUhx/z6zwktTsuweZSbqONx8IRuSVZF+XX7RuHt
         XMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904891;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ9/5C697ydgp86GT24/w/0BjIB/pHOZy6FLILlmTDY=;
        b=NjyHaUng889OdmEKxdHv9/lGSzB2HZKJnlS5tqwiq9oMcCCwdRr2WaID55gABuqjA2
         DOsbfvEdfqfe006/QaR78gRZbvi7B4P8pau8pH17OiY1hhKSbP2PW3A23gQQJY8of0GY
         g8/RmgF48Ii9EETcfkR67q4vDbgXlf62hjHytseGWEdWUbCnWRGjGl7EZVdZuobgXHEf
         WSXoU+aCRUWDt4jMR3nv8EMqMwoGNIgvzje1rEn0g4qCxQrgxa6STDO1JKOy2954U8Yc
         +6Te3uQdUVxSA33ZOuByejCM0EifHxbU8z6cHk5sTS0bSRNx0fbi4ORaVVzaJy/a/uMc
         biCw==
X-Gm-Message-State: AAQBX9eu+h6DsJJ1R4yDwgXgsmVcqeKEKbzrbTf82DDsPv2KWYQ0UA8P
        9/YmOFhKR1VeZjqcbd+8neV2HA==
X-Google-Smtp-Source: AKy350bWKIDxQsBzXyvo0WoSSAogV1zSIUDVdW8trqKiF66ZbVGwozz65mtqAFj9fiCoOK+8Lpkt2g==
X-Received: by 2002:a17:906:284c:b0:931:99b5:5a23 with SMTP id s12-20020a170906284c00b0093199b55a23mr10876707ejc.44.1679904891494;
        Mon, 27 Mar 2023 01:14:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:198e:c1a5:309b:d678? ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
        by smtp.gmail.com with ESMTPSA id b4-20020a17090630c400b0092b5384d6desm13807165ejb.153.2023.03.27.01.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:14:51 -0700 (PDT)
Message-ID: <030e45d8-6ba2-e9b0-4a24-3f2b7845be4b@linaro.org>
Date:   Mon, 27 Mar 2023 10:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sc8180x: Introduce Primus
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230325122444.249507-1-vkoul@kernel.org>
 <20230325122444.249507-12-vkoul@kernel.org>
 <f4fd089e-5ad4-dc35-abb5-dc3053702311@linaro.org>
In-Reply-To: <f4fd089e-5ad4-dc35-abb5-dc3053702311@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/03/2023 10:12, Krzysztof Kozlowski wrote:
>> +
>> +/ {
>> +	model = "Qualcomm SC8180x Primus";
>> +	compatible = "qcom,sc8180x-primus", "qcom,sc8180x";
> 
> Please run scripts/checkpatch.pl and fix reported warnings.

It seems it is already documented. Confusing to document board
compatibles in separate patchset one year before boards gets accepted...

Best regards,
Krzysztof

