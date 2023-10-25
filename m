Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A077D65C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 10:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbjJYIu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 04:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234412AbjJYIuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 04:50:23 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0537D1A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:50:20 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507a0907896so8040964e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698223818; x=1698828618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42JgJL4inSij1dDJZcKoLha0/JD4nZAzUlXXA6vbSFk=;
        b=FKSqpr0ta9Vn7tSIRC9rZOG5CwTLG7E7SXNHiL6+KSNJTyvP3kcBoWcAnEuJVrfB0K
         rmNqaRW1H5fp+RsvPONDRDi5noyJN8FSxw/pGSTrx2XphZkhXv5LahTJxQH7piROpvW9
         maY+QocffrmbBPUWG28s/LQQY3+VIk+ZhPv3RhIZINKcE4J2s+IrMzucbYNDoe/xMKVZ
         nfLmJN0I6DWa0NBsJMpOEPR66f2iYPFEOSx0T3vZlLLXGgXMmSI6ncs2M8ViqIjBv8c3
         jjZvaiUsiDGJGT3o6dL2C9VRE7T8tJIqYZPUX/ZRR/3IzjJh2fZWfFKuKuEpQzHz/0a5
         Mu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698223818; x=1698828618;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42JgJL4inSij1dDJZcKoLha0/JD4nZAzUlXXA6vbSFk=;
        b=pyZ0D7j1BAF23XY7MjlFKEspSj4Gxdygjqpc80Vu+AAaf7O2jmoeTbe6ZFp8d6L83W
         7eMLiqcdBI1t8Uqo+H8YyCtHKt73tdrnJ1RKQZuMLtq4dP7E0+qeBIugrDRFexlDJlHR
         p6iLxUQ2uc4ofduxDxGBHXSkqliT4kFODOb9FJieYIvSbmmB+Hq7tyCKO5uUv4jFKfZs
         JJQIp/iB/In6VQznkjl1m47vYncvEXj3k42Xx4QliuUkq9f+2tOS7BJN7GdUcG7bPwGz
         K9lpVIKBGiFgNCL8Y2HMFyv1r3h7ZrYcD7ps4alLC0hSD8N0xZX64kg5aPsjq9wa2N/g
         0Muw==
X-Gm-Message-State: AOJu0Yztisv81oL0u43kL4L3mmgRBb58DVFvfqHFGpvROwDuRnyEbPnH
        P6QZCUALPPDz2mu0lTH3uKU5AQ==
X-Google-Smtp-Source: AGHT+IFI/jAT9xMiMciXbNW+3Fnv+Y9Bc7x1R5bYbksqN4voIBEiqokYkWMFtRc95a6GWDmnR3p3+Q==
X-Received: by 2002:a05:6512:6c4:b0:507:a04c:76eb with SMTP id u4-20020a05651206c400b00507a04c76ebmr13233616lff.35.1698223818149;
        Wed, 25 Oct 2023 01:50:18 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y7-20020a196407000000b005041f004d33sm2475831lfb.90.2023.10.25.01.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 01:50:17 -0700 (PDT)
Message-ID: <b7e6839d-69c6-4d89-805e-be6bfd384a2b@linaro.org>
Date:   Wed, 25 Oct 2023 10:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: llcc: Add configuration data for SM8650
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231025-topic-sm8650-upstream-llcc-v1-0-ba4566225424@linaro.org>
 <20231025-topic-sm8650-upstream-llcc-v1-2-ba4566225424@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-llcc-v1-2-ba4566225424@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/25/23 09:31, Neil Armstrong wrote:
> Add Last Level Cache Controller support for the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Did you double-check with the docs for the latest hw
revision?

Konrad
