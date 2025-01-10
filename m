Return-Path: <linux-arm-msm+bounces-44749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E765EA094FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C283AA394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A510B211A29;
	Fri, 10 Jan 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPI8csZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6982116F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522490; cv=none; b=aWxkP+EcQEVB1uqvpSWZLmjlLRzPtFvWGwhPCQWiEKPeAMbiZu7sTzKpRTV6RaHu1pGQulN80I5IW+I791tvKbWOSo4Q6Rh4FRpPWAtJQ4llf/cDJqwJXSZ+M/DtVW2wp2JA8OzQA/rZRc/xdLT+PwzicMHc/pK0BHhpOugrjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522490; c=relaxed/simple;
	bh=d+GjSlfsiPtSREFcW4TugBdSP8ZalkWtqO1Bjmm9SpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1HkOp3TI5LE+tvgJDHXH/uv3OOx2n4mJMAb4/YrDEfw9sIYX+UaAa9pPO/yEIUZQglO6ePDRIL9kvRzJrqPLFdHecOVnmRuMO3Dh8ona3c4I9q7rQJoEEaSijLGHjEUeDPOTDntdUHFepU05VHEmI9z9kRdNC8Uje0YvZYei7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPI8csZs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f664af5so25410465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736522487; x=1737127287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoASWxQXtVgWCHaFayYEr/E5Q8fw3DlK8oqmIqWCzcE=;
        b=nPI8csZsgu5uzC8nYy7Uh8JKo8MexFLYTQNiCSkv6lmH4y4zxwbcxaCJTGoVYBKDP3
         MZ32npWiZbGclPpg8dgE5uFPjyGjEmnxLANwHS5QbUbgfhYc1JWRrllV43tOZedFvp7Y
         0z2eaBd/hvvl/aiFnW5EmtTTLa80MqBjtbAWUZV3vWwTvaVAIueo8ggi9F/Y/uGbQDG+
         kGeByy73zcZZb9euNdbFJvRLcrfreol+ev1zlHewdTNzZVCdOJYPgoLl+iEiyum+t/Ob
         WpZGAFJrrGGOLHAKAUcR0P7dhQ7/m/pBDmCM4sr8wkoltgq9pQKm3hUDOTaUgRkwFUzd
         G/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522487; x=1737127287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoASWxQXtVgWCHaFayYEr/E5Q8fw3DlK8oqmIqWCzcE=;
        b=gmd0rbjCapQ9jnq1RTvUSfv/mx3KB8eodsKgrYbPtCRVpActf+hQcp+4QaYyBcIPyR
         GTG3jnG/BTKpsnKZq5aEJjJiXwBhQM3kxwhedhjZp8ZLaD3/IX1Ke8zNdg3czoL0KK8B
         TnSUU0zvWFZWx6KC/mZzrHUXgbfNKkdk8zbqGNIOPxeb2zdBy9V8Hf2dIbXkgPteBjt7
         x4pePen6cha/0+JjliGFHWQxwKxQoXpCDPzLdm4Tg6WPv3Sa08dp6ykrJiBjzAnG9qiA
         48hf4kRNBMLZrXat26o+kbAtDxACq5cNs3Sc/zD46vheucLRqcoBRaIboYSrRbrChZjo
         vJzg==
X-Gm-Message-State: AOJu0Yz5YzjdSAwuPRuHT1RE9L3+v+t8l/cMD+4eg0ngIpZ2C8BtwWMO
	w5fdGhYQiepUM4Ku5t52pj/J7s0HvFgWqNHCjvvZOJxca2VGoqbIdqdU02W6OaI=
X-Gm-Gg: ASbGncvWPAbcqUfaBNkIdsex6Wu4byKrCtbXO0QVGg9PP5lR1B1PotzZVeYiKYODEPq
	w1GZxTU5Toe/mh1LsdFzrW2Zla7eNrF4FYpppcsVHOJuJm+E2JHlrdnhNKZClur7K2Bmkt5RtCR
	1qGg6lGz5jLculTUOAjbRKct3jmdIpGXd2b1zvaYD+fT5LKtOKRJUx7XwFfz8c9AuNA4w6Q8sEu
	nyzecC0GZYVEflf50yO3pCIYs4jVmlRB628eoNQIQGhwVl11KGaKR5z844Ol3RVAEoNTrg2Oqmc
	Xg==
