Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911863E8D93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 11:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236563AbhHKJxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 05:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236569AbhHKJxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 05:53:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6ACC0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 02:53:14 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id a5so1958503plh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yN5JGDsQRbqNYGictWkZk65RsQg7qzCYVO5IdGVoaBw=;
        b=jT8c08ChLL2mhNYjWrg2WH961eloGTK7WLroKUhk1+HDo/YM/IS+TatyC2cp810l+O
         0u+8hzUlKaym9ME0OwoavnqJUGcIpn88I9Idf/kYyhFAPk5xIPMh48wpBIaOaPTqX5MT
         msjuGgIKwByuZEB0CZDR5/aAcaTDR9tglGCbejFiC2kY8d111jY2EPLGmKXc4WUWKR0t
         ysxJyCokcS3h6WUhFWZ0rWGAEJhcRcycvyjSkN5g/Lmv3DabzrTvvVprW5nF4pR4KPqc
         UF9FYUExy1pzZr79hfcb9pGPg00cGCsbPNciGT1qL5RE0uAZl2NDYcH5zFa0dU2bnHxL
         nVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yN5JGDsQRbqNYGictWkZk65RsQg7qzCYVO5IdGVoaBw=;
        b=XknToSi+ZLwf8SzltmxszOEtVrIy45Zrzd2/IniSIKY/20E7GhJajmn3DA5YEX7g0N
         /0uPgIIMI4PPXNONfnrOa98ft/jKA2i+8Y4+jb/SBfxfq4RKzaigEjyZsfSQ7XTzUjn+
         xuq8G809eK9dpULS7vd+EOJ41dipChvFH4TNm76XynJnzhUTGf483ou/B45MejRGvC6g
         z3nI+xoOTb2ozcQXJ4bTOM5RmtzP6Mr8F8rSa+e/wTL+5FMMHka35ou59fE2DzDi44Gr
         JNxTKpVLAg9lL2uwmNZZX09JdyKSv4k1G8Y0zoX1j4+E18NsSSsi+Pi+8/mW/nk9L4aA
         yTJQ==
X-Gm-Message-State: AOAM530AcDk0l2TMK6ZVFFd+A4xhe14M/OwY3COfVWr+TRTZzBZ1PX9S
        xYD1txDFhtzQt4misrhUzti7bQ==
X-Google-Smtp-Source: ABdhPJyq2OUPvDwt1HcJwEVMav+d2aFK2NfnnSvBGT0D8jiXAM3hY/HQnrCiTJv6msGhlEIvfUuJ9A==
X-Received: by 2002:a63:4710:: with SMTP id u16mr307872pga.232.1628675594245;
        Wed, 11 Aug 2021 02:53:14 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id y23sm29928446pgf.38.2021.08.11.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:53:13 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:23:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <qperret@google.com>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
 <YROc95YKA1Y/TfYI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YROc95YKA1Y/TfYI@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-21, 10:48, Quentin Perret wrote:
> I think this should work, but perhaps will be a bit tricky for cpufreq
> driver developers as they need to have a pretty good understanding of
> the stack to know that they should do the registration from here and not
> ->init() for instance. Suggested alternative: we introduce a ->register_em()
> callback to cpufreq_driver, and turn dev_pm_opp_of_register_em() into a
> valid handler for this callback. This should 'document' things a bit
> better, avoid some of the problems your other series tried to achieve, and
> allow us to call the EM registration in exactly the right place from
> cpufreq core. On the plus side, we could easily make this work for e.g.
> the SCMI driver which would only need to provide its own version of
> ->register_em().
> 
> Thoughts?

I had exactly the same thing in mind, but was thinking of two
callbacks, to register and unregister. But yeah, we aren't going to
register for now at least :)

I wasn't sure if that should be done or not, since we also have
ready() callback. So was reluctant to suggest it earlier. But that can
work well as well.

-- 
viresh
