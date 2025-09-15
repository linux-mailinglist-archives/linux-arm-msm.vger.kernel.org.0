Return-Path: <linux-arm-msm+bounces-73582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B6EB57D2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 15:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0CDF1886DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFED315D55;
	Mon, 15 Sep 2025 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTyXsVyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D8315D26
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942939; cv=none; b=pX4t3gjc7Y0BFJCqGwJRLSITqWA8EDk1kEMV1JRMHu74QqaMMVBILdMidVzjPuvD/rBRoI6FHlSaEvojjgkWFNMcpISCy9qQQA3JE0DqgeHiMIIKSbF58xGVG7bwDo+4MtTP1xZVw2unPbfuzCuLYWMVkxDW9W0rNxyubXeoDOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942939; c=relaxed/simple;
	bh=ptDgOt9loL01vjXEcr2EORId3mL6P+tLCbDsLLyXacs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5UDrw3xSZU9smGnOGF8S1pTTHD69c4SBJgoFXef6XDjBbfjm2z6aublDdd+a2LOQ6SZlBNJWHr3D7xphucpE+a87v+Bz5/k5rliJn8ZY1ukt9/66zBisvUmyefUdxooCweGHYPKacSxTA021GcHTh5pK6W7rmwjGl7Dq9P/LIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTyXsVyN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ebc706eb7bso326535f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757942934; x=1758547734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4T755BDgP/qpBojCajXbDU09SOREwS+KrCJfs0q/wk=;
        b=bTyXsVyND+oNO9i/ykBq0NBPMxor7uAIIGIt3xuQRmCL0RYsPaW3XMFvqzCUjW++tA
         Sh4drzqeUeW5f7JqBKorZa6FQb8mCvDgyMwKDv3mM5/m68WjNH6wy03lmbAQmNvE3JRy
         1DKSYijOnuhWUcwv4VAuV2gRHlbml/+LvQaOCjAAKHNjA1clMmEexDLlogwsxbhSGlQG
         WsjlWpNo0kDN1pJgiK0DiqlxWLXX/W86RGkg0ppJTedZc/8S1Vn4fmT8Z/DluZLymQ0Y
         F6nxQ+/J/R3J9f3ASxUi4mUK4FL7NCS5Zx0ckUXIdHooXu/p6mII3Q7JJH0AhhSbqX1a
         K/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757942934; x=1758547734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4T755BDgP/qpBojCajXbDU09SOREwS+KrCJfs0q/wk=;
        b=rnSTe4QhisRW6nV4hBzJiyteBX8Fl2o/7vTW+1UaDTuRWGGSfiiL7NzTDEgA05eaOL
         YVQBfLlCpSLhDUDI+mNs2ozNHh/D+5JAsThxxzNe+K39h3q6xjiyO3MIS4DNRvQjAoMY
         GAb0HIAeJlPqLjccBsbNzwmZTNMqqvmlAQn4vG5SBMSM5pFn30q2f4jtqDvJpQL4ZNFL
         xFu77u/b2bKdNVzqNtlNcZLgT8fPRcKxQ/IknGVQDwATP8mgrvIa5+4he6c8J3qJbgZ4
         pSPoXzXhDhpIDevwcQNVSk1yM3jV6Ko6tzIYqnl1+jYwa3ViKLvWhLLEhAEHrvKcgVU4
         jfWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WAzgnxNDGqT+8bxc5jtZ74Frj550xcdb0tbVpwdXm9hKFKwouCuAWXsNIRzc78oARM6va78USh4E3QKH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWta30S7LO3UieVikk3VuK+i1Jgi6yHEIoKYJx3E2TEVAZg2nV
	Lgvjrj5OMAo5m/eshKpkJk/8G/h1otqiNvoWQ+cKOny3myt11GCaeJUqndJRfYhctnn064uPl9V
	nu5yN+vE=
X-Gm-Gg: ASbGncuNiGpNeTu5LJPcOW0I9vLtYBhBC+oZvqQiJ9Ju8mmi6oS8kLiXo/UBNdE57Nm
	CYaDwowPsbi9xS0slpQ+88tf/jk4L7mAvBzri3mG9R6ZfaoBs/qWSwWuWuLGd/gFIrg0v1C1EdM
	T8hhxj2NPUsIwRf2PvCu98FlKmoS8GP85DpqZk8rqRCmbDMEF51OJiTNc8vM/0kmDdBZ/dapqAH
	v0IDPdhKJd+a/F87uZ19YbvXs1l+SzVsdwLQrF73giDKwvqitGrlmeWeZGyV4s0Nnm2jkq2lxpO
	bGl0Nv0eOBLf5j4mfjjJT/XR6AcyGTSDfIQJjKkQBpY64bG5JSVELQAjc00YrOrHfL3QnCKVdfm
	TaxP2BEhmxzY80IR28O6dAjB1+4HbsMGO8yQ=
X-Google-Smtp-Source: AGHT+IF2lZ75yypIgx7ZsKIckhx/rgZnX4SN4Pv/XeHMttF8TsxMtLWww+ac24EzQYJ8nkDOc2rCrg==
X-Received: by 2002:a5d:5886:0:b0:3e7:4fda:fe0c with SMTP id ffacd0b85a97d-3e7657b9f3emr11555829f8f.15.1757942934041;
        Mon, 15 Sep 2025 06:28:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9fd89af70sm5978874f8f.43.2025.09.15.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 06:28:53 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 15:28:31 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: msm8939: Add missing MDSS reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-msm8916-resets-v1-2-a5c705df0c45@linaro.org>
References: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
In-Reply-To: <20250915-msm8916-resets-v1-0-a5c705df0c45@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vincent Knecht <vincent.knecht@mailoo.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

On most MSM8939 devices, the bootloader already initializes the display to
show the boot splash screen. In this situation, MDSS is already configured
and left running when starting Linux. To avoid side effects from the
bootloader configuration, the MDSS reset can be specified in the device
tree to start again with a clean hardware state.

The reset for MDSS is currently missing in msm8939.dtsi, which causes
errors when the MDSS driver tries to re-initialize the registers:

 dsi_err_worker: status=6
 dsi_err_worker: status=6
 dsi_err_worker: status=6
 ...

It turns out that we have always indirectly worked around this by building
the MDSS driver as a module. Before v6.17, the power domain was temporarily
turned off until the module was loaded, long enough to clear the register
contents. In v6.17, power domains are not turned off during boot until
sync_state() happens, so this is no longer working. Even before v6.17 this
resulted in broken behavior, but notably only when the MDSS driver was
built-in instead of a module.

Cc: stable@vger.kernel.org
Fixes: 61550c6c156c ("arm64: dts: qcom: Add msm8939 SoC")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 68b92fdb996c26e7a1aadedf0f52e1afca85c4ab..eb64ec35e7f0e1c63b0b96f68d30006c2e440998 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1249,6 +1249,8 @@ mdss: display-subsystem@1a00000 {
 
 			power-domains = <&gcc MDSS_GDSC>;
 
+			resets = <&gcc GCC_MDSS_BCR>;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#interrupt-cells = <1>;

-- 
2.50.1


