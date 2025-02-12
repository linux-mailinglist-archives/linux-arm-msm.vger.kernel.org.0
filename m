Return-Path: <linux-arm-msm+bounces-47789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E1A32CC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 18:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9883AB872
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18917257AD7;
	Wed, 12 Feb 2025 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tDBwMRXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988F254AFB;
	Wed, 12 Feb 2025 17:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379857; cv=none; b=aZ518+FlNNHpf1cZZeaGUaPUxKhUVRnOQVP/c40oGLyC8LvXk0USDBMNNoya2Zw0NOh0yPoMTuZxQ+gbWjbKLyl4hLSslF5eCHUiA3pLoJ9xq2eXANZRUGazFmsf7JoUsKvz5CckRryz/hsjX1jbZHGhsZTUw+Z3kMOzbTIQCxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379857; c=relaxed/simple;
	bh=qxSvwS7LGnVjmuaEB5mp+6ilFRpwQmLkMV8SxcXfcDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3PGn3H9BAH/kiECo04hbp3Xrq//2VOsQyejY+ecDM+8HtcM7dHCx8T+WGCEyx7xBwwT3xsR7dW1TGgE2x+h3icKyGxWbPneExtcaamwHIYzNwzPw2v0Zo3dAmrc1i4a6zW3BxuWmBh+1h54mIugzhMiEdPF9TpyudeSbOlvRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tDBwMRXJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C23D7.nat.pool.telekom.hu [37.76.35.215])
	by mail.mainlining.org (Postfix) with ESMTPSA id D0A99BB839;
	Wed, 12 Feb 2025 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739379852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bSfoy3QGNdxOB22ubtXeC9Plw+jq/RXeN8HXykGFPk=;
	b=tDBwMRXJyYqw60qGc0eIrjuAgZ3Kxx5Vl4Dx28f3iqYWY6EyrcnL64/oMZwpL08ldZOjP8
	xQNjyq/NHwNaQermnF1RVBXh3JvY2XpPRMJyvh/mZW27coShXBmPR7nboH7etGRbmC8Pdt
	EXOT9HbsAuAYWSrSf5cuqjlZ16+9Y/VdBnH3FwP6cvq5oiooH5jzC1G7QpTON4sjmlkojg
	rWJShkybERgKTNDueiAtZCWrXHEV8/u4ZDg2mbyo0TrXlZ6X1y/jWssEjNfRIq6NWSn613
	UqHE7eKc4c19VJl0X31WMn5iH8crwZvq/FVh38tXLnn9RYCgqc5mX8rKj0UeAg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 12 Feb 2025 18:04:09 +0100
Subject: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: Add SDM429
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-sdm429-rpm-v1-1-0a24ac19a478@mainlining.org>
References: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
In-Reply-To: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739379850; l=1852;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=/Ekn+CdQ9U9BT5Q0YusVh0Gdma8Ee1JPB/ygvkgrYWI=;
 b=cSQ40JP45cLZJqFy2jF+RQjbtbYw4mKK7H4lM0pE5xE1bTZ2DUAZtRITPlNn/X7WEiU67I40T
 +NnhLAVi4Y2B+J/9ZV+rips3kKWmibDo/mdP9tAF28Q2K3J37p38n8E
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

From: Daniil Titov <daniilt971@gmail.com>

Document the qcom,rpmcc-sdm429 compatible and
add BB_CLK3 clock definition.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
 include/dt-bindings/clock/qcom,rpmcc.h                  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
index be3835e2e04303dad483bf4b9d2e4ef3aab98c07..90cd3feab5fa0053ba532a61520f6ebde5ede9c3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,rpmcc-msm8998
           - qcom,rpmcc-qcm2290
           - qcom,rpmcc-qcs404
+          - qcom,rpmcc-sdm429
           - qcom,rpmcc-sdm660
           - qcom,rpmcc-sm6115
           - qcom,rpmcc-sm6125
@@ -123,6 +124,7 @@ allOf:
               - qcom,rpmcc-msm8998
               - qcom,rpmcc-qcm2290
               - qcom,rpmcc-qcs404
+              - qcom,rpmcc-sdm429
               - qcom,rpmcc-sdm660
               - qcom,rpmcc-sm6115
               - qcom,rpmcc-sm6125
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index 46309c9953b2b668083fbdaabdc69ae0ead7aec4..1477a75e7f6d7b87b941ee2ec849b80407ca1958 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -170,5 +170,9 @@
 #define RPM_SMD_BIMC_FREQ_LOG			124
 #define RPM_SMD_LN_BB_CLK_PIN			125
 #define RPM_SMD_LN_BB_A_CLK_PIN			126
+#define RPM_SMD_BB_CLK3				127
+#define RPM_SMD_BB_CLK3_A			128
+#define RPM_SMD_BB_CLK3_PIN			129
+#define RPM_SMD_BB_CLK3_A_PIN			130
 
 #endif

-- 
2.48.1


