Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFC03C1D46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 04:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhGICQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 22:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhGICQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 22:16:25 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF14C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 19:13:42 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id h4so8399934pgp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 19:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=x6ANBpfcs5e16JKI1zhKSQnwm3SbozaLix0FKrdBRWc=;
        b=dmYFQ0i2n5eI3mcXKrnPL7JzNSGiM1LKb6WIYTdQK2BE/UU/Cpi4LW+7gBJas2XHSA
         ySUHka2jezNdy1ewG3zQkT4eeJkHaH1PyTYkx249iXuvrIi9cfUt5Q87BJuhCKbCYPda
         oAhyPnf/B0VdaWlzwflzBgvjBh4f8bTgZqy8DCe4E497BAXckHjgIZmeS+d2aoHonnP/
         Y+6DXrOACd/UupoUaUJbT6v3PWSuQaAxDjN1ziaqLp42YHrZqxRNkwY61ljia+VURyxa
         ppfHvGl0AROCISeeg2i2KU5ERLINCyrNTeBMonqsbn1So5Hsg9CWs/42aUAQOK+G37Wp
         ZeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=x6ANBpfcs5e16JKI1zhKSQnwm3SbozaLix0FKrdBRWc=;
        b=oc3emOAUFkDflMdP2+gotv6eOgEqclejf8F4wqCQPOxck61zVTgnEMsr75PcDvg0tN
         NQOUm21mL29PNnkQlatRaaFSe7Rp5M/1X+60L8lpcpcpk9TcrSuVmacrfUTU9gQw9pSu
         eOmconAMRudpW0dW+FmKrWdICkztP3RGr9o7XnPhVlC1V9C6y8YTJzvifCej1uY1ny50
         rFJN/UsVE7fMbIFLvrW/XhbbMApM1gerpA+bF4brN0QbeDBvPlKKw5SHmZ7GlSTlLjon
         cMIWARbwc6whKQY/Cx0as4k2a3PP2fCoNYLsi2T+Rq4kT7Z2Qi9BvCOy75Dad+f5ngNT
         RkNw==
X-Gm-Message-State: AOAM5334HDeAjqgOCsfOO2zPX+/EtUmAbsZSrGeGU6AVaZcO3K+xLjH7
        ZbTQ+TjhUVCd8GD2pcfwm8dS9w==
X-Google-Smtp-Source: ABdhPJyuTZgBJssNq7sXQcZFG629hsjUt77VS20Jf2WjGzdT2+3q9kvRlJ6kA+7ZpJX/caEufpW1Hw==
X-Received: by 2002:a63:f64d:: with SMTP id u13mr35344162pgj.156.1625796821537;
        Thu, 08 Jul 2021 19:13:41 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id m34sm4573560pgb.85.2021.07.08.19.13.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 19:13:41 -0700 (PDT)
Date:   Fri, 9 Jul 2021 10:13:35 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add MSM8939 APCS/A53PLL clock support
Message-ID: <20210709021334.GB11342@dragon>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
 <c780e9df1b2f1eef6af1c9a10662f5a1952a1fae.camel@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c780e9df1b2f1eef6af1c9a10662f5a1952a1fae.camel@mailoo.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 07, 2021 at 11:34:19PM +0200, Vincent Knecht wrote:
> Le dimanche 04 juillet 2021 à 10:40 +0800, Shawn Guo a écrit :
> > This series adds MSM8939 APCS/A53PLL clock support.  Most outstanding
> > thing about MSM8939 is that it integrates 3 APCS instances, for Cluster0
> > (little cores), Cluster1 (big cores) and CCI (Cache Coherent Interconnect)
> > respectively.
> > 
> > Changes for v2:
> > - Reword the commit log of first patch as suggested by Stephen.
> > - Drop 'clock-output-names' bindings and use @unit-address to get unique
> >   a53pll/mux clock names.
> > - Use 'operating-points-v2' bindings to pass frequency table via OPP, so
> >   that we can use one single compatible for all 3 MSM8939 a53pll.
> > 
> > Shawn Guo (4):
> >   clk: qcom: apcs-msm8916: Flag a53mux instead of a53pll as critical
> >   clk: qcom: a53pll/mux: Use unique clock name
> >   dt-bindings: clock: Update qcom,a53pll bindings for MSM8939 support
> >   clk: qcom: a53-pll: Add MSM8939 a53pll support
> > 
> >  .../bindings/clock/qcom,a53pll.yaml           |  3 +
> >  drivers/clk/qcom/a53-pll.c                    | 68 ++++++++++++++++++-
> >  drivers/clk/qcom/apcs-msm8916.c               | 10 ++-
> >  3 files changed, 76 insertions(+), 5 deletions(-)
> 
> Hello,
> 
> would you have a msm8939 dtsi/dts reference file working with all recent
> contributions for this SoC ?

Yes, the dts will be posted once it's ready for public review.

Shawn

> We the msm8939-focused PostmarketOS gang would be happy to boot our devices
> and test patches but we're not able to boot anything more recent that 5.9...
