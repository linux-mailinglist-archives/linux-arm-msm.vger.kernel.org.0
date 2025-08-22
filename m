Return-Path: <linux-arm-msm+bounces-70439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29279B31FF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67716AA2FBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55012571D7;
	Fri, 22 Aug 2025 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lCwRfI/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65CC24676C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755878223; cv=none; b=EKIumQcuwRbklbC/O9cae0kVGPhED+PIwvMgOVj4+j8qFPJOcBSV7a1q0h68Pn4XXtvYBriiby+4N7VtEpR1nLaxhes6mL4r5tLTSabMRdSQqPnM5CSN/XA12wJ87t0WIenA3QTbQueRsdKS6/hwBo7nzFo8DSPnvmy2WR6XoWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755878223; c=relaxed/simple;
	bh=KHFC3oSUyARY/aVGviSmjbC0ZO4Tvpg1AZ1CxPkbSaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ei9Dz0gu+s27JGBHphrDil9ohIbDh0ztKksd/rUuFSJdAZCcduPlO/7rhsn47EJdl1feV19HpZBaUnCKA2SlJa6IpI7wYPlzzS6GlmJIWjtkOLmRQLOPRzipBL8gQ8KST82WGnKAHtg7WsrJrIWOhGSOum4cKbMydT9eWOg4Nuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lCwRfI/j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1832825f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755878220; x=1756483020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gIJqXZNoT2iaKOQogoMlUwIgT2STqgUO0YTvgh3yWg=;
        b=lCwRfI/jCW/18NRDrP26oC+IbAzppqG4sOnKCqZ3ZiGUdaLCp0+JtL95I5pVfEfUoz
         2vRCljQNc0IzqbKFOYpP5/qZ8OcCGJZBMwuWqxZbQaJkVNa0H0bGJ79giUf551nffDnv
         +8THLpidGCdHgxV3LBKs1o2KlmfyPJtvEIrNDM2dqotQVaPsJbKsLZyVxXidjisOEJ7y
         n6UmsXNFLTa3k72qy67fs1RZ9cN8zhDkj42ecWguufC+xNZU7KPGIIbVg3bjbq2sJ/wy
         sE3RO2uk5rAkWMFLRCbNkj+oungkdLnsQ8IHWcbxNLqc4oAoMro/CugoAgeNHCfkjYcV
         boOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755878220; x=1756483020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gIJqXZNoT2iaKOQogoMlUwIgT2STqgUO0YTvgh3yWg=;
        b=PEDBAV/p97xSz2x4STykneG3AAkpPyNWYFct3XwyuRGo7vIcbXEjXT7pY8JvApgCbG
         w8rSVeUEHXWE8x4behyR2EPQTcJ3mfpPIqe+q4FHvtjVeSWg88E8UqM0/RVFkYWkbYJ3
         LZCCvUhBII+x5XSU0mCF8z4Z0sjpoh+3OnVZA8Sy4ZUEhc9G0zj/cx4HeLy7moOqp1P5
         6MYyuPGMYaItvfiToBV+RcR+2fq5CQWo70+/S+JcFNcjsG0olLFK7SEy4uuQ6HSXWvXw
         c/PffSylgwaejvDoWmqwN6BXBJNK5kirwX/JDIRIEB1tTYSuXq52O31E3J/pXO/r6lWX
         syLQ==
X-Gm-Message-State: AOJu0Yykp8rnyvkxqKPhFc48rVt5cbAHXU+JjsvMzb5Bl6705XvOAANS
	RiJHvFBRz+iOe5b/XzfQwFUuvNBvKmqSeNVJx8rUVk6SEl6E9S/5hSIqLkPdzMxx4FY=
X-Gm-Gg: ASbGncvBI3mtFris92OH2BfAFBp5qwLG22TrgofNxfL3aPtto0/1tTx+5h/PbtKWucC
	EmOjmBe+RNr2dLvYbtGdR9k+EjWrXtiE/8hnZUAuEmNZobTErIS7BvitAp7FPxJ3dDmQ/XNfPBb
	D6UThrxCW1JzIZWQuE5T04uDKS6OQkldCb095xA9iFoEcJLck68XXfJ1TVwXduqMNN+rqdHzH8+
	CJSfkfTame+0dy9f/w+/nMbQjX14r+GulqlDd7Tw92A6hJbwLsC9whisi3lTu9Ktd3gZg3aShnI
	SKVsCF/429IQmdnwQcHL7hryFgQjuLQ26TaB29Or+MICc1z6NDpbStiBkgCufoC7ML/rT3HYiqb
	r7PeJqsU9qpcp0qOSsdHMWVg56YRSqPJm3DhNctEy6vPRo2c7HphvBA==
