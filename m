Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79538748172
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 11:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjGEJux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 05:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjGEJuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 05:50:52 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8CE1710
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 02:50:50 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51dff848168so5323153a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688550649; x=1691142649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIyqw6m09ddqkCui/Nt2tEvaCWZFbS9hCTFMjGfLdyU=;
        b=MqGfcvTkhScX0/zDT+eVKM9VdHosQEe2spTvQ+uYeYuLMjIXGmCdEWdFligSWQtmaj
         uwZVX/2hHoKk44fqOJ6ZKREz8eQ2rs7Clibjer0BI0wkLPrFi+jWfI86VRowT/vskpQj
         MZIPyzNP+g3HLqjBITqMsvbpz5U5/6Vv+u7DQrLkTvtImBel1frlpX3deDKuYS+c1qhn
         8kgiNXshnWd+d4tqH/9mSFxWJV0JwF6tZ1umwFUoxwRLjhn6c6fNcflmGCY5pA7RUAQs
         p498AoUaxiSSPuCJ0MISTAnY67PhE5+ntLxYksyd598mm3A4BEme1c7C5HvdqefQEQEd
         ZxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550649; x=1691142649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIyqw6m09ddqkCui/Nt2tEvaCWZFbS9hCTFMjGfLdyU=;
        b=IDlF3qH02ZitDxx7/07dvFqC+ghZR1al++mtWqO4wh8rfzqm/4U1tdjE+k8xslW82w
         8ha3TpvM4ESeRh0vdca1R3zG+U4YV9WMVXPpotvBAGRvGPNB8T136soj6H/+YX0dY28b
         nd1BTfFlzu7/gOkWmOCNfCReqNF6WQLfpujnI8PT/num1ZVn43+Gf044hfzPJTFkKOnQ
         TaK2L57VspmEleLDX7BrIIw+KZZNlixQbYJLrw1pDq+Jx8o8b/X2ni0SmICzC+S5FL8T
         p3irzAZXESd9phf61u4te55QaSBa4yjgtTNAthi3bFNaWIceiwtwXucDFhtRul+sgWZc
         HXzA==
X-Gm-Message-State: ABy/qLZFMoeCYOBRvFdrBR9IIJZpFw4LrsruZsCX49HWfKa0HwkW94jF
        sRsli9orHz9quHxWNDx7cYY74g==
X-Google-Smtp-Source: APBJJlHet1U6TmRXzw6lGhf52OMeeMeVfprm0xMx8KVv0by9glFt2nOEdJLkUQJQtGmqqWbhMDnjOA==
X-Received: by 2002:a17:906:3955:b0:991:bf04:204f with SMTP id g21-20020a170906395500b00991bf04204fmr11597371eje.60.1688550649141;
        Wed, 05 Jul 2023 02:50:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906065500b00993928e4d1bsm1701884ejb.24.2023.07.05.02.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:50:48 -0700 (PDT)
Message-ID: <9f8e364f-be48-75ff-ff5f-b4c646d920e0@linaro.org>
Date:   Wed, 5 Jul 2023 11:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] arm64: dts: qcom: Add SM7125 device tree
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        map220v <map220v300@gmail.com>
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-8-davidwronek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704163848.169853-8-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2023 18:31, David Wronek wrote:
> From: map220v <map220v300@gmail.com>
> 
> The Snapdragon 720G (sm7125) is software-wise very similar to the
> Snapdragon 7c with minor differences in clock speeds and as added here,
> it uses the Kryo 465 instead of Kryo 468.
> 
> Signed-off-by: map220v <map220v300@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7125.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7125.dtsi b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> new file mode 100644
> index 000000000000..8d7a745014db
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, map220v <map220v300@gmail.com>

Really? No "* Copyright (c) 2021, The Linux Foundation. All rights
reserved."?

Was there originally, so I wonder...
https://github.com/map220v/sm7125-mainline/commit/e436882505300b41361c18bbd8516db543f7f07c



Best regards,
Krzysztof

