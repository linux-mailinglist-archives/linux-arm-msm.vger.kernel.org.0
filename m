Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3967506540
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 08:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245034AbiDSHCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 03:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349168AbiDSHCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 03:02:13 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EF63204C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 23:59:22 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z99so20021603ede.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 23:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xtPMXWr/kBsjQ8TMvds7ZU5rXIyYZIQv1YDtw3jQTSQ=;
        b=ANNJUPjKHHr/K5lD26k2O+OwMYs8iek/U8BbxlHrKp7G98bZtWqC1BmMTfdWYH4Oaz
         EAe2EXSinpJG7GMyGufYUk8yYJ6mRDklgDJ5c0XYGWNdGz8DZKFuwpQEX9hfRoZOc2jO
         h1u5gx+E5MB6VhL4wjXCXFlLxL3lDu/JV5rTw+cAkpBSQtkljU8stL1EO2cPY/azL6PA
         Kg+Tjrc5lbjmNksOKF8XmIX867L+ojlvxiqne6ohZ/jX6DWa8EDU2w6HMWFQHmeGhEmI
         0/WTmhKe1k2wNvGzjanPOPQ625xwu8QJvhU6UHjdYA5WHtsyTs2iB/RIaTNlDZrma2c2
         ahpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xtPMXWr/kBsjQ8TMvds7ZU5rXIyYZIQv1YDtw3jQTSQ=;
        b=aHPX4+2ql5AjmQIUOeFl2wUDHD6CdBL8T4lFpRI1d9vhN/baHKcqLF/QUKZqThFZl9
         y0GY4LD0EBacFf0BRcLIhhRdtwklDl5yrPY8j7Dz6UlroJS7aF0TSkHt2aHyXSFVez3i
         1hYvdeA7Bzc4Ju1YDIaoRCtokl4RDGAeUfEdgF3r1vIk80Y0KtDP6zO7YnHeo6hDz99U
         Ev7Ctt81DRXqtNl8HpRDmrGCpyIsIJAsfh5PSn5qhiXDrIozgdEY0HnyC4LgGaDhZO58
         MRk56NJ1V5JTz6e/tRIw7R3VBfKkOVw/DD4/RqNt2k7zqvSkTsX0F18XYX8OHOeGXBZy
         ZVTw==
X-Gm-Message-State: AOAM531DQkI7pIEhNNJCvUzldKkIaP3gLN4ocap1RmWPpXqgXX+bmNsz
        apnmCuA5DuQyJfduL48TEfB5Tg==
X-Google-Smtp-Source: ABdhPJzDyOUDVOecPQQmXsf/UsPZTbxO/oxx5mBw4OKdaBA8/MPL50cKYs4QCeotmL8+A+A0VWZ6OA==
X-Received: by 2002:a05:6402:90c:b0:415:d340:4ae2 with SMTP id g12-20020a056402090c00b00415d3404ae2mr16084835edz.331.1650351560829;
        Mon, 18 Apr 2022 23:59:20 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f5-20020a1709067f8500b006da68bfdfc7sm5367474ejr.12.2022.04.18.23.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 23:59:20 -0700 (PDT)
Message-ID: <b8d9fb56-5828-3b3a-cf30-1587f81c7082@linaro.org>
Date:   Tue, 19 Apr 2022 08:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: soc: qcom: smd-rpm: Fix missing MSM8936
 compatible
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220418231857.3061053-1-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418231857.3061053-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/04/2022 01:18, Bryan O'Donoghue wrote:
> Add compatible msm8936. msm8936 covers both msm8936 and msm8939.
> The relevant driver already has the compat string but, we haven't
> documented it.
> 
> Fixes: d6e52482f5ab ("drivers: soc: Add MSM8936 SMD RPM compatible")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
