Return-Path: <linux-arm-msm+bounces-42563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BE99F4E84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBB5F1885C87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1BC1F8ACA;
	Tue, 17 Dec 2024 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XggwAmhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF31F709A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447092; cv=none; b=D6AQu68EbRzjThgoDfW6DcsrXw4I7bJTS5TmG+pfAogt+9FAhXU4F7UXwh5LwAuNloQWVo602siDMXg8XWasphYsf+l2fcEkP/pBg1qXn2SZ7q4FTnVEyjwYw0cqnNfig/eJvMiPdckGjBma94QMWNCPiRW1ccerH05mC2uSMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447092; c=relaxed/simple;
	bh=TRwNAhGHhGveZJg6Jt3v1KhBQ4NlTPzWkB4It076Q5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlSSJ+Dx8UFQ214GhPiaXWQf4r8jBo8r19hAMKKVLCxj+u6Ho672sNRrIML2Z99bzGKwR2Tql6wrl1jCOtjyxSXD9OcNDmlmuaxXUwdSMvciibhKQvw5A0dHzOy5UkCPwGbi9ykmc7niDWpz7BiE3nxGwTI1cmCkrvfkVDutlFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XggwAmhO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43618283dedso52842955e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 06:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734447089; x=1735051889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
        b=XggwAmhOFzs6hOAZ8pJaa+9yXBRnssjlHS7qBdqWGzURcHHylqy3Kx2t1Vllb7dxCM
         zmzyEHisuaV/UD5JPZ6uY+6yddrLSIMcavUEFHND5MeweHq8IhOhqCEJHYzJ/fYmBi8N
         85uk6rl9PGxiW0HtAOuZtHZ9pMmZXblnEQ7hg5MWSf+WCj8+bJH3Lqv81/iMGfaVanpb
         vyWgLRA4CF49jS/Pl1jEWvts+JlTBFmmq/RNNu2j8bwqClDhWswZpA/dXvMXU5zzT9zT
         5DwcIeSGcvXeB3/YOBUz43kaa3UV4LwkbPffqEjaDx8Ct0O0FoFL5gqOXgR2MGAH5AkK
         yUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734447089; x=1735051889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJE6jWewYLR4+WwL69RNcPxwF9+nvRISCL65MftveMw=;
        b=XnEF2AOff29qJnQyNH7EnUmiAWZ1gaTlWSbNqaCjGfocXWQOzRGijggtyM45FJJr5l
         IxAzgxKr9Y2b9bqi35Cl2EIshZaoiIcwtDe1udate5zSQnp5g0PhQ+aYbiyC1pvYdZC+
         AJIdJn2teA/3SCQQS3OnC24orZCcfapt1Hej9QZ3DgV++zY/cZmRvN7hqLZwsK/i38rx
         hNivzNysA+G3SG32eBO50xXz7n4JpyTruACOGw0EalznE8vlWXqYpM0Y40r6ACnToJpe
         1p5qHYB7bw6FgEeH+1JN1DMIQ3PxsyMQS0FEiILZGcstOufDV8+jPyn3K2qkCLcj0S1y
         3vsw==
X-Gm-Message-State: AOJu0YyG3OGQgU2IAl6hmCl81v5vc2eaftCbLrRLRruYo9WZiRgnY6xt
	KmtXmj0dyCaQDSyGfo2fjrZwvSbjzRMPhq47ZtMLnJtLG/hg7vU/iF4lHLhVrHHetZPEaQaPLoY
	8FIM=
X-Gm-Gg: ASbGncsvDQuVtxaMKfAkDHSymV/IK9icXiTA6SixEbZiPRaNzgfWZXp6z4rJyxSaamH
	QY4OrQMnT7MqrkvSCifqF0NsFH8rWxvv5jG3z4b4oOvPslUZg7ko2byF69E4LV4710kOHOj/fec
	9uHJdrMueTGxXf9QC9i24J8wIIbBAiRd84Phttu+Q8GU6HEzgxGbtyTzrtbZl0EVamhrA8eD/Eo
	uwSr7S/8chvCmpnT767K/SFXOenBb6mzdbuzOWvuUGrG/i6/XmjQIUKRLGKyrHVOFVhKSnsV5NO
	pw==
X-Google-Smtp-Source: AGHT+IFUHbbW3BkUovJZZOWhbSfd7ks4S0Ah5TbZBB34UYpxXhgyo5k1ucB7eyhgyysOJiFAhcz6IQ==
X-Received: by 2002:a05:600c:a011:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4362aa3a029mr169784665e9.9.1734447088961;
        Tue, 17 Dec 2024 06:51:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43636066f51sm118417375e9.22.2024.12.17.06.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:51:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 17 Dec 2024 15:51:19 +0100
Subject: [PATCH v6 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-topic-sm8x50-gpu-bw-vote-v6-6-1adaf97e7310@linaro.org>
References: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
In-Reply-To: <20241217-topic-sm8x50-gpu-bw-vote-v6-0-1adaf97e7310@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnYY/odnHxZWWHGZfFp55MjWvpXpUwEvrIEZN9FPq1
 IpBDrIqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ2GP6AAKCRB33NvayMhJ0QfID/
 9uMLHn4VVbaJkMk1lETarrEfDU2ckUcBSIrrTfcMAWM4YcnY2BoD6AimxgH7fHmfXp2ahVg3FYkkth
 Gdhsu5+hWloM0tY1K1mgKDPXrkW6X4lri+6nMoKV8/i0/5HbXBp1NaQXX0w4CB9XhIZrQIFGm30u7q
 PosUrvdbxK3vq630WCHhcBmRSBwLomeR0bi2Q0WVa+t4W0pMG7BVrGj0RfbPj0fX29vWNW7j7LgNCX
 15HobnWm7M7GzSjTBJjX7cMR/txtcUrlGz1dOvAgFWDundZgEIwOwfdcnqNISi72DzTrC5lt9UODiO
 1cZt1Bqvl2IFrExK/RGF1tokvIvKomqPFOCSQr6/Fo4BkdboeaPos0hGDoaNoCyZZv3JJsPwOCM6Ji
 UblKj3kilaprVUOQqhvTTwhZhNPNXTgq4bvoPgVTJiPoPX8pNOcMgiOET1JEKGZBVb/Rl3sGK0uSBm
 ZCg5Opcndo7gBGIBNM9wZkqvLBzgCW8rz81oypXZxmS7dr5UIpmYuVrav2Mk8RT2lm+VsHjsQ4eETo
 jKbteo0PmfHfpwr/8sMSDnMbbGSVDYiT1b7dnL1mxFwvBqpKF1NXvrCSFLm4DI/mMEqNZTqpn67z0r
 HWxyHdHVD/2vDP9vmdAnMaEWiWQnKkZvUo1XPkBEfx5GdOsL2MP1aJpHE5qA==
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


