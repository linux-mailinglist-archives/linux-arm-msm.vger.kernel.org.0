Return-Path: <linux-arm-msm+bounces-26864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9811F939E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9FD21C21CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1408B14D711;
	Tue, 23 Jul 2024 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xhmu//sw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDD114D2A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721727534; cv=none; b=Yyyrjh8abP7T7vWmQ6I1Ph/Qssh2rp3iPIO+y1RaO/JQRRcUJbniE2DJOHNP4kAZAI6WbnIRhMzzXEvRqJ1l+l5fuvGBRl9tZvdIlPM7NSqigjMV0mdXx4selIlro6UsOfVmVC2ZYWu/90GzWdSs1Vz7d0SH3t0tvot4Mjzqe6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721727534; c=relaxed/simple;
	bh=0YFEJi/WmQ/U4OybGyjc7Rq181VxIAo6erfNivtbOZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dkf/ANh/fJvs74fgAr2adEZMBQBbvmIthcTI8D7ziZtKhsHjwjeHBOo6yqmXT9/nK0jxnpilCzwnPT6/PaNoiNm1VomQYv093J81Sy55O9giPoj3HtR683RmnIV624YPNEA0h18AfLR6EBd307vs3pvqqPpIouz2pvqfNpEMeqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xhmu//sw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42797bcfc77so39421515e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721727530; x=1722332330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCOtS+JQDOh3lld/j8QIIBoHly9qM/Xm+yrx3ENKznA=;
        b=Xhmu//swDv9taBrTcgzhm6g83LCOwepbIuJ5VfzcH2ehA0qWCfZLHYNkVqrpZ9UjCK
         PUGms7HcWKRnt0kI267PuhFCSSIQ63YNBVtmrvrt4QK1CGdVA6ptYuxpps1Sj9e202Wl
         MYrErHrOCjE/NDnpRcsxfLv453rG/d6T9h9BeozuAr/oPKJOFyllP+mzBOlITxTuJdy+
         mz+g4MAX6lCIOZYPuW8RpMfFfO3onNYV0/K7a9fc7KejLAFZnEibEcAva4CklXREfTU1
         R5HD3lHBioTXWX622nDq+60bLa9pOvI3y3sjuJTvixqNPLZogBAQ8hMONBT7vEi3JDY9
         T8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727530; x=1722332330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCOtS+JQDOh3lld/j8QIIBoHly9qM/Xm+yrx3ENKznA=;
        b=uQQbFnjG/EomPp5wtK9ze2LN2okmv0GDX9hK6RV+QtD+Y1rAuWFzg1uGNjRD56SDHT
         1AEejt5AAxVA8MC0YTGa070vR8yeXADbTAeAeH0VdEZ5SVQyottcSP+0SZ112g3cK+AM
         QcBp18mJai3gbet5uFeiXdkGr3KuSbdY/G+dQNdF+FENW9YHBECzYJRnDY2tDAG+YaPc
         0IWKaZ0rCHyOR+YTCZvXXT7Wg8OBOh4ZhTJxlF+lK9vo0lBX32JktW9aS7HAQL8Dzudg
         JJQpVgfxl4EQiSpQeDwIzzWNMzKZEbgjtONlsZfNUjr6ikuHh0Tmdy8HSI+k9zBBKpE9
         tTSw==
X-Gm-Message-State: AOJu0YzHr8AknD/7jwRKb4QZcWTHAmiH5yQRZWcnmiQlfSARWNYHZyxU
	MlwkDxlswoI+9cywzle7oHFZvULOGn2VfL0I5zM2WFfAvjVBFk9J3fLC/94g6zY=
X-Google-Smtp-Source: AGHT+IG1Jag42u3CxNIvqQgzLwxqXt7JnZHGCVJXl63evadwSoAhdze8W4qXO9k4STVLsm1svGz0gw==
X-Received: by 2002:a5d:6592:0:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-369bbbb3200mr5908533f8f.4.1721727530622;
        Tue, 23 Jul 2024 02:38:50 -0700 (PDT)
Received: from [192.168.1.191] ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36878694637sm10953345f8f.56.2024.07.23.02.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 02:38:50 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
Date: Tue, 23 Jul 2024 10:38:49 +0100
Subject: [PATCH v2 1/3] arm64: dts: qcom: pmi8994: Add label to wled node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-pmic-bindings-v2-1-e1cd614f8c4a@linaro.org>
References: <20240723-pmic-bindings-v2-0-e1cd614f8c4a@linaro.org>
In-Reply-To: <20240723-pmic-bindings-v2-0-e1cd614f8c4a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=rayyan.ansari@linaro.org; h=from:subject:message-id;
 bh=0YFEJi/WmQ/U4OybGyjc7Rq181VxIAo6erfNivtbOZY=;
 b=owGbwMvMwCXmtuJiX/SRuS2Mp9WSGNLmV2nyHa5Y2RQ46aVy96VV37VtXm/+c55nQ2r3Lbmll
 +VLBZ5FdJSyMIhxMciKKbIcbvqy5vV2J6Er26tOwcxhZQIZwsDFKQATid/GyPBNJmP2+nvrI/Y6
 9eUdcdCeL3WW74zKJOkFfZ9sjdY0PHzHyLA2PcEsOlv+P8Pa25I/2e27jnHeDX2gOWex6OPbF09
 o7mUAAA==
X-Developer-Key: i=rayyan.ansari@linaro.org; a=openpgp;
 fpr=C382F4ACEBB74212D4B77ACA46A8D18E5BC49D84

Add a label, which is a required property, to the wled node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 36d6a1fb553a..9ee59e6d2cdb 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -57,8 +57,11 @@ pmi8994_wled: wled@d800 {
 			interrupts = <0x3 0xd8 0x1 IRQ_TYPE_EDGE_RISING>,
 				     <0x3 0xd8 0x2 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "ovp", "short";
+			label = "backlight";
+
 			qcom,cabc;
 			qcom,external-pfet;
+
 			status = "disabled";
 		};
 	};

-- 
2.45.2


