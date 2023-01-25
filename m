Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95AC567B0F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jan 2023 12:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbjAYLRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Jan 2023 06:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235436AbjAYLQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Jan 2023 06:16:37 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60D793D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 03:16:35 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z5so16677262wrt.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jan 2023 03:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzIr5Ui2xxlGUTuLwtXHU99c+601cMT3SV6+fGprx24=;
        b=mXzsGMYjP0rIypFgqcTSLrKy57pCvIv1f+quLoShAdqk8WQ4Wf+T2ToYEoQSbstfYL
         cHRFrI4y2uAx1z6hBVBOT318g39YnvVdPD+YWp7nIAGic5uaqbhwg1z/f64Iem8B6Dnf
         1NYxgLHt663JHz/yvvhf4w6tx8PfK9CIBEvvFQ5gPOMmYGYHkjKKigP7zal9itZSlIBC
         CpVigE3MCIoSHLJSWA1KOjflnRRvhduJpoQ4U9jUlAgvEe+6RZVPjbf+tGDCjcO79X10
         6+StulNRrYn8ZuWHNw2D/9nfRSAcQbsnY5OA67vwXIhfqUSW2GCtCS4bSaouirR/Iwiq
         t03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzIr5Ui2xxlGUTuLwtXHU99c+601cMT3SV6+fGprx24=;
        b=iG8RZUS5I4XXehJWoH154nsqX4ba6d7qBDSWMjhBH3RQqxAwUo+fXGT+bD/Mcj/htl
         nBjB9fVuEQw9rE0EFHPo/nJ3RybEuX19QtkI/0G4m1LT8WJ4HNR2dlhZfO/Lfg7MH0xp
         qHULOes6rQRoOzE6gHRv67+FHnPY+a/A5o1kXluJ6vj9aHoEmuMhJBTCr04lRrJZQcYV
         iKFcMzumU1SsCoFEfCwT2/7wpLlsvFgANUc5QwAqv41A2qd+I83LgUk/zkY6I/P0nRxA
         eFD//UGt3DgSDDfOD3PJtwgSO5YZKkyqHmeMmllMk4/buAT4MAnbH6fxPLWX76xgrerI
         mWoQ==
X-Gm-Message-State: AO0yUKW9qBAiV3zAzdF6LQaByfKnapx6QwBuy4OHU+UXyalX8YUKnwDE
        Y1MsVAur0wzzUVU9zfw1Fvz2BA==
X-Google-Smtp-Source: AK7set/zgz1Cw2yR0HRV+XEaWTbyLMisfRos2R7bflijnfy7OtQxq8bhvpAm8gr89yQDKjuuEYYf/A==
X-Received: by 2002:a5d:4a48:0:b0:2bf:ae17:bf58 with SMTP id v8-20020a5d4a48000000b002bfae17bf58mr5588289wrs.37.1674645394352;
        Wed, 25 Jan 2023 03:16:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d6dc6000000b002423edd7e50sm4093623wrz.32.2023.01.25.03.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 03:16:34 -0800 (PST)
Message-ID: <455eb061-ed59-2783-b8d6-7276e7103d3f@linaro.org>
Date:   Wed, 25 Jan 2023 12:16:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 07/10] dt-bindings: firmware: document IPQ5332 SCM
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230125104520.89684-1-quic_kathirav@quicinc.com>
 <20230125104520.89684-8-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125104520.89684-8-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/01/2023 11:45, Kathiravan Thirumoorthy wrote:
> From: Kathiravan T <quic_kathirav@quicinc.com>
> 
> Document the compatible for IPQ5332 SCM.

Subject:
dt-bindings: firmware: qcom,scm:

> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

