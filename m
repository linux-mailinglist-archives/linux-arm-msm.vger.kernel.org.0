Return-Path: <linux-arm-msm+bounces-117715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DOmdKVlpTmq3MAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB584727D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:14:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DuhpYo20;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117715-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117715-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22E7B30814AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8EA4DA539;
	Wed,  8 Jul 2026 14:57:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB44D9908;
	Wed,  8 Jul 2026 14:57:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522648; cv=none; b=GI3Wp6I1IgfG9wBn5uEbSQln660wgtoxErB7q2BSF0lbM1Y0nAXQbEpyNKunNcZO4/zkkAOoUXx+iNs8syNXrhnQCDjZysZZChzrXCkMsEZtvsvk6qXFRjC7lCLV0lJpe//TxyPoQekvVyLXf6qctwQpgbh1tqH1TYHXyD65ypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522648; c=relaxed/simple;
	bh=PZs0JA1OWF/cEQRjM7XwnZ1UNwfMMVwf/HFRGRmH6iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=beQX2vt+5bOR/KoFuqcgnQyI5w+FSzAN/lEaxZRe0zehxuUetMNnojEUa9md1E4f9ckLbpXr32nVTuHfI3mOlTui3Q0kTiTRz8Sq+jmjyBxxUFQXxZWQwq5kprOGzIpjsVO9oKOfXJVwyV8OuzaWfQJnxkHGZn2dr/EM/IFzpVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuhpYo20; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A6A1F00A3D;
	Wed,  8 Jul 2026 14:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522647;
	bh=6Eeh5j6mdMZm1HjTlOxQmJiwO0eDP0DxkFscxaxJxEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DuhpYo203Y9wNjYQnqn1eon7XWCmMyJPnnmz4v5Xk4XuvEFrYeNbH/jz/7VwJ51ze
	 kCKQcAtThklaMqyT6zCxrOOQGsPumX6LfEcCU2+XyJ9QdFf1gWY2rskgLeuyfgREak
	 7nkCyhonkUguv9Dv2wiIFKNCN2u/irrGEkJ3t7Rwc5FGrbmZcyVYM1AgdJU5/7ZEz+
	 M5Akz+T4DKrU+BKUNBfJ6vRl4HiDZyN6cR/SvmPSvbB7sCJlIRrabHSI3sxQJzSOYh
	 U6gUptSJpU7XSFSd2vWLhmJaJdCLERHURjGPAQpnz9APz5CZAKAcCacQ7jHVoewGZ7
	 PzI04AqUPJhSA==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Jianping Li <jianping.li@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ekansh.gupta@oss.qualcomm.com,
	stable@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
Date: Wed,  8 Jul 2026 09:56:27 -0500
Message-ID: <178352261629.2235436.1605487378047729296.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
References: <20260429073443.2027-1-jianping.li@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117715-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jianping.li@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB584727D62


On Wed, 29 Apr 2026 15:34:43 +0800, Jianping Li wrote:
> On KODIAK platforms boot can fail when the DT "adsp-rpc-remote-heap"
> reserved-memory region overlaps with firmware allocations (UEFI/EFI
> runtime). The kernel then reports failure to reserve the region and
> subsequent EFI runtime activity may trigger aborts.
> 
> The remote heap node was described as a fixed "no-map" region, which
> turns it into a hard carveout. Replace it with a "shared-dma-pool"
> reserved memory region with reusable CMA-backed allocation, specifying
> alignment and size.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: avoid EFI overlap for ADSP remote heap
      commit: 9d7d847ff1c502802ac764120f9a1800b94ce497

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

