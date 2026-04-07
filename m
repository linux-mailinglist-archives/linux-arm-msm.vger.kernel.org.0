Return-Path: <linux-arm-msm+bounces-102192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNeoBD8h1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:22:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7DB3B0E21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB0903038812
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AEE370D73;
	Tue,  7 Apr 2026 15:20:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0C369236;
	Tue,  7 Apr 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575244; cv=none; b=ZrrPSWX2ny1UO7uIJ/7DltmfXqPFfGUvrPc8SfyS5KD29eiw+Vbjg//tYVnbfiwdEwI3cKcqJQ3ZFfl3vsCjRe+hUYwx6mHj3MIvAOL+tgMhP6ltyJ3gGoNcCs2pL5BtQ0pfTUrUcRZGnkrVS7ZlJKY2NZ5vjYtD4Bpuf1Hrj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575244; c=relaxed/simple;
	bh=dZ0W3crIv2VM2i7FwnY+eaL8nfzHIiIMpSyWZb4mzRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXZt9swniX3+QxlzLLpJXaC4qLpRIrbFr1A5YTXh9puqhsBDEBsOrMWIu9rNFjL/kvUTQzr/CoLa9BQ4xRVYXP9NK2YxKXrAf0wd8i0GOqyQTxKEKnic3MrkijA+UXFvR/xreYhvgXRSOgUk9zmv96lmJAEAUiqRu8/YA3Tf4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575230t65590e4f
X-QQ-Originating-IP: s7C9YY0GkcLG2+RO5lXB1RxkJTAyQKg14f8A6WgXlWc=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5371476590089596179
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:59 +0800
Subject: [PATCH 07/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Correct
 GPIO_27 label
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-7-14aca49dde3d@radxa.com>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>, 
 Stephen Chen <stephen@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=sophon@radxa.com;
 h=from:subject:message-id; bh=9OBnu2yMm4Es5sevvbv4Qgq197Rbtmk/nKpeGZFfIdI=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZbO0/mz49or3tmLpiXt2bxm7fMdlZ9ty10VJmkLX
 MpkMyjZ2FHKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BWAiRZyMDEtvv0vJqHn/PCVj
 E4d1RqlMUfxT68c/Pwr5XU05svJDcT8jw46Du1eWCL5Wnz7rqM7yE/8ftmZapp15x83isHTNome
 r3nMDAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OdxngZb53Esr4WrFcemvpMQt28Bn8c+JS9wC3MbBFYExQgX5AIlKwfej
	mruGHiQGfm0RjCqYfy+/1EG/BIclDv4VsjUXMWpUMxhrskJadyNT+U1gvB5iKH8+GPvggCw
	wnGxGAJ1JA6teKezGA00XchBYRfJq/flfB2eKKG1MZPI90H8fX7f8zGFkWVrZqf3Yj57g+v
	KcW4RXn8KDvtbwo92BavbUEtAlN559+HthRdWAq+ha5TJNv04mXXexeborl83D0Yq1d/Avm
	HlKbTX7DSTdETFiKzimBVsFpO4J0NCd0LHn+bi22/LND+R64Yg1Nc5pd7BW/r/ophyDMMZA
	NJ4UpmxLZy8gGhNUmH35p5qj6jZwH92hWwk1lZXdFyouaZiu5W3yO6oXHf0Qkva1G+Jy3Al
	iEPVtbNt6m5RYuF8pnnuCxiEIBjx1PqpX9UFlbXJ3miLyBzMQ6EQjOi1kWwWIdeI4IOG0PT
	9r8cI6/zup8h1MQRtfa1IP4kIF/f3+iF2yebWxe6IjmjzwG6sS0l8VnNA4QmK/B+apekc7C
	cA4zi11lphA+kdQTV7ZulIE7rPh3r9kU4GyPCrxKxWdMdgXg2Vv2pE9vr54GYc6N9TuRPkU
	70h2zo5eGJ+qd/bPKuYtpXiDio3Qy90bX+Jc64BLeL2ERNIMBbX5XpP0mhq2SiSC8oduHE1
	jQ3a6nlkvmCCOaDAneg6Z9biv15DLRyZ3HRE/PcntFF/Zw7RgaMM+zkq8MWygia1jXmZlic
	OKzekAZ7skF9dGTVi+SZ3e/xmJcvObm4f9TS5qqcjhpEOp6CYtzaAbMFCd0WQkoXEBsosNM
	CTCwy0dUfh16SBqB0YYvEzo8aPK3J5ZG/dQFxHPfIIfXkz9jvtbA05McsovwKWtKW1ZQ2C5
	WgjI87oAgqCoran26OggbLov2APac9qm7cFTmQI3aCThCQHMVqdQ2LFQkxfw2C/3qDRjFHg
	kWcz+ijlXnr8u0iWiJJYV7TAPu7OKspdwbinu3pL7ELT+OFJ1RxtGMcNniufTGHIO7gz7QJ
	lcEeILrwunt1EPBA4Oz/sC0FAAj42dI5geBOw5UXK1NgTbz+efEk9jM8dUQ05hUYL6f1N4h
	CpHAv2kK/bW
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102192-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.856];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB7DB3B0E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stephen Chen <stephen@radxa.com>

The label of GPIO_27 is wrong. Fix it.

Fixes: ef254b12ec60 ("arm64: dts: qcom: qcs6490: Introduce Radxa Dragon Q6A")
Signed-off-by: Stephen Chen <stephen@radxa.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 8d6bb4b0724b..fe3f60f8ed5a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -905,7 +905,7 @@ &tlmm {
 		/* GPIO_20 ~ GPIO_23 */
 		"", "", "PIN_8", "PIN_10",
 		/* GPIO_24 ~ GPIO_27 */
-		"PIN_3", "PIN_5", "PIN_16", "PIN_27",
+		"PIN_3", "PIN_5", "PIN_16", "PIN_18",
 		/* GPIO_28 ~ GPIO_31 */
 		"PIN_31", "PIN_11", "PIN_32", "PIN_29",
 		/* GPIO_32 ~ GPIO_35 */

-- 
2.53.0


