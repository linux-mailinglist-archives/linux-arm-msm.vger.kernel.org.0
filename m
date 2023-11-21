Return-Path: <linux-arm-msm+bounces-1289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E57F254E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 06:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F224628287C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C7E19BC0;
	Tue, 21 Nov 2023 05:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="aTPIDFXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4387DE7;
	Mon, 20 Nov 2023 21:35:58 -0800 (PST)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4SZCld4B57z9vdw;
	Tue, 21 Nov 2023 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1700544957; bh=MmG76V6PDrwhqMIcwgqGcDAMHsJSPVsWoCHsN6e0BTk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aTPIDFXB5ClBTAfjwfhU6lCB4KyM4cz+0gz24/nEB79UsBxW14ngzMr8mpy2s671q
	 9CFaA62z4QgJvyiJgRVVwIZZfNFF1WZccFuPYU0BPHNsg/x9N+jYef/G5YB3WAWiAZ
	 +KL5DCcviA1uDPT0VIJqgLpRzgiQs4QTreWany0o=
X-Riseup-User-ID: DAF623205CCF3F05344EF028622BDF111F6D6E5F4AC9744D2562F0232B3ACAC0
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SZClZ4yg3zFrxv;
	Tue, 21 Nov 2023 05:35:54 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Tue, 21 Nov 2023 12:35:00 +0700
Subject: [PATCH v2 2/4] dt-bindings: mfd: qcom-spmi-pmic: Document PM8937
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-pm8937-v2-2-b0171ab62075@riseup.net>
References: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
In-Reply-To: <20231121-pm8937-v2-0-b0171ab62075@riseup.net>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dang Huynh <danct12@riseup.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Add bindings for PM8937 PMIC (qcom,pm8937). This PMIC is found in
boards with MSM8917, MSM8937, MSM8940 and APQ variants.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 9fa568603930..8f728920df9e 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -66,6 +66,7 @@ properties:
           - qcom,pm8841
           - qcom,pm8909
           - qcom,pm8916
+          - qcom,pm8937
           - qcom,pm8941
           - qcom,pm8950
           - qcom,pm8953

-- 
2.42.1


