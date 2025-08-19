Return-Path: <linux-arm-msm+bounces-69651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B187FB2B87D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C82A5E11F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A557254AF5;
	Tue, 19 Aug 2025 05:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOVzgR6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA91A294;
	Tue, 19 Aug 2025 05:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755580093; cv=none; b=dk4q+ojKi6Nl1xXkM+fqtsAwSgWaggz1Dk8pDFsfeD0t/Fln46VdzSOLMWQrdcn2THBw40jtGxkCKq25YWi1Yloz14ZjqMBz6zlXEeqZT1aeWirqLRDZMJxiNY8eE3LqBK+6yAdME21snZJ67LXAFCOS4ZmI4CedqHWJxCfOBVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755580093; c=relaxed/simple;
	bh=v8ckINysU01zdhrDxYflMq4LyhKbfk5+seby+1Vuep0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWwKnADYZk5dAAhVTHQK4CKm1qpPkccmgHgHQP362zHhYGSHubJ/fHTD4u9ZbpUE7xjPcNncKTuB/6We63Cw9PWf+PMLjSp4dVR1DrMAOcMra8ohILQvFEhHJBLfYP9XnKctQjlMpIOuGvwrvwPFhSanCrDPq3UrLe7RX0+o1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOVzgR6P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C7FC4CEF4;
	Tue, 19 Aug 2025 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755580092;
	bh=v8ckINysU01zdhrDxYflMq4LyhKbfk5+seby+1Vuep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOVzgR6P8ZuYW6G/v1G9RUH3Fa2+XpSzz1TkLHsRKDbq2Vn1K6UFEC33TOxUAcruN
	 tLTUz1siRWJn7b+cUwdprNOyjDYufOZcmLEru8HCNrUgtRDFPyjW4YfIbsyuzdU3vW
	 5jGw/AAfC124CDX+foVBZCj8qKkXWY8DcjNKQv3xt/upGLJdKSdwaqt0/KqsoMo1B+
	 KRPUVuVPg/4xU5qzKD+jRnZzC1jEy4jXL0oPGws8Jn5yTdzxK1GG1iD1lyZyOoXFXA
	 Ff8t622Tq1tq40otnIZjiD1tXp3624zVnExt04b7X0uKGGRBxbnw9VFnSXjak5kctL
	 KR+I+/zzoJb6A==
Date: Tue, 19 Aug 2025 10:38:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.de>, Joris Verhaegen <verhaegen@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add
 SNDRV_COMPRESS_TSTAMP64 ioctl
Message-ID: <aKQGuPgwXE-Unzeq@vaman>
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com>
 <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de>
 <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKMzGRzeRqkOwTNS@opensource.cirrus.com>

On 18-08-25, 15:05, Charles Keepax wrote:
> On Tue, Aug 05, 2025 at 07:59:42AM +0200, Takashi Iwai wrote:
> > On Tue, 05 Aug 2025 06:47:59 +0200,
> > Vinod Koul wrote:
> > > On 01-08-25, 10:27, Joris Verhaegen wrote:
> > > >  	ret = snd_compr_update_tstamp(stream, &tstamp64);
> > > >  	if (ret == 0) {
> > > > -		snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > -		ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > > > -				   &tstamp32, sizeof(tstamp32)) ?
> > > > +		if (is_32bit) {
> > > > +			snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > > > +			copy_from = &tstamp32;
> > > > +			copy_size = sizeof(tstamp32);
> > > > +		}
> > > 
> > > Most of the applications and people would be 32bit right now and we
> > > expect this to progressively change, but then this imposes a penalty as
> > > default path is 64 bit, since we expect this ioctl to be called very
> > > frequently, should we do this optimization for 64bit here?
> > 
> > Through a quick glance over the patch, I don't think you'll hit the
> > significant performance loss.  It's merely a few bytes of extra copies
> > before copy_to_user(), after all.  But, of course, it'd be more
> > convincing if anyone can test and give the actual numbers.

That would be better

> I am inclined to agree the impact should be very minimal and the
> only alternative is a more complex implementation. I would vote
> for leaving this as is.

But yes, we can for now, go ahead. It is internal kernel flow can be
adapted anytime :-)

-- 
~Vinod

