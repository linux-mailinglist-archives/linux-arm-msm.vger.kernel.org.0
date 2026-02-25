Return-Path: <linux-arm-msm+bounces-94156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIBhNJQTn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:21:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 304D619981B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 021CC3229EAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057723DA7FD;
	Wed, 25 Feb 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n86yaYIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E903E8C6B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032308; cv=none; b=gR7g0q02b+TzUyS2hjV7eU7PQSYd3wvg195gLwNSoKGcpmj5vpNULGIIElMGt0l2dKhwhrEHLH/dJd8luO+oOZ5r4tgFMGim7Pii87tIPwhgb2P7C5Kog8UYD3PC2IKgdnFehdYBD5/jIu1rdmX1oeaK7IX1bZetktmkQ1nWWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032308; c=relaxed/simple;
	bh=ffdOZouM/eee9jyRbVzbVUr0Ik3pigc4zt1kRhz5RWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3Xj0M0veKsD3noRla2cHe9ktuUnTvwDJy2BNLb9CqXhp3O5XCBFaGJn0WOVA+nu4i2FYs0OMQvVvzvi0UEypcCnPEvC2TYTOrBxBIMoAnzUaawt683LCL6l7aIO9XN/EcpzIfKYxw1nvXF3jqN1Bd8yNHM9EoV4o6WVRQ4eKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n86yaYIa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483770e0b25so61059425e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032306; x=1772637106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGFOQZrJOZf49SF2iBhCaSmHOKvt+djVPL8D5paoa7Q=;
        b=n86yaYIaayyNEcSQXkdPmmfgidzCJRQUr7AGFM7QmK67ouiZtNCiLUttnVd/yE1Wf9
         1d7DxIRRdrMAVZy6SkhyooDOhPLCwevHcqlPrKgq6UBjwbkhUtPBBw7atNzLqz4BTQ4x
         JM3gHdvDJIykm2kORfdPw+AOgU1OaL/MKR8V2+r2CloLONUhvjzWzgA6QLN4UGpkRrLq
         330nSZBFREiUdBhWc3kpG+ILZEeQPQWTbB3yDGQDi4N76j2bSWc8lwOadaXaIle/xYuU
         rhs7xGyYAaGMPBW9gb0qnlQN2M56Kyv+dA7otl8oIuMmtcGmRovOwLhBpKBa8nGK5kCB
         btpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032306; x=1772637106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uGFOQZrJOZf49SF2iBhCaSmHOKvt+djVPL8D5paoa7Q=;
        b=aZv5ow5Y1vFE/WJkkOEyv0ZiqItLFOn+Lrpk1dthc87/6iPgbuLGwJSpIh620z+p0L
         yS2QxT/QnsOGIHuF49sUx5tYyVTvbTSL56nKFdfdAxz+ALdAwUpXQQY62DcShgAf1/bl
         cNhPtbk0/6IgPpVWVom8HQ9Apyadg69Xh5bXeeTVzNIr/bI8f4OzwVFtXeDu8nacGkHR
         7MzbjbuNp8sMJ5lFr0DbhkUNXyUjtc5xCGODuas6HrXzlhE44F9ZFHnwaG0c1eURUYN+
         PvNQYjW2R89cLrqzEJv67SSnyMirGamOWVTX5L6m77tLCD0XCbTSpzf64mnRhvQih2S0
         Iqqg==
X-Gm-Message-State: AOJu0YwtlboxMIKQVzChAtDVoDwgSsiCoSgnbDf2xZhMtFVtV33jV2Uz
	3DcX7ZUAA5OjoHX84G7AzhOXD6mKNmilB7UW3K1FJ5CW07BNqTvTvr8580UyyEsf660=
X-Gm-Gg: ATEYQzymlRZzd2pc9ubQ2IpHVQLqajKWKT9oUE8oNbP0GgJPoVbhnsSHM5JUcmAn0Oo
	inKkRk6dx0YnhMNfq85SBI8YRaNrkY6Z65ol4eTS5fz+6paQ6w7lm33MceNY0DRo/SYQ8tMxGqf
	PQZ7J27MuyX6UB236pwynk6GJDoRnkB4dh4bFdhAmqfLD84Gm5x4QkuNgCJG7ymvXjnZW1f4mQn
	bC7teJkiw7W8e/dAHgcQ3BtImofHCRL9vutmJ2LuPOjZfw3LhTbjF+pON3tJQ78FtyMd8U6XAPE
	6MBwXTRIuLRVmBK1eW78j0NqfE77uKC5eRphktR6WcW9Fz55te9XKbCg3/ZDVJDaT2CTY4NI9RG
	20gKxybGlLQ8NDiIisool7/x95Bf3syhwjs7l462sJoY7wxux1Q4Fd0yw9kweKNZWleEwpawnfm
	pjjR2ujwZ49fP9FS7w4T2UVLIoQ8BJ3vMQqCuzqWeS6ULYCUeQwu72auREcf3s3okS
X-Received: by 2002:a05:600c:1e09:b0:480:25ae:9993 with SMTP id 5b1f17b1804b1-483a962e3c9mr285163375e9.20.1772032305898;
        Wed, 25 Feb 2026 07:11:45 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:45 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:29 +0000
Subject: [PATCH v8 12/18] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1609;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ffdOZouM/eee9jyRbVzbVUr0Ik3pigc4zt1kRhz5RWg=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEb03ZTQ8/2qmvn6QMpOchTeyFvZteqtCylk
 72yhvwZpIeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGwAKCRAicTuzoY3I
 Ol4jD/9GPb7GYCkxoEfFGWpTkCbFWod0bgltfbAHPXaNh0CXXem2Za+ieC1+KbbLPyjYMqrZOol
 mSfpvzq7hhEqtQeCyb6OALBkOl6re7vnBgE27pBMv6EXL9JAP06rIe0GZb4cfCcRpFAr5NRhryQ
 8MELDRnDffz1fwNxiyflUDB1G83vy2Tm/M/Z4Kh4gb8fmFFVqDCEhoaG3W6fMFHZotSvxnAUq8x
 4G0HfndZvpwiI0LH3+9L9LZso3jZp5ibP96NCmBbjvw0kS8tN/BWTX6ZB5OrTluV8uaTvMEUpoE
 aS91qxzefeQjBBPw56IA37Y4t5ww3cZqRINPqVHjYOH/bp1/72T/7gb7AGjN5C/2M+78Fdj5u34
 iIKu7ecmhcMlbwJwssdmbkCtBGidqBx2qiqEOZq5TqXC6kahD6w+NnOnnXeDBBAZeSxTzOLODZw
 bkT6AMkK8yEi1bSLg5FonZy7iDwQC+GQqXfWdGrcECcpNFssYGTuRvbHm2vCOX9DPzY9u0cjixT
 V26QFf4RXVF8MRfGHGxFCfjPnqEdfZx7T6cwCJcXbUqz+4J6CYvfSw9+IC6rIeYiv5ov2b8THSi
 H5TnO1NVDYLEbEeAxxJoFzOjwdSZHXcQZ7I14GCErGO7lpypEqPfQ0+lzZkBGg9Eqs1Yc1P3aYi
 X6MivtBDdZ/MHvg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94156-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 304D619981B
X-Rspamd-Action: no action

Add pmic,id = m rpmh to regulator definitions. This regulator set provides
vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


