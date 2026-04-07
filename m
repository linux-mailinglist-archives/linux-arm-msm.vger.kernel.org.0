Return-Path: <linux-arm-msm+bounces-102185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAh0O7wg1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:20:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933323B0D67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0775301E012
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC8B3644B3;
	Tue,  7 Apr 2026 15:20:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4936214A;
	Tue,  7 Apr 2026 15:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575225; cv=none; b=MuLHJtUocNkW0YSZQ1fj7InjE3rC6roaGtGwgbyyxMs8seqZNecDtyr9qGw0Hf4kUM10ZIhJGfUpz4cxXgHODss+tPnH0uX1B/wbRnX3RMjT69nDWx2F+CMGmI3fvHUtRyhTTMFcU2AkkO7LkIdj3K++6YOF3vYAlMQvthxd7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575225; c=relaxed/simple;
	bh=TFZm2PuYmP6/PLvHrfkCMYgXioCrJINEODWu3DtgSKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EjqvQ/1nMD+ORhnVv/Z0MlofRX7wcDyT4u5cvt/cgho0xHp/MXANDWPD3KO2Z99D7ArOZe1LSmhibQcFUSDYQBKTSelnrZcu0pCkR6ev76AXf5bmePondFN0qs8Ntr/Ub/dXsYStSH3/W+K1TPQSTVUKFp+he4njnkN3akUlOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz19t1775575208t700069cc
X-QQ-Originating-IP: JikAKw4wJAFpnUfhSiNwRT63VoonTNpGYI94+oAbl1U=
Received: from [192.168.30.32] ( [116.234.14.100])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 23:20:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5474708016407073548
EX-QQ-RecipientCnt: 16
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH 00/12] arm64: dts: qcom: qcs6490: Radxa Dragon Q6A feature
 enablement and fixes
Date: Tue, 07 Apr 2026 23:19:52 +0800
Message-Id: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDsQbYniVaSLiU50XETNRCmId
 29slx+P/52gHIUV2uKEyIeoLCGjfBTQTxRGRhmyoTKVNS9T4xBpXAJultAzJfTyYUVLT+Oto8a
 VDeR2jfwbctq9/9bdzdyn+wyu6wtbg2QfeQAAAA==
X-Change-ID: 20260407-dragon-q6a-feat-fixes-6a30f6ba8b18
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565; i=sophon@radxa.com;
 h=from:subject:message-id; bh=TFZm2PuYmP6/PLvHrfkCMYgXioCrJINEODWu3DtgSKo=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJlXFRYXnti6iC3+9Ff/FQEFMQIX8/Yu2xHz4sRKM8dpV
 +82qL/07ShlYRDjYpAVU2RRiGeYy16Ze+2pWKkezBxWJpAhDFycAjCRnrOMDF9/i+R92PHjo8qN
 gDjJSqeGi4cO1OjdnbPcU0ucVXH9SQFGhlaFrm1zlbweyiT+i9rDUrXN6TPvlKQtj2etm8avde5
 DCDsA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M0wYV6TTeeWiLpDlW3nqxPhUqiSRn64Q6oDiFfgusY/qN0n4s2AB8JEX
	ee5RUU/PmF8KFgjcEqZWGmO7j0zdgluuDb2h4A6PZ61erebXFmiOWaE/7JbI5vbu5cyaovQ
	st228GBXIgJK6qXzwZQinVz169m5vUULsrrslUYr3eyKs5ef5EY1qFVBQo100BS+19YM1oZ
	BQ+/PC4uO8FigxtS+Ni3nZGcqzlJ4+9JYsVedAS5J2JMIfU3v1zs21cHZphmQHPeHYgipSF
	B3nhHtLK6gVQOb0+9JAzYxelms9cocUqrZRUEDbxPEjFkM0li2PhtdHO7RnVKUgYMwjgfeJ
	D1fugJQb1scUeNL0BkLszCu9nM7++sgh/eUcopm9QSkuK4UkKw0AcQvyC74NpC2mcnW8Szr
	SECS9GmGZ7JV650rpY8Pt4ZxKcGIKONE67LSn0jQ+7ncPJ5Wb1tfEe0ETVH+NNRRLeQ9cE+
	slkrLo2rjMePRSV70YHFIjIWEj9zR49X6yqDK6Ats8W7zZuQZ+XFDOlGsPZVDikmjPLgLw4
	3J0fO5wJ++XDg7hGBEsdkv2pZQLWh7yrcJMjpXuQPsp3leFsgaghb4jZlRbMtv+jhhTGpBf
	z5PtBwRbi7gRzsgsi+4+DFstYWlG9Yc6ExDk2cEjNZINsYcfgkPc2BXvZlw9D/UbguFK55Z
	n0crVnX8iW0vW3dNEvhYVWhrprYKmCSERwDLA8w2ZuktW9HjJeoUldaVMh/LJVQekoG+8ol
	SH9rT3q7N5yYeQx+i2I3KsPE5Pm5L8XNHS3v1mdFfiEmDb/Fe6iG5TqFWsCWQvRNFMucQjZ
	R2hvPYrpUsSIiW8KvskbFRUpFqemdfOdbv46b1GA0VnTwHFKztsk0dX5BTlbCD7GYSWUoc9
	RW66ENOnK7SUNygnJPhaUYII5eVEXgrN52yoJizFRhJGBloOgo+JyodDgab/UH1YpcvJU6h
	FTFsi8XetnEHckdqNhbfLf8P5nPz8KfursfNUEGaUVqfOQPjY1Y8n4ChjNrPjZDuSrpe7SE
	SobgcMPT5tUgnR28EkLnyEpm71X+YWnH50cuVJuQ==
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
	TAGGED_FROM(0.00)[bounces-102185-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.779];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:email,radxa.com:mid]
