Return-Path: <linux-arm-msm+bounces-97283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE+ZNvEes2l/SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 21:15:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189C278AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 21:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C38B3302AF02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 20:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CE226F288;
	Thu, 12 Mar 2026 20:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkjDkjoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF0145FE0;
	Thu, 12 Mar 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773346539; cv=none; b=YL/l7/SpRgSv4y7R7hQYf+TKR5RYiGjNXDRbByPTMoBSzobNgCwHZaM+Ksel0lvSi3Xdx0qU3VrXHe/4EdZWdx87heDq9QaCaC2DdnY2ijsCkhrhdVm9Ek2QJSLjfk+mKFVXHhfZHeScQkEy8HxA77iUlsOEQ3X6HG2ObeLhDEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773346539; c=relaxed/simple;
	bh=HrOFyT1mkelJqN8jGvgQvPsCgvOzSZJphOurWCaFA2o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=vEVei2s0Id46mpEhYuoS4gIyF+m/VWu07Oj24r1+miVuLRjj7lD1rc6qN7TmSphx66d0ay4SSuA+/m944eU7oEJHIhRuP5b1JnjLerKGVWFWclON3RQpwwCaSUe3y953rkLH6ksTFw+ghCi3eGyBT323tbVlUuIopveFBf4vq5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkjDkjoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AAAC19425;
	Thu, 12 Mar 2026 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773346538;
	bh=HrOFyT1mkelJqN8jGvgQvPsCgvOzSZJphOurWCaFA2o=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=IkjDkjooZTZgrCrA+Rda8txmysbqsyTTsb22w0OBa6A4vLjJGA1eGLV+5TuznbMzl
	 gv9LET4Xnz71scBmubiUF/NtK68fae706v+4vHRWHTnMHqhu6va/0PyrfakKphirB1
	 dgvf/ZN+9t+D7/mTRUgJVlxTAcMB2B/tzoa0Y1+IdmId2ylYs2p1/TGwA8XZ+msYMs
	 lpp06P/OEbe8n/Kr1KiMFxG3/Eu7cLlIIL+GoM8u2A15PXJsCJRdDD6uurY2RUWAqy
	 OoLRdJPZC+o7846fqXlmR0LxAr0/GV5xditIuaAWYwkRakrk+mnL0+xzCCbbDiIhXr
	 7vZYz66R8vozQ==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 21:15:33 +0100
Message-Id: <DH12VR46PG5L.HJHWKJL8TXBO@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic
 driver_override infrastructure
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-5-dakr@kernel.org>
 <DGUUVEFWIFCF.RX8CSJ96ZHMC@kernel.org>
In-Reply-To: <DGUUVEFWIFCF.RX8CSJ96ZHMC@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97283-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9189C278AA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 5, 2026 at 1:42 PM CET, Danilo Krummrich wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
>>  arch/sh/drivers/platform_early.c |  6 ++++--
>>  drivers/clk/imx/clk-scu.c        |  3 +--
>>  drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
>>  sound/soc/samsung/i2s.c          |  6 +++---
>
> Some ACKs would be appreciated. :)

Looking forward to pick this up soon, please let me know if there are any
concerns.

Thanks,
Danilo

