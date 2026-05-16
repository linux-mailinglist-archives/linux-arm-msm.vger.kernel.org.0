Return-Path: <linux-arm-msm+bounces-107984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD5SHDA0CGpAeAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:09:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68455AD41
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 11:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9D43300F107
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2552B392C50;
	Sat, 16 May 2026 09:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTwbfqWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B1384CF8
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922541; cv=none; b=kkczrgTaivgWRWFtmOvEWLanIvq4CDXvtU9hL1v6njRGE9XYhFFgp4WV+5hPukkvYp57xMEYo3JpuT5QtMRNNdRV56RGtRyZvs5UJsO041iphYXyYa2gbfPsKrqfh5pJNuz+k1BlMCOacF+UO5o99l+JDQ9QZKFvV0oVdeQGIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922541; c=relaxed/simple;
	bh=4LYuI7PmmbBjpToaTIydk7OPdf7o6Fc36uUJ0rUUd9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjqRYgzaykHgiPhr2bDcICI61hE7FTLWt03WNwa6fLRCUFhJE5uITeFYubHWQ8tTv7QaDG4riJKo2n1nrT7S3ersl0tdeU1FxufUeSIh2sqHykRfM3tt+UrMoU17YoA1wHAleNUnZwCXWolBYr4DlDEANjl4OCGZfJgWleF2pNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTwbfqWN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso1961058a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 02:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922538; x=1779527338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPNClhCqmVTU7pENbyz3GVKA8FIVl5d+7UyL83c1D7w=;
        b=JTwbfqWNVHJsADUYJXFAR2vfMG6Gms6NWSpccZA6qTdwbzl5LFZmqaV7mBayCxop8F
         rUeZdmxWCZgjLqmbQBfzMAo+7s+yTJ68iIESv34RKuew78Pmoi3KPKoDWAagdFbnS2u/
         lqXa1gzpWfVFoMzxECNZIOBHrheGRAzVAcTVyThm8qRn5WEupKIFBLpAZINoaJ3WN/1R
         0MS2VbETerNuHCfAmOlRfxPQ5erI0NcvHwfPXoFRYV3KTYjeSDB+HRrOIPBJqtywzOCb
         MwdFtpKuRHBSXDTTWwz+4hnwJoEDqZYVscn9nu7x+m1/uoa/zaab7Ft5JM6IhH+oNyuK
         pXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922538; x=1779527338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPNClhCqmVTU7pENbyz3GVKA8FIVl5d+7UyL83c1D7w=;
        b=ZkngvIFwh8sENiJnRFlPj24QyVUMeWtM+HoM9UP+mbYtYXZ7NQ3yzc8dxdlybDoDrs
         N/7uTGfJZ5SA6mL8zy7QqBDoHIXGqEpGtJr0sZC/Re7xrpiNDck4/1jbOYdJcHB5WP34
         lZGzV6u22hiiM9Y2Atz6iZOVbgqudmKHAaCNVW0L0sqrFxwJEX6iz9YlCQNBqsywaPDz
         cYI/JDfFNpNGhxJPfV1uM9M5zktchK74nPOiQofu4RA59T9d/mQeZX3KRli5nPvkCHm6
         3tXj0OSo1ZUjus5UZ6zmolRcobhNcRsRJBrUc3T2LsQYuIfWOEjzG3+UhO6/PPXl0t1i
         Q07w==
X-Gm-Message-State: AOJu0YyeYIghKnDb2WojuJ/xXQ0LBiBbBW/9Z7KmhspcUmayqUHzMOcf
	pH3cs+yRFUwv5Kfq9HqWFoUYQqby3LGpcnE+meBSjkgu47knqDncgh5U
