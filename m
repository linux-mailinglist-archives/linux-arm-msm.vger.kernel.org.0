Return-Path: <linux-arm-msm+bounces-70401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED982B316E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64C217BBBED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F612FAC1D;
	Fri, 22 Aug 2025 12:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuOD/CJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9DC2F6194
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864272; cv=none; b=ohu/JN7mRaWiK/rpJO1YfcTmkkYijh2vK70UOYJ67a+gzOryA2mTih1596S4/gqYsQlZWgE7ApZ2MfyY4oYTrnizRNIcPpT8s+AG6TBGJjlUoJOb0CrYWtJ7WPAiKFUVIYWHIyf6hK8h1sFi9WqNNBi8yXQGWkzZcR4H/Y8o7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864272; c=relaxed/simple;
	bh=zToJz+p9rv3GdnoEI/nZ4O+DZManZb2L43VdqSFTMtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBqSHUvwScNpE5dsj2V4t83CGNekh5/grjjQJVJr5gJ+yNpLleCH3X+C/+ZXWDEuRS4x9pYI2YIFCnt9g4xpq/4O+vw0F3IFBaVJxm32VOTQvBXkEJdDW012t3YBGIFFqDDHj/L0v2hrpULw/c9p1/hJRobrB6PEqIk39/YnheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuOD/CJx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b72d690so289662a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864268; x=1756469068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQUEQCWwleF9niyj1YQkMXb4VJN0Wpw2LOAupwB0aEo=;
        b=DuOD/CJxwtWLIAFI/pzNgDfQ6lfbk5FrkwUc95qFvjC7Gl0HDdtx5ZF5BkAPmUdYA1
         KLXRsg1KNtXrMUqOA1AgfLRkat+G6OvpWQDFnhB0NhUE6Xgjx56zf4hxVCjUlIqunkVb
         HFotrHVN1IxdrDYYJ35jmrVSoNz4I1hk3R2ElBUHKpDV3emO1X8yyoDApQUS77gSjtTH
         2ovDEJsysjatqW44aLS3WF6a0UFnoYs0hUEDByJeaQrTlDScya6b5ktaYYapNZIhlGtW
         KHXRFaBo8lJL/oOQgxD1xliMUhZQWoud20udeX9Vihb+8f0iGxmq9rX3iXbp8MsASQsY
         fJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864268; x=1756469068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQUEQCWwleF9niyj1YQkMXb4VJN0Wpw2LOAupwB0aEo=;
        b=Bc3Pi0jj1HgdCtAmvNNSF/UczUbAng3qdOhotWuFIcfJe4tTttuOzVBWvvUDCp1ydg
         GWbLqfal/TNufZXD952IpVhmkpxxhXGMVB6yaxbTd5NRB7DIaNDlcq92flNGkKvEdOUn
         k8JIkJsc2vnWHAkXwPbVoK6GG7DiEktZEojPFCcIpbmx7XgIbPBN6FygUyAwz5FLeiC/
         KtwaQ02AymYJrrZjjTcCT28RL0aQ8QAQGy/p6T6Ukco8K+aEG68SuGfwBy7xUbs8jgN+
         OTrvoA4N/SU+VN/WUwn+5xyoU09NamtOZT5dsblBuxSg6WV9cIDB/IkHEI19FbN4ps05
         Tg1w==
X-Gm-Message-State: AOJu0YxQqnqRZWjFVWDKcphFlYUYMBug5b51zCm4jyy+PGNXMlJxOjnB
	Nep3ndLit+GkJ3D0d1taAC2Sqvwnh3N1LtkYOi3KBpXBtAYec4ZrpcDrAfz1Tpn9dm8=
