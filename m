Return-Path: <linux-arm-msm+bounces-102196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GtqMSQi1WnK1AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:26:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371F3B0F31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAA3B3088106
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE0939934E;
	Tue,  7 Apr 2026 15:21:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89621369236;
	Tue,  7 Apr 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575291; cv=none; b=XSYo358/oK44blXLW8XZKjlqBQkJChEM67cKQCbVUPCitWpDtqRuiik9pRC+L6+uujsmE8/eo7IRQUFrdS3+npf+po8A1pFB+hjRJAIR7ZPzzoSI1DB1ubREVdr4RZa3Nse8TTR4h3mVM7y0yQLeD4Op107/DEqdPeSbSH3Tc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575291; c=relaxed/simple;
	bh=QHLdEvO8FQ4G4cGQJMD/mGB68jnKuXN6laqiKTA5Zes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7MU3DeYNrpFtk5fAz6xVZoz+XjcSbtZa/bbZJxsCWnq68GoAWbarZhsdY0Vagy1lcMEv9GyH+7Kt6MpbcaprbaF29TuneAsdsrUYGPvrR/bFcCqiB9db34BkKJPhQgDMlf7U6ZUQ2gnWRbPEnMo27/QnaMfnlNPBenrBTpFxzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575243t2f0df135
X-QQ-Originating-IP: tbkMgbfCeB4FQhSSMFmmEp/PcTX49mH0I3OiS+eKH8I=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4562108539978265731
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:20:03 +0800
Subject: [PATCH 11/12] ASoC: dt-bindings: google,sc7280-herobrine: Add
 Radxa Dragon Q6A sound card
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-11-14aca49dde3d@radxa.com>
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
 linux-sound@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1026; i=sophon@radxa.com;
 h=from:subject:message-id; bh=QHLdEvO8FQ4G4cGQJMD/mGB68jnKuXN6laqiKTA5Zes=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZYe3Hxx76NZBmkTtbYlH2iyY2b/cNO+2l0y7pyk/
 JVbEtPiOkpZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAExkzlaGf+p/tKMLVY8+8vjo
 zLfv/so9hmGym35cV71z6eHiivULdm5hZFihskD/DAuXzlHWM4e/yfsd/xFfq78kaRvbH4dWee6
 cbbwA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NlVgJxuVJf8S6lRLFlck/gKViOGu7ntJaKgqQBpzi5M9vmqNpGKv/n/f
	y4htQKwnEkKsUB5jfiKcDakKIxYN2L6lUVa+h7iEfULXFNH/hvB+B9Of0swVZHwsYU9L3Ac
	ZQpRHxPxTspr2YYMghFDyb7rXat4+YWirOlI/VTCGFANGeCm+tbWkfEWmSgLvgEP9kSjNG/
	nrrg9wnCdYT/dv7ah3PxNurtCfWOJbczasc592GYwbBnovuuEh5K+Sgc3zv96b4a6DOiJ6m
	U5AntAmNv3me9Um4E7XVSTLZSaSvpxvoN4vWF6jaWXrbvsl555Ltcyjm92IF+HbDi6S0ju/
	calktI/3q08uS/E4nmkMnxIn+tjkmJck6KrFDkPEJkJlC2e63hnsmRYsPbrbo4ID1FcCC5Z
	sKYBQUGy44rGgz5PhM9dhYDU0oPpaNn765UQsYal7cHGDyuVjwOsjGcYvvEZG/vJWraKrvl
	EITBPoJ3Ensp9gh65KDAoO2+kSuGaAsF+pyzNRVkEfjyNz02U6ON30b81oycn+FBpPRShKD
	CQenJNdMU6n7Nw49RQt20mT0BOZVbo0YBxIIdku9b1igBiOlJurdOA3VxXMLM7KcNS1Jl36
	QBqHjQQ5g220XuL+OSnaNpyoyMFrQSlNkfZhO5u1UaS1R1/bbuOjHhEKv9jbyShFpXuo8/s
	uNN6HH6gd73mwECzrn/+CPpezaAJRXeLbqar13O5mY/Goj3X4XK5hiXRrafZjliORPvID62
	XOD9Jb61LBm+DAQrPyMQIuGizNNQh8hO4OU3JJSm1+nO8c/9IcPn6k04CgPTT9VB6KmOjTm
	KN2FYS2OeDKOluDnKUvjQfwphy5ALz+dl0peJf5ggQAFMqojtk4DLjhW9VM6MptIbSr0GVn
	vrlpAYNA70428t1l24NCoJb7BrXZTnNg/AMhXjYyVgKrBFgyuVctlLwj2Lc2rAGkO1F+s/R
	3BEuPv3RJG3tdQw9BJTSFW6LDEQf+fXO4xKMJA2qFlg1osaDO46s8+TixDsGOB6r9bjL46L
	U4ZD1ItreJItPGSSFBs7S49FOyYEmpSK9rGNq31zraT+f1z5eFglaabaYUC7/8SWQRz5kRS
	g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102196-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.763];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: 4371F3B0F31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Radxa Dragon Q6A can boot in EL2, allowing the kernel to access the
LPASS hardware directly. Add the compatible for it to the bindings.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../devicetree/bindings/sound/google,sc7280-herobrine.yaml       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
index cdcd7c6f21eb..cd87dfe20618 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -17,8 +17,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - google,sc7280-herobrine
+    oneOf:
+      - enum:
+          - google,sc7280-herobrine
+      - items:
+          - enum:
+              - radxa,dragon-q6a-sndcard
+          - const: google,sc7280-herobrine
 
   "#address-cells":
     const: 1

-- 
2.53.0


