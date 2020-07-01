Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719F12111B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 19:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732593AbgGARMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 13:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732562AbgGARMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 13:12:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80485C08C5DB
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 10:12:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a9so822480pjh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
        b=DOAOc949O9CUTB+Gk2mL29U2MdsMP2mbZoYw5KIirj1hGMX9xijMLGqUblzFwv/G/x
         zJLDTmWDlimFSXz69VV7pahROybrgOB8GTQiPcbvVRSnL2MgK3/feKTv1rmquCDZuzZm
         WYqptjyZpI0e2YgEWodOUQ/yOC56fvUSP9Ge8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PIlFXACKoqWB73ZXLVGFX7w5yXzBN1zvDpdle+NdF80=;
        b=a9R0ns5tuX+6X6v/vibzI8Fp7EMq904YwfmmvIUQyBaveMwYMepiwevdZnrCnb9f4k
         rvKxSZSPXVzqUlX0OSLjpSg/sODdAhYmu/EpsMRj9T0IFmlDjD6I9JMCEZi/GiX5emXx
         s4z/vt0+6GrsLcdpF3HPj699PNsYn/bL7Rl7A6iBvJU8entcFh7n4IynghpJGPyszpxX
         eRBod9SDEJHNMUcODgJ6HcuEr/PItFfK/+mUXNKQ30UogjMu2r6mzz1mMUPUHC35uDUj
         Ws/cJN+rvE+db59yGY4GJnoDCamwyfV6t1jSj7MTw9mBgwswFZKnKICh3u+/nAqhIcLj
         v/Qg==
X-Gm-Message-State: AOAM531weFI8NAaR/Q2ERbynVcBUzLcPdPFa4BUA2ZhDn9Jml1EOJeDa
        +TlKnwtas7WyL0n51+1o/NiipXRE+Xk=
X-Google-Smtp-Source: ABdhPJwFtwJvcus7uKKghQac5nLaOjUhOE2/wVY2iBvspvnGYTdn39aGqR8AXvaIifgh9x8exKT2bQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id mw6mr30824966pjb.190.1593623550056;
        Wed, 01 Jul 2020 10:12:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id a9sm6736188pfr.103.2020.07.01.10.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 10:12:29 -0700 (PDT)
Date:   Wed, 1 Jul 2020 10:12:28 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
Message-ID: <20200701171228.GC3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200701030842.24395-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> probes before the interconnect driver.

Agreed with supporting deferred ICC probing.

> Only check for EPROBE_DEFER because of_icc_get can return other errors that
> we want to ignore (ENODATA).

What would be the -ENODATA case?

If the 'interconnects' property is not specified of_icc_get() returns NULL,
shouldn't all (or most) errors be propagated rather than staying silent?

Thanks

Matthias
