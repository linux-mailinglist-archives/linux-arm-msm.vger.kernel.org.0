Return-Path: <linux-arm-msm+bounces-8840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E3840548
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D84283AA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 12:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B5A627F2;
	Mon, 29 Jan 2024 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dIZLEbh7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D76168E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 12:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706532364; cv=none; b=m6cpmRxbgzAQzET6Sh/3kHvSafyJ/TYgUBcSe7lWka44tG56sKDB7TKsA69ojFrM49/8+Mpd5FOEtzJ0oHDY2E/n3OR4fmsKI0OA5kwVHKNI4nOKunEmAUJj69319vVikknhVEY3Gar4ommcuuqkjv9b81vExxosisRRbUjVDZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706532364; c=relaxed/simple;
	bh=AVtgRWF4IVOkUGVH/tXix06fZG32DEgHg3PWnXYoMsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaJilvUP8zQHmKkNHjOFw/KlvV3P4eHxpr/c2tA/Ru4AU0P7g/AIEacs01KdEu+Jmxy8WwMkNU7bpwFpUuyVMA58Pw+22aZNOY7ksAoubGbP6+2LSdztzHAT5MX1e1LJE6v7jJb4RL1+r76mOi+O//6KEor2Cs7WDh2wG1YweeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dIZLEbh7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a359446b57dso132453766b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706532361; x=1707137161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQbi0jsaceor2m1l5UXb1GXMtF9OCnFgnWE+RJJAt/A=;
        b=dIZLEbh7xUCB2GAkAlRJYssLbWxwP3rJ5F0YvqLZ2eZfWoeS/frPEC3EvRLbnSLQs9
         n9xfZ36KPCwjcwS8lPDgL7YhPWbWnlMOxJIFvysRd4iN3TBowxfdzH+tPBKVRhTyuvFF
         AHLgzbQSXTMik4rTYJ7KBK9RoZ0OgEwYZuqeQXFOIYJqgZ6Lgvpij94MlEg84Xl6L43E
         Gk6G/Jit8yNIrm1TafcBOSIJ8w8HZwU4XNiKfhls3UaUf/J4e4+nx7YKxKm6cA0PKNiq
         P1rT85vTk+B6O4VmUywez6M2WaxcLhja8O9FLKGBbWyBZYpfaixyTjrl4a1ebuuopSpI
         U9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532361; x=1707137161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQbi0jsaceor2m1l5UXb1GXMtF9OCnFgnWE+RJJAt/A=;
        b=YN9YaRWRr0hDvFMr9PtQe1uPaJa2vOAqxUrG3kArf5NbR688KPJKX9HZQ6ncNr+8yL
         5r2Yapr6f8IClj9SAuaLtnODIdIu7KEJCIQalpQasmsqmVenXYWw3/pbe12u/evB6lql
         BTTQXIHZTzksPpwZBSpRJzKDhvV3H/Od9P3SRTpB4zVW2k/Mh3gtM94+WxzDzaRMYfYC
         O3dSZq+CUtDXN+cxeTJQS87SE4j8qbaVJu+CMqM/PkDfa/UIKpOU/8O5+39FfpJlt2Iy
         oimootwHbG1oljYbChyyhW6YUkKMTMJOqWsSfR3owdmiUQruOzz35axMq3b/KGU10YpO
         L0OQ==
X-Gm-Message-State: AOJu0YznEdfsQoGz5I8izcFhs1eopGI9hEOeJ7sc+JvaCam9Tm9V8f2C
	5lGqjj8yQNVJCX7Ok1aeUbeScfhOt/vFCaDVf81x/cp6zZr3H2T7EIxaZQOYt14=
X-Google-Smtp-Source: AGHT+IEB9Pyf9whoM5HIm92rVMv2R8bAY18zITac8cQuXVunC/SWY/7TSPbRUP5isKTuZiEHomAtRw==
X-Received: by 2002:a17:906:2807:b0:a35:3ce3:c492 with SMTP id r7-20020a170906280700b00a353ce3c492mr3335525ejc.26.1706532361019;
        Mon, 29 Jan 2024 04:46:01 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id 20-20020a170906329400b00a3527dba974sm3041495ejw.35.2024.01.29.04.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 04:46:00 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 14:45:34 +0200
Subject: [PATCH v6 02/11] arm64: dts: qcom: x1e80100: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-dts-missing-nodes-v6-2-2c0e691cfa3b@linaro.org>
References: <20240129-x1e80100-dts-missing-nodes-v6-0-2c0e691cfa3b@linaro.org>
In-Reply-To: <20240129-x1e80100-dts-missing-nodes-v6-0-2c0e691cfa3b@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=k1gnvHRfVSoGERtnk8fkV8vtL7EyKZdKEihjsBB0+sY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt535reupJK7mVRphtWf/a+4ODF+lGMWRsvzJA
 rh4uH9LAZWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbed+QAKCRAbX0TJAJUV
 Vh51D/wKhecHj34JtSsFLr9VijD1yv6sgv5YNWdAdq3yyxTt3+qs98xyMUlir07cY4He0Vt+uBa
 zqViB//E2CxG3xu3euYcF9wftjwzcs23tu9DMes7XPcwic8eWZoSxVz0CrdB+QmWBbcMLugJOON
 iW1sqvcT7TW9yL6E8W5Xh3CimKc82ZBBHSLR3tBLb7G8IhETRTe4yDNaldG5K0dMiesb3/1zqdF
 tJQgL1trqVtK5P3UZ77KAE0e5ISujwsGFhNhqk5e/tJFRF7GUWYGHXqHuUpprKRHvogrRoFFURx
 bDgaZDR6KglnDDMC9GS8IhlRuLQGjF0LaDxNjJwoECoIU45ER+nuDIFNS9PGu/XvnQiRvx4kDz8
 3pagydjebERHQC2019SA01Nml4/vPJTE1RZS35YX9hkgpDleOgz0gK9ZHB6G66oMfd7KNyDJ64g
 SUOlp0uH4t9Fujbn+nmABjvVWYDHUcnfpKAmMZGe1LlVK1B1b004y1804a2gHobqYR4P6FhxTFl
 PEtCBz06EDTo4m//iEsALocFMI34Ojen5WfZdKLWskRSk1pN/Qssl87J58lZNV6lsOUYaHu9DH3
 rugPyRdLjw+r6xl0dCeSp3O9L5szEvp8nfqYwrewNw8/bKEwNbuxwg8dAnZa8XA9ogIwolfT/MC
 dhvubPBiAE6f7uw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

SMP2P is used for interrupting and being interrupted about remoteproc
state changes related to the audio, compute and sensor subsystems.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 53 ++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 954f2bd9b1de..1210351b6538 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -662,6 +663,58 @@ smem_mem: smem@ffe00000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <443>, <429>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,smem = <94>, <432>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


