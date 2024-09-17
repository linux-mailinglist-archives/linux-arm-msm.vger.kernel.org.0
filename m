Return-Path: <linux-arm-msm+bounces-31895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C397ADB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EB4AB217D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 09:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4BAE15AAC8;
	Tue, 17 Sep 2024 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7rqANJ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36851531C5;
	Tue, 17 Sep 2024 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726564286; cv=none; b=W5aNzXyWJNwnsgQMAdfVt1A9yNbafb38HWaauJUB20P/agJVOpjrxzWqt3+KR3i+aqDMlCH9fjo3Y73Ejqn2B841PhMBD2cj+/Jk3VBjSMfxUOhXOv8dnAFMPznHqYh4j8ANdAoMYdEolR08ml09IwEU1IiabHIHkvpWo7M3rkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726564286; c=relaxed/simple;
	bh=1M660MGwnKa5xzZvC3cRlluW/mS30wfRQ495mAyX7so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9lmG6k+3qq6Y03DvgYb0nQHewdAD2IYpSJx6DlEiKn8j/3UzDuYsa9W+U54w7aZyDFWkGm16OSp+dmLR93J2rv6SDkoLE4bccND9jVjJ57F1dY4eNHTdONPVoi7JhINuLF2+/AgvzZ36Y4PGDLUVF4Rv0n+JFWwMiYjH9gAQP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7rqANJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE16C4CEC5;
	Tue, 17 Sep 2024 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726564286;
	bh=1M660MGwnKa5xzZvC3cRlluW/mS30wfRQ495mAyX7so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7rqANJ8HHb0qCS2AwNDRc4cZ2mneHx4ZRXKA37jAZLhGYwztgErwjZEbTheuF8xM
	 vUyooFO6v4WbZ4T8wQHHH4LWifpJK6rj4dcEqBOU4f66SJetKEIilfGKEF5QU9WWvd
	 UYRaovWZVeyT2+Ybb2z/SR3nQ+9f/hke8+jNKV5fMi1CtojNMYqWpzd+XfNt2wUO6L
	 Dgeqi8cv98L22wpF2xy5s0/QY4kIxxEC/zcv5t5V0uXTJoYw/4wnFsyd59AuWVciHe
	 j3+fdRUOmSu6h2aIu39HIUqeeFdL73pOUFbt9bEKXrwtOSlB/9wdbF7gQLedvcBlLK
	 JCc2Vi2p93tlA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sqUFN-000000002pB-0JYr;
	Tue, 17 Sep 2024 11:11:45 +0200
Date: Tue, 17 Sep 2024 11:11:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 3/3] serial: qcom-geni: fix receiver enable
Message-ID: <ZulH0SZJBlgS4teO@hovoldconsulting.com>
References: <20240916172642.7814-1-johan+linaro@kernel.org>
 <20240916172642.7814-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916172642.7814-4-johan+linaro@kernel.org>

On Mon, Sep 16, 2024 at 07:26:42PM +0200, Johan Hovold wrote:
> The receiver should be enabled in the startup() callback and there is no
> need to stop it on every termios update.
> 
> Since commit 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during
> console writes") the calls to manipulate the secondary interrupts, which
> were done without holding the port lock, can lead to the receiver being
> left disabled when set_termios() races with the console code (e.g. when
> init opens the tty during boot).
> 
> Fixes: 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during console writes")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Turns out the DMA implementation is broken and currently depends on
these bogus calls to stop and restart rx in set_termios().

I won't have time to look at this for a couple of weeks due to
conferences, so please hold off on merging these until I'm back.

Johan

