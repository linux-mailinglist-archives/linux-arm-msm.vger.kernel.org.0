Return-Path: <linux-arm-msm+bounces-4826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDB813AB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 20:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73CB9281B0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 19:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262A86979D;
	Thu, 14 Dec 2023 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLVOB3t+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E4692B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1d93da3eb7so987764066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 11:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702581896; x=1703186696; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wW/GDlju1SlGiHxyBADi4zieDq7qt0NNlAx5gIb5X2c=;
        b=cLVOB3t+J+3+sLqigbU4jgcI4l8O8TIPMFEw3McLPbwimp8llYnljx/D5fEk+44sLD
         2ADf+59Rcdan1KPxpdJArCratnqJaArYSoSpb6gReG59M6r46HFjCd6iLQ1CxKdBvi7Q
         UN49PFOpRW+3tFfbfynYvCn2pnNgH50K5G3clFu1qmXr4R1cJVO/5S/SZ298ETAOAAJm
         KBeg1eZ98NoO0Z9lMhCaMbEm7YPPskgzcQJDQLP8aWUYQRCX9uHHXLz9aUI97nbxuJQ8
         Y4ZwbiHC55TDIpuU4fWoYbkxDnODFqKBamr9yIFur2P+Z+Llkv/j/rnd/p2ubchPxBxh
         +CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702581896; x=1703186696;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wW/GDlju1SlGiHxyBADi4zieDq7qt0NNlAx5gIb5X2c=;
        b=g/47s1rr84b6cZQVyNbpciVmehwNSU++fQkM5RroTm2JvT3kCyO4gtPHAKZr1AXEKh
         xk/Vpa72KUJoZhFRQJ4ih4e/lLoFEs9Q0IWOOegFawHACv3Edc0WGTwJz2dNsXJpwd81
         VI3hCxYQnB/9pX0lSkS3tkXb0NcnWoLKXrYsckPRx8YkkDf+aFNPxdob49ZXcpuwnBwB
         lyMhiHXMVHOaIW9J1q8sSthQUoTK5pPgbgrL2Q5Iz55C46hHWAWOu30CQVDhVCXCHmYO
         eUKCKOXx087xEhwGLPVM1NS3qDS8G6KYF3CQEkxr5rPSIlZcw33G2xPG07PJrP6Ueu39
         mwIQ==
X-Gm-Message-State: AOJu0YzS6m/E41Sp8PVT9zKJSNyp0p4yVq0huX2FBnW6JnmZcoSlbri5
	yxlRzRAKTreIEheyVatGRiWhow==
X-Google-Smtp-Source: AGHT+IHMbXE/Abwze9EjqdpU70sO1enIjtDNJ9uE5t83WoTmA2Fs9hT/sHcWMvbLno6r7B91hf1hLQ==
X-Received: by 2002:a17:906:cb85:b0:a19:6483:d899 with SMTP id mf5-20020a170906cb8500b00a196483d899mr5306891ejb.66.1702581896680;
        Thu, 14 Dec 2023 11:24:56 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vg7-20020a170907d30700b00a22fdf10c96sm2876292ejc.180.2023.12.14.11.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 11:24:56 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 14 Dec 2023 21:24:50 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100-crd: Fix supplies for some LDOs
 in PM8550
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231214-x1e80100-dts-fix-pm8550-regulators-supplies-v1-1-6b5830dc337e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIFWe2UC/x2NQQqDMBAAvyJ77sJu0rTSr5QeQtzYBashq0UQ/
 97Q4xxm5gCTqmLw6A6o8lXTZW7Alw7SO86joA6NwZHz7PiKO0tPTITDaph1x/LpQyCsMm5TXJd
 qaFspU4siiw85+ts9pQytWKo04397vs7zB0US26d9AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=OuI3ZT6TSbv4+Phx9PQrKmxRLVqKlP7HvLWZobRvDFs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBle1aDFfDkRbCA6udlRBLwiDsPgFeLMm6UE6AHm
 xqOJ7wcN1GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXtWgwAKCRAbX0TJAJUV
 VooTEADK2iEU66Bm0GdvcfQWVxdhoXrvjSAFEt6qDI/1n7Q3x2P2BLhcnYpRnlxBtE542lP8ApG
 PugrpvLtUqtTmthUK9l6pUXu+TS1/66iYP/ZuRTIU9mGGM8VeQGUnnBcfHqKds5fK958rATdS/X
 nPq9e9t/jmBQ+Y+kGXH/+3IaOMlXjo+PtUiwgWi7I4HaXSEJ7A13KSM1hHwOpNbP+5Be4cz6e3H
 E11Bwfo2NxdE2lh1tTOmveCei40s5FjZp7NfNQ/YZ2FyTuZoQ5Wp7cibgLE4WAn0NlY3xePAcZL
 mGnX9OqQkSKyRsQifNvsywbt+wxBmQY45BpQELh/thfld5VvQ9M4resXX9Cta6ukks7vSNCp+1Y
 IXXy/9DF/xGuU0frcC/gEJTTdvMryhlTYeJz1OyzTZW8kPftnAo2Oq9AG9Ctd63AQdeXZhQ26XL
 DOD0kqW2Ns/e2tH9IJTOuP/A7HgAcb9Evsu/lhvrByZegg0HeuEybkLrfUb0HL7zK211vvsGHkd
 3Ftcqz/ISSg5iFPHNVjvuPIADGSnFnzvqrib7XzwMplKXGWWWFTeSqw1Fjkd7+/zWj8/SxrYfel
 Ij5grSMP7mWZ/WucR+55rr51ugzrDil0/xYdBdh7AGE9ygfZ7XjxVcewjV3YeY9l+5a3xZ9vH9T
 qtONEsHxOFX+GTQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The LDOs 1, 4 and 10 from PM8550 share the same supply, the SMPS 4
from PM8550ve. This needs to be done through shared supply approach
otherwise the bindings check fails.

Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index c209ae59c6b5..7532d8eca2de 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -58,13 +58,11 @@ regulators-0 {
 
 		vdd-bob1-supply = <&vph_pwr>;
 		vdd-bob2-supply = <&vph_pwr>;
-		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
 		vdd-l2-l13-l14-supply = <&vreg_bob1>;
-		vdd-l4-supply = <&vreg_s4c_1p8>;
 		vdd-l5-l16-supply = <&vreg_bob1>;
 		vdd-l6-l7-supply = <&vreg_bob2>;
 		vdd-l8-l9-supply = <&vreg_bob1>;
-		vdd-l10-supply = <&vreg_s4c_1p8>;
 		vdd-l12-supply = <&vreg_s5j_1p2>;
 		vdd-l15-supply = <&vreg_s4c_1p8>;
 		vdd-l17-supply = <&vreg_bob2>;

---
base-commit: 7b0e611dc474ffa67d3a6ea235085bf423ee5f2a
change-id: 20231214-x1e80100-dts-fix-pm8550-regulators-supplies-1e35fa367ccf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


