Return-Path: <linux-arm-msm+bounces-45136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74741A12531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0511889EA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133BB2442FE;
	Wed, 15 Jan 2025 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bbGquNb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E352419FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948648; cv=none; b=rO7pH1smuBs3J+jPSh7Sqo4PHxFC2TttAQZJt4yPF9OH24yPOuwaEA//n7JKIWLoOv9xaMTMYJw6PuVuUnRgdr49YjwXhDJnWyJQAeysR0YoOh+rr3bN5/qGsvYAQ9SqYwC4xQFXlHDN0bAbxrYyJlCUgvdsXyNyJbXVtskhnpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948648; c=relaxed/simple;
	bh=qzTcigZstyLboeTVaoUs52duTEuw2lg0BSOpBkPeRQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WStjxDehexFuGtk711RezbeG8QCY9XiVV1uCCwjLBbOA16Q6snNslkAMmQLCyB5TVsu1F4vFcm/nAjwhhJrUedEMJQW5m1Hf7AejjpfGYo37v8VRA5Sg1yVbgHVo3kSkpxTuY9k4SxfZhFgOgYMPms6WL5lPY5Xyj6vDVZWdXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bbGquNb1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43626213fffso5396515e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948644; x=1737553444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqyDas9s00LA0iEJHHRQJ/aOZ4v6G3z1/JDp1CeeJsw=;
        b=bbGquNb1O59kFO+BGji10v6VIIWwTJR+KDqJ6pdrlP3wx/uv4o+BBOqgKXobtWW09J
         xlCXvnsXDE3K1yFz/CSmvTLytSaUU25azEkVD8xqITZjXSwZzuNUNXNO5boZjKGlIdeX
         ShJVJ1z5Qa+pZf9PGu5ebVJa8DWsXUPMCr0orNza7ZeaP8U2PazgywaWY9pTv3c6dAah
         wwNqqU6WPrRCd5bBtfScdrSaFWmEIaWjeS5xgnh9gWklv6Z7q1VC6QYTmUVwbBMmNJ+d
         v0HGEqOEJQaHb0v3Go/QEXEX/ipObdF0cp1OsgZuHaFiskUyK3O7MKaR4ME4V4oDYYmB
         P2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948644; x=1737553444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqyDas9s00LA0iEJHHRQJ/aOZ4v6G3z1/JDp1CeeJsw=;
        b=ZP1L+8BY5uAYr9HxjAU8ZUk9g8kCjExrAhwkxG3FH91X0uJhPD7c4PkK6sDtRj5np9
         3erl+xFqFafjPYv8glruZHyYKAs00Lr97yNA6VQTeIC61aKo7ugxWQysQKTiCDcXSLzQ
         0zmq0NUx3wud8NVtQJC5GHISyy9Z2Xal2LRxJ3nRUR3xOghvvhEFznWgBWiBgdZCUEnx
         0wyXl3HpemPc7xImTylFf25EqV6HuU3Uecu8siDN8ll+PUI2FNEiygPeuk3VKLJFMMwx
         nkSPaTqWiFc9QPAA05hE4YBmyCdgOFlpkiN5bt20Hs2X6yYj/L9TQ9VHM4mIoOOGqZw6
         jWmA==
X-Gm-Message-State: AOJu0YyNMPxc/wAC6mS3oFepjd27qne6h2Xjcq4h2L57I2ozxaokVm7+
	MRTRDu/Ujlr0ibVoPda1+liNjnVO8rXj8I8ioPxmx/O/WQPb9a3wa39Z/X+nQFA=
X-Gm-Gg: ASbGncv3VANnd9bwczAX12V/5gOV0sCOtxXV/BkEsyPkoECzTTtu4jhTuq9rRVVdR8N
	7zt/WcdREpe2bNQMoBVdMh1LnWgOPDcgPHrVRig8+cKFjHOpYbvG7CqdwXaoGfF4EDTjpwMQLCl
	IjY3Z0+csQYAOuwPU8x4zs6Nd0VojJV73NUnSAmPZqFwFKPQQ9SyT+jXarI5HGJUwlH78VQTiRt
	IxtSt9tiE2MYQfaOiLGhPshE98qBO3bSIoeAtSDQFa7c8qwSuq8tbDYEdwHWEK949uebnH2nrYk
	UA==
X-Google-Smtp-Source: AGHT+IEl3dzVDWhN3QAg+1M+h0D5wvxiPHWLRRTBwQ0AYKTHJdvk2uGST9RVzFB3DwL1Wg4FcHIQNg==
X-Received: by 2002:a05:600c:3509:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-437c6b02098mr26659665e9.7.1736948643655;
        Wed, 15 Jan 2025 05:44:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:43:56 +0100
