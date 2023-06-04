Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B0672142A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 04:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjFDCjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 22:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjFDCjR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 22:39:17 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43579ED
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 19:39:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1c30a1653so4083541fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 19:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685846353; x=1688438353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
        b=jtROz0fXdfiIHIOYlEGo1RqI57Xt9Eh7ZYyQddwsfunow3aWsMu+/HxczEcLuRPp4Z
         dKNJIgsMVM+VI9k3As1NYL/xM04D0fuv5WSC60Osribmnui3GsuILV5nN7UdslLRJOr4
         GTgyMtPEEn9aI5eHz3iisjsZ2bfqOL6povcl77pSnghRPbZVb4BoDtq/QDjEmBNZmgU2
         Atsa6su2/AssHHBu/bWGpBELJ1aj3i046yFYYR6rwNaF/4Lt6eBARlYFG0VqxSjOciIT
         yRbwGjO6oWfFV+za0yY6Wfz7P7JcI7raZvcOfx4x8MZ/FdPqu+kJOZpK46YhRY8rZ3TX
         u2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685846353; x=1688438353;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMukeZsIPK9VY+jN6lO5nE+HniRt3DWSTDLIp8k6jQc=;
        b=A5MgNe2Ke3EtCSGYapWOtF93lQkkYd1QfVHhVDf5bYTyDhj42uOf0U0q4Y5qW4dDjP
         Dp7mo0pQi2NCe4qk/6I/pqW/Gf9Gd98P6XLZ8jTm8gUw1Evsf7aFnaYoTt2iDR+gCv7n
         KHWE5ZyWIVKK2mtJ7gL2f7r4IImKP8ivCFuRzpUw8PTPyxQ30wuA3TrGBDH2q9u8X3Lj
         N/dBJWmdkbq2DePuOnuzZ8tyYOj9TuJccyM5q7oQIZN1gSCTIXt3q8X7I8Y9m9lIjwhd
         OI973hAJ+yMw4xtDd7FPdVOcMXYHoaWhRuGTtJcu4gCqNWPBtYHNNVdtdh+xfPoAtlXz
         yksQ==
X-Gm-Message-State: AC+VfDyiSJF3wf+6YMnMemJ6YNopLS3uEcRDPjpbLbrYFGBnpn2PeenA
        cYH6JH5NpwAe9rZGGl4Ig08lRg==
X-Google-Smtp-Source: ACHHUZ5D9QfTFJ7LYIjyZ34kZ1xnm+FM48ToTGYMYOaQS6D5GlphlJ2LfDuS/Lo1Qo+BuGyfh75rVw==
X-Received: by 2002:a2e:6a18:0:b0:2b1:af36:93d9 with SMTP id f24-20020a2e6a18000000b002b1af3693d9mr1987200ljc.26.1685846353479;
        Sat, 03 Jun 2023 19:39:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d9-20020ac244c9000000b004f24db9248dsm210750lfm.141.2023.06.03.19.39.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 19:39:12 -0700 (PDT)
Message-ID: <b038052c-c8e2-9aa1-2b80-792563d219ba@linaro.org>
Date:   Sun, 4 Jun 2023 05:39:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 6/7] drm/msm/dsi: Add phy configuration for MSM8226
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/06/2023 20:00, Luca Weiss wrote:
> MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
> based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.
> 
> Worth noting that the msm-3.10 downstream kernel also will try other
> sequences in case this one doesn't work, but during testing it has shown
> that the _m sequence succeeds first time also:
> 
>    .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
>    .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
>    .pll_enable_seqs[6] = dsi_pll_enable_seq_e,
> 
> We may need to expand this in the future.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97 ++++++++++++++++++++++++++++++
>   3 files changed, 101 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

