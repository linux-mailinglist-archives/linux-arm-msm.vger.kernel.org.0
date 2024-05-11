Return-Path: <linux-arm-msm+bounces-19747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C711F8C3464
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C191C20E0B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096F353392;
	Sat, 11 May 2024 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AhuKd9+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268DC3FB3B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465055; cv=none; b=CYxbr4kRO3x7XyBEmLel5uxR3M7jfX33bO6Rs8hRotK0RTjpfguNeR43TWlhputE7G6prJgLrG8Kn/0WHJ6YwNAFeZXwds2uJIPFOlkagFFpIWulEHxO4qf7bkBBh9b9aubSJeW12aHoDl9Y6kVcBI8aV33Scsv7LcGEinPWYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465055; c=relaxed/simple;
	bh=Xo8om8fumEXzQduQdJPKXB6VlSeocBEHT34qMhggAXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YED8TuNA3r7ocxCPADkIkYoumHuA3VC4XkShGll8QJxw1lcM0ejTjHEnmkzK6349XLbvM4wbu8BzY1waarfGXoubKkHOnNtcIr3v2x0K2FiEKtKFi1HYdNSxGmSQOB9GbUfVUVzBpg4bgzTb3w6Z7qOo79WeG+nLZ/s/PClzmUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AhuKd9+f; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e3fa13f018so38307271fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715465052; x=1716069852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrsH65DwYWxyDnZ5BbfeeZHd24rKgaZ9n9wSGTkNhQo=;
        b=AhuKd9+fxDcCH6rAHt2j/8FRCDZOJWDB1eoFK0VYxQwtcaQfmlTnsYrbFJEEr2B8nD
         dCSjOo1mhnrrNLqXiBdRQw/kFAHS6KF8eQO/SkGvFjWeYuO+wWdqVEtD2vd0V1MHUVvm
         D1XfEWMy7j5GaLyOHaq9zSJ6yveMWXiokbDREG/n5Sol37uzKwZtDh3welLWRs3iFbf6
         gxP9B8ip7UgwdqOXIeh+qgRsb7MWpCCD4N9lt17CgNgbnlzFNwUB+TfdqaXoNpEPj7Uw
         TkXPO+LOoZnPsN1ZWI/jjpcb7vNZNGgBS+vNcnmRSLawYV/xZpVw5OD1ePiGWcpIgqsl
         gi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715465052; x=1716069852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrsH65DwYWxyDnZ5BbfeeZHd24rKgaZ9n9wSGTkNhQo=;
        b=Xpez9aUp6RttcJo585EFRBeAyBmPL5wkEK6aOA8xKnvDMhH+GWLWl/wAMnsoV3WGHg
         CVkgRts3Tep99kw21p7FZRbCMAWtS2YhHH5lafL9H0ZYi538dG7bz+bO7oqWVKHFKrDW
         93FAwWOe1mvyqPUvZqEwj/c1nu1jLZSwUji+qGLjrkJAveiXy1EN88XIavdO81NQtRQM
         Qz6PHf5QEPfPNjMTyeUoNJtGLDrPtwWiKOl0vKEbxuXxFf9yTLaWOrml4L6i46BOb9tv
         CFJ9HqHd1Yxt+GMelxWbjiAo4XLwGUj4Mesk/OUOskUmOio/U1BI4c/+UryAJ3Ylf2uZ
         gXzg==
X-Gm-Message-State: AOJu0YxDdIVJIJG5DvRE0PwColrLdRSNSMItgM+PP2y21WhZvOQUzLQk
	7fR2SiMG3RZ2uoQW/ihE/nwYcDRvvL7/1VMSWOrqNpuV38XottUp+6vZjEB5Bfo=
X-Google-Smtp-Source: AGHT+IGUcG7vW03nc51RQDeLFw0/xkZ0bMFI1L8KuazvRq9S5oLPJZcQz6AlXOr8Zkm2KQOvKbxWXw==
X-Received: by 2002:a05:6512:230a:b0:51c:c2c1:6f58 with SMTP id 2adb3069b0e04-522105792e0mr4383287e87.55.1715465052358;
        Sat, 11 May 2024 15:04:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d878fsm1123875e87.206.2024.05.11.15.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:04:10 +0300
Subject: [PATCH v4 4/9] arm64: dts: qcom: sm8250: add a link between DWC3
 and QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-typec-fix-sm8250-v4-4-ad153c747a97@linaro.org>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
In-Reply-To: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Xo8om8fumEXzQduQdJPKXB6VlSeocBEHT34qMhggAXY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+tXW+/CoPXhJA/c3bUmPBgDWWtWm2M/V3BIJ
 IM0Rr+SRhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/rVwAKCRCLPIo+Aiko
 1UwTCACZcbgmNbuL/Au0uU1oPANifmAuXU3huehfMv1ymeArCeBOuR3o6/8LaH1FIWBOIBRzk76
 LkcQ+LF7tVRP4wcH+DeanZi9+O3vGyWpriYiXaPZxJTnn0FwMuJV5MTRxRfGYckklbDHKn7j9wD
 AA2v89rJmjbXAbAMEMR5+BsC97EcozCsuRUn9hm+fpVG6yHEoQJdVr1Ukn8ggT2ariGoTkWQonv
 53LCQ1/BRKhVyKUeYhi8j6PbZ8FHLZP6krIXsLMvrE7759uSrrW2TeeFuCjRxTR3Oi4DdOyrvN0
 2fWLyaxvz0DOT5ohoUzg1phw/ATb9/7D8u84zOosPwzuu4R6
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The SuperSpeed signals originate from the DWC3 host controller and then
are routed through the Combo QMP PHY, where they are multiplexed with
the DisplayPort signals. Add corresponding OF graph link.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 0ec473ceb3d2..d6c8c6c2eced 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3947,6 +3947,10 @@ port@0 {
 
 				port@1 {
 					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss_out>;
+					};
 				};
 
 				port@2 {
@@ -4225,8 +4229,24 @@ usb_1_dwc3: usb@a600000 {
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
-				port {
-					usb_1_dwc3_hs_out: endpoint {};
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
 				};
 			};
 		};

-- 
2.39.2


