Return-Path: <linux-arm-msm+bounces-74321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA33B8D3F5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405ED441F36
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6591FCCF8;
	Sun, 21 Sep 2025 03:13:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832171459FA;
	Sun, 21 Sep 2025 03:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.151
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758424406; cv=pass; b=bVw+iyDE8PA9Re4+o4C0OFHEKwi8p/aSZMRTUn3aF/bL2Qomtms+TYdMHBkKiApgp6eXrtuQgXBaywC/vvSXiiVWVXqsULIybqlgc6kY4sHDpixZF0qnfZ5qOZrHjEcAEP/f9sX6gYDxPtt6NdsbgiD8O3TCuW2jzhrWSbQRRcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758424406; c=relaxed/simple;
	bh=Rik3W7ynCkxB1JZzo+4XsigwyygniOnaImmnPz6cnHs=;
	h=From:Subject:Message-Id:MIME-Version:Content-Type:To:Cc:Date; b=H4R4JrX+n5oeH9KNZ/xuEyFkINpd6hsglfz53zUfVHETzAz24q3Ulsjokaw2Pck7l2LnBrQ8kYVnEQIPR//2pA0LG3gkKh2Uj/H4x81NfQeI5CL0WuQtIV+WhIG1yxOr/nnIiaOcvdEJB1h9bjrDamH9P1WIE8J4ZZaDp0p9SjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.209.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 67B7A2E192E;
	Sun, 21 Sep 2025 03:08:08 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (100-110-156-246.trex-nlb.outbound.svc.cluster.local [100.110.156.246])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 87FF92E1924;
	Sun, 21 Sep 2025 03:08:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424085; a=rsa-sha256;
	cv=none;
	b=XQT9KFi36vDL7r6G63JM4z4v9qdshFnCyAzvWluvzeZ6CCli3+NJI2X4mCLmyo4GFYjUxN
	BH6Sdg3SvK17cZ3kJAojvqIOW0erBMC85DbDYdGVXztmHWgSNs/0Czq7tDvKDtGGyiNG5m
	pt7iUCCLynd70LhjpMwVUfblyd9e0umgh2U0OBpMA2bMRtiSfmKxbCDR7O6ov9sDmcrQ4A
	QUPSWi9uuke2tOAzQBWM1EjZPNbU2norKDFyr2YkJEGty7DVlbNpEQQwgRkrNj8EMH+wYi
	YKNFY+occ4VEJFnjBVq7Vgd8KvnFqnMalU35zzdoh+8fikJDiPC4GEtzGI33EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VsXIUbJSA1j/YOMG+XMkS1RWghiRVL5UIwd7lF/9dcA=;
	b=Q7iAyuGGZxT09Xj8kYe9IzHzDZm1SA0s+Lvxk2Kx6UtqZmxJQLW1NHBn1ZvvLWtTbId1aa
	Ha81LFW3+iNx6M+T0VrZW0+3bGH+zL6+3fZa0aiDj4sChCQtwQVbPIp1dD71V8F6Gb7Zvr
	83AFAJzfNHYguEkxD7FppajqDBpbLF98ftLt3ht2MR2j+V0fHyndey37rEds97m/ojnTGh
	NM2euRX13csv6ePixDmRvjIxkM/HL7yfWuz0oGBSS9ZV/6BO2w71LqTnN2p2mNInvVcXhg
	6Q/fw07xSUIVW48KrIWtvomUOTs6NbvmJdyhZqwVzzPVqHal33jqez1IN6W9mA==
ARC-Authentication-Results: i=1;
	rspamd-5b85487794-qzzcg;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Plucky-Suffer: 28b7ddd8501bb0ea_1758424088194_1396185300
X-MC-Loop-Signature: 1758424088194:3904576828
X-MC-Ingress-Time: 1758424088194
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.156.246 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:08 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrld3zHxzHTnH3;
	Sun, 21 Sep 2025 03:07:57 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 0/5] ARM: dts: qcom: msm8960: cleanup and add missing
 I2C nodes
Message-Id: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVrz2gC/2WNyw7CIBBFf6WZtRigL+rK/zBdEJhaYihmRhtNw
 7+LdenynOSeuwEjBWQ4VRsQroFDWgroQwVutssVRfCFQUvdSlMrETmaoZOCMJFHEso0g0esjeo
 nKKs74RRee/EyFp4DPxK994NVfe2vNaj2r7UqIYVpnPXO967D+szRLrcnJ+KjSxHGnPMH4Hi8C
 LMAAAA=
