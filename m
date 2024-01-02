Return-Path: <linux-arm-msm+bounces-6210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A934821740
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 06:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3BE280E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jan 2024 05:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84BFFC01;
	Tue,  2 Jan 2024 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k65YIjL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C38DF5E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jan 2024 05:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e741123acso6925005e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jan 2024 21:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704172655; x=1704777455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eX2UazHX6a3PdSJaE6sTu2d0+EWaF2IWb4BgvQm66Qg=;
        b=k65YIjL7HsVAEyUoBLXzen4kIfx7Jh5LCPaTanAl4S3z0vArUlmAY+egVrWNgGKi3d
         6vuau4Z/g92Zlst8M0uFTHq8gt6zkxGo3GLT80hnUz2EKMkdXbRWMAal3EvMNm/keuYS
         YyIDHWVoWpGLFuvMeZtRVUvl6eJT+sW9F6z7KmhbVjJNLWjH3rWVyN6X7NTe5p9cZ2B8
         jDWUucT3m4872E5sk6O3kuoFP8WX1Igt/BVDrV64rXYa5lvDRo+RuaPORyUoo2veJytk
         XmK4/AlTS8hLFVaWpIQOm5EQ2xxwgAW1sz041WNEwEvjeF2M1mGfpLqMOPcwV/M7levW
         iVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704172655; x=1704777455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eX2UazHX6a3PdSJaE6sTu2d0+EWaF2IWb4BgvQm66Qg=;
        b=Y+I09VyPl45+rnWwVaNByJkFyMywIG0OaLX8aTLGvPOubMUyq9UjZeRTTHBAtmjZSc
         idIr3HrwiiRJ7/ygtAIjxTflmLmVSZ0kLZdWIpM9lwXx38hDv6RUb1DA4y0HKAJUsfld
         qrSadfGPTGmAFAfQm72etBCIj8AwduCo9qI2B4IzEMuRWQmzEZ04F4HpKCpVKXM0XITz
         QElJtDZ95UHlEj5RqXjCpm81gSXzY3pjwjBzg4T33FQi4vYeT2FZxgI9rSFGMtlBjoPd
         7tvpV96FX8P/UvJs8wTb7uOrvlxCo+C9vow235GtGdgaZyxLWilGYnLIey8CbweUsrQv
         4Lfw==
X-Gm-Message-State: AOJu0YzX8CkR8nILtNhXRmpohhF6fE1EwruXQ9P/32q1mpF61sWNgLXS
	iJ4aEnYr3pbTHkqMjgKWOiSmBHuMy3HAKIjcL8dNklAWO9WeNA==
X-Google-Smtp-Source: AGHT+IG24nisbZ4xS2tfTlhoA7JIPuW64XwoHs34bd4kQLAYdmuG18DztJCq1i4qAJVTvTInvV9kVA==
X-Received: by 2002:a05:6512:3b83:b0:50e:7bf5:5424 with SMTP id g3-20020a0565123b8300b0050e7bf55424mr5068234lfv.47.1704172655601;
        Mon, 01 Jan 2024 21:17:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r25-20020ac252b9000000b0050e810689e5sm2081827lfm.33.2024.01.01.21.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:17:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Jan 2024 07:17:32 +0200
Subject: [PATCH v7 12/22] ARM: dts: qcom: apq8084: rename SAW nodes to
 power-manager
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240102-saw2-spm-regulator-v7-12-0472ec237f49@linaro.org>
References: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
In-Reply-To: <20240102-saw2-spm-regulator-v7-0-0472ec237f49@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TnBYrhwLT9j0cUksRKLsG+A3kc84wjCYaD7yk91YYJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlk5xkDzcvGQZJulXM2tCoPpapexczbg85ERy0i
 /sKGDBoaPqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZOcZAAKCRCLPIo+Aiko
 1R/+B/9UgWL7/mDkPwkZH4vARqwDyk9hdW8UviBTNh9aSZHhvg1iWwdz4EPuQAYeS5//HKJcLGZ
 b09Ag+bCspB5TXbOqNSvrLZHJKSavN87H4m+C9Va6vmOLsiKItGZH7zrDz0Iw2X/7r+Aa6URTf0
 VFhDBdLva76dFqd5QMZVbYnxF4hK0iwTIYMX6oVKsFNK/d7KXpVrtjcV5U1osf6XwtDSc+IvltY
 dVWYkfBCTC4J6TU7QfJJJGnfMbezsTUYRQZ29aMg9P5dP3Dy665atCg74s2y1BL6QVpsYQ8ov/P
 FGrckbTXmVzBNEUorWcfgXryLGGs8aBtPjOSThCZ50n8qnfn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,saw2.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8084.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
index 8d630db4005b..6fdf300ef65d 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8084.dtsi
@@ -629,27 +629,27 @@ frame@f9028000 {
 			};
 		};
 
-		saw0: power-controller@f9089000 {
+		saw0: power-manager@f9089000 {
 			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
 			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
 		};
 
-		saw1: power-controller@f9099000 {
+		saw1: power-manager@f9099000 {
 			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
 			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
 		};
 
-		saw2: power-controller@f90a9000 {
+		saw2: power-manager@f90a9000 {
 			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
 			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
 		};
 
-		saw3: power-controller@f90b9000 {
+		saw3: power-manager@f90b9000 {
 			compatible = "qcom,apq8084-saw2-v2.1-cpu", "qcom,saw2";
 			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
 		};
 
-		saw_l2: power-controller@f9012000 {
+		saw_l2: power-manager@f9012000 {
 			compatible = "qcom,apq8084-saw2-v2.1-l2", "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
 			regulator;

-- 
2.39.2


