Return-Path: <linux-arm-msm+bounces-56425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5785AA684B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 03:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420C41BA7F82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 01:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3276D199BC;
	Fri,  2 May 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3c+aPwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E552F50
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148545; cv=none; b=FyfCNZabEBwgEXaepieDqUV2tA454i1fA8sm4KjSOjq7hb2lyMxjrf5PYIijPk3mseYH78WfpClM2wyG7Olp2HCJS2E+YlHvVUCUivCOFf4oBI4mm15cQdiTxefeLFywXQDGgFyERYx1HaiuUwgQQq4/bv6x7znoL605Uv1aYCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148545; c=relaxed/simple;
	bh=7tblKRIEs/wuHiRfiDyfbeKTY0Tq2mICunAPZlfSnAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqR0rj1fqp3nZhx7UxrfbK2HbXWdUsGeTL7T+B5jT6WQQm1wpzbzIvGR1ld76BQXo8kS45covgzYN2WMmsEscry6723YAfLSRf5F4B8iC1oz9MTxccDnAPpzQdMXn1wb27IcGj+6VJpFXlXEKjssxyl015YT2S36eG4tXQP06dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3c+aPwB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso982264f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 18:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746148541; x=1746753341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olGP6orZfNAwJCaA6Lz+3muHKwDTOzLKnHavYSk8xUo=;
        b=e3c+aPwB9MXZSLvJvcpTaFcr3uJiJ0ih5MNsXpsgsrwQWKoSKuVzEM8D/BBvvzvkHP
         /yERUKOhee2Vi6KpV602PlnMWaFVQtsnnyFiKlDrvIhEqDleG8Y+bH3jbBQVNsLsLV7C
         GDVRt08jFSX9Usghl3ILzV/CQ5oqmlvLzIuV3BDHG8US2KmOXt4OBT3KECM9BJDPyofx
         BUdfOECI454a4kOh1kJnCJaWS0f2KaDwRG/p0IfkBDi7sJ0e+mDvFR1yk9ySqhOGSL2f
         gsAi914Eb6koMs/6n2qG61Z0AWgL6eBcOlMrosYC+6JyM0WMhdzUwL+/Z0fIsyy7LR5t
         GjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148541; x=1746753341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=olGP6orZfNAwJCaA6Lz+3muHKwDTOzLKnHavYSk8xUo=;
        b=YtHukzuXTGEhT2pz/4nOGCQEKQmLgRZVZIGTW4LCJLqMvgTPWvmXgWMvJKt490s/ZX
         YGqwzaV2eFE/c+zvcnck5R/5QufhBw/YSXQ9jfQ5lvLiH/AsklM/kDAntFH12Gb/YUr5
         ZCF7OIaUSJ547Ve0JiGWrUonusgWUMOH0nBYMYh85pxccsq6faFft9OOAk+Bbhgm4VQ5
         gsxlKXZVpwEwRqU379j3IUbwS8120gDIDsEgoVdAvK4bTl9hi6/bha2Fz+yapZUq/AtW
         x1zJjGPtn4OuQOh5KeOIk6bfWGTHXYQ7BX3P2fE8H6mTEqDXAJa8Z/D1zEIBML98wkCu
         /MnA==
X-Forwarded-Encrypted: i=1; AJvYcCXPHeOasFyuNArxpIvbcN4I266JFRh2P7VMLXR2/IRlHZ5r55bUHl/bjmsDSy2MWUwZOrIe6bRs/3CE4UL/@vger.kernel.org
X-Gm-Message-State: AOJu0YyhvbyINwae+XPtrlxwtKuHkQVkGzcvdBuVVtC2VSr95VcytW2k
	La2Rq/gABUy34bGVoLmhr2AW6xAm6sQBV+l2DtNDvwIoqr5328aUr06WjmnbzHE=
X-Gm-Gg: ASbGnctn7ckfw34OSokJfBIxMvog3EwjTXtoeKezVu0BhhMZHNMOtq0y4lUcEqf7nW7
	22m1UycuMwdmuLeXNva15pGl5rVg0skRADN/uvnEVj/Y1RV90JiF54U6ZR7GlnpgBE0xMWXSlzB
	C8fNtw7onvzo6Mth/3Dqz0cTKBGG3Djo7JFDTmF/wnE0rWGqXJTRjSkbqsTZrIrN5H/O6wvCuMv
	aTPoqBYV9oltgzOUWFQ6MIxy4zg5hPtjCkRNJ9WywM6B+clbFUt3rtOF/xIET3+Ii9Wz+qWJaio
	xozaWju8Dnz7i2j56/6ZFtx9C98UymO9EXJE/5cOeS+FspmXkWxNt7xC
X-Google-Smtp-Source: AGHT+IEqYUFmpZ7odHGnJ1BNpmOkYizLtX9vRoQQWqRfk5gA+1X5UK2ITRLVd7eG4aVWuhHCMBNPwQ==
X-Received: by 2002:a5d:5f87:0:b0:3a0:7d64:502 with SMTP id ffacd0b85a97d-3a099ad46famr556036f8f.11.1746148541310;
        Thu, 01 May 2025 18:15:41 -0700 (PDT)
Received: from localhost.localdomain ([2.216.7.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b172b3sm660560f8f.90.2025.05.01.18.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:15:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srini@kernel.org,
	quic_ekangupt@quicinc.com,
	krzysztof.kozlowski@linaro.org
Subject: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Date: Fri,  2 May 2025 02:15:39 +0100
Message-ID: <20250502011539.739937-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at this, also add required memory region for fastrpc.

Tested on sm8750-mtp device with adsprpdcd.

Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641..48ee66125a89 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -523,6 +524,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x800000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			reusable;
+		};
 	};
 
 	smp2p-adsp {
@@ -2237,6 +2246,67 @@ q6prmcc: clock-controller {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1043 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1044 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1045 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1046 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>,
+							 <&apps_smmu 0x1087 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x1008 0x80>,
+							 <&apps_smmu 0x1048 0x20>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
-- 
2.47.2


