Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF4D69AA6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Feb 2023 12:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjBQLa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Feb 2023 06:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbjBQLay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Feb 2023 06:30:54 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2567666678
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:30:51 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id eg30so2858673edb.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Feb 2023 03:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
        b=aehxZ5CykYoBS2jaabbw30nhDFy3UgG8JrMBcuCW9O+YfUDXX6pii39H9ZcsznmI1T
         qf0FIqy5nT4Vtyt1PUYw0p0mdjCqrE194s+qPTnYjcz9lOHEv0JFVI5Ft/E78PGv+znL
         tMbqplbJwSJuUQAtUvbt1K60YRqjtbk19LcPXiSL+Iz8lwR3vDrrKUgtWCyOoYdeYKnz
         iHccbkLF8IwPh0kXY67uIoE6niDS8GrW1gClhouoUQLTgDh3eo7A8H2e12XT5WR/rSIB
         F8NxsCcQc/OCfpVjei6rL8Z9wY7V3JX0fgvTzUcVD4d3Plimk8AUeQh+r3Cf6NAdf6WO
         j5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v92NiBIjYWfziymAkr6wLKbvWDe+7TdVnIlek7VWKg4=;
        b=Q2GO9/oaXAHb3mEhMNUAO7aBWEEr/2iQqtV8XE9WupTzTxFOgFM7bnWVMTiuXwVENh
         ZL0Rl06PInlnT+BpUUCpaVd/nKDhGDEmlcZhnjny/JnPmVWMXmsVl22apg31T2XP1gZo
         Ll9/jjY8a5dWg2fbJ+kcjL4jM2/TZoWvhRO0qk2Q1FmOdboH6VeeMxhsgcqNK9ouXPwL
         0uu0eKhinaXtpcAQ1uDiEZ8jSGeN1kNftEmL47sjS52p6vcR6JJUF7yz0sesuznzsbJ+
         8OlXchhCH2TXah/Bf5GI+DH+Sklkoc20yHg+7ztxGbFhpiTgnpLe04IN+Y4OMYleZoWd
         7vJA==
X-Gm-Message-State: AO0yUKXfAFZm0XuqYL3s4YESQatp+zHpuD/wFy5Cl/pZ0rw19HXlwi1Q
        gSifvh4B1efc6aPbbQ6gB5Hs0A==
X-Google-Smtp-Source: AK7set9c3OK+BsvdM7YtkZ7FTNv0/+Gz+O1m241k5kxQLoB5GvCYK2NYpdilFc927EHUrqk1h15vqQ==
X-Received: by 2002:a17:907:6743:b0:879:d438:4d1c with SMTP id qm3-20020a170907674300b00879d4384d1cmr11441762ejc.21.1676633449765;
        Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b0088c224bf5adsm2039261ejm.147.2023.02.17.03.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 03:30:49 -0800 (PST)
Message-ID: <0284de96-0dba-9336-67f2-d70b5bede8a1@linaro.org>
Date:   Fri, 17 Feb 2023 12:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <20230217111316.306241-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217111316.306241-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2023 12:13, Konrad Dybcio wrote:
> Since the DSI autodetection is bound to work correctly on 6115 now,
> switch to using the correct per-SoC + generic fallback compatible
> combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Depends on (and should have been a part of):
> 
> https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
> 
> v1 -> v2:
> - Deprecate the old compatible instead of removing it (Krzysztof)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

