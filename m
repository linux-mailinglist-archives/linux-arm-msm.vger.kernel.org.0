Return-Path: <linux-arm-msm+bounces-112211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unGzNR0uKGq5/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:15:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE86619D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:15:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="D0crT2/N";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28FF6309863A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DD2341068;
	Tue,  9 Jun 2026 15:00:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925CB3AA9CA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:00:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017228; cv=none; b=P7x3Irp+HX7/HUhmHH4fcCekARVYQY8uf3h9YIF3CfaTYpoK/jvaIhPM+lT4BR+9275oa0GKQ6cGAnFAngfEZFspfCiaEqLRX8JUN5D9Y9mn0sxjv5SpMvrff6uRmxUx8PQMrCcOYwm7jTRW/3Qbn3kZ3xuMy9BHPVg8MHCBjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017228; c=relaxed/simple;
	bh=ix/oHhBAo7AENnf1SkoR2nZG40XnWLkYO0tbe1FXolg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JYQNsfXRGcMCJrW2SHzXvFaaRL2LsWBVEpdqCLUDj0wJG359CCrTos1ldreYQvCMvAgO8WkOD0WlXvbQmtInmHlWOBLtrQphr4Ho6Oo8RMfgbfScn/iF2QwWbTWwoXhYjqHcHMioIJtIb9sq0LIuK72kQqGV980iIcK+o/MojcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0crT2/N; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842288702fbso2297832b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017224; x=1781622024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IByXirxo3bMCvCa3vaDUgSZFbqo9DDHPOgxMY9rP5MY=;
        b=D0crT2/N9amOm+M6eF1nkijjblADksQZL7cvdUnesWzcWcmcuWo7wpdjSwVh3zMbTR
         hucTEvV/Y18ESTY4aShNqX4Pw9FTccpTFVgtZGNWPfgmgDQXKOg+s4HbpODe7d6CteuD
         uB4vzQVf39/Si46YLCVGJoE7w/k2cINOe3nk11dx4a1wo7txSOWtq12+gb/2mEWl7pcP
         fmL6URLmo/SpmGe4UY0Te+bKJxtBPxDh4tYfDwzOfutzQgQedzY/JyVojXkiZXywz0pi
         a7/A/FHDw4A49N7r8wH8EbKuMWwSQMJhzMJOendtZhvZK0V4kB0Z990BBsRERmM78Pfb
         Fjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017224; x=1781622024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IByXirxo3bMCvCa3vaDUgSZFbqo9DDHPOgxMY9rP5MY=;
        b=ZvZCm8SML1s8xAvAKgzqNLZCC3XjB5IIerMrAOONJwh/0EurA8/vXfDnC3XhGyt7AX
         x5UnTMTVNt6svMa/FbVY4czJ44tjZjcTLLOszVRUR08y79xh14xSdLSInShwL59lHQKk
         0+2mBfoY//S32SXRn8d9Bvq8gnP4wzQyYQj1QGbJwPefyePCD4nyaO4VNyJWn0rl3sQx
         Dm1tCQYD6K9rR0ojkgW9DTNx9q3aAAbezgeAwFs014uoqToYGQfB/8g3vdneCYecDA1h
         2s9GSoh/pngiZKSKTlisQchMV9OW2R5qi5Ud5F7A/XNasg78ZjEIKKhZ/8Eqo2EKITHA
         +x2g==
X-Forwarded-Encrypted: i=1; AFNElJ+dig2DYdI9/64QhyC3IK4HbReuZCozgXxI0MoLpk5xmX5YyLxH78Gi2cl/VeX6tTLbnFOtuCYn8ZCuhLQ3@vger.kernel.org
X-Gm-Message-State: AOJu0YxYa/9KnyzEh84coWjqahDi5hPEJMUsTAG2HALNcPPmZoRcImC+
	IMyg7x1ZtdWjTKqQQY1ILpvXLexlwcgzxkENC3QHMrEHDpqOleChnLMk
