Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C44B101262
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 05:15:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfKSEP0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 23:15:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:38000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727018AbfKSEP0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 23:15:26 -0500
Received: from localhost (unknown [106.200.237.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 214C82231A;
        Tue, 19 Nov 2019 04:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574136925;
        bh=bDUyDx/f/KUw+cY6r3VOmVRVO8EkUIrxtun7yYSHFR4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R69eQpWWPuzeknOX41NxKcmnDBr9VqW6W3yXZd5PDbDKn/5FHE0JoKW9DwW9GjXUu
         GQJCYl5P2IUSWBL8Xd7axFNwbdJy6VgPL5/t5zwYLgdkbdPMko4BhrSnxKl2taQRCP
         IT7fDfoy1charOQ29skTcD/dialfY7BvCZW113Qk=
Date:   Tue, 19 Nov 2019 09:45:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 0/3] ALSA: compress: Add support for FLAC
Message-ID: <20191119041521.GB82508@vkoul-mobl>
References: <20191115102705.649976-1-vkoul@kernel.org>
 <19c70dac-aa3e-f0ea-d729-26df4f193eb0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19c70dac-aa3e-f0ea-d729-26df4f193eb0@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-19, 08:55, Pierre-Louis Bossart wrote:
> 
> 
> On 11/15/19 4:27 AM, Vinod Koul wrote:
> > The current design of sending codec parameters assumes that decoders
> > will have parsers so they can parse the encoded stream for parameters
> > and configure the decoder.
> 
> that's not quite correct. It's rather than there was no need so far for
> existing implementations to have parameters on decode, this was never a
> limitation of the design, see e.g. the comments below:

You might be correct here as this is implementation based and in this
case looks like decoders also need the additional params

-- 
~Vinod
