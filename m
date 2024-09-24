Return-Path: <linux-arm-msm+bounces-32318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1129848E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 17:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0609B20D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E706F38384;
	Tue, 24 Sep 2024 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ASDmjxP6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC41B85D5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727193305; cv=none; b=IqY2F0W6YrzowUJ4RlWnOTL4eJUAsnzs8ys1N4ek4aF9Ryo35EUGzu129Gc00Gm1NQr0gTZP9mm9fj4ed1sbw28ewY/luNVvUUoTe7WlQ9fvE9oJTQ+0Aqk7/AFC8tWPZPDRsG0O2lCOsR6D1IST2eWoRTnvUqeUZH9HlL4O42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727193305; c=relaxed/simple;
	bh=8ZxHAzQfA3ENC7uniG0p4Xwulejb2GE7sjeJFD9Jues=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLOeyjygceGwYdIGTY7hT1QFvM2Urk+ger8qyA1ojSALbz1eGB+ikOA8ZM/Y/xm95joWdrZZq/cDAYjXXJezSwQTNWkfzvF/W45u7/88crspU7ME08+JzIlGKPx4CfWDb7egPg5R3sFEYOxLfmILM6yz5CEp410hIhOnkdB0IN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ASDmjxP6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1727193302; x=1727452502;
	bh=8ZxHAzQfA3ENC7uniG0p4Xwulejb2GE7sjeJFD9Jues=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ASDmjxP6kHEetC0j212HIujvsiDSKKNxQracLU0neD9t8RAe8/OX3i6Z1wj+arJe1
	 5ks+9Aut9fpTfjiGgO1UdfodCAnjMYj4RamleJqnywjp6bIoI+dSKpBh0kT4ZtUgBi
	 8OCes7C3n1LGrcWNnSgzI7twbLXAtEX33qoQFGQ4rrvrDG8BxMuKZUcvwck6YMpq6s
	 GCxcbBS5DD9oKhrOuzzvBkB0vZFSKwk3ghFS4LpVX3kYicQ8ZbQFsa9hGUr4mWFrnB
	 VOictVy2Xm43pmUxKCUud+WzubzZyw2GqezgaN6llXu2MgQGDpZbNSlszrdnnVCC8A
	 qAbGoVuKyJnxA==
Date: Tue, 24 Sep 2024 15:54:59 +0000
To: dmitry.baryshkov@linaro.org
From: John Schulz <john.schulz1@protonmail.com>
Cc: john.schulz1@protonmail.com, linux-arm-msm@vger.kernel.org
Subject: (No Subject)
Message-ID: <20240924155442.74210-1-john.schulz1@protonmail.com>
In-Reply-To: <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j>
References: <20240921204237.8006-1-john.schulz1@protonmail.com> <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j>
Feedback-ID: 15150580:user:proton
X-Pm-Message-ID: 2a0dec8a5dc51eaef15b942389f376879c5dceec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,=20

I do not have a way of testing this patch. I do see your point in that it m=
ay be redundant/unnecessary
since basic/generic drivers should at the very least output a shell interfa=
ce.=20

Upon doing more research, I came across the fact that some X1 GPUs have OEM=
 signing that prevent the=20
driver from working. I suspect that is what I am running into when I try te=
sting various distros. All
of them exhibit the same behavior of the display halting during the bootloa=
der handoff and the HDMI
port does not output anything. Even the Debian 12 image from Linaro exhibit=
s the same issue.=20

I find this a bit odd given that there is a dts entry for the Asus Vivobook=
 S 15 X1E varient. I=20
don't see any comments on whether the dts for that laptop was tested. The V=
ivobook I have is the
X1P varient which, to my knowledge, is identical to the X1E one but a diffe=
rent SoC.=20

Perhaps it would be of better use of my (and others) time figuring out if t=
he GPU drivers not
working is due to OEM locking and if so, trying to unlock it. What do y'all=
 think?=20

P.S. Apologies for the incorrect prefix, should have done more research ins=
tead of trying to=20
make an educated guess.=20

Thanks,
John



