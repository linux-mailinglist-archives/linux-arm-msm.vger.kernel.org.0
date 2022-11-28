Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9FE63A9A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 14:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbiK1NfF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 08:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbiK1Ne6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 08:34:58 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E111EAC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:34:56 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d3so13174014ljl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAu0VQR4UdVud6DKlwNlrSjlC5pTCUHW/IZc/xZTrPc=;
        b=qjmq2LUdvbLv57+bXXMNgQGrkFEprVYomy3w8VToSMQUS8/yMY/2sKHqqwyiNBLeZv
         XDMTXVnff64aeeOH8MyyCeSS2fGOctmm9++J8zL8XG6BSo3skTRzBtod8lvmmjuZgqL8
         AXQPe1ofqRXNtIV8soCuHcuBb/xErO/aFGLc0QgVwzBjZ6nVKZYI46RKq/Lm/MpNC/BS
         nsKDbKjEUsVYx86aaaQLbLb5EMwkvY1EqH4G1N0LjYaAL1kI2m7GNiXRCwSMD/X3okMK
         ey/US/BRjyb8fwhUi650iSC3KFCUgL9KjU2I1KTGte+Jhw5T85YWoqoo2J+txX3kDYjU
         HmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAu0VQR4UdVud6DKlwNlrSjlC5pTCUHW/IZc/xZTrPc=;
        b=AclfXLwcDu4BHwLWqyTTVinqRjeGhR/rxkCq8NG7CVCWobUrqTjirxAXRatdEkpGDl
         6OcXj64FHpGsNejo6ENkJo7vzS50Li28cP8oOiGpgJn3B5TNRq3E7CxzUHKEvoA/00a6
         JHI0Ut09POQFeZEGlu+WCCVmI0bnRHsDHcoLBYm8tbQ2JohY8Soh6JvCoe8srgHvsVmW
         3RIivxAV5Dc7pHESp/j5ZthTFiGee0YjIbaaBpqvJu+3ud8Fl7XEhbYJ+cbVkTWHzojT
         M0ajotRllEsMlawDY4b9Jrjm6ossmUAfs5DFi1s9Hp5qZGPA/S0tt7SuCqu2MODfYnJ1
         30Sw==
X-Gm-Message-State: ANoB5pmc8A31oB2xE+45Ir2kiV69fspg8YDcneidg+MoWaDUNOsgRhF1
        YQ/TDKD4dNtdVE8HLPkjdHkjjA==
X-Google-Smtp-Source: AA0mqf4bw1XD++PbmD9XTxVWV77AmKkjp0P3B3WTJluQMkbMWYb56icoIQP65slhPN6afQX3kwv/6Q==
X-Received: by 2002:a2e:a452:0:b0:277:9c2:d5db with SMTP id v18-20020a2ea452000000b0027709c2d5dbmr11285050ljn.168.1669642494654;
        Mon, 28 Nov 2022 05:34:54 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bf36-20020a05651225a400b0049fff3f645esm1706909lfb.70.2022.11.28.05.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 05:34:54 -0800 (PST)
Message-ID: <21a20298-0e95-2185-38ea-0920336f4276@linaro.org>
Date:   Mon, 28 Nov 2022 14:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: split MSM8974 Pro and
 MSM8974
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128131550.858724-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 14:15, Dmitry Baryshkov wrote:
> The MSM8974 Pro (AC) and bare MSM8974 are slightly different platforms.
> Split the compat strings accordingly to clearly specify the platform
> used by the device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

