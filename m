Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B5D771658
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Aug 2023 19:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjHFRwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Aug 2023 13:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjHFRwY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Aug 2023 13:52:24 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EC8171A
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 10:52:22 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bdcade7fbso520636466b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Aug 2023 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691344341; x=1691949141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwvFyfkHmBnYaK/4d3zKdpJUuSVTfSdMbjRjXyVLu3I=;
        b=R8Ct4R94W6gL7UgZegygYejkZQluQNHlYDIACaBnMhsgOrzqSxll740DGfJlKsyH6b
         S19fSNWj0M2uttxE0OFTxXD0r1prPKedwicLJ4jvW2NqIEkU9PGXxU8WtdNi9fiCqIJ2
         janbLr9/FUz4YkSZpdciNk9JZmvSjywmKtm57Wj+y1XChtCv+FToRHq0DkQXp+50xAsT
         9zEXLG9O8mH+DkjHFL7OIb7q4yDkFLnX81M30Pha0bbon46qyNBzDSV1EXuLW6ePZVwu
         XBgWeViTMS+cnCmfGPkM5VtjhSMjrrBui+nHy6oiJnh8p3Heaifs/BeE7DihZjcKyb9G
         GWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691344341; x=1691949141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwvFyfkHmBnYaK/4d3zKdpJUuSVTfSdMbjRjXyVLu3I=;
        b=YsBvUdWhAsVdR9t7VrGIpg4DwJR1iWGP3Ssf02DVeua2ltvM50hIF+wRVDzx1ZdOyk
         yWd4BOvzmJWDLYyAaOpUENA31OZe6K8bfSUU6Zui+7xY25WnzbWlDQLYqm/6xHrk37fY
         nJK2pac262Q+/ZgP1utgNEK3siwdhUoFNRotEmgSJq99qLm2LKO6owhSjNds6BNJ/MQh
         ySlFttbWTZgwR3Ugl1Y7BOuZ1zLm++KLpXJi3ly1rxVbD6gStDXxqVwKJMFLdSlhdcEK
         nC/f8g5ElV+kWo2NueTA0WqyPtBsB4dMyW8DnE621/zAjXrkKHFmcZGKdaR6ZImizHZm
         0xEQ==
X-Gm-Message-State: AOJu0YxmK30rLaRwS/UmPPfa3GB8qQO++NvPt2wHLD8XCRg6YCJ9qgGk
        hbnNQHUpuM6mWFt9g4KfEFocmA==
X-Google-Smtp-Source: AGHT+IFamjfnBvxxo0aAn24T+IxcP9hbraQm+b7v/6wEvTVyBdsBBNTMASnwSn5TJcU8NNpd6RHvvQ==
X-Received: by 2002:a17:906:9bec:b0:993:d536:3cb7 with SMTP id de44-20020a1709069bec00b00993d5363cb7mr5939292ejc.11.1691344341290;
        Sun, 06 Aug 2023 10:52:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906168500b00999bb1e01dfsm4121285ejd.52.2023.08.06.10.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 10:52:20 -0700 (PDT)
Message-ID: <a7de6c7c-2054-b26b-386e-22f8f4e36367@linaro.org>
Date:   Sun, 6 Aug 2023 19:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: mpm: Pass MSG
 RAM slice through phandle
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230328-topic-msgram_mpm-v4-0-bae382dc0f92@linaro.org>
 <20230328-topic-msgram_mpm-v4-1-bae382dc0f92@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328-topic-msgram_mpm-v4-1-bae382dc0f92@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2023 14:19, Konrad Dybcio wrote:
> Due to the wild nature of the Qualcomm RPM Message RAM, we can't really
> use 'reg' to point to the MPM's slice of Message RAM without cutting into
> an already-defined RPM MSG RAM node used for GLINK and SMEM.
> 
> Document passing the register space as a slice of SRAM through the
> qcom,rpm-msg-ram property. This also makes 'reg' deprecated.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

