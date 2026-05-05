Return-Path: <linux-arm-msm+bounces-105946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CW4EfjY+WmbEgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 13:48:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F8B4CCEF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 13:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7132330CE29E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 11:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFBF38655D;
	Tue,  5 May 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shdcuDPo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC537CD54;
	Tue,  5 May 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980510; cv=none; b=fF7iI6TShvRqQeObC5rCb2N4L5Hhiy8pg60oz/Ysdb2ozu3eZx+44sC+w9Se1QjNNJkVxYy8fTfIwFKFv7c+wRTGXXuF659wZnHp3uI+1tkorMsB2eduGkNc+T/LdM3VmvTBUjhISCt/9QRZPYrrq3ZLDL3ZegkQBpQ9RFZutZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980510; c=relaxed/simple;
	bh=DnmlrSJFdGQ8SDrNDiP9ssHPgMoJPlTfk8qc1QT5ptE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tNwsYNTBcE0FFyof8pZkDgTBj24AQvZjk/mtum1usTsUMt8V/DFVkwR0jdJadPcxMR2L7UO7BWinQP14xY4LsblWTKzyGP6jjIxboVkQ05Ph9FFzacpOgCTcghF9WatKFCSqZCp9oLGhNzIkn7l17VeDEI3CjO13knSIN8QxqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shdcuDPo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19B2AC2BCB9;
	Tue,  5 May 2026 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777980510;
	bh=DnmlrSJFdGQ8SDrNDiP9ssHPgMoJPlTfk8qc1QT5ptE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=shdcuDPoOCHMD90M1fweESACr4Obuqv+DTF67kGquadTZ53H1PzQPz5kuMQqPpNYI
	 uJpso+ut8ZSkvshaWE20KqefEOnJegh3lRCbqPue3gOT5VAxJG/6XUZvjxxwOLCQGC
	 f9bH3CcO+knLszlyymeDyXTqWUN39c6RtERx2cjnXeEHmGw1MQGYTh3R/fnotvWOLa
	 NmWPh1vxWkW561Jb0dUntOAnKjO1aD9S5vaou34wc4cUPdo4/r0xw4hgsHop5C5yj6
	 MD4tg4gHye8JYxV+XF9sLJ4E57Me2Mv3noUIkhBhytza1WL/hqk2AG6TDWkWaVDIwB
	 log9k2E4V/EUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0983DCD3430;
	Tue,  5 May 2026 11:28:30 +0000 (UTC)
From: Haritha S K via B4 Relay <devnull+haritha.k.oss.qualcomm.com@kernel.org>
Date: Tue, 05 May 2026 16:56:17 +0530
Subject: [PATCH v2] arm64: dts: qcom: talos: Add passive polling-delay for
 gpu-thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-qcs615_gpu_cooling-v2-1-1ba42260b29d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANjT+WkC/32NywqDMBREf0WybsTER2tX/Y8iEuNVb9FEc1Vax
 H9vtPtuBg7MzNkYgUMgdg825mBFQms8yEvAdKdMCxxrz0xGMosSKfmkKRNp2Y5Lqa3t0bQ8zrM
 0qq5Nk4ia+eHooMH3efosfkxL9QI9H09Ho0Oarfuc1lUcvb+CVXDB61Tlt0RpmUP8sEThtKhe2
 2EIfbBi3/cvvKWFPM0AAAA=
X-Change-ID: 20260422-qcs615_gpu_cooling-39650b7ff41d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com, 
 gaurav.kohli@oss.qualcomm.com, Haritha S K <haritha.k@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777980508; l=1005;
 i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id;
 bh=pZXEN7DVPFaFDrW/CKL2KXb/m1Lm+4AA3U1lQG1OwgM=;
 b=fjPsnfcijY1WZVTHRFxBstIPndZDmJmEQ2dXAvhXt1jShAdcpPwaRbNVaCaGvqLcbugpDZ/pJ
 XIaCuB9bTfQDECE1/VxYikBXvBBpm90hCnT/wOaXjHY4pz6nl+ciAas
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519;
 pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
X-Endpoint-Received: by B4 Relay for haritha.k@oss.qualcomm.com/20260422
 with auth_id=745
X-Original-From: Haritha S K <haritha.k@oss.qualcomm.com>
Reply-To: haritha.k@oss.qualcomm.com
X-Rspamd-Queue-Id: E2F8B4CCEF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105946-lists,linux-arm-msm=lfdr.de,haritha.k.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[haritha.k@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]

From: Haritha S K <haritha.k@oss.qualcomm.com>

Introduce a passive polling delay to ensure more than one
"passive" thermal point is considered when throttling the GPU
thermal zone.

Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
---
Changes in v2:
- Updated commit message.
- Link to v1: https://patch.msgid.link/20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..8a3669b2d062 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -5267,6 +5267,7 @@ cpu-critical {
 
 		gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
+			polling-delay-passive = <200>;
 
 			trips {
 				gpu_alert0: trip-point0 {

---
base-commit: bee6ea30c48788e18348309f891ed8afbf7702ac
change-id: 20260422-qcs615_gpu_cooling-39650b7ff41d

Best regards,
--  
Haritha S K <haritha.k@oss.qualcomm.com>



