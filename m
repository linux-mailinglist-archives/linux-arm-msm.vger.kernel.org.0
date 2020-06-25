Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DB320A1E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 17:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405849AbgFYPZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 11:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404580AbgFYPZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 11:25:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16F0C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:25:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w2so2638067pgg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=00LHIRV/dolQ2mCHlKa5LiWgqw5JXQ+HHoO3aVG2Wz0=;
        b=Z0PQaF3+l0TjJwC6QDc6BZWDM6JHMneIYHstGXXD/dyau0fD/FV/bj3I7gdjzc6WtQ
         z+xygjbPBW9NJuqYc2O7XwbKDtH7w73jZgUUwWp9NlBtf0TVlG4NeIQqzloVAMdn4xjP
         HjmWj3w5ZAJ49FbV0DC82lFMlGB6v7mnyZUso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=00LHIRV/dolQ2mCHlKa5LiWgqw5JXQ+HHoO3aVG2Wz0=;
        b=Gomm2vAHe79pa5+yXiqOnZz4OOzDuUO+eYvh2UMMJ5xx1OFrnSzhQFOz/KDm76NdNy
         M5rfkVUuGPSV3IB+cQPH1+YApGuq8WCWqAp47XdxusRPQqY3q9ZwN4Tkn5h3XthGubcb
         EEHDHcCs015rDzxCDLYa0J/R4EsJH/AHg3NO9SaG/czrwchHUQb7nLDUTgN42eksqrte
         Xp2SfqlKu1a7fqYA8AAJZuKGtQTRYUR5a9I6UXCdolrSZQNN2krqUhi4EMMDy9HPF46a
         WJF3yUsiyDfu43AiQTprzOrWqeSIKPpvOfZLJGcJlpCjVTnnwMcfGbJ9XN2zWLaQJ/6Z
         R1Gg==
X-Gm-Message-State: AOAM533ck1fEt+kZC9sE+9lCuLQwzyf61sQ5Vl4TBcGztu1+88mv/q4O
        QHvNIjGIE0F4QPyJiXlt1+Z2eg==
X-Google-Smtp-Source: ABdhPJxCif+MB6LMRa1WecwdVqejW+ZV0OczOfMm2M0EgaaJYPsjf6FeBMskXRWntKQmh1br6gvdPA==
X-Received: by 2002:a62:5c03:: with SMTP id q3mr34703108pfb.58.1593098729483;
        Thu, 25 Jun 2020 08:25:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id gg10sm8774312pjb.38.2020.06.25.08.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 08:25:28 -0700 (PDT)
Date:   Thu, 25 Jun 2020 08:25:27 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>, bjorn.andersson@linaro.org,
        agross@kernel.org, robdclark@gmail.com, robdclark@chromium.org,
        stanimir.varbanov@linaro.org, viresh.kumar@linaro.org,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v6 6/6] spi: spi-qcom-qspi: Use OPP API to set clk/perf
 state
Message-ID: <20200625152527.GG39073@google.com>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-7-git-send-email-rnayak@codeaurora.org>
 <20200624170933.GB39073@google.com>
 <20200624171537.GL5472@sirena.org.uk>
 <20200624173948.GC39073@google.com>
 <20200624174417.GM5472@sirena.org.uk>
 <20200624175536.GD39073@google.com>
 <20200624180005.GO5472@sirena.org.uk>
 <20200624181245.GE39073@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200624181245.GE39073@google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 11:12:45AM -0700, Matthias Kaehlcke wrote:
> On Wed, Jun 24, 2020 at 07:00:05PM +0100, Mark Brown wrote:
> > On Wed, Jun 24, 2020 at 10:55:36AM -0700, Matthias Kaehlcke wrote:
> > > On Wed, Jun 24, 2020 at 06:44:17PM +0100, Mark Brown wrote:
> > 
> > > > Wait, so *some* of the series should go together but not other bits?
> > > > But you want them split up for some reason?
> > 
> > > Yes, this will almost certainly be the case, even if not for this patch.
> > > I brought this up earlier (https://patchwork.kernel.org/cover/11604623/#23428709).
> > 
> > I'm not really reading any of this stuff for the series as a whole, as
> > far as I could tell I'd reviewed all my bits and was hoping whatever
> > random platform stuff needs sorting out was going to be sorted out so I
> > stopped getting copied on revisions :(
> 
> Sorry this caused you extra work, I only fully realized this when the series
> was basically ready to land :(
> 
> Avoiding unnecessary revision spam is another good reason to not combine
> technically unrelated patches in a single series.
> 
> If I notice similar series in the future I'll try to bring it up early.
> 
> > > For the QSPI patch you could argue to just take it through QCOM since the SPI
> > > patch of this series goes through this tree, up to you, I just want to make
> > > sure everybody is on the same page.
> > 
> > If there are some part of this that don't have a connection with the
> > rest of the series and should be applied separately please split them
> > out and send them separately so it's clear what's going on.
> 
> Rajendra, IIUC you have to re-spin this series anyway, please split it
> up in self-contained chunks.

One more thing: when you do the split it seems it would make sense to
include the DT changes that were initially part of this series
(https://patchwork.kernel.org/project/linux-arm-msm/list/?series=278691&state=*)
