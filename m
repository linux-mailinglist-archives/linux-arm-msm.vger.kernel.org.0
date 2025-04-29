Return-Path: <linux-arm-msm+bounces-56045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7767AA04DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1F101B61CCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D293A27932D;
	Tue, 29 Apr 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRrEV6WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C25B28934E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912591; cv=none; b=annx382Zc7cLqDWNo97calhxSA8NmytPHinjeWUCDhXalZOzs7k4QkWJ3rFleIRHMNPVMzjtsXepkAvRWKzbJc6L0e9qTz4FkZ5qz5+zcqcvgnqaHokcFTBCFVF6b/wWL4Bx5UDqQo4kEp81TSB9czB7ztH968zxLY0BGWlg0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912591; c=relaxed/simple;
	bh=yjwXf7wzEdAFtK4t1MnQHa3k4TqddxlT8YdTL7bVzGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rH1Smazg9yntY+r8NQYAtFytwhG7TYl/hZeEqinffVdDI227Th8Dqh+zAIT+IDGi9pNxEBNFiediMeHJeQWQef7pQnF+YZ9QyWjjThrLbtjfWl92K9J4WoeSXnvCwBDxAA+hsxcb06GlxehroIQslfdY94oyiPsCCZEZT+wBSBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRrEV6WN; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso958661266b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745912588; x=1746517388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MS6n56xIUolmaJivW4uWNv1Pd8cOufJuiERdB6GMMdo=;
        b=RRrEV6WN1pbj6kM4nAJSwQCVo9J0HH9LaW/o48JX1T1P/Ve3LqvmG8duuwEzX4eyh8
         AkmINEJ3jxkJ1qPdV86CbwvHw9VkqWUALYfq/e4RvA1Oi3rdeLalEvx/dpg8/YuEn7tv
         OCBMVN5XTjufTEE4J+KzTgIHPl6qqY2O469+StunRg/hKPSRGz9W52QbbwF/CcK6/Rso
         xn+AiPIfG5Egm58ZaQ0xNH56mvMSRCCZyRsQkkq2KTU9om+3eZIkG8aitXno4NMq4bff
         MHOiFgXRBPnutTX5rF8fD+fLLYn6DJ9Me3ZPHfGQ7pTeRPEf23lM2ZsCOWGoA9s4mjtE
         E7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912588; x=1746517388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS6n56xIUolmaJivW4uWNv1Pd8cOufJuiERdB6GMMdo=;
        b=Pqa5I8z9//si4CPb0KY0SCu2Fd25tsSJyQ9QhHQrf5LfJf/xLjjdiA2gJRPe6DBNsY
         5L6aGgj3o8sFBAhFtji/6Fqo1VITqQM8x2qjBOHKueEOGKDbgGd8Ed3LRL+5ZlwJhsrG
         RezAI/Zl2ONYBOj4S1Vhbvwwu0Cbv6l4AJROKOx4NZGvzRK6/VYPFXzWC6/XXBWsvOMQ
         IpuEuh578x/HfYq48IU1mJ1PrBMITDO5hfe3FMaimZuYcinHoJDmf4d0mr/lT2EKIkvF
         py6s4/Ignm2rUwGp0iBrF1QcpwT1DqkNNmx3j8GlMoES9WHUPfsrVAS9cNWk7TSKQYYR
         1QTg==
X-Forwarded-Encrypted: i=1; AJvYcCUI/y538UjVbIi+UscAlbjA3php2aBH5gDMDk4BT2VKiKi1+MOGfJ8/i0fnZvLaZ6CmY3pOLLbUZF7XM3bq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6yLdKDz/PCzgms9Xwt80wEdvq27Vu0g5WPKpr4BmP7xjJUnJy
	LeIY4eign7ZL3Zch+RSccZgifH40j1b8qtjIASvpyV9Rb8qqlU9jCutPALLlN3E=
