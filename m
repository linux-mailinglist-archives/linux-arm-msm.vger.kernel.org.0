Return-Path: <linux-arm-msm+bounces-8422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9883D7F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 11:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFED629B4FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4049D5B5A7;
	Fri, 26 Jan 2024 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duVI07l8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C35A784
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263242; cv=none; b=Cxgxyws06LntLXGYicUiX8AzmH8BAYBpBBdyDb69CGvQPpvSondvtqe19J2MCxWPFq2+2cSuvySS/A2LOOP+RDFukjE3sGOyZ/eJf3b2WGXumN2t5c96R4NMnbY+cBO9P4dJ9V9P6SZbw6XTZiWoqRz1JhKGoltvWWTQFomhgQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263242; c=relaxed/simple;
	bh=AVtgRWF4IVOkUGVH/tXix06fZG32DEgHg3PWnXYoMsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PttFQLILuPGXkpAsDBTv9hDhVBqZnLmzuceJmJP+jI/dTAi+aJ2ntMnHpAfCiZqQKYh8czu/AWzUub0eFmRYL3Th7MewZ4igwePf/n5rSLtj7v1ky8YEdEB33HKrEUAj6gFTI0uIFy2GpHedWSz7j+11KJlkTEddbNY8UaoWzlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duVI07l8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so151338a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 02:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706263237; x=1706868037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQbi0jsaceor2m1l5UXb1GXMtF9OCnFgnWE+RJJAt/A=;
        b=duVI07l8yVmEnb8oUYRz8O5fl+LBID9vc/3VKd1vni8S1uCrDrnTQGhXAvkZqewU6S
         D5VIRYN09xTMFXrotrbfP0ShgjhVY266i6Nf/IXDfy9ozd22MgtB7tpt2S4OcMuGIVgH
         AylDMYfRDydzd7vI6NAeIpjB7dSKjLkL4ZhmLrmtijb0bfE06dSj9DjnA9T/6tsgqY3N
         JiRJEFMNxRzWr9yNwT1PcagPITzaIPF4H9kMVRV3shzTz8QIqy+uy6xMeGhESOsRh7sY
         ZhQ+S3dcnIHZxbH/FQO7bKi9B4u6NbpIHF9yzizXnn7FXGT9FMOSElcOdBUfzW4eyUhS
         CINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263237; x=1706868037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQbi0jsaceor2m1l5UXb1GXMtF9OCnFgnWE+RJJAt/A=;
        b=L1cyKWZhNTin0fU/r0gXj+lo4XfqXpI8D3HwqhB90EF/VY/2Irpg2fIlXqeu/F+E9S
         9pE/rWqPVif4zaaV7i3aFraWb4X2ZDXd2A7/hXwqjvNFM0F3+ioNvIR69TryGvfZhvcS
         y4f+y3aIMGX/WHJC790TUYhGu6jgj5z0mvekRw8MtxjLM8cYr7PIznM6L1xnaWt3iiGw
         vMWgjGsj1ZtH8SUhzYPCT+qStX6+3MVD3OaY60ArJUFDYfO2Cx0wGzsOQZ1SWsiXoFLi
         kmZEa1Ljp6BhQ4vF4XBQFf5prJBP09mNuZ4RopZr9NkbIDtGwcjv6M/6duZPB1w2C9/P
         r59Q==
X-Gm-Message-State: AOJu0YwlcrxU/mZHuILhkWwK4QCSSzctETwoM9qEoakkA0qGFTS36wkb
	befJm4SudT9CURSKgBYRuM3pHtLG2us8j50+nMEEZXjzyjkn/ep2iu7n2kC6WcQ=
X-Google-Smtp-Source: AGHT+IE3qBN7zrigKY1o48sOXFj6NazOEvWePa1CM8jV4KDsLmnlStSqXIuqgEl+Qb4McDA/yBIewg==
X-Received: by 2002:a17:906:fc07:b0:a30:3863:333d with SMTP id ov7-20020a170906fc0700b00a303863333dmr610647ejb.75.1706263237511;
        Fri, 26 Jan 2024 02:00:37 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ox27-20020a170907101b00b00a3221b95ce8sm448494ejb.77.2024.01.26.02.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 02:00:37 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 26 Jan 2024 12:00:13 +0200
Subject: [PATCH v5 02/11] arm64: dts: qcom: x1e80100: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-x1e80100-dts-missing-nodes-v5-2-3bb716fb2af9@linaro.org>
References: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
In-Reply-To: <20240126-x1e80100-dts-missing-nodes-v5-0-3bb716fb2af9@linaro.org>
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
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBls4K2lod1b0R/2xgXwTJVUjVbgMqCAmpiDfCT2
 5MyqFRdtS2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbOCtgAKCRAbX0TJAJUV
 VnEzEACGzkDeqtek8q7253w9e5rEFdhrcy2FTl9pXQaVExq7zvri1XR2vZHgEEetvENsdYjgapI
 J4HRMXRn64o0o9w9LaPJ7MCbwKrAlqec01tm17vBNyeOuWfA+/6FMtN/nd55MO21kxDNQDKPjZz
 /g39aWg8jibd2yy4C4X3AAWXX1Cb6vup6uZWJ/SoiMkgsTZ8uaH0IlUFHJMKj6vVhqaPLjFC4HU
 x6JcAtAJFWZdfNNk/FD1J7UhmG45n9TlljosaJygYq38PQ7XxOlkRYGLfpkpS/ECftQoY/S9zkR
 DQap1d+ntk6blseDaam/GXNDYskN8HeqxK13RB8V5MStQMBAw1oSaf2r62tQbYV6eIicfL09v4J
 LSSOVoVGdMfDlohvvuFSwA+IMID8t9IOltLQQQp3whfi8dXPauJh1qdTQp20R245b+igPuqNhOw
 AA89id+CjlbI9oPWk4GYnbQ/dHvjgS5zMuCzjxGc6RVeNuEzBf1ZLpHSwNQek/4aOpakB+hl0zK
 o4xtUShpulRL/9tWTmTv5fN/phxQ6dyNJJ8i9qEyd5eAltAllSdKwSGz7GobiwyHmXVyuwgdK+W
 4UB3wpgRGWausAwSjs1IiyXDd5/Kj2zEMmgYsPgBUmEgrVDR6YAt52zTbXqyXDlAMKJmfWS/jIb
 G3l8K3DdKJ3zCBw==
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


