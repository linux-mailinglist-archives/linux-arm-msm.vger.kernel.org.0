Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F12574B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238269AbiGNKw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238531AbiGNKww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:52:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21873558E6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:52:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bp17so2163387lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DHXkjwlr3U5vkzWkJVta+3foxz2UP94aHjYe2Y5kqwY=;
        b=PSxqoLrcQTQFyCZuNP0liiB9Ijs9w3SF3QMN2yAyEFc/u7ms/qR+n0vaT3FOCiJOrX
         AForTZxETJ1kbbiy8bcEmv5cVkN2lT0QCcE3qHTbB4c9I/3TMijabhxltEYEmwkxJgeu
         W1tFOIMZEm0v3+426/oTOZtQUF6FmG6/E2IBzGutGW+5SqP5p9Vdao4YfHGcw5mVMXF0
         v7Z89uJUvXP60gXxybs1PHkwsEsOb+Uuj7Ku1UfcUNTQWlOsz0m39hBTlPOI0YevrkUm
         hNmRn2r3w0Ak4G79R4s09t6W6Z4oRpj/EZQAroYU5+wCJH4wRCcozbJirFbISjVgnWqU
         GblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DHXkjwlr3U5vkzWkJVta+3foxz2UP94aHjYe2Y5kqwY=;
        b=J/rOqbl4zYN9Fsj43CLII3x7fUjid1j1zutsF7ACJNiPRVJuhdIQZ1TO9V1P2A+0XY
         mS2KSNZ0dVhbSecNGgxbBUdQ/DLeCTfEavIAUeYWZrnsiy+pzeaRJGm297vJ9XYtlXeb
         CCDWLTFwYp6IUwy+QPOwBT2cieODa1kxqyxdQgSOsRVoMcJhwwTXe4C14v4f2xiGbX36
         UsvkHwIsG2ICcbBqvoycQcNxagkTPwYaiTaCSwwGFRRQCt9QSyBBIolmxQ4cRhFd3w7M
         GUmLgIa0mPiR8rzsGI3338vaNmAxOviE2Ta3NNZJfZxdT2WH7zqzMDlShArve9tO+Oix
         gdUA==
X-Gm-Message-State: AJIora8Qy3bVO+qC7x13zBAG7gqS9Ucf+LXeq5jRKlQxgitrVfkfsu10
        FKQGKMDdb1u8d5qnXzr78rrjzA==
X-Google-Smtp-Source: AGRyM1vyj/lb/9StTU77bK3/BKGvF1oROqksBOdGTo/sWz8LR6M4QvDEN8PUQ/vQbWLWani8ZY7QMA==
X-Received: by 2002:a05:6512:3a87:b0:488:a3b8:2d43 with SMTP id q7-20020a0565123a8700b00488a3b82d43mr4777850lfu.227.1657795968511;
        Thu, 14 Jul 2022 03:52:48 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512358e00b00489c59819ebsm297110lfr.66.2022.07.14.03.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 03:52:47 -0700 (PDT)
Message-ID: <ac7bb37e-fad0-c6d3-363e-059725bec0c5@linaro.org>
Date:   Thu, 14 Jul 2022 12:52:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc8280xp: fix USB interrupts
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-6-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713131340.29401-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2022 15:13, Johan Hovold wrote:
> The two single-port SC8280XP USB controllers do not have an hs_phy_irq
> interrupt. Instead they have a pwr_event interrupt which is distinct
> from the former and not yet supported by the driver.
> 
> Fix the USB node interrupt names so that they match the devicetree
> binding.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
