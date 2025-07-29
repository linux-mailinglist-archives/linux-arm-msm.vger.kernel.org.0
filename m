Return-Path: <linux-arm-msm+bounces-67017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CDB14F69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A4C1743A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E651E570D;
	Tue, 29 Jul 2025 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmqdD9v6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695E61D7999
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753800058; cv=none; b=cyWRQbepYgLIwkYpUu/yn1bagM3Y7/uCWNj36Pp4dLdLsU5zIKJFUzCG6Soq4A+IMd+hjPIsi81BHDzslhvVmdazr+JjmcHV9d1kFN0BDLiR/EJMNEcSDz6Cbf5mtVPGRwynP7x+siGR3XKveaz0Gk0u7IrUbEm98vdTehffiBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753800058; c=relaxed/simple;
	bh=/wEWbb465ExKV+T7bJ0HBejuyU/5tcn2W1sfrgwD5RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NlEEri297LJaYzyoClI8TxmmOEMpqu+wI/qYntaM2A9IR12omZmQpwCwG32wyyfgol8Q6ZmXQluubLDyl/MXUJnsTvAoIA+l2tDkJ0fYSqA6rE+eewQPc6dx82qSPLNA7iKIsqyWU2nqrpwTGIdC2Y3fZQaMvl7XCVTYw1NFY3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmqdD9v6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d7b50815so36903935e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753800055; x=1754404855; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLh+h6RKVeRF9vn5UFm3NrD6UnKkA16N3AUlT26ZJdY=;
        b=PmqdD9v6An1+tISU9C1NIgBip2fT9E54Lgv0eUWJ4lILBOT+Tdvc7sWJdgxoiExvx8
         GMwS9eb0iR6IjYTvPhOKsPPuaY1yBFgncu30dXKiCkbSdjwu4U6j5jcNsXNhi8gxVzOQ
         NoQo6DwQmV9rvQBUxA7JnQ9L4WCkAsJ5/dUet9MJCTmVI/iM4Vm38sSeTszuQ8FIW9Es
         /NHUVrQAxmMpGKX43zQjLHzp9l2PbnopK1aDDF98nHp7rJmm5He6W7xEKh6NOGkkO74d
         BnL1iKZPRgleRutMq6aoldn3gppn0n2+UwjW/IVXNgf2U4sBDDgM14V71ppbwCczeLCj
         ge+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800055; x=1754404855;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLh+h6RKVeRF9vn5UFm3NrD6UnKkA16N3AUlT26ZJdY=;
        b=FdNMDOP25LlYnZcgEww1Nh/t5I5pbrIQdoaV31aK1TJa5QMSRCAJCRlE03h2wcWtnL
         jzLzGTJwyNIXyCR+gHJnIlFvgFE8+UQmZrGtz6/haiRHyh8q0o434Eex1ju8t1sCKdMY
         0ysOFOpfAV4stdPq4KjjhY/Rh/yXEv9XALXeYqu30MO2GehsCTM0RZPEUUCI9ZVIF2hs
         1T3zDHsJaYb+v6/6wYnZOEiRqQxP/FhrGSb2cCrp3GJTuLWL8inEgWefTMeA16lX8dPI
         uEvYbb5ZdzeeAXN39m0EVPjec5HzTPLejlY4dYcONfGlhuVp6BUhetMhmKkdDDJWvP2X
         N32g==
X-Gm-Message-State: AOJu0YylOYb+sFtnpNRXFo8G0SCytIAwv7mafmE4yMEkhhZ9hrgTiurr
	a8TxTb+2ZUiJVifC/21HPjBHfdKME0PfGUKdzDTIGcMTILV3+BwLn06Sb8g7LUIks1Q=
X-Gm-Gg: ASbGncv+GywZT4p6yH1DLgdDe8jdmQ6VR0CY22AT3x4l49y/5SWl3m7W0EW6U9S7ff2
	N4wWOrJhRPQRD4Gl/DmnluYhIZ1LZOYbIBPmwYGkPNoCk4cE1loCmSPfx3XevoxuqP3dyMDhgIg
	RBiXltW2wPNlWVPMfgS/72PvZ0TU1TZFjCjaALWr3Ey5YarUwhLj+BjChe3Fn3PfBBDeAHTT/5/
	4hgKSesBude8SDj3XRSc0+1pym/rmBdw/owN+Bf3q9N+Ho7zKG8oF139rpOyLgnZXJhbfVAUR0p
	b933KPc4Q94lFV3Rz2R7MXd+q/LiJpAtPdx73Y1p4sly+Ssfbr8fPX8dGlYlcQXndcPyFwrZOmX
	u9bQMdlolzvn6EELls6kcsKR0skmOE8Ee6olkiFD+vkY=