X-Gm-Gg: Acq92OHV2ZqcjbomwjSURyvrHx4t8xSBjyU9Xd8U1EyBEIEFytv4rm1vZarRzCUE4Qm
	9EsckFA/WC+QLzUN1i++mnFzWk5/TFrF0S0wiWunko0wAvC6l/1j6cuXgjkJJAF+HPw0kVkDpo9
	voXSFUifxquMQkfVIoXAJfAaMaKn4GpFp2PDNLw9pOQgxd67QcTUTZC2YmmhujJ1vmrGkOiVC/O
	Ka0bOrX21R5G8/Iy0j5EDdKzhLbC6Xf2gRvKVB2Xl8FkAOsnd/Cd0mQWXSDZjfkJaagSzeYfxab
	vK1yctg6UGtoffD5GScjjh9lBCmg/2oFRXZwO/Wbg9Uk3ETcUZ96OLvHwKqTlK+LtSv5s+vO1r+
	CK21I413ZrnUQ0qeYUVeFVC59q3Uv9mvJo45QDToYqy4qjlNXgS7lbhHXJBNRM7Gw3/XTsmxRRN
	noKPGAlermYvDm7lvEx/Ava6XWcfrVjCv6qlZhXVAy6+L4+O68S6ePlXqr6oZIghRmUG4Vxo3w9
	VFEppERYGCkxnBlwX68/kJWD1Mao7DBrqk=
X-Received: by 2002:a05:6a00:1746:b0:842:6482:adc with SMTP id d2e1a72fcca58-842b0f1ed44mr21080433b3a.9.1781017222588;
        Tue, 09 Jun 2026 08:00:22 -0700 (PDT)
Received: from harrison-Surface-Pro-12in-1st-Ed-with-Snapdragon.lan ([58.164.4.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm22773929b3a.15.2026.06.09.08.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:00:22 -0700 (PDT)
From: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Subject: [PATCH v4 0/1] Add support for Microsoft Surface Pro 12in
Date: Wed, 10 Jun 2026 00:59:04 +1000
Message-ID: <20260609145906.40854-1-harrison.vanderbyl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:harrison.vanderbyl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:harrisonvanderbyl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harrisonvanderbyl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AFE86619D1

Changes in v4:
Device tree:
 - Fixed some formatting nits in the device tree
 - Clarified NFC only available on business sku.

Changes in v3:
Rebase:
 - Rebased on next-20260528
 - Removed ice device tree changes

Device tree:
 - Fixed C++ style comment in &i2c9 to use /* */ style
 - Flattened mdss_dp3 port into &mdss_dp3_out directly
 - Whitespace and formatting nits

Changes in v2:
Ice device tree: 
 - Updated to use 0x0 formatting

Panel: 
 - Add edid to commit message

Device tree:
 - Fixed formatting and ordering nits
 - Removed extra dmic audio declarations
 - Added suspected devices on i2c busses
 - Fixed incorrect usb regulator
 - Describe panel pin regulator
 - Added defaults for volume button GPIOs

Already applied:
 - dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in
   (landed in linux-next)
 - firmware: qcom: scm: Allow QSEECOM on Surface Pro 12in
   (applied by Bjorn Andersson, commit 667d05a09db3)
 - platform/surface: SAM: Add support for Surface Pro 12in
   (applied to review-ilpo-next by Ilpo Järvinen)
 - drm/panel-edp: Add panel for Surface Pro 12in
   (pushed to drm-misc-next by Doug Anderson, commit 02f48ffdf96c)
 - hid: Pen battery quirk for Surface Pro 12in
   (pushed to hid for-7.2/core by bentiss@kernel.org)

Pending in this series:
 - arm64: dts: qcom: Add Microsoft Surface Pro 12in
   (reviewed by Dmitry Baryshkov in v2/v3, minor style fixes applied)

Will be done in future patches:
 - Camera support (pending purwa cams patchset)
 - IRIS jpeg decoder support (pending purwa iris patchset)
 - Accelerometer support via ADSP (probably userspace)
  

(Audioreach/ucm2 changes for audio)
https://github.com/linux-msm/audioreach-topology/pull/32
https://github.com/alsa-project/alsa-ucm-conf/blob/9577cd31121546b288759097901025376141177b/ucm2/Qualcomm/x1e80100/Surface12in-HiFi.conf


Link to v1:
https://lore.kernel.org/all/cover.1778498477.git.harrison.vanderbyl@gmail.com/
Link to v2:
https://lore.kernel.org/all/cover.1778822464.git.harrison.vanderbyl@gmail.com/
Link to v3:
https://lore.kernel.org/all/20260529011619.9586-1-harrison.vanderbyl@gmail.com/

Harrison Vanderbyl (1):
  arm64: dts: qcom: Add Microsoft Surface Pro 12in

 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1194 +++++++++++++++++
 2 files changed, 1196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
prerequisite-patch-id: 30b1f6eda08f0e6798cfc9dfd29ea0951e9d8dee
-- 
2.53.0


