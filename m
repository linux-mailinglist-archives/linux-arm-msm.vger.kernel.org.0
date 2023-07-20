Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5431075A9C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjGTI5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjGTIv2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:51:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AB9268F
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:51:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so807884e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689843085; x=1692435085;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iryqe6IYk7QOmw7lzVtrSDC7qmopTTAsU/vS6TXh6QU=;
        b=Jsfh0/YDtGYIzUKXINukMBKQWdQZIx66DB90J9CobzX2UiqGMnA5YQsHWwGgPmZXQd
         QwYRTbBW+ngXamjPPZJe2sMxdFRs2k9YMNfeIVW77e1WYy3roABklF10qFzlONIaTFZH
         ejcNlGrgeRtFZ48UVGllE6VQs0WkY9iYSem5DavhxbOJC0+xLV7u28P0qYIqNHDMZRFw
         D1VFbStlmCNYbwaRPTTsYap9ZGXtq+0VTYlvRXYsOq5EG6DRokKYk6d/ymHsSuQBSUqL
         MHCmT1KIi9AT1t1C5GhfIXVsy4gitnZtFqldxTcDbuJCHSYRLzwCPG/eO3CH0XIfOdHD
         xV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689843085; x=1692435085;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iryqe6IYk7QOmw7lzVtrSDC7qmopTTAsU/vS6TXh6QU=;
        b=K9Y1FPuZ6Aairy6i17JUUxa5V1cuZUc8K8VGqs7F1VFi7jPzMJBLoMtmTj3z/3q6LB
         G7JHHh247NZZKA5q2qHWY3QP78HAUoBAWtIzvNBh8Gwykhtxr2Udglv/zKNqens/DP8H
         11M0zuKyfeBGWvhXeqWnHffa1TyvrJsVPQEN48b7oyy7K5TW7QCUdOdktRioL+JFsTO+
         hsalRDoHlamaff/RLz6wNiKl6C4+wOF03HBzQXloGb9Rpk8viWtbETkyQWX0js5dAbXU
         sc1CsDmxeCSgdHhSJ2qM4PFb1r4IHA9oQbq8AxKvfPsbbWij9Z9dZb6Kdd4BDjP7b6jP
         7Hrg==
X-Gm-Message-State: ABy/qLbsO1Fd2jpQD4XqZJ8gCYFDzLqPXetMhmNuozPvAeb60DgfNXCD
        ojh0i4nChN/EJGhgQmYgXy6pBA==
X-Google-Smtp-Source: APBJJlGjO0AMcdieLBGIAuZpbyq7vpGm3I0E4v7tVp46870Ky9X2NCiMjnaXJqfDV5ubNTUzxM75jw==
X-Received: by 2002:a19:9117:0:b0:4fd:d044:cb5b with SMTP id t23-20020a199117000000b004fdd044cb5bmr1508964lfd.55.1689843085093;
        Thu, 20 Jul 2023 01:51:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id g1-20020aa7c841000000b0051e576dbb57sm433814edt.61.2023.07.20.01.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:51:24 -0700 (PDT)
Message-ID: <fb07d227-f786-c7a2-5295-2254495e4a5a@linaro.org>
Date:   Thu, 20 Jul 2023 10:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9574: add support for various
 RDPs
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230720084534.6461-1-quic_sridsn@quicinc.com>
 <20230720084534.6461-3-quic_sridsn@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230720084534.6461-3-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2023 10:45, Sridharan S N wrote:
> Add the initial device tree support for the Reference Design
> Platform(RDPs) 433-mht-phy,433-mht-switch,437,455,456,457,458,459
> 461,467,469 based on IPQ9574 family of SoC.
> 
> Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
> ---

...

> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp456.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp456.dts
> new file mode 100644
> index 000000000000..22d69ec8912f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp456.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * IPQ9574 RDP456 board device tree source
> + *
> + * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "ipq9574-rdp-common.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C16";
> +	compatible = "qcom,ipq9574-ap-al02-c16", "qcom,ipq9574";

I am sorry folks, but what are you doing here? Why are you adding all
these DTSes? What is the point? They are all the same. Where is the
product datasheet or description so we can validate it?

Best regards,
Krzysztof

