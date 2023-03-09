Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 790566B1826
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 01:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjCIAtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 19:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCIAtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 19:49:24 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067575F6CA
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 16:49:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g17so285555lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 16:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678322960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0dO4/jKLnbVzsqK4vMrneg3A9cYIWwDoBeDkVEMbv9U=;
        b=IXAUH0NvtJc8kja5H0fgWPwY/estsQL9b+Bu35J/twtCk2I7LouYVoc5hkVNtB+EPq
         yqTeRveifmengaYFXLx3jODyZwBqkox5kmzH39s2XJaAPb+LcdEET2DJMFET8FyTsJC7
         cwJn89auOjwVCZSMDJuW9MsIiSrHXP/6O1ERoy68nPmgn0jwq26/7MFe9KyvHTpSjeZy
         h1WBXfuj9tubdzpJ/0vGkABcUYKEvth2v4QFaj9fambqqUrRCeeEwVYzl3RVOc+gF5uP
         j6IbAU1pSiEX34r9UNjNBVFiokJ/G/NIs4nCJvwWqOEE/deLX9kfAFxuSKyXIuiwMQcD
         nFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678322960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dO4/jKLnbVzsqK4vMrneg3A9cYIWwDoBeDkVEMbv9U=;
        b=QR9dH3EvPU++fWwTAYJ/B4gbVw0j0Kj3LVbrF6c1UNndKudw9mP7FXyguydY9cY4lU
         FNAcWbqBgSpW2Z+U+oYgaBJlN5KpAzOa+ncBcKjWnTWWpOyRBaPx9z2SLG2eHWwTxHym
         uvxk1RWBGz9lLImi1qsDoqDSIAjGRQkye9E9jmYiwS/h4J18oVOvTk9xM3ctK8IFafxA
         YtaS5AjkkQfm8ipYOI14F+EJFEqoj4tQirAPnArldy5QUil4BBrX8meTO8KZiw5Ha9GL
         noz+BjnGpRmFnfcIDeFeKu1eIo7cTNwzlidP5aW6H40ZRK80R0hC6B1Srx7DsQPs85V4
         n4Vw==
X-Gm-Message-State: AO0yUKV955k/I+JYY5EeJlx6Am42mP+vPu1MlKq+ZqJm7JzKTdfTk11G
        lDubnyDd8Par8HdUcNnY+4szPw==
X-Google-Smtp-Source: AK7set8oE940LL8AuYdZyF+I1mLC/GsH/uKS9ijFv9Lvi0BRk/MmVGMIxbKnAk8yMGC6u9B2aNiL6A==
X-Received: by 2002:ac2:5215:0:b0:4d4:fcdb:6454 with SMTP id a21-20020ac25215000000b004d4fcdb6454mr5141139lfl.17.1678322960094;
        Wed, 08 Mar 2023 16:49:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w30-20020ac2599e000000b004dc4b00a1f3sm2493769lfn.253.2023.03.08.16.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:49:19 -0800 (PST)
Message-ID: <4fd4d2c4-ab1f-6503-1ca8-da86fcec9441@linaro.org>
Date:   Thu, 9 Mar 2023 02:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 05/14] clk: qcom: smd-rpm: Make
 DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
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
 <20230303-topic-rpmcc_sleep-v2-5-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-5-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> In preparation for supporting keepalive clocks which can never be shut off
> (as the platform would fall apart otherwise), make the
> DEFINE_CLK_SMD_RPM_BRANCH_A macro accept clock flags for the active-only
> clock.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

