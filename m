Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18196219E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 17:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233981AbiKHQ4g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 11:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbiKHQ4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 11:56:34 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2276059856
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 08:56:33 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id a15so22010924ljb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hC7+VolI2Xokgb3dmDEH4B60P4b9V47rxRyDrGnv7BY=;
        b=Kvh1XU2ygifF8pd1pPYP3ss9QpfF5Pm4e3f1LTjwSDi8McME5MKp5XYnCoKryE5a4L
         LI10oVlOhIkZ5ZAlQa2vWVShH3If5lawcb1l+4YhnVKgTA8vjrdjmExReZS+4dU0xdrY
         29F0K2HTD4i/7U61F2duHKuWHCoVGdoF68T+gklopltu9ERau/FjUceOuEcWiUimBMBj
         vvmcoHNOFd3UBBwUwcbNoA5QloXV3ObbT+WHvHiCmxSSkkTvbkiJ6ttu+amvAHPp960H
         NXVtEsSN9z31KIxQVXmJEMh0L2RgPcpFPHoR+ATjYNAwpRnlKkvEaEtJSTPy88dkPVwC
         dXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hC7+VolI2Xokgb3dmDEH4B60P4b9V47rxRyDrGnv7BY=;
        b=Dt1meHg8nZACZc/v95Qm8VjAn8t0D6Kx/5aMmNuSmLyxPocSUoSGa8bvfQ9RMF3hcl
         PTDc+EPle2XlF+0TOHqD4cZSsc0aCa4A8e/RqbaNEnJW8l03dtCoBPXxr6nin1dJ4xHx
         +hTBuxDnrMOc9A75lVtUw5t7Q4QP0Xr5AniGXqHM5EaWJNzXRKEUYMP1yga4qube/AfL
         gPcJP8j/6g1YTUzimTsSbeTdtFIBV/R85xXRHh0VVDOeaQV6erd8WJbIOyv9GQF7qwfO
         6P7UZO4tnRKU2OLl0K9IuXc4WeJk9dRUSHFFM6uJwX8+aap0H+I5wtrCi6jSCOBJXR1c
         5U8A==
X-Gm-Message-State: ACrzQf0iCCTulmMxmsw70iOurs7QSc2/YM3dPikL6OvZk1lNWQiETeLE
        O78JPZws+a1a7YWuW8+2CE7gAQ==
X-Google-Smtp-Source: AMsMyM4XfQkuOM+aro7Fw77Bc9UCPCloL04gi1Xnx+NAhUmjFjVBoBMf3JHPikC/1fibOF/L2SZuWQ==
X-Received: by 2002:a2e:a910:0:b0:26a:ed13:cda6 with SMTP id j16-20020a2ea910000000b0026aed13cda6mr18721501ljq.250.1667926591517;
        Tue, 08 Nov 2022 08:56:31 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id u3-20020a05651220c300b0049e9122bd1bsm1841693lfr.164.2022.11.08.08.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:56:30 -0800 (PST)
Message-ID: <34f22ebb-2b9c-080f-697d-b37cd6deeed0@linaro.org>
Date:   Tue, 8 Nov 2022 17:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SC8280XP display clock controller
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926203800.16771-1-quic_bjorande@quicinc.com>
 <20220926203800.16771-3-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20220926203800.16771-3-quic_bjorande@quicinc.com>
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



On 26/09/2022 22:38, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The Qualcomm SC8280XP platform has two display clock controller
> instances, add support for these. Duplication between the two
> implementations is reduced by reusing any constant data between the two
> sets of clock data.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Just a couple of bits:

- Use lowercase hex in constants
- I'm not sure I like hacking clocks up with magic writes.. this
driver can and will be compiled as a module by default and that
prevents a de-facto clean removal.

Other than that:
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
