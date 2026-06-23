Return-Path: <linux-arm-msm+bounces-114070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /iYtGdDkOWoCywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:43:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A740D6B3515
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:43:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aYXvoyYE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114070-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114070-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC697304D25F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34449375F83;
	Tue, 23 Jun 2026 01:31:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED30364059;
	Tue, 23 Jun 2026 01:31:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178314; cv=none; b=PLiUZ99rcJgIu5skMCJBXTLQvhPzvSxgslZGdLDjysayKcdgfme2XBzk0r3G2dMQXKquIgF3VT1jvrhCNO03U5JAkxEMe8qXSwnhC8e80hR0n8txeT6ckZ3mh+oPP37tTQRkxH9q/zjPrCH4l1t1vVCDu+wB1AiJGEQX8+nSSs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178314; c=relaxed/simple;
	bh=zq7JsRKoRzzZjm4p8+rNUNQqoMzO8lezbdVCX2l2LI8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HnvAI0uUBU9SFjnLP3ILrm2NqTke3rKpLqmeygBT5vzRPn1JDCvDZHln49z6pujhmig7hz5wm9+LC+DFYQpjkGtHkP7mm9Xy/B12cP7B0hC6ZzUbops/DbQHArmgOKIxE6hIgBzxUh7yTtDyuJlAsgHYe7B050mNuygVD5swe4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYXvoyYE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4647D1F000E9;
	Tue, 23 Jun 2026 01:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178312;
	bh=h6yFckcJyLsAb4MziT9rjVKzTEs01eLC6uTCYrCbNYg=;
	h=From:Subject:Date:To:Cc;
	b=aYXvoyYEOSHZDfJoYmdIY0yHBCwJDbq/UWHM59+CiJXV+k4CvA7BgXPZqy/d2/5iO
	 wMOw/9M1aTln+bRGN+wXoiXwGV04+mqApQGAJYdlqrGWjkqM2bQ47V8PDgI7eZtrNR
	 SH2qCDKrcNcVUfqPSikg4KCVjf0voHsLkBnoqH8SgmMjsI8pOe7VNXkpeOwiL43pRm
	 5673Mq8cbxOimmtODjiU6OomcLokJNOhimXSzSsPh6ZxIDZay95CgRhvJOSi7f7Woa
	 TWCEiqHIvKZg2/UPdJ26wvjolKOh8jNc0G44M/R6FKi9eiWj11F/jxUSl7XjynQzdW
	 F41Ug1y2fVeLA==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 0/3] arm64: dts: qcom: Introduce Asus Zenbook A14
 (UX3407NA)
Date: Tue, 23 Jun 2026 01:31:48 +0000
Message-Id: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAATiOWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3arUvKT8/GzdlJJi3SQzSwNDSzNzQyMzMyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgA9jpBNbwAAAA==
X-Change-ID: 20260623-zenbook-dts-b69019671266
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782178312; l=1147;
 i=bjorn.andersson@oss.qualcomm.com; s=20260623; h=from:subject:message-id;
 bh=zq7JsRKoRzzZjm4p8+rNUNQqoMzO8lezbdVCX2l2LI8=;
 b=YgkKh1HsVxMMPhCUB9LXOIuMTtXp1FOcsMkG/+xs9VXWSPC1gV5Wz07BXN63I1wx31HUK/3RI
 ox2fyr37g+8BHmOCBcLE6rvSdNUPF7KiSrLPPTReFgRieIms6pz0HNv
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=NcABXERZwQW1ZuuTca83ns67voH6xv+CB55m7ZJPaRE=
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
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114070-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A740D6B3515

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform.

In addition to the same dependencies that other Glymur patches on the
list carries (audio, gpu, remoteproc, etc), this also depends on the eDP
PHY patches available here:
https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 1099 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1102 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260623-zenbook-dts-b69019671266

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


