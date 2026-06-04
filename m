Return-Path: <linux-arm-msm+bounces-111233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uA8dN5qnIWrFKgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:28:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7684C641D50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:28:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=cvnezpWe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111233-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111233-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C652730B7948
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06823478859;
	Thu,  4 Jun 2026 16:18:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B68384CDF;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589929; cv=none; b=PR/qgUWKprSaprglBpwMdjOy0jusJ5iJWJY74XfPX6mGwH/1oeVGeQoZnJkPynECjyvqod+kq/ZQQxQPa3t2iwDOKG0mtTAG8HnqGBXqKomzGrLPQAr6JrT7cKfSo13NF+3lP2sUBuAZoMxU2y7je15X2OLuwG4pOQAi/xqcYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589929; c=relaxed/simple;
	bh=T4nJoQO4Nbx+z1N5a23+hAb3mAzxvY5ogs8ErwNHR2g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BJ0vgRbc+sTLnwnjDNWVmQqJQEQsaGSqj/hHpPBQCsG716Rm7DdbB0rzWuJ4SfTAMkv4+iikFY0GpDXdzY9beTP+UWl2GFnRCf9eupKGCaRH4S7WW7JOkJ3qMbQrLz6JaqqRj1GVkBLGZjbdq0Nm1wn7RI3+O0EuluFjlVcGMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvnezpWe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A061C2BCB8;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780589929;
	bh=T4nJoQO4Nbx+z1N5a23+hAb3mAzxvY5ogs8ErwNHR2g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cvnezpWes+kTfFFCae+qFLBdfRqW8UtIXzSigtwHIL0VhBKsdhfc256cvANFHOAsO
	 7g7G27U1SWqMVQXhD4+nws0SFj6E3l1HV4+tXjTfquTzEEbCAJEfknN3fVAj4048IN
	 N9oc2Fq7VzbwWuqrOZYnnzh+mSPEXEm/lSXdWHhWFtcqo+gJuGY9/BJEePxV2+9k13
	 CT+5Jhh722IBKlHhZ321zYnQIIITRMjIGYQO88PQVGE0Xk9cbZuVKxvT3DhBJRTlDc
	 eSkvfllKV0FrA1StwubEniWDY/gGjlokBl1cHoyTpftAX7a9yG7CQ1h9FsWHky7voc
	 A/z4c8jgttEmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEB4CD6E75;
	Thu,  4 Jun 2026 16:18:49 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Subject: [PATCH v3 00/10] Microsoft Surface Pro 9 5G update
Date: Thu, 04 Jun 2026 18:18:36 +0200
Message-Id: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF2lIWoC/4WNyw6CMBQFf8V07SXlSi248j+Miz6hiVDSYoMh/
 LuFFRvjcpJzZhYSTXAmkttpIcEkF50fMlzOJ6I6MbQGnM5MkOKVMqQQ38EKZSCODbAWrA8wmHk
 CXjdcSUlthYrk9xiMdfNufjwzSxENyCAG1W2+xAu6zToXJx8+ez+V2/h/KpVAodGWIWMobc3vb
 S/cq1C+J1sq4dGDvz2YPVo3uuK8otyyo2dd1y/eJP5mHQEAAA==
X-Change-ID: 20260520-surface-sp9-5g-for-next-7897cbb0f42c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780589927; l=2079;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=T4nJoQO4Nbx+z1N5a23+hAb3mAzxvY5ogs8ErwNHR2g=;
 b=QIrMXIvRO5m7Is7gZnUOT93b38Ot3lcDWxu2J5sp6aIHhoFJNzaT3uzZRBjA2fnQa2AoC6yNo
 AauH0B6wG87D6ypsgl0h0tXud5ggHEDPqh/i2y6HD8U0kISRtMIsV1S
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.93 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111233-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:jerome.debretagne@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:jens.glathe@oldschoolsolutions.biz,m:brgl@kernel.org,m:stephan.gerhold@linaro.org,m:conor@kernel.org,m:jeromedebretagne@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,oss.qualcomm.com,oldschoolsolutions.biz,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7684C641D50

This series updates the support for the Microsoft Surface 9 5G
(Arcata), bringing it more up-to-date and aligned with the other
sc8280xp models such as the Lenovo ThinkPad X13s.

As highlights, it finally enables the built-in screen, it fixes
Display Port alt mode on the top left-side USB-C port, it enables
the volume up/down keys and the lid switch.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
Changes in v3:
- Add one more R-by: tag [Konrad]
- Link to v2: https://lore.kernel.org/r/20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com

Changes in v2:
- The panel-edp patch was accepted as a subset. Removed from this series [Doug]
- Update the backlight patch to keep only the necessary nodes
- Add R-by: tags and move a Fixes tag [Konrad]
- Strip details from the "Enable the eDP display" commit message [Konrad]
- Fix misleading commit message about USB-C orientation [Konrad]
- Link to v1: https://lore.kernel.org/r/20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com

---
Jérôme de Bretagne (10):
      arm64: dts: qcom: sc8280xp-arcata: Enable backlight
      arm64: dts: qcom: sc8280xp-arcata: Enable the eDP display
      arm64: dts: qcom: sc8280xp-arcata: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP alt mode
      arm64: dts: qcom: sc8280xp-arcata: Enable 4-lane DP support
      arm64: dts: qcom: sc8280xp-arcata: Add volume up/down GPIO keys
      arm64: dts: qcom: sc8280xp-arcata: Add lid switch
      arm64: dts: qcom: sc8280xp-arcata: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-arcata: Switch to uefi rtc offset
      arm64: dts: qcom: sc8280xp-arcata: Drop duplicate DMIC supplies

 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 279 ++++++++++++++++++---
 1 file changed, 243 insertions(+), 36 deletions(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260520-surface-sp9-5g-for-next-7897cbb0f42c

Best regards,
-- 
Jérôme de Bretagne <jerome.debretagne@gmail.com>



