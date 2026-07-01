Return-Path: <linux-arm-msm+bounces-115737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hfFFFp42RWrl8goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:47:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E55746EF5DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:47:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="hLEEx/JK";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E33A30160C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6AD48094D;
	Wed,  1 Jul 2026 15:43:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D42DC32E;
	Wed,  1 Jul 2026 15:43:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920603; cv=none; b=tFx0fcEwZm2S/Hr9HVLbfeAeFBUav0FjIISYhpqu5ksb9O7UkHvP4EyWBHs+OMOvthqDfknrSe2x+Skl/scNxmY+RBVhF/++6yU7tl2vgsKjNqavO4mCHGGJ2EHlFokTa/pL7pVPck1kK9R9f5Arb4gwv4jBK+FU9xcow1mC4qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920603; c=relaxed/simple;
	bh=QAe1nra/iAbWdmHLyfAFM6ctgEvJ1BWxlBQgA91idIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RTOPcUf0P06eA/SnKEyb8Kxvda7I3i5t6nbq5Hj2+Ma5Q6SdoB4Zwc8fd5gAaPCEyOgXSsqH/l4lHTshuAGIcqx/jbBETibiHBHIAbrW40KOd1pQzIpLVsMj6c2bfgG2X4zn4o98K03LYf/dznOuxxk7yPO06l+XtX4rCuJQeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLEEx/JK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20DA1F000E9;
	Wed,  1 Jul 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920601;
	bh=d1dWIHp3Pv/qgM+eHZRHh17BMOlcnx9RcIKDV9KOUsM=;
	h=From:Subject:Date:To:Cc;
	b=hLEEx/JKsClkYiQkO/4UlLXOG9Z4BJvLWcmzE4p+pWD9zThGUD/EoRlPSIn+GN8Mt
	 FUK7QyLlI0TkeoUlWwD+Ov5F7xxq9DBQf7kgNZYom6tV3wVHUhsVBjKS3XUokCI648
	 7RgQbv9dc33PIYQ2O5IxsLtk6Xt+6PS4fBdxvGAQEEe0IDvWFEWectErtEEnImjLUb
	 LZY1GCHK/byTUXyUJwfcD2Cx8UegV4C6KdglplS9zzbu+V6z1wKQIxFx7NEKXNawqh
	 De4UNX/D8Uk75SGbZABKkKfgCpYRC/VtXNSguvVCwN5l+E4asqtyOuDjSJs4LfV0E4
	 HJo+ClhmpIjag==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] SC8280XP CRD touch-ups
Date: Wed, 01 Jul 2026 17:43:14 +0200
Message-Id: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2MwdjYq0iROk51XGjIaCmId
 zfW5cfj/TsoR2GFZ7ZD5K+oLHNCkWdA43se2EifDBZthQ8szLoEIeOtR4p9+5HfFtTUSL6zrnT
 oHaRriJyWf7Z53datm5jWqwXHcQLWeHQueAAAAA==
X-Change-ID: 20260701-topic-8280crd_fixups-90c8b2545085
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920599; l=652;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QAe1nra/iAbWdmHLyfAFM6ctgEvJ1BWxlBQgA91idIw=;
 b=Qxaq/GgyrueGdMkNYmTR6WLjJ0lWoP2xxylZEzRVRbsKMnfA8SGO9M9Zh7QqifVNtezY1s7u0
 Jffo+e/BS+BDHe+vO7z9o9uWa2DYbfD8Jn1LuFea67FbHn/G4T0+qru
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115737-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55746EF5DC

Add the missing orientation-gpio for Type-C orientation information and
fix the pin index for the MISC_3P3 regulator.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp-crd: Add pmic-glink orientation GPIOs
      arm64: dts: qcom: sc8280xp-crd: Fix the pin index for misc_3p3_reg_en

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-topic-8280crd_fixups-90c8b2545085

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


