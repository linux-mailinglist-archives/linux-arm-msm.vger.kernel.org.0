Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 824F091D16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 08:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfHSG3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 02:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfHSG3o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 02:29:44 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1351520851;
        Mon, 19 Aug 2019 06:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566196183;
        bh=ZWpAO8QSDtl6+Jkb5PfpmEgOiBWyUwySwH5wx/nV7b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z2eZOcRAIUnvXsUrfpOrZPFzDOBpiYH569dKoyLea3syk6QKVRNI3PMD1NhDjhBFt
         oBVmW3MPXJO0dCKVD1ZIJljxsWF060pNlQXvw9hHm0YY9pxOB5QuEfCssgG0cYw4K+
         N9PUF9Jv/oMCDDF6AjTKuH1N0n6whphyHZeRFNzo=
Date:   Mon, 19 Aug 2019 11:58:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add support for SM8150
Message-ID: <20190819062821.GF12733@vkoul-mobl.Dlink>
References: <20190814122958.4981-1-vkoul@kernel.org>
 <20190814122958.4981-2-vkoul@kernel.org>
 <20190814171946.E9E8D20665@mail.kernel.org>
 <20190816042440.GY12733@vkoul-mobl.Dlink>
 <20190816165812.BC64B2077C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816165812.BC64B2077C@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-08-19, 09:58, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-15 21:24:40)
> > On 14-08-19, 10:19, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-08-14 05:29:58)
> > > > Add support for rpmh clocks found in SM8150
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > 
> > > Patch looks OK, but can you convert this driver to use the new parent
> > > style and then update the binding to handle it? We can fix the other
> > > platforms and dts files that use this driver in parallel, but sm8150
> > > will be forward looking.
> > 
> > Yes but that would also impact sdm845 as it uses this driver, so I
> > wanted to get this one done so that we have support for rpm clock and
> > then do the conversion.
> > 
> > Would that be okay with you to get this in and then I convert this?
> > 
> 
> How does it impact sdm845? The new way of specifying parents supports
> fallback to legacy string matching.

Yes it does, I have managed to convert this as well as sdm845 and test.
I will send updates shortly

Thanks
-- 
~Vinod
