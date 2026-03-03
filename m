Return-Path: <linux-arm-msm+bounces-95175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDJfBUkMp2kDcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:28:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6DA1F3C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 17:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8686E30608BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 16:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5274DA549;
	Tue,  3 Mar 2026 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1gDciMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32A3BFE37;
	Tue,  3 Mar 2026 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555113; cv=none; b=qPEcdnLtjd0oZ/+pkufzfXLby36isxxQlY2l8CFEqmODJGd6omXrSDZmL+QqdYuaHDJQFJlNEVMgi6o18Zy/gptPdfRClFgOzK8eLGgknUYy9RD+KQyvFLl4hpTH/Qd7MZLridjb096/QJFM9PW7oHoSsTfX5rmceHv8jAoFgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555113; c=relaxed/simple;
	bh=Lzei46mZsFfkX8o4DbwriZnJFbQPag4hXLTsoTS7WBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ufewpV3NyqF995Onq03JwLll3VEOZFhcgY7ALLG0S816+1Gcb0IIN45pH73tpjLNjB7usAjuK/2F+txe7JPZck5r9R5TWizXTtG68KoTSQVhUTwLqeN8DMKABc7qn/UvbwZsiLWBjZIFhB6aJDqWSBfgKwKrHltHRhrEmqcynJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1gDciMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D8FC116C6;
	Tue,  3 Mar 2026 16:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555112;
	bh=Lzei46mZsFfkX8o4DbwriZnJFbQPag4hXLTsoTS7WBM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=b1gDciMKmxqJFhLhN4FetRczLqf+CttHovYs2ls9wewYfiUZA2KA+DpSzV/pA6tfO
	 LvyRXRWxbMDL2lShxxrawxA3nBnbO+6eU1/9cZ8aPq0SaUEcnA+xMwRnz1mRl2n9aa
	 IxrtMYO6W3tFizgT4R6uzfnfWCUHnQmIpUt4uPoEhbVgi3SXIgMAmQarA2Psq+QIkD
	 7CRMsin1l+1ITxQeb50Q2mjNjDHF7lByhF8gMaxYucxv4AidELFS01HWE3PzOqIW3D
	 gnR+QTlNwIaS0A053PS4zkXfM2G9e2EVDoG0bGxmvmgh6Xd4dNP0qJpRYeDbQjFeC+
	 39Qy5OO1udjBg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:25:07 +0100
Message-Id: <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>, "Guenter Roeck" <groeck7@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
 <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
In-Reply-To: <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
X-Rspamd-Queue-Id: 9D6DA1F3C80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com,lists.linux.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95175-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,analog.com:email]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 5:23 PM CET, Guenter Roeck wrote:
> On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
>> Do not use driver_override as IRQ name, as it is not guaranteed to point
>> to a valid string; use NULL instead (which makes the devm IRQ helpers
>> use dev_name()).
>>=20
>> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> Applied.

I need this patch in the driver-core tree, otherwise I can't land patch 4 o=
f
this series [1]. :(

Any chance you can drop it from your tree?

[1] https://lore.kernel.org/driver-core/20260303115720.48783-5-dakr@kernel.=
org/

