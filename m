Return-Path: <linux-arm-msm+bounces-110647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MrCBUW6HWoidQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:58:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84708622EAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8057B3008523
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A2A37F74A;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDvUWt/1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C74232BF51;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332950; cv=none; b=MnH2poGjQNJyLrJvrcqtQF12C7nBS60AurGMn2roRmE19df7VQ7n9ydN0Ec41xfmJNJUn5xsoQDNSQR2QLhQFz/C4vRgLlDY4PBM65aNC+qcVkXWBHJuf2QeoWKsPz28u6b/TWuYQo3bvmdEXmv0CRheTfaDhSK3nHmzYDjibc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332950; c=relaxed/simple;
	bh=D/XT+m3FiTqZRLDK2ZnnhUD7UzZrm7MDEl/OjwerbKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4UMiI6gg8IbEFOPx2J4/jMSHNiue0TLkOvSCJpd2BhxSnrQc/M1ySfoy9OzjA57RbiVGaWl4wnIsQkf/pU+V4qwmFR4ttto+VdQrVt4lyk4A/c3/4rt1aL738yn2N3G0y42TAVdnJCK2z10Rb3XZh94h/ZV1/kQ3blku0jaSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDvUWt/1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27C3DC2BCC6;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332950;
	bh=D/XT+m3FiTqZRLDK2ZnnhUD7UzZrm7MDEl/OjwerbKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BDvUWt/1m4IUElyQM5+CqISuGGdFlf0sZ/q1E/OEYfVlpL265QIb5vPc/8xnZPG78
	 MoJiAwdkbxx5hWy5wiWC4Rmh9fuCsoL3ESenlHqEsKz5xgjXKS1Y7vb1WrcK/Jvbqw
	 FeTR6ohOwLvZkgHrZYjIH+2MSZrzXsTL2WjYBs9xTiu4GvxmimK/jvu+3D7MviuogQ
	 Ga+3OoaCSW+CQceZ69Bwwm9FqnH6ldSbCJa85kXHxDfGBAKcTO+8WodTG5Zkqy/zFa
	 kj74oXXfRgQ7mpebKhAHMuZ1XzG4761anfehzND2A1oEk/7vawroX2CKXtmoJvWDv3
	 oKBCw4qJTNiJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB51CD6E61;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Mon, 01 Jun 2026 18:55:37 +0200
Subject: [PATCH v4 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-2-c5d51dd96ca0@postmarketos.org>
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=PKWUit6YaDLgMvBcmHsB+WvICXOjhQdpimwGRlG8xpo=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbmUCLYggOFkMCTXQ0wYBdLc819CRcZPTqLgY
 7oHxZINky+JAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25lAAKCRB6NCVl/2Nf
 eVsQEACrECCW94nloXYFpEm0NV4xmamMUONm1jvXlEEfxC1Ro87zxy0zbGEblDhJAxzKhm7fGxC
 1QnFURUtywGdLlGlm3E5TUAv+dDmtLO/Cv5+QypEl9j35oalN7KxdZqwVAJS9OCLKM2bzRpnS3F
 hjOd404yIgcmJvymEqEk5bU82Wz1rQQQBd1ql8c+N99tWA+6U5/db8ySZm/RpXg+5EUlfDPeSk2
 OOmtptzVR576LPfyhgzrfPvpbktEji13Mha8kQO4I1qMuWk3Q8yCyeTUJtM00+aPruzH3vQWDyR
 YGXESUhuDJe9q6e0XvCE/tidBUVT6qPwhj5TmoPPi7VTFUKTkDK2IjnCzI6AQ5XsXkB+a8TlTZ0
 PhKDEpccAjXaaLL2lXyH/R4BU+jGSnBgjBFCmMqK4VIqqm2Nldqp3CHCZkaCJbez7c92qS8Eufk
 jtB/vK6huGTEYb+vVpOpVRfWVIYjMfoIHRcbgeksH0B5uRotvlQGuW1fg7aJdl6BEvBaLpOqroN
 PrFvR6amliX0a9fzD2ZmVXZNCNRfEXlQ+YQHxRAzK67wFIs6+Nfj5AYplPUq0fDfJ/gyE3dY/y0
 1+iROmh9WFK8fl1Cq4iH6ChtYihOapj8NX/b9tN8x0oU1GOObEk7NaKPQocYnvSnCi94NrZsGJz
 vlV5HJLD9HQ2uEw==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110647-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a90000:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,a94000:email,qualcomm.com:email,postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email]
X-Rspamd-Queue-Id: 84708622EAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

Values are taken from the other geni nodes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 1c6c18a913a0..400d5d8ef9fa 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1060,6 +1060,21 @@ i2c12: i2c@a90000 {
 				status = "disabled";
 			};
 
+			uart12: serial@a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart12_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			i2c13: i2c@a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a94000 0 0x4000>;

-- 
2.54.0



