Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A2AAC53E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2019 09:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391937AbfIGHuC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Sep 2019 03:50:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726133AbfIGHuB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Sep 2019 03:50:01 -0400
Received: from localhost (unknown [223.226.124.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 736AF2173B;
        Sat,  7 Sep 2019 07:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567842601;
        bh=5pobKH5kpChuhb/hM732oKQFMLUdUp2FcOEoh5JNV+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y1RHYCWEnvXTeOyiRb38s1MMJsTSJ675b7qH4gEY1A5qMA6HuEMmxGvK20+MR5E3t
         /RJ5n1WiwHrqbCs3QqOgBeozMtvICz1QmjXSn1iTKlkD9I7WLzgFljcU/iZtmZqghu
         XPWi4Oi7/RAda5UVzirbaPHRsz1FNGneG6kxX78A=
Date:   Sat, 7 Sep 2019 13:18:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
Message-ID: <20190907074852.GI2672@vkoul-mobl>
References: <20190906045659.20621-1-vkoul@kernel.org>
 <20190906203827.A2259208C3@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190906203827.A2259208C3@mail.kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-09-19, 13:38, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-09-05 21:56:59)
> > Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
> > disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
> > dont want the clock rates to do round up.
> > 
> > [1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swboyd@chromium.org/
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Is Taniya writing the rest? Please don't dribble it out over the next
> few weeks!

Taniya is Cced. Since I upstream qcs404 driver and have a board handy to
test, did that :) 

Thanks
-- 
~Vinod
