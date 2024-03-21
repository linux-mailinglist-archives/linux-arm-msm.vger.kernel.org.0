Return-Path: <linux-arm-msm+bounces-14741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E131088584C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E3631C223A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855B158211;
	Thu, 21 Mar 2024 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItY9T3dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478F3FB2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711020371; cv=none; b=gXEYwNq1R1oTzFKLahKYCoLLoTLWGmbqkDdJS2ZRpCA5IeosJZSANzRKEsP8K5y+OgbAEAuVOWc8DpHI4VwLIp/BCSrdfk8tp6SacnBiDyd01Lba5jw4UuTmmmAfsugzqwDPAZQ7Es3vH9bcXqsfZLQWwBY4I+czSLbkbJVSGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711020371; c=relaxed/simple;
	bh=yWkuUR18jPMmj2reJbrWdgmyzSEUec2EHqek3B1pzRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTllrTTNBQf4xeZs6JsI/EBeM0ThLRbZE9Hhab/Reuvu6DjupfVmfwLFmfYszc91utrHdo6byUj94T69NbuMN3xAeOuimyZTcXeMu/2yluAvJXg7VJejI80nQlr7Klk/QcUmpcvq5iE1FKNnmUewI9/jhMaTvbVcIUz/eZHVrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItY9T3dk; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso757660276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711020369; x=1711625169; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/SOi9VxHJtNBJHMJ34ByOBUF3g+OERNiKvM82IKoro=;
        b=ItY9T3dkPP2Xrjtbr7w1sRpYs5Yf/rgoiFnc30R3AnlpP4vxMbzpodanRBL1H0l4IM
         ocC1lWtwPrFov7ItMnmnFy8QjZ6CDbEvHKjWoOOI6S2Gk97vflnkY7tHehASS8Fy+Yz9
         zl4ryXxvwM9O2e3zCcLv5HYUXwbVN2TlSmKOS5jFoKXx+f5Kd9y5a4qefZL82OeQLmgV
         xFedvdUIW4oByoA1IF3dCVHnOO51bO2x5ioL44yCrzYfIf2extAOK3aoA6g/MUHlJDVl
         4jno04/velyQKA97VwmCIDAbEm80V+vQnHjLVc11mnRYRlWdMjgmmzOGnGqK9NVu1MH0
         g+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711020369; x=1711625169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/SOi9VxHJtNBJHMJ34ByOBUF3g+OERNiKvM82IKoro=;
        b=SNnqh8bP3dp+g7MBQsHTEaej4JQnKSPjFwI9rxQ2XbBQ+Oe5YXwVdaafBmtCmps8FJ
         eoElfOleIi7hvxl2mIGG5ChjlXQT2LI8z3M86laq0Hm0R8MkAmFsojlM58VdZ6P5oF9R
         +aAJIhvNtSJIgXO37uBFfWEqM0CpTmBG4s3WWTzfFTLvpLELwgEvuhNOrT1KNwTrZe/V
         DBx7+0ArWwbyTNVThKCLFyP1d4Rw5kgS0vzSvztthSs/gaoIhTyFV/K615bcfTVdDuOQ
         KUYQx377jj6hnM25HnBTzasdJT451hOJ4ReNSv3BjUy/jWuhgNKnMqVv6AENs5YXQK1t
         j28A==
X-Gm-Message-State: AOJu0YwEnjeeBcLqs+RnapEugwmExWiIfhuaaEpyYfzLHMYJ25yuCEbo
	l7R3VbEfF0q5Ep6wxDH1K882I1lJJt5GbsBpUFGedGGDGdUXwIkm81iB9nXLVzk+eqceNe52yJk
	=
X-Google-Smtp-Source: AGHT+IGy5wVwYOyJosO7SOl0XicomUu3UswJe58V9mcoFBn4JDeomKaOhMDqKzWMrI6apKRSWcaBVw==
X-Received: by 2002:a05:6a20:b319:b0:1a3:3e4b:ccb4 with SMTP id ef25-20020a056a20b31900b001a33e4bccb4mr3664679pzb.62.1711019873618;
        Thu, 21 Mar 2024 04:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:17:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:38 +0530
Subject: [PATCH v2 18/21] ARM: dts: qcom: ipq4019: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-18-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=yWkuUR18jPMmj2reJbrWdgmyzSEUec2EHqek3B1pzRE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl/BcNMBCAkRq//G1iDfV0LggacNdzW1RMW9BZA
 +2tMfhNK1KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfwXDQAKCRBVnxHm/pHO
 9TDCCACin93VyqWQgdOI9X+cDB33tWn9xCeLW1CUbpPuvh3DGm8/UDwh0TaQTU6OfvKjxnYZYMz
 7UuQJgM7rb4L1l7iMYahEixO95jVIfy9xv5G91A9KJBrxDgbl+pH4asuA+yMghzQwz01fd6pe/Q
 iZSY8hUfvyyw/z+NwjVLW3DFGXcO+tjULJwjuyUM7V3yBhwvWr8+d22CglHhpwYkyC4GImV0Q8W
 dTCxMnKDuo9nDxgiegw7tNUQEVi2Ju3D3SwLObcxWg6lx9fjppwxsdgPkACZy6JKgsCV0aly8wD
 XaCV3+wWSy71VDLA8LeoYLRvXq2viXrpBt7bFYXs6KvOYlws
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 681cb3fc8085..f09c123d9fa2 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -470,6 +470,16 @@ pcie0: pcie@40000000 {
 				      "phy_ahb";
 
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
 
 		qpic_bam: dma-controller@7984000 {

-- 
2.25.1


