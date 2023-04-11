Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2836B6DE437
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 20:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjDKSpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 14:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjDKSpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 14:45:54 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE8FED
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:45:53 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e9so38771980ljq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681238752;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
        b=Hs81WUoiVVFIM+ivFPb/jQA3EmIEneKSPEVpUp08IzmbfAww4C0KWAmhuzCDQdWke4
         JyeLR5vVRVO9FjudX6lOApI6Ywfr8cn1X0PHR0kvAemCLBX74PYeyck85YfJnOvReWRP
         tzL8xVJchOm3iJgFtKbDexvKRPhNCqCKZrEaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681238752;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt2nTK/L2DMh4Zod0ujL6feEggrKXdzfpI6LEwT2JUk=;
        b=mp2s+xyxnZL5lcVWInFMIA22d9ms+G2gk19xCycqXMiMKmf/fKN9uy9DRmsDE2BsdI
         iHPeo85uEUmqk/TN8uLKwLHlJSUXrUPLC9/cynn8KNz5OIsQEWYwjaL6N8VjvjXg4mc3
         Jf5NvQX6d8R2VjWM/99o14RB9DXBFDg5BknpBSo43zV8npyl1E/kPpfq3o7Xqa/LXAOq
         O7Yy8/qGsJtDwfT7xO0q520yTE5KzxGGXEf3Mn164nr/ctJNqrfRSf61rpvApflZtRFd
         kIEkjpxFykliD2ZA7bsH2bwjGCvbtMl/SdYDcyvc11pWDohUyEbMsnOeV+Z9zHcXJ9wE
         UWUA==
X-Gm-Message-State: AAQBX9fu3y9ztx+fuBJuuGBMSbAiewX4AjLe/mCh76QqUeoMTKhDptBw
        cLtkC8ZUJyrCRdHSU/bu7pwNGhz32bvVNJvAIpYiug==
X-Google-Smtp-Source: AKy350YpHKHopzwKahp7ULmovKXZ2doN6DUUuycpVkj4o70reVBikNejCvg9q/0Hmnr3kFqrFu9jis5M6LrN1eYn65U=
X-Received: by 2002:a2e:b0c4:0:b0:298:b320:ee2d with SMTP id
 g4-20020a2eb0c4000000b00298b320ee2dmr71986ljl.0.1681238751946; Tue, 11 Apr
 2023 11:45:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Apr 2023 11:45:51 -0700
MIME-Version: 1.0
In-Reply-To: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
References: <20230411161903.599222-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 11 Apr 2023 11:45:51 -0700
Message-ID: <CAE-0n5370mhqN7egoTAWaLTHR-qYZu4R99aPJbrXe7snv3rerw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: warn if chip revn is verified
 before being set
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

Quoting Dmitry Baryshkov (2023-04-11 09:19:02)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
