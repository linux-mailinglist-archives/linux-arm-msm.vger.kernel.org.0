Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9372D62694B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 12:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbiKLLto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 06:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiKLLto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 06:49:44 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591AB13DFE
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:49:43 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id d6so11965980lfs.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Nov 2022 03:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oNgcDzAUynKRRT1NTYmiRuAAnV2qyMqsSjvtfnRj8g=;
        b=b2oAN9hLamT+7bUdqbVUObYzuMEXQ2KhWnDf/DTBjBcc9VXz4cSpyHSY2srgzMwHOO
         RPCA2VE3ooPB2FfxIgti+s7moF+bcdQbx5Nx9h3gGpBRN2S2V0Oued4UK+wN9RgEJRfZ
         GLPWlQiGu5JeY2c9T7b8cil2Czn7LdGBUWZX0EnT0mOurUEa9M7+O2b3QfYZRb/UVTkl
         UMSxPOs/Iqe836E46UimuCF12hmjVeBDz0uJ2gftWY4Oxx7VgSNTXeLcksHArvJ/PkLO
         JlnX/QSOv7F/YtCZa0vPU5RJiDNiVjF5wbKuiW4ge4mWxxzKgg4bhMQSSJOkXlwME6E0
         KvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4oNgcDzAUynKRRT1NTYmiRuAAnV2qyMqsSjvtfnRj8g=;
        b=UoJOSWA5+djoMKiEGxxU9+Ta9mhhXKLBCMEtZQQzGF+9X/SFRaXGM6NWDOLOcTVTVC
         Ngvak0vfocmkUQUIZWKadGVWqgns7GvmsEtCouAOEpLunFWJi/uD+KA5c/mqd7Y/EjOq
         RqjZJse4UDsXJGImGpjBxnXIq69NObe/OymPgniTQwde9ADT+uDWoL7uGvTgzxL6Bxob
         WyfV1mHNl0c0hMeaMHpvBFqwOzPCV/DwWEmy3QAsndNVsiuDiZIQlgp7r4pnz2lGqx/m
         EKZe47heqvOC/AhtyWme8n4M6OwCufrP/lSIzdmNfzYP/lDo9g1V+SnLphfuUhJnbg3X
         hd7A==
X-Gm-Message-State: ANoB5pkKjpkn3FuCWVtmZRc7mv/lza68c0TG5P3tg++38ZBQPeqnkJGs
        uQujvS5ptZrg33t9uEirI2+OPA==
X-Google-Smtp-Source: AA0mqf4SA4FNsJtTeK540ABTurSznwTaWEG1mn5nfaXargOpNqwuQeJlmyzdOq1CNq4tdSubS2xikw==
X-Received: by 2002:a05:6512:298f:b0:4a4:5e83:e07d with SMTP id du15-20020a056512298f00b004a45e83e07dmr1875576lfb.409.1668253781771;
        Sat, 12 Nov 2022 03:49:41 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z36-20020a0565120c2400b004a47a92ff4csm836171lfu.193.2022.11.12.03.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 03:49:41 -0800 (PST)
Message-ID: <4c3dd58e-7162-3457-c785-dbd44eab7628@linaro.org>
Date:   Sat, 12 Nov 2022 14:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: drop reference-clock
 source
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111093857.11360-1-johan+linaro@kernel.org>
 <20221111093857.11360-4-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111093857.11360-4-johan+linaro@kernel.org>
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

On 11/11/2022 12:38, Johan Hovold wrote:
> The source clock for the reference clock should not be described by the
> devicetree binding and instead this relationship should be modelled in
> the clock driver.
> 
> Update the USB PHY nodes to match the fixed binding.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

