Return-Path: <linux-arm-msm+bounces-102188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HMYEF4h1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:23:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAFE3B0E53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40B153065788
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEDC368961;
	Tue,  7 Apr 2026 15:20:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D8366801;
	Tue,  7 Apr 2026 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575236; cv=none; b=BOBA0vtn4n87w/ZHQGV6jLqOgqT8u0nNwJp6by3otf17Vw6K2+eOA3UfNhrIR4L1FDY1kdiMwO92by3N8yz4FLAOKDeVAkfQODHMszUFNwpxhdgY8T/sFelMOfasDCIa9OeCOEl/6ULUbwE4WwaFj/3nJVqnj+BFnRYpzzein7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575236; c=relaxed/simple;
	bh=gZIDPJXCd2OKoiDrsdq2C0OmShDSXXyeLWpo2UTbqbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBkryubaCkwsyKaPLp2re1bsHwiOCoTc5jB51ye8OuvHfvcoeR4E3XIkobYDR8cJM2FK3luYi9W+nt2mrMZd8WJADUjXVgSo93h2Q/EyosZjIGTptIrsSiYZpf2XG6ziApMZ/kBdXYR7mdVJ8c4KpmsnLDaH2XsqoNLFCpgF3Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575224t26e27e89
X-QQ-Originating-IP: YLk3j2mLUD9it0PLySigA7/5az4KFHz6VdieAD1dYfk=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12957080877815707243
EX-QQ-RecipientCnt: 15
From: Xilin Wu <sophon@radxa.com>
Date: Tue, 07 Apr 2026 23:19:57 +0800
Subject: [PATCH 05/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Use
 board-specific CDSP firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-5-14aca49dde3d@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; i=sophon@radxa.com;
 h=from:subject:message-id; bh=gZIDPJXCd2OKoiDrsdq2C0OmShDSXXyeLWpo2UTbqbU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFZY0P3L/e+f0E42UtcstW1cFf5j6fNa+C7dYeaJjb
 ivyxdu/6ShlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjARtZuMDPfard51bnhrKf42
 oqBBcYpaQwv3hvqHnHfELXL+1hXrGDL89wzbtuzvHneruAvlD8V4hDdre8ifvta/7Yiyet3e57Y
 /uQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N62ltAQ19hpBN1UvLxKtQ7dXIk9dUS1uurmYKnGq4bG6r947muKrZ3yQ
	YMtw84RAO5qXYqD4A5sYMhSjpn98f8cxYIKlRBfU33gOFnC1bHHUBdsG2mJE1RvgFfwJHBj
	kuo1HG82+KBWlWeBYw1qRX3VmtfIElOpVb95JMgUv3ortz0YcUXNO6dGDUcRmwYBpWmhfX6
	VUzD73wyr6YmiRh/6s51IEjWMK29PzsgXzoXf2xjbMZalfgFcgg1mryUS+QxPaUD4VK5npK
	9JAQu74L4EnhGFkSH6+9tAs8gLbM7wkDvvQAonfuLI4CHUzVG1of2zalbdCOoDvmkUNGQsW
	lfvljay0SBC8crcyiF+jA7utao3rpfSOjyhD+uqTNoVkXuA+mYEB8eThmb+ocVdZlk7cU47
	TxjEZhMliuP/bqOMioB+oTGQ7lYicxn7QtYHTlK6ihk1OtO78sVZrpoKpYJDaAwy4TwYkKU
	10w5KUApzZIVW36n/dIRNsaUxBKaDzM1wvZi8vlKl4O+4K4qZnIyyTcg3zCHZR0sfi1FvQ0
	6QAppbWs2iOKJEDrpO4HXorE+F+OS02aBQfSX3523HbIHCzOPRXmaKBh4IlxFpvsBIdRJ63
	JpcmLmF8HPfUE7VMQTEnjogOWmmt8Cp3+ED7+7ygW35BxLUAH6ayPQFCzZ71iHsSSTI6D/I
	UZ7dU4GYc5mM5zgX7yUJzWOgptQb3ZF4FZ31DK3JKXe7lO79OmWsbHeJXmfHunfmZT6aR5d
	HdZPmuEivGkrPqWB+aqQn29wb94VGdZQ7TxuzNareNMy7ad7TbGBYwiK7lh1lKtwzJiaF5m
	Bfgw7ibSCP7s05AIYhzqv/SxHQRfwTyqXTBXefTDqr8U/YakQeGiiMMy+mRphTgFbjo/BHQ
	hEG488o9gXgDNkWYAB0/gg7fY6RyP5He3kW4loFg/OkFe+FB0zEk9zuUlX3/KTCvw500Me/
	LZdqkUY0luEXcx9Kp4wxhSLQREoawZyCPSifau1YgTThbnYctTEc50vRxhF7MTFVIc4T8g4
	KwFS+/gbZKH2vMHHzidTMz2fT+pCgEiYCX3S75PevBbx7o/gVZe6VOs9mSFb4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102188-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.855];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.com:url,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: AFAFE3B0E53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The official boot firmware for Dragon Q6A has been switched to the
Qualcomm WP (Windows) boot firmware. Use the matching board-specific
CDSP firmware instead of the generic one so that the DSP firmware stack
remains compatible with the new boot firmware.

The corresponding custom DSP firmware has already been added to
linux-firmware:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/882

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 8d649b3a1cfa..91f1b4f57915 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -783,7 +783,7 @@ &remoteproc_adsp {
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/qcs6490/cdsp.mbn";
+	firmware-name = "qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn";
 	status = "okay";
 };
 

-- 
2.53.0


