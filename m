Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4EA486F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344663AbiAGAx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344587AbiAGAx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:53:29 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F24C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:53:29 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id s21-20020a05683004d500b0058f585672efso5008318otd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
        b=FRUqR4QwchxI3llxfhdNdykMyi16FLkC3n7I1Ac516fAxo9xniQwI0Ms3jeeZ4WrD/
         dC3IvIuty6qVmiMqt2ICkeG2C/VHno2euq/A5tX9cSdCoSBx7r7AR72gbPVB3g4707Rh
         CzONEFsFX/tRLB1idnqT4QPEBEEtVLEuCmO2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=HyIyD/FeTK4sbdzxIDEW/7ZUfCzvimbAsXNwxxbAmpw=;
        b=4G4HLY3JKosKMHRpR4pmvo6TxE7BhrQJoa8Gf8JMx5aNsO1c2ejRwOxyJUjR+vC5Au
         02qrX0YSm2zIvVzZAtMitSrP7EGPQrflqHbPucmIhR/WvPi/IvEQXD6dB7x95XnMEn8C
         jafBrUUqrSsPMhm+NDpXpqPSeOHexGV9j1WQ/b6kj4ZRuVKoseMoAS0KFW3NfZsUfGRy
         BHhkzV+kc1nknU/V7P75AD65G0AkGv/6vFcTkReWRycyyL7ZsZiQR31l7jOBzrxV2O3d
         oESat8AFEYeF+smQuuAjYsI1P7EQmeLcAN78jjUcItzAhPeNIwSWcH9x8avzpC73h5ry
         ejXg==
X-Gm-Message-State: AOAM533EsiG53Z+It6w0Ui18JugWri/hXEH39lj7S1wLleC3iSCi4HvQ
        VIwbdOubLeFDnlOaELWu4DdBkt+zZlKRcNYmLaoRYg==
X-Google-Smtp-Source: ABdhPJwSKDzu+nMqGQvxjht/3U4F2wicx9+GJ22pBtNGUIRUIp5sFm092+riUAmgWDhW5NgpOHw37OdDP9M8PvRPzFU=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr753580otk.159.1641516808695;
 Thu, 06 Jan 2022 16:53:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:53:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 16:53:28 -0800
Message-ID: <CAE-0n50ZOAzmNsjv9o1FtXW1rYLaKmd_UZwO1dMKTamdL9nFOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/msm/dpu: drop unused lm_max_width from RM
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-05 15:10:27)
> No code uses lm_max_width from resource manager, so drop it. Instead of
> calculating the lm_max_width, code can use max_mixer_width field from
> the hw catalog.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
