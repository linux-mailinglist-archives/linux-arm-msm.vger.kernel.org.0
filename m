Return-Path: <linux-arm-msm+bounces-33701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DF996D51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408E11F255E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E7E199FA7;
	Wed,  9 Oct 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ce44ugnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171A16F0E8;
	Wed,  9 Oct 2024 14:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483023; cv=none; b=qoScEHefrwKWuaIKGVOvf/5MDSppMn9TizMw18f3ScFvkC2/UzrvPp6iBDHDv6WUHf+xJcnfCdyennvyxbMV+Q7Mgk9eiO1l1FbZDtAMPj1MQuPGeKAQK2MEw+Cat0R7vI3tDoWya6RKcvfzE0TmqNKVWYZhHAnAkCHD6wG+kxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483023; c=relaxed/simple;
	bh=BZV+eC9DqpJT5HQyiOQQwYWIjv7DqtZFUhE1ElmTqu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9LUH0GhsGwIEC4IOnUlGsq6Tnti7MW9WCyEp7x7kwo1GVlsuxt3qSqH7YUKRr5KInaPXsTH1Yq6/OVeHitJzq9Qcj6Dnk8j6m54jp1BbZJcKQqBPoxfcuEaGgziv4zvqDaZzUZtS3P7XMgE0LLRuVGSsEAXJYVKMXtinC/heU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ce44ugnA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEFAC4CEC3;
	Wed,  9 Oct 2024 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483023;
	bh=BZV+eC9DqpJT5HQyiOQQwYWIjv7DqtZFUhE1ElmTqu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ce44ugnANYAo8mWRVVlbMixlkxMhEG9RS4KYS6ZctliWQ9C9Va48/BNTqlhj30bO7
	 PxXin1pH9t4fiNIrbHTtjxidl8TvjPBPNHxnPWZJca/1fi53eTIC6EHEsjmZ5oJq7Z
	 1ftS001bPcI5sfcceocHZITrtWiW8AFeEqxuR9aANwb8DOMXQB/I7cGQlSvjTd7HNg
	 /qiWUMQCezlTNDb1D0QVWqK8Z7xgjt2h8Perj7umeiiy4amkXU6DbKXlNT9fv+aT0S
	 9MNKo6QIxDopPpBE16q2FtLTzRYq4nVbowJTcx6+g29D79wMHuU2r/RwNwcysBXJCk
	 TMDQVh7jjpijQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syXOU-000000003e6-33ld;
	Wed, 09 Oct 2024 16:10:26 +0200
Date: Wed, 9 Oct 2024 16:10:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/7] serial: qcom-geni: fix shutdown race
Message-ID: <ZwaO0hCKdPpojvnn@hovoldconsulting.com>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
 <20241001125033.10625-3-johan+linaro@kernel.org>
 <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UoU5Nd7sW66cjQzor+BP+W_f7uw0MGRaF6y7PH7KRN_g@mail.gmail.com>

On Thu, Oct 03, 2024 at 11:30:08AM -0700, Doug Anderson wrote:
> On Tue, Oct 1, 2024 at 5:51 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > A commit adding back the stopping of tx on port shutdown failed to add
> > back the locking which had also been removed by commit e83766334f96
> > ("tty: serial: qcom_geni_serial: No need to stop tx/rx on UART
> > shutdown").
> 
> Hmmm, when I look at that commit it makes me think that the problem
> that commit e83766334f96 ("tty: serial: qcom_geni_serial: No need to
> stop tx/rx on UART shutdown") was fixing was re-introduced by commit
> d8aca2f96813 ("tty: serial: qcom-geni-serial: stop operations in
> progress at shutdown"). ...and indeed, it was. :(
> 
> I can't interact with kgdb if I do this:
> 
> 1. ssh over to DUT
> 2. Kill the console process (on ChromeOS stop console-ttyMSM0)
> 3. Drop in the debugger (echo g > /proc/sysrq-trigger)

Yeah, don't do that then. ;)

Not sure how your "console process" works, but this should only happen
if you do not enable the serial console (console=ttyMSM0) and then try
to use a polled console (as enabling the console will prevent port
shutdown from being called). That should probably just be disallowed.

The console code, and the polled console code bolted on top, is a bit of
a hack so corner cases like this are to be expected.

When the polled console code was introduced it was claimed that it would
have "absolutely zero impact as long as CONFIG_CONSOLE_POLL is
disabled". Perhaps I'm reading too much into it, but that statement is
clearly ignoring the maintenance cost...

Johan