X-Google-Smtp-Source: AGHT+IHBsI8akUAB8ZaPm/sK/iMj3dMqBC+QObDZFmQGFYf3egxcWft/ROffrFyyMewtCfDIUC3npQ==
X-Received: by 2002:a05:600c:c168:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45892bbf6b9mr363055e9.22.1753800054669;
        Tue, 29 Jul 2025 07:40:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705c4fa5sm209048415e9.26.2025.07.29.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:40:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 29 Jul 2025 16:40:53 +0200
Subject: [PATCH] arm64: dts: qcom: sm8650: Add ACD levels for GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-topic-sm8650-upstream-gpu-acd-level-v1-1-258090038a41@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHTdiGgC/x3NywrCMBBG4Vcps3YgicZWX0VchPRPHeglZNoil
 L67weW3OecgRREoPZuDCnZRWeYKe2kofsI8gKWvJmecN6178LpkiaxTd/eGt6xrQZh4yBuH2PO
 IHSPbeLsatMn6LlEt5YIk3//l9T7PHz5K+WB1AAAA
X-Change-ID: 20250729-topic-sm8650-upstream-gpu-acd-level-1c430e7f158f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/wEWbb465ExKV+T7bJ0HBejuyU/5tcn2W1sfrgwD5RE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoiN11jWR6tgvBZ0xh3A6BhjSIlYsio74lH6G8TOZ4
 kBvyJ82JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaIjddQAKCRB33NvayMhJ0QbYD/
 wL4UncnQOs+FnvzT53/6Y5not95Syq6kTxwIxmPL8b8x9aOjuZUx+KNT0LefKRcSl0aSEJdIgp3TwE
 ZslycokuiS8LHSMz/X9qw+NyCLrdgLbJ0x2QCjMZaOXGJg/TOXYX2A0/fDUa6YRudSMyUQq/qnP1FJ
 GWmbJV6bVup1RZTnqqS8rh55AgRM5s5qs4kmQvB8xg4AN/7FQdPp5u1JeFLNo82LcAL9aT1tDbLJE/
 OEsAxW+HdJNetrz128L5STcTMis2JqXqUs4xTbkEz8RB/oKHqePF3lakj8vwjuEOskjH6F0uUg2+2S
 oTYwQDiZv9PzQh5Jq1r/lArSPB4vAGfBgvfgKPHR/QRLjNc3OIBYMLTredvnxdIxXmBHXNwz54836U
 EAAro9oia5APz3mYPjWdcKoyUd4Z8iZHJ1R3KJNUhOB3GbCsBaMDWyK3+e/ViT3JppX2XY6uWgFf9i
 fJcm2tYdA2G2VeO+0MvdVaV5ve1Tn0XKYZ3vSVi6FODOxiWeGTMn3YZR6IQhaCqlBUxAJDWaoYWCqZ
 yxzzvy+sFanq2qr+9nGOoEG7kjTEhvKO8FQOm+LQaCk9uE7mZV0yis8Rr4BT/vcffAVZ03RijRnig9
 n2UpynQrCEt6ytkRulI40u6BLdGeYrqE6+lvXQ3DHIO62D2gEc4N4E7WzSGQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Update GPU node to include acd level values.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..4cd933219ce008bd1c603c87778e210b6332e29c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4127,72 +4127,84 @@ zap-shader {
 
 			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
-				compatible = "operating-points-v2";
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
 
 				opp-231000000 {
 					opp-hz = /bits/ 64 <231000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
 					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
 				};
 
 				opp-310000000 {
 					opp-hz = /bits/ 64 <310000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
 					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82c5ffd>;
 				};
 
 				opp-366000000 {
 					opp-hz = /bits/ 64 <366000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
 					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0xc02e5ffd>;
 				};
 
 				opp-422000000 {
 					opp-hz = /bits/ 64 <422000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
 				};
 
 				opp-500000000 {
 					opp-hz = /bits/ 64 <500000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
 					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0xc02a5ffd>;
 				};
 
 				opp-578000000 {
 					opp-hz = /bits/ 64 <578000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <8171875>;
+					qcom,opp-acd-level = <0x882c5ffd>;
 				};
 
 				opp-629000000 {
 					opp-hz = /bits/ 64 <629000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
 					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882a5ffd>;
 				};
 
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882a5ffd>;
 				};
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882a5ffd>;
 				};
 
 				opp-770000000 {
 					opp-hz = /bits/ 64 <770000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
 					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882a5ffd>;
 				};
 
 				opp-834000000 {
 					opp-hz = /bits/ 64 <834000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
 					opp-peak-kBps = <14398437>;
+					qcom,opp-acd-level = <0x882a5ffd>;
 				};
 			};
 		};

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250729-topic-sm8650-upstream-gpu-acd-level-1c430e7f158f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


