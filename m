Return-Path: <linux-arm-msm+bounces-7303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A082E781
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECAC1C22BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0AC43AB4;
	Tue, 16 Jan 2024 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vkkvQi7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659D41C99
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so11622144e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367320; x=1705972120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFFBqB7ryOdSAAwgYvTiC16JfI4HoB6cNRG90Y323Tg=;
        b=vkkvQi7dOnLJrRQbIzm1MqTMik4GmYTJd+XBm+/9rr27rmM+l3hsan+l4ByNiUPfmr
         Sf8bSwG5yjvKQUfBLFMhoLphxgGhtcXdfTAAXaAMen+3+afuAEra067rISSB6rebpocU
         lbRJx0BQ6LBUr0D6Gy2lyHoKra93t5rSa749dguDp6dhFkyNdfGWb2nHrx0Ztx1X+WZn
         z9nVBAtZPNJF0isWvcw9IKE7hstG741EOvsinWAwa+pK+eUnp5McB/Zhqzwl1RasH9pd
         qqf0eWjV2n+ygAwsDFgk4wHBGCjOhsyDYzXMw8xsxz8Rw6Xd5cqspPug9HvBARfPrxGr
         +qJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367320; x=1705972120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFFBqB7ryOdSAAwgYvTiC16JfI4HoB6cNRG90Y323Tg=;
        b=JedUu+MO+WqtOfRFbZr/+aKyqDZTQ1qwaUxML/gL8E9Qmxtiw1Py1YZftO4urlAiuA
         R7rUKIeAUHGx95pd2lELDKZMrBy6tBNptoGgh25IsJz77r7N7F3xEMofCewO8VdP6gHM
         mvKQl9YOJxM54iSKqwC3SnhmGlmYqvgrpwOxcvYivcQS8KuCHEYknfI8FFHy5yRgbUwl
         s058dLvMjMnhVerHDD5iElFBguGgLBKS4QKQ9g/PbSejw4jspmOgt+ECyFonzB84tGxz
         ThaK1ulqPtgHA2GAXER4yRFhyul6+EpJZD2Fetn5+X0hTZiA/r00AKQ8yQ2jSxDNbdyY
         6L/A==
X-Gm-Message-State: AOJu0YwJHj7nAM6cXPGrON/vdsq3wNDdZ3/AlHO42YvFCdgGqWBUE0wE
	kCTvfWuhF6kQOQfbOYxt9Modtp0AL+W5wg==
X-Google-Smtp-Source: AGHT+IEJA7Nua383Rqc094PEQsC+ZFremv8cL9WtN7RLcf80l3UBaeRcKPp5Aj7YSdSOgUZHsxT9CA==
X-Received: by 2002:a19:c504:0:b0:50e:d5eb:bfff with SMTP id w4-20020a19c504000000b0050ed5ebbfffmr2445918lfe.85.1705367320369;
        Mon, 15 Jan 2024 17:08:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:08:30 +0200
Subject: [PATCH 4/6] arm64: dts: qcom: msm8998: declare VLS CLAMP register
 for USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-usbc-phy-vls-clamp-v1-4-73b2da7691c5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=891;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f12NIWxuaNF6335LMHvzmeal7J/0jE48+iZdMsjs8pU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcUA8BUvO4Wnz7aji2y1YM/6hAjte1eVG47Z
 JNASjDNHYmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXFAAKCRCLPIo+Aiko
 1UvWCACP1E1eQ+zq2gm6nte6GNYwnjgkNsu3bQqf3JTyTM+qr7Bxxx/fWTfWf1oYITy+IpqIJeM
 rGF6hjNDw32Q9hACywkkN428oWtcmFPt696i1pj8VUELOeIUi5SxZvsowN7+ArPhUDjtBNJRoMC
 s2dGoqYra9M8xRvQ7Z4FMum/LXjBPzU5Bxnig5PU82hY2xy6Fs3BUDQwXqQRo6Y8sBRZDJzMvor
 rcsKgTZqW4WfyNNoQ0qmxC1sA7IYp5QfxDVWmaZOOpHVDdrGr7bAnRONU9gA8ANy+uhWMdJBiKg
 daVJ4Rul3PnAGpufyUxD3pbO3lV/G+mZ0sjdag3YOCy5GEV6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB3 PHY on the MSM8998 platform doesn't have built-in
PCS_MISC_CLAMP_ENABLE register. Instead clamping is handled separately
via the register in the TCSR space. Declare corresponding register.

Fixes: 026dad8f5873 ("arm64: dts: qcom: msm8998: Add USB-related nodes")
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 2793cc22d381..e21e5693ba1e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2174,6 +2174,8 @@ usb3phy: phy@c010000 {
 			reset-names = "phy",
 				      "phy_phy";
 
+			qcom,tcsr-reg = <&tcsr_regs_1 0x6b244>;
+
 			status = "disabled";
 		};
 

-- 
2.39.2


