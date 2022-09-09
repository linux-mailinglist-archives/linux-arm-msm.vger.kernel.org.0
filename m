Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27445B341B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiIIJht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIIJhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:37:41 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8C097EDE
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:37:39 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a8so1693216lff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SXD4yRr2wTLtswQrrWTaQpfDTO4oenQgkAblYwtJOXY=;
        b=SE7eDe4CxGd7L3exB9DwNRCm+q8otphqU0V+638Si94Svkbhr0bEyeaSqsJ6GZ8xQL
         0Rz4YQ1jI6VMMdhOrCIeGwlLSk0QwbN0uwZ95R45KuCe2Fvo6plPyJrcJYofo44bLM0S
         dRvvhFnLD8xTIdUTkdysfM8bAAAsKBE3UwQk4LNrhwayeWFf33tE1yQh3t+NQiLB1qku
         P2ijAVwvdaqslE/mw4kNSx612PVK+QLWK0CbJUzrcyEzzvvMzNUHqbFse1NSKJWl382O
         WhZm1lmCHZ1EYUPsIz+PL+p+5o1VqqVGxeNw2p0t71UvcRuxONUxiJTZduxp153TV5Gz
         t5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SXD4yRr2wTLtswQrrWTaQpfDTO4oenQgkAblYwtJOXY=;
        b=kNKf6BcbgHWiFz8hUfwcyuM7yDwkwX2tIilZJGYdowzhRTBxE5ngfcQtJ7Bzh9o6cI
         NfxPtss4GjOvwooSsIDIsJ6Y5a9k/fNoLBmLLphS4Nk0oTARZC/e6/GDKxZOWYD2xr4h
         Br1FQUVHSAP1V8R/sprMKQm0nUCgzmJFXbUmQIPUFCi45R/HMUIHdzHo6orXBC8t/unn
         WH1QNqp1UOrxJqMN8jbCXHUi7EkdahI1FrH5G/VdjXOOgjFnqG9f+xzrYBDIiN4sdwqt
         Hil94aivCsNVqpAPyB7MyrmfZDXS18Y6x5k1KD1Sdpe8QgOpzhlPtfcypU5kR3i84Fzf
         RqGQ==
X-Gm-Message-State: ACgBeo2T3FwcnvVZlCHXFQLkZWHrfGnRxfpEpFcpNdWz741SFJHc27h+
        LzCvpIROVmAqaTyUQ9tJ+JpEJEeK9IfpCw==
X-Google-Smtp-Source: AA6agR4xazgW4nbm1Io8z69hyNYtHUdL9TICI3XSS/+5iekya2PssfTCwUhClbVBFmItzTAdglmeqg==
X-Received: by 2002:a05:6512:3194:b0:494:716d:34e2 with SMTP id i20-20020a056512319400b00494716d34e2mr3871433lfe.147.1662716258194;
        Fri, 09 Sep 2022 02:37:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n26-20020a2e86da000000b00261e8e4e381sm14607ljj.2.2022.09.09.02.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:37:37 -0700 (PDT)
Message-ID: <10c259b9-00ed-f596-4118-5a57ecef6a4a@linaro.org>
Date:   Fri, 9 Sep 2022 12:37:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 05/16] phy: qcom-qmp-pcie-msm8996: drop unused runtime PM
 implementation
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220907110728.19092-1-johan+linaro@kernel.org>
 <20220907110728.19092-6-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220907110728.19092-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 14:07, Johan Hovold wrote:
> Drop the unused and incomplete runtime PM implementation, which was
> only used by USB PHYs before splitting the QMP driver.
> 
> Note that the runtime PM was never disabled (and state restored) on
> driver unbind.
> 
> This effectively reverts commit ac0d239936bd ("phy: qcom-qmp: Add
> support for runtime PM").
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 37 -------------------
>   1 file changed, 37 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

