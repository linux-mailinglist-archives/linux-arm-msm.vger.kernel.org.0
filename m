Return-Path: <linux-arm-msm+bounces-98095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLt6A5oSuWmFowEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:36:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B62A5C14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284903024113
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8909F396565;
	Tue, 17 Mar 2026 08:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="FcdJ0BJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com [220.197.32.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CCD33A9F5;
	Tue, 17 Mar 2026 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736584; cv=none; b=Clx8NJFw0el+9/8kYgruexfu34QlN5M5c4tk9QuOmwGICR9qphjT6IN3/cGG9dVIEmPTdnHAwNBFDpeFN5YI1mb9ARWdDNODudhufxDsbaCKZN+RbzdvkffmHMEIT0CcJGqjpaUCna2a3RPkqbDfQA7FppkQcZsVr7IIL7opiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736584; c=relaxed/simple;
	bh=aZOBsuuTgRDcLeo8gd9H0phNxVRheaWUt4onUtnHjkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hzjRFSfBxjPO2qKe0PPovInMRKIOMmNU9pcfMs04k9ulTP28XuCLO8G97pVh2Baoib+OfEWRUp9V9IeSILeTIVGeZYEZrNcLhd2GTx6K/FbEC8LgGzQdlN1RoRtH/w1yXAdEgahB9T/W0wkvqDRyradq5uxEqq+8koFy0mSZtI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=FcdJ0BJa; arc=none smtp.client-ip=220.197.32.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 373e3b471;
	Tue, 17 Mar 2026 16:36:10 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/6] Subject: [PATCH 0/6] Add audio support for QCS6490
 Thundercomm RubikPi3
Date: Tue, 17 Mar 2026 16:35:39 +0800
Message-Id: <20260317-rubikpi-next-20260304-v2-0-5634fabe0c43@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsSuWkC/4WNyw6CMBBFf4XM2jGlUHms/A/DAssgE2NL2kIwp
 P9uJe5dnpPcc3fw5Jg8tNkOjlb2bE0CecpAT715EPKQGKSQF1EIhW6583NmNLQF/NkSq7HJdVP
 UYiCCtJ0djbwd3VuXeGIfrHsfN2v+tf+Ka44CC1mpRvWlknV/DdNiBnLejuGs7Qu6GOMHzBEvP
 sAAAAA=
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
 Roger Shimizu <rosh@debian.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773736570; l=2652;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=aZOBsuuTgRDcLeo8gd9H0phNxVRheaWUt4onUtnHjkM=;
 b=ZUEIsRPEw5yvW7YQU2EjQBoVCKsol+JBpa8Rn7j1593qVla4Gnot9qTnmTn7V5cFCE+7sySe4
 Qaz37XTSFvLA82EJypcVIKALZS+mDbzC3zeeabK/qgc08jUq5pQ/UCw
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9cfaf02e9509d5kunm8391965e39c95e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0lIVkkfTUhNT0keGkJCH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=FcdJ0BJa4pHx0sVXmKudSX78i5Gc8J8QK7d3MHrpMM2vJcUTw/RWX9lWiX7lEju3/0xf1TEgyYPp7iZJ4ZybO7i4imcVLQ4wGwr727sSVqxblSOEoLpInMEuz1PlaWllUM2nuBMsDMeD+h5Zg8SIOHtDr5qAM2NCN4UP3h2e+YI=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=l4uOlGBARksdIJzYk3IQufirbqrxa4EQrhBpinf1hqQ=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98095-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,endlessm.com,katsuster.net,loongson.cn,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 953B62A5C14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2:
- Move the retrieval of the mclk rate for the es8316 codec to the es8316_probe() function
- Drop [PATCH 3/6] ASoC: qdsp6: q6prm: Add MCLK and internal digital codec core clock IDs
  and use the patches previously sent by Neil instead: https://lkml.org/lkml/2025/10/6/828
- Modify the device tree:
    1. Swap the positions of the spdif_tx and spdif_rx nodes.
    2. Adjust the order of properties under the sound node and add necessary blank lines.
    3. Merge gpios with the same configuration into a single node: lpass_qua_mi2s_data
    4. Change es8316: es8316@11 to es8316: audio-codec@11
- Link to v1: https://lore.kernel.org/r/20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com

---
Hongyang Zhao (6):
      ASoC: dt-bindings: es8316: Document everest,jack-detect-inverted property
      ASoC: es8316: Get sysclk rate from MCLK clock when not explicitly set
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
      ASoC: qcom: common: Add MI2S port IDs to jack setup
      ASoC: qcom: sc8280xp: Set codec DAI format for MI2S links
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 191 +++++++++++++++++++++
 sound/soc/codecs/es8316.c                          |   3 +
 sound/soc/qcom/common.c                            |   2 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 ++
 sound/soc/qcom/sc8280xp.c                          |   4 +
 7 files changed, 221 insertions(+)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260305-rubikpi-next-20260304-7f91c9380dee

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>