X-Google-Smtp-Source: AGHT+IH0/5SvIemkxkVipbI2iTduOiClq8UVFixxDUcDfSOKOclMzZ+vT5gGY1ATrXyJabSCO6Q35A==
X-Received: by 2002:a05:600c:4e44:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-436e27070b1mr100947085e9.20.1736522486808;
        Fri, 10 Jan 2025 07:21:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92794sm88714725e9.37.2025.01.10.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:21:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Jan 2025 16:21:20 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: sm8650: add cpu interconnect nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-topic-sm8650-ddr-bw-scaling-v1-3-041d836b084c@linaro.org>
References: <20250110-topic-sm8650-ddr-bw-scaling-v1-0-041d836b084c@linaro.org>
In-Reply-To: <20250110-topic-sm8650-ddr-bw-scaling-v1-0-041d836b084c@linaro.org>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=d+GjSlfsiPtSREFcW4TugBdSP8ZalkWtqO1Bjmm9SpI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBngTryq4Bh+HB/bbJLSHlqQw/GCyFv95Uv2hzD4Thd
 cx5ejUyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4E68gAKCRB33NvayMhJ0ZGJD/
 0WbtOCLd1Zon0ZVlw2QyaM+yLmR4VHsX4VfA23zhC2tjQjJHOz4g32E0EJyxyYy/diTYQ7LQRhIlBf
 /EaiW0lvV9lfhFsDKDYOYadDWKe2Psldsr/jaNe7GZPh+s3W16qH0EiC3GFxrkIrIbG+nl/NVfNmNl
 FjB7pZyTSB0It2eyLtBIp5IL2e0kv01vUBFXKwrXtohIUUQWj6WtFP6a3DB54WibOU6pltDLnnZTuw
 5X/lV6WGpz0rdyS0bF8mmn1Nxz/CYmQYuLYFJg1UPKH+C8sR/zuqrMFoqSHACT9mkBSh0ml3ZfB6kx
 xQ9pqXgwRjKLtPWOT7SRP84bllAFJUNJWhwV16CaeIypHWQRfG3DBMdVGfP9ov/usucyt4ECKvVlTH
 cxbHjfEcwbcGK7Hhx4ZqnTWO5m844jRKR3YaR3ZVKEpVrmlmTW+NtAL1Rwr+57EIldjP+z3ZHje3/Q
 4z94wh3TB0sVbO85a8bxiCyiofYtZxG+d/HXeyFPJU/C7f4YbZIcbjuXRO57YdjJWS53lfj4MudLjK
 ScwsBb54My48JXJzZG55lMc5554+OULKTm+nHky5lhzdxhEIpIeRk+m/DoO61FdD/HMWL/nRF9SCY/
 4kstLym/Zc2QFUEKdbiC3hWraKVB9f6vico1YaBpAmTQGSg+870tG3o3rz3A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the interconnect entry for each cpu, with 3 different paths:
- CPU to Last Level Cache Controller (LLCC)
- Last Level Cache Controller (LLCC) to DDR
- L3 Cache from CPU to DDR interface

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index bc09e879c1440873a52daf3fc7a38f451f1f972c..e194a95cdcc0f0f692e62b942331cd9e07a4eae0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -85,6 +86,13 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -118,6 +126,13 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -138,6 +153,13 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_200: l2-cache {
@@ -165,6 +187,13 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -185,6 +214,13 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_400: l2-cache {
@@ -212,6 +248,13 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_500: l2-cache {
@@ -239,6 +282,13 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_600: l2-cache {
@@ -266,6 +316,13 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_700: l2-cache {

-- 
2.34.1


