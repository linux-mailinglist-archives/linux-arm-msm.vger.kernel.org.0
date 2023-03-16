Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430CD6BC633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 07:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjCPGiu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 02:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjCPGit (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 02:38:49 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F33D125BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:38:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id eh3so3391070edb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678948721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xL+tQUaguCrAG8l0bkW/PCaQ1TD4pHeaAzMmhUx5yak=;
        b=GJLu4dtPSlYfjkqUrhni5FdbLbtDMHfFrsLuqMQP7bK8iqMtcFhtlFo05kS62jRI9j
         qQwzNPlZnFQMuRhwom3D1yqt+GQ+iY4j0w2GPXAjlPc8VNjkecbQnjhNv3hNdmxqm0bV
         HqB2S4Y2Pq9OhcEma24Mmi3EATBwnsiIaGRl6f3Z/QAyn/lo6HD3N69dwa7h1Z/5Axvt
         O4XpUNFJrC4UEEsQDaT8ydIoUWTxW9CoNCow26TfdF9+O9wbXz7R6WvAz+qVW1fEzwVu
         HZ2QnxBKGv+G/vd8GE0Amlk6C1jug/Wv+57dh7aFNEMiNYaO8918T0gJmMeKeI3kc475
         FrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678948721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xL+tQUaguCrAG8l0bkW/PCaQ1TD4pHeaAzMmhUx5yak=;
        b=liauAreUjpKiLawTWUy5UZOILCKgBlDZO+6PNMc02cKagzf/AEkDl+ppmY1o1ZcaCq
         m/bbvNl7sGyvNK0dLJmF8VuGGB7HJq93bD5XMUp+wmzM/Bg5hUeBBdD6vfQHAGrM4rqx
         06vBHDUHS9t9FBOLhcqdnTKH7Qr9cu3/IfpL9krImSZu7BlMPjvJMttCdooeBpCijSK4
         XIJoxJg9UGe1yZMRh0UQzGVR6b8oXAh7o/8a8Wvd8/XK0+BxQp0X6YaZZ7jwCGzwUuqN
         z0qY/sNGQrRQIf2dhv1VGtaRV8t4l/9iGvmkper7R2DRKOYYujHZiCTcZVUp4yOtDDZJ
         6wYw==
X-Gm-Message-State: AO0yUKUq+aXBWn8IrzBOO0Ddqm1y3gjYXh0uPxVPkdF3ygjjARpj0MdS
        aiZ8BdwTNK+fA496flDecK6Izw==
X-Google-Smtp-Source: AK7set94Ab19Zp1BPD8CT8jZdiZ769ZZ4uU4+xoBhiCSndgApyJ4hQhGGlAbgv1hSR6rb6PHkMnN6Q==
X-Received: by 2002:aa7:d051:0:b0:4af:69b8:52af with SMTP id n17-20020aa7d051000000b004af69b852afmr5211176edo.24.1678948720855;
        Wed, 15 Mar 2023 23:38:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id y29-20020a50ce1d000000b004fa99a22c3bsm3349593edi.61.2023.03.15.23.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 23:38:40 -0700 (PDT)
Message-ID: <0f5003b8-588c-2477-2d82-e6cabd77277b@linaro.org>
Date:   Thu, 16 Mar 2023 07:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/7] soc: qcom: icc-bwmon: Handle global registers
 correctly
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20230304-topic-ddr_bwmon-v3-0-77a050c2fbda@linaro.org>
 <20230304-topic-ddr_bwmon-v3-3-77a050c2fbda@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v3-3-77a050c2fbda@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/03/2023 15:11, Konrad Dybcio wrote:
> The BWMON hardware has two sets of registers: one for the monitor itself
> and one called "global". It has what seems to be some kind of a head
> switch and an interrupt control register. It's usually 0x200 in size.
> 
> On fairly recent SoCs (with the starting point seemingly being moving
> the OSM programming to the firmware) these two register sets are
> contiguous and overlapping, like this (on sm8450):
> 
> /* notice how base.start == global_base.start+0x100 */
> reg = <0x90b6400 0x300>, <0x90b6300 0x200>;
> reg-names = "base", "global_base";
> 
> Which led to some confusion and the assumption that since the
> "interesting" global registers begin right after global_base+0x100,
> there's no need to map two separate regions and one can simply subtract
> 0x100 from the offsets.
> 
> This is however not the case for anything older than SDM845, as the
> global region can appear in seemingly random spots on the register map.
> 
> Handle the case where the global registers are mapped separately to allow
> proper functioning of BWMONv4 on MSM8998 and older. Add specific
> compatibles for 845, 8280xp, 7280 and 8550 (all of which use the single
> reg space scheme) to keep backwards compatibility with old DTs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/icc-bwmon.c | 230 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 209 insertions(+), 21 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

