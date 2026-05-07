Return-Path: <linux-arm-msm+bounces-106455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHB3FXmp/GkNSgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F1E4EABB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 17:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC4AF3028B0F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BC93A8752;
	Thu,  7 May 2026 14:54:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301EA3D9DD3;
	Thu,  7 May 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165698; cv=none; b=X0tfJIeuzrfYS9qmXGVeXU+fx5s+VpKztizDGcz7M1IUtCxdUBcBG/SWwMY2pPAKRgYWg9ra6agHOIWAZvbPjD4LrKjOXRmzBngt0iyYVNSYqm5V0TZavrqs6ASXgiyH7xpF1K3S8IJAROdkWL1dS+R4onZ0Ey6BabX8L46XMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165698; c=relaxed/simple;
	bh=JgpE2FZr7UdBAf9eoOxjAq+hI7oRNJrF8LcutvkBRxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=snonvrZRgOAZoUKUHsuptYQCVTFN0HAJ4/3WzVh/W1ke849SU6ySbOZtjO7rSGdEVc6BjAPHqtQqA9vW8+xjOlX5pwa1c5jGS+TJAOCLWXczGcAafO+9+7It9b2X9Alhx8tmkiQJS9Zd5LLb8dXM712zjeATRH/6EVXS2B8VXLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz16t1778165666t316a73c1
X-QQ-Originating-IP: Gy28tCDPTPT3g/ORMayawwLKqFjGx7K6DYD4mcXt85Q=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:54:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5557901547395144661
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:54:22 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Add missing
 qcom,non-secure-domain property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-non-secure-domain-v1-1-b6f75783c831@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvI6qbTXxEPXZtqBNPROBmM/
 btVj+/yVjAuwgbnZoXCbzHJWtHuGgh3rzdGidXgyB2opyNaGNxAy4SaFY3DXBhjfnpRbNO4j8l
 3fXciqMFUOMnyyy/Xv20eHxxe3xG27QMtY1QefgAAAA==
X-Change-ID: 20260507-sc8280xp-non-secure-domain-1fb3dfa45490
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=sophon@radxa.com;
 h=from:subject:message-id; bh=JgpE2FZr7UdBAf9eoOxjAq+hI7oRNJrF8LcutvkBRxs=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/li8IPbPR7t4ev78s+ks8UmRb7KMOXe8qmbjKY0e5g
 oibgUlPRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgIkkKDEy7JTae/zZfU4tzUyb
 c+8W8p1fX77S75jF7908rM7f/xdKOjIyvG0y0mU5kN9rovB+14V1adp7vjrZcPXPVznQVLHEqMa
 GBwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MoIKForzQxXwVgfzlU1iihKlO7+l8rL6M0kyMJFbrUOjAk73/2aPA3OK
	VjDy2wWmhL3siExtCRTLbXfwn83aJ/o+DEqjeG2kWAL4awpI9MyPzLx5tDYCWNvenHgRbDN
	pcvSIRcBMfc7741Qn5EnNSsstGUYDQM8KWYh8VKQL3WxQJex9UqBLDZkjYBBtkrsph4itKH
	HrrdTK6aB05f+/uiYNO5ryrrQk0SEj3AQzco2I/58Hm6HvtV5qxzFuNtkvUUQS2zHt1lj/O
	YRQtI0PlVv+1k8mfc3NmuawV1m2aq29kc4kqvFeNUtS/4a6wqABIwrKZ1vrkXpkzYXpoxF2
	UVMSPjALwdZyXVkceZbCwQMDRn10keAmHzWx/5Hj4Wn3RsSUd9FE4RSVZtKabWevJUPqcA2
	lQXbVba7OOVHGS/BlNriZLC8rCMYnmMqcZiJndKW5DhVhtGRw1hbvIB2HTAKYv41foGVPUR
	lCvDsplEstMo/VtS+EpdLBnIaQ5AIg9d4MxkX1F0jYqWKvH8eo/upie4OQCCLNXrHn4K+VY
	furcy1IJQvyFkK6XLegl2dvxPgqQOg461zMZ2ZzwmEQdeasdTPMcIQXu2C7Kl6KG8AlY1tA
	sYLGCA/Ml0B0K4GvrLM+n9qZXK+Rq/M1o4MF27mSHWp7T9PvVmye96z5tEuwQWvXgUI1R3I
	i6Euq7RYzoshVm3qQaVOP5013urzIBVKaGT401atmd0xyyMT5Gu9gePPHSV7tkbpRlawpUv
	8sQIgwlO+WANGd3a7AnYqXrfHXERQzjc5wdztf6fFM0yEAQ6lIs3aRVIKaGVHxrYChvEmd/
	zSAvgtuRTxCCTdKa7QJnSINGoZtWuWggC1dc9z/0s9XFTdNWP6vTWsgfkSsuFXsvxtj4lqQ
	KqcMFFwHuBVXS2hHRg8Ien9iV3DzO8XtAjW/Ogfz/Tnagxd75BZvHMhrqcX/i1t0Retaonr
	m1vonWnPcllv5QnsfDghuzYL4gkJ9PIbbMT7cDg2RKYdJt6Y4ZTiGuwcU6mCx0GjrtB/JTZ
	V6WNwLopaBRPdeHYJKSPYczOxqK9w=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 92F1E4EABB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[radxa.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Action: no action

By default the DSP domains are secure, add the missing
qcom,non-secure-domain property to mark them as non-secure.

Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..d767a71c8724 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -6022,6 +6022,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-sc8280xp-non-secure-domain-1fb3dfa45490

Best regards,
--  
Xilin Wu <sophon@radxa.com>


