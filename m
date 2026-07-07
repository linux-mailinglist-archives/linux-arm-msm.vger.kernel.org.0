Return-Path: <linux-arm-msm+bounces-117075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rWuBKhNXTGqJjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:32:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15F7169BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="iEFo1fO/";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2324309B041
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846BF2FDC5E;
	Tue,  7 Jul 2026 01:27:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247C31E831;
	Tue,  7 Jul 2026 01:27:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387670; cv=none; b=guSxmwFPJQbJr0BGyU+ULiBcC3lEjFy3G31ZBWdOIKrDGnSebjwgmoZbiCw8ZQmHAwkdiA/v5dMIAUa3r1oFd2A16nI15rJB/duqI0Dc8FLxo27ldgtM9L+DmQX81VVCRhfJ7SCnnXmOz57a2CwtQfK+axdVZ27h/wcFUmiIYms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387670; c=relaxed/simple;
	bh=5pU5qFjMepEA2Jm19LNyJWgbMxKaXZw9VcAXeHhxYY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mR7DKK1zSeIuMN7MplCSZGGViHnfc5sXRoSqkPqUFtYG+FKO/hPP1DhFSWY8t8MluRGMdIcHsITU0BOjxuX5/i5n7WFW3KKuYyVIcl+OSFXb8pLv/Q1x5X85aZ52CMOBTyNKI1qgUyXDVUgBAn/kyvgcGZk05GZAg4oUL2HNVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEFo1fO/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCE21F000E9;
	Tue,  7 Jul 2026 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387667;
	bh=OubBmHIi0CHq11LoWGMzTweRcz8thVUNssBUJ9xIasw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iEFo1fO/OBjprzgXFzjUCRqSdPFzCRWDGWtjD9JRdcK56BIauhsm04SrnGdFHYFcZ
	 cAT/89q0hV7OC3j5Wp4/h0ngSnzVjPVAVWF+MPCXCfFznz1lnWasE/sTBbm+KGPmCn
	 FdCrTCbpkRAdVIfZQJTYGXJFMUohwgR5TLs6Z+h6KlU0S7wa22P5XdewMKKjDN/i3n
	 8UcCnkS03cRRFyTUw+6/KGvNhifql8MjgtMEjx4liVvTwQ1DMLIueVShD760GCr/gR
	 p8r3yH+utyLT30UwqRJ2HIeD9dF/jsNfPZTfwnqodWiuTnZXaaE5eqwS/U9Gn67S3q
	 1yQvIMulYVcsg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Xin Liu <xin.liu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add EL2 overlay for talos-evk
Date: Mon,  6 Jul 2026 20:27:29 -0500
Message-ID: <178338764550.1558388.10771938313444742430.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427082325.1895450-1-xin.liu@oss.qualcomm.com>
References: <20260427082325.1895450-1-xin.liu@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117075-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:xin.liu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC15F7169BD


On Mon, 27 Apr 2026 01:23:25 -0700, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the talos-evk
> in the Qualcomm DTS Makefile.
> 
> The new talos-evk-el2.dtb is generated by combining the base
> talos-evk.dtb with the talos-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Add EL2 overlay for talos-evk
      commit: 93d60582eb52e50ea11f95397a2b3633b12efa66

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

