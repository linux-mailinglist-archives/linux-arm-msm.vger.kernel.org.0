Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A922B776189
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 15:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbjHINqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 09:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbjHINqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 09:46:36 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AF81982
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 06:46:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe4cdb72b9so39252535e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691588794; x=1692193594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2h3BVdzDYger1Ig3jupVyxaNNU+YPUtLI1oNcRxPCU=;
        b=WtM37ZxvThdlC/xjAlNauKxqPwyLqwsjD8GLt8qzSuMRThUrgtwAis22mg2+RVaepZ
         ldL7eKPJiebAIVYLjap88LRUF4hRqjE4a6OGCO5FNQYmrCxQYlWMCaRj8qwbpy91bZaD
         DsxQdDjrQ8WXjZvLNGkVRKyNSYlLOvaWwGNKSvYrvmXj9AEnhTTj6l1BVAGmhNmoklYq
         iigvQ5/sxnd7lzq+p4vem6lqZvz4ndbsJUdQEkSc1kaCOo2vtsK4gfrXoPtuv3Jk+uXX
         HxZhALYhDmV7jofcTcoBLSyROeGEvAHGDtVKNUVU0B/9fCaILUH8xbMvLBnsVUJFaKEm
         uIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691588794; x=1692193594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2h3BVdzDYger1Ig3jupVyxaNNU+YPUtLI1oNcRxPCU=;
        b=V++LVPb+6edn5WJHU+z0CyOSSkt23+w2rjMA2Qk4Hf3McRPYHl9HMH6Tlvd6FtUDtz
         v1qTo+nOtiW0e/46hgfKKvet4GlVwNNVaTpx1qKBR+yWCo8gDuKEi8xquSDKF6Q1OWwQ
         XZawxFPbSTGG2RShzTryF/01EhPi6FZWLqwijWpgtU2DwdB3Gixhx0GP7wAyFQ7mS3BG
         Xak3b2DxM/EktbCF3MW8QQZ85M0axnQrGpi9dFruhRQktv6x6HM82yfLDg5xdsbhjMgz
         bLV/E8Og99vZqINb22etCI4iKTCVa89jRVS1AFlZguYophgAvvEcUPwfgZXuGj9jCRo4
         8jOw==
X-Gm-Message-State: AOJu0YyiRthaHarx2d9n4GZN47HeVEM2uVCv7MzzISVF/isYRYobKJNi
        6sYrRKNcdNQQb4/kKBZgObWrZg==
X-Google-Smtp-Source: AGHT+IHD8cPVuPjvXxaBEnDfRM/oX10/wE3Bzcm4KdDGBgg8X2PAQkxpeNxXXGpLXyG0hKGuA3CL6Q==
X-Received: by 2002:a7b:ca51:0:b0:3fb:e356:b60d with SMTP id m17-20020a7bca51000000b003fbe356b60dmr2337545wml.38.1691588793676;
        Wed, 09 Aug 2023 06:46:33 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003fc01495383sm2103912wmo.6.2023.08.09.06.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 06:46:33 -0700 (PDT)
Message-ID: <964f5f05-a675-bea4-e15f-d73396313855@linaro.org>
Date:   Wed, 9 Aug 2023 14:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: apq8016-sbc: Enable camss for
 non-mezzanine cases
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230809120432.1036405-1-bryan.odonoghue@linaro.org>
 <20230809120432.1036405-8-bryan.odonoghue@linaro.org>
 <7f30b5a2-37d1-4b1c-8f8d-4a4782534b2f@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7f30b5a2-37d1-4b1c-8f8d-4a4782534b2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/08/2023 13:11, Konrad Dybcio wrote:
> On 9.08.2023 14:04, Bryan O'Donoghue wrote:
>> When we have no camera mezzanine attached it is still possible to run the
>> test-pattern generator of the CSID block.
> Wasn't it broken?
> 
> [...]
> 

So, running the TPG without the mezzaine has always been possible but, 
with the hard-coded sensor you'd fail to probe and never get user-space 
enumeration.

The fix is moving the sensor portion to its own mezzanine and enabling 
camss standalone.

I'll make that clearer in the log for V2.

Thx for the review.

---
bod
