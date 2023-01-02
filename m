Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B88C65B1E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 13:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbjABMUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 07:20:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbjABMUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 07:20:07 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D7BE8F
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 04:20:06 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p36so41338877lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 04:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zx4h7Eu/Z/hfAAIzZ++X/qRMCClWd1JQ6yVqol4cOQg=;
        b=O+DoTsF2EhbsVrfsJd0sHlAy8bN1xhI5UKBv6BJ1E6hYFkHfrH3YG3YsZYgqi0A5IZ
         J/tbyfF4kOizk/8pQpS7rGcEzrdkcRXaysrlq2wVSCOqpdbesSsYUjBszIZ7jEC7rIH2
         RSojqQZ23NP+dr3KlCIRwWGbAYWjYGF1L52LlGUuZT7BTQUizgFU0W2X4JHLGXwK+U+O
         uRxNA35a9P0n9qmQ/lxSk0Y5DTiznPTRFYFgzPjzrIjCLbOdLNlUs1whGCuf3ErfVf/J
         6gk4/c392m6Tkq9dNj5xQKjB/klGSRuM1x+kcgwWTDOstdi5g5f+KtcrYesX/vQd5E5E
         V4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4h7Eu/Z/hfAAIzZ++X/qRMCClWd1JQ6yVqol4cOQg=;
        b=fPTWi13pig/zuoK0Mnco272FPbMon/AVTmZ6oBmE4Rd8giUjW4o1NwREFsPI7OP5+R
         Wp4BXUxmLXlPQ+m/wywtkcr3qyf2KEU1nRlBzjwXGq+V4upn1nuzE/vv/L8BpHu6+vXf
         zUkoxMnqNGPEeK5LJW14yrCuV8JPzWMAgLwBVVsr0IYtJElqbOAsBR4szCJWjrvrCbJ0
         XLhh87vR36BtcNeCRrN2+W8rr6Sq3eiqlzQDVqq1ydb5uYBo2AjuG1GmdcSadPj5W6A4
         0m7BbgEfac9lMEy4OWypVKzbzfFkZdxwFBP3u+z0fOtA6E5IYqxK0I8qn/3QghqbWuxt
         z3dQ==
X-Gm-Message-State: AFqh2kr2xTWhuBA4aC+18+KSchXdLpbwBqHU6ySxt8o6XZ6gwX+Ssv0d
        ngg8ChfVRkrbD/KnJeZ3k7YO6A==
X-Google-Smtp-Source: AMrXdXvREnsHDOjNMDvSmsE/b74+iIFFVAx3+KBVJKkc02n3AhsyMtiWtdyR2d9/Ccm75LdKj3vEbA==
X-Received: by 2002:ac2:5394:0:b0:4b4:e2c9:9b25 with SMTP id g20-20020ac25394000000b004b4e2c99b25mr10850383lfh.44.1672662004622;
        Mon, 02 Jan 2023 04:20:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b004a4754c5db5sm4466644lfr.244.2023.01.02.04.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 04:20:04 -0800 (PST)
Message-ID: <1a8226ef-b16c-e713-94bd-807ca356ef8b@linaro.org>
Date:   Mon, 2 Jan 2023 13:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8250-mtp: fix wcd938x codec node
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230102105038.8074-1-johan+linaro@kernel.org>
 <20230102105038.8074-6-johan+linaro@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230102105038.8074-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/01/2023 11:50, Johan Hovold wrote:
> The wcd938x codec is not a memory-mapped device and does not belong
> under the soc node.
> 
> Move the node to the root node to avoid DT validation failures.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 40 ++++++++++++-------------
>  1 file changed, 19 insertions(+), 21 deletions(-)

Don't you base on some older tree? It was alreadt moved. Maybe other
changes were also implemented...

Best regards,
Krzysztof

