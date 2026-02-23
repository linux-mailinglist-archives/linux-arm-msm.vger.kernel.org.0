Return-Path: <linux-arm-msm+bounces-93825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEVNLtzQnGllKQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:12:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990217E10D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEED3270837
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B805B37AA99;
	Mon, 23 Feb 2026 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pIiZ8b+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279237A48B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884331; cv=none; b=OhahmW8mOWPd+boWQfeeSH0O3CyaDnn2exKTId16p4X3Q6iNGdAmL7rn8uaWyw9augaWFoRwa0Z7eGhVjioSW725zwwbmWnI+kQWuhKqRSNyhVqYdcZm3Kf2b2kwgmqWIyZqv6v16jHVmV6vnLAh4HWS9gpXnPk0K/ncqhsv/oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884331; c=relaxed/simple;
	bh=Ed4Q4XrhNRzyT+p/QgOVPiCNTuXhxXiT3B34lnOeduk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5NyPL+8R4iQVeO4rkmzuSv/pLSFyyunJT2IYNLbCVnWU0FTolR/zLwm52kJ/9aWjNW7XFZ0Lu9tc3UKH7hPIWJPapChz34+Glw8Z9Fj4umKTKo7iNiXWFqw/nFPM7jRWpCc17lrK68Max4fyI71fx1kiaQL6BpslNGjY3GtJ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pIiZ8b+t; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xAPHXUixVxqgYuhALMwpHU6wem0WmvlLkj2qLrzlvao=;
	b=pIiZ8b+tCkN3qyPnBEwWxzUITuhM+z0rspXQIYavIGXNiNUtnhAeIU8lxNY4o1OQg2JCi4
	e4UGAgVnXQ2k+Hk6YoKEXUZvHnWIXzH5+9Nf4ZYoeg5v0esdGjrX953obLcrZsKQ4gvTCO
	aaUWkJ3KZDHehm5M4oN39j6asY/KHsXsvN93/xyqurCvxMereoohzHDq0C5N2Uewtj5n/H
	O38qzfMgu3Ifrw236Zy5CHYviMKCe5rdIODa3P4bn70ab1UlnzCBF5SN3xZQV9FdcsDj/A
	2Fp1G6HCojxXSuKcpzB99D4PfSCIfe7l44tw+6Sl+wvEDFTaqMw2KkNqbEK/XA==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
Subject: [PATCH 0/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
Date: Mon, 23 Feb 2026 22:05:11 +0000
Message-ID: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93825-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wonderfulshrinemaidenofparadise@postmarketos.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:mid,postmarketos.org:dkim]
X-Rspamd-Queue-Id: 1990217E10D
X-Rspamd-Action: no action

Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
They are similar to the other Samsung devices based on MSM8916 with only a
few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - QDSP6 audio
 - Speaker/earpiece/headphones/microphones via digital/analog codec in
   MSM8916/PM8916
 - WWAN Internet via BAM-DMUX
 - PMIC and charger
 - Touchscreen

There are different variants of Core Prime, with some differences in
NFC and MUIC.

The common parts are shared in
msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
to reduce duplication.

MUIC varies on fortuna/rossa devices, which could be either SM5502 or
SM5504. Move SM5504 from msm8916-samsung-rossa-common to
msm8916-samsung-fortuna-common and refactor MUIC.

Disable MUIC by default in msm8916-samsung-fortuna-common, and explicitly
specify them in each fortuna/rossa board.

