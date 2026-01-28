Return-Path: <linux-arm-msm+bounces-90963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N3yHkDweWnY1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:17:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4EA02A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D90613048DC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949403451B5;
	Wed, 28 Jan 2026 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="BeA1vlF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49224.qiye.163.com (mail-m49224.qiye.163.com [45.254.49.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85812F1FD7;
	Wed, 28 Jan 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598993; cv=none; b=MhrGg+ZRFuZqe1G8cPtrV7IOuMOgjxJKF6katTSMRG733XX6IKg1dItSk7iWpKh8d183ZJS7SlJm1Nm1UjpUnlN3CUGv45/bm75OHGol6B0S9IbCf7rR0GHA3yB+v7doKNNJ98+S7GapxsS8hIkZbnJgxLqmAk/0iQ+fe2JV+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598993; c=relaxed/simple;
	bh=bWCcXGTVHme5M9Xo9Mhld8IO59/ow1tBHDxOuIGfUCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBcsDhurdysh6c2i7onemfBjEQI6f0lhsBrNqEEE+Gybyfzx9E1bWPa/kVGr1wN88YCPzrJgGJxH/BcY+R0DtdJiPMG8xFAIzWrahRsrPiyluIlsRzkdqvzg/H7Z2gLL43DEMKFphQTO2uKNhi3sjCpDTcyOPvVZGW2XZWatPxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=BeA1vlF7; arc=none smtp.client-ip=45.254.49.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3248e533b;
	Wed, 28 Jan 2026 19:16:20 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 28 Jan 2026 19:15:47 +0800
Subject: [PATCH v2 3/3] arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI
 Port B
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-rubikpi-next-20260116-v2-3-ba51ce8d2bd2@thundersoft.com>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769598974; l=1148;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=bWCcXGTVHme5M9Xo9Mhld8IO59/ow1tBHDxOuIGfUCI=;
 b=7F6pvzeVxMelhJa932UiwwwXy8Vf7emQFiGx8M1BVJVzBhXpIAWiHgvR6sJRbxVe0Skzfb445
 8TfTiC6uwfQB2q3X9aKz7Fj/r9AApa4ix4FiRyL4w4j1OAvaLzn+ojH
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9c0451922d09d5kunm18b1b2c5170bc1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxlIVkIeTx4eTBhCTkofTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BeA1vlF75cGR5B4WaG64burB4L/yexJIk+mK3ZQG3ydZYGpHVo4cVlZjsePcCA2POwi71BZv4r9SfG02szyD5IN5+xuG10UvasoCBJLOll2msegIKfSh2RYXYhk65N0ue/Efu2N/efiNfBPx8YEH1/+Y7GHutEgAZb9u+6diLAM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=UTXryoQsVsCPG4vVLUPCR9UG+SNJR389wN/RdON4cr4=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90963-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: D7A4EA02A0
X-Rspamd-Action: no action

The LT9611 HDMI bridge on RubikPi3 has DSI physically connected to
Port B. Update the devicetree to use port@1 which corresponds to
Port B input on the LT9611.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
---
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index 0b64a0b91202..f47efca42d48 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -755,10 +755,10 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			port@0 {
-				reg = <0>;
+			port@1 {
+				reg = <1>;
 
-				lt9611_a: endpoint {
+				lt9611_b: endpoint {
 					remote-endpoint = <&mdss_dsi0_out>;
 				};
 			};
@@ -801,7 +801,7 @@ &mdss_dsi {
 };
 
 &mdss_dsi0_out {
-	remote-endpoint = <&lt9611_a>;
+	remote-endpoint = <&lt9611_b>;
 	data-lanes = <0 1 2 3>;
 };
 

-- 
2.43.0


