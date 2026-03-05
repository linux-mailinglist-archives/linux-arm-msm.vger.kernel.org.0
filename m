Return-Path: <linux-arm-msm+bounces-95600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8fbRN4lhqWli6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0222102A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 11:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3BD130B3D22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 10:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB51379991;
	Thu,  5 Mar 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBAsiaT8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F73364EA7;
	Thu,  5 Mar 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772708161; cv=none; b=C6iBia7JverJRjqIp37rI48tuefgaBZr3xTLpHhVnaHTFRqOw4ywchicQDzR6aRGqnB88p8fyUEwhiDQ/JLj83CKxFEIiiHDadwYzO/VGLHZ1nWHkbjRZmznUwptT48vU2dpknAHdEotEHpvln5OZHm0ZTensK3wymIHjacrI4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772708161; c=relaxed/simple;
	bh=6c+4+KT8WjttJJBtlqVpGLXMyRvZx9jLw3ehnPubty0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5tTPa2o5hZdgR9hmlYBmWdtAodAIwyoeOh0ewkipt6HVmDZuPQdQLgCV2dm9zvGyhPDasYRxFFm/mIbqH8sOtCFMjgw4pPbh/QS5yeGK9gL7wOESZOCOVFh85FiyT0pXGRuJVGvEppvwKDe1PSlOBExj7X7eEYNUUaAjsRotiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBAsiaT8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9506CC2BCB3;
	Thu,  5 Mar 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772708161;
	bh=6c+4+KT8WjttJJBtlqVpGLXMyRvZx9jLw3ehnPubty0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KBAsiaT8TOLCkBjDLSs70xOuXw6olc//XYML1hBJX73k9Q8iDDDI8FGr9zSvKsQj2
	 Z9JSalQoQt0QmJu6Pp+A6MmROBI9QnoquN0QxKIPOsUs5wOVAcnUUGuxNxRCJ/qGiL
	 SNOzriUCaRSb9rXQFLs4/3iIDKGDtuxgD6LJb/sw6w5DCJws1H+jQ4iwKfHcrC5blC
	 xt3tzcolHVQI4EsnIWR5/y3cWtZDW2iHRCgT/CNwYQqPSmzZojuN3LoI+LVH7HNyqF
	 N9Ww5uDdP4Hp4ekpHXVpJn+nU7hd9hhhALfH7HQJMkskamSqDboKQ0hW8T2E48cr++
	 WsmyGsHVWmxXQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 05 Mar 2026 11:55:41 +0100
Subject: [PATCH v2 2/7] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-topic-ipa_mem_dts-v2-2-5cb5b90902bf@oss.qualcomm.com>
References: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
In-Reply-To: <20260305-topic-ipa_mem_dts-v2-0-5cb5b90902bf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772708147; l=1044;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=k9VS82bpI6HlQ01znf64b8maesSt9IIddQEfu6YYqyU=;
 b=1+HzorpLi8old3xbOzG6ZUpUZm0vki6Mtek8Og81zODGy/fe4GT8Qz08Cg76lCC4vSTPq3wMH
 +RrsNT8AyDECh7hJ/1aEVA/BFf6mR1/8mJByTscv0GMSq62dfFdvMCo
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 3A0222102A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95600-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.11.184:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,594c:email,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,1e40000:email]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..5d87f3a71aec 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2642,6 +2642,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -6577,6 +6579,10 @@ sram@146a5000 {
 
 			ranges = <0 0 0x146a5000 0x6000>;
 
+			ipa_modem_tables: modem-tables@3000 {
+				reg = <0x3000 0x2000>;
+			};
+
 			pil-reloc@594c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x594c 0xc8>;

-- 
2.53.0


