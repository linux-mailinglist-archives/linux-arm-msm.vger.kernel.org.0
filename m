Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785CD76F451
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 22:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjHCUyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 16:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjHCUyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 16:54:05 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308514225
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 13:53:56 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so1670712276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Aug 2023 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691096035; x=1691700835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
        b=QG64sPxmlvnELJ1w3jUSh5YAd3vTo7EpCd65fa7G5iQBLlIkMAy+VRbHdR+BrW/wGt
         JljRATuIXnWdSvseD5g/VZ6+QGB0gMo4l2kBhhKjYnANbjiNRLgMSpI2e8svUet48pAN
         kVTz+8wD4JIKeHJQgNjv/4WfP6XFZfuNPvUMlQCQCC+5IEWmeCms9hBh43gw5dW/ASLo
         tWJElpEvC4pAQgv258VS5VlXUrGEaze3zVBFkd+zJ8hLGErHGyGG3qVW5QSR1xNXeRYK
         G62J6VtPPqy+/9UPrwdl6cGEgRw0iSWeBjyzH9LyhMfebZYHI+tt27+pYdOM8DaAgZdq
         yxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096035; x=1691700835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
        b=khrHVQqnU8DDHP6q0AUFtS4dWt27XrHikeY0F3qGpZQiGjbqE5DCHljp4pTmUfw69G
         z2dCOuEpzSFmHTHUOwBBbztvOXPBE3KLT3X33BDQGOZuSeLeorwbAX557XGJySkZ3rYs
         Pbvgz6Y4MOFkAT/w9/pYlp693THJutBr/EwKj1IUrmIN0looNKf6WKxqcy4Kaj4feb1t
         SxIvFfQcXpY3hUoKfyhP/0t8sbnGnmcGtytq6GrU0UZFVM8TjUWAE5keqVHVXWyBZTL1
         0MkEME8x8lvvOZ8s6mFtzDrmDZ/H++mKrHKQM71PnG+zTZXkMPNSQu36mq4Ugf9KyoaQ
         HZpg==
X-Gm-Message-State: ABy/qLZXncrw72N+AnUomV8HYIjbR3UYZjhyFU7QKozd71IHICMyZ9Vy
        fwmplIQ9csvF/e0+5sWGIZjvRzNDLcKTLi3RUdiFnA==
X-Google-Smtp-Source: APBJJlF7XEIRCehOg8x18n+pAj6XjXh60FKRDpRItIlpCDy80h1FjXBqaG/sPhrf8edAz5AfQWjU0XJhdNgH+HQrRCI=
X-Received: by 2002:a25:694b:0:b0:d19:40c2:eb03 with SMTP id
 e72-20020a25694b000000b00d1940c2eb03mr20833186ybc.54.1691096035371; Thu, 03
 Aug 2023 13:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Aug 2023 23:53:44 +0300
Message-ID: <CAA8EJppW6s4DgQDamAumYcSP7mqKD1zNrVAtKMabAK5bh3iPnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dorum@noisolation.com, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Aug 2023 at 23:45, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
>
> Fix it by using the right helpers.
>
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
