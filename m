Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73086FDF05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 14:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfKONhD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 08:37:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:60462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727329AbfKONhD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 08:37:03 -0500
Received: from localhost (unknown [122.181.197.112])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E30EC20728;
        Fri, 15 Nov 2019 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573825022;
        bh=xw6+YS+K/aX6p3C3mvtL28AvnVECOYE38j0p3cjI+i4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=exIVUUp5a2Q2YN9kc/gsxvHncmC3Ty8P1XudP4oreOB/6MqS4o8V6SYYyUf+zXvaz
         a4QhGJ8J9jUJ4GjjizqVUdg3vNUmN7BJ58B61qzY0oEX3f5CxKYQX1b25HsZ8dIqpL
         G8I0vRA1AUrD7KMckbe7o/4eM/xzNtNvx+m/nETo=
Date:   Fri, 15 Nov 2019 19:06:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] ALSA: compress: Add support for FLAC
Message-ID: <20191115133657.GA6762@vkoul-mobl>
References: <20191115102705.649976-1-vkoul@kernel.org>
 <s5h7e41jmvl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h7e41jmvl.wl-tiwai@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-11-19, 14:21, Takashi Iwai wrote:
> On Fri, 15 Nov 2019 11:27:02 +0100,
> Vinod Koul wrote:
> > 
> > The current design of sending codec parameters assumes that decoders
> > will have parsers so they can parse the encoded stream for parameters
> > and configure the decoder.
> > 
> > But this assumption may not be universally true and we know some DSPs
> > which do not contain the parsers so additional parameters are required
> > to be passed.
> > 
> > So add these parameters starting with FLAC decoder. The size of
> > snd_codec_options is still 120 bytes after this change (due to this
> > being a union)
> > 
> > I think we should also bump the (minor) version if this proposal is
> > acceptable so the userspace can check and populate flac specific structure.
> > 
> > Along, with the core header change, patches are added to support FLAC
> > in Qualcomm drivers. This was tested on 96boards db845c
> > 
> > Srinivas Kandagatla (1):
> >   ASoC: qcom: q6asm: add support to flac config
> > 
> > Vinod Koul (2):
> >   ALSA: compress: add flac decoder params
> >   ASoC: qcom: q6asm-dai: add support to flac decoder
> 
> Feel free to take my ACK for ALSA core part:
>   Acked-by: Takashi Iwai <tiwai@suse.de>

Thanks Takashi, should we bump the version for the header to check for.
Btw I plan to add other decoders required as well. I have mp3 working
without any additional params but rest need additional info

Thanks
-- 
~Vinod
