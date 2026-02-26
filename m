Return-Path: <linux-arm-msm+bounces-94315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM2yIL5eoGmMiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:54:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C83B1A80EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2A1230711E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05093E95A3;
	Thu, 26 Feb 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jle5kiWa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D83D902A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117472; cv=none; b=J7lTWaPfNaEROcqHFM9T6jlKqOoTHNsC8HMd9IXg/3ZFfsXZJuZ1P6Bb18YWyh8wkMmtGIbnwd3WMs2ckFaC0vDEbaOyKykuFbVJpJsnTcjIgbGVkazug33xKTHuOXjHtpZ9y2C1p+HVFtSz7ko3sc9DzxsX9iiZujAaREbrvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117472; c=relaxed/simple;
	bh=vxDWvv8mb+epglkH3Hn0cudwOLibzt6cGtozzyPrd5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SuxguJk9AlDWpKPS9RisjaLbnfy5jurkNAT2chTuWX7UkXejs+bOtSKV+SynMEVFalfL+VVIWUwr0GDYEZyxoHLM52JFZUqtIcqcbIaCxhsfE4KVopf4+Jj0W3j/p8E7C1aVtSHb3b+t9jGAKDKXimvm02TQusZ7ZEvERGwhVgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jle5kiWa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483a233819aso10025975e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117470; x=1772722270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9s59gT/FGqvCmBf20Rfr3SRMt29VGd619pvEn9JbdW8=;
        b=jle5kiWan9R22rT7IxgFqJ6DVLmxLNMk80E7yvl57rjL++CMYO9hXdsF21TuNwtZPP
         1xDc9FLNL879c3PUmqGk65EWbQBM/KoDcptaI8kepf8SvM6+X3YAaedt/6zey5DHY21p
         U8PpRZvP6RPhAxWIVGVqVmSF2j1xcXfbyguzI1yvzP9VRi9oUW0vyuG7/GWVrlubTDns
         M6l6GlkVltq+sPZPL0KyxsKf1NjzR6Cu3JNwAH5cqdbgRKIb4dwbvcH2U2MR7u4ln+Sb
         FaEjz6ovKCQP5OKd/1d9jSABR2DcBmb/YfC8adtcAI5mEJN1z+hBKpPjtbSwwAbOXXfj
         Ny/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117470; x=1772722270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9s59gT/FGqvCmBf20Rfr3SRMt29VGd619pvEn9JbdW8=;
        b=qwN34pT1wXNoVlBWYmyKjyo0qzBDV+0ZVoID6TsGg9DeDiB8clzT1/+c7E3wP0fpxV
         xujWj4/AhO0emzGtqjqHqNlXWdf9Csow/e+/tqbIh4MnPK8dEPtoVAUJGYNTmsxZmzVq
         6PMDPuNewSIo/Qus5nWz/YN77xwKWEixqY2Qs+qWLdPAnuUStbCb5xIeaVt/L6i5ozc2
         XCwMt4pW9mJRZ0P/flsDtlUPJX95BaP4MK+VeserXQCHbMZ3kQG/ODZjWV334RrlFZ+/
         RRHfWT79iqLnPyWYqXfKp9K3DHgNSrGSi+fQWBWoJNxvWDBY5mht4/RsA4ZdALgKOhm1
         e/jw==
X-Gm-Message-State: AOJu0YzBr3KesjEQo6tBnvgdyklCK0e6LcAa6LT38QjhX65KlxoJtWon
	wSzhLlsR3yQoVZ6153OVpEoQr4pnPh/iOAVXEQ+N795V82t5c0IFBPwGV9hwT6RHfRI=
X-Gm-Gg: ATEYQzxY5vc76Bb4dJSCGi3T8pQt8psGYfyvNtHQlQGMd0La/dH1scgY3B4/l6kJ9Zc
	zm4hljk3Jg2tgM2/MyJprjTl6xmuICMG9H+jKKWYC8mAYq395+3418+hf/Rs++wpm/GYeTZtkgh
	BVDwR/zgc6nMpuD549ilCLdVDzwVVVwiOm8PglTuFi7fLvVynMJ5bE52SMfO365wOHug985UfVl
	BxMY8NcTIU0oQGgsKWXi/vB0L0t2thUe43rzs1BQ8/7ShtzNeYR+AdABRkb/ok/bKwVxTNFAMiP
	YEbP1ioWBo3Q0s9vLY9Qw9NC+CQEZ/r/h1M+OQUnCia0tHIB/ll15hhYO/HBrk5hDS4MHVTR0tN
	b88inOPGxgb487+onjNOSWm8FxlLl9Cccd8w/O486SB6gjmM98uyqRkJB/Ld0AkrDE0E7BkjKaU
	1N0Cy+gYWu7UIcEMrn+6HluOp+F5afyxij2gn7/aacC87uOkY4dLuZfuac+0QviptQ
X-Received: by 2002:a05:600c:4508:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-483c3df76d3mr43199185e9.34.1772117469710;
        Thu, 26 Feb 2026 06:51:09 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:06 +0000
Subject: [PATCH 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-1-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vxDWvv8mb+epglkH3Hn0cudwOLibzt6cGtozzyPrd5k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3c2GnA9gi1I8G3fEBsZASDiXqkJ+w8y5qbf
 aD68MSc4ymJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3AAKCRAicTuzoY3I
 OiOGD/9LyXnmfA8v65VLdOqc+sIFDjNAf6txCZtaq/YCyqtmBqU4A//U5H+uZvKO70BynNCdlkt
 OeRj0H3MO91b55xITsQ1RhTDluACAPSkv4EiAfmX77Zu1emsiW694dkpfegawIc4ew8tQ9jv6t9
 0YIO33iFDE+BywuJxKTxGB+R1Nxi+yVkB4YO2IR+IoJTiSGAe/KAKYL2o7nzu/L0veDTPhgBEVD
 IYjFAmgSAkVk5MW7ktzXOIVBtntHu7jmpkSrMSaSYbO4Na6i4S5eErHWC8tzDuIJIC0TTV6u5Gz
 iR7UX+n8LDzKXC5wNYptLQMKiovTOvVr9tT98AsClzeqN3gfdUEyYkK7uEG+u8E0mezhsvWuNDD
 ntSzhP8zyZMZ4s256cvi471VECWYeInUZStVJpPXGWE9fFucjFcHvFguV2F5r5BWVp/XQCAN69C
 nCnRPFRlHl1HX75kXrn56x2xCPmUeY59M1IyR+dG6Z+wWXTP/qiGehZJI8WOOYIbTGxJCn2/7aT
 3CIRWJDgvFAx1mGlBn04cvVY7jaP5eJjbZJI/80oF/WRaR1nLKkCxcG+ttg1CZnPecT9DNAsRuj
 nw8A5/T7I8wtvbnbFJ6KREbzSBg2C4OgJ/rgLLxnFT1d9PrJ0U2VYjka0CsBJJOx5GQevOKqQBc
 SXFQKDeCbx2cSIA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94315-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C83B1A80EB
X-Rspamd-Action: no action

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189..f96411f481305 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.52.0


