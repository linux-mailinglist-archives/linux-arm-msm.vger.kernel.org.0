Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0396C02E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 16:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjCSPuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 11:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjCSPuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 11:50:16 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1184317CDD
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:50:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso6088070wms.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679241013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4czx9tA1HUqBAlDkv/jkPT3tRpMiU0R2k2/njPI7W0=;
        b=ltG9twIe84qt1LrDyZRz60XRnLpY52hVYiqIYG0NxPm750D+cckOV5oWloJa7gYg1k
         GDkJgLtMBMNGeuRQZfLyBHaXfk2golI5UTeToSMxqbp2btTGZNoqFenOnXryDCln3qMo
         vTg+fHIFI9uo5MNRttUHbZraATzo5+zcaChY/8cuMCG5EJK6rbE9obiDOwy5qa+zzY7N
         WcpWutnoToxfmdKwOIj1gzR3QvetJZ/nxoMrT6Z+lLPdF/r8aFhq0ochzxa2+kHzR77N
         2SxDjzzQO89wcsjF9zT6AEN9Z/tn7edfAmv+ih9l7UgPdOk3n1b6y8y4M0z31y464nGe
         /VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679241013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4czx9tA1HUqBAlDkv/jkPT3tRpMiU0R2k2/njPI7W0=;
        b=JBcRTaFt46EtvvX7roW5QV4OKFCB0LDADeCA9kuyEZ5GHhkLKoBxg9zPObOKQfnSG6
         jCRMoR7crM2DVPvQPtXvNMIK92LgY+c5e4mtNHI6xfR04sz0ig0k6H1sYiBNxCeJ6Frf
         qq7jdgTZnduzR2qcYbP6heKNxIOTkcRIAGJ2uku6VTwdHljsRuFcgEEMhxA0mQ1/YPmI
         tYgIiAYFV5cLwjRh4Stg6mEYJrqCQib4KLAj680TeK/fuEnfUZ4TJEYNuH4xkMEPRBR0
         LewB6jo5KGVH/plEULTqcKVvxd7hPeRhtrm0TuGmyZgAJDfbX12ADlSzToP5dnt3YH2j
         yX0g==
X-Gm-Message-State: AO0yUKUEqvFELjjqpoRL4gJ7r1BGbvOkgjio6LsJ8/JvG5t3W/7/UJ0l
        IXQwC39M0S8l0vDrilIzkw5PjmIKpFUGEuIUgxI=
X-Google-Smtp-Source: AK7set9TKTKEV3DmvG0D6ZMt/puh1YRthWJQDtQYNEiGq1Qd41PTZLtWwokVjNY9kmJisUsEnL6+dQ==
X-Received: by 2002:a05:600c:46ca:b0:3ed:4818:be62 with SMTP id q10-20020a05600c46ca00b003ed4818be62mr12694036wmo.34.1679241013538;
        Sun, 19 Mar 2023 08:50:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b003edc9a5f98asm3323053wmo.44.2023.03.19.08.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:50:13 -0700 (PDT)
Message-ID: <115e84d3-e21e-1c21-2fc1-b3f2eef640eb@linaro.org>
Date:   Sun, 19 Mar 2023 15:50:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
 <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
 <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2023 15:10, Krzysztof Kozlowski wrote:
> What is tcpm? Linux driver? Then not. You cannot have device nodes for a
> Linux driver.

Hmm. Well, actually I'll just - concatonate these into one node but, it 
will have to be called something like "typec" and encompass both 
hardware blocks.

I'll try to make the name of that make sense.

---
bod
