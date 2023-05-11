Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0472F6FF3CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 16:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238382AbjEKOPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 10:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238399AbjEKOPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 10:15:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A993525F
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 07:14:57 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f4249b7badso49951295e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683814494; x=1686406494;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSI4kk6erdTJyS3h6lXZ0ES4kYFCnFMIY3MVFxYbJvA=;
        b=Sr/VD6jZXRwIKFk1jRpJRJz0DwohZ1s2HhbDhZZIJXYspjF6vYpYPIyx8g2P/VWyHX
         TNrpCcqYdWKRta8wvpX3e2aAhyqbpNjSSnRG2ZlIfUIR8F7U0GGKaIkYjvqGB3Rnd+62
         lCgyFUYMLuqvZUyf9yc0Mh0nPjYkCJk+JEiotjOoxAsTVPrtG6k1uM1ZSpiuSJaJNXbN
         fo+MJSq7n2e8kdug/c7xL5/QeJnyYMIQxFayc8dB+C5xzweB8r6l8cX/BvzRSoKrL7zt
         SLPWWBVomfD0Qhl+cxU/JV3H3Dry78xlKYtSxsRZ4G23+LbTyHkbz/9344brd0u8MXuC
         Vwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683814494; x=1686406494;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSI4kk6erdTJyS3h6lXZ0ES4kYFCnFMIY3MVFxYbJvA=;
        b=VLN/HQ6CLCljcCUWBbD2+B+2PbDcUwCzm2+5LkYSnsEmys22GZyJuLIFbHzsYpXkdz
         nkOPbTsrF38Br4KLET+GWy8oIj94IrRpNNZSpRQ0BX/u3r9A1PtYvNPge+z81jO2cIbm
         rQg27nKOesJ/qyHB2Jx6LjBOUti0yM6lpERA2VUPnX4EfnBV6L2WtVLjEBkkgUSywaFB
         zkqDFSQugAEEPf7J1GBZPdNegaFSeYx4Gdr/iktK3T2D8R9+ndJSJcPOGvfM+ymGYBTm
         7YxSIvBCQlokmtP4jC1K65mFVcwptcJXdNALZMgH2HQt5KsixVybR1oDHvIwTia/6ric
         L2ig==
X-Gm-Message-State: AC+VfDx+SR9xxOK/3we4PabguGwXkfXJIK+Oma1T5dhWIiiidNu55DON
        bihISwaEqJpJTHvHdDLdjta/H/2ZG+Y6+IkM75HUww==
X-Google-Smtp-Source: ACHHUZ5jtC80HulhsYYkBVT75aFjCltFeesnF8MMGvneWSO8+wXo1veqbCIOu03rHHIuYvLcOIWKwg==
X-Received: by 2002:a7b:ce05:0:b0:3f1:7277:ea6 with SMTP id m5-20020a7bce05000000b003f172770ea6mr15163970wmc.31.1683814494013;
        Thu, 11 May 2023 07:14:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99? ([2a01:e0a:982:cbb0:182d:9e6c:b8ff:5a99])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6101000000b003062b57ffd1sm20744495wrt.50.2023.05.11.07.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 07:14:53 -0700 (PDT)
Message-ID: <016ab311-cc66-b1c7-4099-f63e8f3644b8@linaro.org>
Date:   Thu, 11 May 2023 16:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: defconfig: enable TYPEC_QCOM_PMIC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230511135503.198538-1-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230511135503.198538-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2023 15:55, Krzysztof Kozlowski wrote:
> Enable CONFIG_TYPEC_QCOM_PMIC necessary for full USB Type-C support on
> Qualcomm QRD8550 and MT8550 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a24609e14d50..8b6407d2059d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -991,6 +991,7 @@ CONFIG_TYPEC_TCPCI=m
>   CONFIG_TYPEC_FUSB302=m
>   CONFIG_TYPEC_TPS6598X=m
>   CONFIG_TYPEC_HD3SS3220=m
> +CONFIG_TYPEC_QCOM_PMIC=m
>   CONFIG_TYPEC_UCSI=m
>   CONFIG_UCSI_CCG=m
>   CONFIG_TYPEC_MUX_GPIO_SBU=m

This driver isn't used on SM8550, only CONFIG_TYPEC_UCSI is needed.

Neil
