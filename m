Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8770A486F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 01:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344021AbiAGAzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 19:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343957AbiAGAzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 19:55:00 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B2FC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 16:55:00 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id s127so6184946oig.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 16:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
        b=Eiq2sMVpWWW2opwh1s3oSD+oaO/zGcn7FnlC2rBpA08jcz+kUVeafqwvNnJuMyuUqe
         9uGs/R9Fds44whRulyvtahDBqPz7smp88bIRpxpAz265T29JGxifo/nt/hHjFROtlIDX
         DsN9DptDMweVHlZ/nJxP1DklA36xVnYoAXjMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0pYB0RbUQb+ZQoPYrHQZu7/mbDpmz+DgyrT9hvQMHLY=;
        b=cJv1b3O1rHxmCR5wlUfEsynTnRjm0Jnfo5dedZ9P58JEEp8TBCv07dFPh1nCA7yiwM
         2xGHvRqIZ6loCZTZttMp69ay7NI86xWtAa7UIO1++Y1PozfWzo9tHQGEPVthNso3vxer
         zlTLfz3yeJFNRSglGcCeVnuLY+sXu2W3biljULRlUuTY2T2aMVePK3PjFWClYAqaNIZL
         KlZ4Gv69ljKNabWW1HVWepCt0jpaogIcEvQMxV1W88BP5MOO1Q/wFAmDZr60aVyPCVBl
         ABhBFiNSKSRXBlFNrL//zIAJNK1uDVZlbs1m9miFAJMIa2rikLl91jOFOTPPTuaniAu5
         2MLA==
X-Gm-Message-State: AOAM530+9SxVZtVcLzJIImFk2WUjtAyMnudef02D/W33x240iITUx1Ip
        +aOxLLQzYgpwP13g2LIHwIe7Uay+yRpFZD+D1mTQ7Q==
X-Google-Smtp-Source: ABdhPJzYKjK4yEo/vzFZbZ8eeAgkwCnr5IK1Nsn86Bcg+g6fm4a6GbPnGoQH9r+nY1PYdtmE7DycRXW6TwBE0GwCX40=
X-Received: by 2002:a54:4710:: with SMTP id k16mr8059411oik.32.1641516900087;
 Thu, 06 Jan 2022 16:55:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:54:59 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 16:54:59 -0800
Message-ID: <CAE-0n53OWdu7jdA-d_xr7LJunkZycjQE78Md+457_8=88uo2-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/msm/dpu: add DSPP blocks teardown
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

Quoting Dmitry Baryshkov (2022-01-05 15:10:28)
> Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
> for DSPP hardware blocks.
>
> Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
