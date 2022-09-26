Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88CB15E9EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 12:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235023AbiIZKKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 06:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbiIZKJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 06:09:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6521B3CBD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 03:09:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so9988992lft.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=NiDFW7j0aeL8AhvqVkURIdFDpKhhYD3BHp+Ep7uI1Mo=;
        b=algVzKxCsaBbYi1rNqmaIxikqU8hTcFyl1WhknMAGmvlZ6VEQvu6ryDp+TZim52fef
         Mx/Q+jIeIxBBvDHYpahmL4/JQNC8BQ54jT3bfnsoAz7/7pX8Aggr7Q15Sz86/gBxOoEQ
         F9fqfrO2yTQn+0RrfLzx2JhMrOHhdpkMYwUPnm1G4Q4AXfMtqMU3+7N+OEHkRgJW6d/5
         D+0Qk2BWETD6WwKclB4/XUqx+6O1oXCG+/M38BFmbihssY0tTRkKNia14IxscgxkNsXE
         zaZ9Ap2hxfbCqH3T2DxaRo/+N9x2V8BH8caTwy+RyeRwniia2w/hYK26yrkwTi+2Y8Qv
         DySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NiDFW7j0aeL8AhvqVkURIdFDpKhhYD3BHp+Ep7uI1Mo=;
        b=FRXu27cWIuZKtw5UprYl8SeT4iVpBIUjHr279OoEmFKFsUhA8+mUP6q0zZpdV7+8yz
         fk/8ADeLJa0Vr2Xz4wunB23JJy4nvu+htpfCUu4yjNrTzYdnNt9iMzpCHA4nn9cRnMaS
         rNScH0PH14xTlgocuJLcVSLd2QfhK4SvE/avG6iyybIZMHBbCMvTSaHZ6vUIR7qILMhp
         BeRNLHhBi7T2QHVXYmXD6smkN7PfmhjPRKyrlHnz/G9DTp/cnI17NMWSh5ITpEztS4Lk
         0NM46Bh8FXOeT9Uj7188UjOGk26qBA4Yddv0a5XHKAgCN5Db1esE9Or6F5O103pc+bK+
         /xmg==
X-Gm-Message-State: ACrzQf17WMg+XnKc3oMkQu8/Qjgb2E2C1yY4wNmsQNwSyTqrei6UOGjR
        VbRNrHYm9qU6p3eRN15ZOPyi/w==
X-Google-Smtp-Source: AMsMyM6HCOqYbhXlG+PayyewllNWiljEgCvTUTi58rKNFUbrf/36OjEHb9PJnwENTJDUq5/1bbIjCg==
X-Received: by 2002:ac2:4c4d:0:b0:49f:99f0:308f with SMTP id o13-20020ac24c4d000000b0049f99f0308fmr8690149lfk.160.1664186964761;
        Mon, 26 Sep 2022 03:09:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r22-20020ac24d16000000b00499aefcf68esm2477468lfi.292.2022.09.26.03.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:09:24 -0700 (PDT)
Message-ID: <642f9bca-5e9a-4971-3cec-32963bfd88ad@linaro.org>
Date:   Mon, 26 Sep 2022 13:09:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: Align dsi phy-names with
 schema
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925172443.92900-1-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220925172443.92900-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 20:24, Luca Weiss wrote:
> Use dsi instead of dsi-phy as required by the binding.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 620900e5ffd5..da247d799492 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1571,7 +1571,7 @@ dsi0: dsi@fd922800 {
>   					      "core_mmss";
>   
>   				phys = <&dsi0_phy>;
> -				phy-names = "dsi-phy";
> +				phy-names = "dsi";

I'd prefer to merge [1] instead

[1] 
https://lore.kernel.org/linux-arm-msm/20220907000105.786265-1-bryan.odonoghue@linaro.org/

>   
>   				status = "disabled";
>   

-- 
With best wishes
Dmitry

