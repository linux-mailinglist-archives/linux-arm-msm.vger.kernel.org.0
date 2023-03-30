Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B59696D0053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 11:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjC3J5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 05:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjC3J5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 05:57:00 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4600F10C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:56:48 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-545e907790fso228579007b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680170207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
        b=Q27wJUEvJTyPvijXy+9qg1b3N1bi8JzO7oBIfxk43L/4mnJwqi/DQ50YoHV2gP1SDn
         WEd8g0psLeqgsmxk4wmJ506yCMopC9oxoNHr/yJeTRSnOa5NSmEUYINlF4is9SmdOmAA
         7aWOLwf7v7Et1hre2bG6Fywp6w2Sh3mz+fIO1JeeZVfUN0IHkgES173p1Xa4Zs0aIyM/
         mI8+yq+TP5kEACBYVL6kJOPNI+2l6H0RhqP6WUfUhMuRS6u4cDI5a45NjYvDg7Z/RoiG
         HAtZUPLscJeS0jJeyZsHzX9SAsgYm2BsLYwnd2QCySEr1kUfoj86djdEfTSd/6hb6csa
         WCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680170207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
        b=lE/C7QJ4FIhKNwVFRaPkLLSX+DN1+JAMqtxXgxE1AyLCz/ENF11RnYpD95OvCeYRFC
         bdgEZtylRRz7xwTk83OWtl2U5VSAX3Zf3dShLFtIt9ZFEY68TLf5K+QHAMqavWtjxThe
         EWl6ab9DbI03JxI90998bsqwkXzvecL6SDoSES+eFLt2a4UVYqDn3y8zKlp2YZCTVjtU
         l+GYQnmJPDiMojJld4kxQmUBrBXJdU7Qe1RbFhF+3u876aJKxxZXccM1hhu9mBDQ152q
         mv3QJZFlVIPoevKAtWlZZr0ROgR2hlmK3GC3QhF7hfEwmtEi/Wjh6jNc9M/siuY5AA5G
         p21g==
X-Gm-Message-State: AAQBX9f4GpeM0MYuJuDzXsn9PQ66KcPOvLrzjM2REzGmVMHo0pmWbqWz
        ob09kU2cQ7id9QPXD2/T3Kag1v7wuxFx6UoAZ/45rw==
X-Google-Smtp-Source: AKy350bqExKE8rYdpf9ZxL1xQIW0Uc8JA5RZ+3QA/9kw/Ho7amY2K61SplWlLgJTuBESzGdhksCO0/Iw2lTRgROvVEI=
X-Received: by 2002:a81:4520:0:b0:541:85d2:af21 with SMTP id
 s32-20020a814520000000b0054185d2af21mr11299150ywa.5.1680170207528; Thu, 30
 Mar 2023 02:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de> <20230330074150.7637-3-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-3-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:56:36 +0300
Message-ID: <CAA8EJppyFcwyVqB715rtQLu1642fa3i7GhKobgGyjQKG5vsG6A@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm/msm: Remove fb from struct msm_fbdev
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
> struct msm_fbdev.fb, which contains thre same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
