Return-Path: <linux-arm-msm+bounces-114342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WdPUBL3TO2owdwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:55:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 550016BE4C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:55:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jvGeQS7q;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114342-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114342-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 354293026C27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6E33AEF59;
	Wed, 24 Jun 2026 12:54:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3543AEB32
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:54:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305696; cv=none; b=XEd9RDBjsr7OJ9QzEueEMUKzDp8ioSEtCtIj44jZ1t7c/uPBY3LrWrXIFbRBRIff9Dazk2uXxOlxJ5vjhOBZxT+AHgxJaDdft6cMIe3Mi5ZLo0Js/1Ap6taO/ykrogu1P3wxQ1zjmzCyu0RY6DeAoMYyWcFEp+aFlIBnPAjIVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305696; c=relaxed/simple;
	bh=pnmR93+naKUPpJt+TztpCB7ucpDaAPH9UxODSQzYh7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLijEEYYx3wwrZSqzQy7N0Hw2RqeFm3ZWF9e2PTEQ+DxDsVdxZd8GSgjna2SXhdnjVX6bbKhdcG7BnkCvHufSqbQUbmVef7u0wBEuL0x9JCTaoEPZ3jgsqULPA37eUlJdjhnHwqog+DobKDtELaPJHXDHeN4xkPP2Wzu5vaRiD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvGeQS7q; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37deb2d3a28so308995a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782305694; x=1782910494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IN+prMiGhBKvFcbILeQU8WH/1q8pvBu1Yp6Ec3mzljg=;
        b=jvGeQS7qPyRNf3Blg08DFwRZqP2680WjJLNzSkFoUBbGl96pZqO+woVuvSIrTAiEtu
         WnYpX5PpO2h4HQRPuU3+kNI2/BIYZf/Z0c5DjD59O+5G3L/4ghLe/UUbdEl/Fy6ZHkpR
         UcbEKyUpYEBHGihJ0YADmjrcFLfUdXtItE783L59925vKplUoBO0kvuJwf0hnra9KFKT
         7WGvmgFYmYDsc5A4jO1T6xBfFYuDu7TW3KfISg1ghLjr4jfoFG1PmE1rUruYnAGmMoau
         hsJWFRqAiVVMGnaScPGDJaT96uPCk1N/FCLY/umprLd55ULKKoMDxdnFLgVFUwfQrOnI
         80Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305694; x=1782910494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN+prMiGhBKvFcbILeQU8WH/1q8pvBu1Yp6Ec3mzljg=;
        b=KLLipxKX0Cd8PNQzp0ZrtX4JFVmhqJl0gWM9avJMkWihz4+cEi4zzouo4FNAtJZ3TN
         zZZQxXwZfKu4LZ3OZVgP4rqWAbxtA15lV3YPUXc5j/uL15MXeZIbtJ+zE59tg7cU/trM
         2frbQYnrZsk7Rwl0WqIYCRNhs4nhtucVhUoGmP6urawSC5U5tUHaW6ETm6AwwzNyJrxn
         lnO5ey7pOrODEP8icvB3xuDhOXExvqkGGQ15DFO7aXKl6YCSD2LbmeL0FM+DGZzwT+YS
         XsAwnT0s1d1v9gaesD3l+Ox0YjnKKSy/SrWcyNlZ+/IJ3I7BzwngWC+eFwVrMlqzlSVS
         T8MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfcKEY+lmD4v6nRGP/dCFaaAhpQO1rDYdn3Ka/PjlnkZTOVDQymmhJgegp/kOJ1KoyPl4sPeW+oVRYagUm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8h9quh6/bVe2oWvZDd+qOTK9foom6m7205DtF7JG1JNOCwm/9
	RQE4IWka0bH00quErmYVQAE/nzOuruAeL2JhdTvQzAXlaCljJ0xDaJon
X-Gm-Gg: AfdE7clZPuS2hvBQRpQbcCU+zlYl1BmMm/6OHN3TW7MEU2TUIBqeHR2jLST3Q5fBNH0
	s8W4xYQvtlNenDs2NO/w03liQbOQ9MDt9tc+FWk8QRo/pTvCrkn0hVfaFM066LvkKCeDIzE5hOg
	UZY3LXxQqi43lox1TeOx196q/ckcqLYyqM6mRAVilyS2SBfIaJyf/on61z8OxEa2KdAoExaI1HT
	N+IMbOw6tutle8eQSLsqG0jp5xO7hYMZkUtXrehk82VBOGtWOAYhB6NBy37OiUU2bQKIKeJ61+w
	7cph2o3fcxylLkmVXQdWFTIPh5lNsD//6JVo8iDkkooQkP1nrhkgGkqYdLcz97HVv65vp3d1u+U
	JPPevsM4XWOSfWd1U2NFkDgQ7sx4hRd8ybxegPBK6BxcQeCaqWcywHbV9cfczT3bWRtnqtph57I
	5l80kOcZjhSdrzO8A5OOmEy+rjslMFEDCGfUkrI96O
X-Received: by 2002:a17:90b:3a48:b0:37c:774c:77ba with SMTP id 98e67ed59e1d1-37dd0de99a6mr9058843a91.21.1782305694263;
        Wed, 24 Jun 2026 05:54:54 -0700 (PDT)
Received: from localhost.localdomain ([150.107.232.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3b839acsm2984870a91.11.2026.06.24.05.54.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 05:54:53 -0700 (PDT)
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
Subject: [PATCH v5 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Wed, 24 Jun 2026 18:24:40 +0530
Message-ID: <20260624125443.18729-1-blfizzyy@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-114342-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 550016BE4C1

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
v4: https://lore.kernel.org/all/20260607113658.25117-1-blfizzyy@gmail.com/

Changes in v5:
- Drop regulator-always-on/regulator-boot-on from vreg_l16b_1p1
  and vreg_l17b_1p7.
- Remove the unused vcc_3v3_en pinctrl state.
- Pick up Dmitry's Reviewed-by tag.

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
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1014 +++++++++++++++++
 4 files changed, 1018 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)


