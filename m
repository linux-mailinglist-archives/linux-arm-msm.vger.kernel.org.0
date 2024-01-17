Return-Path: <linux-arm-msm+bounces-7464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BAA830785
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48223286854
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33282032F;
	Wed, 17 Jan 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gP+WOm4A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A720310
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500271; cv=none; b=RHhdLo24EM3qWqUFMtIaA9hNa1vawBnu3t0wJXhkfPdPC9ZQE9w53/rfz6tBpz1FEjBkxb11BOG05jJApTG7jlxIAJljJWyKDGuNSvAeLbXpGAyF1WBilLk2H3Y3MwHl9BJbHFgRuIFigy3vv1FTME6KJpA8OPtIqI/7qJ45Dro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500271; c=relaxed/simple;
	bh=NBmVgz6T2xRikadcDCIPLqU0vzAxugCzfckrrP5Hw/U=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=SKhVSS1hcOf1hdfYDn+oP6VorwMThFFiAEzyEhSEePdOmeOvAgAOVxGfiVmcL2fc/JzzB9RqOmqFZrsKpgrB0T8nVfahDtV2gb6OQsVnlwh3assJSlvDcyBqpCGrhkScEz5wa6fhikVCtdos9ZM5H8sdm4oGTDbfisxOWRnNq1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gP+WOm4A; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso15025799e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500268; x=1706105068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dcqXSk1rgw9DCHRa1hWGcJ3G/KhQaZBYpq+KKrzSJo=;
        b=gP+WOm4ADZ0DGvPNIRB4qjahsLrnTtUrGqILiwZu6cHjRwYJX/IdG9jYc/bznids3C
         IQxzruluMIWMB0Jfyz9YiHQdeVswf7mFsU3Ii0WHoe2Saw5KXtCcUASN/PINlAOu15x6
         xiOmyX7Iim8Ag7/FGzLdJmm9GXi8bLzjrZF9k9NfFDynf3IfkhUUs0M9T83SGkr7M5qx
         ZjhLOEwFHr+z+xQ339oIaxkKjmfIJ5zufovX2wQy574qcbo6ywo3Pr29KfSYR/Tvpc1z
         ds41SLt4WmfIHfydii8qvIElIyB6lXyRl19VlB11XN04HBhA69HYFT7P9BB6PmDlycbv
         OLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500268; x=1706105068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dcqXSk1rgw9DCHRa1hWGcJ3G/KhQaZBYpq+KKrzSJo=;
        b=ossdWVYms4uSRWZwlp0+QJ0QUGINNRiNDHkMqvR/jDmtPZpgTEiRyJw+k09OD8gWdo
         vo+Gv3O1zmVSxDbDmaxOHNf4DohfyRoVIuN13GNlIfk3CVOtKYQ2XV6FM1CYfsRj0+5K
         SX2DFT0k3u90oYCMWIDThTKPx8X71p2S+7GFpU8h3vd/MEHaTZlyDnSoxMi+qTxWBb9e
         FLyCEQV466qvpidmZTBL3LrV26udYsWUBfbeBYPanTfKzsCVqdzOc9q42P8T4qALD7s+
         1+lP96IyF5YOesJi+sSf+JyF2MSHgW0TkVfTyMzNNkzOQOXxnau9SnnWCOTdZqf5Eo8u
         Ccgg==
X-Gm-Message-State: AOJu0YzKz5Y0HUodO0R1EXSn6kOTExrY39AQR9u29uAjMYyG6MOCfqP+
	wA5m7AQS8yJe6B9taDdBQB/5t6pq3MmE+Q==
X-Google-Smtp-Source: AGHT+IEuBH7Be/ByM7oNW69Rh3Ic7MZMVCjGkmr1PVTFS8RbyK0x36/q7neSLjxPiiYI2J++HAsmkg==
X-Received: by 2002:a05:6512:3c3:b0:50e:50ee:f378 with SMTP id w3-20020a05651203c300b0050e50eef378mr4154155lfp.65.1705500268534;
        Wed, 17 Jan 2024 06:04:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 16:04:27 +0200
Subject: [PATCH v2 6/6] arm64: dts: qcom: sm6115: declare VLS CLAMP
 register for USB3 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-usbc-phy-vls-clamp-v2-6-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NBmVgz6T2xRikadcDCIPLqU0vzAxugCzfckrrP5Hw/U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlp95nYEfTL0rbQyBlpAOWkMsd4n59kYFKHJuLn
 GfzbGxz+ZeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZafeZwAKCRCLPIo+Aiko
 1cWwB/4gFZwZL1igYrmLmmj209CRZXEYzmyz+UjKzbyhB+uXefm6F/zqzK8OPoNMAFMiKo8LOud
 A8LhAnp9c2a2I3DQrUBylUeOy4Mjj6XJtiSdhl2MAjPjd2V44T56wWcz+OiF8Q0S8ElaMG/5PZx
 0AsRBdkplWPyAlljw0hTFJEpVftrjqOjcEVBczNx4nOJV4Ar9GAU+zCFamJ95w6RE9igY4S3RHm
 D/4CgMw9og9Im4zDnQ4os0zkIO19v43pZxrXRvc760GvUwl41qE/TaXaXurqgAE0kesoK/0iZh5
 xIEhQNm3Q/ADRsUDWYHgoA35SAxp3tyPdlt7C2n/SrjHRgfz
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
index 160e098f1075..0c48ea444759 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -614,6 +614,11 @@ tcsr_mutex: hwlock@340000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr_regs: syscon@3c0000 {
+			compatible = "qcom,sm6115-tcsr", "syscon";
+			reg = <0x0 0x003c0000 0x0 0x40000>;
+		};
+
 		tlmm: pinctrl@500000 {
 			compatible = "qcom,sm6115-tlmm";
 			reg = <0x0 0x00500000 0x0 0x400000>,
@@ -879,6 +884,8 @@ usb_qmpphy: phy@1615000 {
 
 			#phy-cells = <0>;
 
+			qcom,tcsr-reg = <&tcsr_regs 0xb244>;
+
 			status = "disabled";
 		};
 

-- 
2.39.2


