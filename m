Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63D2767129A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 05:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjARE04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 23:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjARE0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 23:26:55 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0B5421B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:26:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vw16so17168027ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 20:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5KYUTlBMHDS9rZ5AIZChzy+GDqYCA0ROWxq3541f0Q=;
        b=RjhdAwsIoiY2El98eOLvDUmnYaJMo/NnkJdFdOPVmIhCXZqTgpIGKEl1G8qGp3mj+Q
         QLIbV48QOtX33wqIauSXD0yK1bVcYCJws4s53/ITxQw7wSKJuOs/EALXqpme3x5HMTgS
         SN0YWP+SyplE77QgQmtsvMjgmIqiHo1WDsYFNJpFli1ew+FR0JiJxs5VmaUHm37A1Vmc
         klAzGuO5C2COg4+rTr6Cjo2820dhzUDukBjkRL1xsNOST0IvAPLiRQRH6il8hyVlG8zA
         gEqkzK48qqMiQYq93Vbpx+qaclWDJwlZYLXC4KtaQ7bShQ4vgrTSznRvKaWG2I9U6YI3
         2vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5KYUTlBMHDS9rZ5AIZChzy+GDqYCA0ROWxq3541f0Q=;
        b=7EMteYI7G9KeVT4a+VZO99250u5oa7aStvKKgYnzlHuuD2drR3U9DTeeG2Mjg1jRxY
         vyDZ8pe0BcygCjvj3XPRoJD58E/MojDPcKBA0KvQmtHYbvCsqCFDodiYDDl1arMsPpON
         Qa72ktRJb0baFYTSGxmnlTQFo1E8s0g16mSzBU5jv9T5m/b7xya7mD3Y1UCQUZ0F73DK
         IlVdxucrTg5bnXSa/vHNsK0mjcB5t4UutML1EpCqzJML0Sel0vVw1ENX30xASf5pSWl6
         kDc6tZt0F9slUu1yZZuXGoceAqX8TOpTX4/c+nqXg0/wCZA8M+yXebC/sYAV6gQchcyD
         NJVw==
X-Gm-Message-State: AFqh2kpUchzc7gEP7HsRjqObZ9sb/kJGySAwZV1UZTZV5/xWmNPTHB9w
        VvNwwVt1a9GbtdgsxHLwTU7ZZQ==
X-Google-Smtp-Source: AMrXdXsy4obbY9VOkYpGsCFQvkd/d0iW6JL6J3zoSF0gvycTp2uXqZG7hJobI0ZJiUD8NDNN85i6vQ==
X-Received: by 2002:a17:907:8c17:b0:871:38cc:7b3a with SMTP id ta23-20020a1709078c1700b0087138cc7b3amr9490203ejc.75.1674016013059;
        Tue, 17 Jan 2023 20:26:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id kr12-20020a1709079a0c00b0084d44553af9sm11932346ejc.215.2023.01.17.20.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 20:26:52 -0800 (PST)
Message-ID: <56a82356-83fc-0a6a-b6a5-7c698bd3c307@linaro.org>
Date:   Wed, 18 Jan 2023 06:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 5/8] phy: qcom-qmp: pcs-pcie: Add v6.20 register
 offsets
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
References: <20230118005328.2378792-1-abel.vesa@linaro.org>
 <20230118005328.2378792-6-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230118005328.2378792-6-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 02:53, Abel Vesa wrote:
> The new SM8550 SoC bumps up the HW version of QMP phy to v6.20 for
> PCIE g4x2. Add the new PCS PCIE specific offsets in a dedicated
> header file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      |  1 +
>   .../qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h    | 23 +++++++++++++++++++
>   2 files changed, 24 insertions(+)
>   create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

