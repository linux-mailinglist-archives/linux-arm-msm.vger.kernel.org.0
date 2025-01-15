Return-Path: <linux-arm-msm+bounces-45142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA97A1254D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6523A6D64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03BF12442F5;
	Wed, 15 Jan 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEQNnmQo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7975244FA2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948654; cv=none; b=XJpm0Lyjkezyp6au69QPQka90bYtMZJpTk1klXiux4LifMVoCtTYnDIsCOcnNCt5ZyOFrxucJyQuXpVS3gHdb/pIhetPaVEWHygiNrfnVNMq4BYldRhleX8gmxxilyFOK5XEsUP+ldGTyLQ+943jb05xDCG9MntuGJpeZYN69qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948654; c=relaxed/simple;
	bh=xPels4/tn8OmIiuBZUI8AqxVcLWOtvfHzPNL/GpLLcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYhMv8V5FnsQgmhlff/0I4KaMCNHmXIKrj1pj4IGy44gngMzHwX6rx0GNZnFaLc8lsTPWDDWwPT9xJJEzUE9KaDOuNgri+8tLfki/WJ3GUnxCDJmdA7G2c5T7DkKbERi6zVLocnkfO9j3FY6ZupTyvMNNThzN1VoINrOnz6dL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PEQNnmQo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43618283d48so48332395e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948648; x=1737553448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3N0Z4U9e+7RVDupJlDX2nL44tH7ueyNzygcofMgc+wI=;
        b=PEQNnmQo4KDPXl56ghFcEnijb42YmE2DNB5WUbch4Cg86D6xes2gz5aVeWzUt6ovqd
         aw5zpLqnun5tqvS9ZTveSDshaSzlmW/SzkJ1EZ7c33EqKbW0xpvILYCVXuMX4qfdztoh
         CPbgchKYXQrkwsxvtMHHNa0yMwtbdZ4+96NJj1m9BMbKouT02BRietzVYjcI2KAMnz79
         8ZS7DqPuz5gdKctIjHQreX7WyDGj+NIdUV8Vkv23aZym+/UmMyY//+SL/sfZtfeoFlTe
         aoLXqYGEB12HB8YkjZK0UIF28W5ElGhkWy78PWwbAQzhqMihJlgpLfCx8/rY1k18n/iS
         CNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948648; x=1737553448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N0Z4U9e+7RVDupJlDX2nL44tH7ueyNzygcofMgc+wI=;
        b=OmUaNaObFKEOIcsEPSkRc0PwSmnC4oLuUKF3rKV9dJ7C5TJuOFmIwG8bKnFtRmHtHc
         ab/z4IxuEJiCYtH8wTqxYUiW4vjkCUdLIa/scHHS+h6Xsi7EHqOTa2lIM5zEek7gL2I5
         CDzJ/eu50W2YF0lew1SbXQIWHKKLmhZ92woXp1HSuM/NUoGc8y4jAVpuzD9uVrZJv/li
         Rq1JG270wWV9UhudJMnuWmt9uFWvJfZqXxZBx9VHFOVoQ1mzkKrWdyRty6rqLAPw/zrF
         knPSWENtbeQICpwozOQOUrdMExo3q2liVVOmgeatIawMvGSOljSP97LdWsoPyDIL08p8
         qhbw==
X-Gm-Message-State: AOJu0Yw1iAHxooY2m5iPxB5XnTdky3+1JwrEW4Da1khXdyf4/WJcua0x
	vmay+KoEBn7RFir+rtAX3na1U4uQkuO9ZXFVFUMNaj4m1hHkcgECst3jU5QplI8=
X-Gm-Gg: ASbGncsgnKRVJjoTExOxsmnbZhZhdXoOlYt2GoEdzs8t+vXspqdLkVk7elUR8N/dpEJ
	OIj03ObxYsbkF/MkphpWaimo9WwymKd+Y1KYPT2GUSahV8ixV0/lDYVXk0eqQz95J/+/MlBRhpN
	e+Wd7g0WNfzsjlWJ0IEjAQjLNVEtwQTeRkLP8FJzXCQ6+5S5EJ8ssmN2we/VU4+IcHGmmoCXiOs
	GWJeZ/9oXQ2U5nw0XwmjNx6II66Ok+DsVZaWz22xTWNQCYn4lV+CFS+ySV9ee/lXGJpJiSWmfOI
	TA==
