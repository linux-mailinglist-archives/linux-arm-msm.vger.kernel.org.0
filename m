Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BA94E9AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 17:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244426AbiC1PQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 11:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244419AbiC1PQD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 11:16:03 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE991A817
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:14:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a1so20857058wrh.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uonCUbsq6UMpgnALCIguUSF4FkTrQt0BO+vTzeUaeZI=;
        b=FIh8KSoS9APWcWpfnh/RhKuhrhLZPeUHApwsw6utBhUxylUMdQMg+Uu0KcJXw3gDXV
         P1+4XgPrQRT8VL/p4MpfFGez85Sbv7E0tc9qgFS5tY7indaPzAIJmffWGOERyYr7vYoG
         4ZXrStV6svHBfqqgNmvClCQrLouqXGjdxFNTN7JiZ4+ObH9U0G7Cj1vsF63rXmNO4XLF
         4l48K1K9hyw1yW1XXFVgNwDZB6ZNP3rglt0MW/cnn6c/zANo0Fp7M29xJcMa7ycFldhe
         Q5yueT3CjPsngsPFJXO8mQEfpNxdXTTx5NAWXMIje+oV+IVLHo2Gy3DslAgieTb8Emv/
         gSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uonCUbsq6UMpgnALCIguUSF4FkTrQt0BO+vTzeUaeZI=;
        b=5G9xy5kaHhZU9Qq97gdE5+KEzIBVAnKR7dAQWuV93FmZoIDJVJVSIQLtDb1JUZa3QT
         GwdhGKuUQcc7O8Z8sTV/niju34xrcwbavQ17hhJuGClA33yLWH15WmHbeQPPCas6iw6/
         rPFiefRmmZ9haw3WA6qMHqLOJtGmz4JS3xdGR4IgFYpqY/ffOMzdk77jVnhScNTA+WJq
         GMQq6lcpUfbE0H64XCFtxs7u0s5zhTq0xC7fIv0fRmqegX2re/oiDwU0Q2WrFIcI+7nb
         74MBNTYfOmJV7QMLTy4dlunrBRGbd4Jz9OWna9siPZgGvLBbgCrDja62SvprSx+ymneF
         l0Lw==
X-Gm-Message-State: AOAM533oPSN2N66XpVWW/wrS5FPK+FbYABEry6821eJZshAxNCL8zlm9
        KGEX9LqT4hmB33lQJmsCbgu/JA==
X-Google-Smtp-Source: ABdhPJyUDCa+7CW1tpe6SxyVc0Jmadcc+IlG/XnNM7v6+jS4GSTxgx4r6ChNQ1Mfwe/r5mFFCAyT9g==
X-Received: by 2002:a5d:6f09:0:b0:205:bfdd:4a87 with SMTP id ay9-20020a5d6f09000000b00205bfdd4a87mr8596953wrb.131.1648480453154;
        Mon, 28 Mar 2022 08:14:13 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c400100b0038cf3371208sm7141598wmm.22.2022.03.28.08.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 08:14:12 -0700 (PDT)
Message-ID: <3cc9c1a0-45f3-cb1b-1991-f51da4789afd@linaro.org>
Date:   Mon, 28 Mar 2022 17:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250: move sound node out of soc
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220328143035.519909-1-vkoul@kernel.org>
 <20220328143035.519909-5-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220328143035.519909-5-vkoul@kernel.org>
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

On 28/03/2022 16:30, Vinod Koul wrote:
> The soc node expects all the nodes to have unit addresses. The sound
> node does not have that which causes warnings:
> 
> arch/arm64/boot/dts/qcom/sm8250.dtsi:2806.16-2807.5:
> Warning (simple_bus_reg): /soc@0/sound: missing or empty reg/ranges property
> 
> Move sound node out of soc to fix this
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

I don't know the SM8250, but usually the sound node (e.g. containing
audio-codec) is not part of SoC. I propose to remove it entirely from
DTSI and define in same place in each DTS. It makes more sense logically
in such case - one clearly see which board defines the sounds, which
does not.


Best regards,
Krzysztof
