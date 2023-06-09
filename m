Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C135729AC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 14:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbjFIMzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 08:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241247AbjFIMzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 08:55:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C97530C5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 05:55:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so2239904e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686315264; x=1688907264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWAc8s9mtYq9bvfxWICbMJo3RkYM/eJc1QSBr+x6G8Y=;
        b=xfyZNLfaD0QTAnUJUAEH8T4GdANS45eqBTdyEnOUe0avgitAwOpNCO2K/wmbsrhWaP
         MM1h8jbCTsc9hhjOcUkuFZZB1aNee0AuTns+EUVlJm4Syqpfkj605YC4O1ScWL167G0V
         owsaOPVbtz3IwSpfkN8VuvrWeJZWsLQWmWWMmgoAmKnhBOAxRICBzCThvvkkj2lA5p5m
         ZqcXfxZh6FDQY0zX4Ikc+nnQPNKv4DZRxhez7aUunmUSJeistB6MDu14OBefv1TpI0gr
         f4tZ2dKvbRBKiCTfrvoepT68XTXKGzNCkSfF4E1SSIIfVvJdtSOJt+aBEgbIK95Ker13
         XxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686315264; x=1688907264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWAc8s9mtYq9bvfxWICbMJo3RkYM/eJc1QSBr+x6G8Y=;
        b=FwuLo9ZV3NboeTggjYy1MFdNroaOcJTuPMTd2veKSY4oVteMHvPtRcWXkuJACiL7DM
         rTIGVAV0hm8k4GdWa4lEk/BOg0G6rmf+lxyoMhKhQgluRifco+mRhh3GdFtoDrApCXP9
         gY/zZEbzklrY2AUDxZ2GxeQulWU9PosGuClEL9yhSU0DgVilOCZsIh0fLrDBCfqlATpm
         nD/p+G5BmkTM78lAlvO/5qEn6isz1658Ik25qXRSVG6LMXP9+6wE1mdcBrc9bNFcjWWM
         WMASLoPqIx/y6AarFoy5fraBKrotgwrV+WwEFOb/l5WADmDRqc9nnNI5E02tqYmhzidY
         YxDw==
X-Gm-Message-State: AC+VfDwC+6ccsCK6zG2W5V16x4jv743e1cpFrjOrA9/qkUaKWTSz4uaV
        cpk7ARjlrO72uFdCeKKSvdE7dw==
X-Google-Smtp-Source: ACHHUZ6drSlhoDmee4FQUAtmNA+rg3NZmyqtbBNMYb8qCNApuq5hPUipIG1dmiNUk7AzPMw6LF++Sw==
X-Received: by 2002:a19:ca59:0:b0:4f4:b05c:dbbc with SMTP id h25-20020a19ca59000000b004f4b05cdbbcmr834341lfj.63.1686315264003;
        Fri, 09 Jun 2023 05:54:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v4-20020ac25924000000b004f64409eef1sm534202lfi.246.2023.06.09.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:54:23 -0700 (PDT)
Message-ID: <88b41c0f-e515-ce94-e4fd-befbeef53781@linaro.org>
Date:   Fri, 9 Jun 2023 14:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230609115058.9059-1-quic_jkona@quicinc.com>
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



On 9.06.2023 13:50, Jagadeesh Kona wrote:
> Add bindings, driver and devicetree node for camera clock controller on
> SM8550.
> 
> Jagadeesh Kona (4):
>   dt-bindings: clock: qcom: Add SM8550 camera clock controller
>   clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
>   clk: qcom: camcc-sm8550: Add support for qdss, sleep and xo clocks
>   arm64: dts: qcom: sm8550: Add camera clock controller
What's the final verdict on RINGOSC_L etc.?

Konrad
> 
>  .../bindings/clock/qcom,sm8450-camcc.yaml     |    8 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi          |   15 +
>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/camcc-sm8550.c               | 3585 +++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8550-camcc.h |  187 +
>  6 files changed, 3801 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/qcom/camcc-sm8550.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
> 
