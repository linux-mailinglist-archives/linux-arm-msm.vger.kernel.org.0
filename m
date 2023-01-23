Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0361D67824F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbjAWQyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjAWQye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:54:34 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032ED2BEE5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:54:28 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ss4so32098016ejb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyX82vPOIRaw0yggTWaq/3Oo2qgrAU1QHXC12/h8UuM=;
        b=LamCiot5hB6BVO5B1VXZ5MS0c/JvLaOjLQeDSVNpskuf5oBQbDVS7E8ozhg6rq13Fy
         TBkI/vGgUU98w+PV2UxC0ZbEmNW5HDeQqrpxbXp/wh32gaAjlT96qS+kIXRoE7NglTNA
         xssya8cfnCmCwMFY3pTYVu7L93hXoY/OUeECTaYDp3/KGqrahgfXMMy3cPbQxmWHtYze
         T7IrPOAYSPgmoHePiJFwtGEtuMgbylwza27fswd5Jinyi55bA6HESkYtc6kxNfg7M3jK
         LHM0+e04BONm4Lgxw1Dlel/EhZ+CPQAt7Az3+xFFQwIxCTDFGIU+qkJxy2ZbEttRlGGV
         cOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyX82vPOIRaw0yggTWaq/3Oo2qgrAU1QHXC12/h8UuM=;
        b=My9RP4iLhk8D21QFglkwL5bIQQmT5TJtX9xn+yFvmCM3trjeGit2WpyZAZzdh2JuI4
         2Bb1hE4VrjGeaDv3KU1jsEI+JtQyb/5pzSNP+4Qsi1aBcUBOnst1YXwnlb7FoSwfmXk8
         qimpLmGkwB7xIAVJ+6GxaCBvv/jQPO9nIoB8aXc43hzG9w5mhpe/BtvEQw61no4PDi1V
         oenrOg5ACgx4K2AaKkS/uYxNPbLzt3ZPe1HPMcSqBYcEl4gKNazG8DQce3Chd3FZR1cP
         6DOypOJebIGIxi+lbbRLY8uYxEs/wv4K7bySC7TVD97w7qKg9fwnq0uNekPM5sP+uknK
         BxCw==
X-Gm-Message-State: AFqh2koxXAcmOfS9fEX6EpfMciE6Zjv67n1jfoMaSyn6hXfTZULkA7oy
        S7arelQOTRJjRfe+5p1MEvLi0HGjvPmm7rHm
X-Google-Smtp-Source: AMrXdXuat4el3JVkyiVnp3ON/Xi7vGPmjkA5PhNHDy0zakGSNqull5jgcyTzrbtHPeYocp+lLOIL2w==
X-Received: by 2002:a17:906:80d:b0:870:d15a:c2e0 with SMTP id e13-20020a170906080d00b00870d15ac2e0mr26386260ejd.51.1674492866576;
        Mon, 23 Jan 2023 08:54:26 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b007c0f2d051f4sm22219862ejt.203.2023.01.23.08.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:54:26 -0800 (PST)
Message-ID: <5ed7735c-5160-e6e4-6558-d21a269fbe64@linaro.org>
Date:   Mon, 23 Jan 2023 17:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 2/3] ARM: dts: qcom: msm8226: add clocks and
 clock-names to GCC node
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
References: <20230121192540.9177-1-rayyan@ansari.sh>
 <20230121192540.9177-3-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230121192540.9177-3-rayyan@ansari.sh>
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



On 21.01.2023 20:25, Rayyan Ansari wrote:
> Add the XO and Sleep Clock sources to the GCC node on MSM8226.
> 
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index c373081bc21b..42acb9ddb8cc 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8974.h>
>  #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8974.h>
> @@ -377,6 +378,11 @@ gcc: clock-controller@fc400000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>;
> +			clock-names = "xo",
> +				      "sleep_clk";
>  		};
>  
>  		mmcc: clock-controller@fd8c0000 {
