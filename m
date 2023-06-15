Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A600731BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 16:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbjFOO4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 10:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344255AbjFOO4U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 10:56:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 353622943
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 07:56:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so10698650e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686840976; x=1689432976;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csR9aAPz4FxkrS5GoizHZQY30Kq0wuoDZfsCT7YoxRI=;
        b=bGwN4OOTlXZmzNmKYqwuRIkotLX8Hfm3b+WpaLN5VJrIZxhyUsmGwD77SDAvlTE+65
         iIx9QBCNy8yWBKh3RlkcDQ3MiLIef1yUH2Q52dSUArqPjsCXkkQ6x6/agefJ6OOTsy7m
         m60FCRekV8IXEkTL8Q/UKHx2KoRPGflU0ELRN1YbB//3y2qaMq00bHdFMl3SQX0aYwct
         ihQoHgcX2Iv6q0kvgR1XAPMzjzc3XWjANHILQR79zX/HWln7r1quE2wN4ey/ZkTJx9x5
         CoRQ/vYprOJcaa3oBC7v+RYslihtx/jLhuuCi9a/Rn7XxQLiZZivXi1FESD5GUpfwhZz
         NKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840976; x=1689432976;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csR9aAPz4FxkrS5GoizHZQY30Kq0wuoDZfsCT7YoxRI=;
        b=UifrYSwIGbvJvyQm1SkXDGDVv2oOj2tbeagP/hs4uQqg4r1VXH5l72YJVvAyuWZ0fn
         vMx+58kMCmGxLAU/jf0QVAbmgHI5eyIuYqkD4V/wf+qOQXxTT7uCpvOXkeet+0RLNpCn
         sULrXeNw1k1KOSDAxIumpYbdBfIc8t/a1zZqbQX3UCQnh3t7kbpdPV4/XT2G5kevzE6y
         2ABGvy+eqolJBX288ZfeXBNG/QZiWgwZrqXJP2VddP8GSddMvtn9WygA6yENaCH4nzOp
         gqm8q6fZ3mBPQoF7fl6IuCLif5M90+Li+Ej26oubM8MnDvZ4L5Mr5WV7I3nlMAquYtHY
         p6gQ==
X-Gm-Message-State: AC+VfDzbp40PD+gVySkQWcDHRo4++cWBj04nbiW16kmRmgv3W2u/aIXg
        ZynOblec1FFOqwRT963Kd+NUGw==
X-Google-Smtp-Source: ACHHUZ7hBxjCGZTKAwkEC373GYuu2jd0RjRmG41v9QxKfkZIW4/NAzQlHgHBYYrzdaMlft4FApbh4A==
X-Received: by 2002:a19:2d4a:0:b0:4f8:49a7:2deb with SMTP id t10-20020a192d4a000000b004f849a72debmr135604lft.8.1686840976383;
        Thu, 15 Jun 2023 07:56:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id w6-20020ac24426000000b004f755ceafb4sm1056055lfl.159.2023.06.15.07.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 07:56:16 -0700 (PDT)
Message-ID: <56a04da4-310f-7995-f7a1-bb1873353201@linaro.org>
Date:   Thu, 15 Jun 2023 16:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V2 0/2] Add support for GPIO based leds and buttons on
 IPQ5332/9574 devices
Content-Language: en-US
To:     Sridharan S N <quic_sridsn@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230615145311.2776-1-quic_sridsn@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615145311.2776-1-quic_sridsn@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.06.2023 16:53, Sridharan S N wrote:
> Add support for wlan-2g led and wps button available on IPQ5332 and
> IPQ9574
> 
> Sridharan S N (2):
>   arm64: dts: qcom: ipq5332: enable GPIO based LEDs and Buttons
>   arm64: dts: qcom: ipq9574: enable GPIO based LEDs
You sent a v*3* half an hour ago. There's no signs of [RESEND] or other
explanations and the changelog is gone.

Please now send a v4 after you get reviews on this one (which I assume
is the latest) so as not to confuse the patch workflow tools and explain
each of the previous submissions.

Konrad
> 
>  .../boot/dts/qcom/ipq5332-rdp-common.dtsi     | 39 +++++++++++++++++++
>  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 20 ++++++++++
>  2 files changed, 59 insertions(+)
> 
