Return-Path: <linux-arm-msm+bounces-93544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHhxMa6OmWkwVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 11:53:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93516CB8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 581963002D0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Feb 2026 10:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D571345758;
	Sat, 21 Feb 2026 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="Zs1PZR7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63530E0D4
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771671208; cv=none; b=kBQRzh4gcREIGMFix9WGzeUaWGgXM4z3E3MvP2j2x1M3KYnG91wm2eOvsQB2radsDh3CQdzWGgazFaaEfql48eDZTZheeRX9EQGsBizuMNFOvzATEne8tlDoGz0UtJYBlFLMhzaH3Z13mlCXyOQEIagq7DjXaTVNoMrMRJV9yZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771671208; c=relaxed/simple;
	bh=vd8xj7CMO3Dv+YwIu1Os2yHeUy24iPxFLciO/k2/hiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1KvimPd2vENNlHgYi24mnaegFrWotdu8wa2tEHZg3lVdbh2J68bRDV+x/uBsn1bjEb1mQKK1osrJX3Sh1WcR5mPO6sJpArLNBjGxTfYsP1pIGTHwTvN/QIOjPNDmLVUCs9P0gdW9+G9k3HU+PMmp/OZfy91Ev+TNDvZixEtqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=Zs1PZR7S; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c6e191c4b8fso1078808a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Feb 2026 02:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1771671203; x=1772276003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u2FH+ENmL44rmliSw5sDxFHS0xH8PJs3ALHZb419LAQ=;
        b=Zs1PZR7Sn0sMeJMovEUorOtSteJk/PG+1R7mWZOzggp1JlnGWazGwcSnucXg6ms1RY
         W1tRXIRWI1ycTSJDgngVusp5i5oSmCq2iSwxvdSyU3GOASVMNQ8CO44/CrKXFwYTj+IF
         JlZUyDi/bqK0yenbZCrgzHPONB3Yg9KhWMEbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771671203; x=1772276003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2FH+ENmL44rmliSw5sDxFHS0xH8PJs3ALHZb419LAQ=;
        b=ORYpUjSZJ2+S2Kk9aZ/nYXcM2p8n5GTV8udDqC2kKyl2gdKldWcxxsqz2kHMpMN3wz
         vN9rhLJXWCV62DxffRLfrqxk4T8FfxtOYOMiZ1W+OTSQpvpxN6B8BR/c9YaT1awHoTfh
         QStBd7PTjdTB7Rr2DsiPHuZDa2CdFqZZADvtSRTM5YkVLRVy1MwZ4DevCXitB1EmuwfY
         vUwzXiuco+U86xnGcfyI6inWrb4+c4pG+9x/MmZQ7tic0ZbHBd+D3omYQGc2Od9LIe55
         N9yZ/5FjOKVZ21MANs/99zTuxKP2+ma/ZlSs+IYm8Vj2yoX7I6re/8Su2HzIKz+7/XU+
         xDag==
X-Forwarded-Encrypted: i=1; AJvYcCUTHVclYVooyCnaB2Yfi2T5ouiVzOcc6exHDxLKXlTcC9nQLYNePQMGyV4e75bJ8PMkgaKGqG/EZ14FM9hg@vger.kernel.org
X-Gm-Message-State: AOJu0YwJveoUNjr4eXgvUVjNLG4EpF9pGdBVRidEgP6XKrWfhOXJyYZr
	TblUiNY+8A7xk1CPak6YA/sV3qwV8Z6gm3gUzxuCZf71vkWQq4kw/bZusCwQ2Ku3+Xg=
X-Gm-Gg: AZuq6aKcs8BwKLE6jQcxZfR2u99OVLYDAjhiPGECNT54sIHZlVgnTORLuLe/s88SrdU
	1QCjZ1G2uDtsGb9fqf4XfxeoT5doavM1o47UcNEFgQtzNGHlZPREb54UlfQewcHoI4c+N2TIgik
	zvi1f7TbxOgJd4kq0IemBxQsO6FmrAahG+ExGQYNa5wNSliLrS4qY3NJeWK9g4xkOg3BPgSHyK5
	GEiydhUKKH0m2HM/NDbwbn5SsaJS3QmIhvvNwfUoY3yOgktiW+tKgi3AxDbwDY8Zg9oely1hIOo
	hS9GLbpeeW3oGTevgh3pDWdaKSpWbi9oEck37+mqkHxBu6FCEybyicDqik+aOiV+XHz4tz0qoJt
	7pIps/4herQwCj/Nt7fMKg6jc5cjSQ4lN8DxDTNCHP8htbTvo4o7cA5/xQBFGfysi4WgJGpCURG
	Gq3T5W7LSaBbSLlwl7xiSDydnRMk4QjwVPCoJ33ehWzLVyb3/1tRSEf+5+JthAJOUsMbIktqzTM
	7vXYiSI0ViDgBTaG8TxyX00u5DFHxVn6t8QCia8SjEXHUrNFSjT8y6DWFbthCGKsn3eijEci7Br
	OlhXNEotTCU02v+yjHLYjhfTBFnK2OFj2kB5zDnMH0cmgbH097AvPPUxNhtCt4wijflj
X-Received: by 2002:a17:90a:da90:b0:353:49f2:1e7a with SMTP id 98e67ed59e1d1-358ae8b3b46mr2945299a91.17.1771671203594;
        Sat, 21 Feb 2026 02:53:23 -0800 (PST)
Received: from aegis ([138.84.66.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b72603dfsm1924094a12.28.2026.02.21.02.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 02:53:23 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] arm64: dts: qcom: hamoa/x1: Fix TODO in system power domain node
Date: Sat, 21 Feb 2026 18:51:56 +0800
Message-ID: <20260221105245.19328-1-daniel@quora.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93544-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[quora.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA93516CB8D
X-Rspamd-Action: no action

At present, designs based on the Qualcomm X1 Hamoa reference platform have an always-on system power domain since the OF node values aren't implement.

Fix this by using the CPU C4, cluster CL5 and system DRIPS parameters from the ACPI DSDT Windows uses, together with the Low Power Idle _LPI minimum residency of 9000us and wake latency of 5000us as exit latency. Finally, assume the entry latency is the difference of these two values.

Tested on a Lenovo Yoga Slim 7x with Qualcomm X1E-80-100.

Fixes: f33767e3cfa5 ("arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..64338769bc85 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -290,6 +290,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <4000>;
+				exit-latency-us = <5000>;
+				min-residency-us = <9000>;
+			};
 		};
 	};
 
@@ -448,7 +456,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 
-- 
2.51.0


