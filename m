Return-Path: <linux-arm-msm+bounces-9609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22C847798
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 19:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD361C27962
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 18:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC061534EF;
	Fri,  2 Feb 2024 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TD3Q1Zza"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B52151CFB
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706898906; cv=none; b=kMXDC/9xmQFF2lIUasmxWsRbC1z0wiQsq2/QtXKmDB9RTb7/Yl8aMzmnRhpEt8i20Nqk1Z6Gs3SakYJcIDhMT9fWVKisahZ9/x6aUWJ6SsQeamOx2FsH5DrPurzMCKHSCDiubRAa5uH3DpI0kiOpSSg+OWtPImnJIf9YimUMT7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706898906; c=relaxed/simple;
	bh=RNTWLyTiZiBUhS5TEQLKFH3Bk5qTv5ogmNaSck4H5Kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPAMCZFeowbg5v/Tg0EJFgPNsstjsL4RYyBUDuFQdQ5i4AaBfzZy5GBt8V1O5XwucL2jAaRy82+/utrn1YeR8oNjN2wIYRZlyW7mkkBSkp2qavHhTcuD9R2hXqvwugndslhfwFwzC3iAAna2hf+ziGRd8j0FXBKh7VdWqVgiGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TD3Q1Zza; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3122b70439so333586766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706898902; x=1707503702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xX/n0g5EwVAr63DPP+HMCiUOVUpkPp/mNAHdSRNRYg=;
        b=TD3Q1ZzamlvLzEUhKfqPQtFBPQ7w36qsFIHFpGYonOj12pyx20nuwM02LisD0cpCge
         c1JzL+fEt6dNc+9/vYYNaMnUdXtZorlcnVXesUuJ3w96LTMgqGpXQ6i6X1992vmxpWjI
         NjYvb3oIG/L0BmWdBdAq+p4BFocZI8ksJYXsvPj8tjqPoGAvy2RwY/J8r2RLQWe/2k1k
         E9ZdDKqiieoD9dKvvtWiY1yqff0i2+m7AkDITMVeQ0FBYT89oy6Blo6ASkTdzKdtl+Bz
         C2CrFXv3XA1XODQc3kgeEvehkn0r0SMpC9PW3ZbyF0etnwuPOM9VW5qcjspSpJISorOL
         +fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706898902; x=1707503702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xX/n0g5EwVAr63DPP+HMCiUOVUpkPp/mNAHdSRNRYg=;
        b=ngKh6tCxrG9iETibxVD7eYCkIpJjgzD0vORhTK7HNqh968S23pUatyolAogZgadawt
         d2zvXXHzmQUjbYZCtcJUWSnFbdfkF16miYS629z31Q5PRlcSIb4PZlb5t4TSr0lg/NLY
         PEY2z7/LH7v9Dt3Gq20SzvEWmzSGrnILIEnYjdnc+ODwrG0vNpyQOZV2Gpu9o607jOs9
         Euk5tLO7YeogcykwJXkU+RwpSX+ul59wb2yvdeDeJNC7E5RBE7Jv182CDvWt4k05V19o
         D5glsGXYWMQkZZFmHaniHYOgFVZtxm29pNtTOMEBSI18iWLa8sHRGs5/vNgzpmqYqagQ
         Uj8Q==
X-Gm-Message-State: AOJu0YyLVxb9nqauWa0kp5KFME5zH5sNjRTC3B8tXzcu37mRFV5tbjAm
	wdo6I+BCrxjOfX6EEpKMfiFzOCO0Q0d+R3hKO/53QcBAcoO/Ea5chDe0pJPzoWM=