Subject: [PATCH 04/10] arm64: dts: qcom: sm8550: add QUP serial engines OPP
 tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-4-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=16115;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qzTcigZstyLboeTVaoUs52duTEuw2lg0BSOpBkPeRQM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7uc++/nDnjk9Ka+0DkaDg1xUSMhNhE/0qN5rGvT
 iuWaj+mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7nAAKCRB33NvayMhJ0ViKD/
 4uqXUAaroiBwF+j8e8BxCf8rxUZ1joYUSv1scNctCf2BQ/DDTvdzDQ5++WPcDaR0k/XZNQ6CN9U5hh
 cRQRrHpGkxQyQmNa2N3ybRzu6t7DIcxt5zlVORnyS1EQv7t5zUR8jjpE6hQOoS9cndQu8YmAOib/4G
 LxcfXSrNRrosNWG6z8lR8hwYLsscNL63rhnDgrq6LdDqEjynd2fhUJKCg2GYu46wyck6OQwZE57Z85
 4JuFlKT3bOHKybujuJs9lCvmhOprjaLXvijG89DMAWFU2VM19KDjkVb48WgIiW9L8Hm6mOYN9KBj+t
 OV0jjiwOQdl1Z5e2owYWp78GLZgzJ1pF2x+SW+fEDEFr4/XTr75bsYlxSjws5ZJJZKrf+pf8KfYiwK
 14Dyj7qjpXPLb2UqJGvGTsaNxdVJ+c3s2gkokBqwM63BZK4RC6NCY1yXHLB6oRTezWmY11L6W6A9eV
 qXDLNcJZUvCXYFU3Jh7HVC1O+L9jhYV+hyVDZ2UAGhpjU+Ot5QiKQ5ayYbunQGnFYNA54fBHpmuHlX
 3xpn4t6dwCGMgHuhfmn3tf6Hvk172fC0nDyD+h4JDrx7CPcVYxvSXcPTEcqDMDlBds9Dhm/z+ZlKsQ
 ePLZK9ZgXFd+fi7XxL8JZGOcX5tN6zZhAejdnqivjB498UNySF1PL7zm4hTQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QUP Serial Engines requires different power domain level
depending on their working frequency, add the required OPP
table with the level associated with all possible frequencies.

For the "I2C Hub" serial engines, sinse they only support a
single Operating Point, only add a single power domain level
property.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 122 +++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4b3c51fad9f19a1ec1e5d563a18fec9633a4e4ae..d02d80d731b9a8746655af6da236307760a8f662 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -348,6 +348,48 @@ mc_virt: interconnect-1 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	qup_opp_table_100mhz: opp-table-qup100mhz {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+	};
+
+	qup_opp_table_120mhz: opp-table-qup120mhz {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-120000000 {
+			opp-hz = /bits/ 64 <120000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+	};
+
+	qup_opp_table_125mhz: opp-table-qup125mhz {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-125000000 {
+			opp-hz = /bits/ 64 <125000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+	};
+
 	memory@a0000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the size */
@@ -861,6 +903,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -882,6 +926,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -907,6 +953,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -928,6 +976,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -953,6 +1003,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -974,6 +1026,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -999,6 +1053,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -1020,6 +1076,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1045,6 +1103,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -1066,6 +1126,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1091,6 +1153,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -1112,6 +1176,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1130,6 +1196,8 @@ &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_125mhz>;
 				status = "disabled";
 			};
 
@@ -1153,6 +1221,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
 				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -1174,6 +1244,8 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
 				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1206,6 +1278,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1225,6 +1299,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1244,6 +1320,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1263,6 +1341,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1282,6 +1362,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1301,6 +1383,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1320,6 +1404,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1339,6 +1425,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1358,6 +1446,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 
@@ -1377,6 +1467,8 @@ &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
 			};
 		};
@@ -1440,6 +1532,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -1461,6 +1555,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1486,6 +1582,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				status = "disabled";
 			};
 
@@ -1507,6 +1605,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_120mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1532,6 +1632,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -1553,6 +1655,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1578,6 +1682,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -1599,6 +1705,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1624,6 +1732,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 
@@ -1645,6 +1755,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1668,6 +1780,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1691,6 +1805,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1714,6 +1830,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
 				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1737,6 +1855,8 @@ &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
 				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
 				dma-names = "tx", "rx";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1755,6 +1875,8 @@ uart7: serial@a9c000 {
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
 				status = "disabled";
 			};
 		};

-- 
2.34.1


