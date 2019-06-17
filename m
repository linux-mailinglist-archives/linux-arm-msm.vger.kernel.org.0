Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432E5479F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 08:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfFQGUI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 02:20:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfFQGUH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 02:20:07 -0400
Received: from localhost (unknown [122.178.208.218])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FBF22087F;
        Mon, 17 Jun 2019 06:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560752407;
        bh=Y0B8T6Yjt3xB30Dg0gZDSWuAIJHo9I8LumWU7FWdu3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aX67L/7J7v7cWYa16rtyl7KLXzFI0GXfAaK7Tx7g/FwOex7VyFlgFW52YI7cPXgF9
         h5QLQDtHaApzI30hAxfc+/8z5tnyNpJ2nycL0JOCURsdzH2EKKMbxJPrcUEEbvaaeY
         uU/exeRv1EarWdNAYyKjcIMxiMrJY8u6tFjfHeuk=
Date:   Mon, 17 Jun 2019 11:46:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: clk-alpha-pll: Add support for Trion
 PLLs
Message-ID: <20190617061656.GF2962@vkoul-mobl>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-5-vkoul@kernel.org>
 <c7be6307-51cd-46ce-8d1c-b464e510e3f7@codeaurora.org>
 <20190614054201.GA2962@vkoul-mobl>
 <51ec56b7-a276-67e6-c196-ac80281c65e1@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51ec56b7-a276-67e6-c196-ac80281c65e1@codeaurora.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-06-19, 11:40, Taniya Das wrote:
> Hi Vinod,
> 
> On 6/14/2019 11:12 AM, Vinod Koul wrote:
> > Hi Taniya,
> > 
> > On 13-06-19, 08:34, Taniya Das wrote:
> > > Hi Vinod,
> > > 
> > > The trion PLL needs to be configured before it is enabled. The PLL cannot
> > > LOCK without the calibration.
> > > 
> > > Could you please add "clk_trion_pll_configure()" function?
> > 
> > First it is not recommended to top post! Please reply inline.
> > 
> > Yes I did see that, I will check that. Is there any way to find PLL is
> > configured or not? I want to avoid using inited variable as done in
> > downstream.
> > 
> 
> These PLLs which are controlled by High Level OS would not be configured and
> we should not rely on the configurations which are done previously for these
> PLLs.

Thanks, would it make sense then to do the initialization of the PLL in
driver probe. That would ensure HLOS is configuring them properly.

-- 
~Vinod
