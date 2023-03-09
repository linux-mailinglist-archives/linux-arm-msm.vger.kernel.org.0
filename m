Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8506B1821
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 01:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCIAtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 19:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjCIAtD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 19:49:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4F269CDF
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 16:49:01 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id b13so216471ljf.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=igEVtCv0Yun6uztxoSl+D0xNhXh8MI5zoU21SDQbQG0=;
        b=V/QU1+McEoNI0Pfi33CLU2ga7Ft38nhwIKGP0vuHVpxEXmUobSZGkp0nL7H+/bOxCL
         RsfoBTOM0PTItOhX6e3QL3EfMieWXTzEar5cFEoNG4UopGTquWZPFJq0hiQEMBlBoLQu
         xsDZucXDdxCUp7De4FNyH6MUuMO2cTu4O2VPzyY0ptxNk4HpecPlcE0Mu/QwmIra9jN1
         FpIXeo3SDZbOBSk/jw27ij28YiYw6TEyEALCpZw1azJQOuiLRE9ef1PARPaH5mqcvgr6
         MoQGOYmGKq/4Cxh+Kb7VNlgU7p/QqgKL24YlLi4tpR0Zr9kSLfYRnvZ2mnL7d+MhRQf0
         48Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322940;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=igEVtCv0Yun6uztxoSl+D0xNhXh8MI5zoU21SDQbQG0=;
        b=PJTkG8MYNAWeEb/kR5pViLBKQ1j3Mb+C8XGuUDaEX5jO3L/RYVahODsbTO3chUlfBH
         3hV4g5BrFrlEKEqOfGgCUaqWrZNrvYMwqaYilGx2uoAAOa8siHZhZT5FoCGSaJkAQH2D
         /hHUkB/KWDjxE6w/cWlGLa1oorp+/vD6CJ+f1C55WEU5QDaxKhfHSK4GmyIop2bC8ezb
         9EmviubMTh0xJxTkQ3q6RmrhbxBJFmgP8blo6xDr7h4BUflADoxzVMTox5x56pBwu4pB
         1vENvYF5HTx3WkZ0h0nrDJOEh7Z9LRBsP2nIMJkpdT5f5qrJopdS9QfS4ZeDwOYQfFyF
         zTSw==
X-Gm-Message-State: AO0yUKU5qDqirQaOk/YBxFo+k6ILxaHkkgD7Rd0sIrbXn6VfIYMrg3Ah
        QnBiVxZ9ii0ZhA616TC2rS3a7g==
X-Google-Smtp-Source: AK7set+s4E9sI6MCIb1Plra3PVeHE9gylCv4Co5ejVzav4C7e1S1vavpawpRj+KHafIdqyx3ZUhqZQ==
X-Received: by 2002:a2e:9243:0:b0:295:a313:1365 with SMTP id v3-20020a2e9243000000b00295a3131365mr5810541ljg.3.1678322940206;
        Wed, 08 Mar 2023 16:49:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d16-20020a2e3310000000b00295b1afd27bsm2674916ljc.66.2023.03.08.16.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:48:59 -0800 (PST)
Message-ID: <557f5eba-8062-fba0-11c3-9abef9c7325d@linaro.org>
Date:   Thu, 9 Mar 2023 02:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 04/14] clk: qcom: smd-rpm_ Make
 __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-4-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-4-ae80a325fe94@linaro.org>
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

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), make the
> __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX macro accept clock flags for the
> active-only clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

