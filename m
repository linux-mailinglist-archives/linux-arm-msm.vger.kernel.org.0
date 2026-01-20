Return-Path: <linux-arm-msm+bounces-89919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJFSEgATcGlyUwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:42:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E93A64DFFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 852599A193D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 23:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BE53E8C66;
	Tue, 20 Jan 2026 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="DM+0ctXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0D3C00AD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 23:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952567; cv=none; b=lRvPWF/NLRmx0Mu/dMsh7MV5z6NmY02/D/1tcCod25DogsPwEK7tu/90/0wLmOD5tUqR7FpSROUKZO9HASvbGVltMaBe/fuYqboBP6Y/2ZnTgBuPz6a1FlDfLOCetzzUXN5b9gAqJaDVq0UgO/pmxmsNbyYaob3UZoNy90TifrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952567; c=relaxed/simple;
	bh=xIq1GyyKb3PCM3qt5NiZyfeT1poPV0brKSqmx3O1J18=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aZKsbXjHZFCDcVqAlnkNN5ayrjwmYooOS5wTfX/ngPDfp6sBeA6H95vDvzySqzC1OZa0QhTsJJL1d563vVuIxmeYVLEhdJoW3OQH4aYHI5+dSLaMIvC6NHqKiMYeBDxsiyAkIu2xr2gYgmWxRAf8SFkFFLfGP1RAVz2JDJ8NR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=DM+0ctXz; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768952553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nl2UxJq2qD8bQ/GhaM1Vk6k8oGclkhAmAc5uZaB9fW8=;
	b=DM+0ctXzuJz+T8C5BHfahnovuFfw1sGlFAIaL06/O74WBZ7Sx3QJ3vt8nYz8Vg5AvX2z6e
	8P+lVUudtEnc4tJOLsQp9ij9YZacOdUwulLX8TeHHIZMLwseWDtMfe6hY1/s4bmeeDvwJN
	aojsZN9FTaSdC48cAB6a/OJ6XwpNCUscfeShEfdqjUti7iTCOhdpTI9C8cxxi6EW99IXYd
	Q6aoOeFegCGFbvLKIZCZcu1ZAtbGsPXY7k0cknj9fTt/1KouAXwdNLpNGGNMM7dmkDHZ8o
	fwNPli+WhlZ3EQWVrk8xYOsGEhLsBBHt34/RrCIAE9jL6f/tLb/eaoKuOfdC+g==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Add support for ECS LIVA QC710 mini PC/devkit
Date: Tue, 20 Jan 2026 20:30:04 -0300
Message-ID: <20260120234029.419825-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[packett.cool,quarantine];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,packett.cool:mid,packett.cool:dkim]
X-Rspamd-Queue-Id: E93A64DFFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v2:
* Added missing dt-bindings:vendor-prefixes patches
* Applied suggested cleanups and formatting
* Dropped power-on disable block
* Added qcom,uefi-rtc-info for the RTC
* Added qcom,calibration-variant for the WiFi
  * Board file sent: https://lists.infradead.org/pipermail/ath10k/2026-January/016719.html
* Added a comment about USB ports on the HS hub
* Picked up tags

Display output glitching and IOMMU faulting turned out to be a missing reset, fix in:
https://lore.kernel.org/all/20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com/

Also verified the usb_1_hsphy by reading registers in Windows with windbg.
Unsurprisingly they do match (it is the same system-in-package as aspire1..)

v1: https://lore.kernel.org/all/20260111085726.634091-2-val@packett.cool/

Val Packett (7):
  dt-bindings: vendor-prefixes: Add ECS (Elitegroup Computer Systems)
  dt-bindings: vendor-prefixes: Add AlgolTek
  dt-bindings: arm: qcom: Add ECS LIVA QC710
  dt-bindings: display: bridge: simple: document the Algoltek AG6311
    DP-to-HDMI bridge
  drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge
  arm64: dts: qcom: Add support for ECS LIVA QC710
  firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../display/bridge/simple-bridge.yaml         |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 617 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 drivers/gpu/drm/bridge/simple-bridge.c        |   5 +
 7 files changed, 631 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts

-- 
2.51.2