X-Google-Smtp-Source: AGHT+IE5fYXAnQgrgoHTJV0sAlHDBBeE2UAImZXdng/YEgsQRUYzrcgRAGwb1T1nFVBrfSzxd6pVtQ==
X-Received: by 2002:a05:600c:450d:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-436e26a9510mr283840725e9.17.1736948648638;
        Wed, 15 Jan 2025 05:44:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:44:02 +0100
Subject: [PATCH 10/10] arm64: dts: qcom: sm8650: add UFS OPP table instead
 of freq-table-hz property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-10-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xPels4/tn8OmIiuBZUI8AqxVcLWOtvfHzPNL/GpLLcM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7ufkvSEN5CLjvs/+VoiijimJfJw9I/s77HHp8lE
 +vGV33CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7nwAKCRB33NvayMhJ0TNhD/
 4q967LN5TMSYvg+rEUYDAvJcUHaLzVb/nEuW/c7HcqFFSQW/MBh6ur/TijfCFsmICUmGzMlmRMcDsf
 htJ2Lk6hQwrBvL1t1MRiAKaNs+yL3V7FyYZKy1rxemZ5Q2ENKH+qKYlHiFRpLLXL06JjF5crswnCiA
 93CvTqSKdfgYYxCuEkXBKALG+Q7SIwmR9pu2sjCtVqNe8E+t6oEm2/7lD/5iN1Eovge9og2beFD/Yt
 Vs1Id5a7TlCBKcwFMEWWRMiraZvu5mAbCQWW0nos/3K0qaCsdKiPFQ2m7XtMnoiIg9/iLqJD3hbbgg
 cQQ+Ba6a9Sl0/MF3Y4FEV+vDcUF/CV/Z/dh8xTdDBLaO8qk3Ww8trLfpNFiMJNz6yXMetHsWOiJChQ
 I8Wgc0eIuBBtqoMLFIQFmi563JlpTwqDag6b/ae45ArrgwLvKPLGE9ZpuU6qCvocUGKUyUP6bPd3lE
 4UEmPk0OSyrDGmlGHUzie2mgqhOIW3k88KVlECAT7QH9hgV73H8L+Rajg3linxks/TeYChYC67KO/m
 pFNBswkW+YEA0xpUiUR/XpBJDndYAyQv6mE+Ua2VPg+tGEIeB8UoYgPFwpxng37JMt2qm/OadyttYh
 wKeKn+pA8BuYJIzi+y+kZADV5ZxL5PzjWE+OdfFmEdUQnMAhPawwpk7NfAlQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Swich to an OPP table for the UFS frequency scaling instead of
the deprecated freq-table-hz property.

The Operating Point table will also provide the associated
power domain level.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 50 ++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 82be3f9051705507767023d7e195489852223ce3..483ae63e6032823e8cc13e8aeb6db70e3948f02d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2900,14 +2900,6 @@ ufs_mem_hc: ufshc@1d84000 {
 				      "tx_lane0_sync_clk",
 				      "rx_lane0_sync_clk",
 				      "rx_lane1_sync_clk";
-			freq-table-hz = <100000000 403000000>,
-					<0 0>,
-					<0 0>,
-					<100000000 403000000>,
-					<100000000 403000000>,
-					<0 0>,
-					<0 0>,
-					<0 0>;
 
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
@@ -2922,6 +2914,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			power-domains = <&gcc UFS_PHY_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
+			operating-points-v2 = <&ufs_opp_table>;
+
 			iommus = <&apps_smmu 0x60 0>;
 
 			lanes-per-direction = <2>;
@@ -2933,6 +2927,46 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			#reset-cells = <1>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-201500000 {
+					opp-hz = /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-403000000 {
+					opp-hz = /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ice: crypto@1d88000 {

-- 
2.34.1


