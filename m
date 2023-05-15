Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7C17029B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjEOJ5r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjEOJ5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:57:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CE0136
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:57:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ac88d9edf3so122742541fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684144662; x=1686736662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Myh467EF6Pb3BMSb5rOub3Ulcx5RBQ1EdiBpNyIIW0g=;
        b=jUNxXZq34pXVT5oABufHPA6bk6cJGkYwHrhwPi7Q1prIQN9qVQbFGGPAqDybhOg4bm
         x2/1wnEmdXkgUlPZqKcz0BawwLaAbhKiU867pGBkddyzjYlXfnDzsl2HLtBjb2xGLcr+
         QAnTAsE+9mJA5SNxIyLEK+jX/KazdiWr6xU0EJTCrj1CnhWg6SiTMEchZ+kAXVHLCgiT
         McaDkmsqJ820ZxSHxBOdfKdfcoxlXge4HVYPgrpvISadvawKEPvi21hjECUOd0axfS09
         Mo3Z8BUYoL3kM3VFRnP+Im6Ze/JKUVjWVjNcwK2/aCBDCqpyWfpIvRCaD2gOySw3gGdH
         dPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684144662; x=1686736662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Myh467EF6Pb3BMSb5rOub3Ulcx5RBQ1EdiBpNyIIW0g=;
        b=V8Dgbf2BYeC7xtypGlwN5l9I5NeqNEy11UZMke/R5zkfJF1UUJVEwNzqUoNEecQ8to
         Lla9YZ5I10fFqG3cn/NGmcvqxh8nP1XkC6DZ9Oq/4Nut+B9SZUXMrGpI60uuahDTkyLl
         z/4/V2WU8WiZwnshq5WHpJGqgdKXUoPHdazLheEntZDmw3lPxRhMzE7JtxL/8yD9AnQW
         VmOq6TX0BJIQNB5PBpTVOp1g/K+QtpRgIIfaPQKGSTxUW9OlYeLjxZVjBlME9fYGs6Sx
         aTNa7fheLLro4Zl/F+KIr+PAon/a39aIxbLFQKeEQsS+uMr9E7Qt9fenmqYf6+t/Vit3
         ZY0g==
X-Gm-Message-State: AC+VfDylKDxknWnmGnSkLnr2Yw48PuMAuT9Lh4+4iVB0ioBglVIw+JDj
        /lFZbXGJUkPXNA3z3IlThGJ5pQ==
X-Google-Smtp-Source: ACHHUZ4O9wwfwBkhojonTTHZDmYDldE6sQZOsew94skskrj6x7HP74Jy52PPmgSmZfwDrw2dofo4dw==
X-Received: by 2002:a2e:920c:0:b0:2a8:adc4:a928 with SMTP id k12-20020a2e920c000000b002a8adc4a928mr7297758ljg.18.1684144662183;
        Mon, 15 May 2023 02:57:42 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id v4-20020a197404000000b004f01ae1e63esm2541005lfe.272.2023.05.15.02.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 02:57:41 -0700 (PDT)
Message-ID: <d10d66a6-3e28-5c42-c650-9d00d53045f0@linaro.org>
Date:   Mon, 15 May 2023 11:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 0/3] arm64: qcom: sa8775p: add support for UFS
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230515095308.183424-1-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230515095308.183424-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.05.2023 11:53, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Update relevant DT bindings, add new config to the driver and add UFS
> and PHY nodes to the .dtsi and enable them in the board .dts for
> sa8775p-ride.
> 
> v3 -> v4:
> - drop applied patches
> - mark the UFS as dma-coherent
Bjorn picked all of these up, you need to send an incremental
patch now.

Konrad

> 
> v2 -> v3:
> - fix DT bindings: move allOf: below required:
> - collect review tags
> 
> v1 -> v2:
> - order new compatibles alphabetically
> - rework the UFS PHY bindings to accomodate more clocks
> - add a comment in the .dts regarding a non-standard clock used
>   by the UFS PHY
> 
> Bartosz Golaszewski (3):
>   dt-bindings: ufs: qcom: add compatible for sa8775p
>   arm64: dts: qcom: sa8775p: add UFS nodes
>   arm64: dts: qcom: sa8775p-ride: enable UFS
> 
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     |  2 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 19 ++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 59 +++++++++++++++++++
>  3 files changed, 80 insertions(+)
> 
