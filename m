Return-Path: <linux-arm-msm+bounces-70405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76FB316E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D7E47BD512
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FD02FC894;
	Fri, 22 Aug 2025 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mj4Fu+G2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1A2FC001
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864278; cv=none; b=FLtBKXKz8+rylWf244eOYMMm8Q5KiDNQsOtvI6HBYFaFFOB7fdTgdbvxpaeqU/ky6iVQrrapRtiQX4CILZqVe8K2Qyp1EKcMlR7n9a/ASDWm/Y1V1fHOT8Os2w2lRCEmwb1+fJo4XkafV8e+0JvBM+FhMrjSyJ34z3xm7HIfeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864278; c=relaxed/simple;
	bh=znOD+AvgM9F1/liZpygSOlh5OSQoyBO0bA9B5q80Btw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mUfmwV2D5ZpHKOwvL7QRJguPzuYo1KZ9TbdrZoyU41rdTD8KEm3xp/7TuhaLs4N4SwxoKjlYf3lUkpWUbAuNsnwQf73jbyI6Y5Hw5JV8+BekXRoKQfXBwPF7WIm/fMyKzus/1BmcagoKE39iFRhol4E3YxzRn4bG3LWInSMYC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mj4Fu+G2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61c25ad57ffso58100a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864273; x=1756469073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZvZL2QEx5a6VhfqhYR9WENPbwwPNoIFgoVWjAoCaFk=;
        b=Mj4Fu+G250ooJTi+QDkf3Pdf4KEqbWG6SdNDrMEprT33wbkdodDp6h8/6cf57l+PrQ
         cHBNY+dP0VBXMf6VujCjXdAyOVAlsOmxY99JiXbei3cOIy7p3YujxzVZs0exr9cEwqdR
         MSty7/7mNLQXj2vMOf+4lRkm/KRQ+VgjzQgBQt0hquCA+7uGYcGWk5GAfTyYgNnz3e0S
         k17jmphOqq7bMlm4EzLD7trFaHbMyw+ItbAXqmVpwATSRSCw5uDlsz/WxAiO+mO1rSkl
         7RcUdiVHZpUZ3vTTLhTOjPQwR8N9ZyhG1JLfGmZjU/0L3n5bHwPJpfMx0+whTHZTUB60
         AyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864273; x=1756469073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZvZL2QEx5a6VhfqhYR9WENPbwwPNoIFgoVWjAoCaFk=;
        b=fC0Lwk09zZ4vJ9AUH+ozNsZeFCabJ/VAExwb7AooNnN01ltjeLvS8l6blk84p9dddz
         /TI9cR/8OmpwTxZiVMjte4C1IZ4xf8AGWoni33j02Ykfyd+4bkPAWA2MNm0LjJUcnkL5
         WHmOK/DN/oLL9Uz398goFiSRF0REARhmOUe/z0IW/VWdEzugltBPiJBs07lDM5KdQsRL
         1DYSiaAwAXg69AoN2w/c43120UDPAqvS6uM4BPG2iuruLCyuRkTq5XOsV7lXMw3KY44J
         BhcY7QNdXUFQCj20RmyZZXLLzoXy5lU3pF0vdMB602Q+zQ8Lll3BxbFxwD+MjvnBHSEY
         Cmwg==
X-Gm-Message-State: AOJu0YxxQAzxlSXOTdj+b9bwINYfGXWoSdehdu0Maa1aemOQ7NKpJN59
	0wrh05yqdz9iUREVQChut7QgYB6Fqwddv22R45q4vvgrj6NyS5I1oCYYifFvkxh+hYM=
X-Gm-Gg: ASbGncsKkaI7Hq9ofd0nHgy0vwr1dqbgM0Ck6FddD66r/4m8tYyBOheBuL1649VfS7x
	KyUaYb1wAKrCKGBH7z6rlfAAJixEF6aSJgiQppEVxn1IHJAEszg2Sz2dSZPk7/L5IIpePs1o796
	awYR3l1xfrgK0rtmvopNLfhOC1Q0O+5CaA/kH+HqyE960zY50zK2caNvpOA+JisigUe5eIG2NGM
	9K9hYL+Xf1LJTwdobeaAvDpLiBE/KyWXGcMJhcyidLPqfNbLhTmwRNOJ+angPZIrIZJ5X9J1ncu
	KsQ258zXLDd/HdFVKX0HL/KYicGoEysKsWSWif2e3QloCDDekCkfwBSs6AkcUANpEpCoUSRf3r1
	cfeDGP5sT3By6C/LYXV09Bvd877sqFfHrP8fazY8=
X-Google-Smtp-Source: AGHT+IGGem9ix4mwAU+b1B3eKP9Faruw2osIkbM6mfFggqvmjsTorzc1f0Jd6WLIba2+pptbwbqzyw==
X-Received: by 2002:a05:6402:2348:b0:61b:6c51:3ffe with SMTP id 4fb4d7f45d1cf-61c1b3b8e86mr1300919a12.2.1755864273284;
        Fri, 22 Aug 2025 05:04:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a757b9b39sm6690444a12.48.2025.08.22.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:04:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 14:04:05 +0200
Subject: [PATCH 05/15] arm64: dts: qcom: sc8180x: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-dts-interrupt-address-cells-v1-5-d54d44b74460@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=znOD+AvgM9F1/liZpygSOlh5OSQoyBO0bA9B5q80Btw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqFy+M7Xz8B939PmNYv66navkdu22J0eliNIAL
 J67vvcH70KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhcvgAKCRDBN2bmhouD
 10HsD/wIEh7GPspfN5cvO8b23Zp8o2uumKzW8a27LqxDKcPPnAY1NNoYyShy2W4FDhlc/F/Tl83
 uxFV5ej4X9lH6NZPyAOsGhVm+jRHyEuPFrqsTXgG23QcNovwXDOMFctH3f8IWR6BQPduwnZgVWV
 yFmdgvaBfN2T4KPvlvAjH97ygbgqYUPb6nF/PFhUzwMQ19Xvjz+/d1JWyDLhD1nDOt5w1MsFHxK
 ykbx14ZDLDX/Oc1CA/fIv437t/xzm7c8tPKoX22p4pYo8MA3ulR5qHiB3XgMxIvER6bhqQeE0Uc
 AzYPfa0qrKuZY3S/0a7JA7pfT81xpH0JyuSyLAkRbdYhVGVNvtD8IlsWZkjez8CD922k5GUNX01
 RojJO37pYFJMeELroTH/M3ZQswep40+GzqXItSXzdQ5hSXvIhgY7e09mRVfszc6jDgX/hkCGRDW
 HEZkwSHZcUMYctako4HkPPfZk1veFxWluRjAS/g3mDuELumAfTxlUlHCJQ5i6NcpP6x4A6xOcN+
 6Oak7rxK3l3/jU+COSL8zTCAEkzUFNRyDL9Ozxra57MLdKHRMRYa9fi31dfjiZ+xLfF6z+11FEM
 YFOn2ONeOaEtcmrUB2nmyiFopdb+qNNXSWej8tACXf/IwJ9PhOc9iVbvgbbspMA5SRPPURbDFN2
 L3KAN8cllfTw3vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  sc8180x.dtsi:1743.4-1746.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 836ac94551478fd728b1229616bbc6494cee336f..15a75def6204a35d5852e73d66fd3052e38e7863 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3721,6 +3721,7 @@ remoteproc_adsp_glink: glink-edge {
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			reg = <0x0 0x17a00000 0x0 0x10000>,	/* GICD */
 			      <0x0 0x17a60000 0x0 0x100000>;	/* GICR * 8 */

-- 
2.48.1


