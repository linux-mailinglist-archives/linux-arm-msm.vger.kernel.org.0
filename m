Return-Path: <linux-arm-msm+bounces-53482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421CA7F9C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC3983BE80C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E259266F00;
	Tue,  8 Apr 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JmzeRlTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A259264FAA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104757; cv=none; b=do+neQGhYOngGRu7Kez0hFU3yOKHGCU4sMw6fIGoWlsur9/MKBmmXpDXudij6iEf7RqUD6JlsetkPHxXqTutNTWNluMDZzfz0ooj1UyczYv4JO7jnckmiZyc+yUkT7xr5idq/fZ1nOxtebKYsYCaJrvzOYsezi/NBDeDxTDm6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104757; c=relaxed/simple;
	bh=qgCGnNOyOQyHK/OP33T1QoTLfD5WjwR8xFwGP8VhfJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lhdok0cCh3bcrxV60M+mQnOR5k7XI9oePk0btOCFPIASY7KJpYifokz2eKpAQ3SiZZ8v4hgMAailQbbPS+FR28UUSo/ZiRpJE/PLoakQTbbiiqmcmo0H2SJeXSPadx1TDYUSZPYPmTTjJhN8fHY+poSS5OxLmSy1sQ94TDza4Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JmzeRlTG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf861f936so5230725e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104753; x=1744709553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M4zINbafqQo5bJd0aZoumqfCG4PCR/EbOPBasJQiOjw=;
        b=JmzeRlTGarDhL61I88FqMF1csQpG3LEbU64PLwIlIvYan8B9Gq+H3ecBk0btdn8/du
         bEeQgrWEijhCZ7PkplxaAoz29DoC+sqfkKmjZd/l55iNRwJe23kfl8R8z7Rn8rL3w/0q
         lld2bPagGwInNQ2ZiOWxRK4qomb0SD/6hUU1k0dBYz3EDR9/uONxHghw6spOKzZrfyAc
         brytW4rxbWnNw9AnuWnhluOivgEds/Vyd0myDLLyDRFPfIMYizo1C2PUT1F9XOI1fz0j
         cIJevRi4CveZ839iccrE4JYhbcxYTkGRErRiXpbG02sDNyEcZPNSN+SsVLgX7ZuhpOHj
         Xozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104753; x=1744709553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4zINbafqQo5bJd0aZoumqfCG4PCR/EbOPBasJQiOjw=;
        b=UreGCBmfRgCtER/Q1R+pM5SRsWY/WT0dfoEXca3BJF1QcvBFQWN3UiYDyOCr4bSVFp
         QJj3ZPhfULt6O/d2oSJE5QcDp3Nu2C56xZWcCU6RrqB65QGc4+G/LAtqQzXTyXIgsegi
         jheD99NlTUo76PxD1Gw5cZXI1ShrjgFaqAxs5K969EtJ8DPx3k8p7umgnHzvLVUeNier
         +iGNkre3mQIU04T2rB83p2fpzTNWkZ7XfJ1k6XWgklVj6JLajiv2VIGkVzHPB6fds2Ob
         JVGNoV3m9LSCBtQoqPdESv4gCh9K2fIEybKEaa5ic6spRtU+yORKLLF19Yay8Hynd+GN
         h9lA==
X-Gm-Message-State: AOJu0YwSei7gqX6NfP1xt7cvgtl8KZIOsiTFt4/pZeVjTxjqx6QstJT1
	kjVHo9m3RYigWMrzsAQNn/a7lkZuzy9wP7vLY4Vmb5k4m2TrVGCF2dcRfXNBvjg=
X-Gm-Gg: ASbGncuKq9jqj3eTsWGb0ijTB0PdciLVusseYUA6xfxAyZ1lDUZqAQxwuB4a7N/+hqZ
	d8lG77qBC/TbXQhizxaUARWhOYpS6inyMKS3Oso0VFefUci16Bk9a4YykfRBINOZFM5J38u0SJo
	y4lwmNIqrDMif8aLvVWWu4KZQwkMFMaRMu44waBO5GVFqsKZuOe++unPYp/HJdYfobRLrgRFpvN
	i9msqwdmPTZqc/5aThkxO/zMikj0/s1zwlKn1BurZVvAkvVqcFdQZ1UHvhw4DHzVUKkWU8pRxWj
	DxHY6AZkRz58g2XuKhsH1kvKzZwfaoUHMP/38gVUiGkZycLxm7a2R673jWA96JA=
X-Google-Smtp-Source: AGHT+IH7npEgS4OGr7bSg7YGowsNvnEG5t1YRfhG268UF16djuNny1uwLXGn0q7CxrNOcRtLlaaayg==
X-Received: by 2002:a05:600c:1c93:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-43ecfa02814mr46102395e9.5.1744104753584;
        Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:00 +0200
Subject: [PATCH v2 03/24] ARM: dts: qcom: msm8916: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qgCGnNOyOQyHK/OP33T1QoTLfD5WjwR8xFwGP8VhfJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0Yc8dkiC+JKx4D8IVOEOmRCZP6HvNCwnspX
 NJwNjEYmh2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtGAAKCRDBN2bmhouD
 19TJD/9nBKZNLMot8LCHgxr/fjIZAwUrfI+A7cyj/hT9lnNddUHlHuEXHxx8FtbTCmeTdSNFUFW
 pwc2YF/9Nr/CiUdBV7ajVMraw5KoPw5hKtdi6WCdjMcaCTxr12vBrlCDk50p9N18oNhLv0jxNq9
 rOXGAUmfmKsISgOs/uOTuPcOF5TCOh1GjL0pOw/ddj8Vwi2fjoK7ry2k5TV93auk0rJdsNHH16G
 Xel78ZI3glqKNO8+DHuMXAS8Vc8XuzljKNNWEPcfxsCTDdJnk8PN6/yWfSmXA9e83HMIcaQvq6D
 5J3WiaWL5yk4vCrW/MYh13q2gPQYf/1jN9fGD4GIn2HWgES+FuySh0jpAPvqTSAAV6imxyqjxn6
 +PEAcF8kO6bvoV8nCoLsafG3RIBQH6aunpvhPPqeWs8birEF8ubtdtvkXzeqFfkobQ8/PsFaViq
 K7GBHEOP4rbGH3U/6IX9pVdHRrWC6Gak0NDLKbLT6DUOo0jl1GCxqysx1Z6425lE0h8N9hLmHML
 mB5gVryL5U+SK5er3XrKnl1eb1Qk89mVIaeUj5GOzblwoGO03GtBrd2E5RpkyP5ERdmOS/ClocO
 1onnmSehTmxraNSfGRsNgdMQzYY8dJ7F+o6D8MzqLZ/xjPLGr36KKqlKsEKu4M1bysBJJbC5Z+F
 /jDjxPVeqya2Wag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8f35c9af18782aa1da7089988692e6588c4b7c5d..c89f9e92e832eae8f630555e9e7f5817d6731d4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/arm/coresight-cti-dt.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8916.h>
@@ -1497,8 +1498,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;
@@ -1590,8 +1591,8 @@ mdss_dsi0: dsi@1a98000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.45.2


