Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF25C7DA47B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 02:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232920AbjJ1AjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 20:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbjJ1AjN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 20:39:13 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3339D10EF
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 17:38:53 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7b3d33663so22014677b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Oct 2023 17:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698453532; x=1699058332; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
        b=mmsVur955EeOzgSBKKR3GTz0Pp4NaZt1xZfbaENM3r1Ma+VelsxNZnKX0DIRRfDFpe
         IeVP5vk/qlLQ7jrqIPPVF+cDASotd5UqeekPn3fQeKx41vc9+d4D0WKz/ulIpOK7oIA+
         AUCDhjLugcFWBUWT1QX2BJBLseDvu/kOmfKPz+QanpDXeVMBFKBCy13MsQQEPLyACk1r
         Zki9fH9nWJKm2a9gym2KMDYMlxwmO+W3kRjdKFM0UHgnTGWc2BrVRUtpXwCUcs39MGjs
         DN4jzjNYe/smKwtj3YaOrjJkWfk5ki61+sIylf0dWtv9MLgp+riOtoZSaVzoRjisfarf
         uFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698453532; x=1699058332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m32H4Hzs8ykpGLbDPvDucWAg27HjQt3n+XmRLfHVk8o=;
        b=ZdRUKtN1VTJ9O8mLOIijij09FQ0CzoLSLn66SU8JF2q7tbpAZYUdEsdVJMYIiOOfS3
         yZAo4ffihXgy3q7KLpNBE/+PI2/g1+RWYu1puAHTMMVLVnYDzoer5tMHadTU4P0tQd1R
         PNqgtitdaZUbCs0ftfvRt7QOduumIHayEq3xj9L/ltcOA7CpKJD5nC9WEgqYi3ml7pDU
         dW9AQ8JcEqbzccz2frF2/2EfVqM41gszb6ASlvB1JodVM0NoUnaG+2ryAUk2WMatf5Oo
         6vYTJq1F6temljYkerXSxOLjfc8NFcYHFtBM6pTM3LYpUcpOCoOZxIoDmHvhHzcypW4d
         cABw==
X-Gm-Message-State: AOJu0Yxe+kzkqfvkVeCNj/mtc11X8lMgQ0Memd5GD+S1E8ExbHp0WRIi
        LdBN10GVMzor5qJ22ZzHdi62EMS6RtBeiHb3GVONKg==
X-Google-Smtp-Source: AGHT+IEDsS4pdoUE1Qwg7Seoangbh4UhCSVIOzVOPb2hip5s80EP6sbN1q2SQn/BfjFTB3Wv+pMshe07+l2I0j15KMo=
X-Received: by 2002:a81:b60b:0:b0:5a7:ab55:b9af with SMTP id
 u11-20020a81b60b000000b005a7ab55b9afmr4486377ywh.35.1698453532139; Fri, 27
 Oct 2023 17:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027165859.395638-1-robdclark@gmail.com> <20231027165859.395638-3-robdclark@gmail.com>
In-Reply-To: <20231027165859.395638-3-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 28 Oct 2023 03:38:41 +0300
Message-ID: <CAA8EJprsWTX+aG+wARffRWx_6UOEuHWRnBYnsLyrA2o=h3tQJA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/gem: Remove submit_unlock_unpin_bo()
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Oct 2023 at 19:59, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The only point it is called is before pinning objects, so the "unpin"
> part of the name is fiction.  Just remove call submit_cleanup_bo()

Nit: 'remove it and call'

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> directly.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)


-- 
With best wishes
Dmitry
