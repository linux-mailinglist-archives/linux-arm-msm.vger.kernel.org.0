Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F217763B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 17:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233581AbjHIPcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 11:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjHIPcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 11:32:45 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0E5210A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 08:32:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso11509181e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 08:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691595163; x=1692199963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of8PeHK3YL/WoKhPTBQz3f9Tf32Jb+Ocz8BH4pAcyV8=;
        b=wAisMeAqjk41+NlpjCaylrEy8ameEHJzhMU9SW6pMzWZeHYh6uxccs0vO6YCSKuJt4
         2xeIjXGW4XCWrlZje+gMf/oPDccPsKY3iFIwfaqOPeeYhgdjC/Mn1+8HVzDK37TGklo4
         GxFlf1SIbwGKRuMvbE/h/rG8qfizgMX21Ete0voDLcYriWq5FZK4DgUEI4LgoODIvTYi
         gNXELS5y7g1wf5EOl0bbCMsYBwYFLYWuIBE6ABZ1+J8w8vwtZYX7W67I+6yawOjkrkL0
         9giDOpLALx2sFx/WsGoD6skVIwWbCHaVsW47LE6CwMpK6OXdHfcx4fszso05TvLBBM3E
         c1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691595163; x=1692199963;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of8PeHK3YL/WoKhPTBQz3f9Tf32Jb+Ocz8BH4pAcyV8=;
        b=lfLQ4CR/UUXLQx7EM6VVxo5RYCjyoeacorTsNn77SCaZZ8BYBoP/zsqva1mQ9Q9HtV
         SgF2USRAJ7QCxMzBxanYNbZPusxd5AgbISiMZym0P/AGZq3MTh/U1LZ5prPoEQTB3Nol
         M2QD5FY8oLNW71nBBXgFl+BhUtmwc2ts59YWw2heO+XS1auSO4DYpSHMNf/esYhZsnH/
         kan8vd/Hv3zOvGWC2Fdd8lZS/7Md/NX6MwNVCBKHQWY+KpNGamQuDr7NOxWkbO60YH2H
         AedBEeX/LTND2FCe/5j+Toub1wPxqRhNnyRWGXxy0P+HPLELz6f5HjN48qcZGAlCzn77
         6yDA==
X-Gm-Message-State: AOJu0YxoJraSmZLflar4ZcbNOLPdZ1y2r8+5tVUUuesl14BC4WjC5BOf
        jCgf38Gf9LOOd4JWtntn0YdQ7t6kLaRcZiNBLVQJRg==
X-Google-Smtp-Source: AGHT+IGdPLcjvT5P7oRqrn07ThHzvblusAzppzOicvUAXH9HODXqv5YdYROBW3bRlsLwfkOcW2+N6w==
X-Received: by 2002:a05:6512:2522:b0:4fd:d6ba:73ba with SMTP id be34-20020a056512252200b004fdd6ba73bamr2325938lfb.37.1691595162452;
        Wed, 09 Aug 2023 08:32:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bq1-20020a056402214100b005222c6fb512sm8230758edb.1.2023.08.09.08.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 08:32:41 -0700 (PDT)
Message-ID: <0aa707b9-8fa0-be00-af8f-dd57828cd336@linaro.org>
Date:   Wed, 9 Aug 2023 17:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 0/4] add clock controller of qca8386/qca8084
Content-Language: en-US
To:     Luo Jie <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230809080047.19877-1-quic_luoj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809080047.19877-1-quic_luoj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/08/2023 10:00, Luo Jie wrote:
> qca8xxx is 4 * 2.5GBaseT ports chip, working as switch mode
> named by qca8386, or working as PHY mode named by qca8084,
> clock hardware reigster is accessed by MDIO bus.
> 
> This patch series add the clock controller of qca8363/qca8084,
> and add the clock ops clk_branch2_qca8k_ops to avoid spin lock
> used during the clock operation of qca8k clock controller where
> the sleep happens when accessing clock control register by MDIO
> bus.
> 
> Changes in v1:
> 	* remove clock flag CLK_ENABLE_MUTEX_LOCK.
> 	* add clock ops clk_branch2_qca8k_ops.
> 	* improve yaml file for fixing dtschema warnings.
> 	* enable clock controller driver in defconfig.

So this is v2, not v1. Your next version, if happens, will be v3, please.

Best regards,
Krzysztof

