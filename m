Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D8C6DE43B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 20:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjDKSq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 14:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbjDKSq0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 14:46:26 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073CE13E
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:46:24 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n22so7773577ljq.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681238782;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
        b=JY3NR6Kd1R5Edh80q6U5b5maTRy1MgNEFB7cvjkoR4ryfX9BcbYUpwbEWlneTCEvkb
         3fCyg1MyVZoGNKT/AG/5Gn6gtxonf0T7UF3/U6O50Hqy0TZbB8zmRMvLwnigcSUKedf9
         rChAExcHpw7ETolrqjkkCvtgaHVaRHyfcrkuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681238782;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGi56Bg5OUpWDH44viG14oM0bwik+WxXcsnn4rAhg4g=;
        b=7SP7I/av3AGHBLjSsDEPTFXrAFdRCMZAgSnpYtMW1o60Swo+/hR63L1S+nXR8lVF37
         Q0GFwOKgwLvSa+2f3mBlfAohCVECqneoFDG9gU4eRzevIhIoGYtQfcIpp2sRZASE8Yfm
         CoVw4y8K1ddYrjrEbE3qeBv72l1OVXbkxqZsL2/oMLZr2kFmXpXih0lwk9hbYOOw4G31
         6weUtAY9ZcfTa3+/wz6hk7an2TonYkdmyQlY8s+eNuQGRoucFUsHxiRK+IZ29ol3eJ80
         m5WxwwtxhD9zPt8jvVIQI7hApJyquW5Zo3Uovr3snXKhtG/OpoaXcRTfGZxa8Th86w4d
         to0w==
X-Gm-Message-State: AAQBX9ehF3LwhjWgnl074CPXDqs99G3MgXCfepfqmhnAZ8iVZdKzczP6
        0TX/WGVn1AzoTwfwQ08hJCGUEKbAqrhip+mt5Wd99g==
X-Google-Smtp-Source: AKy350ZfMTgXBCfIYGkHy5hZyhZsQ32BoV8dwK3uBPbJHXwS8s/7arQZv8IsNfSSDQyzo3Fu3PuMODQh8egr6Uw8r5M=
X-Received: by 2002:a2e:3005:0:b0:295:bb34:9c2 with SMTP id
 w5-20020a2e3005000000b00295bb3409c2mr3646077ljw.10.1681238782309; Tue, 11 Apr
 2023 11:46:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:46:21 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org> <20230411161903.599222-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 11 Apr 2023 11:46:21 -0700
Message-ID: <CAE-0n508=PMma-X8rANuA0ogk9147mTR6XT1YsxcYyq3f-Oj9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: change adreno_is_* functions to
 accept const argument
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-04-11 09:19:03)
> All adreno_is_*() functions do not modify their argument in any way, so
> they can be changed to accept const struct adreno_gpu pointer.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
