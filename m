Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A4E213ABC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 15:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGCNSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 09:18:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726022AbgGCNSW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 09:18:22 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99CC620675;
        Fri,  3 Jul 2020 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593782302;
        bh=hyOXqqhxaTbYH3dAER82uU6aZvMqfBZ1enbuyWaVgsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIvdqTtcw8q09KXuP8gWfWbNF4gJVhhQYfZK4umAM4xHu81em8G2FnNsvTwCRHxsf
         CrvfYNMD3XaErxs+5NH5WCpCmLrIjpXqhiEEtlwCkqyHQm2VVNQuTRAfJw8c+Yb7AM
         DyifJGR2yO9eKReHfTqYwjy6TDwdM424+Pz3CImo=
Date:   Fri, 3 Jul 2020 14:18:17 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        Mark Rutland <mark.rutland@arm.com>, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>
Subject: Re: [PATCH v2 1/4] soc: qcom: Separate kryo l2 accessors from PMU
 driver
Message-ID: <20200703131816.GC18953@willie-the-truck>
References: <1591266927-24976-1-git-send-email-loic.poulain@linaro.org>
 <1591266927-24976-2-git-send-email-loic.poulain@linaro.org>
 <159261263640.62212.5877307994739570385@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159261263640.62212.5877307994739570385@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 19, 2020 at 05:23:56PM -0700, Stephen Boyd wrote:
> Quoting Loic Poulain (2020-06-04 03:35:24)
> > From: Ilia Lin <ilialin@codeaurora.org>
> > 
> > The driver provides kernel level API for other drivers
> > to access the MSM8996 L2 cache registers.
> > Separating the L2 access code from the PMU driver and
> > making it public to allow other drivers use it.
> > The accesses must be separated with a single spinlock,
> > maintained in this driver.
> > 
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> 
> This needs an ack from perf maintainers. Leaving the rest of the patch
> intact to help provide context.

Looks fine to me:

Acked-by: Will Deacon <will@kernel.org>

(I can't get my head round the MSR; ISB; spin_unlock() ordering, but this
is just moving code so I don't want to open that box of fun here).

Will
