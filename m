Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 029B678BFAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 09:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbjH2HwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 03:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbjH2Hvu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 03:51:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A44184
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 00:51:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9a2185bd83cso529360966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 00:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693295505; x=1693900305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EqLCIfx/nQbDdaf7ISe4UiAeoOCZvB+r0pCvlD3LGTQ=;
        b=zPpL6N44WL7inyhdHAAHDUNf8j+oQF1Stzswm7B4hCLQCL4IF3ZUMkMUjB6ic/rmmH
         YpYaHvRJft527lOamtW3awCAvvzKceVPJfPEOdKr4qJrvwWFQWY620BktlS7NRz8urv3
         bb88702yHwxhP1KvND/aQyWJiG2pzL3S0E5x0lnJf5kZkVHb79Wq74ABZtciSEZVLsnh
         ognvLJYZmJf8NOfpJ9yvR2CRVL9rypn5k7JcRs8fz8lqhjSceJ7861N452i50QN8tGBZ
         ElSqUlSoSnwRLXxl+mPx746O4mghhd8Rsv8kG2KF2Wu8A4q8xow7cc3MCqV1LzeKKEK3
         ggLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693295505; x=1693900305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqLCIfx/nQbDdaf7ISe4UiAeoOCZvB+r0pCvlD3LGTQ=;
        b=IRmHQCbCsfmZxho2W136NuvPuWQ1VRUgpQ1uMe+wnG4ZEOQx11tc1Oqn/Ht7kXwD34
         fU1hI+AA8kO+74HP/e+QGrUPMIUd+y/mmljSVeWKNlfJlB7uB4rx3FANAHJnFquaETW6
         h4eHPxxJTBxN3n9t0w/Q3lNthnVB4EPGnz/LC/ttIr+l05cdCErx51L5j/HE8KxOc8N4
         5Eo42L26RjRQnxx8dk4JiLJtZ2Ig6MYntgf8hMFHpX6p0hPh92AkAXouKnJBlY1ab2ee
         1xAWPHUDmGHKRpfDGoaLlLpg6JDFFXnO5u5b3B99KiSD4ZziLG6xw6Rkggmh5rCp+rWG
         8FFw==
X-Gm-Message-State: AOJu0Yxyq3+rcIS8GjAwU0DMguabzxPo1q59s4uY1+o2mJQJkyJWZBgR
        2/DLAKibCxPweten9fB2cYv4prkseHJp+HdF+ng=
X-Google-Smtp-Source: AGHT+IGDpUJD0SJNbKFg5McNu0Y7Pe/LRRlvTH3Z5Y9WrBT69j1eGeD+n5n8OJBMK0Bixn99CqCy6A==
X-Received: by 2002:a17:907:a053:b0:9a3:c4f4:12dc with SMTP id gz19-20020a170907a05300b009a3c4f412dcmr8842608ejc.7.1693295504932;
        Tue, 29 Aug 2023 00:51:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id sd26-20020a170906ce3a00b00997d76981e0sm5638413ejb.208.2023.08.29.00.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 00:51:44 -0700 (PDT)
Message-ID: <5d9a522c-7a36-2438-37af-5ee6ccb0cdc1@linaro.org>
Date:   Tue, 29 Aug 2023 09:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/11] firmware: qcom-scm: drop unneeded 'extern'
 specifiers
Content-Language: en-US
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230828192507.117334-1-bartosz.golaszewski@linaro.org>
 <20230828192507.117334-2-bartosz.golaszewski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230828192507.117334-2-bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/08/2023 21:24, Bartosz Golaszewski wrote:
> The 'extern' specifier in front of a function declaration has no effect.
> Remove all of them from the qcom-scm header.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/firmware/qcom/qcom_scm.h | 101 ++++++++++++------

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

