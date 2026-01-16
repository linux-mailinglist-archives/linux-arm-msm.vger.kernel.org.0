Return-Path: <linux-arm-msm+bounces-89458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6434D38543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 20:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B05D730727F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 19:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251F52F3618;
	Fri, 16 Jan 2026 19:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=quihel.net header.i=@quihel.net header.b="UU7HpzdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster3-host10-snip4-1.eps.apple.com [57.103.77.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207062FC037
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768590176; cv=none; b=EySmHQsMcSE95m43QPfd+PP8JeTHJQkcXo4kc7yNy2Qdq2d47lLSAjfRKR7hxPVJhX2+msQ8QSx/rz+Iv0dVqkbhuP5CLn90az+0eCIyFczDDoJHRpe/MMNQjjUqkmzw/0rGiLZXtsg+9wcySjcAH/jy9LoqXmWS2TaektRenug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768590176; c=relaxed/simple;
	bh=BgK+Bjim/DlpHgAXpzUxBL4NzTEndCMOdo2mCKyxBTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oo5Jcw13lQgMjkhpJ57HCT+2EXP9X1na+wlDWfimxVNDHzNcmHoE2F50Gjnkv00gWeL4/p0j+SouoX58Lp9MnF16xvDtxb823xPiZpT2nc7UZiimvNCQmj5S8Tq+2imHqiu0uRKBcLmdtr8VTa6myk/Gn83y2rvYHI3SgMbT9aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quihel.net; spf=pass smtp.mailfrom=quihel.net; dkim=fail (0-bit key) header.d=quihel.net header.i=@quihel.net header.b=UU7HpzdS reason="key not found in DNS"; arc=none smtp.client-ip=57.103.77.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quihel.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quihel.net
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-15 (Postfix) with ESMTPS id 2875018001BE;
	Fri, 16 Jan 2026 19:02:50 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quihel.net; s=sig1; t=1768590172; x=1771182172; bh=vu9C0yVhsYlWDwNyOkhSaq5/oS935jwtYVgPT8F2cUo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=UU7HpzdSF01BheOYhddXCIrj74mu9/m3x3sTUvf0fpa7V/wCvB9+fVGM33XVqJRHL/uMVzbps8zcoh306kvAhfn/K2YDBsXK/gcTBrRajqyiOn8UyXYUjYVbGdwr1D2iTTBfvRqNE+YgXo7VSyddfHw0KNF0xrpmcBBks98z6uKhSTLB1dkBXiGv1AiIyyPQbwbWD3ilUY/azp4eHya7weXxvuw/DzzGNYPOG1iOaN2rlRqrpi10aztUXbGEwI4C5ASM55LEbU65KOMENaxbW50Agn6TGpyEexBB7eKRPR54TaALqsJI/gCH47nqDWUTXYkooyLe7BWIOZzPw3GGlg==
mail-alias-created-date: 1318565135000
Received: from thinkbook16.fritz.box (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-15 (Postfix) with ESMTPSA id 261C01800181;
	Fri, 16 Jan 2026 19:02:49 +0000 (UTC)
From: Alejandro Quintanar <alejandro@quihel.net>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Alejandro Quintanar <alejandro@quihel.net>
Subject: [PATCH] arm64: dts: qcom: hamoa: Add 1443 MHz OPP to iris video codec
Date: Fri, 16 Jan 2026 20:02:25 +0100
Message-ID: <20260116190225.25320-1-alejandro@quihel.net>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2mR8Qmd8UvGt1nIGc41yZcaEXWdU3X2y
X-Proofpoint-GUID: 2mR8Qmd8UvGt1nIGc41yZcaEXWdU3X2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MSBTYWx0ZWRfXwiW3tfWlovZd
 9sh+aqfsb0Hl4NTU40MQ0b27kqujyvugjgEwp2JYozawrj2+5jhvByORvaPwdmquVjPxXv51ga5
 7edGpQPiAkXW21QoGySff77rl0eKjMzjj5xBoMjYrghBfQKuod0A/qnMUXcDooUQND76FCm5kLh
 uKBiVBJDRSVanjiMw5hMZe40iIg6E5HVVbRdfZfo3+X315++SNuH6RVfBJMqvbmMpQOhHen+dAU
 71D3UcdxSntisaGRoaNhBGveTuaESioC1uyQVTXyJzNYJNLu+wa4wILr9D8mpIjofgXMWwG7W1I
 6NESSHMP76Gew0iQE6M
X-Authority-Info: v=2.4 cv=TNZIilla c=1 sm=1 tr=0 ts=696a8b5b
 cx=c_apl:c_apl_out:c_pps a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CIKbnwSMAAAA:8 a=Svh9S__hznb6zt4YfpoA:9 a=WAq3Gk0LTMTrdeoBeQ09:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=840 mlxscore=0 bulkscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2601160141
X-JNJ: AAAAAAABMJwocT34ZyD6lJHXfUGSVc7cYb6GNuO2xD4PneY4pK/39TChSyObOz2BIjxogmDL6t+ceuGpZB1/S0bMC4BQhnfYHs9Hi4jxRazNx0XeunjgP20w0wrgSusEthsxd91+NJf7DHJf1wn4rTk0jKs0TtZU6sHePC/buQvR8rDuYBPLADnzihogXrsl2T2ahVq0UbZ+JIEz32kmBlRdN5YYvgaJiDWm8Fcz9A07dRWKB6H32kZAusK/7g4fCgelOo/wDEj0ZSybyC4faWkFv1A3ki4p+5LXkjjVuagrH4T6Ht0rhwc1T39gEX1YWVsamUxVSdnO9CCdPuzrDrYrgPJhQ60N8OIWrAENN3YP2ox0+HD3DUEsnXpWe87ds7njnG/yCLrqKeFDr0ckkkXaDIzTQzpdGk26+o81ow+a0YwJRkdbcPFZN3BECHLjcXB9WZhXV/7rktNgykCLD23TuOyA9EjpZty7hUqs81siHDjpbQ6LJ0ci5BP/jo7XpkgepwwKJ6yaCI3Iqw+ZPX0+nNyU/zA/qtuuqH3vaGiqdmvh25xPN+HLXl4SKXGhRVmT/MfAmPDeAehhh2Q4cIzJ0j9ouQ0mceb4N02KjCz4NxtEqUoM7FeZ+Aq1DNhsfI++MDw2KXioyg==

Add the missing 1443 MHz operating point to the iris video codec OPP
table. The qcom-iris driver requests this frequency but fails with:

  qcom-iris aa00000.video-codec: dev_pm_opp_set_rate: failed to find OPP for freq 1443000000 (-34)
  qcom-iris aa00000.video-codec: power on failed
  qcom-iris aa00000.video-codec: core init failed

The iris driver uses the sm8550 compatible fallback and expects higher
frequencies for turbo modes. Without this OPP, hardware video encoding
and decoding fails on x1e80100-based devices.

Signed-off-by: Alejandro Quintanar <alejandro@quihel.net>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eac..e737ec907 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5397,6 +5397,12 @@ opp-481000000 {
 					required-opps = <&rpmhpd_opp_turbo>,
 							<&rpmhpd_opp_turbo>;
 				};
+
+				opp-1443000000 {
+					opp-hz = /bits/ 64 <1443000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
 			};
 		};
 
-- 
2.51.0


