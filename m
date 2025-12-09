Return-Path: <linux-arm-msm+bounces-84744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F80CAF2C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 08:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54E0B308DADA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 07:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F6F2BD587;
	Tue,  9 Dec 2025 07:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPfrjgpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353E27B348
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765265889; cv=none; b=n6/nX5amnEegXezEJes+fUuezQKckSw1d95e49TyJIqqeLDW1hXQ5IiqjK+o6ApJqe1Id07ukbr/pOQ3YSgKifInGw7uGJFHXBTkpIN33ZUTNY7CLZhTvkGRMuhUCM5RE+yDTQMp/Q5JzsJeKtZCkOk3rcIClk0QB1+RPAX+CfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765265889; c=relaxed/simple;
	bh=5FWnBXgBAAFC2ePZdJTm6XZI7J4x7B4/eMd/mKz3FbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1tRbHHoLqObgWf1/+oDwnHk8aEhO1C3l3p2VQFui45B0IasPIvFz+uR4Amjeixj2mVDZH6EIv9A/nucTG5mjbzHDTu3cm0aWa2XOmAwEW0FzpuNsD4UrouuDXhZsKjWpCUp4a+uIw2b+Nryg+MUTpkzZEcnlfCjfNR3AfomXx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPfrjgpN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so68759425e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765265885; x=1765870685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xq55UvTaHMmJFp6V55KmSaDw+pSQzH+YqvUppFex2wQ=;
        b=tPfrjgpNjguKFAdaCDgQG5zSrQITbu6ZdzqFUoEAoqa+rfn826IthG2dlMwMAOyaiY
         mn94pmjvQcYdGVE+OFNoBzWJ4mGxgoxPZQ3DKVmrX12zy73X1YPzfpPK4G1CKs4vOLyh
         DR5W4Uc8bOXgjdGP3tHmnwEny7Zv7o8bAdN9oIOt7IbUlmXwDgDti2Vo8wtYgPVsf36Q
         GLo6el7gw5tuQChdxJIqKH8pgRgn+DOkvACNf+ejhsBpJW2GXr0bO7c3eNcstDwxC+bo
         gwZVt2sztulUa5q/By9iCJLB4xkAC2eEcvozr60rJxjYHcpHqJ5oG3Kg9grifCCvnsiC
         eYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765265885; x=1765870685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xq55UvTaHMmJFp6V55KmSaDw+pSQzH+YqvUppFex2wQ=;
        b=ZjwB95TVTyKLd4gXhN2U13Hjsr3hoG2sI7iO5n1ZvWjQAubwthfLlPcMPel3jUYqcV
         zPUq1Qk0AHPikoI6KrToyFH9yjGZPjL9/daf3XxDdncZC01YDfR/MpE1x4vwHpXHlFoY
         EuTMi9RMLLCIpglYRaOIj2WY8x8rWbJeqY7JbhdNEr/hKloc2powNcM/8rTbXjx+apqi
         XDQOycC1zlMky0wgj3Sz/tqDRAqoVCKaVGR35Q7qy6E15w6jw+lPWiCmkiqXo+hlS1Ap
         2mUxOtpj4OW2rYhX1KnMQYWi7KeaXEwTnCbzcjIQjG6PqnzjEXuR107tBc/tQ0EfhL6L
         VSOg==
X-Gm-Message-State: AOJu0YxaieDivABAeWycgYUto+7qd393QGXIsNEVIoLSV2p0G9C29BU/
	vw2aJU9EMEyouuSEBqYRqH79LyFWxUdHP3VwvOLBT2IIG5nuTQt5GnUm1thLhxnAl4I=
X-Gm-Gg: ASbGncuyRCks/gXxpv1zRIozKgLKejI6LfNTkfKrJ9Iun1+irVQCUo5MXgxmcR2Lj5C
	zR2MNLjJ92CC/ZYyDDqH++Ni7ks9XLw4+HLyS1pqy1yD7LrtapzfR1Ql4QnkBi9c6rpvgtP/zSU
	/uAsZdT/BcZZ/hsx4oHiAYmSVJy2WX8JoIe06fxYBLqNFW546cTM6rszlhGS+bnWMB0YBR6azG6
	2cmA0BiQhEPi3hZlBykKXMxdQ7VJLrF2PNAsHDbHcbAV1PkyP8OVTzzO4Fne9gzpFNsrKVmVtpO
	OyCPDOun64PNv2pPUQpR44QE4m7t6rvsa0iID87anvMAr5oSog1bKHgJJLHdZTVrjlU3CTieYnG
	YjVB9MMMAbES2qrewlGmN89X/aDOkrdW3/tBCP/t89ml7Hy85ewhLlk1wJHln1AlOh5BrxJVGvK
	2Oc92m2HvOrh6SK1eGpA==
X-Google-Smtp-Source: AGHT+IGWg3iRoB87s0k83hrF3/oQIOag62oRtZ0NZx8Xeg+BiyDiUvjjoJNVRT7AvNIF69rAbVtyYg==
X-Received: by 2002:a05:600c:1991:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-47939c8bb40mr119687785e9.0.1765265885579;
        Mon, 08 Dec 2025 23:38:05 -0800 (PST)
Received: from orion.home ([2a02:c7c:5e34:8000:c69d:7dc4:d0c1:9de5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d707702sm27851935e9.9.2025.12.08.23.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 23:38:05 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 09 Dec 2025 07:38:00 +0000
Subject: [PATCH RFT v3 2/2] arm64: dts: qcom: sm8750: add ADSP
 fastrpc-compute-cb nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-sm8750-fastrpc-adsp-v3-2-ccfff49a8af9@linaro.org>
References: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
In-Reply-To: <20251209-sm8750-fastrpc-adsp-v3-0-ccfff49a8af9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add ADSP fastrpc nodes for sm8750 SoC.

Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index be89c65163bf0480100c09c883b68d03455c1870..b45c627c77a6194cf075a39707ea82bde4808e81 100644
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
@@ -2243,6 +2244,66 @@ q6prmcc: clock-controller {
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
2.47.3


