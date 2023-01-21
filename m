Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE99F67651E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 09:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjAUImJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 03:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjAUImH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 03:42:07 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3666AC9E
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:42:06 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id y19so7980058ljq.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
        b=ttPttT4fXeRLAIGUhnlOd/e1nfyPSbx1mjkJhmM+Nxee/NpQkGX06mVqwSY0Hh9Xkn
         DrQQ7z8exjG3ZzZdRqG/CdbF1QxliQh0pkb/uPp3kWuhNSeAKoSrTsHAagWkTgvUd68V
         WnPtqsXV9LNksxGoISAYyl3siHpFd0QjyDmyc2dkHHxhBGAlo3KBv4xRSEfcqS13p9CZ
         MayPk2HmayTK9apWRtZ6KDk+4MnVGtEM4xWbFePfLOWOlufpHsGV4xKWClSrrM27RrH3
         EDdFDFd5s5N4miDsmrQNlVNM5Aj8WCnr2ecetSq0XSRdv4cOWzh93aT3+cLJfbo4kNdW
         kBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rtcfHZAR7Ysq5XNRm/jCy3LiiJsqdTUfh0gGDYHtMjI=;
        b=hOM+lRR+J7n6rz8vA5HL49AuBRUuWpxDyIM+j8l11CmrjrdrHv5nrg9GhwBRETlITF
         jeXVmPJx6xJYZcOFB14w8LguL7HHmcJTONIBL3s0QMCDgZtdTFpCZ+5N9DqPSkgC6ozl
         oBfimnTG1NpewhreznyNxIFq2tE5OIiMpzQyPBQLau52BNVP3lxtnaL8HVNCELnDlDAh
         L1YyRaQznuNpLBA9tLpL13eFoTLjhJ6q/2FpT2e/CklyfFZVDvgCbT1M2lvQq1ilpRsu
         qHkDX73UFyxQ0vCWGUoIXP6S6YHOthnbd1Qqs4YJWDo1ZA54tEadjIZj6bHppX1DEuCI
         fiqQ==
X-Gm-Message-State: AFqh2kqVWH/29HyWRQXXZq5WjLVi5SkfH5iPwUrB//xAr2kKLZPki6q1
        pb9LiWTCQUg277t7mTomNYAQ7A==
X-Google-Smtp-Source: AMrXdXsbtbF+q/skX2lYOVrY6nCebNMS9fJNREzP8Yx1fO97MiS2zdHfmNzBb36aUjgFxzyI/n2Y8A==
X-Received: by 2002:a05:651c:81:b0:27f:d5c6:f4f with SMTP id 1-20020a05651c008100b0027fd5c60f4fmr4446567ljq.29.1674290523906;
        Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k9-20020a2ea269000000b0027fc14cdfa5sm2553634ljm.42.2023.01.21.00.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 00:42:03 -0800 (PST)
Message-ID: <f665b62f-d5c7-d02a-d775-434c4445ad86@linaro.org>
Date:   Sat, 21 Jan 2023 10:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 23:00, Konrad Dybcio wrote:
> v2.5.0 support was originally added for SC7280, but this hw is also
> present on SM8350, which has one more DSI host. Bump up the dsi count
> and fill in the register of the secondary host to allow it to probe.
> 
> This should not have any adverse effects on SC7280, as the secondary
> CTRL will only be touched if it's defined, anyway.
> 
> Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

