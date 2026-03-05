Return-Path: <linux-arm-msm+bounces-95501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECGtDWgaqWmm2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 06:53:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81620B12D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 06:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48C18300E6BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 05:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF24288510;
	Thu,  5 Mar 2026 05:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="G7Ut2mSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m81168.xmail.ntesmail.com (mail-m81168.xmail.ntesmail.com [156.224.81.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B023FC5A;
	Thu,  5 Mar 2026 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.81.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690018; cv=none; b=HSh3ZDnvFJeMXPdyapagkwFucNbj8U91MX2CNZhi28YAPn7DEyBkqvyGb24Q7piie/elosBt7/u6Zp+V4zaxIGKNFKjKTPFzFnMqnuQiCN/w3Qmm4uuy5B3SJSHCsgHUhcOoElMqDkvaTRivfMb5w44JL88Z4+/mNdqISeLG3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690018; c=relaxed/simple;
	bh=e3mYVOiaz0vFwVcQQTowGd03CwFi0VuNDWYXlS7riM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lBsmTOGSSnl4z5BIjX2YUUqIULc8hLgyBVNvYEljn5qO0fcp+e/qB0px7G9BNhV3gybWPqY61oNZ9VS0sM3PfoqeXAmTJr02F6CtEZGEm9yAd5i61/pJAiUNJzBv5yZEgzeqw49EjQoemhT4DnNu5sVwBl0thNr6Djz80d4ypRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=G7Ut2mSZ; arc=none smtp.client-ip=156.224.81.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 35d4e47b7;
	Thu, 5 Mar 2026 13:48:16 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/6] Subject: [PATCH 0/6] Add audio support for QCS6490
 Thundercomm RubikPi3
Date: Thu, 05 Mar 2026 13:47:41 +0800
Message-Id: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0YqWkC/y2MWwqAIBAAryL73YJl76tEHz22WgITrRCkuyfR5
 wzMBHBkmRy0IoClmx0fOkKaCJi2Qa+EPEeGTGalVLJAe428G0ZN/sTf5lgtTTo1qpYzEcTWWFr
 Yf9+uf54XykdLpmcAAAA=
X-Change-ID: 20260305-rubikpi-next-20260304-7f91c9380dee
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Roger Shimizu <rosh@debian.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772689696; l=1951;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=e3mYVOiaz0vFwVcQQTowGd03CwFi0VuNDWYXlS7riM0=;
 b=+jgnRzaPEIaNCJS8LArGfuTKVJfZZeF7sSxU1HwbP7ZPtpklhXw+FoRh8GfnmGqNJlIqHTelN
 Dl+SE/mbfj6D6VqzESNsSHLYnZC8ByMgz/pJZsWTxzgOMEtWKRRD/li
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cbc8a26b109d5kunma04077fcc8562c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTR5JVkIeH0hLHR9NGkoaQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=G7Ut2mSZAMCSMOWuJf5uqjwfH1Urz39NsSTVB80qO4XgRsuZxkgP9rz0zzsuk2MI1yiR+UU2Y2rJj4sAblx/Sm4bhS4zleW9Ca/LcVE28/aUmxSx099UkXiQvK0YEZH0du11zIF1UAf97eOeHKA1MXyupByI+RqWij6f+bBsuHE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=jaHsYPCpNvupcMRicenlnQKcg5eHjQnzISdQH3kkZAg=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 3E81620B12D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95501-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:dkim,thundersoft.com:email,thundersoft.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series adds audio support for the Thundercomm RubikPi3 board
(QCS6490-based) using AudioReach.

The changes include:
- Document the missing everest,jack-detect-inverted DT binding property
  for the ES8316 codec
- Improve the ES8316 codec driver to auto-detect sysclk from MCLK when
  not explicitly set
- Add MCLK clock IDs to the QDSP6 PRM clock driver
- Enable MI2S jack detection in the Qualcomm common sound driver
- Set codec DAI format for MI2S links in the sc8280xp machine driver
- Add DTS nodes for audio on RubikPi3

Currently only headphone playback and recording via ES8316 have been
validated. HDMI audio and 40-pin I2S are not yet functional due to
upstream LPASS MI2S channel support still being a work in progress.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (6):
      ASoC: dt-bindings: es8316: Document everest,jack-detect-inverted property
      ASoC: es8316: Get sysclk rate from MCLK clock when not explicitly set
      ASoC: qdsp6: q6prm: Add MCLK and internal digital codec core clock IDs
      ASoC: qcom: common: Add MI2S port IDs to jack setup
      ASoC: qcom: sc8280xp: Set codec DAI format for MI2S links
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 191 +++++++++++++++++++++
 sound/soc/codecs/es8316.c                          |  13 +-
 sound/soc/qcom/common.c                            |   2 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 ++
 sound/soc/qcom/sc8280xp.c                          |   4 +
 7 files changed, 230 insertions(+), 1 deletion(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260305-rubikpi-next-20260304-7f91c9380dee

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


