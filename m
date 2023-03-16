Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C75456BCCC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 11:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjCPK3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 06:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjCPK3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 06:29:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA71E64846
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 03:29:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g17so1678916lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678962565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
        b=hPGRGxF+ke8z3JzOJVv+C09Jmuv4N0i5SYgY2ZnNIKaXxFPKIJ7v7rnm2ULALJDkS3
         BN+pVAOZSFrQcXJ72EtdmQLp8W7xIabGTpOC1j1pFwBeGr3S2feU1PHVkEeTqdTutiPw
         aU9vqjmKMMz40gaZ8L2TzgsC/ycD6WoA6uapZvUDjCeahwljPbAPNVSsRefd0Mq9y20n
         fdX4PKenMaxkUbhjaaU7NYQUZYUJL59wmPbtVVOg7gfHNbtejQlMvxNRmrqa60LdbRxE
         2y2ayOBGkrD8bvHM/UhTZZ8TxMdjgvxZpe44qY/YBMkbC6Sfiyj2cTlfsM4hD2W2wrYN
         /TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678962565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
        b=qbEI4uQLAiT1izDXfEOIcdlpvbTtnYwO1tv2hM8+EIIXxph1XQp3PlYBIVjvFaBoOh
         wPZTAOcBnnXQOVa498cR5a2VnyrFQQ4HSL/f7flyk+lrTYp1g2JuLhELr2dyKAvWBr7w
         pfOYF4xyh1W3bIzFF6qRNXsmmZJiaTpSnZLHh4N9AKD4ILCl4Jhbg800gPwmz6zX1DO0
         pdbwe7UUzq6VR4Ekx4fn9MsiOf9Hs0da0d/ePpl6cikGX7kTgf1zk6lEH4JgRi5qGpd/
         Qb8uxIdXvYK8bdjia1tYaYA/xvjhwm1iqZOpIwigTn7DZMpaoaRLxyphbI0SlTHVEmDH
         TrIQ==
X-Gm-Message-State: AO0yUKXTQU9+YpsdX/GjtaVj5kJwaKKTGPaWvfMB2332Mk+PklziP73P
        Qm3zd6vnm5M2B6lRozOrSXY+8Q==
X-Google-Smtp-Source: AK7set8RqMAmh9lKg1cILMKHSx8C7wupxbgS49UmQD0f1euyKuqdXR0j+LcLnHCcQgn5HAX+nmRHtQ==
X-Received: by 2002:ac2:5dd1:0:b0:4e8:4699:d01 with SMTP id x17-20020ac25dd1000000b004e846990d01mr2775148lfq.27.1678962565001;
        Thu, 16 Mar 2023 03:29:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n7-20020a195507000000b004e84896253asm1169523lfe.251.2023.03.16.03.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 03:29:23 -0700 (PDT)
Message-ID: <5cfc6a2b-5b70-c44c-17d4-9c5dfaa33f54@linaro.org>
Date:   Thu, 16 Mar 2023 12:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm: msm: adreno: Disable preemption on Adreno 510
Content-Language: en-GB
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230314221757.13096-1-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314221757.13096-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/03/2023 00:17, Adam Skladowski wrote:
> Downstream driver appears to not support preemption on A510 target,
> trying to use one make device slow and fill log with rings related errors.
> Set num_rings to 1 to disable preemption.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

