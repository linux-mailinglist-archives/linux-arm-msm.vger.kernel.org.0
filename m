Return-Path: <linux-arm-msm+bounces-97763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG7iIylZt2nQQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46158293501
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0A00300F784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B1924677D;
	Mon, 16 Mar 2026 01:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwisNwyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D752264AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623578; cv=none; b=r3rVvkTkTszRc+uril8dgXa9KhOBoI3JTEw++qQWK2w0cUpvBJA6pxCybOhZ/tO2n7l0mr8FPw68AyD/yiDfbCSStShyzg1cYImM4b1IwadXSNy04kFmfF3MemhM0v2hDzgisRBw/emxV/G21FyizvU121qyPAStOQlQr6j7XwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623578; c=relaxed/simple;
	bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGC9eQu6xzJhD5QG3+VCbp5GBEtN6pnRo1fmGU4ToBx5FAPJS7UGuAfzNZSZk7MPV+CbEYQLSoMPAn+9/03wvOJ1xjQraXq+J7MM+QJyOPnGLvzmNyKAyfJxMlt7Qr1Ssy8wudYNGg/5xqO774fAe5k1t6ko6XGG2GfPOpW+iok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwisNwyZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso35555065e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623575; x=1774228375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=MwisNwyZxzhTHZgtpN7EVok0iF4TK5I028x5EbvSTMg49jAWEW/9CDbQfvRLMJiuZm
         4qQ6hRS5RURltA7FKWrC5phqvbuEft3HuKH4aEHv+h8hoRBtpkzTzOM3oYXlmU6mVT/p
         Th0JgQeq0QyKH68LEDmSoUJr/NekOy59Kk2x+jDJq+bJ5vJhem+RhSGVSd+T7dbB0G3S
         FtLxcl5gGeXcYThjIcSX9cPkIrV6k+G1tcAjBFVCh//kNa5P9+aid/McgSp/9IecmLFU
         56yr2MActtudv5dm4FrwAlNQ1wwVgd9bGrdoQhuo90L2h2XYkw1gO4ic8wdbgxI4BJe2
         ODGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623575; x=1774228375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Z6/U7PnUrwuHg9KKOxLA9kV52dFoYuRPPc7c14Ax4g=;
        b=qJ1d1SqCxwPH9TBVNeAiu7xrH3sCgdSC79Aawzha3Jm/VEgQjVdqUhBOIxxUuUA96r
         XJgsSJ8//QfC9QaNaKvAtdhlKZ+rjqu01Gtq2naeHMa6kezrt7JNQewwOzdNbbW4kSKi
         vmwt/CTknQKd+YFtmozbz3QLwNBCpjZq6l5EOOYqBmz8zBNCpC60KyNSueoMMxXOVUqj
         iXjnx/RPgh1Ttnp3VDncIaL84T0K1gZZ29+pYF/YO5CocvmBJnmyfGrjuXyvP3+fvk3E
         zC2/vxgI94XO65lnUZl+wAa1VgrxCBi2cKMx5eedmlk6rFLq9/LwiYYqQDHbPTOMzi0f
         tRqw==
X-Gm-Message-State: AOJu0Yz7h8CmO1Eev+JHdy3JgK0KL/WKji0KOUfOPTZ7GWdtZ75S9cge
	pkxCqRHBJgWzxOnh4KEk85yNRCuC8j0K1fsEg+PqyiZc75W/PvATCeqsjRg7JceZOCI=
X-Gm-Gg: ATEYQzyVqJAY4TEnP8CMOud0GLqaKnObLYi5aozW+vuMCYNuiNnHLjZe6e550iu1QPe
	u9n7S9ipLBwWUjB9cHCVuIKZUMdrhemJSbvY4oH5x/DGyocsl+JMPvXMZG5SK25GkYgbQkyMnBu
	80ec3oVRhHXwuccKbjrihI+USrNHGiZeL+mTxMdzcNJkErK88xZn4qmObbQgzxg2JPE4XworB4I
	wm6mXdvHiCFji954uzfVQi3xmu/ym1/4qaqxSLQLmpz5dgBoVJUbDr8KiB3OMBkfHLrisQBWOb4
	WcHhvJ6X0v4wUF4uYD8sHHqaXRnD7HkEdJcqhMIpdelfj6v2N+4UOdc3QuDQZS242oTrxOg0VQR
	sZSjw3YXZkYC+J5AU9lMfDGkgnjCNNgC//7vz3JBynVxpeDr+BF8xeDRBVIEs4gsSR7CNavgCfb
	9eaBUvrg048HM5eYFk2i7hyu4S3rMBNVbIAiE=
X-Received: by 2002:a05:600c:a15:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-48556710fd5mr194203005e9.33.1773623574896;
        Sun, 15 Mar 2026 18:12:54 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:46 +0000
Subject: [PATCH v2 04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-4-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=S6iJnHFPbJLaLr3h0qEMNZIwUOoiDKNDAFZUs4m9niM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kZIeGJIknON0Y2krnsX4nihvpR1GGUsO88x
 haeKCt18qyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGQAKCRAicTuzoY3I
 OnCHD/49onbYFTdPe4qtKm2U0W0z2p4W8cnYwE8NJrV/E/hJbj/wjHtkGK1fi3Ep0wn5k350Z+z
 GuUvgtIOviOQtUsGdA4gWFRicSyEK+ASS+nVDqJS6NOZLNh8kuhc6l4Uq7fycoJ/+mmWaptplP+
 CKyUBQ5jqDETfNn+OzXyQS9YpxMeaY0BA+YSL33wXeHua5h1JCow+QFQpiWKyN/aSvuH0A6D1qF
 51ygVYxxx9s4BoYKQtEe9AlCATUH0mVKZcLQro8Fk8LVHL6h54sHvGtEpTfKBBXxMtK8q9nTp5s
 P1KeZFgTDFE45uQaXItj8BWLZQ63AAUbKifvHLoGvlDGL4L31ZTyPi1J9cKMKQPcnHZJrSEnjaD
 QWRiaj8QGsyryqJEw5UUopdBT1DogLaH2VFN3ZltKqjzalWbdTBb4TvMKuqB6s2D6dNa80aF3as
 D/1UympB7J1lREyaAjVg+23TujuoLuFqDySpzZBEm6tu4KtWUqBza9Sybb+sbHIbS5Kghhv1GOt
 gezY0+EvHETcDk4n+wb1oCs13tFnpBTjyMkYARHuN3GeZWSzh87iUfIP05DfHXYWk0dGAkfKZ8p
 QnfkqdXH6K9zOHZrtNqX40AgFXkSUdDNaBBUgEUwmKIZnO1oUUCo8gWjjdc1VY2I5bAwnletXVB
 GOc1JN4b6EQg5sg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97763-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46158293501
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489b..c89f5ad0aed56 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
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
+		vreg_l3m_1p8: ldo3 {
+			regulator-name = "vreg_l3m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4m_1p8: ldo4 {
+			regulator-name = "vreg_l4m_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1808000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7m_2p9: ldo7 {
+			regulator-name = "vreg_l7m_2p9";
+			regulator-min-microvolt = <2912000>;
+			regulator-max-microvolt = <2912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
 };
 
 &gpu {

-- 
2.52.0


