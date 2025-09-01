Return-Path: <linux-arm-msm+bounces-71424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B69B3EC00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 18:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444F33A4412
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B682EC080;
	Mon,  1 Sep 2025 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4KxBU+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05D2EFDA0;
	Mon,  1 Sep 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756743030; cv=none; b=hrDYzHncprtZ7SWVGa5iyXXEGW5Mv0GydXZW/2DfvYfQWd5qEO/7sDPA1DSqGoxxRIIVM0wLvCcXGeqHOJtvckQpSgqmB4j+YMwZeKhprzF99M7HepRosk7wWGp8TbpUXyqgAs55uxrrjIISyVcVQ6F0O3L0ntf3DMD1stHlj5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756743030; c=relaxed/simple;
	bh=0OZH8z7M+FViI0pkVtfAPGcVrskEP451MTfbO07cYPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8ZkJ3inFOTqH92iG7loxsEUBJF+M4TRxKSwYmlYeLtdr6m+pBC3JF1xVXI1KfFfuqP58b7FHA+Bawxa8D0v6qPsc5h0yMDNS/hiOmpwA5mxw1HReouQ5Qt/1Az7vgjPe5AzNa3hj45eLzJnBb1bWnG5y6wa//Wh2e4Io7N0K8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4KxBU+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2734C4CEF0;
	Mon,  1 Sep 2025 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756743029;
	bh=0OZH8z7M+FViI0pkVtfAPGcVrskEP451MTfbO07cYPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4KxBU+RGhCc3u4cMYLdD+KjXn+qWZMhzz8hMIAWfGGpKM0FE0ElDYH8w3NEbuOUw
	 8E9kQfsnASvRjYbjg/bke5DEhzuHuUj5TCz6RjpmQrxFaDpjFCzF2rbCyg/QRxL/Oe
	 Z7pfS+E3GyvbPAJAhDMZZcwmxoDM6da/dmBytMxLoywoebWLJz6DpSKrSb8Kp4Bboa
	 OAYNqWoa/jZ7khV5DbFdNnH//pdlT1MEFPx+2ttHFolI7ITMMDHIBr34Rj+U16tLPk
	 awk84AjAQbLenZgPBvCyRulS7hOUUOtg0SRI+gDs6PE3eiHHb4O58AscV+08HXhgn/
	 vcU61x9WuNHhw==
Received: by venus (Postfix, from userid 1000)
	id D55171801BA; Mon, 01 Sep 2025 18:10:26 +0200 (CEST)
Date: Mon, 1 Sep 2025 18:10:26 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
Message-ID: <pslvca6j5fpr5dgvciwlaz3fubnkjq5olfontaaytt56xs4bvk@5typdoosbreo>
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0b329e-ab3e-4655-8f27-e7a74784302a@app.fastmail.com>

Hello Mark,

On Mon, Sep 01, 2025 at 09:48:39AM -0400, Mark Pearson wrote:
> On Sun, Aug 31, 2025, at 5:28 PM, Sebastian Reichel wrote:
> > Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which
> > is in theory compatible with ThinkPad ACPI. On Linux the system
> > is booted with device tree, which is not supported by the ThinkPad
> > ACPI driver. Also most of the hardware compatibility is handled
> > via ACPI tables, which are obviously not used when booting via
> > device tree. Thus adding DT compatibility to the existing driver
> > is not worth it (almost no code sharing).
> >
> > The driver currently exposes features, which are not available
> > via other means:
> >
> >  * Extra Keys
> >  * System LEDs
> >  * Keyboard Backlight Control
> >
> > The driver has been developed by reading the ACPI DSDT. There
> > are some more features around thermal control, which are not
> > yet supported by the driver.
> >
> 
> Thanks for working on this - it's great.

It's a personal scratch your own itch project, as I daily drive the
machine.

> I'll see if I can get the EC spec so I can do some checking on the
> values (I thought I had it already, but I can't find it). If this
> file can be used for other platforms then it might be good to
> rename the file to not be specific to the t14s? I'm curious if it
> can be used on the X13s or the Yoga platform.

Maybe. I only have the T14s (apart of my older Intel/AMD ThinkPads,
which use the ACPI driver). The ACPI DSDT functions completley
abstract the lowlevel I2C interface, so in theory every ThinkPad
could have a completley different EC and still use the same ACPI
driver. So this needs to be checked per-device. Hopefully the low
level interface is similar in those, so that we don't need to spam
the kernel tree with multiple different EC drivers :)

> Couple of notes
>  - I do agree it doesn't make sense to add this to thinkpad_acpi.
>    That file is too big anyway.
>  - If there are other pieces like this where some detail of the
>    platform is needed, please do let me know. I never got enough
>    time to work on this platform directly, and it wasn't in our
>    Linux program, but I do have access and support from the
>    platform team for getting details on it. If I can help, so not
>    too much reverse engineering is needed, I'm happy to.

Thanks for the offer.

I would be interested in bits around system suspend. Right now
support on X1E is limited to sending the CPU into suspend. Much of
the machine seems to be still powered. Right now the keyboard
backlight and all the status LEDs stay on and the LID + power led
does not go into the typical breathing pattern. Additionally I had
to disable wakeup capabilities for the EC interrupt, as closing the
LID generates an event and thus an interrupt, which wakes the
system. Obviousy that is undesired from user's perspective. My guess
is, that there might be some register to mask events, but I haven't
found it so far. Alternatively the EC might mask them automatically
when the system is send into suspend, which I also have not yet
figured out :) The only bit I know is, that EC register 0xE0 is
involved in modern standby.

Apart from that and (probably) unrelated to the EC: I noticed that
accessing the built-in webcam (with the X1E camera patches from
Bryan O'Donoghue) does not enable the status LED. It would be
nice if you can check how that is wired, so that it can be enabled
when a camera stream is started.

Greetings,

-- Sebastian