X-Rspamd-Queue-Id: 933323B0D67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series brings the Radxa Dragon Q6A (QCS6490) board support up to
date with the latest official firmware and enables additional hardware.

Fixes and alignment with latest firmware:

- Allow QSEECOM for UEFI/efivars support
- Align reserved-memory with the latest firmware memory map
- Drop QSPI node now restricted by TrustZone
- Switch to board-specific CDSP firmware matching new WP boot firmware
- Correct GPIO_27 label

Hardware enablement:

- Enable UFS controller (Gear-4 Rate-A)
- Enable USB 3.0 and HDMI (via DP-to-HDMI bridge)
- Mark secondary USB controller as wakeup source
- Add I2C aliases for CCI buses

Variant for LPASS CPU audio:

- Factor out common board dtsi for sharing between variants
- Add dt-bindings for Dragon Q6A sound card
- Add LPASS CPU audio variant for EL2 direct hardware access

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Stephen Chen (3):
      arm64: dts: qcom: kodiak: Add I2C aliases for CCI
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Correct GPIO_27 label
      arm64: dts: qcom: kodiak: Mark secondary USB controller as wakeup source

Xilin Wu (9):
      firmware: qcom: scm: Allow QSEECOM for Radxa Dragon Q6A
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable UFS controller
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable USB 3.0 and HDMI ports
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Use board-specific CDSP firmware
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Drop QSPI node and reserve its pins
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Align reserved-memory with latest firmware map
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: factor out common board dtsi
      ASoC: dt-bindings: google,sc7280-herobrine: Add Radxa Dragon Q6A sound card
      arm64: dts: qcom: qcs6490-radxa-dragon-q6a: add LPASS CPU audio variant

 .../bindings/sound/google,sc7280-herobrine.yaml    |    9 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |    5 +
 .../qcom/qcs6490-radxa-dragon-q6a-lpass-cpu.dts    |  131 +++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 1047 +-----------------
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dtsi    | 1137 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 7 files changed, 1300 insertions(+), 1031 deletions(-)
---
base-commit: 816f193dd0d95246f208590924dd962b192def78
change-id: 20260407-dragon-q6a-feat-fixes-6a30f6ba8b18

Best regards,
--  
Xilin Wu <sophon@radxa.com>


