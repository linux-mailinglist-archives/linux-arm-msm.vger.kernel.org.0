Return-Path: <linux-arm-msm+bounces-44750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3336A09505
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2EA16AA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E75B212B33;
	Fri, 10 Jan 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4ZHkBHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9D21171F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522493; cv=none; b=N2rnGyNPLUCVhFDIZ2nGeEFNySO2mCaudSXQMG9PFfW0g7VwcCC5CNYtytULsLID6a5RTbkAJhFrl3nfXrSQaukkTzj9A3CJWXEsRo5u/ycntoD8wIV6ACA6nktYMzuf/6X8x8HthYKzbbK46/2in6m+luh41MfBn5019AQ2iOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522493; c=relaxed/simple;
	bh=Ymb0AeEJoEt8Uxe/gwpXmSa6PTQndSChyuLj/xbod9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOBDv2gRjksA+W9kdxWj7R9HaL/iEHUJEi2u2BuHYvGmcyJ7dw4bWAkGYtNXuTWlkG+VPh3xWo03Ox+AnOl+pAn+gcyCnfzXl1TMSIwv/3Y/3Uzran6jYSkdThHFAzZZFt0Qan2Iur+gEjvBF3au5ExMuTpQ+A6N3yxXc4FroPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4ZHkBHA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so1956015f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 07:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736522488; x=1737127288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQLhbySfnErYI5L+WYP2/lw7Yfp4XbMZRtTzzuoAXbA=;
        b=e4ZHkBHAX6Jw41tOVcopozQ4rMj0evmu6hypniYIT1RY4tqRkvc3itXaV1FeLa/IMo
         psPYvHyYE4SuygGZ4nVQOVgGp6p60YxV5cU3o5VGgGFDrBH7DwCi4fVADJ8UAOl4vwb+
         YJM8/HJrSUnyDWTZCOYYmefCkPtqVFjv97z7fKo2ZPTJesSy813eciPtDxpLSIwyyaaK
         plgeu4NBNst2ZgW+ukwQH34zR3Zws2BeQBKg2Ii7IU+tCu1PyQ/zpO+OmEDOCIbS0Pxx
         bMRdWwRbi6hTW0ajA+jEI071+pBKIKzPERIGMn4S7zhQnj5PaSFfIm0rvTck27btt+69
         p77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522488; x=1737127288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQLhbySfnErYI5L+WYP2/lw7Yfp4XbMZRtTzzuoAXbA=;
        b=YtcUO4a61EWLEGbLxVGI2KXwz04L8/bYo3FzOkayT3yCRC1hI4gVKn+9N2phsvU4mK
         DuavvesU013UTvBPIXtLbmJdOwwTZPdpAUa5vwqz0awNnUefhhhq0OjtudKiILvgs5Wf
         7RTClU0RyInYlSOs406mRzeV0l3A4LjGDoAV48PVJKudP0It6l+P4gaxg/c2rE+Baxry
         AXHu/uxyiimlXIrjbXua+EoeWm2G/gGYuhc+5trbYSwHG/AAsMBY82IBcJdXsrWgbeip
         vYZJGyDkWPDSaAh1d6eOp6O8yba9Uz9U0NRxQRCMHgfsmeO7UZWEun6cURqD7ph/kkCs
         QdzA==
X-Gm-Message-State: AOJu0YzIYIFNZmNh+x3DKbse/p0b6m/y1BD23mVomIsRnIQtM+C+6zZG
	KjKbKqEBMBZJ7Y6kyjZ0pN6cD5bSkN5uTHhXVtSwTRfbc1Zt/3cyXNu7j0y7dCQ=
X-Gm-Gg: ASbGncsHN2iQfYjn9pWDS2BqIMZrhA3bPKaetlBd6iJcNqZk6TfId6w9WvEdkOu75gm
	efWDo41DJ883Ng2POr80m52oqugqtVTYf2T+iR3CTzwuoofXH3/tlTXGn1FJLx6oFnXiY8fQtw4
	hFoF/a0iefiRDe715dry9RuenZXgjTe+6F5uC0yqU+5deqf1RuDbkqMLwtDPgewQP+r0z/IDl5o
	vyhJfp7+bNYry5PyhF6CTEEIWzNjKUvrlb/vZuIPVhBb+ubyknPZtbPJY4wj1Nl10bkr9rVQDTZ
	XA==
