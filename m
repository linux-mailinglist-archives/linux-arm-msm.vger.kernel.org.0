Return-Path: <linux-arm-msm+bounces-117065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TXTFJwtWTGokjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:27:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4848716901
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Nd+wdKUb;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117065-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117065-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 751A630262E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8642FF641;
	Tue,  7 Jul 2026 01:27:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DFB42088E;
	Tue,  7 Jul 2026 01:27:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387656; cv=none; b=tfSXeaJ/IbbNic5wRRXRhIsTwHudOxSzuUgcTxc/VZqt4rPJJNUIRhleKsJwrnFENTASaZ1PdFBydeq5+af7tPnwu7JiXZHIxAcZFWNF0b5dmtyrHnirXCvoe+qQSUwiiLxTJ5AWhF3EyPuCrA8kA93xg8xT5YcM/o1TVLs+lf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387656; c=relaxed/simple;
	bh=BbByUAkvOgBu9HCKjDXiCtz6ddEhgb/dBKNCEGxLT/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojHBZsT28EzNdDfV+XkW7jbaglS1c62Ex0niumkp/rUfSKhKxzbleNTyDxBpZHt5UYVE8k+THcTJJMHTEeMmFuVZGbVb7Bqu5mqqyzaXvwoo0AuEtnplQ7qVi+6CZbXsr6Nn3VrLZfVqjon7gSPmU8tQLo++zM29FRlsmY2wrqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd+wdKUb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2071F000E9;
	Tue,  7 Jul 2026 01:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387655;
	bh=qrbkX+9fvGFaLJTswN/I4VkgkW7XZkbl1Qznf9Y2JYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nd+wdKUbAdvVUElbXw0FTEDbiLRbuIfXNwnRMhwsQDAGqdMzlG4X+fQI82kUI+0PG
	 8++DIAE9jfMGhVjCjpG+ZYK7Xc9FTVfNwdNEDNeksfpbK9rnO4CKBYGBKfhpPXMPLg
	 H39mYSteYhg9kdkyy1ZUoSuNdn6wAyxaIbXh2KXWuFI0rXqG+o9FPZhSydjFSzhl9X
	 GEPGm1gWTLSS5T/KnLJnm7E3eB/hQMvfryfjVpJFofJCMNoHza3BqB0LL4I7VatNkE
	 nV54wV3GNq4wpk7/s5jws7biDk6RxmCQzCU3Oprm4/x0BAVYvSEMVsk7t065/Zu0WR
	 0SOqsPU8lEVSg==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/6] Enable new features for flipkart-rimob
Date: Mon,  6 Jul 2026 20:27:17 -0500
Message-ID: <178338764566.1558388.6463068099121810198.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:cristian_ci@protonmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117065-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4848716901


On Tue, 31 Mar 2026 11:47:08 +0200, Cristian Cozzolino wrote:
> This series enables a set of miscellaneous features for Billion Capture+
> (a handset using the MSM8953 SoC released in 2017):
> - Panel and GPU
> - Touchscreen
> - WiFi + Bluetooth
> - Hall sensor
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable display and GPU
      commit: a8c0bd4233a9612f200a27f535b66e71eec289a6
[4/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable WiFi/Bluetooth
      commit: 15c3536da9227b5850b566f48b2135a7ecc8faf2
[5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable touchscreen
      commit: 74a12ff179901fcec9217ead7d2be368ddff0dd1
[6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable Hall sensor
      commit: 349ba5a82f0c9f4cfd817dd961e57a545977a66d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

