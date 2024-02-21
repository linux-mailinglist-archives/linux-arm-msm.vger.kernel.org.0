Return-Path: <linux-arm-msm+bounces-12047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAD885D8BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 14:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 788B4280C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630869D0A;
	Wed, 21 Feb 2024 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EjqjIYri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F546996B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520683; cv=none; b=XFNGkZAU7EmYyTlv2nn5CPCcMZv0lNlIDCD2TfPB0IJW7Phg7X0L77PVmXyFem4m4W9kd9i1+eEJb0bGjeOERyQiMKjNCsvJeHD4Cermr7CFkjbXHzQ3uUzwSTfs/9bBF5uJ4nNm9mjrzAlr9VrEchAjktjvhtR1K8L3/oniNc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520683; c=relaxed/simple;
	bh=4mMz+Afj9+txFT9PWzXETYmqTBIiFL+7F4R5HJzfGME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTpz4/DqT6QqjUUv0FvU/Gv0sNOMLYxZwxUzNGYCXjVO3E1Sei8NIm+9Da0PocgE7Av4vsb/nOQiSBI6c58VkyVyayco4OkmO6V6NgVQjDuEpM1vVQVM5hvVmyfaKPSfj35s5hKf1XnvSQv4Yawixm56+zLHwvCwOUf7I07/EH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EjqjIYri; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-563e330351dso6056359a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 05:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708520680; x=1709125480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8FGb9F1qERtrEowrAl1nfZPL70Ktg5wR2yYU4ZAKN4=;
        b=EjqjIYrigOfNpXFK6dT3FBRsP8P1sipssLXWpRFb+nilyd/WTQgBTKcrDQs9FX9tXf
         gcFtf7w773/W5LbgTBhABo2sgUQFxu708bngnypPS/9J7y15457OuWG2Vg97Vprp4//d
         ttMDPPrTYxuRLojb28lS57rZqFoviJI6LqnTsLjWGzAZ4ZD/Twz/uIzDCyisiM+TclDU
         qAy3El/mEuDL6mVMv6/vJdVQKXFXOf7qfvhH//IRyYur49+gVIWkm7UwvIry47AY3Qi6
         kgc+esfEFa+bmDBHhbwIZRUdUYo9QUtEQyRY1Sr+z9rtNwnv4/tP+5cv0w9gXwb2it3i
         R+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708520680; x=1709125480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8FGb9F1qERtrEowrAl1nfZPL70Ktg5wR2yYU4ZAKN4=;
        b=HUsWvEChZo1kckOrflbQz7Kmf5QBBM8HNvJ4Qnqo/glzLdmUwUn7qz8O1FdARiipJp
         m5PT5qC5BKgbj01tSWFg3HaWbVO7+PWMNUNvzZ1Nk6Spl4EXNfYliVdUv0yVgpEF/BUX
         qE1Ogokh/h5ATim2iFS2slHLAF1t8RJBbKT/V7pGpopBPJHosJkqiSMxIs7jMrngwiIB
         rMYWsMb+Sy5CLTvXOBtSJFUWxfP0tSiB/Mxkomm194I3/c8X/pSrbramG55LM9UulRex
         mfjg+xn6kyMvYLW4/kBaoRHtGBHy/NqBqgN2cebwXV5+j4LpLUSOxxDCnFMznc3TNtM6
         S27Q==
X-Gm-Message-State: AOJu0YwtEeUHt03TtbGoVSTj/6GFyubVgnYuwNdj3Rf422vs3NmvnkuA
	o/UXJ2OANQUX37G5T2tgxi32xf/1XGJ3uOzg4HvRYWT3LrhZBBKpH5+zaNIu8QeLEJrG3+SWgKs
	b
X-Google-Smtp-Source: AGHT+IGBQLerAjzfp2XvRCVdAM4T+e89hod9D/J6ejsAikWo8A6tklvn/F/jwx/AjNGZg7+uYFvDhQ==
X-Received: by 2002:a05:6402:1045:b0:561:cec7:cb1b with SMTP id e5-20020a056402104500b00561cec7cb1bmr12078500edu.32.1708520680636;
        Wed, 21 Feb 2024 05:04:40 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id a20-20020a50ff14000000b0056459eafc0asm1356178edu.17.2024.02.21.05.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:04:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 15:04:25 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Fix SPMI channels size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-1-72b5efd9dc4f@linaro.org>
References: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
In-Reply-To: <20240221-dts-qcom-sm8550-fix-spmi-chnls-size-v2-0-72b5efd9dc4f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4mMz+Afj9+txFT9PWzXETYmqTBIiFL+7F4R5HJzfGME=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1fTjJmY54YBG0h842mLyJ2FThRB6eQ/tVf/kz
 e7JuJt9Jq6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdX04wAKCRAbX0TJAJUV
 VqfZD/9ZlnOejk6reVs4etOcvOK+Bgxz6t98718QfBXGAAYf+n0mVXp4HuDKkurOo1mA8BMwqgy
 eovWD7Ttbf79SXTgd6N+tHSqgy6YUFAh0hIIUFtoL6KMaTkp2vpunMvEFDFa3CEFRAyd863mHGE
 s/XK8DnC2Otc1G83gkIjjG/5ydU+OtQQqgOuplzLxeuJMCa3a9CYDf6zrzxbbPB8dwvDi532Cud
 +irBLi1S7yxiphETdn0KhotXo4T5nv9LE5icSZ0rScp/oowGNGc1clWGKq7TUHD0I9c5wtdMzmA
 U8QjMARcpQtMHdrMyVyvbYdjzATcYFI6nJNHAkWP3yJtsAJDQ4t+5Q6SOvIrfKGHrTzKMFbOGNA
 xE2tjJUvih6ifiHWtxiupShkiZ7/AYfqs87SEy4t8ri2Na17Q6uyU5cyOt0YYrNTAjzFz8FlO5R
 vWPPJlUxylSazOb4XCL1IFsVI3APVcl8fjtpJIpK9j21Mvf7sVlVrbqDsxJ0jXwp55BUQJZxyGi
 C1aj3ndHIIMsdRfIWUvxLw4y2h0W5TlGNhxPQUtJEJZt32LVtBYRD9LU5C8cIaE/9UfSIVZVZxI
 TEnsOkKbI0jCKIEP+s0uXPeECR5cQwLYvT2P3/6sEz05FzJntlRkFqziEeyz9F1PQHlCH64Kmk5
 Mh11jhpB2AtBVnw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual size of the channels registers region is 4MB, according to the
documentation. This issue was not caught until now because the driver was
supposed to allow same regions being mapped multiple times for supporting
multiple buses. Thie driver is using platform_get_resource_byname() and
devm_ioremap() towards that purpose, which intentionally avoids
devm_request_mem_region() altogether.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 7474cddf7ad3..3904348075f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3318,7 +3318,7 @@ sram@c3f0000 {
 		spmi_bus: spmi@c400000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c400000 0 0x3000>,
-			      <0 0x0c500000 0 0x4000000>,
+			      <0 0x0c500000 0 0x400000>,
 			      <0 0x0c440000 0 0x80000>,
 			      <0 0x0c4c0000 0 0x20000>,
 			      <0 0x0c42d000 0 0x4000>;

-- 
2.34.1


