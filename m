Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9903D695366
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 22:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjBMVvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 16:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBMVvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 16:51:35 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1858B17162
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:51:33 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id sa10so35280293ejc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 13:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUpjCT580eIamS7QEB/Hj5fWMwSgSVQG6uKwdpnGJwo=;
        b=S+sOkd0b6eN7z3Ur5MTQ7tVd+PEnlrg4GQlMZjXGjwZ3bIwh8ntLN6LyTo4kWlk8cD
         iWgZxT6zetryWitgM1p5Hln517yd+J6QkNL/5/390W2PcpqLaiTRAY2/pWMknpGeB1CD
         ifz34yh1uLSXIH1fwz8yY7TvcyNmgS4Y2T+mkB4tm3kM7zHxpNmzRnry4KB6XKVHDqKc
         eA4uV5Qi+7mrnDmH3368PDO/cQfPioOzxSmy2OLN8fmDDdNnqfLtkCFuKGVlLiFg3QYe
         LGfpEy1vaX72mlGI2GfFxlFyWg5xl83n4+uc177UFJEct2HizO0+F9cSBl4eQNSwlmzv
         dBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUpjCT580eIamS7QEB/Hj5fWMwSgSVQG6uKwdpnGJwo=;
        b=ehl0bhbCi864eYatiK7anvuavDcRrTseH39fV6b+pK8Cg8ZGl7DJ7LEmrdb0b3UgOU
         CHbgbcZzO9P7cXHsaaN8ss4THd4+jwTq+qYA2wbR9PtcLpj40CZVUS0iTyqLnTSZGAT0
         vff7Jb7Nye7m9/+Zn2oieaLRNPOxmXYx66FSNGUWWP2WYc+hckrF6n5sOwLr2RHBwB+B
         B9acPQWsn5NYEbT7CCVbpRAkJ2C7Evdy6uAiiJqx5wGLInvCoKI1mZ/2cRyi8EdwFvNX
         PugpCYI63zFwczj65K6pKoUE97tAVTTLnLXxCzK+tvFNZ0pYsU63+iEQlKvvKyghqzAP
         ysLg==
X-Gm-Message-State: AO0yUKVpTkvuXXPU35Psh1eKFHagcSqnB9L7KB5zKnodTV22eMpRGPCU
        AY0iQw3biw0TxP1l/0AsCdtb/igEz7dRZhRo
X-Google-Smtp-Source: AK7set9qLV84uDx5VeuBXVeINqKPVKCp3FzJQJDsXdvkFLe6k7HBV8fW5OJ5TgIWROtz7o3hn2kUbw==
X-Received: by 2002:a17:906:87d1:b0:889:1eb1:7517 with SMTP id zb17-20020a17090687d100b008891eb17517mr413130ejb.30.1676325091616;
        Mon, 13 Feb 2023 13:51:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o13-20020a17090611cd00b008b12c368ba0sm66995eja.45.2023.02.13.13.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 13:51:31 -0800 (PST)
Message-ID: <af5679a4-93b9-fb9b-cc5f-8669da57b7cf@linaro.org>
Date:   Mon, 13 Feb 2023 23:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v3 0/4] Move TE setup to prepare_for_kickoff()
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230213194819.608-1-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213194819.608-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 21:48, Jessica Zhang wrote:
> Move TE setup to prepare_for_kickoff() and remove empty prepare_commit()
> functions in both MDP4 and DPU drivers.
> 
> Changes in V2:
> - Added changes to remove empty prepare_commit() functions
> 
> Changes in V3:
> - Reordered "drm/msm/dpu: Move TE setup to prepare_for_kickoff()" for
>    clarity
> - Fixed spelling mistakes and wording issues
> - Picked up "Reviewed-by" tags for patches [2/4] and [4/4]

Is it just me or patch 4/4 is missing? Patchwork also hasn't seen it:
https://patchwork.freedesktop.org/series/113967/

If you can send it with the proper in-reply-to (set to 
20230213194819.608-1-quic_jesszhan@quicinc.com), that would be great.

> 
> Jessica Zhang (4):
>    drm/msm/dpu: Move TE setup to prepare_for_kickoff()
>    drm/msm: Check for NULL before calling prepare_commit()
>    drm/msm/dpu: Remove empty prepare_commit() function
>    drm/msm/mdp4: Remove empty prepare_commit() function
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  7 -------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 21 -------------------
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  5 -----
>   drivers/gpu/drm/msm/msm_atomic.c              |  3 ++-
>   6 files changed, 9 insertions(+), 56 deletions(-)
> 

-- 
With best wishes
Dmitry