X-Gm-Gg: ASbGncvSPYKqBxn20Eqwcugxoozrbb+M4KaMFOrbHyE0gQmPbhJQpqLvLE6cpKLdYOI
	NCMS5NfSQZS0+rQnAsr2CAEKtpMBQ7uBPudjyXmOOki5q10MW4Ma9ARNN+ADy0m98RRl04gr5FF
	IaKd4pq4EKdOfeQAxWR/ghhSD/Zjg0Mh7WkcLinwrJ1YXYzAagFZsm6534qlh/LCqVGSzQP4uzQ
	+yGAaGH8S8vl6XwvMzb3CFRPxsN9wHs83TQ1WdkLJBJsLZSp20h5+5KjrpsikLVWHXrS/8XihCt
	Izger27o5EGc9VjaYjl2bCcXWQAbtrhoIk035sHB5n06/+QrgLQQ3Vlt9ow25uivnBtJGmnfxOL
	lgfTrYGwRmCuOxTykGRIrCaE/Oiz/jyGujWnjqxEiCNZg4amXug==
X-Google-Smtp-Source: AGHT+IGgj6tLSA3iPOzIjZcGBAModSY46RekEbNEJwMEgjowetU7kTnE61E1A3VMDX3pIZ9P/oD+GQ==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id 4fb4d7f45d1cf-61c1b703ddfmr1092208a12.8.1755864267845;
        Fri, 22 Aug 2025 05:04:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:01 +0200
Subject: [PATCH 01/15] arm64: dts: qcom: ipq5424: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-1-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zToJz+p9rv3GdnoEI/nZ4O+DZManZb2L43VdqSFTMtQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFy7bd8hwGt2/MER8/sSJdKyUV/OXlXLZZneo
 T7rAIFEV5qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcuwAKCRDBN2bmhouD
 114mD/4zUcZvH5mchbbsnX3KuG35h5GH7jz12oMyIeHEG/jVEja5ZFW2f1boZA7zZqISeWb5XHZ
 b6i73251WGMAQVZm6+x6zdD1Gj7ewV/cgVmiuT5Upd8+i3OIDPpQzSjryh7qreiP+1PhEEFCB9w
 fkHDpDwflD7NjXwBPSE/N0864XzVSq9kZ3yVZoLGMsZ1XXrYHf/Nh2yNW7V86gKxSENUIjvT1yn
 zGNGZVwHOcBDhIt5gpOBCN1qTDOgBdYe7XvuZnZy9MOF/lwz4vYjDSkDS7CyuHtVZQ5PIWAoV6D
 xvv+1CZ0+pAQ62K5+N2l+vXYhEV/rKTLrhJlW0UpyJaRjQcKxYt7m5hha1y/LJZe4AfLYW8ajuZ
 5hUvcjZs4+H5CiZLLonQfnMiDfx30Py+PBTphVDJDSINi1GLBv5RQRUm/QFNOOXKRppr98fUif4
 yBS8ix3YW2r0larG9BH+6zt6g6XvWsoWs36SWSWcM58ACemAH0lI+hL16ez4skI5831UC7OnqdT
 pRYNfMpE9uymti1Q/8p4WFE/GdfzZRPqz7deK23C7k/SvuIM4eIZAfbYjXUYjCoOKrd9hYwMOrD
 1Q4VjE0nNCqX5JBMLh2NM8ihhQHy+27vJ4bn8aFGho8Hl5Il6aVUf5v/h3GcCTVjcE6WTchgxrV
 GHCI+QfA+nxr3YQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  ipq5424.dtsi:961.4-964.30: Warning (interrupt_map): /soc@0/pcie@50000000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@f200000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index bbb539dbdf5c6827e228ac324f995108f9e7922b..b1a86b54c30f30fbb66057cf4e79ada6ebc29d89 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -565,6 +565,7 @@ intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0 0xf200000 0 0x10000>, /* GICD */
 			      <0 0xf240000 0 0x80000>; /* GICR * 4 regions */
+			#address-cells = <0>;
 			#interrupt-cells = <0x3>;
 			interrupt-controller;
 			#redistributor-regions = <1>;

-- 
2.48.1


