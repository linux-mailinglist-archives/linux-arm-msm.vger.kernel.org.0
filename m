Return-Path: <linux-arm-msm+bounces-117739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YeMNJr5tTmpAMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:33:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7A728148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FAHbXFz8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EA93328D1F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D424343ED;
	Wed,  8 Jul 2026 14:57:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2848B3F12C9;
	Wed,  8 Jul 2026 14:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522672; cv=none; b=Ht/cm4Q0jyyd++ueB2f+rmEU3pgsW91Nr/e9ao0VTe6ALsgM5gDQehgSAqD89yeGwPFm490ivQqZv4rNN0Fsudy+bfl6/ZkZmzcaIQFoeoRAhqT8ibF2uFbXyKlFhqGgQdJtzGQZhx/I8wSeYd27P/tFF8+SHwMiWTm4ThzLcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522672; c=relaxed/simple;
	bh=V6NYxCFk/w8mvFUCJ0M5gqskt8RQUrjJvYyBdtRidAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+jFo7q43tJK/T8XYEY/3kMdJP4Tw3Td5uS0hfouWyUxzFX5EKeepBHCV10I8mVA/vtmMBL8bZMOm5d0HkCqTHZBsWujualDcCYb9t4AjemhXSYs5eXonf62XQd8rPliKVTFs+zyHGtv529pa6repITZ3u3rvmQcuTVJKb0euHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAHbXFz8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3A11F000E9;
	Wed,  8 Jul 2026 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522671;
	bh=W3cRDk+ZMuk4JYYR3jANPcl/3eFYaTqn48evG2xzjss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FAHbXFz8o+IpaTPokxEfBIF7sMZEr+HHSfUQ7tGkx52nya4IyjXvbV3pJ3EVR0B/Y
	 sBlucxtrJZQ9rSjNSaFZf3tXx3fnvM2aTDLxrdw7JpJLDUtldZoDurgTseLMXW4UDO
	 OyO/+kjoeZk6uiuHOdDfdCyfryOgQb1FdpJdv2P+IHuICo6vQDouxbIqy5hgqwOIKa
	 fb/4mbRP/Cwk4o0vphV8F9SJXkd3CZktGvPAevQ1RwEtM2JSPV9sJlW45DBKL/jbqn
	 ZBd6fdhcZ4uW20X/Y+sjcKA7OzzptQKGLqudAWKsFmyc+kzrKSjWFmLemX1iWsQ6Wx
	 5TJ06f8x4OJNQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Remove gold/silver_cpu_sleep idle states for lemans and monaco
Date: Wed,  8 Jul 2026 09:56:51 -0500
Message-ID: <178352261580.2235436.15511501261812237159.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
References: <20260522-ml_cpuidle-v1-0-fd311cf33fb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117739-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:navya.malempati@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9D7A728148


On Fri, 22 May 2026 16:40:12 +0530, Navya Malempati wrote:
> Firmware supports both CPU power collapse and CPU PLL/rail power collapse
> idle states. However, CPU power collapse mode is often not utilized in
> favor of performance. Remove CPU power collapse modes for lemans and
> monaco as well aligning with SM8350/SM8450/SM8550/SM8650.
> 

Applied, thanks!

[1/2] arm64: dts: qcom: monaco: Remove the little/big_cpu_sleep_0 idle states
      commit: 00dd037fc31452962eba38cdb46feafb0b70d96e
[2/2] arm64: dts: qcom: lemans: Remove the gold_cpu_sleep idle state
      commit: f212c011af87e65c5147bfd61d786d681be91d40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

