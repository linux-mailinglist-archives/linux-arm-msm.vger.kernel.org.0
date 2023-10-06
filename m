Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6FE7BC2EA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Oct 2023 01:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbjJFX25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 19:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbjJFX25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 19:28:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E7DA2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 16:28:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5068692b0d9so1316102e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 16:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696634934; x=1697239734; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
        b=OPmYQFo8p3dGvNNcEmkjrXFctx5wZSQOYbcfjA/yl20uF4UpYbz/uynF/URSK4K2J6
         2U4vxL8qxjoXR+gLEx1mNLBZ8S+vEnsMy+wRuQsX8O3xv9eQ+WkQyH35rp9XsweRUe9Z
         7yiV+SB/fiFLyRDonxwkw3iaTfuGuXYPGuqaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696634934; x=1697239734;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPje1vcHjwIpo51r2lCV1V3PJPkC5dj3H0BmMKBs+B8=;
        b=LaCxUvPOORmUYUZsr1GU1A9+WZKDzKzYZzVthExaYFyQo5FSJ3DI4sJMoMLcL9L7Cu
         R/gPmOkCqdikstFSSL+ZWHOf5mpqc0ffS645ILju6qpDS7BixURA7aMCUWPe0cfOZWwM
         feOS7mU141oBdlj5m6fjt3k1FBYShnrXRZ/u2UMdKRDuZ9uP866AA1+ezPc1V4gr8nFp
         tcbZnE6y0SIn+ElTBIMUQeAxG3AUD0v4PKWq7uT6C1VMx46sFvy5s0SyVJA5F/76g+dD
         atzNVuSrnih4Irzl7MQe/49cmNsCkaP5K9ItWCg9Wp0jGzLqE0D9X4+cybAgRWw7WgvJ
         +Ycg==
X-Gm-Message-State: AOJu0YyeW8SzyKmkZE5njchyVvctaSR52PBDGB/j63fFlJz+23b6x4nF
        fm0/r1Yq5t0/I2SpGM1QfSRVteY17KGxn0u1qgz6OA==
X-Google-Smtp-Source: AGHT+IFlu3AoscCuX5mmu2dgMoFvoKMHgZth8cXyCHPtypScwGpaNG9cgu2tQKhK5xO5BoEwsJpp2QIly6mZQq0bu0Q=
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id
 cf43-20020a056512282b00b005057371ec83mr9877611lfb.48.1696634934093; Fri, 06
 Oct 2023 16:28:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Oct 2023 23:28:53 +0000
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 Oct 2023 23:28:53 +0000
Message-ID: <CAE-0n50VFdySRJ2ErAzL6UW2Rn9cbpPbd4sAJoJ2fPmVv-8-4A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> Read the downstream port info and set the subconnector type accordingly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
