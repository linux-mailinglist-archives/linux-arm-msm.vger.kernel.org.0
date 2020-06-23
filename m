Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD84204884
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 06:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732293AbgFWEJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 00:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732100AbgFWEJO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 00:09:14 -0400
Received: from localhost (unknown [171.61.66.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FE95208A7;
        Tue, 23 Jun 2020 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592885354;
        bh=ZRJiyt96N9POXJVP7NHy1iE13kRK0Ty6Vm6e9HZ9pdc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GT81H/dR7h27MNGFDfBssIYh31YIzJ0kJgkvPdw3ZuIg8vEN+VBiNFzSUx/clnqV5
         76i9o1tJgtjDMR2ioYpVIi2dBvy3ZTg3mirN4jIYKzIavI3R3W8rpyI21vi+QWnlAQ
         0B9wtwCgZe+YGtvP+uiQwBuU3jgbe3eGPcaI+oac=
Date:   Tue, 23 Jun 2020 09:39:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200623040910.GP2324254@vkoul-mobl>
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
 <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
 <20200622151334.GW71940@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622151334.GW71940@ediswmail.ad.cirrus.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-06-20, 15:13, Charles Keepax wrote:
> On Mon, Jun 22, 2020 at 08:28:48AM -0500, Pierre-Louis Bossart wrote:
> > On 6/22/20 1:58 AM, Vinod Koul wrote:
                      +----------+
> > a) can you clarify if we can go from running to free directly? is
> > this really a legit transition? There's already the option of doing
> > a stop and a a drain.
> > 
> 
> This is allowed in the current code, the kernel sends the stop
> internally in this case, so it kinda does go through the setup
> state just not from the users view point. I am not sure I have a
> good handle on if that makes sense or not.

The idea was to stop first so that we can handle dmas which might be
setup (like running/paused/prepared). So we should stop first and then
free up. But i think it was an overkill... :)

> > c) no way to stop a paused stream?
> 
> Currently the code does allow this and it certainly makes sense so
> should probably be added.

Yes will add

-- 
~Vinod
