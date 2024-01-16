Return-Path: <linux-arm-msm+bounces-7305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893182E787
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 327B21F239C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D47043AAB;
	Tue, 16 Jan 2024 01:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSlykf5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5064041C8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50edf4f478eso7147414e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367321; x=1705972121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTqssOQMoHivsRaKvhgiYcDI6NU9y9UNmBG4hDTXAVU=;
        b=qSlykf5AHpoV5A4lzepISZHyqbF8xMbwdMggkppnViRPfJTuqbJP5L/lx5YtyYberR
         kgjP2H6Bzydz5gmQJomCAsQsFsROJYfFR7O5JpbSFibeB625r6M1YSIy7O+se9vltDNn
         MgIyk/G/DZw+onZkrChSvanWe8TL9I+MiIsrIlQxd4iRF8tVlIaGPh0bP+Cywg9fpXyv
         tm38X21NESCliwaCxn7ss6rEQA9RqxMedvoLutXqHXu0JXgnUqauO6yrhhphwBENVFHZ
         NeFL0SgPpF1iuq9xwDC7vXq2pXrnE6v7NQ79jj44kTP5lTuVTpxPn0dqn7CeUKeRtVEI
         rSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367321; x=1705972121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gTqssOQMoHivsRaKvhgiYcDI6NU9y9UNmBG4hDTXAVU=;
        b=cEnykKzLda+4VNGrquJt30lip8ObHIlBtRgwKDB0mRp3Ed5WgP0pnZDBQ0ATpJx+kS
         5FYhykN6cQyAtuqLKzy2A2cRlhhZ0ZjKyB02fkvkySnb2qoGrYQ6LYoF9IAUsutq8HFn
         1/1rC5A5yTrhIC3r+9FJhLiVO9E1LXjfYC81lmDtFBQmEbHJin1Zk4WPpOWgiKsolqK2
         27C84GqkVIMaZ5gWJ+E/H31Pvte5dZb486RsdR1fONiFmqUhTeUoNsdS4TA4vl+14NvC
         PktdStkiDQL6Z+hXFNHZHUgGtKDJkFWn7tLlfig8QHrY/rw8wmMRCLFY8P2oLJqkYISj
         Hz6A==
X-Gm-Message-State: AOJu0Ywu0vVqZSz+HCsvL277r2XWvSbiseTBKFMJBfOXSTcbiftms1Sp
	PVAQCgm2gwhcFV2QmKm2cvOCqZrxxcUNhA==
X-Google-Smtp-Source: AGHT+IGiIIUNsxe/40WvVDtiw0MLeD8d7ivL955vOr/+WjrQ65YZiXNtcJA+zr0rlxUZ7tRkHVBx3g==
X-Received: by 2002:ac2:5608:0:b0:50e:76df:e41 with SMTP id v8-20020ac25608000000b0050e76df0e41mr2644981lfd.133.1705367321562;
        Mon, 15 Jan 2024 17:08:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:08:32 +0200
Subject: [PATCH 6/6] arm64: dts: qcom: sm6115: declare VLS CLAMP register
 for USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-usbc-phy-vls-clamp-v1-6-73b2da7691c5@linaro.org>
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AdXDhIsnd+iXSWZKTFcLsyqUk+oKkuaRSto6EvCY8cg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcUlM9KRQMg6qbyevu03KD/zZr72wNib4qD1
 uB4dUptrKeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXFAAKCRCLPIo+Aiko
 1R/XB/9FpNoeUmcKdOQ6BmmvI4G2XZzEF+ILr7Y0cQdQPcopIXTcMcJUqYEM6eAhwIQLOhsxE0o
 ZmyurDD5Mvv6hMZqdudsoMoVgOz3YhVTiUyMg5wEAMdSYgtwigWEsA9C4JasUen3m4zfclT+WeL
 2Ed2c5799TBbn56oGjrXcolU0RUOd9fIl9EibLT7ZK1Lj8U58reZ4urgkjxzpkT5wzIWWU4s7+K
 A0FDXtbK+To573tmlnFj/5aLxphxn1Di8D0rT453WxunZF/eTp5lpQQs5shEZOX9IY+HnFjnGAz
 6Zf9pwsf9cU1C7rzCh/rmEnCRNQ/8s3DKWindT753QqFnAJr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB3 PHY on the SM6115 platform doesn't have built-in
PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
via the register in the TCSR space. Declare corresponding register.

Fixes: 9dd5f6dba729 ("arm64: dts: qcom: sm6115: Add USB SS qmp phy node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..8cee943fb24e 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -614,6 +614,11 @@ tcsr_mutex: hwlock@340000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs_1: syscon@360000 {
+			compatible = "qcom,sm6115-tcsr", "syscon";
+			reg = <0x0 0x00360000 0x0 0x20000>;
+		};
+
 		tlmm: pinctrl@500000 {
 			compatible = "qcom,sm6115-tlmm";
 			reg = <0x0 0x00500000 0x0 0x400000>,
@@ -879,6 +884,8 @@ usb_qmpphy: phy@1615000 {
 
 			#phy-cells = <0>;
 
+			qcom,tcsr-reg = <&tcsr_regs_1 0x6b244>;
+
 			status = "disabled";
 		};
 

-- 
2.39.2


