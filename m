Return-Path: <linux-arm-msm+bounces-14722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEF58857F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99DA1C2124C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6677656B9C;
	Thu, 21 Mar 2024 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sd/8wlw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6F58126
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019816; cv=none; b=lo7HL+W+ouBVfjuQjY5QuTwl+K1FZx9Y4sMwifjxcmlwfdbgyGS8yWl4C6sy56Fre0Ln1L35ookd7nWbEgmwvydC+av7daPofzOdB27K3guB7WhCDx5pv1pBVUmyLl1UFeDt1xmBwzkXUlUpR7a4Df8iU6Pma4WHa5hovny0Q2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019816; c=relaxed/simple;
	bh=IUhajlMiebMRXpZMv8IJ+rUpDu9cL/zwabR+phBMHXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhxxIZ0PQ+sjLuge2ZFZ6FlFX5kkmYOOkB7mctcFoP58akZw29DfUqaTNCwsPFAStOU0p5fhOwYqq5DNuXy9/oqtp9QGTksvKhspVwysnX3FsrthrCUsLXqDODtMlPwPUuoR6bAVom1wFlXCngnI3ywXTsJ1TFO8BFee992YTRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sd/8wlw5; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6b54a28d0so604479b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019814; x=1711624614; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpm9hzU7yRxndVe5Gx/goNXu2viD1OAzuL4ognrEobA=;
        b=sd/8wlw5O00twv0VLgHZuyESVrLwWXQ6Q0PgxJ1q6zY0d9nXoQ354qRa4USPRk08OK
         umeSb6Kgu9+H1yng/YNhGGuDar31g6gzbn8kT/6FPRnWhTZpWYIK17p+/QTrOHqMz56q
         +nyYnOUpKVawiSy2c2FnEtwlQb1VkUuNNp14hatSSN1qQrouZurIlUMAdfk147xQHFBp
         zAqNiD85rMKqrNlqXEor9nvwRlpEtvpGUeWgS80HYY8FCA1k5kHw+diRcWsXjGwMrvL5
         o23KBHk0MFArN2Swhv7uPrUhpkhqEXng0TLWQ+qzpADrEiTMgFlut6nCF5ZnLuiMBZGh
         4qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019814; x=1711624614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpm9hzU7yRxndVe5Gx/goNXu2viD1OAzuL4ognrEobA=;
        b=a9aM7i+86cm/fbucc+q0dcV7TvpPvBcsusNnSyJQHb2U4X5R+OO9eBBTgI3RR6Zpdt
         ICiEvHDac9ZkLORcXyRNrNWXWGfQhayRzmBNgGfVImlS8VSSLordqtOv1kkwenrduI3J
         K/fmaEXF00qFxO2K80S5Vob++cp9wcXb2mEfll/17Dz1yD8oWIICk1xxvAUi3E7joo9t
         O2dyXvp1Cw5+f6mlRjGHlhcfyyDcUI1vOGUA0XzxJeSqydETuqZzDfRPFjM+FPUbqScZ
         7AxGKMav9mk2tUX24pVtoLakd4Dw5o7YsZMMO2pC89rzaP2gTxAlKAwamVevnqPtQtyZ
         RY0A==
X-Gm-Message-State: AOJu0YxU0KEeY6Pq+JwuC5Z1Kyx3ZcIKepk1TUlKiFbX3xpA6l6nqZmB
	s4+k3NUwv/tHyR8d2cGsPmzuAtoa0MJQoxu/NK2OHP2NMc1CoDFenhvcd6nSHg==
X-Google-Smtp-Source: AGHT+IFQb+EtsRBxl4QG/ciNRDtQvLa0vxCY7Ds0yjW248XVpLTakMgJOPT/Q1MjZ935yTTACov7+A==
X-Received: by 2002:a05:6a00:4f82:b0:6e8:c6d8:217f with SMTP id ld2-20020a056a004f8200b006e8c6d8217fmr2248910pfb.10.1711019814009;
        Thu, 21 Mar 2024 04:16:54 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:16:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:24 +0530
Subject: [PATCH v2 04/21] arm64: dts: qcom: sm8350: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-4-1eb790c53e43@linaro.org>
References: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
In-Reply-To: <20240321-pcie-qcom-bridge-dts-v2-0-1eb790c53e43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=IUhajlMiebMRXpZMv8IJ+rUpDu9cL/zwabR+phBMHXo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcJkQBTU7cHMjQHCmaE8rE5vqzECiSajk6OF
 58uXgQKlRaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXCQAKCRBVnxHm/pHO
 9ar9B/4lkmGZ9w867Lq+7Ob1yb3R8dwMvftktOgUQSmPnhqRIvQc8Xs10jR1g9dEEhft8UfUTg0
 BUUTD3UDVxPZE5jGB+Q/Hy5It4wqPlfcVeadsi3W6AUk6eRWlTzAlZArG9g2ASEbJENOhl/kprZ
 IvU2axd9wH9oy2j2rPO3dTRgIcrKYYWRmrfL5PCz1gr2ztQI4jzHZ3T501tNMl85XikHvKvvntV
 3zYGzO3PN0ipEdoeLKrzL74DDNImbXnQjoHwycHXH4LvPNuVBY7SPDcFPoj84CJoT1Sx3k65LvN
 MiEHka6VZz7y7a/Y0WiekYEuFnOTbG4akpP5xzeTj6QgCAWT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a5e7dbbd8c6c..a7346b817400 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1572,6 +1572,16 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_phy: phy@1c06000 {
@@ -1669,6 +1679,16 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			status = "disabled";
+
+			pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1_phy: phy@1c0e000 {

-- 
2.25.1