X-Google-Smtp-Source: AGHT+IFDv0sj90YYwvTp3NgPlr2aZQ7JCVi7yZHIOVTjWbAbfd133P2a9EsYqzRN9gBRc0dbyl+M+Q==
X-Received: by 2002:a17:906:e215:b0:a2d:79b6:bbea with SMTP id gf21-20020a170906e21500b00a2d79b6bbeamr6296460ejb.64.1706898902142;
        Fri, 02 Feb 2024 10:35:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW6vY7+D+m3cSiQPwSAhbedLlRpycWbbbqiTCFtLFAPg27rU/h5slkfitrhz1n+o2ovbaIzwtZOGSkBsjeiwffm+hDX2zoc0eaQJHl5M8CWguGcsGMk5N1w3lfuAPVIdbPnDUsDrWgJlZVChgVhehrKTmOQmOdvpcvWdfqUpNnUMOxfhG7dVpqvyWGvK1VpR45/eZPBRncZLprxdkCI1a79gcyReBkYmlH/u+8MtAMi58CFO/yBxFPB1DoTJOOrjMuHj3a9BloSCATfx4ymcyF6uP7anA1ermiMSr+gii4vE5xXKDjS4TwrvsSr69KESEn8ff2mZIW7Gy0zgVl5aQ3x7GSi4kX7enqDdUJLPA2Hq7ciyFqGoe9Om3D4AR7HURR5kJVVnZynYP6pbZYmZf1K/XmJXrRTO4pG4HRuSf1N54tB0I52Ox4FUa/w+tnOiax6zctN4ldlfgmLvfGBq/Q8GXikWCZhj9Vwsp91s+TrgH8DRKj7c6BIDYJEA9TajxhVhI4sxyFerm8FpmBFXy+Aa/NbX+XF1lgpDh7h/8Vw7xrRNUjmsj2wQyAViAcwDZaPuHTGRoYeWOI31SweCAI0oDn90ln0FKo8VUQvz5hneELHnDSLL89DNCtpMqAIY62s57W2+bthcxIGbM+sega5cH/Ditiz8oqHjo8=
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id vh10-20020a170907d38a00b00a36fa497a65sm1051328ejc.110.2024.02.02.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:35:01 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 02 Feb 2024 20:34:39 +0200
Subject: [PATCH v4 04/10] dt-bindings: clock: qcom: Document the X1E80100
 TCSR Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240202-x1e80100-clock-controllers-v4-4-7fb08c861c7c@linaro.org>
References: <20240202-x1e80100-clock-controllers-v4-0-7fb08c861c7c@linaro.org>
In-Reply-To: <20240202-x1e80100-clock-controllers-v4-0-7fb08c861c7c@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=RNTWLyTiZiBUhS5TEQLKFH3Bk5qTv5ogmNaSck4H5Kg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlvTXGmwFOW/H2aRvQYRceBv5hSh66mgNuO3nFT
 9c4S4MD3cOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZb01xgAKCRAbX0TJAJUV
 VhIfD/9aTFH2A1Bw1Ob1j8L748eiTSC48f2wcBFW9lwQV9b6UDSvDKOZbVxadI2weVNbeCVaepL
 OK2N9N5Urrclllk8VxgUYmBpm12ihW5MBARUr1mDsKY0kefaQXb5C+LfDRpL2UUMxQkkXfhSMrZ
 UydXoYjmy/vKKG6etAh4QFHToe1h4yLAeBqu+pXPnEE5zr4FpY1CsfF6eWysJzhl0i4Hk+/UQ07
 ksofYKATb+IQ6etJ3BsGFixRFDLsfuAa4OPaAEC3j2mlyNMGrr2uws2BN5eNPJgjtbbRO9EexDU
 QDjPJD1EdiJLR4HtWtXkmoY0aUcfAy6LoBiXHRs64Zn9W5LC1CNfE3jkm+2W3Cr3UPM2cm7r0oV
 2I7Aflj+3yhO15YT+N1knV8bNMx4G20xpEvAnPvmLlNi4ejYk8B+OnMYuelq0pAgyByG4mj5oQo
 mY3h2M7VxbwcUkaL3yOuvXEmNnL53OMBW8YUsYmOunwBgDpKicvj9uB0HFUlwRSfSebb8qAPvUq
 VJU6zSoZlUWGgZzwhySS+pe7wRXmeJvogAe3gfbbVq6h+bO3tp9rTWcFvngPrKJgAtAc+tM7kwE
 X7bKo84xmqsTHJz1WSHzgUjrp5iiW1+gCLa1w8ckt2GYQC6K7Ct/NH6Svga5XOXwdA5agTAlmhM
 iJMB42jZuGp6mCg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add bindings documentation for the X1E80100 TCSR Clock Controller.

Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |  1 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index af16b05eac96..48fdd562d743 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
+          - qcom,x1e80100-tcsr
       - const: syscon
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,x1e80100-tcsr.h b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
new file mode 100644
index 000000000000..bae2c4654ee2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1e80100-tcsr.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+#define _DT_BINDINGS_CLK_QCOM_X1E80100_TCSR_CC_H
+
+/* TCSR CC clocks */
+#define TCSR_PCIE_2L_4_CLKREF_EN				0
+#define TCSR_PCIE_2L_5_CLKREF_EN				1
+#define TCSR_PCIE_8L_CLKREF_EN					2
+#define TCSR_USB3_MP0_CLKREF_EN					3
+#define TCSR_USB3_MP1_CLKREF_EN					4
+#define TCSR_USB2_1_CLKREF_EN					5
+#define TCSR_UFS_PHY_CLKREF_EN					6
+#define TCSR_USB4_1_CLKREF_EN					7
+#define TCSR_USB4_2_CLKREF_EN					8
+#define TCSR_USB2_2_CLKREF_EN					9
+#define TCSR_PCIE_4L_CLKREF_EN					10
+#define TCSR_EDP_CLKREF_EN					11
+
+#endif

-- 
2.34.1


