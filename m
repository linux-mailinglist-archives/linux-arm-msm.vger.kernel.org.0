Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31AA3587761
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 09:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233663AbiHBHCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 03:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiHBHCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 03:02:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 651D01D300
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 00:02:44 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t22so20671047lfg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
        b=ILkBFGqDuBCm81NrzjcIfk8v3fifksnPm3jgAYKIm1BAm3lRuNREbalAI0fcXnz7IF
         JrlZx82CDX0uqldmBtxSkHAwRsYgW/DoTJ/9BnUGVTwk73vx/GRAjghPbY6AEzGREj79
         pPIip6BBlJqM7gCDwLMRFLhCfHfXauIlXdJPxY2PCV0z9Zl7M74xX4hH8FFsT5d/GTS7
         2fkW1xVwAX6Da7nQgCrqpe1Kp1UGxmIb417ZoswTZ2HUNFKYLNARs8l3WNnR6TdiOMfo
         G2UhGeT2lPVHtLKb0qRt3SLBhgiVVcQhbu2mu/2+M5KSR5xECr+ASZdEJnmTtlWyhaS3
         wqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/ySHTyzeX/H7MclcVdbanxVutrzYknZPMky5Ufc/cco=;
        b=TS9mjCdA6Ptjzqgif2Uqxrcu0xjh5kWAFfvJs8WVx82PJdLuMPht7itZuQi7bb9pvZ
         xST+ZkI40+2xryCO6rVCvRXFM5txMITs24aJNBc5CYPdEilbVYPRdxwQ8GsZ/8VncsGV
         n14Hxpk5ZZ+raGMNPZurdJrrx3K7xzgYb9/5E63x0TUGdF49xlJYucGwLGgzMHosQEms
         BBb3KC6myMyaL4kOoSTRnq55Hf47N1Hy+VfaKeRdM8ZKYDQ8cgOCAy4DXzbki42YR4Ti
         QEdW4CGx2ZErWbXQ150IzwSmk2IDytb7L53gTHmyXUznmBIRyELAfpT+Bcl8lpOpz6pH
         xCWQ==
X-Gm-Message-State: ACgBeo0gttDV3t7YfRRKNMq9wAgFjJg+DzoK8M/SYs8DI3x8f+bNqngC
        wMta51Bw7rOdaZoyro7E0wHZyg==
X-Google-Smtp-Source: AA6agR4N7si8u20TMih2xTB+Z2+BSt/eBM4OC4TX8ZhEGP1kPVnVDh9g8o9nA0BSsYDSlm57b6YqfQ==
X-Received: by 2002:a05:6512:3d8f:b0:48b:12f3:c9c7 with SMTP id k15-20020a0565123d8f00b0048b12f3c9c7mr161931lfv.23.1659423762780;
        Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i17-20020a056512341100b0048a7fa5bff1sm1085463lfr.248.2022.08.02.00.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 00:02:42 -0700 (PDT)
Message-ID: <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
Date:   Tue, 2 Aug 2022 10:02:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
Content-Language: en-GB
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
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

On 30/07/2022 12:17, Akhil P Oommen wrote:
> 
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal.

If this is votable, do we have any guarantee that the gdsc will collapse 
at all? How can we proceed if it did not collapse?

> To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.

Trigger the polling made me think initially that we will actually 
trigger something in the HW. Instead the client uses reset framework to 
poll for the gdsc to be reset.

> 
> This series is rebased on top of linus's master branch.
> 
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
> 
> 
> Akhil P Oommen (5):
>    dt-bindings: clk: qcom: Support gpu cx gdsc reset
>    clk: qcom: Allow custom reset ops
>    clk: qcom: gpucc-sc7280: Add cx collapse reset support
>    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>    arm64: dts: qcom: sc7280: Add Reset support for gpu
> 
>   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
>   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
>   drivers/clk/qcom/gdsc.h                       |  7 +++++++
>   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
>   drivers/clk/qcom/reset.c                      |  6 ++++++
>   drivers/clk/qcom/reset.h                      |  2 ++
>   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
>   7 files changed, 46 insertions(+), 4 deletions(-)
> 


-- 
With best wishes
Dmitry
