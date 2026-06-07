Return-Path: <linux-arm-msm+bounces-111567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OXY1DmxYJWoZHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:39:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74765077C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 13:39:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eXOG06aB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34253300E241
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B29036C9E5;
	Sun,  7 Jun 2026 11:37:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEE13112A5
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 11:37:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832232; cv=none; b=ry+OzAxXBHVQcbeqBwWCrpNP8saXLrzBBrZ450Fo75ZfHtgI3Z1PKawxhmph8nQsMILAB6laVYlYSpQVe2yAvfD/MYelQfKYdLaxknUiMPAthUk95tet78d3Z+/D+XTX1b9kR20ABfCyfIs4RFOwJpZ9xsj0Y7h4lGJihcpsYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832232; c=relaxed/simple;
	bh=UkilVZ6L5qYNGf5OkHZ73UaA5FJBXCP4ssHkfm9A6Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFnSC9IyfGeOEG1Z6GuudH7UjG7TRIxtgvRUZEm4OAS+qYSNpXLIeEliZNErVx1B4gqfMHQyNQsBEhN+db1bDsrTJKM0eobyyTH9oL5QVGHi34w1AEDoCB8y+g9hy9MZPMGwpw50b06jjvASg4RZfrl2jpmsaXeoPASzRVIKa48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXOG06aB; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf2247e38eso35497305ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832231; x=1781437031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E2qBSVXHU8kFXauvXxCaj7xA3mOOH97xQiwoWavb5pY=;
        b=eXOG06aByr6zUseVHK4gfgtYZkmfzGUWtWHgNzL05VtynNpfFSAEUZLrVI8N1BizOZ
         AJTNKyXnocqc6gz23Ibp1wjQgq048qbZ6UPvvWxLO6yJJO9UOAtumDjNSDVL93OeCvIk
         tB41rZNy/sqG9fc5V9CTk15um2TM5dPmltoongOWYuobdjmzgN/Bv2Ns1kD2awNVAII0
         dOGOjcx/1Y/oOw97KFKmgsMpkC72FhhX8sFsO21cZei4P79qclo7/mCgZrTiP/npQYtw
         AceP1awIT8GsLud+KDUTLliaFg52ziUTsjT5dF67KqUzjmdoEl+3o2gzgEIPMxZOhmtQ
         Ryfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832231; x=1781437031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2qBSVXHU8kFXauvXxCaj7xA3mOOH97xQiwoWavb5pY=;
        b=NYqQW3KZfq+VizaJQEiISDWw6l+ldTotf5omFXEf2Fm1tCRc5MD7WMJY5QEPBE94JJ
         XX+N8ttTRJE8A+flVpp/YvW8HovLZgFJpvEmfsBk/dBv9cnxc9OWwRmxLlMCAw4rbDPo
         rRggOEqbKHvv8bq1ZiHYFW3OmmCNgEYyigazxAGUzCjNSFmcvpl/NExZPaOOcJb/jE9a
         fpTtkXVZOjAQebK7J+szEsU4nVOv/lbWjdac1rYb/2g39qGdKB4oRjE0ccR/XFhcqoE0
         ItF/+p6rhkdVqcbegThJgG4//OYuNhBoZLn4ZBizV3Nf0Xskj9mL6Q1hQwkBeP9weqUW
         +OmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yxOM0c+lfM5Yktiupl/JjYL93S3aLFNt4CD1xbcBnOSamwfmrFc4XHMrovRYZjddphYPsOcwck3QX/YfZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+Jn3yzA//B2GnnnNO0/zfzQoEENhKw2xbke6ZrER82+OeAwx
	TTVO/M5HCgkwSjQHyNlmRpA8MYwnYsRapGYSL3iYC50NjfVBIHCMpMAm
X-Gm-Gg: Acq92OGw297T3+jpNGpWqoI8wJ8fnea17QDkuVCbJIgmQoOv0YeJnHf7+a03Ysdtbs9
	gviwp44pQjcRsI64r3zjgBmWq/va6BRQss94eag+rMMi4pgd713xvi4xRBF3OBW5XjSLDBr2Xd8
	pTEqNvoA8NV8e8YcLHhkIVu/UuYirHCNQI8VuMa0Df/nknErZ8L17iRD9/ZzPM9XPXZyjPMAYU2
	n8FWgavbzK55fjcKyh8ohfU5/k5CKO5GhLghHm9W4odGx90HZ38JWTDN/1VtahBh0kD/StNqI7j
	tJaAvBoyPruQ3EzeMR+1eukCPQKKos/p4WOXMyxwIBBF+6Pk1bwx8d9SDqOBmaRa3+yDfzV3KcL
	LuVFCRNMm6+npXpYSBkYVD5W/5ldYHVKO523TGe2J24VdWKFNMwzWB5dHGcglgVa2DHWuGqHYy/
	yahF+YkBWGrBHHSwGb98OGcfOWfzCG1FEwtYOikBa1CsnU1bEeUL3ifEbEasynrlnRK78FzWQ=
X-Received: by 2002:a17:903:1206:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1e85aad3cmr126401255ad.28.1780832230663;
        Sun, 07 Jun 2026 04:37:10 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:10 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Sun,  7 Jun 2026 17:06:55 +0530
Message-ID: <20260607113658.25117-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111567-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:blfizzyy@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B74765077C

Add initial support for the Vicharak Axon Mini, a QCS6490-based
single-board computer.

This series adds the Vicharak vendor prefix, documents the board
compatible, and adds the initial board DTS.

Tested:
- debug UART
- eMMC
- UFS
- SDIO WLAN
- USB 2.0 host
- PCIe

---
v3: https://lore.kernel.org/all/20260519125655.23796-1-blfizzyy@gmail.com/

Changes in v4:
- Move pinctrl-related changes under a /* pinctrl */ section.
- Explain why UFS ICE is kept disabled in commit msg.
- Add a comment describing the USB 2.0 host-only board routing.

Changes in v3:
- Dropped unused regulators.
- Pick up Acked-by tags for the binding patches.

Changes in v2:
- Drop unused Type-C VBUS regulator.
- Drop invalid camera thermal zone.
- Drop incorrect PM8350C thermal alarm override.
- Fix PCIe1 3.3 V regulator name.
- Drop redundant EUD disable override.
- Keep ICE disabled due to fatal SError during qcom_ice_create().
- Fix pinctrl property ordering.
- Sort top-level label references.
- Add blank lines before status properties.


Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1027 +++++++++++++++++
 4 files changed, 1031 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)


