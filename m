Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431FD21D9F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbgGMPVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:21:13 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:37789 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMPVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:21:13 -0400
Received: by mail-il1-f194.google.com with SMTP id r12so11492883ilh.4;
        Mon, 13 Jul 2020 08:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=grS2hJ9k1OZcG8a0loEpKCxaqB0kB10zm6CaqtHJVg0=;
        b=ZJpgAAbXVvyHOfijBDBQZ+j+9O0aPEnvsEyUYZlxlxY+52qvXIcpjCxoKLaoyxz2GI
         UeDZ0s3tciVh5AUL4n8kuvhz1HLoqsurgsPFcdwnARVwvJKJQVFPEJbRK3q44RWHsjHS
         NFOZasgo+7jXr7wbrWgddYrjc5u9y3Gx9cFJa9LCJqccwncEVW7Ghcbn/GPANY21COSd
         5Y6ovwSg6qC+b1zHjSDnyL8rUp/YYpFXUC71uRMKXnzFLst9/OOtDzQitNDmCL5032bE
         V94jDlDt1NSvwaoeovZh5pE5mX7uiRclE01PV4KjUL5xThDk9olAQZdgNRFAMoSCq4Xn
         YIew==
X-Gm-Message-State: AOAM5315opbjyEwzzKUdVpnx/6eMpXOFFzLUzfK0yUzPyesMXGs0tUJy
        TCN53RcwLbNi/PwZ/OGO1w==
X-Google-Smtp-Source: ABdhPJza77dAtINuzzczzJpEUdjuGHSAmc5YxtUNWKlVTqlK6FgEE/nisxsPD4SQrjE2CKyXisbRQw==
X-Received: by 2002:a92:c9cb:: with SMTP id k11mr213057ilq.70.1594653672082;
        Mon, 13 Jul 2020 08:21:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j19sm8413724ile.36.2020.07.13.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:21:11 -0700 (PDT)
Received: (nullmailer pid 215634 invoked by uid 1000);
        Mon, 13 Jul 2020 15:21:10 -0000
Date:   Mon, 13 Jul 2020 09:21:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        amit.kucheria@linaro.org, Ilia Lin <ilialin@codeaurora.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: clk: qcom: Add bindings for CPU
 clock for msm8996
Message-ID: <20200713152110.GA213149@bogus>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
 <1593766185-16346-4-git-send-email-loic.poulain@linaro.org>
 <159442640418.1987609.16468106693473840191@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159442640418.1987609.16468106693473840191@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 10, 2020 at 05:13:24PM -0700, Stephen Boyd wrote:
> Quoting Loic Poulain (2020-07-03 01:49:43)
> > From: Ilia Lin <ilialin@codeaurora.org>
> > 
> > Each of the CPU clusters (Power and Perf) on msm8996 are
> > clocked via 2 PLLs, a primary and alternate. There are also
> > 2 Mux'es, a primary and secondary all connected together
> > as shown below
> > 
> >                              +-------+
> >               XO             |       |
> >           +------------------>0      |
> >                              |       |
> >                    PLL/2     | SMUX  +----+
> >                      +------->1      |    |
> >                      |       |       |    |
> >                      |       +-------+    |    +-------+
> >                      |                    +---->0      |
> >                      |                         |       |
> > +---------------+    |             +----------->1      | CPU clk
> > |Primary PLL    +----+ PLL_EARLY   |           |       +------>
> > |               +------+-----------+    +------>2 PMUX |
> > +---------------+      |                |      |       |
> >                        |   +------+     |   +-->3      |
> >                        +--^+  ACD +-----+   |  +-------+
> > +---------------+          +------+         |
> > |Alt PLL        |                           |
> > |               +---------------------------+
> > +---------------+         PLL_EARLY
> > 
> > The primary PLL is what drives the CPU clk, except for times
> > when we are reprogramming the PLL itself (for rate changes) when
> > we temporarily switch to an alternate PLL. A subsequent patch adds
> > support to switch between primary and alternate PLL during rate
> > changes.
> > 
> > The primary PLL operates on a single VCO range, between 600MHz
> > and 3GHz. However the CPUs do support OPPs with frequencies
> > between 300MHz and 600MHz. In order to support running the CPUs
> > at those frequencies we end up having to lock the PLL at twice
> > the rate and drive the CPU clk via the PLL/2 output and SMUX.
> > 
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> 
> Applied to clk-next

And this breaks linux-next:

https://gitlab.com/robherring/linux-dt-bindings/-/jobs/635720095
