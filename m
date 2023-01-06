Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5119F65FC6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 09:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjAFIJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 03:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjAFIJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 03:09:10 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C07834D6C
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 00:09:08 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4a2f8ad29d5so13059067b3.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
        b=bKGQNv8uXrlgWUEXeM3i3nMbH++VCHo5Yd2FIZluObPRD9Ni8ZAV5+Rsoj6oUrunux
         XqkRD57gxFntIkgC6ON5sAmTV6SsUhL4LnjDSvm7OynSk0wYYRv0lYIAA5hvdaDLkNDm
         gbPYNbfbsHYnQVp89GzllLyunTyen147ZckzV03lYPlvUbWzd/IMG3WtxVhrIztaC1at
         8pByiUA4KnBXJednw62cSq5dBytKmZgxy1pm2K4dhwhXBQTSmCd2cRG9/SwCwEdly2Jf
         2wi9KSpffb3Kr/v9ydbdEcaJwaBpYIGum2+0u+8ZyUtmyZF2SUXX6YwJAEb7jr/rtBw8
         EGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyf8/xdGIeyv+pywCJ7PHhoImivmp2P3M0qiI+bO/c0=;
        b=GpYuOsHERDe4w277uKnBO74thG5QYjqyuQ4E5E8D7dLMoqhdu9pqr8DpzDyeWKXM5x
         UrW/WXDspgZLL4ImrFbu8sK8GwEK8sonZAGSfE2ajo/oMZgoaTI/JsvUdHkpQ7GcTpgR
         HEbrIqwtNWfj947mJx0ZCYD4BQDrr1jdLH+Ul2wXbab3md/ZZck+x04SczaCLCliiI2b
         tGQIqOI+lsNgxkDxiKxj8NIjeogdD+unbYNOHJC+Bc4YeGpYk45nYls1XstbUJoJ4ZVE
         deonK8AYtyG0B/sd7PqiLsw35Z4hyDQ/mfJSl4ugVWfI/P1nRJgs1m0EAvm9DOF25UmY
         MvrQ==
X-Gm-Message-State: AFqh2kqAYkLb7ZwLe8PciGJRLd10hiynYIQ9P0eQEzffteWdWxVI4/qd
        nfEgjTM17vGzLzzoem0Z9DPRZdffFioy8g6FhKTVkQ==
X-Google-Smtp-Source: AMrXdXsLzL9Cvjgf8Y76dGUlcsqoNvKrwQbdhz65NgGzcCjttxAwInXhnzL11PxiUmdUUMCG8BW0VjLcKK8Mr0JOCOQ=
X-Received: by 2002:a81:1e88:0:b0:432:2458:f6ca with SMTP id
 e130-20020a811e88000000b004322458f6camr7411794ywe.138.1672992547775; Fri, 06
 Jan 2023 00:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230106013824.27208-1-jiasheng@iscas.ac.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 6 Jan 2023 10:08:56 +0200
Message-ID: <CAA8EJpqfssbS8VPmBHv6Y26ubJ-mG69tm+yz68OmYBA5_bP9Gw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add missing check and destroy for alloc_ordered_workqueue
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 6 Jan 2023 at 03:38, Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
>
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Please resend the patch, including freedreno@ to the cc list.

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)



-- 
With best wishes
Dmitry
