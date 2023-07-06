Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A35974A0DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 17:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbjGFPZP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 11:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbjGFPZO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 11:25:14 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA561BD3
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 08:25:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb73ba3b5dso1241210e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688657111; x=1691249111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJl/0/9xQ151pA7EQaYuwKcI32jLfszVuHzUMtxXLU8=;
        b=Ki36pJK5EjSVaPCd0DAzXjFEsyqnbeNkokoEcqzxULXzNUhYbGu1lMTKDZ10JelpgM
         Ll9Bs9Y+OngSz/1vEvLF/4xjX3stKSX2JgYaahC4rF/WlUHPxDgZdM9N90nZocnY3RN5
         2wtd45N8QPAmX1r9DjFG3bfJsknd+qk8aSy9Mqg10krizp+kMYfYpPApfRYmdQAtxDAA
         jtX/3qbS9Q7tsAP84Be+1jwtJsKp4qYPj9yugNmAugfkHA6tH9CaLaO7wzqNH0r+wqTJ
         HN9O0SdX6ntvapsksn2yM582JPyZkDO3xCSfxk2u3qOGE88mm1OpH38wMnqBYbTk+Hwi
         rFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657111; x=1691249111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJl/0/9xQ151pA7EQaYuwKcI32jLfszVuHzUMtxXLU8=;
        b=PcEkhUwff4ovBOYG5TXsYDYqfKyGZATKcbf7TgmJ4x4xAzPT1ly4yB6unq7uxwy72d
         7rP/ecmgGzT9l5Y8HPqKyGPZDVaJme3CfjOAbr8XMO4jUBPROdDV8873dIYSRX2pXNx7
         fwQHYxeJMPCgcW7payWG3KZlUkR+a2q/zNsrj3XEtCuX4aX2axeE5C0ViexVFuA2/N12
         UF8EqfL+FcqUKnDmqQlh2aKaNffTPX2umioXqut+F2nrCbhTfebC2HuRwfL52cPVcj10
         BHgkE6s5bNNvXJovimjIx9L1gAYn5nc/EhL8uUDznixQBd9thm+Zo3YsTYoFgwFvirxM
         4dlQ==
X-Gm-Message-State: ABy/qLYJVQQRsGbqrlI6nJ81BUM66rUvmtD8IiItFDHCr2yEnS7zZ0AP
        S9WsqxsZqe22Pdu7hOC0g1/jyg==
X-Google-Smtp-Source: APBJJlEZ/gdnD/GbDm1z4H0H9RL5iikB/8HOlNGQcfeAywLJPtOaBnW32eA6tDEfW2Z49/JsxRYQuA==
X-Received: by 2002:ac2:5b1d:0:b0:4f7:6976:2070 with SMTP id v29-20020ac25b1d000000b004f769762070mr1750493lfn.40.1688657111297;
        Thu, 06 Jul 2023 08:25:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id q27-20020ac2511b000000b004f76684329esm293572lfb.234.2023.07.06.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:25:10 -0700 (PDT)
Message-ID: <021ad5b4-772d-f2f6-f9ec-bca06db04dd8@linaro.org>
Date:   Thu, 6 Jul 2023 17:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add SM7125 device tree
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230706124339.134272-1-davidwronek@gmail.com>
 <20230706124339.134272-7-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706124339.134272-7-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.07.2023 14:40, David Wronek wrote:
> The Snapdragon 720G (sm7125) is software-wise very similar to the
> Snapdragon 7c with minor differences in clock speeds and as added here,
> it uses the Kryo 465 instead of Kryo 468.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
Can you please paste the output of `dmesg | grep "secondary processor"`?

That would let us determine the unique identifier of the cores.

Konrad
>  arch/arm64/boot/dts/qcom/sm7125.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7125.dtsi b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> new file mode 100644
> index 000000000000..12dd72859a43
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include "sc7180.dtsi"
> +
> +/* SM7125 uses Kryo 465 instead of Kryo 468 */
> +&CPU0 { compatible = "qcom,kryo465"; };
> +&CPU1 { compatible = "qcom,kryo465"; };
> +&CPU2 { compatible = "qcom,kryo465"; };
> +&CPU3 { compatible = "qcom,kryo465"; };
> +&CPU4 { compatible = "qcom,kryo465"; };
> +&CPU5 { compatible = "qcom,kryo465"; };
> +&CPU6 { compatible = "qcom,kryo465"; };
> +&CPU7 { compatible = "qcom,kryo465"; };
