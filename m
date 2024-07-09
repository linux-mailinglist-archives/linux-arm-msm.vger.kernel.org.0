Return-Path: <linux-arm-msm+bounces-25579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A92C92B3E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 11:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FDD91F2357B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 09:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB1D154458;
	Tue,  9 Jul 2024 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJJgeAyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558114BFB0;
	Tue,  9 Jul 2024 09:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720517570; cv=none; b=PnL4Aoag7FWmU9emkczUhD6un5zGnYnpVK6nyN2CWAz0a7+hPAS8xtp5T7EjzOFas+v8NpolHQ66d/Gy4eM0pczRDZiN7OQlh3v9PTU0v+rgw98oi/KnMcqw7T8xeX+w7QlzkJQYToXTH+ZuU8LtNAMOj58DXeB1eLw6Rm/+Ucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720517570; c=relaxed/simple;
	bh=hg2hGF7K4KQBhvolAaT0MrUalgjsW8G+lwl6c2ZWnek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDFNhbgXfydo46FZcSS9r9VjkjCnOuJ2qsmmLZZ0qjkTLjfooNmBQ91v4S5Y78CKxk806fAwN547BRQdz3bvbJEaJQbWbQkMwXNUOFDBY+dg8rZTLOA+6/FHW0atTaLU0BLTwr5s9vK+5QfI/prkOfs8YttNkb7/MBwplnuiOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJJgeAyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2544FC3277B;
	Tue,  9 Jul 2024 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517570;
	bh=hg2hGF7K4KQBhvolAaT0MrUalgjsW8G+lwl6c2ZWnek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJJgeAyKodBDS56LhLzxVYex44QWx+xcX8kFf1aRnTfsuzgmWJWp3V9eEXmLniWPC
	 NYpfcCJg/pJch7EpS0bNwdfNSFAB3NQVMrINZTBsaT2bRMpEJcZYeot5dhkiYnE6cM
	 YSq8OVrhe5a9cyfpTASGlDu/vog8W/M1BTQWLQCyX0oGeDdgnEm5OQWKHqwm0DRxGa
	 E5V0Jl4OXIJHuLOsM4QL/hVFqg/omUMWJydnLNN6nPUVhjNxpDZSpTnWpnjdoWhiaH
	 NXKptMNhH9CR3Tbwz31zP6+UxqxqJWcanilcXQzpdfICS7w7ksONJsmDw157kt0atr
	 hm1AAhU1eZ1aA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sR7DT-000000005RF-2YpH;
	Tue, 09 Jul 2024 11:32:56 +0200
Date: Tue, 9 Jul 2024 11:32:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] serial: qcom-geni: fix lockups
Message-ID: <Zo0Dx7-6mnIN4wMK@hovoldconsulting.com>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
 <2024070445-stunner-scrawny-1b03@gregkh>
 <CAD=FV=X0Sk0Xkz7Mcna6BNhGpxZQY5KArY=LqMPEwbocvmojQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X0Sk0Xkz7Mcna6BNhGpxZQY5KArY=LqMPEwbocvmojQA@mail.gmail.com>

Hi Doug,

Hope you had a good holiday.

On Mon, Jul 08, 2024 at 04:57:55PM -0700, Doug Anderson wrote:
> On Thu, Jul 4, 2024 at 3:31 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jul 04, 2024 at 12:18:02PM +0200, Johan Hovold wrote:
> > > Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
> > > hard, for example, when stopping a getty on reboot.
> > >
> > > This was triggered by the kfifo conversion, which turned an existing bug
> > > that caused the driver to print discarded characters after a buffer
> > > flush into a hard lockup.
> > >
> > > This series fixes the regression and a related soft lockup issue that
> > > can be triggered on software flow control and on suspend.
> > >
> > > Doug has posted an alternative series of fixes here that depends on
> > > reworking the driver a fair bit here:
> > >
> > >       https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/
> > >
> > > This rework has a significant impact on performance on some platforms,
> > > but fortunately it seems such a rework can be avoided.
> > >
> > > There are further bugs in the console code (e.g. that can lead to lost
> > > characters) that this series does not address, but those can be fixed
> > > separately (and I've started working on that).
> >
> > I'll take these now, thanks!
> 
> Are you going to continue to work on the driver? There are still some
> pretty bad bugs including ones that are affecting Collabora's test
> labs. Unless you want to try to tackle it some other way, I'm going to
> keep pushing for something like my original series to land. I can
> re-post them atop your patches since they've landed. This will regress
> your performance but correctness trumps performance.

Yes, I have a working fix for the console issue that could lead to lost
characters. I need to spend some time on other things this week, but I
intend to follow with fixes for the remaining issues as well.

Johan

