Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C520A6C3A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 20:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjCUT1J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 15:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjCUT1I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 15:27:08 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BD450723
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:27:05 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s20so9451505ljp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679426824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8butvfKm6QGKCwPNW1OovXvIW+7ZWnx4ygsGQRPI5ug=;
        b=m0ys7kgiRzstX+2u40ASM63cvOrln/ko2KPNqQ8WesZHFdS/Cl7mjQtLCX/hNS62U6
         GwAl333XElLMgFWy2VCwm0Dmr8aVcnTYqlzSdU6pI1kFhqJiyk4GZYBwRqJ4Ohi5tIyE
         /zmPiNyUvzXf51ZUZnz3+7t/QOBMeO1VO6lln4fg9g36px30kcWIrGIp30UOxGNFA409
         7wMlf+VtPJ5hqFsF/0ujqPY6tVrkbZ5gBm08bB5Ymy5tons588Ddl7MJ2yVitgeOKlBj
         W/iq1fPaBVpFb4ktn21M53HGKwoAlS65fCw7MJOYRfZ5NaT45fWmIA6MwlVM2MG/oGuJ
         +SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8butvfKm6QGKCwPNW1OovXvIW+7ZWnx4ygsGQRPI5ug=;
        b=X0I8ER6p5mys5vt/NDHXIoYwrI0EUHzIc2LygJ+5RGGHTMwxrvxyNUhFr/0f0j0DnG
         ygq9JjVwSxUW2N9op2ZLWecFNn5uG3nyAbBiQj6YEgyo2SYQ2ltBFGqcy3kzx9fTLqgW
         JWvs2NQFPwf33SGpjAkXE1cBU6+CAU1nGQS4X/OzxwIHddmN/N57QDNgxWwV74n74pdb
         OpBAKyHxbEqPSoId04RsXG6Gnn4JluRRfctj/HOSu1lBUbDKAI266IEI1DbSOXy/Dps+
         EChUkIQaz1TV3cPpUp2+Xmlwh9rHUlaXZmsjGuWKNvB1WSOp90OnrGXfuGAgCHs96RVb
         /AdA==
X-Gm-Message-State: AO0yUKUhtRsbKdIcRRWVd6oxUR2cstyoOBp4MyTwgP/eC/KRiHF0azhq
        t3fLy50VgY1YTXfSwJ5YsAn7rw==
X-Google-Smtp-Source: AK7set8DUiYHUR6OH7OruNeqw9r7zHuMnkJVrTn9fq1x4odawBTusR3MMG0EACKU8AnQQjhAsKwShg==
X-Received: by 2002:a2e:b60d:0:b0:294:899:afc3 with SMTP id r13-20020a2eb60d000000b002940899afc3mr1396161ljn.35.1679426823716;
        Tue, 21 Mar 2023 12:27:03 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id o10-20020a2e730a000000b00294692d8645sm2379823ljc.17.2023.03.21.12.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 12:27:03 -0700 (PDT)
Message-ID: <41111f93-ef02-0e57-98af-01327213d854@linaro.org>
Date:   Tue, 21 Mar 2023 20:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Enable Crypto Engine for a few
 Qualcomm SoCs
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, vladimir.zapolskiy@linaro.org, rfoss@kernel.org
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.03.2023 20:01, Bhupesh Sharma wrote:
> This patchset enables Crypto Engine support for Qualcomm SoCs like
> SM6115, SM8150, SM8250 and SM8350.
> 
> While at it, also fix the compatible string for BAM DMA engine
> used in sdm845.dtsi
> 
> Note that:
> - SM8250 crypto engine patch utilizes the work already done by myself and
>   Vladimir.
> - SM8350 crypto engine patch utilizes the work already done by Robert.
> 
> This patchset depends on the dt-bindings patch which added support for
> SM6115 and QCS2290 SoCs:
> https://lore.kernel.org/linux-arm-msm/20230321184811.3325725-1-bhupesh.sharma@linaro.org/
You could have included that one here for easier tracking!

Konrad
> 
> Also this patchset is rebased on linux-next/master.
> 
> Bhupesh Sharma (5):
>   arm64: dts: qcom: sdm845: Fix the BAM DMA engine compatible string
>   arm64: dts: qcom: sm6115: Add Crypto Engine support
>   arm64: dts: qcom: sm8150: Add Crypto Engine support
>   arm64: dts: qcom: sm8250: Add Crypto Engine support
>   arm64: dts: qcom: sm8350: Add Crypto Engine support
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi |  2 +-
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 26 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
>  5 files changed, 105 insertions(+), 1 deletion(-)
> 
