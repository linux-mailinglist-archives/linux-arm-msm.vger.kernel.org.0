Return-Path: <linux-arm-msm+bounces-95199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJlZLvIzp2k9fwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 20:18:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9041F5D7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 20:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08D19305E38A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 19:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ED839656D;
	Tue,  3 Mar 2026 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q6JqshVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D8396564;
	Tue,  3 Mar 2026 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565487; cv=none; b=LYsJHnTHx3FJHM5tZp1E0XjeXjHzhWdfkMVQMxUdUkLMUM0g/CD/Uzf/FXwlr83y9x7Qi0m08XmxiBC/6VNmgkic8oQVJPEL2ak2bfr0DWXT7sAg5gooYvDKSjFtYPKI88wST3MS2rFeqobS6Maqu9wwo/YhT27DN9owHqUm820=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565487; c=relaxed/simple;
	bh=BoXGBCau5r1s+WRSBZCVeE9Fm89KK3KvHWbTxi92Xto=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Yg8exQYjbfeDbtsempnSIJMcSt5Znmuop7TIycPkLeU8ZrYfrMGvf0RbXpiAvXIdHLHhgK48ejdR/w367ntbIUFKFGFUI9ij6/yQeiQt/8ziPNvq61pD6UCE0Qfo7/d4Kc1c34obfLLovZKuOHey9krz3JAvIGFARfS8sugOUPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q6JqshVM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BF0C116C6;
	Tue,  3 Mar 2026 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772565487;
	bh=BoXGBCau5r1s+WRSBZCVeE9Fm89KK3KvHWbTxi92Xto=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=q6JqshVMljVfv8Cd2y14LY/Fw+tfw4Z3Qg3z5MkVCBZhhe0ogNqXS6OLV/Ivla58I
	 CeTdH8njEHd6YOE1TyLfCCsn+lKGDuDzIFavZ7Cq5Yd8IM+2+5iw+fq6XjPxMflqVM
	 Le/bWg9TcGuCaLAg1eTtVEJYp+wKLTSiKdwWGlXggTlGwKIdlePgrw+UiEWb7+aBfV
	 6CndtHTuoBJwaPgwpiKAq9mMsB3z0w1CzgGQ5UvG3R9gAim36pjDmjYQwJsQevqfpc
	 h6p4mNHEcWhnJMLVZcmu3tL7Z3yAPQL3z9qrSnADIOgO0REq0Z+Y+WFSDp1QS5/b7r
	 ThUsp43QE4TSw==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 20:18:01 +0100
Message-Id: <DGTE0SSHFRC9.U45YIYN3PZ8I@kernel.org>
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
 <DGTACERFTTCV.29XON9ZLYAEQL@kernel.org>
 <4a7ac923-0f1a-431f-a029-8843a8eddca3@roeck-us.net>
In-Reply-To: <4a7ac923-0f1a-431f-a029-8843a8eddca3@roeck-us.net>
X-Rspamd-Queue-Id: 2D9041F5D7C
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
	TAGGED_FROM(0.00)[bounces-95199-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,roeck-us.net:email]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 5:57 PM CET, Guenter Roeck wrote:
> On 3/3/26 08:25, Danilo Krummrich wrote:
>> On Tue Mar 3, 2026 at 5:23 PM CET, Guenter Roeck wrote:
>>> On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
>>>> Do not use driver_override as IRQ name, as it is not guaranteed to poi=
nt
>>>> to a valid string; use NULL instead (which makes the devm IRQ helpers
>>>> use dev_name()).
>>>>
>>>> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
>>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>>> Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>>>
>>> Applied.
>>=20
>> I need this patch in the driver-core tree, otherwise I can't land patch =
4 of
>> this series [1]. :(
>>=20
>> Any chance you can drop it from your tree?
>>=20
>> [1] https://lore.kernel.org/driver-core/20260303115720.48783-5-dakr@kern=
el.org/
>>=20
>
> Sure, I'll drop it. Please add
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks!

