Return-Path: <linux-arm-msm+bounces-95006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIZeCk68pWnNFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:35:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DD91DCF5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1430303EFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591DD3E5592;
	Mon,  2 Mar 2026 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lxn3G3Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341CE32AAA0;
	Mon,  2 Mar 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468944; cv=none; b=H7QfsaOIZBSPPzGt8uhCrwG2MzJT2qnvJspNtecAUNVRHY9avCD4PPV5oDfoxRStAIuCJXYAiu3c9tdhrgB5XsFyy3BpxyTuEb3wWNQwqY/iaLmZ0F/XTTraBjoLJ1Zy4pWbW/KyZRHcLswK3BvD3YV8GOrqrOlt5nJjZYzyBPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468944; c=relaxed/simple;
	bh=Q5EJz0ks9pfcEKpulvqPiKiB3QcWP4MPjhaSyuLWtKA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oYjpaLHj7p56aK7O2Ptf4kvKNKsIq+wjGXSGKzWpRN7MFvRoF3uALoW1POfw8vB5gcCH9mlEq6CTWF8MAaVBMO6RLB5ETMOIrtdJznRRO3kmTR+IwSxR+j8iyZINsJk0XOg+47RpUzCK7Rr//ku3BQ1nVNwKHcZFKWHR7xqSeww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lxn3G3Qg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551A2C19423;
	Mon,  2 Mar 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772468943;
	bh=Q5EJz0ks9pfcEKpulvqPiKiB3QcWP4MPjhaSyuLWtKA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Lxn3G3QgbEq3Mw2dsJKkaDqk5SKvaOp5Gs4pFlnODhb9INkygZgiGZdaRoF6Nuv0P
	 BR5iV8/i60Q1y6PJKV4iGJjZnWcac/kTJlLw83K/8Ffwb5VyMP5SqyfxAIUCptdFsL
	 rhofpvbYeC6LMiGyD8zKmrP5KlGcbLEB1f/lpHB2r+Sa6zKXHSgU5GQHec+qJe4oav
	 ehMfC5OXRAer9/XETfOexepaoaQhDQ+4BXSp0PDwcxVfKbDAqIw2/NYv69viXzd0Yh
	 93ws0C0XQw6/8aCxDkUW6RJ8V1Rr165zj6wx/1abbm6pySatXQLzfBn2dEnQZ20QIg
	 x5E0dXBq/qbGg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:28:58 +0100
Message-Id: <DGSFSTFQ4Z1K.31HQCRTB3ZHF7@kernel.org>
Subject: Re: [PATCH 1/3] driver core: generalize driver_override in struct
 device
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
To: "Armin Wolf" <W_Armin@gmx.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260302002729.19438-1-dakr@kernel.org>
 <20260302002729.19438-2-dakr@kernel.org>
 <bc06539d-84b3-4500-86e7-3f01f1ea3183@gmx.de>
In-Reply-To: <bc06539d-84b3-4500-86e7-3f01f1ea3183@gmx.de>
X-Rspamd-Queue-Id: 89DD91DCF5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:23 AM CET, Armin Wolf wrote:
> Nice patch series, centralizing the handling of driver_override in the
> device core removes a lot of duplicated code.
>
> I wonder if we can also move DEVICE_ATTR_DRIVER_OVERRIDE() into the devic=
e
> core by registering the associated sysfs attribute inside bus_add_device(=
).
>
> Bus types that honor driver_override could for example set a boolean flag
> inside struct bus_type to tell the device core that driver_override is
> supported.
>
> However this is just a suggestion, the current patch series seems fine to=
 me.

That's a very good suggestion, thanks for pointing it out. In fact, I alrea=
dy
thought of this at some point, but then forgot to implement it. :)