X-Google-Smtp-Source: AGHT+IHpDZjJbrhE7b2uFZOEdPADRitA/G6CiSByFDis9JeS8Joi0Ti0C/1hoPTkGQP7wkJAwti4LA==
X-Received: by 2002:a05:6000:4b04:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-38a87317c6dmr8620977f8f.55.1736522487811;
        Fri, 10 Jan 2025 07:21:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92794sm88714725e9.37.2025.01.10.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:21:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 10 Jan 2025 16:21:21 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: add cpu OPP table with DDR, LLCC &
 L3 bandwidths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-topic-sm8650-ddr-bw-scaling-v1-4-041d836b084c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26925;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ymb0AeEJoEt8Uxe/gwpXmSa6PTQndSChyuLj/xbod9U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBngTrykfrr77Rz9VPS3TDycpTt9k4HJWGXyvaVqDCp
 IAu420eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4E68gAKCRB33NvayMhJ0XZgD/
 4lmemK9vhakkMYUSeMtMyEzrrM0/MuWdfzyIoqBYqpeSumjF8K/X7I9QzNP9kR5z6okRXgd+jAuxjV
 pYjO3z69GZq5u2FBCShK9LuwwZmwZK/FlbTn4bBgd0oxxSpy2c2CTjbCoPxHVn0niAF7orxgsg3Oz0
 WhsZ6XME6wJk90AKPz6/XAjPMvwyr3nrzasAe4MFKgGGZIaqg5SfoKrRxkqD3FYZ9+EDdrHCz3X1cP
 NEGkVZVMDG0Ny/dd3z2HPS1h7f1E0rRwtvnSNd0EScDhzIb7wOmUn0o+HP4qHS/vw6Vt2jQD1V/eQy
 dCDYZXeD3sxpPjP9JGNg9i4EQu7nc5ZJQYSbyhyGlCkWl+WyUOw7mEzVBWGRn5FBTJ+OEsJqz71IJN
 iUsUdcv8coukoJEam9ZUR8+/zQ2Wog81irU7rrMXLidt+8r0QI8If7NYmh6QaqcemBvctEFu7pW5NJ
 OxuHciKm3BbIrGeESLIKVqV1Rkv71lEpoBVgmSY99mpL7TdobXxYIapa4eVig3Qc+4gEgA63xjDQZs
 rLbzDr9rBKw5pERMclPJAbO2vVAJmg8odhai/S7dzJEDt1piIfpNSLEZFm0lWHaGKdL/4lbMtcj6nu
 pWcQpH8PEGZNZpMrZ65SveQHKytiEu3vefIf4GNPvfL+iUKWol1j/ExB7VXw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the OPP tables for each CPU clusters (cpu0-1, cpu2-3-4, cpu5-6 & cpu7)
to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
frequency by aggregating bandwidth requests of all CPU core with referenc
to the current OPP they are configured in by the LMH/EPSS hardware.

The effect is a proper caches & DDR frequency scaling when CPU cores
changes frequency.

The OPP tables were built using the downstream memlat ddr, llcc & l3
tables for each cluster types with the actual EPSS cpufreq LUT tables
from running HDK and QRD devices.

The cpu2 and cpu5 tables are similar but must be kept separate to
take in account that they define OPP for shared CPUs of two different
clusters that can scale separately, thus vote different bandwidths.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 871 +++++++++++++++++++++++++++++++++++
 1 file changed, 871 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e194a95cdcc0f0f692e62b942331cd9e07a4eae0..c638c2cd2a9b005fdd9201bd19ecc8b8173411da 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -86,6 +86,8 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -126,6 +128,8 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -153,6 +157,8 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			operating-points-v2 = <&cpu2_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -187,6 +193,8 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			operating-points-v2 = <&cpu2_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -214,6 +222,8 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 3>;
 
