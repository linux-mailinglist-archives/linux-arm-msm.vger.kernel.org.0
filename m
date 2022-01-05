Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C39485C63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245471AbiAEXnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234791AbiAEXnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:43:00 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8B0C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:43:00 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id s73so1313426oie.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=IxB3I9VutZnjRNdLbfVzg0rsq9Bjtv+GSlcLzooWDJs=;
        b=oITkVjokHn5CRvqrEiqDtuwhv24jSdiQLBq2Ql1uuasuvwkDAkEQPAWOJ2M7ogugcg
         RvH5zOrQolNS8/Uk1XOVDHWF8gQIXGzrVvJ1QBUE3EbDm02aevaPK3rwMBsT98qlhP60
         ScPLorvJtpvZxMNnMqkVCagPYAAs1S85l+sE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=IxB3I9VutZnjRNdLbfVzg0rsq9Bjtv+GSlcLzooWDJs=;
        b=1JtI1H30WzwidzLhs4mINkGA/QEFg9hx2x3aVBV1JykiOS+ayVAv2ct0Mg6Agx9v5A
         tQjt5BeDfQT1Fs/uF1nixJwAU48sCeGQCxybhTWL7JmgOpJCWaiR7/ryqgl9GLB5oOru
         6snbUVeAodQEtXwt21fKisa6sREJNGYuvHyfdpERXT6oBbfY6FM5EmOuuLoWxFqA1VoC
         428TFWln6dTpGCjhmwlzf8NTr0n3V+MwaLk5wwghtxUJ3PKp/myClIZXlgjGP57HSKp2
         VrxwSs4k8cYTyCAN819JoCkYQDrMPGAH+2XTy+Sp1NapHdhvOG1WDDuxF7j2ZNsls099
         LK/w==
X-Gm-Message-State: AOAM531lUn0ejPZzoAQ05pxBgrgoHtMqbFvPu3dtyxf/AhJCl8IF3jcE
        unmWr50fX9a8wc7g56EzMEIPWZDWgJ5JrbUn3rB7nQ==
X-Google-Smtp-Source: ABdhPJxRPZ8DsgITx8hePuL7cPTiC/1Xo6E6Nn7hwWVurib9oIaOohMpMR3GPvpFKaS1by70oaAf/MWhpADtA8C4seE=
X-Received: by 2002:aca:4382:: with SMTP id q124mr4323087oia.64.1641426179984;
 Wed, 05 Jan 2022 15:42:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:42:59 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org> <20220105232700.444170-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 15:42:59 -0800
Message-ID: <CAE-0n52fsc9cFfUMOg8EufwwkjJp1sQDO07RVWBvK78+74ubLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm: move msm_readl/_writel to msm_drv.h
To:     Abhinav Kumar <abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:27:00)
> With the reglog removal, msm_readl/_writel became single line wrappers
> around readl/writel. Move those two wrappers and msm_rmw to msm_drv.h to
> remove need for extra function calls when doing register writes.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Any chance this can go further and replace msm_readl/msm_writel with
readl/writel directly?
