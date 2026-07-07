Return-Path: <linux-arm-msm+bounces-117302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +e+1LojqTGonsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:01:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D271B2B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=kqwBAWAN;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117302-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117302-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94AF8300A619
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD663FA5F1;
	Tue,  7 Jul 2026 11:56:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0F17A2FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783425385; cv=none; b=qMPJnnF41L3oELRmLo4C2bQQFvOntxHemoyEPLR5fipPnfaNJ9Yfxx7vnldlPUBBe3ux40RGqYKwHKENKUbyw7hGtvAufRXx7aUC3FDypl1viC1pRLf0r8J5xyX60yD8R8IkphGVpyB2sXXmqD9MfpGgYaVuOSjbJiHLyjd5uas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783425385; c=relaxed/simple;
	bh=wWcvkWdyZ80X/TJzwXAkfG1rlo8jd3bQ2DYmK67MVbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AboxnE3dQ+Ua2mdfH1pH2h0V/AFwPlpswY90NSD2homxygFJncjO3owWuVMLXGmDYFesKsf3BhXIlTAxYzMZB6q0a2btBxj5GP5PcmkMBc5KSMPx4yHSxP8hVYnYTdX30XEbirGfnxZ6FIYLo8AlYx5ZyZXr0lpRXvvFsIeX81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqwBAWAN; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so29264855e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783425382; x=1784030182; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=kqwBAWANLBRjH+1GOCxthicTx2UYjfj/yCb1Y4/M4hpP9PG8y7tej+9gtMqgpxXdN2
         Y9hKxuUYo8v1v6bQE65sjFtl+h63kpj7HMEdOpJr0sNmz6BQYagbrTvMwrKiQIIu0eoD
         6z9fRgQazm4J7WzhGNKIiUe3oUyECFrpzNqUofzx6bOmq6y+7Fq6IO03Ht7oM0CPVe1a
         pZ+6BqmNjY3K/EnckERlqcMWkkHMx0z/34bTihRpoEMwBvGIIwnvy6YTmdxsBijezc9T
         cy3IXiH2abcWHp4yOAXQZaRhtkn01uNL9UC+EufQw6kBAFNi0AfQke4jbmI44HC2o8L6
         bsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783425382; x=1784030182;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9RDGbpt0X65W5NYkJywTfGuzuPW4bNvD1G1EfFxluo=;
        b=Obu4moc+mFNhyQkgwV63KzqO/3YpEPny5PMTa+ZK2HyDEV2rXLSMfoh1z2I87Rz0YC
         hfDg5Nn8YgTRtGkajSc0/eTJkkh906xuIvp4qMvNZ3C3S++qgL+B70pr/uC4Z1HJQaT2
         FNQHzg7clDUFRpSpIi2IpceqDwz8hrlEyjbKU0FoLfTejDVXhdkgWdrx1PVJgrllVMEf
         HALwCgaBxq70Z9dZXj2qWaJUv0N16+LvxJcobYwxkcMA4aivhehYYFjroxWw+HOA36Gz
         1sFwgSpxSUYKRCE2mX0p8iBT9VOddSYvC26Trqe1Cx01ZpUnsd1qbe03s9fDYHszIXii
         OHMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWf0MeljrpYBsWEvm2pB7OVWvmTkfllRNFl+5c4K7jSHbVJP9JzKyNumIHp9U3+ffJSxs/9pnasU2JGFMT@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHMYHOolTCNTutbrSVomEUX/UBPkzqlzXKu++PVZX8Vc815uU
	TEBpYir+bk1aOe6/yqrba/2fZ2CucgvuYqlVCN/Ql4tUSGOLEUAa3bInOCIIEdPywbk=
X-Gm-Gg: AfdE7cnuvbGDlLoDp6sQkjZnRJm6497SzdwC/SB7zIOS1I0a5KOM4c20kbn6krRi6v7
	lcOQJpgNv9VkHtkEbIFYbY0j1MccLJsL4l7/avtjGrGzjxzNsrktAUChODYWAVnJ00XVgUFb17A
	jS1Ezjp+p9JYEgry1vrgR/gCc8k9ig4rLAPrvQfWenYWvi5xIGlnzbUL54G3/fsHErLcx3yHMJM
	X2Olh7XoL5y5haLO+/4bbP7gAhqFeMWCvfxwJy2joKy1uK73W9kg45tOUdlyysbulU8ZMeqnEwM
	ADaqmnJedIyZFGBg4X45K9WqwvvnwVRowF1fNmPSsAikv73qGBAp4B6QL9hA0AUkKj6S0qg+IvX
	e2PYuNGvKTBUM+x7xqkZtaQph6Ki78R3sfqxQg6lJM+f2u4hwv8/4YCKGNQFe3M4o3zAyixvPPX
	XxJTp4fNnnCDj0IVYjs0sAyAj3nUzk+/yFVmp9
X-Received: by 2002:a05:600c:474a:b0:493:c062:a533 with SMTP id 5b1f17b1804b1-493df0673f8mr58244645e9.17.1783425381754;
        Tue, 07 Jul 2026 04:56:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:adab:817c:53a0:8f31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5ca1fsm55401235e9.15.2026.07.07.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:56:20 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v2 0/4] mtd: rawnand: qcom: Add MDM9607
Date: Tue, 07 Jul 2026 13:56:00 +0200
Message-Id: <20260707-qcom-nandc-mdm9607-v2-0-d906f7e8b814@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDpTGoC/32NQQ6CMBBFr0Jm7ZihkmJdeQ/DopQRxkirLRIN4
 e4C7l2+5P33J0gchROcsgkij5Ik+AXULgPXWd8ySrMwKFKaNB3x6UKP3vrGYd/0RlOJV5UbzVz
 r2hEsw0fkq7y36KX6cXrVN3bDWlqNTtIQ4md7HfPV+3sw5khY6IOxVBilyuJ8F29j2IfYQjXP8
 xdb+GEmxwAAAA==
X-Change-ID: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117302-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:miquel.raynal@bootlin.com,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-arm-msm@vger.kernel.org:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF9D271B2B7

MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command, but
is missing the rest of the hardware changes in QPIC v2. There is also only
a single clock that can be controlled using the RPM firmware. Document and
add the new qcom,mdm9607-nand compatible for this setup.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Pick up review tags (Mani, Krzysztof)
- Clarify commit message/comments in PATCH 1 and 2 based on discussion.
  The OS can only control one clock on these platforms.
  (Krzysztof, Miquel, Konrad, Mani)
- Link to v1: https://patch.msgid.link/20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org

---
Stephan Gerhold (4):
      dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND controller
      mtd: rawnand: qcom: Make "aon" clock optional
      mtd: rawnand: qcom: Make has_onfi_read_op separate from qpic_version2
      mtd: rawnand: qcom: Add MDM9607 compatible

 .../devicetree/bindings/mtd/qcom,nandc.yaml        | 25 ++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c                  | 30 ++++++++++++++++------
 include/linux/mtd/nand-qpic-common.h               |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)
---
base-commit: adfc275b317c02cd043b0cf28b8cfb7459b041f0
change-id: 20260608-qcom-nandc-mdm9607-f2196eeb6bc0

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


