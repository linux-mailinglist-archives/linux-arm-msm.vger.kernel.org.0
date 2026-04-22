Return-Path: <linux-arm-msm+bounces-104129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD+ABSXR6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3F1446E78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC6943020915
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427E22C3257;
	Wed, 22 Apr 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC4bG88k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904B2BD59C;
	Wed, 22 Apr 2026 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865567; cv=none; b=VW0p3BNldFy1tRQnEhZ6OYfMIw/WQEcTsEWHexloo0Epas6BFYMBZWSw2vTfUI5nqTlDCaF2IjqyoeAF1YYvDDTVi2pZgCyYf+olAnvntkwvClM3t0Jn7M61v7fj/TTZHXZy9sfNhCGPCIkURI0o5O/y5idv0JnHxQnRK+GY39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865567; c=relaxed/simple;
	bh=n5cRS3L2I48VROEyGeWbgQ16Y7ys4VPnMG0pEO4H/Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sunQj2vWH4EOTho7clNRWNXXlhyUv5pTGWLZVSVmZyIsihLblE29wsmlosoUh1I+ajN3Vuv4AYbT1jTHxq9/Cj/Kg/ixtZip+y6GspZiPWFeoXLwvGRZTbHZlXvbKsWRLxb/l7H90uO1pCCrBh5hcQ81J4QaEFVGiLk4UZr71LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC4bG88k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC7A0C19425;
	Wed, 22 Apr 2026 13:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776865566;
	bh=n5cRS3L2I48VROEyGeWbgQ16Y7ys4VPnMG0pEO4H/Z4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nC4bG88kQM388JcCsW41slxK69O9Z30q9FZfQ6w/kAlgLGgTeSypTTIqcbfD6wnf4
	 mthoBddTeBvle5uqfqb5m5Cuw/hrSAsfqcaxLIJZCmrE7ph8SafjokgyOXWsNkzQzD
	 KFe4QrE9PAJxfSLILS3Y2l+sLFtDvSvL2JWO6JTBRe9BoRIX2cOS3UZIU4jT42uxGf
	 ArpaxWq3b2W72Q6xGzVdcSLYsUQR1+C9h46gNs1HRMyph5q8wVYRG/ZZUsAkh8fOty
	 rK2futmC2ECkblJBeB/5ED7mQOM5ANSEhltl6RCWnvJ3PIw/XbbMjLfhCACrOuPhqN
	 tVV5Aw9Nrsv3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C665EF9EDD8;
	Wed, 22 Apr 2026 13:46:06 +0000 (UTC)
From: Haritha S K via B4 Relay <devnull+haritha.k.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 19:15:55 +0530
Subject: [PATCH] arm64: dts: qcom: talos: Add passive polling-delay to
 gpu-thermal zone
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-qcs615_gpu_cooling-v1-1-d5a984ac29e3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABLR6GkC/yXMQQqDMBBA0avIrBtIUk3RqxSRGifpiCSa0VIQ7
 95Ul2/x/w6MiZChKXZI+CGmGDLUrQD7fgWPgoZs0FIbWWotFstGVZ2ft87GOFHw4l6bSvYP50o
 1QA7nhI6+5/TZXuatH9Gu/xMcxw8CLHVjdgAAAA==
X-Change-ID: 20260422-qcs615_gpu_cooling-39650b7ff41d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com, 
 gaurav.kohli@oss.qualcomm.com, Haritha S K <haritha.k@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776865565; l=853;
 i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id;
 bh=bEeXthao5AxPlUbPaBK/C+/v/mQ8p69utkWRhhz7Ow8=;
 b=oT2QuqyLDyfY+zGIZ7EJKJa21B2m+lISVcXqxQkjhwPo0EMKWjPwHZ8QUL2EKVqvCCS6kt3b5
 yT5jT3ePYvtArhgxaD5bqyc07ke9NAv4PERBA+UeHYUJ9zuDYeFWnIc
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519;
 pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
X-Endpoint-Received: by B4 Relay for haritha.k@oss.qualcomm.com/20260422
 with auth_id=745
X-Original-From: Haritha S K <haritha.k@oss.qualcomm.com>
Reply-To: haritha.k@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104129-lists,linux-arm-msm=lfdr.de,haritha.k.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[haritha.k@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD3F1446E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Haritha S K <haritha.k@oss.qualcomm.com>

Add a passive polling-delay to the gpu-thermal thermal zone on Talos
to ensure periodic temperature monitoring while in passive mode.

Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
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



