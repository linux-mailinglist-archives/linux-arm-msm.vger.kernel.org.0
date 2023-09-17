Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539787A337A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Sep 2023 02:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjIQAWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Sep 2023 20:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjIQAWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Sep 2023 20:22:36 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EACCD6
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 17:22:30 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-402d499580dso36266385e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Sep 2023 17:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694910149; x=1695514949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/mSGd0lQiQIs0ky3gsayu99HBJSZ/MEeeFtzu3vHGM=;
        b=O08KXq1StnZ0mi6ZFrkdQPpCsqRzSl2k5pgdo6ZvS3klDp8F1pkNuthmNssgEyU7s+
         SLKfBuaYk3hZUJ2dKiptJdCOnifj80kFUbnYyePY/MQYtEdJI8w3qujfbfqFRFjQvP1T
         U6FaLkv6A3FwwwiijCpXbAg8u963z9uOEKnyGgJSNtwb44j4O4FdILCdv6HuOl4HyHkb
         uZnIWYyxUpMIJjMgJF3e4+jsL0JY0KVCl+ogEZXzwohWGSoEzDtOVT6n5W2rlnJ8gyqx
         zMibd2KhoTXL8l9uUIWVCNF6Vk+8WnKrwYAz4LswNHurfdnaaHnCUBRQhRV2Vz52jpjs
         62gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694910149; x=1695514949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/mSGd0lQiQIs0ky3gsayu99HBJSZ/MEeeFtzu3vHGM=;
        b=gNnbVwU7XYP3rqItVjqwAbBlcWKNEjZHaUCCMhycdLUw00s8xFpUU9fBTc6Ii7eCaD
         qF/bDwYftMu736nMmhBU9HKubSSN8RDjf2MMCHpV1d/SAa2cbP2FoWJtET4dUjRCfJXy
         8BW0D0/EnbHacMy9Rzqn6WH+MPZ4EcEtOY4+gsXKnFYxGUXy610c0atIE2Ca2nERxtEf
         b2S/4PA5qlvmwkm4EEFY3uGiP+hI3VSQA2iK+2zqGGeeuu1TTbRVC4JkhulO7DxCQUVW
         Nw4TLWV5Qil7jetHefAptU4PudvAjrT1ws0DxDhEBCDtJKMyXRkGrtyuIidUJS2cCn2M
         cNeg==
X-Gm-Message-State: AOJu0YwLvbGCtA9bKhZgYgN+t7w2xGk9XNvt5qMsq+bchdYV/HzA4tuO
        J6NqdkrP6ykLZA8I+xsJMThn5g==
X-Google-Smtp-Source: AGHT+IF0WUtsBTjNiyn9tDsi9lSymZ3pEuoj5cUAFdJtxACwTRWECoejR/S3RU8WWwYVNbkSljXqEg==
X-Received: by 2002:adf:e78d:0:b0:314:17cc:31d0 with SMTP id n13-20020adfe78d000000b0031417cc31d0mr4482762wrm.34.1694910148573;
        Sat, 16 Sep 2023 17:22:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b0031c5dda3aedsm8412372wrs.95.2023.09.16.17.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 17:22:28 -0700 (PDT)
Message-ID: <3a66a198-5817-4c74-9047-c49e5bcc84c2@linaro.org>
Date:   Sun, 17 Sep 2023 01:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-huawei-kiwi: Add initial
 device tree
Content-Language: en-US
To:     Lukas Walter <lukas.walter@aceart.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
References: <20230916134147.163764-1-lukas.walter@aceart.de>
 <20230916134147.163764-2-lukas.walter@aceart.de>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230916134147.163764-2-lukas.walter@aceart.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/09/2023 14:41, Lukas Walter wrote:
> + +&wcnss_iris { + compatible = "qcom,wcn3620"; +}; +

Are you sure this is 3620, have you tried wcn3660 and/or wcn3680 ?

---
bod
