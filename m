Return-Path: <linux-arm-msm+bounces-94301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OsgEF1XoGkNigQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:23:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14E1A771D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:23:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C313430CB649
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D53363C67;
	Thu, 26 Feb 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Hg7vegCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD5332902
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114731; cv=none; b=BlhsfFpsVx7J2/MmEjy+dlGKF3+Bnu0slQ4IgC3S5YeuhNcmIM1njL+ZL1xNggCm1OvxGXG5rBLvYu8V1TTii1vfLYFDtZTcmtIWv6kMYMQim8uw7y5A8qRq8gfE7CetrzRlmzZqJHYIWguOk+WqI1ppqA8KI5iJhGBmQDlVEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114731; c=relaxed/simple;
	bh=5PWW2bECJpi+KmGyUtsDq2d8pqqeL5yHRiL7SDHfi/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyw2+ivEc3PCLhbGl0wtmsygVMLbyzcv0YotGVjAHAqoA+3iRdpojQTdMSf7kNkx/4m48RLDe73lJe3wzbJM4foy/Jq/e3YXqYjFDVdZVAEdB6y1Xb0OhOD0ktsiooHPc04rV2z1hv7F2zCytIhKTEaFOY6u/v2ZFitqS1atXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Hg7vegCj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B5323FCE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772114721;
	bh=dN9A/8NcdFPO3Zi+AfZ0VKbrL07IdR/gdWg7UnqaXcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Hg7vegCj6eAvIB9Pd5QVOdM7jXar3HmFApoxt8STYQHPzlPN38rS5uiqiMU+4XYZ9
	 HtEEASYrN3QKnsG2WCq17RR4jOwqOJC+/6lk276eqSYpR4QO/Ddbg9DReEaahR6A7E
	 7Vpi36d5yOiENvkeExpfPEr/NxN+27LM2/BiKIHNYFiApTOM6ROI+1MJU2mXMCYsRR
	 FIZgH+0zhXe0Z3XQeFMmefVDVd4wmL/tGBnP9YcEbvGPH1bGRDRN+RjvU8nSZeyx4o
	 zjQet7zK/dEutUSNgLSYLIl+Rz/5EIX9+zALhLKUT/sfuaa6qZxaXdn0ZjQIZgganw
	 wcNB6k5JfcR09vY/KQpgcCoarVOKdwuzeR7PFCzV0I1yh49yCCJDfHAfOI9QAz0+Mh
	 gJaTI/mbUjao7CRY+nMPF8ggo6/JXZfqiQg/l/G4yf8egP+dI+fpRURAt9X+zfLK1+
	 B80Ursw3wzxHjcQ0mFUuOqPXeejOqrx4aVmdYlpBQ/cugVdXR0NdxUlz39bbn6I7bE
	 FJxl7L1NibUZu6FincSLKDpM4AjOjyFMvbdO7/0uQXEFCHfCMLGHCoLkwaR7DjBtP9
	 nHTMGVkcO4V6hv0zDOWd9FgYHN/tFOWOlHQGyuPHqPUJvpNJ94AawW3GKsvhdp2+Gy
	 vF9uHtla20l/6Rbuk3XUpnc4=
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5a0ff9741fdso513611e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114721; x=1772719521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN9A/8NcdFPO3Zi+AfZ0VKbrL07IdR/gdWg7UnqaXcs=;
        b=aDuJbr8s12eYpOwUqISWnu4ioP9sRcE2CeZ/tKF0rOwQTmo7aAIX33sWSAMh4JxIXl
         FpMZMYMAxUuH21CmuJ9ZTK0AqneIjdlPmT92cBBNxMtENUaPLLpIKQMZS/xZ4BDY0XB4
         oA5T9osWWLF/Lb3oU7AriiTtcRz5WblrvIErzzHy+y/5Js5QOr/867ElpYzu7FNm5e6w
         3VVbVh3Li8HrkIDoTa0f0DDlFyW6FA6JfN0d0vpctSMyxJqvMjD3VvFrU3a+yhUPLspo
         dXn6pq7TSp4n5dkBS8xcL6G2FieFCJD2fmjZhjf6UjO/Dvkl8lVZFgKDl2yw4IfEU9o/
         iV5A==