X-Change-ID: 20250831-msm8960-reorder-1849dee3817f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=2610;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=Rik3W7ynCkxB1JZzo+4XsigwyygniOnaImmnPz6cnHs=;
 b=k+QuqtXhuabnVisfpvX0dRupbHuxejOlCjyqf0jaXHZ17zVqTNYH3b4EBWOTl6h7YGgq17ihv
 cs5uTskNQQGApZNCzLc2bJi+lh7OcVUgjtDm5yYnoMDwNEy3fT6UEEa
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:07:57 +0000 (UTC)
X-CM-Envelope: MS4xfN0tn0IaPLREWxX3u8IGZQAAiPulXoNet/nDKozYVP9EyLLdR0BLb6UASX7NQ8E0NIqkbw3OeuEphOYe9rdZIvCotAGwIZTNw3dFR4Wr7Fj/rbmWakYY KECBoho5QSVpLMQCu9r7wdjk0thHW2TkGJT/iRp9szm0uHUKrZaJR9lBrdLVFiMHBQr6UQpr0ltNx8a3KUJzHK549b9/7qjf3Ke6E9v9uE0ElArVSJiNs2MU 3+Hh8N0IZK2UcOvHCTIj/upiWUf8Nj6L2kJPrlND9idwo1bM+R4brlkYdTMUgL/h+h5kFMVl0SWizs/GtJWYSEplub+c1E2I6iu2qfZmvM/bFiuhxuU41sp6 XiHJeawX3RhaM6sXaBU31RHV7RxsT/e14OVit7X8A8MKAAgDtOErDySJC6hOp4zaUEvhwft0VMxNEiZRa/5zDoBft6l70i9INaof/zhUOBE8HI9CQjKTh36a aFaYOL1XhjFnf+VyJuYl67Xdbzz56kGRJNSUIQ33PPMib+ZvD4n/A2GCXYmYbGmp0boZW4sZD0knako/URpnCaYcapIZ2+CuL6jWhg==
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c11 a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=wxLWbCv9AAAA:8 a=Fg_ZwnXJ7CBUc7Ulf-0A:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

While working on adding support for the Sony Xperia SP (msm8960t), it
was pointed out [1] that the msm8960 dtsi could use some general
cleanup and reordering. This series applies those suggestions and also
fills in missing I2C nodes that are required by several phones based on
msm8960.

Changes included:

1. Reorders nodes by unit address and sorts properties to comply with
   the Devicetree style guide. Cosmetic only.
2. Inlines qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
   SoCs embed their TLMM definitions directly, so this removes an
   uncommon split file pattern. Cosmetic only.
3. Adds I2C child nodes for GSBI10 and GSBI12, which are present on
   MSM8960 and required by devices such as the Sony Xperia SP.
4. Adds I2C child nodes for GSBI1 and GSBI8, which are present on
   MSM8960 and required by devices such as the Casio G'zOne. This work
   was contributed by Shinjo Park.
5. Renames the GPIO controller node label from "msmgpio" to "tlmm" to
   match the convention used by other Qualcomm SoCs. Cosmetic only.

[1] https://lore.kernel.org/all/rcazqdcr747ujkba6z2j2oci27ajkqfi4hydgc2kiavm73y37x@g63jga2fcwmo/

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
Changes in v2:
- Split the dt-bindings rename (msmgpio -> tlmm) into a separate series
- Rebased onto next-20250919
  - During rebase I noticed the previous version still used the old
    style that Konrad has already commented on in the Xperia SP series.
    This version resolves that issue, and the patches should now apply
    cleanly.
- Link to v1: https://lore.kernel.org/r/20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com

---
Antony Kurniawan Soemardi (5):
      ARM: dts: qcom: msm8960: reorder nodes and properties
      ARM: dts: qcom: msm8960: inline qcom-msm8960-pins.dtsi
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi10 and gsbi12
      ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and gsbi8
      ARM: dts: qcom: msm8960: rename msmgpio node to tlmm

 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  10 +-
 arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi      |  61 --
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   |  12 +-
 .../boot/dts/qcom/qcom-msm8960-sony-huashan.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 746 ++++++++++++++-------
 5 files changed, 504 insertions(+), 327 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250831-msm8960-reorder-1849dee3817f

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>


