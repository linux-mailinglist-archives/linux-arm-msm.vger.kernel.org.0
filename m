Return-Path: <linux-arm-msm+bounces-87936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9DCFFE14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9846130AFCF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9601A36996A;
	Wed,  7 Jan 2026 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAzxLaZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B3B34D93A;
	Wed,  7 Jan 2026 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767804681; cv=none; b=MzR01FBxZD4Ni+ZSMq3/F11uxwCHFy8c8INfocOvCz4E9XI4q5v2Q/BT74hIfz3eKcsOYazadDV44kORYoSEIJMpCwI4zJdMdyWfS3r9R43iaMSlwFXG/xiAIyzPpy3B/X2aQAkyWUxHFFSeyPF+bGTBpMK/0S7YK7Z1b+k94sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767804681; c=relaxed/simple;
	bh=7vo3OqbSKQ+nBZ2yjy5ffdZQBlKltTm0UqmJZBQLtyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+Iyu/dcRkT91B271Q7cZDzTgLI6FjGkU7UdVTWgWNYnoHHqQOqUCF/HnYM+byaJknwDSOVeWaVh/905CTAAc+1MsR+dfvg6IG4JE0CUhvNrI6QNARFSxCjoyAe9xW0eEPBpPJLmUdv/wYera163NmnCoQOt3UUX6p54sLUBfbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAzxLaZj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38997C4CEF1;
	Wed,  7 Jan 2026 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767804679;
	bh=7vo3OqbSKQ+nBZ2yjy5ffdZQBlKltTm0UqmJZBQLtyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DAzxLaZjqOGAK4CTlUaMGFauRapzGCFPT8Iuo2BjgAOg2dWUnhMdXpV7DbGz5GO17
	 SB97Ou3OgTAeEl5fnXFoumqDVowgREk9RSVid8qCPp0fu/FlYyPauV8Ym1vlMsHBXd
	 nAzJ3O/hYWhcMe9VlfCAWP500kp/0L2C7p9tKAf7Anq6HLkQDTyNVzeBCaVkBZIe16
	 NxHfgkF+KSXkGBVHCYhiOjQnipcWeaDMbDbrAKNqiR4OJgW3WcU5u95cB7/3ETGydT
	 b0/Ze31wYj3MyAXQjsZhbIg2HPpvfiRIgvH/d50sVOGZBhqAIK0RKOTHDK3Qr1tCu+
	 cP5JJkPWcdR4w==
Date: Wed, 7 Jan 2026 22:21:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/4] scsi: ufs: core Enforce minimum pm level for
 sysfs configuration
Message-ID: <p7icfbp2p6kpzcywfdgq6z33p3icrs3trtn2cmgf5lsgcxg34k@jtixkr6njmm5>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
 <7547e933-1cbd-4bf9-bc8a-fb0c78b11337@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7547e933-1cbd-4bf9-bc8a-fb0c78b11337@rock-chips.com>

On Tue, Jan 06, 2026 at 10:27:29PM +0800, Shawn Lin wrote:
> 在 2026/01/06 星期二 21:40, Ram Kumar Dwivedi 写道:
> > Some UFS platforms only support a limited subset of power levels.
> > Currently, the sysfs interface allows users to set any pm level
> > without validating the minimum supported value. If an unsupported
> > level is selected, suspend may fail.
> > 
> > Introduce an pm_lvl_min field in the ufs_hba structure and use it
> > to clamp the pm level requested via sysfs so that only supported
> > levels are accepted. Platforms that require a minimum pm level
> > can set this field during probe.
> > 
> > Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
> > ---
> >   drivers/ufs/core/ufs-sysfs.c | 2 +-
> >   include/ufs/ufshcd.h         | 1 +
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
> > index b33f8656edb5..02e5468ad49d 100644
> > --- a/drivers/ufs/core/ufs-sysfs.c
> > +++ b/drivers/ufs/core/ufs-sysfs.c
> > @@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
> >   	if (kstrtoul(buf, 0, &value))
> >   		return -EINVAL;
> > -	if (value >= UFS_PM_LVL_MAX)
> > +	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)
> 
> It makes sense that some platform support a limited subset of power
> levels. But each level is in increasing order of power savings, and you
> set it to UFS_PM_LVL_5. Don't you support UFS_PM_LVL_0 the full active
> mode?
> 

These are the suspend levels, not runtime levels. So yes, our platform doesn't
support full power mode when it is in suspend state.

- Mani

> >   		return -EINVAL;
> >   	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
> > diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> > index 19154228780b..ac8697a7355b 100644
> > --- a/include/ufs/ufshcd.h
> > +++ b/include/ufs/ufshcd.h
> > @@ -972,6 +972,7 @@ struct ufs_hba {
> >   	enum ufs_pm_level rpm_lvl;
> >   	/* Desired UFS power management level during system PM */
> >   	enum ufs_pm_level spm_lvl;
> > +	enum ufs_pm_level pm_lvl_min;
> >   	int pm_op_in_progress;
> >   	/* Auto-Hibernate Idle Timer register value */
> 

-- 
மணிவண்ணன் சதாசிவம்