X-Forwarded-Encrypted: i=1; AJvYcCV7Xth0mQsmuSn/VxCmHQlfeTklnwu1t8MgS1wyArToLoST6mHvsyMQv5Vck6prH6YSvGigHH+eGxO9fNCB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5AnyK0nY3la94+nYh31p6g88cVfhEnAKxDASrkkE/kFkM/RJH
	1gXNjN/U7uEmzwCZmQMrWi+6SAvQ96KNdBEgNcbcI+FHTMYcbMYpXlfIap6yYxqKNyxi+nIcR6i
	hcIAtwJSx8sAr6CBLMOKzJ9xI/BYlsWzGg+CiVr/tRnGXVKLeZZlOfJZnzg57lQ5SoUJk6xmnbl
	T1UgZ6hTQ=
X-Gm-Gg: ATEYQzxjzgHXldkXjpqTiyoUYwPJm8zFwGcSdVb8mhlqSfzsMwVeGC15Z4stP1tZd0N
	BLx7KtoMCnB3pJ+VUj7lY4j8q8YRdYxYaiG3OOhgkLE8ORMWHtl8DSWfoZCN+QU/TixYa6fXPL2
	ya45206ZKcg9mlAP0ads69OW9keihw41oOQHO0zsWiU+MmoWwbN6YWy2+ytbtfX8gmp1wFo68jx
	7bO2BgeCQKPLQ+8NzM2ZumT6lUTVKTR5JHoSBOb18ZzfiqxrLJZZuQ2cV+tb0KOxuDlSSwztyHV
	gNdsOS/ya2bo1DtH4ygei4Xqsi1Xi3H0OiGRs2qhlt1EGKf0x4MZMWuv+U+XKlO0Z7iONXme9+m
	nQoaiXyF1V6nEXJkHkyFh1ydeoZi0cM8z/aUX
X-Received: by 2002:a05:6512:b02:b0:59f:6db4:cc7d with SMTP id 2adb3069b0e04-5a105d84f29mr1677310e87.2.1772114720709;
        Thu, 26 Feb 2026 06:05:20 -0800 (PST)
X-Received: by 2002:a05:6512:b02:b0:59f:6db4:cc7d with SMTP id 2adb3069b0e04-5a105d84f29mr1677296e87.2.1772114720264;
        Thu, 26 Feb 2026 06:05:20 -0800 (PST)
Received: from m2.fritz.box ([2001:a61:35c8:6701:3d2c:4b2a:b4d0:81b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109debf8bsm898874e87.74.2026.02.26.06.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:05:19 -0800 (PST)
From: Tobias Heider <tobias.heider@canonical.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: add missing denali-oled.dtb to Makefile
Date: Thu, 26 Feb 2026 15:04:30 +0100
Message-ID: <20260226140429.232544-3-tobias.heider@canonical.com>
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
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94301-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[canonical.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,canonical.com:mid,canonical.com:dkim,canonical.com:email]
X-Rspamd-Queue-Id: BF14E1A771D
X-Rspamd-Action: no action

The device tree was originally added in
0d72ccaa1e840b4c8723a929b2febbedcf5f80cd.
The original patch on the mailing list also added the new device
tree to the Makefile but that part seems to have been dropped
(by accident) when it got merged.

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
 arch/arm64/boot/dts/qcom/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e80..b05e8adc02f65 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -374,6 +374,8 @@ x1e80100-lenovo-yoga-slim7x-el2-dtbs	:= x1e80100-lenovo-yoga-slim7x.dtb x1-el2.d
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb x1e80100-lenovo-yoga-slim7x-el2.dtb
 x1e80100-medion-sprchrgd-14-s1-el2-dtbs	:= x1e80100-medion-sprchrgd-14-s1.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-medion-sprchrgd-14-s1.dtb x1e80100-medion-sprchrgd-14-s1-el2.dtb
+x1e80100-microsoft-denali-oled-el2-dtbs	:= x1e80100-microsoft-denali-oled.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-denali-oled.dtb x1e80100-microsoft-denali-oled-el2.dtb
 x1e80100-microsoft-romulus13-el2-dtbs	:= x1e80100-microsoft-romulus13.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb x1e80100-microsoft-romulus13-el2.dtb
 x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2.dtbo
-- 
2.51.0


