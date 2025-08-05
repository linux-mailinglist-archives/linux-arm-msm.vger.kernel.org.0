Return-Path: <linux-arm-msm+bounces-67798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C43D5B1B853
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 18:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEE54181B88
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67A528BABE;
	Tue,  5 Aug 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nhnhzxwJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87E291C3E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 16:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754410846; cv=none; b=cNs3u+7yZ9KeJ3MBE1zhoUfTQMmlK/M9dAVfl+m45K1HnZRh61UagQQAjhtuVCZZRnzZvWWL8Tyb4hQa7Ao7smnd7pnTHase1oyzzZwkF+oWaHAJxbxWoKaUdWtE3HHcxGXA/hyJRVUFRjpVEMMcu8gAF2KpFu2TmLQnYY5K3NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754410846; c=relaxed/simple;
	bh=cBJjmBz2nru2N22Iu/zn8pPdmY8QA0TjfVIDw6+iow0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s5fh9GVUto/kq9MdUb/c7lrF87qGe+XPLr8IflsFXeAFK7gbhmPefnHFpAUyag/TxzdKHCsYsMNV4feB4JI+4K0Juqc0ob/iSBX9eMt5Y3RI+P1JP+KnysRvLsDwNVuYv5IBPz9/v84wcEsSZAYswsa6u7d8cVq9kIk2KKSZz+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nhnhzxwJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458bc3ce3beso20909495e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754410843; x=1755015643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IGkrmIeLV1rU3rT2THq/+9gyQc/8zpyvBaKc45egPzU=;
        b=nhnhzxwJHFgMBkBXZIkucJrvmCyySqfb5MXw2PDMk1KDW11xeuLtoedB0WH/VrumJx
         EdNqXAs2UTUc8eHvJoWeGpqVCnEDK0TeMUUb6po85mKZJxq/TyAdFtptf579wWmfuuAj
         Is1pcNBHa3dwdSRVbVqpe1fIBps6NT8wrtjqmnHv67z92Ll8pFLzuPjUyjv8QajS3CLw
         nRjIgyWv2l0mResUsaTU/HPKKSCGnkmiZB2OWOYLywdlb6KNzE8YX6P/DIN6ys4Gzlp5
         KAJoivDCCdkcXtamxE3GxFsYngTLm3/8Qk58Zn9/ebSMhc9bldWdL9pDjpc44PZgLshe
         HcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754410843; x=1755015643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGkrmIeLV1rU3rT2THq/+9gyQc/8zpyvBaKc45egPzU=;
        b=kzdWcXb6Rr1YYDaGsO4RQNxUteiiodb/QXOXD9H6s9Qy5m5v0bhCm5WkL2U+/hL+mn
         VUohVli0yUV6act4XBHXgiyve+y49BVUK/+co3o6EyoV9yK+AA2+pZjUPdEPsI0KPWlK
         xg57fy4XiPo77sBU81Hcu8j4kVCeu3TUb9mmWe2SKW9TNVxaVspyYLym29AhCNZEtEt1
         Hb7OKf2mx2hdBkU2/ybu+cwflB1VE5CKHRC+LZCJS/LzSh7OOjPHH7lV12938ZcW1rDJ
         23HE0RVjlzCdJuKNTNWF46U0wPgGh2tCgonFN+zzANz/Itc8HlQtj885o1WAXrsxul5R
         43Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUhR+1kjMqskixZDHfpeze+eDnzbDvLfegVJfkhFgMwupDKzBw4osvI0sK4XnD1t0H8lujjBRSzzxFYjVTS@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUxBym9tkwolwUijDiwXwXHgyT0V9170crkegz3sLPg26l40e
	gOUjSpB4K1A/E8TlkIS/usP4WVGHlCcS9bZBE667vaQpXfFOS6o5sKkVBw/rok2ImZw=
X-Gm-Gg: ASbGncsLnbxrHdrS5LELETc7g8s/yTQv4XTtQecL1mmY1YQH8Q1nzqkh2u2nRTMEthu
	/tqp2tMO7xQormSSbiMh0HeEdhMiE/tYgKeEAjTIzZ72R7T5Upi2ZU7JQPy+veCFuNxrtJYHU4/
	Y5G/wgCpBvFQc9kDEpnEhcuwavHPOnlAjbHa/dDJqPbJto40IpzZ5+yCc2shWCP6GiOz5QN/DAC
	OToXTt0BUtpdYYhu49b9mxIZJRAca/7EYZZsEZk3xVVnbV02I/hsEt0mVoquajB7HSZyr3PeZ97
	RU37Uoct8Cc+qKUzkqmJqPX2l3ORpFmpqUcHkPOrpXLWGaVcnF2ZR29iTFy21h8D1nzNUOB1Oaj
	h+52iYTmtaqUIneDjvGs2F7OTFOQroMY2SUIA9Zg=
X-Google-Smtp-Source: AGHT+IFJTDQFGPN/BiqSqSYEoyKB3J5CeXH8Mn6Txe7Lz7r1rfPY2c8tUvGJMup7h8OCrkxOi1r/Iw==
X-Received: by 2002:a05:600c:4752:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-458b69e3710mr130392835e9.14.1754410842876;
        Tue, 05 Aug 2025 09:20:42 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:3fc8:64de:ce84:87a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5873c43sm12023575e9.22.2025.08.05.09.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:20:42 -0700 (PDT)
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
	krzysztof.kozlowski@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v2] arm64: dts: qcom: sm8750: Add adsp fastrpc nodes/support
Date: Tue,  5 Aug 2025 17:20:41 +0100
Message-ID: <20250805162041.47412-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While at this, also add required memory region for adsp fastrpc.

Tested on sm8750-mtp device with adsprpdcd.

Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

v2:
- removed qcom,non-secure-domain flag as requested by Srini.

Prev version: https://lore.kernel.org/linux-arm-msm/20250502011539.739937-1-alexey.klimov@linaro.org/

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 4643705021c6..cc74fb2e27de 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
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
@@ -2234,6 +2243,66 @@ q6prmcc: clock-controller {
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


