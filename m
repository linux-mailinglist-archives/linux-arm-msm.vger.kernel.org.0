Return-Path: <linux-arm-msm+bounces-16494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A78899843
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF9E7B2251F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 08:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA49C16131B;
	Fri,  5 Apr 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuhftbVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061AD15F3FB
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306506; cv=none; b=cfd/2uiH0ec8aTqY6E9QvT4lh5belQgUsg09ODGiH6q3iSiPlC9T/1XQWYy6Nkag67F6LQXe16ya1j4TA2QqlhozaRUzchQvwVeEHOHvyNXrIkkUEWCq3EmHPkkC1mzy1pwnsQmJ/qGgKhY+19lP3gGN3dbVFbw8LfusKBqRPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306506; c=relaxed/simple;
	bh=PVrRjCh0+m8251gZ7iZZ6NbUkAGAD83HtonfciqKPAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvvfntm+moGkolFF6wE+4xE+DK0C05A/mU9dZvfr5W7ShhALgD+OcBs9FK48TDpVLY0qBlSRMRTtKNK8TPwiq4ciFWVyocKc9joFv8mAjsVK4r5STvWYnTkla4KrXIxvScgseGlB3PJVdMiDRIX2Owadqs+DKAbAlkYKgc3cd2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuhftbVR; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d718efedb2so32340181fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712306502; x=1712911302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X04cOGIXIpn74O231A72oQJ+8vGZIsJ7iLKhJyEMwh4=;
        b=KuhftbVRV8fo2Od+ewwdK06hc205ol+IrtoxLvx4I95W/ZoAKD1oti7ZKlny0ix9Ca
         44VaZFbUw1L+cpNPOW8vJjh/KTk+ya570qxTdXtfoLRy6XL9rylUHvVCmn+rOlM8Ah4F
         R0FQHCTCraazWNE/dQp0Vacw3+5Aos2COKQVrm77jM/1tGPM7jenVZ4StrKX4zbefxFo
         SRoRZiZJmA+K7mL+daOqWvrVhoRdDwFfmEcpGcDQR2udgH6fQSDXKcPaJmOOGXTKVPjJ
         YFJYYs/xhovOzlCMV2XYI5U9eIwVypCdfdzVPSVYJlbjCiNZiZXQICWubDWkaIM86KD0
         nq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306502; x=1712911302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X04cOGIXIpn74O231A72oQJ+8vGZIsJ7iLKhJyEMwh4=;
        b=K/PBsPpPOp7eGqL3pqIx5BP/suR9X2sd8on0I4ZRNVi68TY3WdxJDGCXjQbrWtVdw1
         kH1dk/wlQUOMko585sUBHzaff6Wjt1KROmQv5MVRy9SFfHXFsGmwAjdvU2bzmAQLxQXI
         ni2QoqQTOEU4g/SfJnr+0ijrUj1qX624ZL1Py0AbKoqMcTBo4IwHDfTmao0hQnqI9Qfr
         e9FqKOZ41/MumW/cueCioouKL3C6s0vqjx/vmP8LChOClkbaHkhFzGBNoqVxCskjHCh3
         BjLaGJJNCkOLfL2V/nSgg/CfbnH3EjW8OTv8jSQMHtmWJLFhC946UZYmqYnT4EDF294z
         0xqg==
X-Gm-Message-State: AOJu0YwxCHOWmsBHvDdyMzKh9r7hK3rO1J7fn9sJOtUuUSwd92QERB46
	ExP10JfcInA1Zk5+9FltUK4oYjsoRd7UpGUThEvlSHapUT4EgHWrk4ZYY35cDHQ=
X-Google-Smtp-Source: AGHT+IEaoyjVPXNaHJVLqh2HFfjOBPe62rwY6OgCDrYa4WIoKPR3hqGj3KeEFkwYiLQdakO91Cypiw==
X-Received: by 2002:a2e:980a:0:b0:2d6:c749:17bc with SMTP id a10-20020a2e980a000000b002d6c74917bcmr897025ljj.31.1712306502374;
        Fri, 05 Apr 2024 01:41:42 -0700 (PDT)
Received: from [127.0.1.1] (netpanel-87-246-222-101.pol.akademiki.lublin.pl. [87.246.222.101])
        by smtp.gmail.com with ESMTPSA id y3-20020a05651c020300b002d429304a20sm116880ljn.8.2024.04.05.01.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:41:42 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 05 Apr 2024 10:41:34 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm8550: Wire up GPU speed bin & more
 OPPs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-topic-smem_speedbin-v1-6-ce2b864251b1@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
In-Reply-To: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c

Add the speedbin masks to ensure only the desired OPPs are available on
chips of a given bin.

Using this, add the binned 719 MHz OPP and the non-binned 124.8 MHz.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 5cae8d773cec..2f6842f6a5b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2087,48 +2087,67 @@ zap-shader {
 				memory-region = <&gpu_micro_code_mem>;
 			};
 
-			/* Speedbin needs more work on A740+, keep only lower freqs */
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
+				opp-719000000 {
+					opp-hz = /bits/ 64 <719000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-supported-hw = <0x1>;
+				};
+
 				opp-680000000 {
 					opp-hz = /bits/ 64 <680000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-615000000 {
 					opp-hz = /bits/ 64 <615000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-550000000 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-475000000 {
 					opp-hz = /bits/ 64 <475000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-401000000 {
 					opp-hz = /bits/ 64 <401000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-348000000 {
 					opp-hz = /bits/ 64 <348000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-295000000 {
 					opp-hz = /bits/ 64 <295000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-supported-hw = <0x3>;
 				};
 
 				opp-220000000 {
 					opp-hz = /bits/ 64 <220000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-124800000 {
+					opp-hz = /bits/ 64 <124800000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-supported-hw = <0x3>;
 				};
 			};
 		};

-- 
2.40.1


