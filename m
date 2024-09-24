Return-Path: <linux-arm-msm+bounces-32252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9B984309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 12:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66581C228BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51841714C6;
	Tue, 24 Sep 2024 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckM7syxk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06671714A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727172377; cv=none; b=FhN80MV2i1y7kqfUpR1V+8x5DKxuRq+jcO7Didb163ZE75qjKDSWKOiowURjapAoqU0ra4VfcvJr+1zJIds3r+hr1NjRJFuS6Czd4rd9OIKi6AE9DgMqaZ7zV7ZPAfQI9m8JrDFWQ9aiVQE7a/5MgqA4IGC/eUjVKPZyPjcGh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727172377; c=relaxed/simple;
	bh=SiwGiCdJUbAuLFB/gYQTvtcmhWOxR5h1hahUn2zmMV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfwdqMDiPZ9WnrNCZ7ypkY/hgTBDeb0LmtltMtPNQD0bAxAu9H/6KP7QPG4qGeZ4pGkTAhNUjGHv5+9BmMEsi8nGXE7LZbx0RxZGwNd0Ns5T2m8gQ7mDWgnmaeV3AyoiIit2xjaQQrzUoMCqL4bgMce3v8mOHXhzHoSyoEdCZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckM7syxk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53568285c1aso609528e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 03:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727172374; x=1727777174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujYP+y0EUNZwkIFccXKu9SFgyHvwe0ijLDIWxznuEVI=;
        b=ckM7syxkDRz+ZXuvXykkBvQLFAoeNpr90Q59YBFWg1Nsm5cR8Kk3QLhQwZyCou4K5u
         o6KRkEDU+GIRb0W27FLFCBDtRrsEaK1zB1jfss3fndw11Y2egyVBYvLXZHtW5+T6ELAf
         e9KLgbgbiXHnrrQZDdrDpnSw0pRr6/yXCsWhu1FNpk3zSXr5PVGYjwGKSGztCKdo3Ovz
         QdowF7sb0p79cVJ75/J47oPFAqC1n3MoG5a+dilB1Q+MpGwmHBvKAvq4hzdjSfhkIq7o
         CY8LEKPnwRPM8IGRv6REij6tsCp6ioZjJU8k5kiZtQBCJKgu6O/2oV4o8lF+B99KIm58
         twzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172374; x=1727777174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujYP+y0EUNZwkIFccXKu9SFgyHvwe0ijLDIWxznuEVI=;
        b=Xc1eg3KttDXBxcjjCQC4w8/UHXbU+x/fIMwCAhupJiQammLoEHu+DfPmfmyORbxpzv
         zg4Nji/EUkUFxCXWdMz9sqpZ5+ra6Gs0rCNNilZYBhVnf3mRp74rZLZLK87o6nHknpra
         0PDAMBX7wh3WBx/OMq2WBSFhac3/lXb9yayq+63CWKrvUd+swNWkCXRghj4PEsv8PqOp
         BiVq8+mEV6sXyiQR5Bc/o7RG8sWW8+b3ClHia6tGmK/Gmg+m/RnsHvawx79lJqlB1gLa
         kuShgwkipHS+1ancs4FNXdk+ZUqhj3jwCbZKflc7unZJjKB5W5BmMx0PZMH0m8zcorLZ
         2ATA==
X-Forwarded-Encrypted: i=1; AJvYcCXEzj91eg7N1Q/5j1XO7ymU+XrOLb3KztkJY91jM0ojfBOGNV9SwEXSuiip75+RuxgnCzwqY3wnhkvE1+qV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Os1x+yx4VflQ6sL05m3Kd12+PwN6z3ULXZtncnL1Jczp3FeR
	WYEbyf6YBBQZVP/YHKnJnSe2mWKwWO0SqMlSX1RQQxh8oLNBFfuUd4R6kRYzy1c=
X-Google-Smtp-Source: AGHT+IFE70oHOCRgCRB0BrC5zLx0kjeRIq82/DMMTIJU/czuSWKKCPFvWmlZRCqua0wxzSNGfhXfvQ==
X-Received: by 2002:a05:6512:1317:b0:52c:ce28:82bf with SMTP id 2adb3069b0e04-536ac2f5117mr2126227e87.5.1727172373977;
        Tue, 24 Sep 2024 03:06:13 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d937sm156713e87.273.2024.09.24.03.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:06:13 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: qcom: sm8350-hdk: remove a blank overwrite of dispcc node status
Date: Tue, 24 Sep 2024 13:05:54 +0300
Message-ID: <20240924100602.3813725-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
References: <20240924100602.3813725-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the description of dispcc device tree node from sm8350.dtsi
there is no need to set a status property value to enable the display clock
controller.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 895adce59e75..796cbb58ef6e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -382,10 +382,6 @@ &cdsp {
 	firmware-name = "qcom/sm8350/cdsp.mbn";
 };
 
-&dispcc {
-	status = "okay";
-};
-
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l6b_1p2>;
 	status = "okay";
-- 
2.45.2


