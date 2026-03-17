Return-Path: <linux-arm-msm+bounces-98270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENCkGyy4uWnJMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 21:23:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C36FC2B2336
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 21:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A20AB30FE756
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 20:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7781F3845C7;
	Tue, 17 Mar 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TL6fitv2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51338340285;
	Tue, 17 Mar 2026 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773778659; cv=none; b=ZQS/nBL3cC88Qabw/oOxDuABoj4VoZDgPAhRd8XYG+Gka3qmKcNUZ/qGH5JMm6NmlKh2UCpBJ32kc5xk8/CmOXyBrsK0oNg8CISY9Y16TL8AvP8Ix1Q56+gs2VI8jWb6JuaqeKd6PfThB51AsCg/ZvMn7SyZfzgoi0Ur/IUnjgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773778659; c=relaxed/simple;
	bh=vYhbs/VqbUOKt2/+DJcPYXjJLKtcAFfOEyK6uBlyvd4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=oEkxUguZ9lWRsrLY7kp8nzw0S8b1S1UhQQJmV0uOKw90TSKWT3xn1aWLTFaN9MhWpGJW2xSH+yFzqBDebMMdKrtQSC+SZbwN+fBzoAwoX2Cj4dNHO1prcSDCvKA6a5ENse6h8N7JAKAlqIMTqv/XKA5J9t109VHxkQtKECiwlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TL6fitv2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB44C4CEF7;
	Tue, 17 Mar 2026 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773778658;
	bh=vYhbs/VqbUOKt2/+DJcPYXjJLKtcAFfOEyK6uBlyvd4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=TL6fitv25V9dtHUgFpTeEY4MRw6fZh5+uYq1cUU+38l/vbuVWNjRKd5VDX6wIMXet
	 iguOOKTZv9cbNV7KGKq224mYvMZtpZXotZeSACvoVh7eU8hsliC/+L0Qd4k46RPkkw
	 F53ovtApR/gfyu2EG6KS7JmAxHNJWVZjL/1pPhEv4q6bO1VI/QD8GHj5hJv2LspdIG
	 pZke5+A1LmhqtJdkGXrUDL8e+CH9v0WV7NpeKByPJsakjBWNEvvk+Tp4H59WY0U9Ql
	 d/mSXyym3Hex7sj3/5kXjt4R/A8yznIe/AciY0lOTmwK9XSpygr9myoyaCJBg3FLGz
	 IC2UHZmSiy8ZQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 21:17:34 +0100
Message-Id: <DH5C20DDJ8M0.4EKTFQYJYF7I@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override
 infrastructure
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98270-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C36FC2B2336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:

Applied to driver-core-linus, thanks!

>   driver core: generalize driver_override in struct device

    [ Use dev->bus instead of sp->bus for consistency; fix commit message t=
o
      refer to the struct bus_type's driver_override feature flag. - Danilo=
 ]

>   docs: driver-model: document driver_override
>   hwmon: axi-fan: don't use driver_override as IRQ name

    sh: platform_early: remove pdev->driver_override check

>   driver core: platform: use generic driver_override infrastructure

