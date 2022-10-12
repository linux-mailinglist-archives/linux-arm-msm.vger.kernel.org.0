Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3895FCC3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 22:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJLUm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 16:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiJLUmE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 16:42:04 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D348010B74D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:24 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bn8so22031643ljb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H9ujzXXbv59Z0ptRngoz8lOSltMFrDvEPG60FkW1YYY=;
        b=xRZxj8PCSNCd0Bbgj3PBrUMAHBn3irq427ifdBdiCjCGRG4/KWYi8ajIMQx2OGFw8C
         FfrykJMM3gcedik9yVLkjs4X+qsYKP2X2SRKqYUkY76dutEZaTkv8RxprJeK2DVyfdZt
         bhNA7ImS+rpAFpsc3ghi1U93MlNBNmOz24tVQ0li9HWVSU3CKbgfIEPJGwUu5TP7mESN
         Qq/bY4CnQ/kOlDr3DQrRsWvo3kd4bQlNjE9OcgV9lnxFvCzxhZpsXAmJKCVkb3PotWzI
         XBSKMZc6OhIf/tSsMO5RaxmmetzmQ53855II2edLFr+PflLL+sOo7JS/7+DpiytGAuhA
         n6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9ujzXXbv59Z0ptRngoz8lOSltMFrDvEPG60FkW1YYY=;
        b=aT97k7Hhm8PLRud0XCIzrr4M7h9xVXV+10smLjERxE/Ta99I6/luEPUEDWBgxfaxGd
         bJMabYtt4q22W2SC6nuQRsKmCJVWNVfBuoE5TcAWBv3ck96UBxLI2kYs59X+kWTKNoi/
         P2j4p2GrxjarQRNsm27edZfMaOy2C/L3HU7kwVsyivrUsToctYlEPiW0UT/GT+F3feYX
         8bSYmR6m05Heu9py1rPnRKramtBtus7pghabZfQaAb/6nZbCyS7Ms+lCL0K/bsW7zf4a
         b4SynbABpV4AKXTahBtJKTJqjAurbbGX6sY0g7uF0QyD8ihJejeffBICzxnkmJS5EQy7
         6JAA==
X-Gm-Message-State: ACrzQf1XA0zfFU8THOhGixBdg6nHNhxpCtntx8b4xgvuO+kAp7LaTDv0
        SSpEPUOzNjE5O21ZjDLt95hK0w==
X-Google-Smtp-Source: AMsMyM5b3xOm2qqiyzFNGlyybWqS3MJgLrtQhJvbNFAjqafg2S0TGvBiiPOYdC/h3x/1jQ6FFurYPw==
X-Received: by 2002:a05:651c:1102:b0:26f:c343:f378 with SMTP id e2-20020a05651c110200b0026fc343f378mr798461ljo.261.1665607279120;
        Wed, 12 Oct 2022 13:41:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y1-20020a199141000000b00492f0f66956sm89007lfj.284.2022.10.12.13.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 13:41:18 -0700 (PDT)
Message-ID: <6db36a1e-731b-491e-f0f2-5d2ec70e8be6@linaro.org>
Date:   Wed, 12 Oct 2022 23:41:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 13/14] phy: qcom-qmp-usb: drop sc8280xp power-down
 delay
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221012081241.18273-1-johan+linaro@kernel.org>
 <20221012081241.18273-14-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221012081241.18273-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 11:12, Johan Hovold wrote:
> The SC8280XP PHY does not need a delay before starting the PHY (which is
> what the has_pwrdn_delay config option really controls) so drop the
> unnecessary delay.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

