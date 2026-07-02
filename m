Return-Path: <linux-arm-msm+bounces-116132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N+zPFeT3RmowgAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:44:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D16FD75C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 01:44:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ahWPlJ9y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116132-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116132-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A470301F395
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 23:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A993F4122;
	Thu,  2 Jul 2026 23:41:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B609D3EFD2D;
	Thu,  2 Jul 2026 23:41:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783035663; cv=none; b=nhv+Q5W/bVOJhLoMh445fSu3HOfrEzXJcWD8+Ff5nI+uDEGIF8i3FokckWEs91Okk+GN+nHvbYNGUKiRXtv9VsXNxuJF5ykzLKu3Gq2VrLnZZE6ntXCGxpxaYs5bBMBCNrtvpqzIOZXUk63Ec8QtCFaCNC107NpWpW6ustwYsD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783035663; c=relaxed/simple;
	bh=CJ22JWpXzrnn/jt8v5XewkFKIIino1cJdy6fqL2fSYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbP3BmFVIr36XyWFb5zooVp5Eh0FWukxt74gy3y7DUAEa+WTXDNie6IBvg67oWBMmvIb4V2w1mJf2DSVWJmQtzbvfgdm/NLLrxVDxlOIokswu30vC3ZyANJBHZFYMSaDS0nnXmTcNrcb4rgTu2S95jYrNPsllDjfzLNlUWReSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahWPlJ9y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141E61F00A3A;
	Thu,  2 Jul 2026 23:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783035662;
	bh=+rioZyXypPRhsjzjkj/EIaBF4k5g9VPrEbSUwwp1rug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ahWPlJ9ynLM6ErXjkF0xzbArCZn/amXEJNsowdKcyrarhpv/NmXi+l1hshP4X5C/8
	 EGCJikIzVy8azCmZQiUeS782PJ54BHEYvO8csd3GQDuTBZkM3E1h9BGKhEUxMUfYp+
	 DJV36FwOfDinob2PNtmiSFNC1wgquKFLjV+6dz18k5MXzBnSHoiE2P4/C8XbC6lAeI
	 xA9fQDVT3vOn0PpzKo+yo5NIAw95HIEd5IySZSinzy2sbvDDlJd4fICHOK+C0FRR9R
	 e/FshnnBiBAU/Qzd7mcdeTU1PBkbZrM6Rx0F2CtmRNxEH3gp5Na2lsXifTdlWc/s6E
	 tCs+nufiy0eDw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and connector
Date: Thu,  2 Jul 2026 18:40:37 -0500
Message-ID: <178303563657.359079.17966224270161164488.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
References: <20260421101606.411335-1-loic.poulain@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-116132-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 492D16FD75C


On Tue, 21 Apr 2026 12:16:06 +0200, Loic Poulain wrote:
> Add the Cypress USB Type-C controller and associated connector.
> The controller is connected over I2C12 and wired to the USB1 DWC3.
> The USB-C connector routes both high-speed and super-speed signals.
> 
> Enable dual-role data and power over the USB-C connector.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-arduino-monza: add USB-C controller and connector
      commit: f470169a802ede2f3b17a7ede77974c6fe2f5668

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

