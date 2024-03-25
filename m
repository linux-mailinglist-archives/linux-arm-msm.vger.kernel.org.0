Return-Path: <linux-arm-msm+bounces-15000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E988A45D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 15:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264A21F60C3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 14:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1377F748D;
	Mon, 25 Mar 2024 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mz7qdrOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE34136E26
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711362571; cv=none; b=Yx/ZN7dMUmvwv5qXdRS1p07dkEWfulnSzOXAV+6XbNgFKhlxtwTj6dY2JLZBgr9MUAkVHsO4b55uiHK8EFk5WSpKPMTlNYWzS3AZhdYVjiJwUsymc7nc+Wx0X7F5AJFEyph05pK34ODv7zH1lKcCHhRc0CeHxjoncBBP90PP4/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711362571; c=relaxed/simple;
	bh=xv2J0Wx0wzB68T5mS5mCvWaPbdcarSVviDqgaUDVsLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mGD8zPhmnqis+XMd+YcC06Cj/HSZkJxm9ExZxK8/ICgES35C6fNvwSiuBs1ovfAQ9TfVSbAXw0ABpB5+7eH8eCjHeNo3zmDAx3npQY95QSBZ4V6wKgWRv9trfuyQunXANQDrJNEwRel4I2p3Gz7q69/1jndQFUMxnmgf0acd+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mz7qdrOV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56bc5a3aeb9so5390778a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711362567; x=1711967367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6TcKE6+dC1f3eAz4BNo+BlfsIlcWLTS4Ihl0QMKVXN0=;
        b=Mz7qdrOVxHvbWYB3BfHXlrx32rBM7fhcs4qe6VM6MUW5XrZ0SDim9oKXxlo80zlii2
         2/ZzBkHSCidX37YLhwriLttTFuIASqT6qlQUv0kurlyN0b1q/jLdHlq5zuIXeEh3ho1m
         DUFTvj8JT1Rv1clM2HIvjp/DHCf4xYiu/uDYxFmRreCbqmYSaGxKx7xSxdmKKR47oYpy
         LiMBbEPjTLAh5j2ehTu8ix1p+GEAb/Krtn5KTY7Oy9tH+Kr1ZAjtGLM9yjRqH/qPAHsN
         cFv5W/7eBI0rFy5YtrdQeaWePHgKV+DbvpKevg1ijhg2QoEBjD2dq1khukwlEgyj+YhR
         sswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362567; x=1711967367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TcKE6+dC1f3eAz4BNo+BlfsIlcWLTS4Ihl0QMKVXN0=;
        b=l9N+yy+9UjcqO+F+8+QZ6J22aaU2OBVdNkxJS2QxFu+qnWQkeLqPXvYL0LJwNw9EpU
         Sh5ue3lYdFdjBmAlGCyEZrhCPqMvJzSLgMtFsJGLmJnSTEdKUUDAz/QoXjAR1GLWRUQ4
         /TmnjDcq2mv7+xiut0gysJKT+0qim4QXhYdQz/m/b39tIv+PR3N6Ys+6fN3Y5tnufUIu
         /pH02gl69+k0nwO7FYP8mufENjx8lvTbK52tMMfrhdgJC2MYBVRJKT8gNAcbB39k6DYz
         CYe9LlK0HsRCEY5LYm8QqdXi32/CiRfvxzpcsFJUPwaKrhTzyxd1yNEqxg0RdslU1cB+
         IvTg==
X-Forwarded-Encrypted: i=1; AJvYcCVLYLN7n8Hwad128ctryc7uEUuEVIpQBrcLE8nJnVVExfKyKrVYCo6uXXsNa4+o/Mo+JIKHr4mIv2n1+98HFhovs7ZY5dLl/nmlV2UqAg==
X-Gm-Message-State: AOJu0Yx5EU5YCBihqE37IfXADu9sJfGOs/qeOeJJ3EMmsZg+0IQzM0JS
	BsyE95qAa4e0ijn61RR45kObnoFt543tfC63aIdIZ3q/MU+9w9G0w304bm/7iMU=
X-Google-Smtp-Source: AGHT+IHJwcp/nYlKZf4FVuIV3akoOxI9ayiT4CShSuqZh++R2kE6qmOBDp0F94QP8O6lMQt04Hy1NA==
X-Received: by 2002:a17:906:a15a:b0:a47:3c9b:bd84 with SMTP id bu26-20020a170906a15a00b00a473c9bbd84mr4684802ejb.8.1711362566889;
        Mon, 25 Mar 2024 03:29:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b00a46cc48ab07sm2902617ejc.221.2024.03.25.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:29:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdx75: add unit address to soc node
Date: Mon, 25 Mar 2024 11:29:24 +0100
Message-Id: <20240325102924.26820-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Soc node has ranges, thus it must have an unit address. This fixes W=1
dtc warning:

  sdx75.dtsi:399.11-736.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 7dbdf8ca6de6..f58da999a72d 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -411,7 +411,7 @@ smem: qcom,smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.34.1


