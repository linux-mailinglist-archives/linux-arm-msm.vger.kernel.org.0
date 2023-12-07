Return-Path: <linux-arm-msm+bounces-3709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAC8088D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3182E282086
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC377405F1;
	Thu,  7 Dec 2023 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8Nt+6sh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57DBD10EF
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 05:07:10 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso677008e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 05:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701954428; x=1702559228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ofurekj2GsV9pEulhYImkibXZVuPtz//iePjOLcLr1Y=;
        b=Y8Nt+6shWf+YYwZ2rkf5PxCMCz5fbyacAAVy7ZIjSCOHoBmHmr83KhZ7WlItIHB/y/
         7Yaj+UyoYdOwD2ECLNyd4mCboDgS9gI+cKktbXwGP9Y8I8dhZwhtQ94nbAgeNM94b1jR
         0XIzYOyYmXh9U3sCpzij87KlLoxMHiG9nNtLnh8JG3dfWbKpU7qTWqKr1t9qOJ3Zpi8v
         Ua3G2Lnr8pDiG5OFKwON+n9jzTSPWsZOWjbnk5ulKslWzQYBEs4JQNZJkfC1q1hBQfgO
         J2t2JHnKnNx8mOOiH5adi/kDa+cj3wUx4pZPzuSsEbhHyF34fQ7QsgFLBidQBk3ZQEBw
         QJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701954428; x=1702559228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ofurekj2GsV9pEulhYImkibXZVuPtz//iePjOLcLr1Y=;
        b=KtLRpfQJHdv/Jr5j04vb18kWqAcCKCJ3i3B/KuC2CqiOGo5Bbmkk0ptnr8hDkGhpKW
         tnJvoHvXYmTMKSUzNEkNShV6Y8ZElWasNn+MY3eDFThwBqQwf5x9DaNFImD0e9Z/XVum
         30rNPo/cQKwCMpGYe00vQfTWrm0I+KGiwUT6pu7RqMm7vPKkutOFfrEcefoU8Ilpa5uz
         VTmpxXHxzlr8QZZp9v3tgiLZcyago1SfdJW22yiIpGEv27E9+aSl74YjH/Y+1VC5NyUs
         7fcSFF70ZS0uK/OoM1+CdA4S+48U7P08MGCCfQADt2bLikGpSwji7yMhAh5xAyFmrR5K
         l+oA==
X-Gm-Message-State: AOJu0YwB+PWhVbkRwnUncVPkuf8SUg+pvIy4Yq1J4L0sMaLCBvrvf0bZ
	NUXygjWKP/bJB7fDSpPqJfdFVjlmJ21PeBvEO84=
X-Google-Smtp-Source: AGHT+IH8E7fsM1+356PgaTrFUtkre+emASe2uu59fs08HwaL4yzQEDzoyNigLLl0SlNIvfa5lx6+6w==
X-Received: by 2002:a05:6512:3b2a:b0:50b:f03c:1eb2 with SMTP id f42-20020a0565123b2a00b0050bf03c1eb2mr1880847lfv.20.1701954428620;
        Thu, 07 Dec 2023 05:07:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512109500b0050bc41caf04sm167685lfg.304.2023.12.07.05.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:07:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 05/10] ARM: dts: qcom: apq8064: declare SAW2 regulators
Date: Thu,  7 Dec 2023 16:06:58 +0300
Message-Id: <20231207130703.3322321-6-dmitry.baryshkov@linaro.org>
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

The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
handle CPU-related PMIC regulators. Provide a way to control voltage of
these regulators.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 6832030c2c88..44c65ebf6c73 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -368,25 +368,41 @@ acc3: clock-controller@20b8000 {
 		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw0_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw1_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw2_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
-			regulator;
+
+			saw3_vreg: regulator {
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+			};
 		};
 
 		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-- 
2.39.2