X-Google-Smtp-Source: AGHT+IGYiaXPZHucCBBnXOmPN94jkOGupuLilAQ60PnrJmKs4Sddy87Oi7De3a+mFMhr2Nf8CMUnEA==
X-Received: by 2002:a05:6000:2882:b0:3b8:d16a:a4a5 with SMTP id ffacd0b85a97d-3c5d7ac658emr2574678f8f.0.1755878219623;
        Fri, 22 Aug 2025 08:56:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c3c89cd4d4sm10095765f8f.42.2025.08.22.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:56:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Aug 2025 17:56:52 +0200
Subject: [PATCH v3 4/9] arm64: dts: qcom: sm8550: move dp0 data-lanes to
 SoC dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-topic-x1e80100-4lanes-v3-4-5363acad9e32@linaro.org>
References: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
In-Reply-To: <20250822-topic-x1e80100-4lanes-v3-0-5363acad9e32@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2466;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KHFC3oSUyARY/aVGviSmjbC0ZO4Tvpg1AZ1CxPkbSaM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoqJNFQZ2ShNYj/h2qkN4MVwhpIPMscAkPaeb65RYi
 yf7auyqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKiTRQAKCRB33NvayMhJ0ftwEA
 CLY6UebsW3HmJbSGVZXeccwwSko4oJMr8RKVDijUKSMnkuvboRvxTtlDXB7zVf6Ihq2nfoyHc2xX89
 FNfpHHADMJUWwQgU0a89v533uoI1l2xCmKUpOLvFlTG1NiagdHM0REfr6paOj/qwWN7Ki/c/xFPTdV
 +Hrtl20McTJTVe07cdES2gQtB9/zJphznR5J5kmY+viHpjvVRpcwtuKBWS1l1ZQZUA7JZcIKKzCvJ0
 yCgSkfybCJ8tCqWhHQaJlnFTju9o/1iKO1L7h+ffNVSwBhAl4+HGaivC/3D/r977+7wY2ScXiDapKm
 uc7Y2FHe+x6OKiMXqNeGQLc56ibT7tykUORj19xt5oh8W1L2ycb1MAVwz3zc8vYHL+OBB9lJs95bTj
 hNV+BYp0gd/CU336e0U3jAKDIc8W3Z6TU1UxZ4VN1M+beN9i34oB3E8IzZ5GbKa0937qY6De+GAD0d
 otffPFEFRS1sf7LXZEwWyvXnCC4R4DX9HupNcpkm9dJv6lrQMAIuICBOJZVN45uICjC5PC+Ltiweiu
 eCGNEPIfUaqgcPyfMaZbsQymASC0/zH/09bSClEdP4rmO1fhOUs2eiGCKh4r32I1L49zPsPvJZBksC
 jANdPRVoAXqUbwVvnXz0ACKakCL9cynE8l9fG4vag2dBKOrdi5EHdijFA1pg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The connection between the QMP Combo PHY and the DisplayPort
controller is fixed in SoC, so move the data-lanes property
in the SoC dtsi.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 +
 4 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 9dfb248f9ab52b354453cf42c09d93bbee99214f..3322f2afd3d6b92d00cab5f03338fd1a474d6e62 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1002,10 +1002,6 @@ &mdss_dp0 {
 	status = "okay";
 };
 
-&mdss_dp0_out {
-	data-lanes = <0 1>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index fdcecd41297d6ebc81c5088472e4731ca0782fcb..635c96f929f4ec034db824faad6a2ba30110394c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -738,10 +738,6 @@ &mdss_dp0 {
 	status = "okay";
 };
 
-&mdss_dp0_out {
-	data-lanes = <0 1>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 49438a7e77ceaab9506158855b6262206bca94ec..4efc30fb34c0ba856d196de8be38ff2d2755c302 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -857,10 +857,6 @@ &mdss_dp0 {
 	status = "okay";
 };
 
-&mdss_dp0_out {
-	data-lanes = <0 1>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0409ae7517f239171a89bc0ba7bb47bc9e7fedaf..277820491e8e96ce282579daef5287f6327ecbbf 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3791,6 +3791,7 @@ mdss_dp0_in: endpoint {
 					port@1 {
 						reg = <1>;
 						mdss_dp0_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};

-- 
2.34.1


