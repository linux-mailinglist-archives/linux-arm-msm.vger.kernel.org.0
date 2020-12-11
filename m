Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A482D6F4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 05:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405376AbgLKEah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 23:30:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:44390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405377AbgLKEaf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 23:30:35 -0500
Date:   Fri, 11 Dec 2020 09:59:50 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607660994;
        bh=DxjGtU8api1RScRIaoXPFvfSg6+p81ymEsIxRw9JakY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJRL3Ul8ibENkss7LkCrZIJ+w4s7K6IIC3IBYejhHDJuvqZdnsVs2Hw3BWXO+KwzX
         ffB5clzroM74Jri0XKQFxH/QUyrtwvRbDuhqkxuEWgrukq7soO3PgvEa6CjY8bjh2b
         UDoYyWV6Qeq2XWl9zweTdF30zOtKkPwZ6du0FVTwl26LP4OuQa+0sZx+r5h9T+aQ3a
         r3SOH8zcpOSCqs2rxa4wOSnh8RqVq1JCKgwimObnTWygGq9s81hvSb213h1nIaBSuS
         MKaemzsUhWwUHlBV2T/3zobOtfoj2PJXDMkiIunQ4z2rfFNcZ8j6rllp8uvk1UuaDp
         GNhvQOl/0ymiw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add SM8350 GCC clock bindings
Message-ID: <20201211042950.GQ8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-4-vkoul@kernel.org>
 <20201210040116.GA1639067@robh.at.kernel.org>
 <20201210061159.GM8403@vkoul-mobl>
 <160763226856.1580929.7399412663078488395@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160763226856.1580929.7399412663078488395@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-12-20, 12:31, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-12-09 22:11:59)
> > On 09-12-20, 22:01, Rob Herring wrote:
> > > On Tue, Dec 08, 2020 at 12:17:00PM +0530, Vinod Koul wrote:
> > 
> > > > +required:
> > > > +  - compatible
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - reg
> > > > +  - '#clock-cells'
> > > > +  - '#reset-cells'
> > > 
> > > You may or may not have power domains?
> > 
> > I have not added them in the driver yet, so I dont think it made sense
> > to add them when they are not present. For basic stuff it is not
> > required but eventually yes, so I plan to update binding and driver at
> > that time
> > 
> 
> They should still be required in the binding though if the hardware has
> power domains. It's not like the hardware doesn't have power domains
> already or can gain that ability after the fact. The driver should deal
> with it when it is ready.

Yeah that is a valid argument, I will add and send updated revision

Thanks
-- 
~Vinod
