Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20623597F03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 09:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236210AbiHRHLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 03:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiHRHLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 03:11:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB40895C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 00:11:02 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id by6so849478ljb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+rnA565YBjndtqaMdwo66Drww20U6UhPrTonHQT5gKQ=;
        b=k7IXjunIwYEqdOAr12PHz8M3c70nfnrK4zYNyRbDjrl4cjPdJwC/1+zd+C/71kN91U
         P4107Thv7DbJeCMl6MCDRLubbTrDSCxdCGrwK/HTf3X21UMogZKHzHkxckmOBfnuvg7p
         /DZHD8gTTDiq1cE3t03skfD0IoC2A9Qr4jxQfBaoJ80nXtgcHIuD5i7F3+cibP7Qpsly
         gZvWE88j4LYy6XbnA2y2r6o/2+OBM591cVUMJ9DFejQJGFvvsym4qwpsm1T0cKFJ9pXX
         gr7kZS2qgr0bPGgT98bRh0nUNIO4lpGp5Lkf740fAK4530zHzb1udBJBcKTFeURBAgbD
         dJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+rnA565YBjndtqaMdwo66Drww20U6UhPrTonHQT5gKQ=;
        b=aB1kf8vJb9NV9YgcM/IzdnI0AobvgdFRF45f8qgRpAoYoUkzi5GNsmObjiw6qoWuFR
         2sXKp2Ice4RjZ8FBxf/w+yEg0OYMSQXMKTMIasSeFtS8E+9yGgxSnSlJSMDsytebomfw
         3NZmGLnCJyd4Yf1rQJ5Wu2j4fMD//TnrpTHfKK/kA8hbT5Poe/7fLq70SQak71ZRR2vZ
         Wr85Ba7tuN8Hxv3E0OAF291faNzZJenvQnxP6wxodrFsbpBmAkcC9MXh/4avkSLkbhOW
         ll2ezGtH8B2626QDAiWtENWcvOGF40SCoZBE0D7GsR0JUfGgktzShuloTyyHv+K4rjd/
         73jQ==
X-Gm-Message-State: ACgBeo3DPM9RHtwKz7dFxzUhGh9Zy7vMaS0GMVvw9J0Z9dG7fwJSint7
        6VQCnsNBZrat8AeSkonihEjeEQ==
X-Google-Smtp-Source: AA6agR6HbPKco3uxBpRnoMRc6bHUrXBG7FyHXnKraydyohUNOberY+aa72vSYtFtTnHqXJoCZh5BmQ==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id g3-20020a2e9e43000000b0025dd8e97b15mr492873ljk.234.1660806660498;
        Thu, 18 Aug 2022 00:11:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id m1-20020a2e8701000000b0025e2c6b15e6sm105103lji.72.2022.08.18.00.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:11:00 -0700 (PDT)
Message-ID: <20e5bf2c-9ac0-1c99-b0c8-f2aa50d8a739@linaro.org>
Date:   Thu, 18 Aug 2022 10:10:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/5] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-US
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220817202609.v2.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817202609.v2.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/08/2022 17:57, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
> 
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..d4bc791 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +struct qcom_reset_ops cx_gdsc_reset = {

static const

Best regards,
Krzysztof