X-Gm-Gg: ASbGncuhlja9dnpE8J5cc6lYAY8PUIKB0tkH8abc9uT69szIJXJyDU2oFjnw/q0GqnC
	f3IIo5UKr/kTlOq5ksBViFV/LaLZFHfu4cmWDAmetsFOdYGsWimOFLraZffBUcw/D1fXhpKehBO
	+FS5qr40YyH0+dsaEmv85OLCFA5SVgMJQyrzsGHPzU4C7+KqY9ldTMNpogWCg2claNWBZnU5zjI
	a3TDHM7NaYUzAGR4Hod/3guZzHn0ebTksMM67EtqjH1Ci347xuDsj+BGbWygMJhC/BzvaREKkC+
	2X7fG//y1iKzKMDxR0QA6CmniybGPtCXusBuIn0=
X-Google-Smtp-Source: AGHT+IGOpHKXSayjkk8Toph4OG5otPOUpqFaiAYoSDAJekSxdr28GegvwkbjD5YnQlCeeiLvFOjUQw==
X-Received: by 2002:a17:907:2d0c:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-acec69ae879mr191479166b.28.1745912588248;
        Tue, 29 Apr 2025 00:43:08 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm7048114a12.22.2025.04.29.00.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:43:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 29 Apr 2025 10:42:32 +0300
Subject: [PATCH 4/7] arm64: dts: qcom: x1e80100-s15: Drop useless DP3
 compatible override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-4-058847814d70@linaro.org>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
In-Reply-To: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=yjwXf7wzEdAFtK4t1MnQHa3k4TqddxlT8YdTL7bVzGA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBoEIL6Z4UL5ZXgDYJuS5NZgMTLFhJJlt53ndpRC
 PmhgZOjsW2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaBCC+gAKCRAbX0TJAJUV
 Vt4ZEAC1oYQ2fWREC3jdBLl0NmJaaziIr5SxVKOnfqPkUaqHGlvUQA1UqJqczGLwBaxyU2+csKM
 2pfYhjhw2AshvIe3yhCr6OI1ir6WT7gGT7c22Z5Q4IvJtOJ/mLMOuWh3ZjOGj90aigraNjug6+q
 E84aOwwghxpi5yEr13utgzs+VmToJnKvOkqZ5CCzbrtYt8aI0ak+TGMo0JrRwMj5Vrt21rfdb3o
 7ttWkjsYxxMWwjoCF0is2UEXP5YwOQkVklruHnDF6ns+nq2PcnGnQapb2bLsTPPHaDaVfQnUVHY
 iaKNjhsbq+PC8QTn608jdnL/s7lsqawnvYjz4sfjpoxyTyv7WQHlem1UsGCsYPvkiQ8nyglAhjV
 EVFZD2tPyqJSUkILAO02bXQcdrxsh9dZue6LiiV0qpzNwtAj2a2T6YQA/cCT1LcG01CSeFDXRly
 nTc7OiWT4jZY3RwmOMgkdb8iG1+WhXjEos0RoK86ApVQbY5DKC94jy14XMDYcr8sI6gdhkO6Jf1
 jUkXqz3/pN5mXLluqjIsJ1aTtHk/SRBrj0PqHNM9QqDYhne5Ayo8hOUuIVwl1WNERKJeKa4hWCC
 EBO++PxQPCitZ/bPxS1PY9FLN3wnHX8ZCEgJ/kk9xgN2tv3yrCv3V3nlflApMQgCZsWvmMVOO38
 gu+2ES0qAj15xIg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Back when display support was added initially to CRD, and we used to have
two separate compatibles for eDP and DP, it was supposed to override the
DP compatible with the eDP one in the board specific devicetree. Since
then, the DP driver has been reworked to figure out the eDP/DP at runtime
while only DP compatible remained in the end.

This override was copied over from CRD which was the first X Elite
platform upstream to have display support.

Even though the override does nothing basically, drop it to avoid
further confusion.

Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index fb9567817be6f887c9214cafbfbabda8b8cb8203..cf646a22366c63d1cc1659fab85dd424c55dca78 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -479,7 +479,6 @@ &mdss {
 };
 
 &mdss_dp3 {
-	compatible = "qcom,x1e80100-dp";
 	/delete-property/ #sound-dai-cells;
 
 	status = "okay";

-- 
2.34.1


