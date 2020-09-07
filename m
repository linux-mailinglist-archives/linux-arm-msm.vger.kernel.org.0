Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE142601E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 19:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730737AbgIGROG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 13:14:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:49550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729729AbgIGOUK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 10:20:10 -0400
Received: from localhost (unknown [122.167.151.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7398A20714;
        Mon,  7 Sep 2020 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599488282;
        bh=A/bIY1WckCrPgIOMj+IxDI6uQGFD84uO7r4OFtsQEjA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RA7qHpWqcT/wOyxkE9ohLbGlYvN/qrbtGw/RkZjV6AW5EMVtnMbYnmxQakUMQGOyU
         lCRqmPMxHW5M0SBB0NQAXJk4O1/lZqk4gntcKdrWy34EbeXFtDpyT+aQ/SM8Q0w8rP
         nA/oZWQ8f554p+mHA7NVB+GxE6eOKpDDX0HYzU9M=
Date:   Mon, 7 Sep 2020 19:47:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org,
        "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
        Andy Gross <agross@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH v2 0/4] soundwire: qcom: add support for mmio soundwire
 master
Message-ID: <20200907141752.GD2639@vkoul-mobl>
References: <20200905173905.16541-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200905173905.16541-1-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-09-20, 13:39, Jonathan Marek wrote:
> This adds initial support for soundwire device on sm8250.
> 
> Tested with the "wsa" sdw device, which is simpler than the others.
> 
> v2 addresses some feedback, but I kept this series as simple as possible.
> In particular, I didn't implement CMD_NACKED from FIFO_STATUS, because
> the downstream driver doesn't define this bit, so I can't implement it.
> Soundwire works without it and It shouldn't be difficult to implement later.

Applied all, thanks

-- 
~Vinod
