Return-Path: <linux-arm-msm+bounces-117454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QOpXBIadTWqt2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C1720ABA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:44:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=OEJl86Gw;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117454-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117454-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B32DC3023AE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F79368D42;
	Wed,  8 Jul 2026 00:44:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861336D9F6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471483; cv=none; b=iQ6Y+1e88lOErjbfZADYorx85iTF9ypJALUjlCe3fsIOjyqZtIO/ZCGhPhVYSE7piz0QWmpKdlDir3iFd9jcyqQCpJoi+c+FrP0PrnbX6d86jSRHTyAQUrkGwp4/CwefNgQXHv8Zz6y+PCG/JpZGGEX0ExCrikD9V8vN06BD3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471483; c=relaxed/simple;
	bh=DaFrKuVYLeTZ90L4aHjimFDoXaOk4B0/5sh9EcwRuPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rhOhwzpUaajzegjwJtCCF5LxynAs+Uk8mn5LyXNce5QUlHracYAOaFsG//6xPWKvP0xPZMvBprWqXcqFkFPL1E1da+ppuPHyu75Fmmy+gxXpl2c3SF12Y18T3YL5fuVGJEVaGzhdWoAc3bDnEqpj1lmLdzzRcLbLhZP72anNjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEJl86Gw; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-474303f3c72so69585f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471472; x=1784076272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ewU3w7kavvWMe5j3eglerWWyjL7M+ZhO82+OFZFUnU=;
        b=OEJl86GwB3lWKqJHIR6zIxdkHFXx67/BcSK0LEaYBbubkep27+AQ9OoWH6cbtlBaTG
         rnb+5hHiDxoV+1219uSgIYOLIpcuRdl3DlOLum7g/6k0Uqps/tEk6PQg7uLKtXE3z57C
         ih2DqWJSFUop3+Xxt545mfygN8GmvDuf3JulICw9o8vccOw2xXo525fVJwyu51z6DON1
         1rsTyC3pV7/Ou+0Vry/em5fRAz0lXNWSUd9nX0dPaC4noGAH5FQUjXeXTwC0WEJV4WJg
         kCEOC2vdFEgfc+EQM1zwdQtBeNpCfM2BorKrSyD6gtLOIyoqBNlxsZ4CJicgCDTsNx/F
         xOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471472; x=1784076272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ewU3w7kavvWMe5j3eglerWWyjL7M+ZhO82+OFZFUnU=;
        b=BJw7QYUC+4iH/igRIoGVGKUq0BdJM8U5hhkCo7o43DhfSQozV1iGPFJzOzrICvhq73
         oJ0Laq+jUMEv3VVtQDH+91gWmC1qCSe+LSxak1HbcHqt4iwCI4SQQwjQPZnJDrdQ3DCF
         88gEBiUPqO3mv1oKOhQ8kYJTNOD2JTjIXwGCmuQENZKLwYgFqQu9E7mar5BRmXgsgS2G
         ZXB4msnHBJ6TBV/ueSVlOT6iVsVNyEfvfPeP68TjoTFdvaaaZXUNxpGobMEsPYanovrv
         3kPnNY/ZjLqb/i/1COEmSH88dpr4SGJ30wRN4rDKOd9y3uRf/rTwkd5pYUxkl9Ik53//
         EHVw==
X-Gm-Message-State: AOJu0YyRG8MaXJLMzix2WMipGHuWuvJcA4fpVzrJGBKvHkVB55Odo+Ws
	zYh1klZCiQUWjVtCetb+ytFJX+2nRiaqhW3hKDvDj9KCnDQZBBdLSDeFHA8FWqx75+8=
