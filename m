Return-Path: <linux-arm-msm+bounces-71249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC931B3BFFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 17:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA364160408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 15:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D682326D52;
	Fri, 29 Aug 2025 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nE9LQUOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41B322DB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482610; cv=none; b=iVHLXAdUMLYFnjb/6O0sEadIw4iD1dyNrzkcK0aPp3JViqNU3DjPdoE8DVRQuhjxV3+FIq6FAxUgvt90KDNdyYwzjsss9IdBdRU3/RI7+Co+SjCWWTqjxEM5ADQ6xb/h2R1w+SBN6Ykr9uon3VWQa5fGLpiKW8XrKvOQMzTFeCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482610; c=relaxed/simple;
	bh=C0VKzX8TauGXLJEgutJv3o0BbKRaaaYNVbxDXe9wEQ0=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=dYTsoIs73wA9OJGnmft+BbbHxGbmpPLetLdX+Mhv0huxzYcr7mJDoZu+iMxtnT5kO3TLTgkHrv/R0bkZmeAyGF28q49NjqYT3AzP/FplccLvuwD9QorAfMIdR688141WAOpwzXaCyytKgMmZI+YS1w0zyAQJK11t7rswEZi+a5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nE9LQUOq; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1756482591; x=1756741791;
	bh=C0VKzX8TauGXLJEgutJv3o0BbKRaaaYNVbxDXe9wEQ0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nE9LQUOq139ofAVfzF9WGBm9fE1/5AaDYb77YeqowwSYgN3RDnRS2benYs5Jwbi6h
	 TpnGJ1yLBS03bfkXrH7IleJZgTsuGi5f+BTseL1o4hZy7+VstFVscfjO0rSOINbHGe
	 +/Vh4GjM8q9HKKXK2Bz9yJXruem7WN9XbZ0LcW5IixAntgGuX+70/94SHqzEVpFFQ2
	 l4rcnsMawEX18h79VQgMyfzTCwKeWXv4EZGIZSV28Ve7qrnDVmy5NcnoAkBuzHn6ml
	 HYtPN2yFM8KoHDLmUu7Ifa18kmQs2rB0ZGuy2cUwBG24hCSBUZ/qw0IYpp5j7ogmPI
	 5EW/04lGYCPXA==
Date: Fri, 29 Aug 2025 15:49:44 +0000
To: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
From: janmpaszkowski <janmpaszkowski@pm.me>
Subject: Question about flashing and booting linux on sm8450 (Sony Xperia 1 IV) and sm8550 (Sony Xperia 1 V)
Message-ID: <kOi_rSTDanxCCggLN33ZK-aKnYnoqaRs7qhT9cua-W_JyA5Kbz6zDt9Vuk6peNBc2zA-zc5yZhdRxxjfXy9sxdrMlCzucokPZB00hqn042U=@pm.me>
Feedback-ID: 155747137:user:proton
X-Pm-Message-ID: 065bde849f489c0b2f6ece8dbf478127cdf9e106
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Good evening,
I'm not sure if it's a good mail for that, but I'm trying to flash linux on=
 Sony phones with SM8450 and SM8550 and can't seem to get through bootloade=
r. On your site for SM8550 (https://linaro.github.io/msm/soc/sm8550) it is =
shown that it is tested on Sony Xperia 1 V, so I thought I would try asking=
 for help.

If you have time I wanted to ask for some instructions on flashing the Sony=
 Xperia 1 V (and/or IV), because I can't get it done with the instructions =
from linux sony dts commits' descriptions. Maybe I need some specific andro=
id version, or I do not see something there or not there.

By the way thanks for the mainlining work!
Have a great day!
Jan Paszkowski