+			operating-points-v2 = <&cpu2_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -248,6 +258,8 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu5_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -282,6 +294,8 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu5_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -316,6 +330,8 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			operating-points-v2 = <&cpu7_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
@@ -483,6 +499,861 @@ memory@a0000000 {
 		reg = <0 0xa0000000 0 0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-307200000 {
+			opp-hz = /bits/ 64 <307200000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-364800000 {
+			opp-hz = /bits/ 64 <364800000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-460800000 {
+			opp-hz = /bits/ 64 <460800000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (384000 * 32)>;
+		};
+
+		opp-556800000 {
+			opp-hz = /bits/ 64 <556800000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
+		};
+
+		opp-672000000 {
+			opp-hz = /bits/ 64 <672000000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (729600 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (844800 * 32)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (940800 * 32)>;
+		};
+
+		opp-1132800000 {
+			opp-hz = /bits/ 64 <1132800000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1132800 * 32)>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1440000000 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1574400000 {
+			opp-hz = /bits/ 64 <1574400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1651200000 {
+			opp-hz = /bits/ 64 <1651200000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1689600000 {
+			opp-hz = /bits/ 64 <1689600000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1747200000 {
+			opp-hz = /bits/ 64 <1747200000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1555200 * 32)>;
+		};
+
+		opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1555200 * 32)>;
+		};
+
+		opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1651200 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2035200000 {
+			opp-hz = /bits/ 64 <2035200000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2150400000 {
+			opp-hz = /bits/ 64 <2150400000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (2035200 * 32)>;
+		};
+	};
+
+	cpu2_opp_table: opp-table-cpu2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-460800000 {
+			opp-hz = /bits/ 64 <460800000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
+		};
+
+		opp-691200000 {
+			opp-hz = /bits/ 64 <691200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-729600000 {
+			opp-hz = /bits/ 64 <729600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-806400000 {
+			opp-hz = /bits/ 64 <806400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (844800 * 32)>;
+		};
+
+		opp-1036800000 {
+			opp-hz = /bits/ 64 <1036800000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1075200000 {
+			opp-hz = /bits/ 64 <1075200000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1382400000 {
+			opp-hz = /bits/ 64 <1382400000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1728000000 {
+			opp-hz = /bits/ 64 <1728000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1958400000 {
+			opp-hz = /bits/ 64 <1958400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2035200000 {
+			opp-hz = /bits/ 64 <2035200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2131200000 {
+			opp-hz = /bits/ 64 <2131200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2246400000 {
+			opp-hz = /bits/ 64 <2246400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2380800000 {
+			opp-hz = /bits/ 64 <2380800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2438400000 {
+			opp-hz = /bits/ 64 <2438400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2515200000 {
+			opp-hz = /bits/ 64 <2515200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2572800000 {
+			opp-hz = /bits/ 64 <2572800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2630400000 {
+			opp-hz = /bits/ 64 <2630400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2764800000 {
+			opp-hz = /bits/ 64 <2764800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2841600000 {
+			opp-hz = /bits/ 64 <2841600000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2899200000 {
+			opp-hz = /bits/ 64 <2899200000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2956800000 {
+			opp-hz = /bits/ 64 <2956800000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3014400000 {
+			opp-hz = /bits/ 64 <3014400000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3072000000 {
+			opp-hz = /bits/ 64 <3072000000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3148800000 {
+			opp-hz = /bits/ 64 <3148800000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
+		};
+	};
+
+	cpu5_opp_table: opp-table-cpu5 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-460800000 {
+			opp-hz = /bits/ 64 <460800000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
+		};
+
+		opp-691200000 {
+			opp-hz = /bits/ 64 <691200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-729600000 {
+			opp-hz = /bits/ 64 <729600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-806400000 {
+			opp-hz = /bits/ 64 <806400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (844800 * 32)>;
+		};
+
+		opp-1036800000 {
+			opp-hz = /bits/ 64 <1036800000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1075200000 {
+			opp-hz = /bits/ 64 <1075200000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1382400000 {
+			opp-hz = /bits/ 64 <1382400000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1728000000 {
+			opp-hz = /bits/ 64 <1728000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1843200000 {
+			opp-hz = /bits/ 64 <1843200000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1440000 * 32)>;
+		};
+
+		opp-1958400000 {
+			opp-hz = /bits/ 64 <1958400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2035200000 {
+			opp-hz = /bits/ 64 <2035200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2131200000 {
+			opp-hz = /bits/ 64 <2131200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2246400000 {
+			opp-hz = /bits/ 64 <2246400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2323200000 {
+			opp-hz = /bits/ 64 <2323200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2380800000 {
+			opp-hz = /bits/ 64 <2380800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2438400000 {
+			opp-hz = /bits/ 64 <2438400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2515200000 {
+			opp-hz = /bits/ 64 <2515200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2572800000 {
+			opp-hz = /bits/ 64 <2572800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2630400000 {
+			opp-hz = /bits/ 64 <2630400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2764800000 {
+			opp-hz = /bits/ 64 <2764800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2841600000 {
+			opp-hz = /bits/ 64 <2841600000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2899200000 {
+			opp-hz = /bits/ 64 <2899200000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2956800000 {
+			opp-hz = /bits/ 64 <2956800000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3014400000 {
+			opp-hz = /bits/ 64 <3014400000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3072000000 {
+			opp-hz = /bits/ 64 <3072000000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3148800000 {
+			opp-hz = /bits/ 64 <3148800000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
+		};
+	};
+
+	cpu7_opp_table: opp-table-cpu7 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (307200 * 32)>;
+		};
+
+		opp-614400000 {
+			opp-hz = /bits/ 64 <614400000>;
+			opp-peak-kBps = <(300000 * 16) (547000 * 4) (499200 * 32)>;
+		};
+
+		opp-672000000 {
+			opp-hz = /bits/ 64 <672000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-729600000 {
+			opp-hz = /bits/ 64 <729600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (499200 * 32)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1075200000 {
+			opp-hz = /bits/ 64 <1075200000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1132800000 {
+			opp-hz = /bits/ 64 <1132800000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (844800 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <(466000 * 16) (1555000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1305600000 {
+			opp-hz = /bits/ 64 <1305600000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1036800 * 32)>;
+		};
+
+		opp-1420800000 {
+			opp-hz = /bits/ 64 <1420800000>;
+			opp-peak-kBps = <(600000 * 16) (2092000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1478400000 {
+			opp-hz = /bits/ 64 <1478400000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1593600000 {
+			opp-hz = /bits/ 64 <1593600000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1670400000 {
+			opp-hz = /bits/ 64 <1670400000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(806000 * 16) (2736000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <(806000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2035200000 {
+			opp-hz = /bits/ 64 <2035200000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2169600000 {
+			opp-hz = /bits/ 64 <2169600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2246400000 {
+			opp-hz = /bits/ 64 <2246400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2342400000 {
+			opp-hz = /bits/ 64 <2342400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2380800000 {
+			opp-hz = /bits/ 64 <2380800000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2438400000 {
+			opp-hz = /bits/ 64 <2438400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2496000000 {
+			opp-hz = /bits/ 64 <2496000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1440000 * 32)>;
+		};
+
+		opp-2630400000 {
+			opp-hz = /bits/ 64 <2630400000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2688000000 {
+			opp-hz = /bits/ 64 <2688000000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1651200 * 32)>;
+		};
+
+		opp-2745600000 {
+			opp-hz = /bits/ 64 <2745600000>;
+			opp-peak-kBps = <(933000 * 16) (3686000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2803200000 {
+			opp-hz = /bits/ 64 <2803200000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2880000000 {
+			opp-hz = /bits/ 64 <2880000000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2937600000 {
+			opp-hz = /bits/ 64 <2937600000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-2995200000 {
+			opp-hz = /bits/ 64 <2995200000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3052800000 {
+			opp-hz = /bits/ 64 <3052800000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (1843200 * 32)>;
+		};
+
+		opp-3187200000 {
+			opp-hz = /bits/ 64 <3187200000>;
+			opp-peak-kBps = <(1066000 * 16) (4224000 * 4) (2035200 * 32)>;
+		};
+	};
+
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;

-- 
2.34.1


