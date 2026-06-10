Return-Path: <linux-arm-msm+bounces-112425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 24zKKEFPKWp/UgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:49:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F2668F46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CNG21yOM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112425-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112425-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 737203048AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A508F401A3E;
	Wed, 10 Jun 2026 11:43:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB113E7151;
	Wed, 10 Jun 2026 11:43:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091836; cv=none; b=MXRen1ZoU2ILEcvp4hT1h8CqY+nZX1y1VtkOIody95LamDi2wq8hpTpNQMT8OuguPFJKWh4pCxj8matxNhvsk8/U/v45m6m77Gy20ZJVVVYPcB4Qq6bue+Rghu2JIlIq1mC9wxa8zdpbLtV1FpRZdUZnQnwZQSVXljNvbbVqvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091836; c=relaxed/simple;
	bh=SJciNBh7LnFlvh3fdRZnp/K6ls8TzZ8lRCkYY8f9feg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5ohod5HJ6aArxhv4zeOAfWMnnqBIQ2uKqpYUgax3qGqMrfLzgBq4XN1d7N3E8JY6bosjAWGMJMSIKZocdUwyoVI/a/vDCbxKdaz3IASpFKPsSpgnFsBGUKx+E4bSrwZArX8gg5AOYfyG5Gb8hCa7USVycqRM/rZMg5ZRFBoRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNG21yOM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ABF1F00893;
	Wed, 10 Jun 2026 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091834;
	bh=yBbFOYe/R4NV6/nWE1BHBKyuDpmXSjFDOiX1hGkPbq0=;
	h=From:Subject:Date:To:Cc;
	b=CNG21yOM+JEmSryCkQh9vYiysMkTy8ImDyeA8+GtxCGqWuO7OofkIbK3AQX/FqnrL
	 M0suFz2lpP+fcuXsu829cgssO7GXwLNZxrC5LJh32x+iok8rj1neMCnJz0M/yW18Ri
	 /+y5PSJm0RQldOQ4DULNXA2iM3/I5hUIc/q7EvHBPVewHIQ1oggLsv1Lgdbp0A1YhA
	 EUOe7w/JAf0Y+bUwX6TwfbCnnum/dJj5rV8+EgYHeT/dvWfwvGgrAIYt/al1KOnWbZ
	 HpVSpA//NZTejvvOUFWQvxm+83lIsznYUA+H0RtxOAPIwGwVWmIsL0WumcbXZK6Rvm
	 Kv3t6FNP4kkHg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/5] Minor dt warnings fixes
Date: Wed, 10 Jun 2026 13:43:45 +0200
Message-Id: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPjcQIw3Fq0iRdjNp14co2VgK4
 t2N7ePH8M9GiixQ6puNMj6iMqeK9tIQvx/pBSOhmpx13vrWmjIvwmZaE5wfQ9ExyhdquHPoON6
 uMUSq8ZLxG2o73P/W9TmBy/lG+34A0x4UhnoAAAA=
X-Change-ID: 20260610-topic-june26_dts_fixes-c32e3cf85fdf
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=1074;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=SJciNBh7LnFlvh3fdRZnp/K6ls8TzZ8lRCkYY8f9feg=;
 b=mGI2AQh9KpM3CVJYXG/IKqekqn+53xiVM4sxuAw699+GmYnELE9OoQA8Gd9UPddWK/fz7vDvY
 wdKoC5U6+0hDMp6r8lnrZZzj8MjuJ8Z1ikBaLK9nrzZgbn+hc0vJEth
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:luca@lucaweiss.eu,m:ultracoolguy@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112425-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E7F2668F46

Nothing particularly of note, mechanical fixes

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (5):
      arm64: dts: qcom: msm8998-sony-yoshino: Drop extra bias-disable
      arm64: dts: qcom: msm8976-longcheer-l9360: Fix accidental node override
      arm64: dts: qcom: sdm632-motorola-ocean: Fix LED default trigger property
      arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply name
      arm64: dts: qcom: talos-evk-som: Fix BT RFA supply name

 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts      | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 4 ----
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts                 | 2 +-
 arch/arm64/boot/dts/qcom/sdm632-motorola-ocean.dts        | 2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi               | 2 +-
 5 files changed, 5 insertions(+), 9 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-topic-june26_dts_fixes-c32e3cf85fdf

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


