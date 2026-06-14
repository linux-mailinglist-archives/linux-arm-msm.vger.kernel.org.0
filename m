Return-Path: <linux-arm-msm+bounces-113046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AxSzLw7ALmqs2QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 16:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E576681527
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 16:51:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=eXojB0Yp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75C3C3007961
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CAA3C5836;
	Sun, 14 Jun 2026 14:51:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83F3C76A2
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 14:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448705; cv=none; b=dOanPqKvXKhEHWUnzwZGon/1rhU01KEQopEo6f13e+Ziaj1sQiOXIuZfrOKPfMx4rkzEgM1fxQ4z8rXiq8cgPvsZN8mb4kudiab/FX2XbfgymcjLMh5d/2vmX3mbFechwHzdzZL40cpsANH8zhe3+drMQdsPd9HguC996P5lvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448705; c=relaxed/simple;
	bh=ogMc+SzI7BygL/QiVUbBYX/vH1UfhMtj0GEZ+Aa4xVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ScA9hDS2fA3SoUfUVJriOks8BCUFU7m/0i/nELBDS5Cqt2dnTfuJ65E06y5B5PBF58MnMHUY8CZMOQMcvjWDhHNpzMjoPVpPrfc7MrUgCKKjCPwFxzNPGjCy96e57l/rDoUeXrDXJrRoyRRLLc08COLZmOoMl/SBX9GBbBEvqQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=eXojB0Yp; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c40397e746so13187695ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781448701; x=1782053501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=eXojB0YpAazp8Lr3X2NiQWsAHKauMpzM70r8rE9Ltex7+1z7iwd9l1G3oFztfndHno
         pdwLw3j3Thtewk7viM+wtCHSPljLdYsP5q51NoKWileNEn94pX57kezeaAFhC3a5tIvM
         ZFz4u9bdg14UZjpjgdys0gjZnJf3h1pswY/6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448701; x=1782053501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+DoEJx5niGEYDDqKxpP9EhcqDdLdwV3n1HbmZ+qqPE=;
        b=oGII/DF8iLh/6GVNz0HrbVRcHighgxRM6XVHK7vUuUOX1RtKkoCXmP0SL7jruOpi0f
         9dG0RE22oPm3TsrBzTlyx+7k+7A6BDEghqSVuGRdNSnbboXScnLuDdruxI64TkNhoHQ8
         W6mJDVRggaGodR+Tq4k2S4CwZuWNJqSucZs7VLY+VAI9EYuZJIXELahzAHxocG74WnPB
         8AS+tPJXNWeO9SBO19Dq1qs+JUrdww3z2vlNTaxI2JkfbOQCq0caHI7w8+SV+Y1CXMsm
         xGrS+OYXcfpe1TLyiyy74BIG1WDeXnmSVgVsDnPIKZ6lLd/vAOXNLFSFlBdmd5d3vN1k
         neUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rBcEFjLa4IR2kqSYvt0Ekmw0ELglgSiLG+skfmMfeCBynJUI5EzoCwPg48Wp1GpiB6d7jbcJxmD8Z6hKH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+keCsOlzaiAK+neE2M6/aPo2zHMrZO9Apy2+l5H50t1eQICRo
	d9oCA2AX+WkOBzCNRH3fkYoGEz0Wh/AZCFvEIEVWBH33v3D80vpjmapl/a9ItQwA5G8=
X-Gm-Gg: Acq92OHDIF2qKIai7bCH1JDjf+9C9VX9gIXYXoeQ3jSOAlfSBKNTfPaf2kOdLFqu8Yz
	1ucU1vGEalk6sFhK2IxCPZItiaEuqVtJ6I9K6aScJ8lqd7Fnk4MlMhmdhUaBJHZzpsz0GkikegA
	0Kq12bskXGlUXiNWSRlwLwU44lH/DD4S48FXBC4fIatD6DpjkI2cL60HdI5cjsRc7rERri4sz+V
	uLrpcuigaSEV6j7FMtMYjyT/tKiKn32mn7i88XcOrbPw/xVC4+dP2AByiYRxQklzSQXp3t3UtEZ
	t3b6ZqjF4gZwzmR7LjjAOJDOwgjRqlxI91MOyVj8Cb+Xuv9HclSRB/dftvunrgiC93zFdrxCsBk
	labxr7vpgvBytn7m5Xo35QKexp/U/4OqWHsYe0Qum6utNiZXV03UzxxWGRHL7y/1HDwFGP4xSka
	/9wqzWwtXkvMgKr20qeQta0hQpIUpGtglyorBL9IsgrhQOUIDoByvbw2ikxJwUdCQyCT3GGxwpJ
	uixCCDcrarrXoyo5cUCwU2cwk0ONDK9C9pFjThl1LqLZeTxnuOAjn61pnwkI58TRhMuOs6s5wis
	Mswk4XGnjzvwnLotWQBsUB12e7jJ1YgyjT3GiNECpN867UO2HtqcNkojsEhRCQ==
X-Received: by 2002:a17:903:37c7:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c4108f197dmr120914925ad.10.1781448700638;
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:c800:f499:6f6c:fbd4:8f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327acca5sm66746385ad.51.2026.06.14.07.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:51:40 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: "Bryan O'Donoghue" <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Daniel J Blueman <daniel@quora.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
Date: Sun, 14 Jun 2026 22:51:12 +0800
Message-ID: <20260614145113.84243-2-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614145113.84243-1-daniel@quora.org>
References: <20260614145113.84243-1-daniel@quora.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-113046-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel@quora.org,m:mchehab@kernel.org,m:stephan.gerhold@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DMARC_NA(0.00)[quora.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,quora.org:dkim,quora.org:email,quora.org:mid,quora.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E576681527

On X1-family hamoa platforms, the Iris VPU reserves IOVA addresses
below 0x25800000 (600MB), primarily for non-pixel buffers accessed
via different Stream IDs. DMA into that range triggers unhandled SMMU
page faults that cause spontaneous device reboots. This is readily
reproduced with one or more browser tabs driving multiple concurrent
video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000)
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

This applies to all current hamoa.dtsi consumers (X1E80100/X1P42100/
X1P64100 boards); other Iris-bearing SoCs (sm8550/sm8650/sa8775p/
qcs8300) do not include hamoa.dtsi thus not affected.

Backports also require the preceding binding patch ("dt-bindings:
media: qcom,sm8550-iris: Allow IOVA reservation memory-region");
without it, dtbs_check rejects the second memory-region entry.

Link: https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574
Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
v2:
- add Fixes tag
- clarify the reservation rationale
v1: https://lore.kernel.org/lkml/20260601041336.9497-2-daniel@quora.org/

 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..ce96e7f8d8c1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -716,6 +716,17 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	qup_opp_table_100mhz: opp-table-qup100mhz {
@@ -5479,7 +5490,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
-- 
2.53.0


