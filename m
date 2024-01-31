Return-Path: <linux-arm-msm+bounces-9176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8984374B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C47C28A177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 07:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA1767A0E;
	Wed, 31 Jan 2024 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cjgkkq0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9F657DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 07:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706684950; cv=none; b=C4e1d1Hb49GW2LwY2K1c2LGX4NteJzuEJFG7Gdf6iYYjd6amtK+FqzQeDOmzHz/QViOY790YYMWmjPNHBhJmZ6WujsNLKqBwmEr3+qUEmXKzsxq/Nu9dWNWh4YrYU5gd0e2x2z2GuJFOmjhnjPQ4o/qOIjx+Y9EtVNS8HsizMAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706684950; c=relaxed/simple;
	bh=vk945dDdVUzTGdi+7n851w/PBwLOfA8sY2v1ArztxCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PctgUw9YrmdsDEW8a9HpQiJocuLDEMKxayxxXifXUaCrLc4Xnmm+xE3EqI6orWqL521hlr4ddUXdfW/hYitmX+ep70mG6diJLLumj5E09GLDDaF83gK+7TYtCOkq+iFr9QlhuYijvC4ICt1Yf93AwZTh36X6VMmwQj/NPZnpJcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cjgkkq0v; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6dddee3ba13so2084463b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 23:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706684948; x=1707289748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4daM6StIHLffxPabzj4NBe1EGGf6BbOQFvW1iFIjsg4=;
        b=Cjgkkq0v0FXdNtrvC2pc3l/VKG5CqRdQ5KqaITGb/TbKTwdVIrV9bL6/qh/B1PUZwz
         wFgHDwRQKet+GqQbqu/srwTqS693CXaNy7FAhSY30BJNeHVapO3zZxkRjpap3TCGfFU1
         cW52ORjFrtDO7Nhis2s83HwpkqBcwV4Wdjs/7EIe3RbAcqleveQks80UJBOij812FLj1
         CCirOGuC/xhd5XtmaD/1uxHaXYjB6hI98Cr7KKjvfQO/yuwgavvykvPi1VoeD0VakhbJ
         I4Oxmq3Ju4DOWEUZCiGGvSxhjkKw7PizqA6VcfwF3D3KiDgvXvMS90s3pGDLwyQXg7Q5
         GMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706684948; x=1707289748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4daM6StIHLffxPabzj4NBe1EGGf6BbOQFvW1iFIjsg4=;
        b=iyu5W3gHEdlLW5sulkAEJK9dR7tkvJ+9BYMddQV06ZdA8j/unYESBT3HmiwYXnP8U/
         vfMTgnBezwtufBqstyBhH977PeO8ntS9V8TggKXJq34W1XxhWULjkT3C2/pne577Gsh0
         YzRL0wNTQ/hzI4xo2Cfz6PZ/x8WvhkGdUMM5l3i2Eddg8YXRq5r91aOwl0Rk56anqe7E
         z7UIAvK8XyEdBlKrBJ45q/sVK2ivD0ZWVk+5IyfejUuDVJr4ZoLzFJ3hBGAK+Jx0m9o1
         PsvGadZdoHPhUpRaxQnfonY2oXVvfnAjNC7705mgyF9ZtWmdwJ/H9yPkCwze+VQc5wk5
         pG2Q==
X-Gm-Message-State: AOJu0YwzBiPrfKNnwQP3p0yW5QjbKWDuw13rUJ7y0JjBtoWzetUB8+hN
	KY6hnmh6rIma1eGshOmb/sT4JbXXg/AfdSiRH7tJzYQrzQcPu/Hd0otF5Y03Ow==
X-Google-Smtp-Source: AGHT+IGm8FcuKIxfS98clR7PeRVShCFt97NJGMaoSj/GD7UALSsITsodaYv3//SqjZX7X1QARG45fA==
X-Received: by 2002:a05:6a20:7aa1:b0:19c:a48b:300a with SMTP id u33-20020a056a207aa100b0019ca48b300amr695240pzh.37.1706684948230;
        Tue, 30 Jan 2024 23:09:08 -0800 (PST)
Received: from [127.0.1.1] ([103.28.246.26])
        by smtp.gmail.com with ESMTPSA id lp17-20020a056a003d5100b006ddd182bf1csm9087956pfb.46.2024.01.30.23.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:09:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 31 Jan 2024 12:37:35 +0530
Subject: [PATCH v3 12/17] arm64: dts: qcom: sm8250: Fix UFS PHY clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240131-ufs-phy-clock-v3-12-58a49d2f4605@linaro.org>
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, quic_cang@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=vk945dDdVUzTGdi+7n851w/PBwLOfA8sY2v1ArztxCQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlufG+wgcwrzJxDeTRdFX6AuE4Vs66xfmbrM42p
 aNa75sNok+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbnxvgAKCRBVnxHm/pHO
 9RsSCACX2/uwx+GRGiGscSgdBleYMl0xwLBg/f+KX3XAijD5mocEDvnMkX+WYZeeYbk547w1yfP
 X0LZnVw1Ie5NEcKUCLivagHkhw3ID8GKDYjaVM9JGi+RkUQ2e/xIgRilbUs0wfFcPBGSMg+bOb0
 cQ8dO1fhkM0nM21loeBfugZqvYnMAa7yafLVuJvQaUuVPD0SX/VJn4ji8eVdCCA2omTsPygGCaL
 4q+afNgOL+9J9w1oAjk9iOuAy+1U7UY6hikaodsczVmFFBLYjvW/tu1xiPs3sHqsH5Gw7PcxWAh
 steq7FrdgL3FbHXxoNVQj+XlV1NQXJ6cDq11QVRIWtsYpVJj
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

QMP PHY used in SM8250 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: b7e2fba06622 ("arm64: dts: qcom: sm8250: Add UFS controller and PHY")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4d849e98bf9b..f3c70b87efad 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2540,10 +2540,12 @@ ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8250-qmp-ufs-phy";
 			reg = <0 0x01d87000 0 0x1000>;
 
-			clock-names = "ref",
-				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1X_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";

-- 
2.25.1


