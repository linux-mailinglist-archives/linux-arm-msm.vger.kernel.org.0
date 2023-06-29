Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8ABA74246F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jun 2023 12:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjF2KzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 06:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbjF2Kye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 06:54:34 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BAF3584
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:54:33 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so6164171fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036071; x=1690628071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTXI6CJfUgN0RkR7OSBSOq34dP4Vu0vUzUeM36qnJjU=;
        b=kleJqrTtjGkW4dFKIPB6vxzmObhquZgAUpmPBNGTjSQRmLtKwnsDL0NNLuNeML/jsL
         EXULn+B4g+kowqcf9lCmkB+xSpkbvMmtSYaySbje2aIDjRaGlCKDHEWEiJmWpejrk+7n
         Cp6A7h8g5JKlzwhOeC6E1a/tHQwhyCRcbnB1BrSIpHYUoUY+bqB6ysNjAsnFNvrn2Fik
         7gpTtcci8AZd+NLxdRg2tEtV6qhjfPv65jjVtgWTR60rahmGxGIza3h9YupryLLzTWyC
         V6balF67Uxcsrbd8mP5S9EuUYH1mYPEyg0jotsb3tu2NzVpnY/Wt4z2KSpOLWbl+yXmY
         mdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036071; x=1690628071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTXI6CJfUgN0RkR7OSBSOq34dP4Vu0vUzUeM36qnJjU=;
        b=CSGxGoYTYvuDQdh0hACj1EygNnnVpdT3cObzALcYa5+tvXy5bmpWihiwZM55vJ07KZ
         0smKzTipLSgnqK0AEfWf/CXYUB7SRXycsA27HBPUOQ+g4tXad8w5BqNsbgGYdtiB5lEQ
         GF2Fg7jv8nkE46jGIJVDTHYt/pyruD/j/mROxAL1Mzgm7/LBWy7afAPW+bWBfsERSf2X
         4voEdVHiNTVU+Is/gWT+hUm4ywBcNik4srd5nq2QZgglsVjI4t+kBY/LUQ8uKG5+Ukol
         2KO4bOKe2GgiUjfTGLiHF2eS7U90YAanrjspJfKxwS3Z4ZazfQCqmOqEgYWVcgjB6AUJ
         2VVA==
X-Gm-Message-State: AC+VfDzFr5JKVUp5Yzj+kF3AT882ri5sUrJwFIXo+JetuSk0hlsoX9vG
        /e8aXJmPKNLayJU6LXEbJo5IbA==
X-Google-Smtp-Source: ACHHUZ7c7z0nJmNIzNSn+wAu96QJ6uw0uwgrEtuJSTlB3Jox0BXxHo5YhxY4OtpXlfofq/p+O6eZSw==
X-Received: by 2002:a2e:a453:0:b0:2b6:a570:1d5 with SMTP id v19-20020a2ea453000000b002b6a57001d5mr1418688ljn.10.1688036071437;
        Thu, 29 Jun 2023 03:54:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y9-20020a2eb009000000b002b6c476ed9csm367215ljk.9.2023.06.29.03.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:54:31 -0700 (PDT)
Message-ID: <000440cd-07f4-4698-7341-3aa7dedd22d1@linaro.org>
Date:   Thu, 29 Jun 2023 13:54:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 11/15] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY
 configuration for SM6125
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-11-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-11-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 27/06/2023 23:14, Marijn Suijten wrote:
> SM6125 features only a single PHY (despite a secondary PHY PLL source
> being available to the disp_cc_mdss_pclk0_clk_src clock), and downstream
> sources for this "trinket" SoC do not define the typical "vcca"
> regulator to be available nor used.  This, including the register offset
> is identical to QCM2290, whose config struct can trivially be reused.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

