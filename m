Return-Path: <linux-arm-msm+bounces-48191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FCA38012
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F686169CFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D98216E1E;
	Mon, 17 Feb 2025 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="BFnG4wDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA5215F4B;
	Mon, 17 Feb 2025 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787830; cv=none; b=FOEcY60JEATUY3hYELCJEFX/QRUOH2V5tnjY1RMF4Nsdhnj4tK+vffyaBEe3LPC7of7aNFfCRrb4RWIu0oweQdt+IozRXC4F0wEG7MjnzqIfzy/85j/yM2bEtTRQ9LKfG9qqLnUUxayiT39ZqSfqCoWI1FnXQipewfszxOMu+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787830; c=relaxed/simple;
	bh=WovgSGbvNWLLRcAWn+Mya6CHxmCESkWIMuKX5gtD5aI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iq7UNIX8uvNQwOVsMZeg1Q75RmXHSktasPQ6TI82TVSMnHN3+cKvsOffFRbAwxHV8MogPkhigKKVJnEtk1IznaenaBC4Tz/LwcaH3zQeP51ZS7xHNWaAq1sLh2sw8GrQ3yfc+sp9aF6W6RoILrKnRp1Zfps6XQDq/6fygOeFfmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=BFnG4wDc; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=WovgSGbvNWLLRcAWn+Mya6CHxmCESkWIMuKX5gtD5aI=;
	t=1739787829; x=1740997429; b=BFnG4wDccXfm9v/YgG2uOh+/7hulCLBJphafC4pVRr4USz0
	1Dg0Hmpazntti/JFpt1WVvz9jIw+C07U7Us6lpZFIlLbJu4lrxC1kvogUCJpEMhbWyl8VH6E8SACw
	WAp/Jj7xju02PUPSzpSd/H30k9pxHqBKYYrQfCKDHRM3eVJIt3MJj/3SwG3KVVmxZLXQe573UZR4X
	dNroxTxY+47E9reHGW6qY4Dy50NC/DJja9/21i8HUAH130zQ1TSIKIvOeoghbRi5HyrKR4JDGy3m2
	BZHUGhzr3sRYhHE4dvgd7FlkL855IhhNwwKxzknQ7+hRTLyu4oqK7OoTqLrtGUYA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjyHp-00000000GpA-1DBY;
	Mon, 17 Feb 2025 11:23:37 +0100
Message-ID: <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 11:23:35 +0100
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-02-17 at 12:16 +0200, Eugen Hristev wrote:

> This series comes as an RFC proposed solution to enhance pstore and
> devcoredump with the following functionality:

...

> This patch series attempts to solve this by reusing existing
> infrastructure in pstore and devcoredump, and provide a copy-free

...

You mention devcoredump multiple times, but it almost seems like you
don't even know what devcoredump does? I don't see how there's any
relation at all, and the code added to it seems to have no relation to
the actual functionality of devcoredump either?

johannes

