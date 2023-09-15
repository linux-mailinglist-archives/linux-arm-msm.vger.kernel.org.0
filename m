Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50AAC7A21B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 17:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbjIOPDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 11:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjIOPDR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 11:03:17 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA3A1FE0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 08:03:12 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-31f7400cb74so1928887f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694790191; x=1695394991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9C1UHaCOBJhiAypiHyvSaWyiNAJYDTwexCkUigqYDiw=;
        b=tjI2EcY4NEOmV4v349wfu97gmEqAJgtHFuYoF6jFkzfjVshHLDmvRaaKZuA7gtSjt+
         SRfjzemiFi5/UEi4siIi7O+aAPSOW2fAA4793D3dUm2LFIxBle0P0WX+DnRk9opT8533
         NgV2YYpHwTbpujHv0nQNNyayAYgTao3seeuDf3TSQ2aPNSquWmF1JeRwstxZUiajkccZ
         mwvufprCjRU+FE7wrEFvoXgmg/acVRjamlfSRQlopZDJBG/Yl47eKMJhQntWoCWlTkT7
         6ld/Fb+p5FYU53XdPr234TnlD1kEzv7XSCB+Mg0+WbDaBlgZVDzq0vWwVof2cVAGPZuq
         WKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694790191; x=1695394991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9C1UHaCOBJhiAypiHyvSaWyiNAJYDTwexCkUigqYDiw=;
        b=eGRnvrZuTfcJN9n0hTf8gpuo1LFGILc261RW+iau8wlo4QnKukf1CD6r6d2KPry1O1
         6kcV7Di50bR0hZ8uCvHr2tTTQNhEvK1DEJZslSglo+b9haJIekDvWMMF/4P44M6r8pFY
         Pexr0eFQgR7nWTr96bF/OV2JG5XxL1J2/BZc1lmBS2AKgD8mZe+a9+LK8AO0yBwi+ts9
         rm045acxHld+Drjn9YrYui7HANkSPy4Y/kMe6LGQ8sdsvmB6O2OTpPuZ5zduIIVUtcNB
         SisGEOV8XqNLxiQrT9mRqHIYNv3Yu85j7e18kkobxc/K8y5vXnVkeCIswZvUYNgMBW2q
         8Hxw==
X-Gm-Message-State: AOJu0Yzlf5dteyXyn3fCAYSk6r0iI6hKfSUO9F4EXirXPw8hHxIKFSnk
        j4IwZeBTTh4Fn5lHIXk1EZZZ+Q==
X-Google-Smtp-Source: AGHT+IFc+ZFaV6Jq0IUQleifvSgcm42U8VytZNKWgSnA6qkqDp3hA8k9nsoXOe9w09rec7hSRTw7Pw==
X-Received: by 2002:adf:ec4f:0:b0:31f:d52a:82b0 with SMTP id w15-20020adfec4f000000b0031fd52a82b0mr1637996wrn.45.1694790191118;
        Fri, 15 Sep 2023 08:03:11 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d698e000000b0031759e6b43fsm4653581wru.39.2023.09.15.08.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 08:03:10 -0700 (PDT)
Message-ID: <d20ad799-92ed-4a5c-b20b-02c5ab3523d8@linaro.org>
Date:   Fri, 15 Sep 2023 16:03:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8916: Fix iommu local address
 range
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@quicinc.com
References: <20230915143304.477-1-quic_gkohli@quicinc.com>
 <ZQRtchQ0HqmgkvIa@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ZQRtchQ0HqmgkvIa@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2023 15:42, Stephan Gerhold wrote:
> On Fri, Sep 15, 2023 at 08:03:04PM +0530, Gaurav Kohli wrote:
>> Fix the apps iommu local address space range as per data sheet.
>>
>> Fixes: 6a6729f38436 ("arm64: dts: qcom: msm8916: Add IOMMU support")
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Aside from the minor things Konrad mentioned (v1 -> v2) FWIW:
> 
> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Although I can kind of understand that starting to count at 0 often
> feels more intuitive, especially for Linux kernel things. :-)

Just put

OPTION BASE 0

at the start of your cover letter ;)

---
bod