X-Gm-Gg: AfdE7clad4JDcOAYnc4EnR5zu2vjx2EirujeFELxdlvJzIWfypTpfFJChjSghPr+64k
	LahKSjnuiHD1pAhX/h5pW/BQwnBhdMbcvcrlwVyG3r2A8U1mpYRas/bsDDc48yn0/VuRBFr5/V9
	TbW03FL0sTs6sdo1iVATC4YgsJZ7l+KGJO6hw9sokyuTMulrVcqYQ7hupOGbi7v0H1B1cKttShX
	BQaGwtfWui+X3f2OXUz2eXAu03/ZBQ8LzY837sEY5D4hYRp0z2POj536PhCB4CkxwIHDbMede1Z
	wWAIMCy5ZA9s55iXKQf2JHL1yFJTmVTuzf1qsgbipgHMRAbtUzvAFO9V64aEolk1pw7r/i8+9gJ
	N1dp/7GG+aCQ9yl/O4iXujMwBCA430w5ch8x5WonjQ6C11UmmcXFp26QEK4xiy56ajswgns+Llv
	CMgmuq8TvcfDWzurl6YHQvmOk=
X-Received: by 2002:a05:600c:8217:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-493e6899b71mr1701135e9.26.1783471471767;
        Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:15 +0100
Subject: [PATCH v4 08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-8-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=DaFrKuVYLeTZ90L4aHjimFDoXaOk4B0/5sh9EcwRuPU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1exr++LCv1GrmaAn9ijiOPb21l2ezSBx2/a
 zM1+lXID/iJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXgAKCRAicTuzoY3I
 OgLxEACeaM2HCHavnAn+PH6R/6l0W26KCxfIe9pMqZsb81DWTgieLvsdFzwgH7G0u7I2PcXqnbj
 n4YB1NY9Y+X3wHtoJLoU5C2f7Qrgs8HxcbzPHwvL0TrXSvgeaZE6XGyYgnIE87OW26AB3Rz794B
 TBBIDdqVB2ut7fDEhGX4NMypO7AEghOb8d2Pf+OMji9rsYn1h0vz6AmMcnsntKbqs3tWzZQUqNS
 i8e36fXTWk0Q/OItSTF7fm6SCWz4s5EXiAgMCWpFFAlx23BNPnp31SDZhEqCaVoQcWpVUEUxvT8
 mHlBEpKeTltpc6/Yxe3X8pIOc8/TiST7bU1qXuM40wbWqOJSO4xsdXI57P/zewta+mTY5ITSLWy
 jvVtA2xq6Ji8P3ltAw8UX54lWSdpNGhXY+aYSmtfhWmcAB7jNKGKBbTf/xPWk4Yllj9Lxn06Xnm
 PXy1nyYGzuK0C1KA4tXPKvi14P1d6g05sen5MA0Bi670YAKzk5mMQK/GelgkvbF5cqE5wsZc8dR
 5pwqgF6MF23Dp8jMgrqmaYZ+BODeHQWfspcsBtWeTpoXCdGiRstCO/qSelN0rgEX+2zjKAmLtKG
 Dj+4sK+Cg7Vr1zvk1vQ052YiClSehLsR+75PaP3yGLtfnD5uheNsFcDGzfjMdbqU/SgNl8uHUTt
 OxDhmcMgWLl86pA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117454-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E61C1720ABA

Add voltage regulators-8 for Camera on slim7x including:

- vreg_l1m_1p2
- vreg_l3m_1p8

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0c..0a8275d501f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
+
+	regulators-8 {
+		compatible = "qcom,pm8010-rpmh-regulators";
+		qcom,pmic-id = "m";
+
+		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-l4-supply = <&vreg_s4c_1p8>;
+		vdd-l7-supply = <&vreg_bob1>;
+
+		vreg_l1m_1p2: ldo1 {
+			regulator-name = "vreg_l1m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2m_1p2: ldo2 {
+			regulator-name = "vreg_l2m_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5m_2p8: ldo5 {
+			regulator-name = "vreg_l5m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p8: ldo7 {
+			regulator-name = "vreg_l7m_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.54.0


