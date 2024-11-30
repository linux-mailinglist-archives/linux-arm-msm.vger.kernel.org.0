Return-Path: <linux-arm-msm+bounces-39663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B9E9DEE3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 02:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ED7E281BB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 01:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F151A42A5;
	Sat, 30 Nov 2024 01:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ABBHbLac"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2F1A2C15
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732931115; cv=none; b=C4naBZTB6LoBeDQ0TFWa8XLKO95xNT6S5i/byKFRcWCeBaWrbmvqfk5YpFP7kdJHlPpcGDfXN1qQE9xE/mBW5ay8vRIlzmmbwZwb5LzPDb6JuhMx6p1A7IpCNRCK1K0SyZAjggi5FlLVJ6GriXne2ftXcCtAfVl782BE5WBmo+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732931115; c=relaxed/simple;
	bh=LXX0tpGxrPC2kis2WoEdR7Ui3mOGhEj+zhg45SEX/Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQITrjv4cU8WUqbhtzzaNcM2Oge8/dEDlLdhdIs8hQuPdNcn+LkrBoUoXwkoQuV+XK8fhbmJWH6NaiU5kYuMyEEdpoNSoI76lV/sQTf3AOGeUQ6Ylm4eKBrNsI1fQv+hrspR4YvIAS1loO1LlYKMpU32gmoV7YQgtn8l9vlj2UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ABBHbLac; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53de84e4005so2863450e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732931112; x=1733535912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLx30k3oLtldvsgstuJQ+s3SGXKcYe7FaeB1beknjb8=;
        b=ABBHbLac0BsfsvvwMTXxIOHarXaqT5ETtFSflVcg1Wi8AxKZbXxv6Nd2G6Cn8/83LI
         VaP5bZYLSMxlTHQPvQUk6W3nwxMDo4RxJ/i5LdFv1RnTXSCs9G5LB6PE4vAnvu7y8zpG
         QxwdIdzLbhd+B60srYd+30c6Gglg9BUhdyuVdbYpavvFwWfhcn76AY4PyH0VcH1m6iIP
         B9yVNj47BEWQqLojyg14Y8aq5fwTFKBI+CHnhGjc1oPGW1DAI+U+KRWV1VLHiWy/dAHt
         8TFvBou4djray51W9RZpK1LduMYOo5cgtX6A5P8Y2fXzy7nrS1kyUpR3XPpR89phQW3T
         ZWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732931112; x=1733535912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLx30k3oLtldvsgstuJQ+s3SGXKcYe7FaeB1beknjb8=;
        b=W+eyl35f30NMaqask5DG8Kod8IFnBOu6GkErAzhYe63T2Qj5ULqvELvl2+M4BQoyNW
         gHnh5gZrFjGCRh31PtlrrJrmJr+Ay0xrXLlmozBLOjUO+qHNTUQ+XQwgf/ea5Q5nBVsu
         4EdOOIHGvFFIx5/8mMis9MJZ7W3xYrHMjHQT7YXF/qpko2atTDned0yws3cCe1uZB92V
         8vGq3WqeW3qenC92XppnDE2efT5euCrpSBQiAalGObreKJ7DzJ7zF1MxAW1bfGtxLFpM
         ky+Dbm4omsXt3p0qAeOBHVXqfk1eDr/OK45XIERp4nPUp/o6I25FslJVKffPxb97nt62
         LcSA==
X-Forwarded-Encrypted: i=1; AJvYcCX+MljSZYIhRxzGsvFk037R9n+l0xqG1+Krg7Ul4CdTBz4XbWVQ+Z6imfF/ip9okM9rGMjrxNcrgaDR1XaO@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHpySPax+mt4Yot0zouZEowAdsjDZwmPCbqOyn7gyrMip+ZLF
	jepoqVyD0nItWbSUE+sq8QsCS99BSvdTiDyPdaSyMjOhX5yCyKpk7saxskEpyNs=
X-Gm-Gg: ASbGncsaPZ4lQ14ImwFKUhb6JBZUvMaMYedqcWiMkE0gcI6tYCqQMjSFgI9YH4AErZn
	Un9sx6pSvf9Zpom3/IrgHJqsaXP+7MyZV3keout4Ce25pAJyCnR9U1+Bl6kP9KVOJjbp8CpvXa4
	iNy7rZmymj3mfNCgK2iu32HtNxbHlRZzlCsos4kXz8ENW27z6KXqGyp+VhPVSSL8fG1KoIwImvc
	h87WjNMDiUqSEMpkfyl0C1qJCYgI9vmDIpi22s3UtdDEQrJIdBhr9dACQ==
X-Google-Smtp-Source: AGHT+IHFQ0NyCu0orpLKv3xjrWL8Avs0kPgEYdYOIiv//cGCHygZQf4V6eq44clsK8n7/xBG9nCR9g==
X-Received: by 2002:a05:6512:3a95:b0:53d:ee75:1443 with SMTP id 2adb3069b0e04-53df00d794fmr7797805e87.18.1732931112305;
        Fri, 29 Nov 2024 17:45:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a0742sm631946e87.261.2024.11.29.17.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 17:45:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Nov 2024 03:44:31 +0200
Subject: [PATCH v2 19/31] arm64: dts: qcom: sc8180x: drop extra XO clock
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-fix-board-clocks-v2-19-b9a35858657e@linaro.org>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
In-Reply-To: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>, 
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
 Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, 
 =?utf-8?q?Bastian_K=C3=B6cher?= <git@kchr.de>, 
 Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
 Rohit Agarwal <quic_rohiagar@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
 cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=LXX0tpGxrPC2kis2WoEdR7Ui3mOGhEj+zhg45SEX/Ao=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnSm31MhGEqb50neg5rH/N010ZmC9Og/YXRoANL
 NStRUSHKLuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0pt9QAKCRCLPIo+Aiko
 1QiUB/94zmzwNbHEHJ+AOpd1HZhwyCNY6wo9c+FWQhpUBhmHCfqol1BAx7EHeYIRqEaZp3Sxx+A
 U1BuxzFRKYW/Q0iXr7i9jXT526qgec1/Cgj7qI0EBUNjMB4tTIZBo/EXJDr5JWQr99FDfAvWwkB
 4WHZkosBo+N56FSMczBDEh6zAtKexiwYNRHzKotN4C1JsAE2e7IUZI0le71ZEImVIdXvoAi90SY
 SWuxpdcwkqG1tjEqzdkUpk+1yY48w7xPZ2z0VFKfX1TJVBGycgDEALLjwj4wrC+VK2b2YW9GoGF
 Ma4xs+2KimVlQhElhmSZHr0DE2DhkRTLhdCSzL3z3gf1nRS9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

sc8180x.dtsi already defines 38.4 MHz clock frequency for the XO clock.
Drop duplicate overrides from Primus and Lenovo Flex 5G DT files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 4 ----
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index 62de4774c556d3954a797287ba2ecb36d979dc9f..21c2d25a294506de41f6e8b7197be85c02d03568 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -681,10 +681,6 @@ &wifi {
 	status = "okay";
 };
 
-&xo_board_clk {
-	clock-frequency = <38400000>;
-};
-
 /* PINCTRL */
 
 &pmc8180c_gpios {
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index 79b4d293ea1e70d68346e7c5458c94f7c2b6f1eb..7a4bd6955470338dd9c7a628c9f9a01de8b480ac 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -773,10 +773,6 @@ &wifi {
 	status = "okay";
 };
 
-&xo_board_clk {
-	clock-frequency = <38400000>;
-};
-
 /* PINCTRL */
 
 &pmc8180c_gpios {

-- 
2.39.5


