Return-Path: <linux-arm-msm+bounces-20954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7148D39CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30EB31F24467
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27701836E3;
	Wed, 29 May 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pe0YHMq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF7D181BB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994034; cv=none; b=bAD+cb+8XOCuOySzVPP0UtkW7TxOyBGsv8mgra7jnacXvoZr9hNHOsK8fZVEG5DZFNEDzuYdDBTktaShJ/eGS5QrJywsgPNfSg08/a8DhkHMpXgPdkemuL8q8SGHDy3kd2FQbTiivwyxmEb3FFSGR9ILBB7Xdm18kDxew2/KDaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994034; c=relaxed/simple;
	bh=8S+6nH4nNGx6YH6EGxuio5jjv/mOFbibmmgemtR1wWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+RDE0STLsKg20FldvDxmjKSRd6ZH3bGbbWRbdWQEle2GnVxCovRVrRLkLj/1G3CMRoda0KSuCQdNOV1CasPvq4XkWB7hmzxsS/WVuGEpuT/xzIJPT4L+HsTrtlOAQcN3aaC7tFjSnh43kMWgtVmlNJUgWyjHkejQJm5zLWUg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pe0YHMq8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so28923571fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 07:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994031; x=1717598831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdR7jpE2qGbCAHe6dW63fk/OeQOhaCQXHMeDd9H9Y6M=;
        b=Pe0YHMq8mAb2xaVqtad1x5HadnxmccreJvZAltkHsbad25nfvkSWoCesejVGTitToe
         pxwHLVjQRWI/zLaFNoA6+FVOz4E6naWKQYy4KqIoYPKeTomTFPcTzldA0w8zpQkdea25
         SeJi1lqI4Mo6CN62ztpuTZsFCRUF6Kq5TT47ZgY1jtakioZ9686EDcT6WVNE2ZzlOU6l
         2Cy1Tp5fKawx2kEqT+vfxbxy80GWmKLr2qrHjCAdG2QyvaByaotval1wiFQpabnx0oWy
         KDEHRI1PwbSKhumOSZkYSpf9oh7unJG4xQf6zmTXMpSCdhPzkp9OPuphbdEoESV8cYjd
         X1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994031; x=1717598831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdR7jpE2qGbCAHe6dW63fk/OeQOhaCQXHMeDd9H9Y6M=;
        b=PHjGm5coKb6IjfYX7bjf3w/MGUH1FXMRfy4O0Xf7qw0De/OhQQRA6SX86NVftuXFqI
         ucvPlLb7MYpJaq8UfxrItB/MMzYVKiRC5GVkHkcqKsUgWKXflHoGq2YZnei5QCpuxN9x
         3HyL18YkrAN/m+dpDbqPVO675DmnbDWSme8qE/eqV5+DwP+v+Iqk4kz99nbZYS17vGx/
         bVlnq3ZDTA16uRHcJhTF/uYnIrraVtZc4h0ZI2N4DP/QGrlHhL7QVmM1kmCwsNMNHoAn
         n+tpy4xuAURM/BvYZazH4DmZM/iBlTwzfJnTH7J9LlReZ99160Bhz4Xw48MylJYabxeU
         m+Ug==
X-Gm-Message-State: AOJu0YyZn5amAhqttZTQIujd+J0sng8a9ZgN/5N/cx1SKweDf8GECCR8
	SZ2CHK4boQyJpJRcj2tHaRkF6ajK6j6ON8qwECxYX4Bal6Y4mpb7wXLtCqYNS8U=
X-Google-Smtp-Source: AGHT+IFUAh7xNNAF4upCbrU2PXfeDApKrXHJNgN3HPrRXkUvd9FBBarEtgM/zbh34JFFBAsKsKtRvA==
X-Received: by 2002:a2e:a710:0:b0:2dd:cb34:ddbc with SMTP id 38308e7fff4ca-2e95b27b108mr121915931fa.48.1716994030814;
        Wed, 29 May 2024 07:47:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:08 +0300
Subject: [PATCH v2 10/14] arm64: dts: qcom: ipq5018: drop
 #power-domain-cells property of GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-10-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=728;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8S+6nH4nNGx6YH6EGxuio5jjv/mOFbibmmgemtR1wWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/ls6mHbeMql8Y/p1rvH9IlWbYrfAlIaY75L
 dAxf7yHLxmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1TC0CACMV4T/lO6KGuIdNUR+TtBrrlhZSuSSOzS2r1YOPvq2l+z6UAqhbTWl2uzWCYrp7NjoYz1
 KPGiIK8Intt5bNqZFX6RX1phr1uXdDxeX0c7IcudtL46Ia+pEI7ah696cUc75HYjOrr1DreQ0Qp
 6OE36mV2s+Q8d/jl8uJtThrM4mDMjV98S8V2CjWlBAQk0jc29tYwzYDHcVGQr5FVKQSVDSCfcHN
 jkx5ielaNYu2/6qM1YSs5f090CYO94zVbbRylCeiCMx5OjGQmf7OUNUOmYN1X0gl/spbRbX8u1i
 2YxfxiLNrGhxbJnXu0MpTiDOY/D5ij+29N4aAcq0B1Ry2jfo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On IPQ5018 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 32b178b639f0..7e6e2c121979 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -179,7 +179,6 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.39.2


