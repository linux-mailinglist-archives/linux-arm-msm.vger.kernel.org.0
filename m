Return-Path: <linux-arm-msm+bounces-117709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tJbLjFsTmqyMQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45073727FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:26:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NU05BPPn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117709-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117709-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0CFF30D3E4E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3114D2EE6;
	Wed,  8 Jul 2026 14:57:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F074CA291;
	Wed,  8 Jul 2026 14:57:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522641; cv=none; b=N4SQxZhsww6AMhlHxBKmN3rsf3msgOrKkoeCVNPb9lg1t+fy1Sb1n308TVhMbbI+r/icrh3IZQ2AxnIpYZBwjHRch1C75/tghMgNWJif2hHijN7sTyu/XJL3HB9dp3Jfy4dlEJxqjo6y7b8nwhg/z2YSxi962HMmB/fLX+mFM+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522641; c=relaxed/simple;
	bh=P2nGxlVvqV1tglEbpW59lb/xoLB1QAtVhmAi5sjDiDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVUjl4gUXtDZONK3RfDIJrjvQNvsHQMOgJw7uUyajfg8IJ3TZD8sqQ8lAISynWuX3/n3TU8xopDNjsXzptmby+pooKoq9jVCXKJOevy7HJADOLag6WtrtVP+g4eunjMw+Rf6ciYp7jQoXN9tHG6kGtVO/lSsC4ym9xlAiYstqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NU05BPPn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8161F00A3F;
	Wed,  8 Jul 2026 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522640;
	bh=Bvew9G7cKihyryOFA80qinIJ0DplQA0KK/Qa91/2otw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NU05BPPn1kbvMQea8rs7zX//GTDSqjisYDXKaVKSmlnmJz8TkUbu7erUccWAp416d
	 nI2gRG9xOPjBKq5UJfbl5BiFaaQR368TBvrZRw/HNdHn2LOwnuX+AXVtLNB/MZFXfu
	 K/R/osV4nHmZgQzE6pbJVCb9Lzwmbafv/RpbOdQK3voVpxNjnDATe2anksWIcGRWVy
	 6wouYaMztR0xXprjuI8wlmKACL9rKm2TJEOn2jHPzmrZpKWmU/ZKGz5Wcvfg96P+nt
	 TuwysXGKF5OwwUfYgWm+Wpw7Ju/RLTAdsRIz+VuxsyNpREt/OCmzSodrWCz9Rgo0wI
	 sjm4SuSomV+bw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haritha S K <haritha.k@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manaf.pallikunhi@oss.qualcomm.com,
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for gpu-thermal zone
Date: Wed,  8 Jul 2026 09:56:21 -0500
Message-ID: <178352261634.2235436.2722725215570101866.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
References: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117709-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:haritha.k@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45073727FD0


On Tue, 05 May 2026 16:56:17 +0530, Haritha S K wrote:
> Introduce a passive polling delay to ensure more than one
> "passive" thermal point is considered when throttling the GPU
> thermal zone.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Add passive polling-delay for gpu-thermal zone
      commit: 765234f19964cc2ba704b76d117491ca5c7e0899

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

