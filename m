Return-Path: <linux-arm-msm+bounces-108167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEXVCvn2CmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C866656B796
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0134E3048AE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E945C3F0768;
	Mon, 18 May 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPW03DP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351713F0766
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102294; cv=none; b=aiGsSL9LKQZ0j0eTOg3KvKhGUwYKjbsH0IifkHCAkKMp9e1ASJWUq51TQZYejdLxEqq3n3hnwPpGEKps7aZqKlAfAJpWQvR0SZdcOPLMpBI3acYcVOQpbqXRkLzyXUlSSIiXQcTC94p52YomIdKBlb7maxMHGq0iU7BzHZ/lCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102294; c=relaxed/simple;
	bh=oWvBs2wkcpHlHYRrOrYAiwcizfdpBD/s5wvMKKA0icY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jX2ByGIZQiSgMcodzOjf4DjTXWsWpHyR9UcOclyz0hDnGl7pLLh0w3Bs/DtMi6rlUaz9zFao0Xb/SY8CrV7/RmawTYZIBJCaIzVtWwdoexmPNlE9TCW2nGBfOFA5RtGv7dbMXdReXkVV/LZNp0LM26liELVjdlfG5E0qtq2V+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPW03DP9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-367c26471f5so1214112a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102288; x=1779707088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmV8cNju4kJCUjfwDPvczUtAcDn6QQSu776YFYpkcdk=;
        b=hPW03DP9eaR3p/KIgdY5ITl7wsdzjo/HVg0xi5cQ7ITu+mj9P0Q+crIPlXNY5HV6CT
         0CKYyxhox2Xc7FpkzzK9wPWXQT65g6120IW7Inut47zU0Q4SjjQC+EfgRGULoa5LoGfj
         MZYfcjNoslMyFmEg5G3Esw+ED4x6ZYD2TAbrvTA5l7g5kKNtN5zI507iRnT7f82R9yNn
         eVCYEFIBWNheZGp5CL0ixWHCzSPIQNAtR90E71PSrNQNbMtyCdApZIlBMHzHlDgtWwKM
         w56bLx7Ei16Ep5it4wuJBSBDQeROf34/rHtLrQ47VSkdbNT/APXBVxvCJ/bf+jy0o2gW
         taJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102288; x=1779707088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmV8cNju4kJCUjfwDPvczUtAcDn6QQSu776YFYpkcdk=;
        b=eWMauS9x8lyunAguJlNz0AHwvgdkTueXMmPTkCZfuNsjJE3xsWZoOgQZei4oZFliMv
         q5wKq53pkKyYqcGHWIgEXLvyvQTtH4eAOTk6kWeZi8vfc1EP25Ts4k1dDM7Cdyws1/ng
         rWIzwMPvEDqtNWLJuqfxXfgX0M9nekAun45jCOpxWguP+ddZl2R/M+44j0oa3NTTKSha
         MBVrQGOuZm3Fnvk/ZGSzHmXGlhmym+NeMkOhRicX0j7KnMYgcWMqRBEoTr0uykoR8RrL
         Qu2lgEhWsH84caDYRqAhfWT7uPPGHPinlc8I07Z9hajdklcKfm7WpK9hpsFjiEsUo77Y
         mqXw==
X-Forwarded-Encrypted: i=1; AFNElJ+HXrrTMu9a2/jYUxLYLDKDc/HQKHwVRb3Nm0w8Co8mkdNjM3dY2EOYoI7xhtdlSlG6oVl1bxNa1fxnQKKl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NBHkzQS+i82j1uPc+kZsQg0B59CbRe4WXBsuqfDtoPrA3oEP
	Ebn2WSkZ+cQL5YP7CdVAiuNblZ5VlK9oPbsDIkhZvV0W7ONYGj0Phqeh
X-Gm-Gg: Acq92OHh5gckIGUIsYuXB+8oiAKCDsoiAamW9MN2EBEFEPY01dW6/ZmZV34nyPdNgb7
	BcR/Har6GSXEQElbd+pEi+stpJMtRv8XQHAOd/YnaWqAPIgNYCg984FA0OLHFBRMHz0+wRVVL20
	l3V+o9U0ZbNKRqpEI3Ejy5yw9ceY98nK0W7EeIzZCTQ259kvUveyYvhJd/MN+qj1m8f28FT7AfI
	dWgILm4J/PrGsVw5lajCMpT2pNrs19t/iW9LWvTYA947cjgrI8ffiNPaJ+4OIKOqbsN1fw4Hc2o
	SfwuFeN5PIuQoZ+9mpyfiNpQqb/w6tPvA/KYaYKAyDSOyDTrbRS1kftpl89Ia8Sb5zwIIniV806
	X9SEF1/GphuJ/pywvnmZH8NMLHyvvBGPC8nsfVI+wj28R329lUTwWYgDGBdO8u2hc5ie/4DSKbd
	avfBIumHnDBtIzq+N6bbwpFZUz6rff083lgrwWQFqi5CQs0jbVLEfpohgB4fsR8/XMz1gq
X-Received: by 2002:a17:90b:38ce:b0:365:fd4b:24f5 with SMTP id 98e67ed59e1d1-369519c513bmr13448011a91.8.1779102287750;
        Mon, 18 May 2026 04:04:47 -0700 (PDT)
Received: from localhost.localdomain ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm10866313a91.7.2026.05.18.04.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 04:04:47 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: qcom: Add Vicharak Axon Mini
Date: Mon, 18 May 2026 16:34:32 +0530
Message-ID: <20260518110435.16262-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C866656B796
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108167-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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

Ajit Singh (3):
  dt-bindings: vendor-prefixes: Add prefix for Vicharak
  dt-bindings: arm: qcom: Add Vicharak Axon Mini
  arm64: dts: qcom: Add Vicharak Axon Mini

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1093 +++++++++++++++++
 4 files changed, 1097 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts

-- 
2.50.1 (Apple Git-155)


