Return-Path: <linux-arm-msm+bounces-104423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCA7KqlD62nZKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:19:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537345CDAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B82683014124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D07363092;
	Fri, 24 Apr 2026 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnX7JgX0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333EC3624C1;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025426; cv=none; b=dF+cvJKkymE1LmVkm0krPurNJC85gLNzr4Z4bhvrZ2kslqRy/vvjtY9EnhpZqxJ56yYnhWL3GiSERXzL8Mz5p/hvKcTLLGsR71AMykty+F9Ae3jnsKvRTBl6j9CnWofYLa1abu3k2kOhUxkXheO0CqUY7P137m8czax4+sso3WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025426; c=relaxed/simple;
	bh=xrHLf5eNpGYCZJw6uXjVC8/WzVIrBBKC5TwvXGATU7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XtZKBqhY504uITS3AbyWwhzzvjPA8NrijAy5v9guRgpAbhK2R/SMvwGPPZmX88MiO5sxNIKZ8wOSh3beSCcjextZVyFFAtOqFt6zE4ODSMdSroq38vU302KYHs86pRuZ5REmPxaBtrc9REGAtKpTcnrIBmyZDeZWAKjRi4qVf0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnX7JgX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D0AC2BCB5;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777025425;
	bh=xrHLf5eNpGYCZJw6uXjVC8/WzVIrBBKC5TwvXGATU7k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lnX7JgX0aV9XrVrCk0f/EJbKoYmvaUsDoaQMrvRKiJL7IuzB5krcmuOKFva7KbEHq
	 PsnryT+vI8uQ2ALelOoi5YbbYSPZIb/+wze/3+SUqQ2jG0gEU+CHPamnntVy4SCbp5
	 6ZqoJlgDxuSL6phCAunVw5oU58/KJR9lwXRxQe3ESabvzVD9zofjuRDu+J2aIU3CtJ
	 YsHCgeXCMwH8ZavGf03EazV1h7TUaUtskFihr4mIK6KX7Xmymssjaii4dEICtkbgRQ
	 44U+oQqfJ7zbJrENi8HJBo/274DDvoCLkOSuRenPRbzAiD5Bwl2uDGwHuPVfbqnW5o
	 U8oKCPf/wKXDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45C9FE51FF;
	Fri, 24 Apr 2026 10:10:25 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Date: Fri, 24 Apr 2026 15:40:22 +0530
Subject: [PATCH v3] arm64: dts: qcom: talos: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI5B62kC/23MQQ6DIBCF4auYWRcjoBa76j2aLgaBSqLSgpI2x
 rsXXbWJm0n+Sd63QNDe6gCXbAGvow3WjSn4KYO2w/GhiVWpgRWsLkoqyIS9Czgr64gUujVCNkg
 lhzR4em3se8du99SdDZPzn92OdPseMpESSipRoWTMIJry6kLIXzP2rRuGPB3YtMh+heZPYEngy
 GWlVH1W6khY1/ULhq2KtO0AAAA=
X-Change-ID: 20260418-talosaudio-b8ecf8b9a1b3
To: konrad.dybcio@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, quic_bkumar@quicinc.com, 
 quic_chennak@quicinc.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777025424; l=2086;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=BMQhN87MOW3Bin4ZVjUzWQxUOWRhdvvp1i+NLcdrruM=;
 b=AZSk/nnoNK1O+zaH16pGtagQAZwKk0vhXw+p0ekjNHu6e5j9UK9UM1bQTzBZEP1WF31mtDx2f
 z754EqRI2xlBOMYhrWaV+hAfPDlB+kOOPR+Gg2S+qurnJEdSh7cuAbD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Rspamd-Queue-Id: 1537345CDAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_RHS_MATCH_TO(1.00)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-104423-lists,linux-arm-msm=lfdr.de,ekansh.gupta.oss.qualcomm.com];
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
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,5.211.3.56:email,oss.qualcomm.com:replyto,oss.qualcomm.com:mid,qualcomm.com:email,0.0.0.0:email]

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v3:
- Use shared-dma-pool representation for adsp_rpc_remote_heap_mem.
- Link to v2: https://lore.kernel.org/r/20260419-talosaudio-v2-1-3a3b5dd67dd4@oss.qualcomm.com

Changes in v2:
- Fixed VMID list alignment.
- Link to v1: https://lore.kernel.org/r/20260418-talosaudio-v1-1-585ab22faaf4@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..c230d46616ea 100644
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
@@ -657,6 +658,14 @@ pil_gpu_mem: pil-gpu@97715000 {
 			reg = <0x0 0x97715000 0x0 0x2000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	soc: soc@0 {
@@ -5100,6 +5109,9 @@ fastrpc {
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



