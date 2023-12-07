Return-Path: <linux-arm-msm+bounces-3708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 714798088D2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A461F212EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE7D405CD;
	Thu,  7 Dec 2023 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xq9L9Een"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5EE10CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:09 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf69afa99so785233e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954427; x=1702559227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FxxKaDUsdyAhtM0TQDYaT6yIXjFwrV30U0/OXy94P4=;
        b=xq9L9EenRk+HiKn4VVqr0QgPIIUUAwCBvr2EsPhPCug0+IJ232tbVt94+0LaJP84eh
         vhCvL1121Cqu/2FDXESrBbFnHBUdQFOU/S/cZhlwe+GvkfTHtLh7BFycT8pAFuDSWAt8
         7C1pg4T8jMgD4TvHe1fUlLZW2oLiEmmQxGGz3soNJkVRFJdocsZgMgLQV97VjxHg9Ric
         I/+y43YcqZOkBnf602ZaUgadxrWbc/IjcFD+TUV3ZYdX5h7Euo7k8HntQTiIWiuifk0M
         SWT2aBpuLO5XI8X8ZWI5nzDQwUdusadMmkUIOw5trauX/4V1obsTuCwjmw+UYZEat4ei
         SB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954427; x=1702559227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FxxKaDUsdyAhtM0TQDYaT6yIXjFwrV30U0/OXy94P4=;
        b=MhFJHqx0KWNmggkLqG2dgJl1BpstQaqW/QRXUR21vWQrIbslItBdPNiqAMWqsPdJsK
         BAcwczfta16Hb1XBLGHuAfa8c1kYLJwlytEcwyDhQnMa2ALD0v28QBNOS5Aohr0LN+e5
         XOBO2DN1xfZWH9XRi/n2MWdR2J+nq06C/BfTBLTb4B5edw2SoUr4aNIM5VXwGi4RWCeX
         JM1xogZ1nGyvI+h3paQw/E7X/kykA+H5mgci4cwCRNhdvZpouiZycTZXVhK27sOoApBM
         S+ZTbdA4dAmzrNaCrPRdwpmKzTB3a+EaPUycoCqDlFtlU3v2u4AB2mAZBcytf6B7GCK+
         QfmA==
X-Gm-Message-State: AOJu0YyGsydbw5suoh++1KWW3WaSd0kYd01Dn40+u5cHjU6CR/3gt/Ws
	4hhgYZ17/3lEWkjkxrnG6Ej0vA==
X-Google-Smtp-Source: AGHT+IHhksCOb3PhJ9OlFNczzGMelIZBCRQczjZ78/98MKoQf68cK4hKH4s0Jly3EzVz1RczI1gwWQ==
X-Received: by 2002:a05:6512:48d9:b0:50b:c3b9:76e1 with SMTP id er25-20020a05651248d900b0050bc3b976e1mr1526075lfb.37.1701954427766;
        Thu, 07 Dec 2023 05:07:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 04/10] ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
Date: Thu,  7 Dec 2023 16:06:57 +0300
Message-Id: <20231207130703.3322321-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
References: <20231207130703.3322321-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,spm.yaml

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 95ac25e1a3b4..6832030c2c88 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -365,25 +365,25 @@ acc3: clock-controller@20b8000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: power-controller@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: power-controller@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw2: power-controller@20a9000 {
+		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw3: power-controller@20b9000 {
+		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
-- 
2.39.2


