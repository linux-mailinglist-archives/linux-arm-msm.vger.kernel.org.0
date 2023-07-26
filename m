Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8E576380E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 15:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjGZNvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 09:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjGZNvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 09:51:16 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A9410FA
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:51:15 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bc02890c1so135334466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 06:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690379474; x=1690984274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIhYLeZ/AvTN8kR+5vNpauR4Wf3o9xkm+OqIGcJs9/I=;
        b=vBnTaVEJ2jwTWY7J+NesQ0lewu44wXXo7E/hvzdL7AFMERp40ftcDfIpgyZDx2XPdB
         JWGyp5nlZO5z+0Me0ALWzaggRmlfb6kws89iDstu6gkV9jJ4jk+4iALFlk00iUbiYFCm
         dgNrboT2Rkh0dRMi9Lmz/rwJN6Jq6c9I/R/HLB/2eudP/baY9qMa5oSU5jVuCnm2ZOxM
         2y8bEmMyFuGSRahIBkrmDUoQmlM4x/rK2+xYnq6TqeNMjv1beBC6xUuH90FvZaTvJvF5
         7zJbq7QZryG/pIFNoBEADCAsjk1bIsAkJBUqwGWvUvN7hHtUh2QEoRGVQZoiRcuG3m0Q
         Kzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690379474; x=1690984274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIhYLeZ/AvTN8kR+5vNpauR4Wf3o9xkm+OqIGcJs9/I=;
        b=aZccg0c4bRKJRDxoMG3BjhwkUeJHS55YO9WlpkUv82Uyb0YhogdS7J23EgStzofk4T
         +Kvay3adAiwiXbbl0kCY1mSKDlKWdGUGKkZERkItT73rdpuHzXsLuJ6pFKKc5YhMzwCR
         Qd25o0wAghEtAjQMOJx+x3KdQ5r6Au26KnkSvm108/cNy2kX+fAy25WhY7doGQQ5NqUk
         DLMqzXotL6dYyXBco98HHSdpm1kLnuxwcAcu/G4mqurUTSEkOUWJmykp1RrECoJYH9VL
         gbstYuY22/4Am5ZjEiJB1qiDORW2i0oz8xLJLmGL7AALBYR2rY4x/dnZ0dMIt2hfkHqC
         wB0A==
X-Gm-Message-State: ABy/qLZ1PMvlplhM3GiOZ9Pgw1mPUZDrxshug2RAQHUue0kkYWdZVDXB
        iUKxxFjq3Wc5NL+3MVaiI3GhVg==
X-Google-Smtp-Source: APBJJlE3XUp6LxM7F9jLtrJnhL99uqsHOekOGy/0IAfecfZkux5XWlJHMhpCk9hXQ7OV0HvlGJCuhA==
X-Received: by 2002:a17:907:75d0:b0:997:e9a3:9c59 with SMTP id jl16-20020a17090775d000b00997e9a39c59mr1781711ejc.6.1690379474146;
        Wed, 26 Jul 2023 06:51:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id r9-20020a170906364900b0098669cc16b2sm9584108ejb.83.2023.07.26.06.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 06:51:13 -0700 (PDT)
Message-ID: <1f535f2f-1c93-c939-8ddf-b4d119e26688@linaro.org>
Date:   Wed, 26 Jul 2023 15:51:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash
 memory region as reserved
Content-Language: en-US
To:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <20230726132719.2117369-1-amit.pundir@linaro.org>
 <20230726132719.2117369-2-amit.pundir@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230726132719.2117369-2-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/07/2023 15:27, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> It fixes a kernel panic (arm-smmu: Unhandled context fault
> at this particular memory region) reported on DB845c running
> v5.10.y.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

