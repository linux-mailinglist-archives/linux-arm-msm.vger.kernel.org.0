Return-Path: <linux-arm-msm+bounces-91794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D/ZOUU0g2kwjAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 12:57:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 478B2E563A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 12:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDD1A302AD3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 11:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B263ECBCC;
	Wed,  4 Feb 2026 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vw89mexy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BC329ACDB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770206218; cv=none; b=oS8jD86jEV345hk9T0VEWmPmp5C16y4hsoSatnfS6+WCkgLDETHVwhRGqqzh/chQbLX/lH/P/4ggXG/uW9ghO/6xgp3lyiSk2FqBR4OZjAC06PsvGkn6HWQXtCgd/do/25Ugkq5nz7R7s6Grmv8v7wIOMmwKo8Ata3+Qv7irpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770206218; c=relaxed/simple;
	bh=WjEXkGsQ5sr5TzqRl6oe46H9S0TisIOthFvDELfEQ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdBHD8IiJFIatHm4/p/MGc0IcCD8Am8TS2Dq6F6CFF85PIfHYKvXBRRV1XaXh7P+LcrMYmHm8L433JqZb0VQPTWodScmHI7s1kNP3nnHP8UuSt1QKeXKvShhH/F5Rf3ye8tMRW02ccaNmH2BbEs7F0gTIs5zFBxIEacZ7riFlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vw89mexy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8871718b00so1148207566b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 03:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770206216; x=1770811016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtNij9A3CnyY9eArlj5GSFWikA3b1bHvLn2mkmp9wl4=;
        b=Vw89mexyDGlwDhc8wwEhxVPxbgvgqbzZOeaPX7G719Rs35UFFLMY+v8dhXVAGX9o+A
         bud/Oi7RHE/CHLC8VdK7xvUXWI4ozouKzQWtufitRra24yjd7JguHFtVw3TA964oOepK
         X5/W2gVfQipnWmKWcmBEf6RymZrIF02zbJqLBHXG99LZJ+8nRAFZcnBMecivbvAcSmWb
         +O9UXKq6a0URTeakd/tcGzItWcnnNmsrccGRQHN8MAXdct9dnwe2fP4TSpmqBwlJCQ3u
         tUBcpeKFi5/25He0xs9kY88eaWb/sfW2OmozRu3PAmyGMjYVhfj7nUNbkK39Ff1bFQzS
         xY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770206216; x=1770811016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtNij9A3CnyY9eArlj5GSFWikA3b1bHvLn2mkmp9wl4=;
        b=MRnFmuRlaT+hyXoND7zG44RwBOG1YKVMsYV31WsTsiPpNrOx5QXOrvOcn+WrVa4Wc6
         mWhR5H5g4P6MDAGaYkziMcNb49dNYCCa9f1UfMu3+vwYvuzJrD+aFUvgjN6TciRnelyP
         hh0fMOAC/pLMCtZg2p1VqH05RPXpFkbUYtYOZdAG1TlaiM9yp13M8SZrEbNUK1qs6xe5
         PQReGGArpng+6Jpbvz0A2hJQgYhxd8dXkT9EZaQkxdIBiWmsOCXJciepHOwIcjkQgmqx
         Gc2d2ZSe/3xoi1j3zVZJ8wiz0AdP3Ju8MAbNrD7ZxSJYbFGtESKlBGwJiUQgzsDFWmu7
         e9+A==
X-Gm-Message-State: AOJu0YytYRkQ53IRvpsyzNajPn3NVsDZCx5+Dbravi04UxP5376ppsZF
	pitZpfrDGCwwOHfKKvtC6NVGvPHlhME7F+h+iCI6n5yvgCdsNmYACltB
X-Gm-Gg: AZuq6aJtPziMBpvJMJlCBqUakCctCScj4Vmv0N/wQ8l2ylK1A/sv/IC1LMS/YPPB3cO
	rBZnpH3nBdqerS/0mqMjT4JoFyBYJCJ6Ua1CHi6vrPIGjC/HKOhGM29SqGYjh34fqqoWkqlWZLv
	KyscH9dttJneacl4dXgT3ADqCzGulxwitGwnja+VjB+xMkZs8kXqxdREwmFVAvwF3S545y5SiXF
	uHFzD2suZztyN5hEd+DiUmHn65w+qpZUDUdyfmBTb/63tZME2ym6iIYkQSmM8XbZtztzD2TEjbo
	AXEY84pVU6Z3g3qoi7CIPwEOZtkinrBMBXZi5xn3Cp3Ke4SlmhLz8in3rC66JXtYic+RjHMoovq
	f/dksgkJOIgJqMx23mLftjIKQ2Xx77BLHHWbyY76o0d7PlZ7o8C+uEqloEJV7ljj4mqc3iplJJC
	VbMvdeWBUcHF/6/k8=
X-Received: by 2002:a17:907:1c98:b0:b88:5ef6:17f9 with SMTP id a640c23a62f3a-b8e9ef23790mr183701866b.7.1770206215897;
        Wed, 04 Feb 2026 03:56:55 -0800 (PST)
Received: from workstation.home ([178.228.161.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feefffbsm116457666b.37.2026.02.04.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:56:55 -0800 (PST)
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
Subject: [PATCH 0/2] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Wed,  4 Feb 2026 12:56:43 +0100
Message-ID: <20260204115645.1343750-1-zstaseg@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-91794-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 478B2E563A
X-Rspamd-Action: no action

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Stanislav Zaikin (2):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 866 ++++++++++++++++++
 3 files changed, 868 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


