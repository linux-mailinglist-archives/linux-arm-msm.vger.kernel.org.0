Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D621CDB97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 15:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgEKNos (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 09:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729279AbgEKNor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 09:44:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3FDC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 06:44:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so11040729wra.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
        b=m0ElpsF0pRp5TglEUDXatsddqa+Pb36Mj0Ppynh2iPIzzZz0EgUlzEtzkWyZeAg3vB
         uBs8o5cgAfl1IJaebtKgziRr73o57iHO5kRqVLTfaRC9X/zbKfqE0X7WUY3tyIHVtzsE
         vFx9MY8AD+wURjQHSKOL4msglFChmdK1OF0GOTXEyOPCB+/qCeUlNUl3WRSD8mjpJY46
         hSQALRhOTEhqYS5oyb8QdeT0A4PD7fA1adHgJP7v3DqW9SxYfGkzAgGWjuOFXLrwzjzb
         N6qFsfSm3T/OSIzW2mqIAKD2F9YJwb6IdZnQgigtlyOUiCH7V2syhUCmrF3QsgphlAHW
         IDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
        b=Qfm7zkDNcmKBNdOjDtTGPDerbHg4Vv6cNXBRyDjYJVYJ4uQNl7A25yzQYw+IxpA/DB
         HkwQvMPI3JBRSPq8gbBc3mgQaM7CCD5CVTfEsCzDa4CaVKMkggP8qDG6//t6tKPZuUg5
         aHl7xS6tQtP0SXYLApeLeeKvKesx8uwfvm0xUy7quej30Upqr4fMPTZMiun+iSGLkSFD
         p9Y8d5efLd/4Ro/pqldj7wGwXbf8kkiuLByjUI344lEQfuLagJWNV3iNDvkj91r7/Q4p
         T4Ax/um4UnUUEIoTSZCKM6aViGQqI2lshfUpX5KUUE8WHvidPJkE1E9BfjThDKNdatvv
         9nTw==
X-Gm-Message-State: AGi0PuaCBeVmHNSc5RaFAN9j1dvtfobir8tj/JAm9frz0XqK7UT7LAv0
        1pHo/QdE7UCs0rbvVjlwgoegzw==
X-Google-Smtp-Source: APiQypLqeWUYDX3crs5ryt2QKIDbqRz/76rh57q7pYtJbxnpgj5n76IycVeDM/ojI700iAgxeVhE4Q==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr21053389wri.157.1589204686152;
        Mon, 11 May 2020 06:44:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id a15sm18111170wrw.56.2020.05.11.06.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 06:44:45 -0700 (PDT)
Date:   Mon, 11 May 2020 14:44:41 +0100
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v7 05/15] PM / EM: remove em_register_perf_domain
Message-ID: <20200511134441.GB29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-6-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-6-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Monday 11 May 2020 at 12:19:02 (+0100), Lukasz Luba wrote:
> Remove old function em_register_perf_domain which is no longer needed.
> There is em_dev_register_perf_domain that covers old use cases and new as
> well.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

So, as mentioned in patch 03, I think this one could be squashed. But in
any case:

Acked-by: Quentin Perret <qperret@google.com>
