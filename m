Return-Path: <linux-arm-msm+bounces-21136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B68D4FF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B07B31C2177F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5823A8D8;
	Thu, 30 May 2024 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVUdQoQe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4B24B26
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086960; cv=none; b=H1TJf2nHp340QMraIeuiXzpxVNm/3yBusobOifY9NaIrkNoIg7Zrof3bzUz1ZrYXRuAWvBovpEaggEqWnGQTUYjB2FbL8VJdw5MxgQVD5HKPxHGyK38WE+NLo9ubIRSj5nlXkxU/4Jlq51tAkKPLL5KtnEMvKCsaJZY4jPwJSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086960; c=relaxed/simple;
	bh=LEI8NB2yoyJhYOmR3mpKn79Gg22AlJ9hDGKnYrecM28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rxbI5M0455VZiOGrVPCHgphCE/E5NsE0l+hvhSrU19NSys5VRABdzhfX/qWPC6AW6roh+ss0lUIGkNvjHYWvs/m5ZB1Uz4u0LKBQGfoVgibq4aE0ItnB7rSvxXbqPBa/8WDW7jxaL+t0AypiXQL+w07xQhnkGzmUjK57qBehFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVUdQoQe; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57864327f6eso1750646a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717086957; x=1717691757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwoUKZh6fnUPJSb5Qldq0gQl9yODeDTa7DK/f4E4vZk=;
        b=SVUdQoQe++KjqmC4XwGOlZM7s3kpfdZTb1vOrMQn69ftTAyjIt+/bLE4sU3NZJPOyU
         ajmUF1t5J4q6ieMHEPCxC6l93sQAO3NHW+9jnBGS8J38rolzjbWQhEV/m1gesSbQNW6c
         gia226bYi0/yuxMgMtwAi/GI+zETvgJlGOO+qIEC+QtQRFNacoioSewnlzZzLYXjaADK
         miGu8PA5s+Io38+9z3wBK9NmT9qv+LNx87HRiBrBNtV6RVAtlAi7K5mppIXemN8KN2te
         7Lz6dM6s9fHxYvYoO9Ll5Y+NqC2y6G7Vakl8Apn2+M5WfYnxZLAsxrmwt7zz/py4FcTk
         ufyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086957; x=1717691757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwoUKZh6fnUPJSb5Qldq0gQl9yODeDTa7DK/f4E4vZk=;
        b=ImWldEa2qX0wACGNSTLnDJssOT6hE88d8SXpUW4HZCvnowIgks/4zEBLTgtNe8KqMC
         F1cZPORz4kWntfNDmVzClIVw14MVEzLHadv8033NxhbpZPBehitOvKKH5yJMc7QJencQ
         MTcf2V/Nv6UsBF8Q6Zp6cdjM4FwyOtZH40hrsnY99m7/RY6MC9x3lda2i1UD+Xbdo1Mo
         JGO4o3/MooicuKdppfNKyEX2O1yIXcO6XypGhf3p8hyI0fcIbJwT1Ebi0ddd+FTX0Ri0
         VhakHhk8/qCfS7h2Xn0x/BhWt+CHHGCJp+d7zJupfS4KfR8o16wq0ufZIzUS3HlL68C+
         OhrA==
X-Gm-Message-State: AOJu0YxX0bbZ/E4deCdf8y3Xw6CpYEU9FGaTylvosCMTg+eTHZpEa8Gj
	AKOdEa7e3kkrnFvv5HMF8dvqFersib8olu7+ezPfIogq8hV3PRG3kxb/NjjtcOA=
X-Google-Smtp-Source: AGHT+IGW3SMB6gAER0sbhRX95NMbuzy/Ew/Tchj0cRc2PxFEi/EKlQzcz1l+B7+tnmoW+SwqD/pNzA==
X-Received: by 2002:a50:8adc:0:b0:578:57f6:499d with SMTP id 4fb4d7f45d1cf-57a19f6ccf5mr2042134a12.12.1717086957068;
        Thu, 30 May 2024 09:35:57 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a10670df6sm1888885a12.69.2024.05.30.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:35:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 30 May 2024 19:35:46 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-2-6eb72a546227@linaro.org>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1782; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=LEI8NB2yoyJhYOmR3mpKn79Gg22AlJ9hDGKnYrecM28=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWKrnTCVOTWrXG13R48OpeoqH187zP5VUETgU1
 Zckz68tZvGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZliq5wAKCRAbX0TJAJUV
 Vn3YEACDJZfEf5Ph+48/LzUelRz6qqDQmU4vbhrHbOxmUZVk3ea24oIQfHerU3Rlef1Hnbvtn2Y
 OfFSqycHczQAv7VpUbLtFlLHIZMUzDmRdpLhBxuDwDo04I0Lmwyy+4Fw8MK0b5hHxr3Uv6/nPJ5
 Ui2LlFJmfLUSgxmrwD8MTRypc/SluJiNQY4RLFaWgJtNym+4knzs18t0B6YDG5gIfNWyXP1XgIQ
 D6yTHoQM3IWDyWiqfyJfPXgMTotDDfBvps6Nex7xmEBuPKTDamIExH14z5QI33XFYOoOXisyZW/
 gD+XjF62ErlxjbaKkH4vOq9k99r43awKT/vAbPvkYWc+Ryap+JdYe8EKnJ8Z1NlN7Q+nL1aLclx
 858Wuue7cuK0YLC9hsS6Vch2jA7KZlcT7Fhv+q2TJc6qj2O1tQ/zlfbyLTu2vDBIbkgoLCQI4fb
 cYg878NV9SCj9DxHZsygOn8WUovTRe8pkJ8kZFEX30w2TKSHiNhZm9vnk2I/l5EAHXgc3c22oiX
 13SyhAi0RcwR30cRMsa1isMSou/PGMvTMOpgYD7K0eYjc7AtHnVRrtvkuFplQ6jCK81GWZbYRMn
 8wblFaDvOZm5E5mnpEipDQMux8qUunCHqf7bcwoOwP5XzSBg0LKLzkVUh+lt0RTWYkGHdlx2gjh
 MSW9dnIA9LYvD4A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
Also add the missing supplies to QMP PHYs.

Fixes: 22b82135c02d ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 3de7565dda19..f4b47e6b3a2f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -537,7 +537,7 @@ &uart21 {
 
 &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_0_eusb2_repeater>;
 
@@ -545,6 +545,9 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p8>;
+
 	status = "okay";
 };
 
@@ -558,7 +561,7 @@ &usb_1_ss0_dwc3 {
 
 &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_1_eusb2_repeater>;
 
@@ -566,6 +569,9 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
 	status = "okay";
 };
 
@@ -579,7 +585,7 @@ &usb_1_ss1_dwc3 {
 
 &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
+	vdda12-supply = <&vreg_l2j_1p2>;
 
 	phys = <&smb2360_2_eusb2_repeater>;
 
@@ -587,6 +593,9 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
 	status = "okay";
 };
 

-- 
2.34.1


