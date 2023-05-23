Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9635570E310
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238184AbjEWRaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 13:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238308AbjEWRaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 13:30:00 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B6BE0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:29:51 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2af1c884b08so1282261fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684862990; x=1687454990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnJuvfiV6w54wywl/8Vq5O1hHPAOyx0KNMyhL5JUw5M=;
        b=ivO4OihUGfJYmU476plkO/te2EQkcjfnZRPKTfFXDHwoGHgcCrQLC3WMxvf8sBbGhV
         uVt3JAWFGT0cFwy4g0mOxFqDxze1YWjQrMw/5f91oN10uNqp/7XnPE9S1yBvzhFXEX+g
         d/0q/22nkaOAgEv61VPtPwDS2TBRAlX6W7VP4Q8/pxmLAkYhQsTIZbStmDl+gw295kMK
         xkB8beAYwpW8H7qpPVJTt0Zu7vg+2NjVM3DB7m5JF0f9TMhfjv+guRwxtxLhmSu41oh0
         Q6FH2mZHGmvGX8HIdVV0c76KdriIU0fvvZjcXkWL0KBm6uy1KU6+crxQcj71FwVt1lO9
         VZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684862990; x=1687454990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnJuvfiV6w54wywl/8Vq5O1hHPAOyx0KNMyhL5JUw5M=;
        b=hXSEcm/iIkqEhCyHc85d6ibzMHoW2usdRhtZeCz4MFpg6ZgWp6w9GSAWnhINd7CHbd
         2/xi76PvVB3L15YuF2/y661C1T/Xan1oWKNl6FrWChou5/naJvF08LDYz2CKDnIR/HUM
         yRh+V9sUxwnkvGTSHWtcEUOB2eT+9RaTdIwa/XJefF1NPcduFuCErUP9SlyvGhrzLTa3
         fQfUeKsdwc+tbMtCVgzNWqIZkk+6ANbLBKtDqjBBlbzkuYYLcBlDAywhW/AqBuS3EfC+
         kxZu3PyEYqIFKy3syMymxQYLwTjfiRNK56GsT/fGxkIpM5wfzeEUuwCEc6UfxqMafqcn
         B5QQ==
X-Gm-Message-State: AC+VfDxYkdsMW5SFlj4l9Mz1sMbVgvbMDlJEm6OyQl6j0wh8I5iRtw9s
        AeFA98QMEdKIfGRYpnnuAHa4HA==
X-Google-Smtp-Source: ACHHUZ5R9JrLMHMNxDpw3EahY7atgW5DGJT8pIERH0+qr+SbS17Qy7jLz+aSApZybK8pKUwC6Xkyyw==
X-Received: by 2002:a05:651c:10a9:b0:2af:1ff0:9eb3 with SMTP id k9-20020a05651c10a900b002af1ff09eb3mr5125069ljn.15.1684862989711;
        Tue, 23 May 2023 10:29:49 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id u7-20020a2e2e07000000b002a8bb52d994sm1686918lju.25.2023.05.23.10.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:29:49 -0700 (PDT)
Message-ID: <014d42a1-46e5-560a-dcd8-12bc3abd242f@linaro.org>
Date:   Tue, 23 May 2023 19:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] arm64: defconfig: Build MSM power manager driver
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-2-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523165411.1136102-2-vladimir.zapolskiy@linaro.org>
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



On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
> Build Qualcomm MSM Power Manager driver, which is needed for QCM2290
> platform, otherwise the TLMM pin controller driver probe fails on boot.
Nit: that is the case on our integration branch today, but will only
be the case upstream soon:tm:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 72136a45c634..40100b9dd6e0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1323,6 +1323,7 @@ CONFIG_PWM_TEGRA=m
>  CONFIG_PWM_VISCONTI=m
>  CONFIG_SL28CPLD_INTC=y
>  CONFIG_QCOM_PDC=y
> +CONFIG_QCOM_MPM=y
>  CONFIG_RESET_IMX7=y
>  CONFIG_RESET_QCOM_AOSS=y
>  CONFIG_RESET_QCOM_PDC=m
