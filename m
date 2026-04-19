Return-Path: <linux-arm-msm+bounces-103620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIacLgOJ5GniWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 09:49:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CB423598
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 09:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 775543017BED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 07:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4449633CEA8;
	Sun, 19 Apr 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+OC0lGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD962ECEAE;
	Sun, 19 Apr 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776584467; cv=none; b=SH2bTISY4UtKEBcQZVLI6EsdKjz9hS3v2ceYUnOKZDEWHVQ2QLZTTmRAhlqpUqaZsZIUBOb866EE9dJPslfNbr3BqGSwogfCi6eB4GS9Gkm8lXmzf32sbVGxgC8mj9mI1gFsua6sLJCKybxzSDmNllId0V0aTrcaNXTVPciczkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776584467; c=relaxed/simple;
	bh=u4xRjPcoShJeOrcXozabjDzLtQaTiNnO+gmWmXC8nnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jaLTOho+XMEcON/v3hHdVYP6R8iujWlTDWuxwwyt4u5U6M4ADyGTluxfNwNS4GuuHXAwJYhmUt5LC0LB736ny2rCq0qeGqNvZ+BuDWPQp3oTacm2gxCad+Z75WfLNvRiW8RrCdeUIirNt2jQgiEbJQRdmOo5/zqk3ZM/g4c4/PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+OC0lGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DF66C2BCAF;
	Sun, 19 Apr 2026 07:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776584466;
	bh=u4xRjPcoShJeOrcXozabjDzLtQaTiNnO+gmWmXC8nnQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Z+OC0lGb719f767ye5qcdtJspr1dlRFoB35L/9FFd7OjkIe7W3YghQfHcFsRNb35c
	 cfmoUzES4H+Ph1ewINmOX/L9b/cNpljOzh/sknVBf1VJBlT5ssyCzfsoW3E/aWWwv3
	 8zkK+hJWiUbzYMXc2HtSWQUq7SNuE+h9XF1+Hnl5l2Z7fvaFmnaA1qrdk4gyT8mBy4
	 gGWXwOkuP7BRaKcm+AMeAt9gbWL9J/MAD1Q7M+eHE4hffpWCfakqT/rCLRrf/kC3SK
	 WbtdVsnT0ZePFrCjGj40tpZh2fzjNPoxVwQR/bgkdVpOMd5kKk3iVezdPVEbgLv+AP
	 QXmr5jrMn2RGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76609EA7191;
	Sun, 19 Apr 2026 07:41:06 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Sun, 19 Apr 2026 13:11:04 +0530
Subject: [PATCH v2] arm64: dts: qcom: talos: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA+H5GkC/22MQQ6CMBBFr0JmbQmtYKor72FYTEsrkwDFDjQaw
 t2trN385P3kvQ3YRXIMt2KD6BIxhSmDOhVge5yeTlCXGVSlLlUttVhwCIxrR0EY7azX5orSnCE
 Lc3Se3kfs0WbuiZcQP0c7yd/7N5OkkKLRDRqlPKKv74G5fK042DCOZR5o933/AmzAeFSrAAAA
X-Change-ID: 20260418-talosaudio-b8ecf8b9a1b3
To: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com, 
 quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776584465; l=1797;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=tC5+DyoQ7lpix63zW4POZfE9Ynqt5jo0xccF4pymBmU=;
 b=Iqu18vQ5NLY3e8LcUmIiQGZF63DRpjQ9Sq1KLhSp1yscIWp7sCt561Eo4Hyl62zSr3vLqursJ
 l53YxyLgsm2D7fM6b9HnNqJWvkBmY7Y04yJeSPNXrqnPozgiKXWuPy9
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_MATCH_TO(1.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103620-lists,linux-arm-msm=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.567];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,5.211.11.8:email,5.211.3.56:email,qualcomm.com:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 177CB423598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..f71b327c7ddf 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -657,6 +658,11 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@97717000 {
+			reg = <0x0 0x97717000 0x0 0x800000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -5100,6 +5106,9 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
change-id: 20260418-talosaudio-b8ecf8b9a1b3

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



