Return-Path: <linux-arm-msm+bounces-108501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGc8K3VeDGoVggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:58:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E957F2BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 163943010532
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479B34BCAC6;
	Tue, 19 May 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbIeHj7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043583A9610
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195427; cv=none; b=deI2w0BkVWPQZPry7mb78LiXiAUGZ2RTeKjhbT0pbcc55oezUOLoq8GvAerzsQ8qXrRLX8UElJFxsNdbivOmI/BXMKiD7X3AM2IoZJsH243zr094/VpXext/pv+llpMJM/cQiK9x6qIYroo70fFsu47v2EDj5L9yqbTwrTLIEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195427; c=relaxed/simple;
	bh=JSxBoC2uoLr6BLbqbSeKIFf7QHBtHs3aqqips2RK4jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFzpwXbeIsjwqR797MnMWwAhoI+wno9h13Uk0zr4BiF6Y0UfAPM86RP4rePUNKJClBgVWemmOVN3zV/QAO+bpb7NkKAV3TmAfCmAWTriYg0VcCiWqw9QwZEOZ0+6t39n+Hvzkr+jyUYv1w1pnWetRbCnZwPXSBDX510LoLCm9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbIeHj7f; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c801912c903so1531835a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779195425; x=1779800225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KyP1NebRw4SwpgMMJ6Ldhqk+fU8RP5i9hw4k9Hf88k=;
        b=bbIeHj7fTIqHYKszvAeKqbfd/u5ltg/SZfRYWQE5itgNYAd7MR1MxsgRBIHp9541uD
         1cdITlrnt0EXB3y/wCP+471O3xRRfOlyG0D1nFRoLmQoPT5CiZjSYYFiEdVal3tDpPlP
         a8zacsG5SxbWal7eCgTo6e8nMFNquvdjwUDiu/9++BX8OrFQXSlWlI+b2E2AuTn8jUZ0
         pafrvXhXgZuQ9uCsH5v0o8exxLBI1rpEDGD/UZDS5NG6JRNwvY7Y+IfXSJPk+kEd4OoR
         9Fha4eTpozohom0DqzjPkFWgxYIzOfHuCIc93yP4pEY/E9FuzNkqxgMFeOa2Q2YnEbs7
         /wMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779195425; x=1779800225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KyP1NebRw4SwpgMMJ6Ldhqk+fU8RP5i9hw4k9Hf88k=;
        b=aboSqNOjDBVEqJICu7aFm1lyA0ihlK82nSyLvccIetL2bwy+K2tNPu5rptj9737k2J
         CYlnEKF+NfMEBRgK+gHipq7UWidb5z1LNKgHwaO36o285/yfiuyjJQr6LIvGGwTxxx7I
         QGGKh7ZZkc8YDF/YmebFSrzI8vthAz2+Rt9BILse6Yl09nJ9Qt9NDWRumI3BKz5XWp8n
         073X+hnYs1Kf9J2Tn+xJFr1Qwti0XRqigXANmTkDbzaVmMbxgqZ11K5C28fbN3WkeIXN
         HL2ruddV5rmpGJI71JRRv8qcWDADWZAeG8T1od4ZVetGK8See4pxhK37DRJK0SeZFr2u
         7LcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kJl6zyLBUnQD83OiiyJ7ZI3yltwKLMFFIfq7zNThTEP7wJwBLN18DK+UINf9cg7jn5vCZk18J5/viPcYg@vger.kernel.org
X-Gm-Message-State: AOJu0YzjdMnyOhUzBYzEKwm1nYg3seO7hKStcch5ShYHJsRYwcGyk9Ac
	GvCyt44F42iV5xYx/4cIv/RcWDBhfCTkUVjUUWizPBASg+hbYTtTw3WERallXQ==
X-Gm-Gg: Acq92OE+tW7lGpg11X0HdZHYcQYLpG2lBsjEDL9wQv56fgVWp3GWNLs/giOmistKmAJ
	ZQ3yazgSi9iHFvSkhem2LShqVEc31Kk3fchrHWsEHIdObpXNB1hmOnELDtHdL9DA0N5UAxYct83
	1BrqK8z6UTu3Axq+LVFMKUv3qwXpCY5o85kmXl2GOjvyozm/qBKJQhgFslizY7Zu7V4ZH+ULhiH
	NrowTKX47yiOex+zvlHCzVehTvGHIXyS/rvxuEnuBQTOBCk0kjhAqcGT60W54OVx2eJ/t6lX6tI
	cGN/UZWfFSBOU7bPN3KV6YQFwY25OpF7VQqhABHqMXuHi1qf97mD8wJ9Z72FsqeUpphv4RTZ3N2
	IwdYv9Ngnh/XKSUZDYMYGiCylDr7cZVa5Z6ytiQ7MwlWi4nAah5ZYs0jXyVqEhow0vNpRvbZmkz
	0lFZa123WDodomCj3WnjiS8A+BnvjluRhTcFLK5mTreXkc4TL/0JXFXo/d+g==
X-Received: by 2002:a17:903:2ce:b0:2bd:6cab:85d with SMTP id d9443c01a7336-2bd7e782281mr204483575ad.3.1779195425227;
        Tue, 19 May 2026 05:57:05 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:6421:6644:4454:28e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d2360e8sm194025965ad.82.2026.05.19.05.57.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 19 May 2026 05:57:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Tue, 19 May 2026 18:26:52 +0530
Message-ID: <20260519125655.23796-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108501-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B90E957F2BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Changes in v3:
- Dropped unused regulators.
- Pick up Acked-by tags for the binding patches.

Link to V2: https://lore.kernel.org/all/20260518173039.20592-1-blfizzyy@gmail.com/

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
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
 4 files changed, 1029 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)


