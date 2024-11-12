Return-Path: <linux-arm-msm+bounces-37689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1829C6141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 20:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49251B23B09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C012230994;
	Tue, 12 Nov 2024 18:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZk0boJd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3EA208990
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731437318; cv=none; b=HcDHC4fxVnPS2HCbZtEvM8YhFfqlVl+wgCSyx8o2BLIhucvlGLKDN2UvYKfuF8Fuohq9WgVVWe5M1F6yqDTHzTPbnqzCSH6BqY5QL98bZItRRmiYUNsmLkJak2Vek1LlzjAsxao0q/2XreQYhmkvgL3Vu1TFG1b/7R7vdrrALlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731437318; c=relaxed/simple;
	bh=nZFqPwj9BUmaePBPVbuDjEfu7haZCtJGCGtPxjBdfVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5RoiQH+BdV4WN3OV1JrQpqPLxdkwdBetDeKHSsFimBddLm5J0ZecM9YWxITOC/J0RfJ/ptOEF5c7gr9V36lY3pRIz1RWO5TyvFOxppwwD0nZpgTsFonhktV0cq+okE4ZqFGl7W8Hn5+r9f9kK4dUAYmEJd/lE5+1jVPlKiY94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZk0boJd; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea7c26e195so62124757b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731437316; x=1732042116; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=dZk0boJdnyXKMW4zV7hFcJB3rYCnur/aSB+WvOdAIOXAgKwaezat708kClyF6v0/1J
         hNg4tTzzmnShjLUqy5dRpPcgbWGPGR4DD9uvchoCTFEtQ+sjj9VPn4fPQyI3Z2hUYn0s
         fEztvP7tLnzjrdHHylW7+60UnFnldvrilgY9qZmJqFmLqQEvdgtYATsfdhrXI27t4TXA
         7QhkLQN6UkpTv2F1iMuVMnmRUaXNjtS8GJMK/XsP8c03nxOIeuRwU7Z2BzkNh/Yf9taO
         VcU44HrehPYN8ahpPqZuykNP0k2vsWaM0znj6e38wac1DF3Ujr5VhX7BaBk+3EiiMnmv
         nAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731437316; x=1732042116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLfb7kUGJLjR3dpRxNjHUX8zNIZ2DpFKhaioXvi+P10=;
        b=ZEoxi56IbMtzsod6HLI5hUq2UuxwTO6cO3VEHWXhzHXtiUCkBI1EQqy0TgMzL0K1cJ
         qxno9YkTjT3qJfvguWLXG4YBGzoFYogA660Rq9QCdwCj9JyNT+gK7Se2fgT0OAOrkmBW
         g0Pjhvq/JaZtfAdACAkaY/ri3Rip0XE6Lo02X6fRy0YFvd7DmaK8pnyvfsdLCta0nU2w
         5DoTVRpGNv0Bgrm+78GPuEdMC5Y6NtX6/AFcG64CxdXCDWTcziqh1nHDgZGl6dT8JFqW
         BihkudU+i2fqkmwMRXcymazGJ5xIS1YcEV7VDQRj4HzxaZ502BmvFZLY89W9CW8b8GNl
         /fuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLJzs7hwmU1waJ1T9SEgCubez/LFD6hgHzTIqMp79A86JpRTk2iyDYOd41yGCReMJRhMPZuhUum5JAcwE1@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbVjeGDRUEMViu+CodTybFR5hmqcCJd1njFR/3bQqi9NO/zF9
	sTaIATOBMV0TpWU3yjF6YzNAk7vce41L1ZZy505edb7qp2VXpJ0oIq5qSJpQorkS+t3vRoKfZU+
	cLharsdoTRiU2hpFrPrG+CKsNsJrsEo9CQYm3SA==
X-Google-Smtp-Source: AGHT+IHU1F4In8hSy3BHO7PzehPnwak0Jka/B7VCySs0mHPl9uCBdzOrrdhGUm0wtjc2hrnl2RWBoqNBIdeikfPQLfY=
X-Received: by 2002:a05:690c:6d10:b0:6be:54e1:f1f3 with SMTP id
 00721157ae682-6ecb30a5145mr1527607b3.0.1731437315975; Tue, 12 Nov 2024
 10:48:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto> <20241106071215.jhnzcn4vkdfr3peg@bogus>
 <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com> <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
In-Reply-To: <ZzOOPJ_gI9TGadzV@hovoldconsulting.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 19:48:00 +0100
Message-ID: <CAPDyKFqnnw1A+R_wohpV7orKV4oGJNyxD+QL667iWq9d_odmfw@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Nov 2024 at 18:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Nov 12, 2024 at 04:56:26PM +0100, Ulf Hansson wrote:
> > On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > > > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > >
> > > > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > > > are required to X1E cpufreq device tree changes to land.
> > > > > >
> > > > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > > > >
> > > > > > Duplicate levels:
> > > > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > > > >
> > > > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > > > that we are addressing in this series will also get fixed by a firmware
> > > > > > update but they still have to land for devices already out in the wild.
> > > > > >
> > > > > > V4:
> > > > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > > > * Add cc stable and err logs to patch 1 commit message [Johan]
>
> > Sorry for the delay. I have picked up the remaining patches from this
> > series. All applied for fixes and by adding stable tags to them,
> > thanks!
>
> As I reported here:
>
>         https://lore.kernel.org/lkml/ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com/
>
> I'm seeing a hard reset on the x1e80100 CRD and Lenovo ThinkPad T14s
> when accessing the cpufreq sysfs attributes.
>
> Sibi tracked it down to the first patch in this series ("firmware:
> arm_scmi: Ensure that the message-id supports fastchannel") and
> reverting that one indeed fixes the reset.
>
> Unfortunately this was only discussed on IRC and was never reported in
> this thread.
>
> Ulf, could you please drop the first patch again until we've figured out
> how best to handle this?

Done, thanks!

Kind regards
Uffe

