Return-Path: <linux-arm-msm+bounces-41434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6089EC754
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E536167A33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCAB1EC4E7;
	Wed, 11 Dec 2024 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VCReXDdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C041DD894
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905810; cv=none; b=GaeK16eXg6pHZiwZekJndgA8TJkjebkVVoB0vo7n0Q/jH/9dgEeaBpLAdr61ZnO2938uq88dt2lbm56hGpeZSu60U6LPLns7yAeP/GvmXW5glqijkuhxHvmHkKZX9p+mAXwZhwCSiHTY9hchIJlv7l9a6OIagFrU68G6N4WD4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905810; c=relaxed/simple;
	bh=TRwNAhGHhGveZJg6Jt3v1KhBQ4NlTPzWkB4It076Q5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbcsceBQSgYuInC1Bi3bkdSQZE4msht33gJgN+2xD0Nl/mLqyAGRHWy0bi4EjxXzweOY+Qx8nkjJ+r6opmXO2iJiV/ROKYBIEgr0eukY2tl8zFyDbHjLW9kIGTTddoU4JNpd8QIIrI/xvw/jV758NdX+Er/zIrYZGOGqHHJ0Pv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VCReXDdb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361815b96cso8553355e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733905806; x=1734510606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
        b=VCReXDdbF3SqguK6S0B7v6xj6K+Vdzst45qON9FIa/DIkfj+7ElJ4GD9oUfyLcI2wl
         ITXPzEXVbQ+6rYx4C/YdyFh4bV2nGC6P5EjEvYJjmrLYSKVVcm9IKv/tdQy2He+72WZH
         WCH8lSZkpI0R4lqIMlc6cVzjFSsZ4b9lJPQUX0npBlFnZWLufq3i7Gr5wKseY0WAm2f1
         3H5jIOkKP7nEvEsX3UKQP5Xn1nR27F9ADz8YR5kJzmGrQsb1l2e2zIW1RKb5ZvczPiyJ
         07OrmWJ9vNVi0+azGB6qteo9VQfvvoYj2U34UGJd1372d58uci5RXVWs12YFWM7CxYtX
         mqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905807; x=1734510607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
        b=nQmdwvLTFWmOAxrCzyNSKSGdvExVpuvsOmIvQMOZG+vaivhmxx2baojjMcrnr88dGa
         UHQHnMu4G/AFnPOh1HHyQ7eqnc6fc0BcVtsuocVLbOocTPGhMDccwxu3wGp42gGuxZIO
         6IJhQtCaG59HrefT2dGlw0GNlTP0gl0y/SZLSRiUpmplYgqODbi//+KxHqUV98clmiH5
         4MJbuz19zmTYGJHF102sAW7jTsjVhW356ROPvxdXJeoESuslfwqVIhHa0HwosctEcfXe
         5+zd/50YIebi3RyFlyJTRcjFLai1WW7g3h/hs4E4H1dnY9m6CitOz5bUw07oFml7bfNJ
         E11Q==
X-Gm-Message-State: AOJu0Yz6vDmGbMX1lVwyl9Hg302jmPSv/YN5iW6gUwL/I3JRy/rY9puo
	J4iJeQus6zMTLyPIJbVWbioukIiDDP+u6fCYdtBlS4ftfHpqyJrtfJ/9YCmRpyw=
X-Gm-Gg: ASbGncv0KXuJ5AJxqOe8op4CsXLm5X24kh0/izegLIcMLzvjsFLfRB2ZvvFeocgxR1V
	pS4zXMYuiOB7E3Vx5O0WW3IxICLU397799BgH5haGdNqcD8ImWkZBCvPoC2/fTKFOkxftb82DJQ
	+eX5q7CeIaxSN6zVv2feP43DbVDhdcuS+XEHQWs/QcrzLmwtXQmHbaSSO2xzdtfwgpcjgL53DID
	c57huY3pV8E97q/DlerhSsPf1qZ8rOO60nX4TZmlGEGg7+Vm5FlmaymTnauNUNRuJSUfJSXIhw=
X-Google-Smtp-Source: AGHT+IEUW0/j6mo/cphlP6h+I+zkwofgriHLT9wdAyPVKtEJ1u7lzyZIITwTPRB+Ctkzy3cAPNR3Dw==
X-Received: by 2002:a05:600c:1907:b0:434:ffd7:6fca with SMTP id 5b1f17b1804b1-4361c34469amr13541845e9.2.1733905806625;
        Wed, 11 Dec 2024 00:30:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:30:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:56 +0100
Subject: [PATCH v5 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-6-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TRwNAhGHhGveZJg6Jt3v1KhBQ4NlTPzWkB4It076Q5s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2FA2VPuTGXFnwJEd+MglovyCJPCjTRgawXwdkJ
 c9Lin2+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhQAKCRB33NvayMhJ0VIKD/
 0enVnSmdAg9FuxyRRV2ix6HrTWcoGkQNwZVZT1c540JRfipkIEbGsWfGAnBVoUl3tSAkV73jOULxZ+
 hdKixrVaHfXVgOW6eAbsO4vW/ebwzI7Ss/ay7OWpxcXEBd+ZwP42sg/QRVpWsWL08e45AJaY0QD6Tm
 GCBUZ2bZyD01G4EbRlIutPvr4gW0uvJPS6jCTi2h8DATZ0y5+t5KkGp27NR1+WjcZptAQi7speJq6y
 PgVREfhvLHtw3rqE1HHPLf5/hVRZs6Yx3B4e7xnfvy1Yrlxdm3vbkdGazngKSjT+MsU0zJx95EfrrT
 6i7WhiMdynEbxPsPWMXmNnNkyzr5AqMaOH5FrNlsdOQnvxau/+X4hUHBvmTdLw24MGMGeNrm4NnJII
 /oBwgI/95t+oSfiSEj1V00jVnZlYeFHgV5T3+ahFWTHdcN7NJZv2PYrJDjn+NEeGhJMEVyg8s6fdAw
 GO9v40k3Ywgb0NM+x9CjiSz/HUIlinU0bGZqC2cb2DUzLuEyWllQKqMI9Ur+J+JQ7tjQcHRF8n7mBY
 J07are5KHIeFi1wsg275CMIBiyZFvJeuRTU5LLnLDv868G5PiFXfsTUHyGdZrIqPj9/rEkppyDpwRe
 MSnwjKhCsboqd1tJ1dHG0y9RnG3f9kr7X+whjnrDI6FZVRgLhsbaijQvWO8Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Each GPU OPP requires a specific peak DDR bandwidth, let's add
those to each OPP and also the related interconnect path.

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..dedd4a2a58f2c89b6e1b12d955da9ef8734604c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
 
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
 			status = "disabled";
 
 			zap-shader {
@@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <16500000>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <12449218>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <10687500>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <6074218>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
 				};
 			};
 		};

-- 
2.34.1


