Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04E8207B47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 20:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405988AbgFXSMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 14:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405690AbgFXSMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 14:12:47 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE42CC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 11:12:47 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id 35so1373112ple.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 11:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C3KkiGAO8lyqdIQuvAEQ8JzIRmCuaGHCnXCsx5RyvD0=;
        b=H+6fL4de2g0NqRjNI58Cx3x6zrt4dbBLGQLeSSyd6+OzOQlJC6BzxHFaJ3I6S99Bec
         OQ2a62j+C7MqgQn7mbkbzWzppHEB1GYqdwdKnSwj1Vy8L0SHQX5CCTQyFFhw2nfP2Oma
         GC+ibr91Yu35ORM9umWb5oqy9JE3ZhDSBRfrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C3KkiGAO8lyqdIQuvAEQ8JzIRmCuaGHCnXCsx5RyvD0=;
        b=Csk0agHe4VCCCrLut6iBvdmzy6Sk+yvx20+11JjAy46pNnpxFJTapl3qeH3bk/JBZq
         0FY0kI8Y3Oq5etsi2zyvwNBgcfQVaqvUB0UBjpJLdelBTTXIRd5MVqlTkORseTd2lK/+
         Pj/WB3mVtDkKM+dk+t006xqimKpSpEl/b+1LNVQxT0ntq0bbVeBH3e7Q0ZUNon9zuxEn
         muRZsqlySbFJcKuxT3tCms/rMoIVLcALwwy1LC5G/ImB3UI3J6DOmh8mhAVb8/RYN7UM
         q/D6bvFh/bdKJWyhswQy7llXS8h/MyugL4F6y1W/nCBV3XrF4o6LzoGsn3d2QdsTgjHX
         8wpA==
X-Gm-Message-State: AOAM532lmD3jTK+icTMhMt6p5aaTst5yDIhVbupJd1OSNDEKesekkt12
        ME+H4cWp0+OefesUEdIFSZ7wxA==
X-Google-Smtp-Source: ABdhPJzWq9UU+H14Fdg0rAeVk81PgRXWQJtgYbujIWk0/OsSMEkiHBY5RWPayIIneJl57lJZWSk1gg==
X-Received: by 2002:a17:90b:3010:: with SMTP id hg16mr5180108pjb.69.1593022367291;
        Wed, 24 Jun 2020 11:12:47 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s10sm1319332pjl.41.2020.06.24.11.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 11:12:46 -0700 (PDT)
Date:   Wed, 24 Jun 2020 11:12:45 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, bjorn.andersson@linaro.org,
        agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org, viresh.kumar@linaro.org,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 6/6] spi: spi-qcom-qspi: Use OPP API to set clk/perf
 state
Message-ID: <20200624181245.GE39073@google.com>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-7-git-send-email-rnayak@codeaurora.org>
 <20200624170933.GB39073@google.com>
 <20200624171537.GL5472@sirena.org.uk>
 <20200624173948.GC39073@google.com>
 <20200624174417.GM5472@sirena.org.uk>
 <20200624175536.GD39073@google.com>
 <20200624180005.GO5472@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200624180005.GO5472@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 07:00:05PM +0100, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 10:55:36AM -0700, Matthias Kaehlcke wrote:
> > On Wed, Jun 24, 2020 at 06:44:17PM +0100, Mark Brown wrote:
> 
> > > Wait, so *some* of the series should go together but not other bits?
> > > But you want them split up for some reason?
> 
> > Yes, this will almost certainly be the case, even if not for this patch.
> > I brought this up earlier (https://patchwork.kernel.org/cover/11604623/#23428709).
> 
> I'm not really reading any of this stuff for the series as a whole, as
> far as I could tell I'd reviewed all my bits and was hoping whatever
> random platform stuff needs sorting out was going to be sorted out so I
> stopped getting copied on revisions :(

Sorry this caused you extra work, I only fully realized this when the series
was basically ready to land :(

Avoiding unnecessary revision spam is another good reason to not combine
technically unrelated patches in a single series.

If I notice similar series in the future I'll try to bring it up early.

> > For the QSPI patch you could argue to just take it through QCOM since the SPI
> > patch of this series goes through this tree, up to you, I just want to make
> > sure everybody is on the same page.
> 
> If there are some part of this that don't have a connection with the
> rest of the series and should be applied separately please split them
> out and send them separately so it's clear what's going on.

Rajendra, IIUC you have to re-spin this series anyway, please split it
up in self-contained chunks.
