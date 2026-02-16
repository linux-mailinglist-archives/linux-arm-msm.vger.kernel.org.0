Return-Path: <linux-arm-msm+bounces-92937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II5aC4MIk2nO1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:07:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B714335A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 13:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 994EF3010263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA433306B21;
	Mon, 16 Feb 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtdpHPkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB8261B71
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243647; cv=none; b=ekjNJ9FvCC64qs6aZi0xt+zuMSGWW4scz8rcBNWTqJe5htPQtnQMMjxYZdluIrVI0sozYAxI8MmU4gz4z7Jz0IbLsR+U5EdYaEQlhi5KuQzF0VmBkqsZoDHmfzM32M9rmy3q+aLhsHj+sfzCxMV1S1XEnuxoe4t1oiKJKUg+3cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243647; c=relaxed/simple;
	bh=+tYVAkfWKjcAL2zrn7RiSIo46XHIYX2z/6h1nPyRqyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTP1fBgp1RQD4JzdcMpaQYVQA8if70wxoBF9Rka8QA/nN7ooqg3uG5BXyN45owP8AF2MTMPCwDJRgRQojzD+is0G/D064oZq3YR0pp9Ux7lDzvxKFbJufyKvyduug7yx+qFy+fUiHzlGe9TZgStp42iNcJUy8sdzly3WPtu3oek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtdpHPkH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1430009a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771243645; x=1771848445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kduViMgW1mSAZtgtfFCbkT3EAWTHE6M11C2kxQ8nJk=;
        b=QtdpHPkHWTu8mTBCBjE6dnaWxJjYNUjvusgZtO/1U7QOVbmz00vlTenLTGpshdf54d
         A/J8rqLw7PsssuJaTTLPToMaakwqKZH2pOjh2CbFj6wammqJZzsa553R4Ek6NcDqtFNS
         bFVfGxwkmg3rgRKT6q5O7wm4pgjEy9dL87Ii6kqhg776+XKpn0UXKFkTq2i/z+uKFa+J
         FfMaEmHUEtLbjHs6v1QPYBnb5zV593xGyam1L2pGWyXYy/qkYn3YPVNBii8NoX5xxqIR
         sj7HzA1DBt+PRC7h/YT0b/d1NvZDMS0u2M9DSTc72NtrXoXNafsYiP1KZvUyoK159aZ2
         WmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771243645; x=1771848445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kduViMgW1mSAZtgtfFCbkT3EAWTHE6M11C2kxQ8nJk=;
        b=W5nAM8yy52asGWXGdjiZeKSpNsSKX6zrAbrwmuM16qQpXKZIovnA9AgMB1wvgSe/0q
         1sGcsGp6h/rpFhiYLSBV4zOVwefHXaYVAU3MB8iDxh2jZC7dEFXl8GdcOzDCporLKufl
         fbX0G9vOfxPzZtwrG2O+fgcTndGjgDi1j78+UGTDU760utY7pX1u9Wjos2fCLqAs+smZ
         K3S+qHf505GkhrM1JITaA21hF57pRE3GGuL+JS1pMNHDKsRROMhR1c5hph9v8G5Sovcx
         9o8EgLrZcDN/Bft5Ik95hHmoR4ZF5hjjgSU0EGbfu5Ox6fYdMUYpM4P9qtyrb8EQ9Jy3
         CQag==
X-Gm-Message-State: AOJu0Yy21wcETLL5sCMCIzLk2/Q50mjyM2QGW0TzaACmv1PdNYYz0JRa
	FpZomYCRphR+PdU071T4MJFsWx9Tood3/yP/E/Hw2RcTsM4dhBTSVAok
X-Gm-Gg: AZuq6aIOLX4npB4+h0E2AQg1LEIW1BPCYsdNr56J4uHO07bJKXmt4YeILGzyuxEm16+
	5pNPtimrERwzygrki4wdhbRP4rcR2ipF8hDVSa/UO3dRxej5Dl1dYahxrqK+yb+d2fg3CSvilGc
	JVeVffkKBxZV1NFDvweRWxSfGmPDFoPRGc1vZunvMOsP/fRwEGOQDO4fDLQ19DLehw2yHqrJHW/
	bfgHEKUCQb8TtEDqbmnvlY715i6vGp3DDbceOGhbBviCLGaujPrwSRxtjH0Dh7c5/yxLmviQfac
	JbIRwKzY7DAqao+HahxRVr3UoYF7MKbltYtpYj+SWhYpgAb9QlBqcV5Vh3Jvo1LsNCos4iJfJ4m
	SK9HHuKb1ZwMFrzHatJC9IQykBT0ATI1/ncsJQR0K9XLDbPqImWL38YJ4WwCX6/xA+FoiCZISWm
	j+me2mhOLpKOljN9dqnLuZ
X-Received: by 2002:a05:6402:3645:b0:64b:7b73:7d50 with SMTP id 4fb4d7f45d1cf-65bc784b00amr2289714a12.1.1771243644766;
        Mon, 16 Feb 2026 04:07:24 -0800 (PST)
Received: from workstation ([178.227.214.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0d09sm1867098a12.25.2026.02.16.04.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:07:24 -0800 (PST)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v2 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Mon, 16 Feb 2026 13:07:13 +0100
Message-ID: <20260216120715.3432191-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-92937-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E5B714335A
X-Rspamd-Action: no action

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v2:
- Add Rob's A-b tag (patch no. 1)
- Add explicit framebuffer_reserved label (patch no. 2)
- Use memory-region for simple-framebuffer (patch no. 2)
- Fix reserved-memory naming: make node names consistent with labels
  and intended subsystem (CVP/camera/video) (patch no. 2)
- Convert mem-type value from <0x02> to <2> (patch no. 2)
- Fix s2b regulator comment style (patch no. 2)
- Remove unused gpio-reserved-ranges entry (<32 2>) (patch no. 2)
- Link to v1:
  https://lore.kernel.org/all/20260204115645.1343750-1-zstaseg@gmail.com/

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 865 ++++++++++++++++++
 3 files changed, 867 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