X-Gm-Gg: Acq92OGZBE0warRxMchBLwsw3xsFXia6RIKrtsFk1/Nm506YK1BsvAqIVi2thL1o7b/
	tb0dniKeVlUJa+RpvAbzXnw+brNHQ/NZwXybBdU6W1jnnLWQl71Ru+9rIGJI5A0X4R0rWbvCBJg
	/rjM4vkwZOuej4ic5IMUDrlowN1dfw43q4wN4BSqzil0t407DLsFcs3IzMkDiN1/j15oTCvDG6y
	kUPMuDuInNvFN1BUUSkXy7L3R67l6EkmZwewadAhVVqBlz9og8yIOHesrwWV8a17AdPzv0drEq1
	cIDVvRllrT7PV26apjT4fEpCu6NctU21l87lJaAWlLF81yMiz/uf6Pv0OWzbuWzFxpjSEosiE6X
	xrhq5pt9SG2sl7eBt5FV4x6esYKsZNnN6IJzFT1i/W8P9xfqL2JlDnSnAoOu0YAj56uKZzBk0nn
	i/gAmfi8SzpN696SLAkB6tGX4AHPAVBJEn2JQLW0Gj5PpeW7pNWT0rYDr+FQiD9r+PqnglYsU=
X-Received: by 2002:a05:6402:11d1:b0:67e:53a4:5807 with SMTP id 4fb4d7f45d1cf-683bd08ff27mr3617514a12.18.1778922537621;
        Sat, 16 May 2026 02:08:57 -0700 (PDT)
Received: from workstation.home (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-684744d13aesm525848a12.18.2026.05.16.02.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:08:57 -0700 (PDT)
From: Stanislav Zaikin <zstaseg@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Stanislav Zaikin <zstaseg@gmail.com>
Subject: [PATCH v6 0/3] Add Xiaomi 12 Lite 5G (taoyao) device tree
Date: Sat, 16 May 2026 11:08:50 +0200
Message-ID: <20260516090853.2873223-1-zstaseg@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BA68455AD41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107984-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds device tree support for the Xiaomi 12 Lite 5G (taoyao),
based on the Qualcomm SM7325 SoC.

The display panel model is unknown, so bootloader-initialized
simple-framebuffer is therefore used to expose the display.

Changes in v6:
- Patch no. 1 - no changes
- Added a comment about reserved gpio ranges (patch no. 2)
- Removed "output-low" property from "hst_bt_en" node (patch no. 2)
- Moved common IPA properties for sm7325 devices to soc's dtsi (patch
  no. 3)
- Link to v5:
  https://lore.kernel.org/all/20260417084749.253242-1-zstaseg@gmail.com/

Changes in v5:
- Patch no. 1 - no changes
- Change vccq-supply to vccq2-supply in ufs node as it's ufs2.2 (patch no. 2)
- Val's patch for goodix-berlin didn't have effect on my touchscreen,
  therefore keep the touchscreen szie (no changes in this regard in
  patch no. 2)
- Link to v4:
  https://lore.kernel.org/all/20260305093941.305122-1-zstaseg@gmail.com/

Changes in v4:
- Patch no. 1 - no changes
- Removed Konrad's R-b tag, please take a look again (patch no. 2)
- Fixed vreg_s2b_0p7 regulator name to spmb2 (patch no. 2)
- Switched bluetooth to wcn6750-pmu (patch no. 2)
- Dropped qcom,local-bd-address-broken as it has no effect (patch no. 2)
- Added wifi calibration variant "Xiaomi_taoyao" (also sent board-2.bin
  files to ath11k) (patch no. 2)
- Link to v3:
  https://lore.kernel.org/all/20260224114424.1966947-1-zstaseg@gmail.com/

Changes in v3:
- Patch no. 1 - no changes
- Drop unit address for framebuffer node (patch no. 2)
- Add Konrad's R-b tag (patch no. 2)
- Link to v2:
  https://lore.kernel.org/all/20260216120715.3432191-1-zstaseg@gmail.com/

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

Stanislav Zaikin (3):
  dt-bindings: arm: qcom: Add SM7325 Xiaomi 12 Lite 5G (taoyao)
  arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao) DTS
  arm64: dts: qcom: sm7325: Move common IPA properties

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts |   2 -
 .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 908 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7325.dtsi          |   5 +
 5 files changed, 915 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts

-- 
2.51.0


