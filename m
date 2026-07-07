Return-Path: <linux-arm-msm+bounces-117067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8DZKzZWTGo7jQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282071693D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:28:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=o20qRvAl;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3CE30276A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F0830D3FA;
	Tue,  7 Jul 2026 01:27:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84330676A;
	Tue,  7 Jul 2026 01:27:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387658; cv=none; b=NqzB1Cb0kDEqHw6EC+La60eByJemMTH+YZ+mMgcd/rPE41CQ2FuqnTX/uqUazs+ZtBW+mT+UGnkgKnjasFNx9IctGAupk5ZAwS8I/E/S7VF9C9fk3XEjY566N7bfDxNdwkC9m/Kk3wa+7+YJr+LcRBdIRl7rRQU0tFy0gXzXff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387658; c=relaxed/simple;
	bh=AZU8AyjKOFAXO5WS8G6TsTXy2Y9o8Yudde47F/D7Qx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lI7qZxigMxtlK4FXFD1VFmS2eoyuy/MOxFiYYOm083/Eo3aiqMdbBFaMzO48nAq2zyM13l6Ow+UxgauKJ5Rk+1FqoazWjW2YqL2c/5WB62msz7XFyk3cDxq+6mwhE5O1whnpVphhTQhVEL6z7rlIoBSRVvuxW/WbJdgHXTFN4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o20qRvAl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3661F000E9;
	Tue,  7 Jul 2026 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387657;
	bh=W+xWS6WiyIkyY/OjOnic8qYp4azRnXcYPS8PH0auCro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o20qRvAlyJy/mgpUCrNqRqzKfRDyKfKfzo/GlmN4kKBowQ96t8duvAcZPFMa0eB6T
	 vecob9bG6k0PMFjOX7Z+BddmOK/TtKIjTuHZEXxRcW/q1fBzE11Pi7jiH8VLVO80nN
	 54ogRqZEYFND9glrTqYfV5sa1lJ7bELQWzgt9I9PsukKH9fyKvxocTsfjq/444L0Kd
	 XPp21OkOpLfQ5eovjLriHq9awmOEJnZnd+h64sCwgutYu8oG/zIIYo30ZSVfSaPX4N
	 xcf1RBE1JBixIbZcn//DKBDLw0j/0jn9P0XT93C02diMSktKXSLNmKK3iLcyH874ji
	 P1uqXH5EYIyXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle
Date: Mon,  6 Jul 2026 20:27:19 -0500
Message-ID: <178338764562.1558388.13019265138555746096.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
References: <20260429-c630-fix-idle-v2-1-ac867dad6f21@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-117067-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abelvesa@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 4282071693D


On Wed, 29 Apr 2026 01:27:12 +0300, Dmitry Baryshkov wrote:
> With the default PSCI suspend value for cluster idle state Lenovo Yoga
> C630 isn't stable enough. For example it might reset if display device
> isn't probed early enough. Drop the bit 0x4000 from the PSCI suspend
> value to make C630 work in stable way. The bit was found by
> expertimenting with the cluster idle PSCI value. Most likely it results
> in the less deep sleep and more energy beign spent in the suspend state,
> but it's better than the non-stable system behaviour.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle
      commit: 07db10de262f4150e24fd631a7a6c428f7bf80c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

