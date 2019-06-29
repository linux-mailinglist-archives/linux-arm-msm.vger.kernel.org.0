Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA815AA5D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2019 13:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfF2LRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jun 2019 07:17:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:37048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfF2LRs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jun 2019 07:17:48 -0400
Received: from localhost (unknown [106.51.109.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A57702086D;
        Sat, 29 Jun 2019 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561807067;
        bh=mJaYkeWz95oOor0Wac9fs9992UiJ2bXlSyEdmOy8Stw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AC5yJz7FrkSggdiqNG7Bz7/LdUolsJKL3M7Pd9D1AK5oK5OOROADkTavWC0+J0SMY
         xMXdws2Eiec2oNkhe81LooIVbk5NB982AD47nrelhFVTqDjbqkY6kr6uupyn81+/Oy
         v1R6c7bzrZWLUxrTAe4s+hsZWGb/5chqm2R9C9y4=
Date:   Sat, 29 Jun 2019 16:44:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190629111437.GD2911@vkoul-mobl>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-2-vkoul@kernel.org>
 <20190627213741.5BEFD2075E@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627213741.5BEFD2075E@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-06-19, 14:37, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-06-24 23:31:38)
> > We want users to code properly and fix the post_div_table missing and
> > not reply on core to check. So remove the post_div_table check.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> This doesn't apply. Not sure why. Can you please format-patch with

I had rebased it on clk-next, but that was v2, let me rebase

> --base= so I can know what baseline commit you've based your patches on?
> Helps me avoid needing to ask, like right now.

Sure will do that and repost after rebase. Also the patch fix for
DIV_ROUND_DOWN_ULL has been merged to mm tree, will add that as well. 

Thanks
-- 
~Vinod
