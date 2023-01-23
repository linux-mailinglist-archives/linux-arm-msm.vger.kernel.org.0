Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B356779D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 12:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbjAWLIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 06:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjAWLIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 06:08:00 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AEA4ED6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 03:07:59 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so17621929lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWWvq/P2rQvC944dHoFoJoaCJsFP0QQ/YpqQ85XOpVk=;
        b=xlVmUlnce8mcOV95i8iMua1zPcCngTN5MWrfnKG5ipN0/e9uX4fQQJd+C/GHFpF9vi
         aF48PdvD3Wo2vYrsOtnJ82LZMEnCR7PhDDmGFuKPlcflSiy9ayRYfliLQo7i4y3ik8TE
         diobAqRXGznqiYzol4m3/N+4Hs00blHCip1VQgRs1UWB07rMrPKR1GkTtGcoh+2mp2z6
         gra3qm0b2xaCiGIh0Cs/Fw4t8qTMBXJ+gQBIf0tVSYriUO0rr3EGwOv67RlxXUshKgmk
         uLz9EO+bwnhl4a2a8vcYE1ul0ucBIVJx6ua2sLC+1TPLryoIuvxFWcwTyN2NRfcrZhb8
         45tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DWWvq/P2rQvC944dHoFoJoaCJsFP0QQ/YpqQ85XOpVk=;
        b=k7Hswq4gw1VhEU8kjia8MG7GSW7pxumtoOKiLkjBLjHFxuuNqqFRo9alxMk9sZXitK
         q05ihTT1bMN/rQU1siyABjYkWiHm6nfRQayvlRjMDFnkixjQ49/ZFJzSOjcA2cgdey55
         jBY7CgAqnmUv/MG9tuOkJP8BG7nt9mxseHvWfliwZYWcQYsTrdsDHUTZlATIwdpxa6TL
         +iy373kAfcn7SyOJTsOECDtC1DKeW0PAuoKRyFJaZlj8u3FT97z65KDq0EDfKsG1rBD+
         i7ALQZRDIT6g/3Y+n96BlcEQh9nRnB2TpPhF1E449KYr96+ySJ4zd6EPK0NQ1PanwXo7
         72fg==
X-Gm-Message-State: AFqh2kpJPi3AI/y5n0iWf+m1mlQYhUIa4p5HLMtB674AZ8tfSoioqO2I
        5trf+EJjl/1gGVnqEIbMlhe38gndMQj/Lw6E
X-Google-Smtp-Source: AMrXdXss9WKzPKtAzjxDfNCYuw33PRC7qMBIXqzr3PPEyoU775UKFXrJ60jxxXh+Iaq6da7YeygnKw==
X-Received: by 2002:a05:6512:b99:b0:4d5:95c9:4eb9 with SMTP id b25-20020a0565120b9900b004d595c94eb9mr6473785lfv.44.1674472078039;
        Mon, 23 Jan 2023 03:07:58 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004cb3d77a936sm6494240lfr.46.2023.01.23.03.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 03:07:57 -0800 (PST)
Message-ID: <a8d0a067-f5ff-6bd8-0552-99554b52ace6@linaro.org>
Date:   Mon, 23 Jan 2023 13:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] phy: qcom-qmp: Introduce Kconfig symbols for discrete
 drivers
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20230114000910.1256462-1-swboyd@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230114000910.1256462-1-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/01/2023 02:09, Stephen Boyd wrote:
> Introduce a config option for each QMP PHY driver now that the QMP PHY
> mega-driver has been split up into different modules. This allows kernel
> configurators to limit the binary size of the kernel by only compiling
> in the QMP PHY driver that they need, or to split the module up into one
> per PHY driver instead of one module for all the QMP PHY drivers.
> 
> Leave the old config QCOM_QMP in place and make it into a menuconfig so
> that 'make olddefconfig' continues to work. Furthermore, set the default
> of the new Kconfig symbols to be QCOM_QMP so that the transition is
> smooth.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/phy/qualcomm/Kconfig  | 50 ++++++++++++++++++++++++++++++++---
>   drivers/phy/qualcomm/Makefile | 12 ++++-----
>   2 files changed, 52 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

