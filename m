Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBBA6E98E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 17:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbjDTP6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 11:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbjDTP6T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 11:58:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD35C44BA
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 08:57:57 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2a8b766322bso6077261fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 08:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682006275; x=1684598275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNUf+/1kABmy7fyuOrfNxFVz/b750ayYzUND39pLMfE=;
        b=gOzPqTG52EcJJcC8fSMrLBACgoU65xT1Z+2PjNPM5cnkRbYSCM9JE5KV4kM6VHLMD+
         m/cGI6Q7aQc4PWxGUHI9ii+DnQOezZgZ6e5RFr+OOsCjgmPIU/Rpnrt+MoyUW1J32WAO
         7DjiXhHxpe5rlclutblk1w9ENYHmCaD9M5cJ2AnL18YIxDMs265nUu44Qkzdsv+f6dkZ
         8xqreK1i0x72eG7mKXPs2hZASBf9YxBwKtht08gqQxYSeSAxs1U+5qqQjFEea/9X/t2n
         aX8Bajyb+mbUKSd5Fc44amn3GVSbJiZCNf8kaEdrUy+0I67ioo5gNgOvCFrMBsb7mCOo
         9QyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682006275; x=1684598275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNUf+/1kABmy7fyuOrfNxFVz/b750ayYzUND39pLMfE=;
        b=a4oHmBJU23X27Y+VFYrvrq3C/maU0T1v7YoG8TkDKDAId3Nbq+uWgSpRIxOrm1T8e1
         sm6Foa6SoMNTp4MQfdgFPSEsZIsQqsss2VJSjuuEfDdRJShR+MuUAb8IU4jnWgiBkT9u
         tXX1XspSM4v6VCazamjeOKhvWM+lbKwHl97YHyamXN3V5uZwiAblor1w3qp4YqjFqFVZ
         jtUXBpcF7LHeuUb6FSR7RLOVD278EXeafDu/4yqRWrxx8DHkDIC0MWu38IN+oXAWCV7a
         YN1bYtakvUjo4GR/yo0raUH80DPJOpk397vF5AGEWZgHMyeU3UWr/BTu3ntKL0kIn1kk
         zA6A==
X-Gm-Message-State: AAQBX9d7dR9XgB/9/fw1h8fPfxsMJhhqz4abSDMTH+/cHwI0qW0S2mUS
        tDFEBdyH/yApyR/ElmEaKOKWIg==
X-Google-Smtp-Source: AKy350arn52bKLxZfJWKLLKPNIrb1lNv+4X1nIWe0dPWFxR0J7UgHvmPzDdNeiVmfrlAhRPBheO41g==
X-Received: by 2002:ac2:490b:0:b0:4eb:50ba:cb06 with SMTP id n11-20020ac2490b000000b004eb50bacb06mr669625lfi.49.1682006275410;
        Thu, 20 Apr 2023 08:57:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id d2-20020ac25ec2000000b004edc4928f2asm255230lfq.71.2023.04.20.08.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 08:57:54 -0700 (PDT)
Message-ID: <e3bd41d8-f0c5-6756-13bf-bf29c786ab5c@linaro.org>
Date:   Thu, 20 Apr 2023 17:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 00/14] SMD RPMCC sleep preparations
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 22:35, Konrad Dybcio wrote:
> v1 -> v2:
> - Use CLK_IS_CRITICAL instead of leaving a clk enable vote, expand macros
>   to do so
> - Fix the keepalive clocks for 8998 & 660 (CNoC -> PNoC, it was
>   confusingly named cnoc_periph downstream)
> - Introduce .determinte_rate to ensure we don't set keepalive clocks'
>   rates below 19.2 MHz
> - Add a (!conditional!) way to test the ultimate goal of all these changes
>   by essentially enabling unused clk cleanup through a dt property (for
>   legacy reasons)
> 
> v2 was tested on:
> 
> - MSM8996 Sony Kagura (can disable unused)
> - MSM8998 Sony Maple (can disable unused with OOT icc)
> - SM6375 Sony PDX225 (can disable unused with OOT icc)
> 
> v1: https://lore.kernel.org/r/20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org
> 
> This series brings support for a couple of things necessary for the full
> system idle on SMD RPM SoCs, namely unused clk shutdown and keepalive
> votes (permanent active votes that are required on certain clocks for the
> platform to function).
> 
> Tested on MSM8996 and SM6375, does not seem to introduce any additional
> regressions.
> 
> Keepalive clocks for other platforms were gathered by digging in old
> downstream kernels, please give them a test.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (11):
>       dt-bindings: clock: qcom,rpmcc: Add a way to enable unused clock cleanup

>       clk: qcom: smd-rpm_ Make __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
>       clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
>       clk: qcom: smd-rpm: Make BI_TCXO_AO critical
Stephen, parallel to all of the discussions, would you be willing to
take patches 4-6 as they are? XO_A being critical is something that
won't hurt without the rest.

Konrad

>       clk: qcom: smd-rpm: Make __DEFINE_CLK_SMD_RPM_PREFIX accept flags
>       clk: qcom: smd-rpm: Separate out a macro for defining an AO clock
>       clk: qcom: smd-rpm: Add support for keepalive votes
>       clk: qcom: smd-rpm: Introduce DEFINE_CLK_SMD_RPM_BUS_KEEPALIVE
>       clk: qcom: smd-rpm: Hook up PCNoC_0 keep_alive
>       clk: qcom: smd-rpm: Hook up CNoC_1 and SNoC_2 keep_alive
>       arm64: dts: qcom: msm8996: Enable rpmcc unused clk disablement
> 
> Shawn Guo (3):
>       clk: qcom: smd-rpm: Add .is_enabled hook
>       clk: qcom: smd-rpm: Add .is_prepared hook
>       clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   6 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              |   1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 133 +++++++++++++++------
>  3 files changed, 106 insertions(+), 34 deletions(-)
> ---
> base-commit: fc31900c948610e7b5c2f15fb7795832c8325327
> change-id: 20230303-topic-rpmcc_sleep-d67aad9f3012
> 
> Best regards,
