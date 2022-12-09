Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B265564865D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLIQPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiLIQOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:14:45 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C55F26AA2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:14:44 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id p36so7750462lfa.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2N4PRZ0R5QB+dpYQc+gz6ykV6COuuBPQXhMdAE79JWE=;
        b=rApEoh1lE899Poqcc+tUHAUvNqZU510CC0xF82fzsN7pRa8XuIYnciE2YxmeKprG+U
         mYK8I4gPTMYUqUoV/xy+6z0uQd0Y9q7wTGXyLWHV4Ya740MuNmyRQYXTzO++4YAXgnn9
         Q05g65R0I5gyH7B10wLHYLBs1p7/HCtox9U7MEIhe3EKabTG34uV4lH061RlhtZTnt42
         puBGKX4bTAxIi0onrMt54QDWSPQbYE+gKC4xbo3FFWaqdqz2JIHf5HU7P75dCTc1lTpI
         F1UGVkZAREGWe3BTeZ2nx3WqqyxQu7EUvW7SSGCFydXgs0vrViiChVLtPNAT6nFI501s
         AlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2N4PRZ0R5QB+dpYQc+gz6ykV6COuuBPQXhMdAE79JWE=;
        b=2NpwrATsXVrE3iqbCgNJlQmpt1H63L03hSP7QSMrkStp31a82qgkO4r0urE9syPVDY
         8FqMDLQSC6UvHc1d8lhjsox9SnUEnii8/4pCwEUsFJ4ofMz5waVdD+cu9gaOQq6gTGkj
         mUneetOQ+lgJfDxD85mDrTBT01Y+4pyJILKUN4FZrC7MeOCF4zPlAFxtbhgXDD04ReN+
         3aTA/nlPh0cBslb4SOo+ThfNMMTXjObcIPWunIE5rFgkyBLodxoVhrGY0GQQhlC28uoA
         uefBK5OHv6eej/R2NXET/KeGjsZFSeTgq4T+3UmbEwp7tkl0FPriGXNRq6YVQKeZJRFT
         McsQ==
X-Gm-Message-State: ANoB5pkAGSWQea9f1MCF8k0eo4tM3mP1H3+/tEjtrX/jrfUh+Kp0QbFf
        la8VA1FFi8+VpLwTfTiOodimKg==
X-Google-Smtp-Source: AA0mqf5aF3zQQHmRAZFnbPvXpL8T9yphqlfAtZnfpFzOtFW322aXLiMAtr10z6VTx8zczZqzqi4ndw==
X-Received: by 2002:a05:6512:250f:b0:4a4:68b9:66d4 with SMTP id be15-20020a056512250f00b004a468b966d4mr2005721lfb.31.1670602482954;
        Fri, 09 Dec 2022 08:14:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p23-20020a056512329700b004b5853f0fc6sm312487lfe.246.2022.12.09.08.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 08:14:42 -0800 (PST)
Message-ID: <74af29ba-0eaa-0c20-ea66-c5636162aaaf@linaro.org>
Date:   Fri, 9 Dec 2022 17:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 02/18] clk: qcom: smd-rpm: enable pin-controlled
 ln_bb_clk clocks on qcs404
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
 <20221207001503.93790-3-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207001503.93790-3-dmitry.baryshkov@linaro.org>
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

On 07/12/2022 01:14, Dmitry Baryshkov wrote:
> The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> them to the qcs404_clks array. Add them to make these clocks usable to
> platform devices.
> 

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> Reviewed-by: Alex Elder <elder@linaro.org?

Wrong character at the end.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
>  include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
>  2 files changed, 4 insertions(+)
> 

No, bindings are separate.

Best regards,
Krzysztof

