Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFD253473D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 02:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbiEZAAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 20:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbiEZAAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 20:00:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E229E9C7
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 17:00:43 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s20so122493ljd.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 17:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5zFPj/Lsz3VZ73WXe7ELTaWMJ+ZxRrgEb+Xb7Ni6Ng8=;
        b=rRb5O2lnxUEM86uGzt4QARS8Zro0rCTRgxDkl72s/BixfUdbeOJwKVcaD6sELjlSeL
         4wmxYHFoW+AHCNuRytUGE4osuUmVWxyQCJatTr9mFb0JWbVTuj5hDcbb9Bx8ah5Y2ANr
         oZTJ2gOqyKcx6NfQ1+DdnUw4f+31qvAbu/fiaIekn4aWvMj0V7Z20BLH0f0nR83FZBeU
         8K4sAyz8DXY7Xn2Bgx2Y+YDU1ceZ5+zxwx6tlN/oN5VCtrNT8SE8QCnKSE4zm7F87OUp
         ALjVkTFCx/ZYSdNj/vQB71ouBav/PQRWiNsrSOYkR4UPxJwDV5WsXpsy1zIVEox2c/E7
         8wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5zFPj/Lsz3VZ73WXe7ELTaWMJ+ZxRrgEb+Xb7Ni6Ng8=;
        b=BgMNGPv2qRmP/hWHiYdx8nSqa4Wm2GbdB4nN29Tzge94RsyEBKaSR5OWxhpUA0rIIe
         hJ9InmlWyuAZyWfAvSfHMlCn6BY++pkDvsLzIMVQrkuLPRgJAodzX5FV3PnCbMRMnoxK
         RRrhtgUuTSHgm3mx8Wn6IP33MzsvXAuy2Qw7mvHK+JUIxFjyGCrqPKPIPMtfeZM/WVR2
         6Jixw9jTy/P1mr5o5mnX4BF7oduEmjRW5946TB6qfxyrai3yba9AQw8ve4QoYo7je6+y
         VeGnKFtLJbExXkWLaoFqXrJRLaarSBPSvmsJIQ/w38YAagp/T9qsDGsmeWbLEx0/ijzF
         jB+Q==
X-Gm-Message-State: AOAM533b4ij/x0FJkHdxJMuRM/kGpCjxp1Os1SkliZfC1M3NRwh6zojN
        ZnU+t9frdgg441ri0mGmNYSpfw==
X-Google-Smtp-Source: ABdhPJziV0fg3DLoCNTmn2wELrZo2bGxcnHBlQlnXkE4kaPIaEikeAE1K5M8cxYQfWgnJZf5fwVgtQ==
X-Received: by 2002:a05:651c:512:b0:253:fd41:12eb with SMTP id o18-20020a05651c051200b00253fd4112ebmr5878583ljp.429.1653523242170;
        Wed, 25 May 2022 17:00:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d13-20020a19384d000000b0047255d2118fsm16353lfj.190.2022.05.25.17.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 17:00:41 -0700 (PDT)
Message-ID: <941eb91e-cc80-4987-f481-63bd53b739e0@linaro.org>
Date:   Thu, 26 May 2022 03:00:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 1/3] phy: qcom-edp: add regulator_set_load to edp phy
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
 <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1653512540-21956-2-git-send-email-quic_khsieh@quicinc.com>
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

On 26/05/2022 00:02, Kuogee Hsieh wrote:
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

-- 
With best wishes
Dmitry
