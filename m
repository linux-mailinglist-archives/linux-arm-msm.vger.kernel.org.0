Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD0B486F02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343969AbiAGAm5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343865AbiAGAm5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:42:57 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC678C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:42:56 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id h5-20020a9d6a45000000b005908066fa64so4082057otn.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
        b=NEiXtpzIJuq+ddFpchl0oDBsQdYqF3ZwrJ1Z9bI2KF6RhAXtf6kT/kQNI47at2IwP/
         l1m12sBm7I0PKdUb5mYnnhmwyC/yCkoFP8A4OgzXriBvskbv8Uy2OiVBEPyWKA0koY7v
         SQaIXX0x9DVrDMiBFkxxPKgqP4rLOELY+yjos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=atmy/2mmGjhretVeVMp74eCFRlSY7eexCas291LMZiw=;
        b=0weP3R/5WCLYx31aIc3cV6JC6VR7Z66EmiuLJlGUrexNVdCT1g2dOYKweMn/M6mlao
         HCVfytoBBl+cBiICLmjgmDIlZY369fqlt7CoHchqrVuqRVd/P82ksnq0d4rZ8FxrmGp0
         Ba46BWX5OINzL5LVdLzyySEXUH3cY6RzE9S44DSdcEbTOYc/XhanR/YrpcDWsShCllo7
         F2UoBfcyXCBq/5oHrnqPl3Ihi4d31riPSttRt4PGbJNb6T7GvJNEFnKbGyJc5xBgSlY0
         EglCG+zgj0MXR7wAwkzXA3fLgtM6zm7X0uOPr89B1uY2HQkMJoKtZijCLkUfTI9qaveC
         iE9g==
X-Gm-Message-State: AOAM530YAvXSv/rdyNlEZnkM6QQocqywI03QGhJyag9MGGUMdAMHJv/Q
        eA1E/Xz5ywbQnDFde7UvO8ulN2B1BvaDfWKNPs0KPw==
X-Google-Smtp-Source: ABdhPJwJhNLwPLZG+/uY/kFkbWi+NrpEY3Hn0S30RIpjujh1b5HQTqu0pBhZNq2rsXfzvl4xM6DSc5QrtZqfeMjP2ts=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3893260ote.77.1641516176125;
 Thu, 06 Jan 2022 16:42:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:42:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
References: <20220106070656.482882-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 16:42:55 -0800
Message-ID: <CAE-0n50d3WFYW1eRtpOF77j9vF89Dku4WyBj1xT9OP90x4wihA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: reduce usage of round_pixclk callback
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-05 23:06:56)
> The round_pixclk() callback returns different rate only on MDP4 in HDMI
> (DTV) case. Stop using this callback in other cases to simplify
> mode_valid callbacks.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
