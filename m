Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B67578E3EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Aug 2023 02:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244264AbjHaA0f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 20:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbjHaA0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 20:26:35 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC214CCF
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:26:31 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d743a5fe05aso98960276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693441591; x=1694046391; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
        b=YgYV1cZ94AhmeMLa/7/7CVk8UJkVw8KYpsUXvoEwV3KQ1BPwg8wXOyBV9/MEtsL4gI
         cJ6ayTR56beBi9K6YeZjqwlIweDJZpaO+pVwYlKxsIeVbdndJzIPdPoRlU8/F6Bse4mH
         sY3c+ZgJvNA9zT/B3CW9NWcHbaxuwf65K+9KUw5ulbA8l8Mt75j3mHstj/P/wU4YNIkw
         hktOkRDJciDRn+yz2TkZJlOuXVvgGcZyNExISK1MGdISuPt9iXdNVC0n9IlV9Eth5aFr
         VfF96VKZTVmOTrDroRZ9ZHNNdrhFBcgvqUlqspscm98vlRrhx5YlzMlwxhKUjMRiSo6Z
         QCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693441591; x=1694046391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
        b=CS+OOjTIjA0eQe7Qqn+i/R+KwjzAlwlcSLyKRWwHVvP2CRv13B3gg6xt5M+6wFN23p
         JYzRbX4WXpfkDiIfkz6Tmooraswb/IOvz6bQPRPbfDeTI3v7akHIkmLep542d61m/Et0
         E+bJNMhihIB6Ra9i7vPrtyw1T52sglJJ+NQpknTGJYD5KDeTvVg26YUjTw1GKUfsH3La
         uE0vS257ETBRQTfx9bQhLubSCIMNm5dN7w24Ziql8HNx5KVxQylXBnzHovqz/tWVguu3
         9XQaqkFYa7wQ8rek2XtkJzoJjZTgQxX5PiAKT88zP8dRXRh4XqKUTnTwJRvNCESpLAqY
         c7hg==
X-Gm-Message-State: AOJu0Yz7BCh7Wq0MBIPUmW/Q0vHj25FWIamuAulfXQ8kVjOaIx1GlQOq
        ZyhqgqmmJhsGo60IqAxYraTATGEBqaJqR0TfbrVryQ==
X-Google-Smtp-Source: AGHT+IEC6wjyhLHuyq2sowvLpwNst9mi9DaKnAVZfuuF7YmSGM5ILBiZEq62yGcwMVvFIDZCywIaEKK97E/8B6+kyt4=
X-Received: by 2002:a25:2901:0:b0:d7b:969b:f3e with SMTP id
 p1-20020a252901000000b00d7b969b0f3emr3293721ybp.11.1693441590996; Wed, 30 Aug
 2023 17:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com> <20230830224910.8091-16-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-16-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 31 Aug 2023 03:26:20 +0300
Message-ID: <CAA8EJpp=kr0XTrzq0sjssDh3oJYLqYHZjpDxeyKDxV5jfTcaBA@mail.gmail.com>
Subject: Re: [PATCH 15/16] drm/msm/dpu: add NV12 in the list of supported WB formats
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        quic_parellan@quicinc.com, quic_khsieh@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since CDM block support has now been added for writeback blocks
> add NV12 in the list of supported WB formats.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..978330c6678e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -244,6 +244,7 @@ static const uint32_t wb2_formats[] = {
>         DRM_FORMAT_BGRA4444,
>         DRM_FORMAT_BGRX4444,
>         DRM_FORMAT_XBGR4444,
> +       DRM_FORMAT_NV12,
>  };

No. This way the driver would announce availability of NV12 even on
chipsets where NV12 is not supported for the writeback. Please define
separate formats array.

BTW: does HW only support NV12 for the writeback? What about YV12 or e.g. NV21?

>
>  /*************************************************************
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
