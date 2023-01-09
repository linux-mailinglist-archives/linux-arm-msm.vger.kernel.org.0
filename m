Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A52662E0C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 19:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237681AbjAISFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 13:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbjAISEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 13:04:49 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F394F11B
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 10:04:11 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bf43so14261155lfb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 10:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NaY/2DqaoSidppPHSkUy2BcLqUqFjFP11ep0OZTy/9g=;
        b=Fg//XqJM9WKhPv5WbbeOGHnwk+Rth3gxnPKIESr5UrbVYIpyUKikYqDCZKX0JJ3sWc
         tXAA/ICSy07weUIwdyfiXhf7h+5A402Ds4SvfkvOF6A0+MoURv3XH4ba7MQTvWnGrKEa
         3nbcXDYGDMu2PXuegkdNtRmSUvftWBLEcRq4C8Hwek/yUFLGBKDFqNF16lfsf8kTYnCI
         MrNa0KL0VAk8heoX7uxajUsjsmdzkZ5p/QcHcpAMdSY6e4TyDXQuj6SaO0ZB5D7c8zwp
         6Q+DLO7U8AsRZKpwRnSvx9TzzDVwaVcncIHBLVOakqDT0+/w9jrH5h9qeZg+G2uiIT53
         Rk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NaY/2DqaoSidppPHSkUy2BcLqUqFjFP11ep0OZTy/9g=;
        b=76og4fxOTLl4QSb07mXVDN3TiIfX0dK1KgeHy+RaG1mpMKeMEVdr6IeLbfM8TlEsTY
         FIi2hyrwMzcCaYbxuRnYpF/46478aVIoPbRhSIKJr8+gBzwkZUnhOVxWrhB07nhliNNQ
         oRCQ/geguIytG5E6OkLc43WGtcGm5VOA1meJvj8Yh2BYA/5I0j9gTBGm3QaqJ325HnPx
         Y4ZGzGnz1SCmPUJraZFArrvoCU7o34DIT2vNagBHc845j1E3p+L/ZZ3l8TarMedjkTDJ
         9fy4qIDO2YZZCzw8Ph5R6OUzZLPrxw0nJTNjlEUgCQUuy2/+M75/i5V1MG2vOqxEO0dA
         AEjA==
X-Gm-Message-State: AFqh2koEEjrL9UYULYD5QjCJNng5Au3rxBhVrVHeppZQ9GpV7kKeXjAs
        mmgrGo+Se5yII+321CYPpz2R8A==
X-Google-Smtp-Source: AMrXdXsZTo7DsBtHT1Kmx9G45xUp19RzsFbkBS642qI0FX5WuYrR8ikmr2qzmwx3vmMgXWDt/ssYUA==
X-Received: by 2002:a05:6512:3d10:b0:4cc:7b66:6d64 with SMTP id d16-20020a0565123d1000b004cc7b666d64mr2410770lfv.39.1673287449389;
        Mon, 09 Jan 2023 10:04:09 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id u6-20020a05651220c600b004cc865fdfdfsm325270lfr.89.2023.01.09.10.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:04:08 -0800 (PST)
Message-ID: <f62fb561-5ddd-203e-1204-f1bbafcc7ea8@linaro.org>
Date:   Mon, 9 Jan 2023 19:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 08/18] arm64: defconfig: enable the interconnect driver
 for Qualcomm SA8775P
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-9-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230109174511.1740856-9-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.01.2023 18:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the Qualcomm SA8775P interconnect driver for arm64 builds. It's
> required to be built-in for QUPv3 to work early which in turn is needed
> for the console.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 1cb586125c46..d5c938adbd2d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1332,6 +1332,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8916=m
>  CONFIG_INTERCONNECT_QCOM_MSM8996=m
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
>  CONFIG_INTERCONNECT_QCOM_SC7280=y
>  CONFIG_INTERCONNECT_QCOM_SC8180X=y
