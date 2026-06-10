Return-Path: <linux-arm-msm+bounces-112391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MBiFEWo0KWpfSQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:54:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6696680AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:54:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hZawZbxU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112391-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112391-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0663A300EA8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B44B3E2750;
	Wed, 10 Jun 2026 09:45:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294A218ADD;
	Wed, 10 Jun 2026 09:45:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084724; cv=none; b=ZeTzUH+gjApbPHx8+Jjkra0pK4oK0c/c4DmMw722B0VygS30pf+fiPnlRzZuMZDXao+b0K0AO8pQOshMEPC4VMOsa3C9i7FPOYGTVOg1EX6ArYzJiomYY2YG3k6kjnVzomvI57z2mWneNLc+Wo3ObW/Kd56QDZWrJ8f0B0O0KfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084724; c=relaxed/simple;
	bh=r7glxuSbfN3iguUiy2cY5EJ7wSoYFeYzVi1cR2dFMQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B7Uoz4OtUDmj2eslrDkhKA7ixcddJzU0LyOom1MgajPTPlJKaReusHPHnycqvKvvRlBZj60KnJ/5g0iZVItQTyDGvcFFAxlWhy9xQ9lGxY70Y8rmSm3r3lyaqGUN6TMYhXC+z7WTAJyXHnZ1aFVfRLFAIdv4pdww43YXNd+nVUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZawZbxU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3611F00898;
	Wed, 10 Jun 2026 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781084723;
	bh=GjyZ/G42bA3GTIlq/LFEMgm0aKS64MYE1ovw5eVTyAE=;
	h=From:Date:Subject:To:Cc;
	b=hZawZbxUF5eBk51hsQfIRT+t66KcENSaND2yIt5fooOz3e0idZqayR6uK9qPNun7+
	 gcY4d9jOh9bZ6lKi+ZpOwxfmxO2FethUQP1njwd4MxG00ikCQxhL6o0XrFgjyu17tR
	 tCxuROeF3eHu9t+MOQn8w7YF7b210mfwyUM8lJ+xYGqqCsOfk7th7U4EH07cmJd6Gb
	 G1b3D+9ugj/z3jokHt/n4EW7eT9jfDWcEtaHfyOwFXkM87q8vW/cV8r3FPjNsdDzgq
	 GpFSgcbYSWGeCmUMPTg4FfjqYSnYBzZP5I5jr8/RlY8u7iQC523BBKvyp5JuFA/F1U
	 jbhB44/nWpKEA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 11:45:12 +0200
Subject: [PATCH v2] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow
 bifurcation register on Purwa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-purwa_phy_shutup_warning-v2-1-951c1fbfe9b2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0JmbQmtCVJX3sMQMtRKJ5G2thQkh
 LtbOYGbn7y/eG+DqAPpCNdig6BniuRsBnEqQBm0g2b0yAyiEnXFuWST86SYT2HBzpu1iyZNyXc
 LBkt2YI3kukHshXwKyBIf9JM+R+DeZjYUJxfWozfz3/u3euaMMykvWEvRn7mqby7G8p3wpdw4l
 nmg3ff9CzYuknnTAAAA
X-Change-ID: 20260119-topic-purwa_phy_shutup_warning-891e8aab29f2
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 YijieYang <yijie.yang@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781084720; l=2609;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=f3+4d0okBov4perqxPrhCEQLipcvHRqkv7paraH+R6w=;
 b=Wv3VEDIvLwXJ7Zb53ahiTHmQO58d/QmQ/Gjbaj3PFzHJMAfAtcYlzREmGHVt/4uVwffZlKm79
 vkzIwXRzJ2dCO1aMHH+uAiL/ioPr+vLYeo7XqQ10xEhC4xUtY0e3vCz
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:yijie.yang@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112391-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,linaro.org:email,infradead.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F6696680AC

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
The PHY is however physically laid out as if it were to, since there
are two separate ports (A/B).

Split out a new if-then block to un-require the bifurcation register
handle to squash this warning:

purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property

Fixes: 2e1ffd4c1805 ("dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/176857775469.1631885.16133311938753588148.robh@kernel.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Rebase
- Don't drop the mention of the warning, as it now actually exists in
  the tree..
- Link to v1: https://lore.kernel.org/r/20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec..431e8cb5df84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -136,13 +136,22 @@ allOf:
           items:
             - description: port a
             - description: port b
-      required:
-        - qcom,4ln-config-sel
     else:
       properties:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
+              - qcom,x1e80100-qmp-gen4x4-pcie-phy
+    then:
+      required:
+        - qcom,4ln-config-sel
+
   - if:
       properties:
         compatible:

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260119-topic-purwa_phy_shutup_warning-891e8aab29f2

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


