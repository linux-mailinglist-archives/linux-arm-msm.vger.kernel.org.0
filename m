Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1355177F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 22:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbiEBUZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 16:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234035AbiEBUZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 16:25:18 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD35135
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 13:21:48 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id s131so16341302oie.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
        b=gydCa1XT3apUAkWqXWGcIv8NATUn3b5OIjEgWQojw1AQGHzMfpZeo9joN/mAtp6vF4
         RATtUVBlgARss+TIibRbANVlifmimy169eXr6DHY32MIJqavLG7QyZWzHaVCqkKbsbGH
         bTsbNB8No7BI70qEq7TAxEiYAo+mL6p0QUQVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Hnmgk1ySV+moaLIfrdDLqyWaX7EZfxJDQNVTelHhwlk=;
        b=nYaDw/7z3eS6NpwpbaOU2pjcnYgPovuFHlquj5JEN0UUL5vZvUsM1yY8b8JU38ue1g
         dONjK+TAZDair2jBV5hWHpbgiqH7R31nX85hg7AUYBEskvn6W45QStxO54xabJ67LaG8
         NwLx8K8hnBqmmBadwibK7MC2TdXmxCIz2nsZ31EINvEYobrLoOi8jeD5gHI0No5gDU6N
         DBDARWLAcjMYcasoAICUZR2b4yN33DsOptO29vfgBlwUkeTGnSru1AoviEpGAcxDLBiQ
         5QvH5DhyL5u0FWyPzhOGf/8pcmRjv4e+4Lxx0Vt92m9b7zGQZcx+dSG8i2s+PC/KqKBz
         FhRQ==
X-Gm-Message-State: AOAM531yDUFKvvczA1NRZrKBWESEr3Z+LDwRFh7Y0vN/e/HxtbxeS5jt
        B6hBplRnZHK65hgDKcZJqUxXvUOz5yrptwnrXAnblA==
X-Google-Smtp-Source: ABdhPJz7Vn608xLnAEGnfBR/CF4+B1u6SgDOO8wJhOwh61lwA74hFrR7wESd2zWhIRSmS2D8o8Hov5xpX/cGP4R/d9s=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr389482oiw.193.1651522908083; Mon, 02
 May 2022 13:21:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:21:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220430005210.339-1-quic_jesszhan@quicinc.com>
References: <20220430005210.339-1-quic_jesszhan@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 2 May 2022 13:21:47 -0700
Message-ID: <CAE-0n53rPrJwK+6BfdeDR-LYmLTrdbvagrQZzGtM34OWtW8aVA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Clean up CRC debug logs
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org,
        quic_aravindh@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jessica Zhang (2022-04-29 17:52:10)
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
>
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
>
> Changes since V1:
> - Added reported-by and suggested-by tags
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
