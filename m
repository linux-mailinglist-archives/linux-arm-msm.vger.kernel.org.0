Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54454462EBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 09:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbhK3IsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 03:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234801AbhK3IsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 03:48:11 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFDFC061714
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:44:52 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id u11so14371524plf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Uv+Et/eardA9dLqCb6Zt0NIzF1MABxNziCVHSLPsZY=;
        b=wCiNYkU26amoalRtyBbpfKwIBnmbC2Nmv8Pbm3CD5CHpEqiHuBaT/PqQn79ZE28kHJ
         BiLSnXHvusRoM62ayfhX5SZzcUbdWqhKlx+StAKP9rD/qjeAc5CbFpRBqfLXbZIH2Wsy
         94uG+LNSwdgObjOJTpz2qf/HPxhpgnY+CVuyvn661pcCxCKW/ogUUmSoZWzG0BIk7+gV
         aghJDj0xKTZFwAjb0aUBBEttrnZuNlRS955pUa/iAXvGGn3/ZkmqIj1PSiDnQwNFjYpK
         xHAi5Y5CvVG5hiifL5SFuQXzWzrvnb32ibsocSasuIgz3RELkvYETrHEk6UA7HzW8+mJ
         GuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Uv+Et/eardA9dLqCb6Zt0NIzF1MABxNziCVHSLPsZY=;
        b=heNY0d5I1ddstneGpGfFZWE9y2ilxnZSNVQN76O31zb50zw93eYoxmFHksgL7NEEo0
         fbR/mGSeFv7Bcn54/b+bylKJMBp63ZRoD1aAx8tzwaPpZGNjjNcU7Plzv3ymeGvSPaA1
         foQicbz3cFhFWP1QgiIIag3yeDklTkJtG5tGWFihQuGe/BXR4il9PEFCxCTNt0QJ6Q8p
         h+O7ytof4m0o1XRENyeygzmBo1oC3fnidQnb6AZp8DLOMVmFLtJWus0JJkbGFta9y2JK
         xgYrVGqjfERNWlHlmeplk8YOMwg1KS8B6yJh/fsUwI5dNKQVioIrTvKp5Gesi45c9ULt
         QJnA==
X-Gm-Message-State: AOAM530q4Qsr8tAcVOaTDOuvaIzSg+JgaFz1SUC9n7knev5XiEqlEKZe
        WRLlrPYt5h/6zJUPsvcI0GNZnA==
X-Google-Smtp-Source: ABdhPJyxkSr5h7LMbjh/DeT0Ity+NeRVuxjcFrSIGYdvkYPRsayMZ6vbTXd9+OdFzZOIFBxW/ixvfw==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id oj12mr4470256pjb.100.1638261892051;
        Tue, 30 Nov 2021 00:44:52 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id j7sm1746075pjf.41.2021.11.30.00.44.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Nov 2021 00:44:51 -0800 (PST)
Date:   Tue, 30 Nov 2021 16:44:46 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
Message-ID: <20211130084445.GG10105@dragon>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
 <20211126093529.31661-3-shawn.guo@linaro.org>
 <56a5820e-9cd7-aa49-7ce8-9547f355986e@quicinc.com>
 <20211129134459.GC10105@dragon>
 <519ac97a-6bff-ee93-58c6-63559c3a6cb6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <519ac97a-6bff-ee93-58c6-63559c3a6cb6@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 30, 2021 at 01:56:02PM +0530, Maulik Shah wrote:
> Hi,
> 
> On 11/29/2021 7:15 PM, Shawn Guo wrote:
> > > This is not limited to suspend, you will need to notify RPM during deepest
> > > cpu idle state entry as well, since MPM may be monitoring interrupts in that
> > > case too.
> > Yeah, I was trying to test this MPM driver with cpuidle, but failed to
> > see the SoC get into vlow/vmin state from cpuidle.
> 
> In a few cases SoC can enter vmin/vlow from cpuidle one is from static
> screen on.
> 
> > Do you have any
> > suggestion how I should test it properly?
> Suspend resume (use "s2idle" and not "deep" mode on upstream kernel) is one
> good method, but you will have to make sure all drivers have removed votes
> on xo clock when entering suspend.
> Also need to make sure other subsystem like modem is in power collaspe (look
> at the internal master stats driver to know if other subsystems entering to
> low power mode or not).

I have already been able to trigger a vmin sleep with s2idle by doing:

 $ echo mem > /sys/power/state

My question is how I can get a vmin sleep in idle case, so that MPM
driver can be tested in both suspend and idle context.

Shawn
