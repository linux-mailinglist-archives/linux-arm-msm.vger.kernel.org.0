Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FCA6B7E28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjCMQwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjCMQwa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:52:30 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E512769D
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:52:25 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z42so13262072ljq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12U9/Ai+aM2I5tDIPM5vV8fIcwgTyZbD/qEbVcWGEUw=;
        b=ol3WguNPzBoQvG/knU5oWAs/SgmiTvEr0quKwoMhsKm6615FLo7+1afb8eWY6yAweV
         Oh30d0ej9Y2b8SY3/QfIXybVggH1D8bAYEZxxX1LLDpPYr21wSnp/FupvNnOYR1rFYj8
         3cqnko/pgYUo9k+ESI7Q2Rysw5ox758wngXmywNV4gs1ITDzdsedMh8gGHi/s6rWFBSN
         jKECHiE+j83pc+N2lYbs+GhuSMKl0O9+LNY4ITO6sdb7jMyre7j39/+z69ElDsUIvFZc
         9Q+Tou5k90gpoH6qwOP0QATgaNdtgHhppi4RfCbVY6KN/JrNz8WSUdNaYcu8aPrJ+4nW
         3p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12U9/Ai+aM2I5tDIPM5vV8fIcwgTyZbD/qEbVcWGEUw=;
        b=e0/pD6uPyqqAjN+gfEbawJKVCumWgSJ7c15YoYDOhYBqNCAZujKaLOpEo2L4i2LauJ
         Cyo1FlBGcIBVHHr9929mm+Ul3IawBS6UaUVtfrivaU6/MjfUu5K/byHriwLz7hNTIPOJ
         kFjUcHjTXCgagk2uJxnc+V9dwl326XPNjbBLXyCyr483nHlru1SlHFEMj4IChRREWZcs
         469hi0fO3FMhpLSnZ01DHBXk8sS+bXeF5xKMswjX5+93vgV483o3yVZ1dYWNNRIJKstq
         g+/DCDyfKOkASpXF9FI3FqhKUHCsLUyErTxaiyMBNR+1lTga84h3DlMQOisdh/+DoOXs
         csdQ==
X-Gm-Message-State: AO0yUKWh7t8xGWu/qHC6887kWYu69Kf+zyPztr/Pvmvjdw8kupcfOVUI
        DYANFy7aF6No0XouphEeS1SXCxJj0yZKTjAxiO8=
X-Google-Smtp-Source: AK7set/FA5XJqxCpotJkvC2P+kVzUMJ4Gq2LtN6mOST9U7+/mPej58e7/1zyGnpVgKrVCLF9urBRYw==
X-Received: by 2002:a05:651c:a0f:b0:293:5f51:3d41 with SMTP id k15-20020a05651c0a0f00b002935f513d41mr4440105ljq.11.1678726343115;
        Mon, 13 Mar 2023 09:52:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512374e00b004b55ddeb7e3sm16922lfs.309.2023.03.13.09.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 09:52:22 -0700 (PDT)
Message-ID: <01387819-0c95-2ea3-ca02-09513d139be1@linaro.org>
Date:   Mon, 13 Mar 2023 17:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 00/10] SM6(11|12|37)5 GPUCC
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20230208091340.124641-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230208091340.124641-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.02.2023 10:13, Konrad Dybcio wrote:
> This series brings GPUCC support and the correlated bindings for
> three midrange SoCs, all of which host a GMU-less A6xx GPU.
> 
ping!

Konrad
> v6 includes bitfield.h for arm32 builds and fixes the kconfig display name (6115 != 6125, heh) in [10/10]
> 
> v5: https://lore.kernel.org/linux-arm-msm/20230201183626.351211-1-konrad.dybcio@linaro.org/
> 
> v5 fixes some issues pointed out by Dmitry and picks up tags
> 
> v4: https://lore.kernel.org/linux-arm-msm/20230130235926.2419776-1-konrad.dybcio@linaro.org/
> 
> v4 only brings a tiny bindings amend to [7/8].. I thought I could
> fix it without running dt_binding_check but oh was I humbled again..
> 
> v3: https://lore.kernel.org/linux-arm-msm/20230130153252.2310882-1-konrad.dybcio@linaro.org/T/#t
> 
> Konrad Dybcio (10):
>   clk: qcom: branch: Add helper functions for setting retain bits
>   clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
>   clk: qcom: branch: Move CBCR bits definitions to the header file
>   clk: qcom: branch: Clean up branch enable registers
>   dt-bindings: clock: Add Qcom SM6125 GPUCC
>   clk: qcom: Add GPU clock controller driver for SM6125
>   dt-bindings: clock: Add Qcom SM6375 GPUCC
>   clk: qcom: Add GPU clock controller driver for SM6375
>   dt-bindings: clock: Add Qcom SM6115 GPUCC
>   clk: qcom: Add GPU clock controller driver for SM6115
> 
>  .../bindings/clock/qcom,sm6115-gpucc.yaml     |  58 ++
>  .../bindings/clock/qcom,sm6125-gpucc.yaml     |  64 +++
>  .../bindings/clock/qcom,sm6375-gpucc.yaml     |  60 +++
>  drivers/clk/qcom/Kconfig                      |  27 +
>  drivers/clk/qcom/Makefile                     |   3 +
>  drivers/clk/qcom/clk-branch.c                 |  15 +-
>  drivers/clk/qcom/clk-branch.h                 |  44 ++
>  drivers/clk/qcom/gpucc-sm6115.c               | 503 ++++++++++++++++++
>  drivers/clk/qcom/gpucc-sm6125.c               | 424 +++++++++++++++
>  drivers/clk/qcom/gpucc-sm6375.c               | 469 ++++++++++++++++
>  include/dt-bindings/clock/qcom,sm6115-gpucc.h |  36 ++
>  include/dt-bindings/clock/qcom,sm6125-gpucc.h |  31 ++
>  include/dt-bindings/clock/qcom,sm6375-gpucc.h |  36 ++
>  13 files changed, 1760 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6115-gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6125-gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm6375-gpucc.yaml
>  create mode 100644 drivers/clk/qcom/gpucc-sm6115.c
>  create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
>  create mode 100644 drivers/clk/qcom/gpucc-sm6375.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm6115-gpucc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sm6125-gpucc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sm6375-gpucc.h
> 
