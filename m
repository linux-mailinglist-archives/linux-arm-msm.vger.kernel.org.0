Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2586D3877DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348681AbhERLlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348268AbhERLlE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:41:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0393611BD;
        Tue, 18 May 2021 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621337986;
        bh=UuzjoZQAgtP5TrBiEAAkMusdRlGv9OEnQByPr+J8Oug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=huiO1381jMo+dEy+gqcBG39NdQ6joCTUyrnObV4NB2DGooXrNdUi8y0ZjZfHJKXro
         dGZaiD/nwo0xK9jAz148uJlZuaBZBzbaGaW0JrhzcSMubLd+8+7RYe2E2XX37tLh0N
         xUk0oW4Q/AmxneFoMxWNwzUPKs6Lz6jUMxA8ZoJnFfyaewc0LkGyy+o3j7TlVX1oHO
         g1crrnkjgrLY+4S2g75VMkCno6MRYYHIzukjSqY/EKetx1EuWF6gyWh01pKXOGWJ5r
         Ieaqs6q2caKbmLwrwjDmPnxsc2EQ16ICXGgrPxX6bYxC5aGIjzLBGKcZAEmAMgKHxz
         zGHVWz+EiHDpw==
Date:   Tue, 18 May 2021 17:09:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/3] clk: qcom: Add camera clock controller driver for
 SM8250
Message-ID: <YKOnf36z7bg+FOsH@vkoul-mobl.Dlink>
References: <20210513175258.5842-1-jonathan@marek.ca>
 <20210513175258.5842-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513175258.5842-4-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-05-21, 13:52, Jonathan Marek wrote:

> +static const struct alpha_pll_config cam_cc_pll1_config = {
> +	.l = 0x1F,
> +	.alpha = 0x4000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00002261,
> +	.config_ctl_hi1_val = 0x329A699C,

lower hexes here and few other places as well

> +
> +static const struct alpha_pll_config cam_cc_pll2_config = {
> +	.l = 0x4B,
> +	//.cal_l = 0x4B,

debug artifact?
-- 
~Vinod
