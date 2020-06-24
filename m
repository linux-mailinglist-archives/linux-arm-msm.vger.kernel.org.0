Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29622207AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 19:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405893AbgFXRzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 13:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405900AbgFXRzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 13:55:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F296C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 10:55:39 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so1450514pjc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2020 10:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U/33k1IiXRovw/1tLW39N+bDUfBTWn688Cud311mmzk=;
        b=RvaMctu73aT9VIlOoH2iZnr4bf4tO6j7E954Qm9pJYME18RHcJKvY433SyKyVTZ9s4
         XWpyb7+hTq6+E5E7NoaeMCHm5Rv7dn421Bh4bpT6Qp40lIAUpgN/P37zZsEUdEk0K7gs
         pVmzNS1ExTwa9uGMXIxLZuF5rb+xvNAtzib34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U/33k1IiXRovw/1tLW39N+bDUfBTWn688Cud311mmzk=;
        b=HFbIopfM9BfgZSIcDo0EdJKknQFZ6CzrCBau+2gkjad7UgYsmfu0j7BdWselb8/O02
         ro2psKn9eELEktvSpNGShiMPkm8eQcFSLDYzkcKk09LqasVUM8cQTwcl6RCUwWCkmGFl
         OLTajSValms89yj5LB2LivHMdBsrobkwc6aKZOTImx94HS3nJl4I1NvFTJ6iRQ228+ca
         Ht7jHdEnLg1tIi7/e8YRxO2bjsA73CfSbfsrJS+7FBo2LanVeQKZjcASAapi+JDbN8NZ
         0Pc0H7PSIs6oqggth5ytrNrCglYg2f4NThx7E2dcLpX+jZ5i5ZYP7nWak9UhYdT1up8B
         wOzg==
X-Gm-Message-State: AOAM530TK+qDWFf2SmACaTDfiPPl2mF5Y1sEl4P1xPmAsrPGfFLmnQdA
        pkXOVTUyNlx3k6f/CV+ooA9AGA==
X-Google-Smtp-Source: ABdhPJzmvaAy2L95A9aa/RxUKJdOa8fcUKR+IeHHUR9Ci5mxIgv2H3pUzo1272VwbE658Cus1K3Lyg==
X-Received: by 2002:a17:90a:65c7:: with SMTP id i7mr4274818pjs.3.1593021338674;
        Wed, 24 Jun 2020 10:55:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id dw17sm5512983pjb.40.2020.06.24.10.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 10:55:38 -0700 (PDT)
Date:   Wed, 24 Jun 2020 10:55:36 -0700
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
Message-ID: <20200624175536.GD39073@google.com>
References: <1592222564-13556-1-git-send-email-rnayak@codeaurora.org>
 <1592222564-13556-7-git-send-email-rnayak@codeaurora.org>
 <20200624170933.GB39073@google.com>
 <20200624171537.GL5472@sirena.org.uk>
 <20200624173948.GC39073@google.com>
 <20200624174417.GM5472@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200624174417.GM5472@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 24, 2020 at 06:44:17PM +0100, Mark Brown wrote:
> On Wed, Jun 24, 2020 at 10:39:48AM -0700, Matthias Kaehlcke wrote:
> > On Wed, Jun 24, 2020 at 06:15:37PM +0100, Mark Brown wrote:
> 
> > > Aren't there dependencies on earlier patches in the series?
> 
> > Not to my knowledge. Patch "[2/6] spi: spi-geni-qcom: Use OPP API to set
> > clk/perf state" depends on a change in 'include/linux/qcom-geni-se.h' made
> > by "1/6] tty: serial: qcom_geni_serial: Use OPP API to set clk/perf state",
> > however that's not true for this patch.
> 
> Wait, so *some* of the series should go together but not other bits?
> But you want them split up for some reason?

Yes, this will almost certainly be the case, even if not for this patch.
I brought this up earlier (https://patchwork.kernel.org/cover/11604623/#23428709).

It seems very unlikely to me that the DRM patches will go through the QCOM
tree. The venus patch also doesn't have any dependencies and is more likely
to cause conflicts if it lands through QCOM instead of it's maintainer tree.
For the QSPI patch you could argue to just take it through QCOM since the SPI
patch of this series goes through this tree, up to you, I just want to make
sure everybody is on the same page.

> > I wonder if it would have been better to split this series into individual
> > patches/mini-series, to avoid this kind of confusion.
> 
> Yes, if there's no dependencies then bundling things up into a series
> just causes confusion.
