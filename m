Return-Path: <linux-arm-msm+bounces-52434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A763BA6EB98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F26118949A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E011EB5F4;
	Tue, 25 Mar 2025 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvTmuiql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDE1D7E37;
	Tue, 25 Mar 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891531; cv=none; b=YmVPTAuM1joJdt7mlHsSHIWOefhHG3GcGH9z4fTlgl8P6CpX5Z9pST9rKg6NWSH2C1PEFDwFKhnqvdFbzgn3eGqFOegN8rBRIZt/ByZHO9UhjdKi6MNuEVRUXD7lZJ8RcACsgpduR8iRulBBp7ODDTid5OfXWmOhGfvD0A7Q5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891531; c=relaxed/simple;
	bh=snSj499Z4B28SJ88vP0oYeHCn3eY1Jv30mTgTv+rVOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGGiI4RzFIimQzoY0MmPFGIf3tmACCJtvupu9wuEYO9vp9qqTmeLBc2eP/zsqCoYQ6GY5MS/lhy2WweUyrBp4kk7pxLbylQRx1uRahC5shPMw+5DnBgdwyxxCu6k9URRFBkA2jm7Zh4K6ivlPf54/qceUO+tZrcrpnla2az4ddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvTmuiql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4718FC4CEE4;
	Tue, 25 Mar 2025 08:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742891529;
	bh=snSj499Z4B28SJ88vP0oYeHCn3eY1Jv30mTgTv+rVOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvTmuiqllccBeyG1Y4jvNQkKN67zLMJh7EMxMFKfYq5vX4l0KR5XzbgkjIazMwWTY
	 /pN3MulBZ/XBLvBQSaQeHHAfmG2G0quThleMm9RntG5VBtzXtzsMn7xvLTl77o4TmO
	 NsS7DvL7SChtvGefLPolDH9iPE21EXrrNqhdNOvzqP8Gd23W5/NJ/U+cgTtPK8SOE3
	 mDJ+ta8oWHc6TB6HMYr/Ux34OyAUhAzHCaQhu3odV1JMD8kfEtOsvbbS5AzAXA27VF
	 i6mrGMy6SPw/K0In6r0RHD9n7AQ9riP54+OXKN2v/05nZkXTlE3pD1MJsPhGhXhekg
	 Fs5oovz2BJVGA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twzhh-000000005kQ-1WOy;
	Tue, 25 Mar 2025 09:32:10 +0100
Date: Tue, 25 Mar 2025 09:32:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Clayton Craft <clayton@craftyguy.net>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: fix spurious DP hotplug
 events
Message-ID: <Z-JqCUu13US1E5wY@hovoldconsulting.com>
References: <20250324132448.6134-1-johan+linaro@kernel.org>
 <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd1bc01c-75f4-4071-a2ac-534a12dd3029@craftyguy.net>

On Mon, Mar 24, 2025 at 10:05:44AM -0700, Clayton Craft wrote:
> On 3/24/25 06:24, Johan Hovold wrote:
> > The PMIC GLINK driver is currently generating DisplayPort hotplug
> > notifications whenever something is connected to (or disconnected from)
> > a port regardless of the type of notification sent by the firmware.
> > 
> > These notifications are forwarded to user space by the DRM subsystem as
> > connector "change" uevents:

> > ---
> > 
> > Clayton reported seeing display flickering with recent RC kernels, which
> > may possibly be related to these spurious events being generated with
> > even greater frequency.
> > 
> > That still remains to be fully understood, but the spurious events, that
> > on the X13s are generated every 90 seconds, should be fixed either way.
> 
> When a display/dock (which has ethernet) is connected, I see this 
> hotplug change event 2 times (every 30 seconds) which I think you said 
> this is expected now?

I didn't realise you were also using a display/dock. Bjorn mentioned
that he has noticed issues with one of his monitors (e.g. built-in hub
reenumerating repeatedly iirc) which may be related.

I see these pairs of identical notification when connecting the stock
charger to one of the ports directly, and I noticed that they repeat
every 90 seconds here. After plugging and unplugging a bunch of devices
I think they stopped at one point, but they were there again after a
reboot.

So there's something going on with the PMIC GLINK firmware or driver on
the X13s. I did not see these repeated messages on the T14s with just a
charger (and I don't have a dock to test with).

> > UDEV  [236.150574] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [236.588696] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [266.208175] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [266.644710] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [296.243187] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [296.678177] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [326.276256] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> > UDEV  [326.712248] change   /devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-controller/drm/card0 (drm)
> 
> Not sure about you seeing it every 90s vs my 30s... anyways, I no longer 
> see these events when a PD charger is connected though, so this patch 
> seems to help with that!

Just so I understand you correctly here, you're no longer seeing the
repeated uevents with this patch? Both when using a dock and when using
a charger directly?

Did it help with the display flickering too? Was that only on the
external display?

> Tested-by: Clayton Craft <clayton@craftyguy.net>

Thanks for testing.

Johan

