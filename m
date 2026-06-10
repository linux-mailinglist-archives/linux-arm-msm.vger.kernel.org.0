Return-Path: <linux-arm-msm+bounces-112439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eN1nFEJUKWorVAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:10:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0B6691B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:10:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KAoGGZGt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112439-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112439-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA5413118C4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36839404BF2;
	Wed, 10 Jun 2026 12:04:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22188403EA3;
	Wed, 10 Jun 2026 12:04:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093076; cv=none; b=VKr27ORqRJXlcdcUysAqt5w8MB0Lj+4c7wzwCwGOrCs2RzKsJZu3AiPFB/ZRA9kErFU1HCWAL+7QrG7+pWEgFcYB5407kNz1fwc4ie+CZoUXFVnsjed/UzgNiIMy03poRibeUoY5DWo4CoIrbqOAD4Q6r2Gk0Tl8qp92v2Oa/pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093076; c=relaxed/simple;
	bh=uZgueQIDUC/IVDyCcL6MhdacxsHM9rXCnGw5Qiqc6zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDtlg3P6qwkSDOC/PucEwp96PTYlFBWhhCo44LfbJw+bcAJs7GjeuR8ZFx3jvGtKDZOsHxb4ErBtPoRzJdPNvaRsRJuMu1aMVn0dlBOF4lx3rUkHaAt/anwkyL8fpaW3Eq+8uvwRT+3uliD9zACAZNwtEDCclsHESqTRZroQulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAoGGZGt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFE71F00898;
	Wed, 10 Jun 2026 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093074;
	bh=IGbORZDlP08xL4kOubw+qIvp2KwcZHcpvZwB7+QRpIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KAoGGZGt20loUN3/qjFAufr10x4g2FZO0Mfg48RCmEITdMx1hnhECOkwfGRPBGb8R
	 ISDcZ/DPypOLhg1I8AVkO7pqVWMef2GHrnU20VF5U/xt/USoAQRpUMIp3wPJ9J3SMu
	 gJrzyBTI3EbY4fBKO2015ROTYTs4MOWHEPJ4pxYPrOU3rdbhxvHL7GFVqushInUF/k
	 sFJLRRsqoRYbA+lgKYaA0+hrgNhyBp8DZl1wfqnNSjsXP0nMzds4bkryjXl/CRzgOj
	 QvOAF/X9FdSrD/DZ83cw4yMdhVjJUd8RUuLGabKn/cRbCMUDcQU6A1fZtP06yptNds
	 kEKkfsJiuvvkQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 14:04:14 +0200
Subject: [PATCH 1/4] dt-bindings: phy: qcom,qusb2: Straighten out SM6125
 and MSM8996
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-8996_61x5_qusb2phy-v1-1-d7135980e78f@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093064; l=2934;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=c0LyjotfcFpdJBOn3D1FeK657jniSJjiEt+FZvf/UR4=;
 b=A/bXzo4KUFVVoT2SN7t+ixD9CPwPowrpvPUhn/xtxEKVtI0yJrsjWasjvlCnI9/MWRVmf03CO
 tbnxDSmoVOKDITnkbjdAmps0buLF820oXctOK/GHmm6xUeBJNaqpNFS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112439-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E6F0B6691B7

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SM6125 DT currently uses just the MSM8996 compatible (without a primary
SM6125-specific one). This is not only wrong for the reasons of
violating guidelines, but also happens to not be valid.

The MSM8996 PHY is quite similar, although it requies a different init
sequence (for arch reasons). MSM8996 also needs different power
plumbing, as the VDD supply is fed through VDD_MX (which we define as
a power domain rather than a regulator), unlike on SM6125.

The init sequence seems to have been "good enough", but now that the
bindings clearly diverge, add a new compatible for SM6125 with a SM6115
fallback (as they seem to be an exact match from the SW interface POV).

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..807d64aee547 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -30,6 +30,9 @@ properties:
               - qcom,sdm660-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
+      - items:
+          - const: qcom,sm6125-qusb2-phy
+          - const: qcom,sm6115-qusb2-phy
       - items:
           - enum:
               - qcom,sc7180-qusb2-phy
@@ -57,6 +60,12 @@ properties:
       - const: ref
       - const: iface
 
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
   vdd-supply:
     description:
       Phandle to 0.9V regulator supply to PHY digital circuit.
@@ -160,7 +169,6 @@ required:
   - "#phy-cells"
   - clocks
   - clock-names
-  - vdd-supply
   - vdda-pll-supply
   - vdda-phy-dpdm-supply
   - resets
@@ -182,6 +190,22 @@ allOf:
         qcom,preemphasis-width: false
         qcom,hsdisc-trim-value: false
 
+  # On MSM8996, VDD is supplied via the MX power domain
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8996-qusb2-phy
+    then:
+      required:
+        - power-domains
+        - required-opps
+    else:
+      properties:
+        power-domains: false
+        required-opps: false
+      required:
+        - vdd-supply
+
 additionalProperties: false
 
 examples:
@@ -196,10 +220,13 @@ examples:
                  <&gcc GCC_RX1_USB2_CLKREF_CLK>;
         clock-names = "cfg_ahb", "ref";
 
-        vdd-supply = <&pm8994_l28>;
         vdda-pll-supply = <&pm8994_l12>;
         vdda-phy-dpdm-supply = <&pm8994_l24>;
 
         resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+        power-domains = <&rpmpd_mx>;
+        required-opps = <&rpmpd_opp4>;
+
         nvmem-cells = <&qusb2p_hstx_trim>;
     };

-- 
2.54.0


