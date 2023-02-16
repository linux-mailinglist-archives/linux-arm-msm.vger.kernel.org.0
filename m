Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A553C69914E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjBPKcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjBPKcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:32:50 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F1D4A1C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:32:43 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id c20so2196402lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCK20eTXQW6Y2BWSFKVLcgBB4N/DSY71r76AA/HBbFU=;
        b=sJWuwt4KwJV97l3LJMpObf7RRuFDfr8+x48QjcsMp4+xn44sijqelzmpNrcL0EqEv9
         4j6RvaE3FkOZlycLjRZ3dRu4z9kF2l/blAIHpnI2SDOuqaJXM3Cq6J1Yb7MXXlZXeDa+
         5tW2jnzRyBESjPqzzBu84Y4ScvXhQh/iFVaHvnwWdgAhsmwYABU8dBsd17X1brOQTlaN
         HW3RoIvjJQEN/Gsqr+gm5/pAyXhWl5R/n2aLz8UsrnPdZBIhqi4Dsr9p7avthii266Ig
         wdO2RrSJyh8qXwv84culJ5+9nwvFnnU84qddV4cmgdWlcEeS5CQgOO1CMXgFkbnPOqqi
         Z+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCK20eTXQW6Y2BWSFKVLcgBB4N/DSY71r76AA/HBbFU=;
        b=bTmhXQr0MnF2bN+FRT5IsttY36AXitJsQhsIzT1BZibt8z6nl2SATfPB5W3vBiGYz5
         sluGfIULhgxtP+xndzdzmEhDShzWxoyDj0AX4VliPwVOMGVGY5wZx3nL47SXGfYqRkD8
         6NCD6CUfENkhxKQVVP0YgezpFv/Ca4mmI/wwLhHcsAdmtWMPxAtMICW+TDw8viE43FJF
         WMpKleVdSUsLS/B/Ft2zNhmDfdCfMa2+1IpkOMaU5bp4aLJbcGYG2/uehKx2o6FUvJQX
         WwNxCz4db2rNvF7n28I26OateHWaHTuNP5bhfGv7fJw9ncOVhIoW29dgffNVcgzfQ/DZ
         +qUg==
X-Gm-Message-State: AO0yUKVIzbtmhjtuqDZB2q8RjA1cBHCHEdWCw4PHp+fJvKUhNTIXTjz4
        tgm5DxL51ARVcb+WtnLHpcXXfg==
X-Google-Smtp-Source: AK7set/ingP4zgBQJmUCPOUsNQRitk9RgEQ3H0m4B7e4aekEO0gseaAaUEOvDnNGlOcgxZ6a1I7LoQ==
X-Received: by 2002:ac2:54aa:0:b0:4b5:a4f1:fbbe with SMTP id w10-20020ac254aa000000b004b5a4f1fbbemr2037363lfk.67.1676543561403;
        Thu, 16 Feb 2023 02:32:41 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512024400b004db2bda9527sm245282lfo.121.2023.02.16.02.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:32:41 -0800 (PST)
Message-ID: <87af9f78-c1dc-0bb0-870b-c2d6055d828f@linaro.org>
Date:   Thu, 16 Feb 2023 11:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RESEND PATCH 00/12] arm64: dts: qcom: Supply clock from cpufreq
 node to CPUs
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, viresh.kumar@linaro.org
References: <20230215070400.5901-1-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230215070400.5901-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.02.2023 08:03, Manivannan Sadhasivam wrote:
> Hi,
> 
> As a follow-up of [1], this series adds support for supplying clock from
> cpufreq node to CPUs for rest of the SoCs.
> 
> This series has been tested on SDM845, SM8450 and SC8280XP based boards.
> 
> Thanks,
> Mani
> 
> [1] https://lore.kernel.org/linux-arm-msm/20221117053145.10409-1-manivannan.sadhasivam@linaro.org/
Maybe it would be beneficial to mark '#clock-cells' required in
bindings now, to prevent people from hitting that OPP bug?

Konrad
> 
> Manivannan Sadhasivam (12):
>   arm64: dts: qcom: sdm845: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sc7280: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm6350: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm8550: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm8250: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: qdu1000: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sc7180: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm8150: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm8350: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sc8280xp: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm6375: Supply clock from cpufreq node to CPUs
>   arm64: dts: qcom: sm6115: Supply clock from cpufreq node to CPUs
> 
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi  | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm6350.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm6375.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi   | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi   | 9 +++++++++
>  12 files changed, 104 insertions(+)
> 
