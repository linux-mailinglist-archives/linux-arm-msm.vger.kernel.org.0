Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7EF9F0BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 18:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfH0Quz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 12:50:55 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37813 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727057AbfH0Quz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 12:50:55 -0400
Received: by mail-pl1-f196.google.com with SMTP id bj8so12062812plb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kShiklbxXonPvyTtTpQ9U0Ep+Qam/mfANXjVpM7jQl4=;
        b=zWc3gZnr0b+oGaMG1D8r6/cR+FDRLjznPoGq2Lo20/Q9xX/PzIkD8n+5E//ntur0E8
         WR/9POMJW62WmqhFxPj8iFoyAKjCNFDZxUpIc9pBJ+VIkuwmFIUi75ZLkrD4+zsbSHM9
         nTrzh1chNlu0s97T4KsQBe18nkqS2NSVAGjPbjP3WcetOSCxZQ1EqdQOU2YpBUKvfwqj
         5Ju35G1nmWDdlUbUckIzVsAvIZDz1+rffnd/4UxQfftwA12tZkSsHjjvweieGo637UAP
         GHAxwfusWmrKnJ75mCVXVuw//K9f2lLdzLRa0r7YqeLTl3gu44ViTQwGviDloqJ+0AWe
         YlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kShiklbxXonPvyTtTpQ9U0Ep+Qam/mfANXjVpM7jQl4=;
        b=KWbKtrNVfVfB7/lF0e6pKBo/46LRv2VGi/XEQ/GKoGJpmUsr8gc5u9l4v8ZPsgX4a5
         kuLodRCcy+4UU5Mfk2U5fSn+jchO5qcBbn3wWMAnCOxluVH1Susys3Pu6R8OOuQo9NQV
         VpOkeKEH8ghP4TTUyi6ViRtPhrrr24Z3laxecxZ5DbigzFe2a+KcVMNYH3DixUOmlGM8
         QEuRz/QmHH4sdTcJNz9ap0fRru+zGhTY3rIMa3T0AwfOEBDTspRVdqOSBewmNkpPbUaD
         vE3NgJVgGkrLq4nvddB8dgSwSKFDHahBBzxWSNKLScA7m8nTWsQLZ8lRObQ+DvPp50FX
         tShg==
X-Gm-Message-State: APjAAAXI6yKnA8Ot8BaTopEWcV9m5L8a+AsETrOP7Pcb7vb9dDKRAB5r
        DIGg2QungTj26TeBPYv22hD03A==
X-Google-Smtp-Source: APXvYqyhmY7LYOx1nKrYPzEEZ/udP6aG+qMVvXVKYs5SpBKNQI8RISuq2sDW1fwdsrEe7X14JGEuCA==
X-Received: by 2002:a17:902:fe8c:: with SMTP id x12mr10273576plm.55.1566924654505;
        Tue, 27 Aug 2019 09:50:54 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o129sm16313302pfg.1.2019.08.27.09.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:50:53 -0700 (PDT)
Date:   Tue, 27 Aug 2019 09:52:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
Message-ID: <20190827165245.GD26807@tuxbook-pro>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
 <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
 <d8cf720c-b44f-f4ea-1c26-92ce34fd31e6@free.fr>
 <20190808042925.90F3721743@mail.kernel.org>
 <20190827144855.GA17311@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827144855.GA17311@centauri>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 27 Aug 07:48 PDT 2019, Niklas Cassel wrote:

> On Wed, Aug 07, 2019 at 09:29:24PM -0700, Stephen Boyd wrote:
> > Quoting Marc Gonzalez (2019-07-03 07:00:31)
> > > On 24/06/2019 15:57, Amit Kucheria wrote:
> > > 
> > > > On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> > > >>
> > > >> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> > > >> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> > > >> the 'default ARCH_QCOM' directive.
> > > >>
> > > >> Add the two options explicitly in the arm64 defconfig, to avoid
> > > >> functional regressions.
> > > >>
> > > >> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> > > > 
> > > > Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > 
> > > Stephen,
> > > 
> > > Can you take the following two patches through the clk tree?
> > > 
> > > [PATCH v2] clk: qcom: msm8916: Don't build by default
> > > [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
> > > 
> > 
> > Did Andy pick up this defconfig change? The subject is misleading.
> > defconfig changes should be something like
> 
> Neither Andy nor Bjorn has picked this.
> 
> Could you please pick it up? (possibly with subject fixed up)
> 

Picked up and updated the subject.

Thanks Marc!

Regards,
Bjorn

> > 
> > 	arm64: defconfig: Add qcom clk options
> > 
> > I don't think I need to pick up the defconfig change. It can go through
> > Andy and arm-soc. So I'll just grab the first one and guess it won't
> > break much on the way in.
> > 
