Return-Path: <linux-arm-msm+bounces-19110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD768B9602
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 10:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A559C282C5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2024 08:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B682E65B;
	Thu,  2 May 2024 08:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gg7R7FjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83F2575B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 May 2024 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714636845; cv=none; b=R1aKryoRGtn+GX2eBPyEfwQqDYJgVYaSBNCAKOQ0qoq4gtKjxeblSoQkPi1ssZzIdR2l/dzzYW1VN2lyVk2+oubG6TeowbvoVAuY1fzNXT7nQwoIU/3bnCyo+6/HWi/JgE5bCljj2uib3y3SSxqQcYS3p1gf23JQTyBS2hRI0Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714636845; c=relaxed/simple;
	bh=jEHlnNkVElM/Dv55XksX6LWIWYOCpykIugcfp3LIwxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szwxhhJ9068kAT6KR4FfOxoj+h5gvtRa+jxeMWyTkpprRJNnm8AkNqaBrtfEaxVRNYM7ljcTa95IXMdr0Lw4Kl+0W/kUG0fIwqJIbMlbEevXoPPafQkE6rlwaRd1eQOXH50OHgROBhrDPa83XlDP35yoLY08zGh/id4FNpM6qTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gg7R7FjJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41adf155cffso52758495e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2024 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714636842; x=1715241642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnJb4oXP4/TF4UMXUqALWVwtvpRcZnHfbpqExORX1XE=;
        b=Gg7R7FjJTExRQem8GT14V69nbQBMR8JdfxR01znWzz6swXIz2zTu/YeAeOAVIzob20
         iwKQlAGvpDHgzI4Rf/j28vbZ6XX7mBpMN3A98HvJ4h1EOikj5THq81soUr+FPKI7DVDg
         XzZ3TGpbUjxAJ4TNKZnnjB06Wu1jF7ICMm4N+1mBVNhmJcT25cAU4/oVYHMuTW/C+sX2
         HpreX2RHQDkcUxk9CSb5pg2ccadoiDt3pyLZsMbArfjj4KuD2c7Vojh2he7znmOrtw2m
         pdZvo5QpyBh99Z+Aa2CQEghwGmsIxKteAwibKlcdK0ZCfKIGqhP4Uv2SrH7VmNtywrxB
         5awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714636842; x=1715241642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnJb4oXP4/TF4UMXUqALWVwtvpRcZnHfbpqExORX1XE=;
        b=Sjxbb1UOTN1FIQ6ho5A3swq20wezJ7/blque/wVpNv1nKAN2mtoepWaMl4IXbYHuKa
         70Uc+fVcSiHPjaJjoNfVhnjsSg4/0lQU35XSQGAuddUeYQpctF4QYl01gs5u4lJSkC49
         cUrBDgBsmppeNthXyD4cDLRpec9BTLKDTi3bj8yUrIvUDTLKuXIESeZ3UDKWS2jv7E3w
         XNVJtc3au8+9RLgknzsm126SB7aDlEGT3WqijRZh07juXjkrHoQsCrromapJo6QIsog5
         Po2AAaZN2bim2oR7Q1ducShF2aNuNaC0HzQW/InuxaT/bd4lAF0TW87Y4eSqcb2yF28B
         +zlg==
X-Gm-Message-State: AOJu0Ywzsx5RnaCmafroB/RE4A+S4HwWELEDXoR1OJf/A9jiwWcMVlMg
	a8O9hYBUCphPmfJhv5EqGTSQ4EV1LH/93X66CmTAMXD0nXXhNpgv+3JLsYgTdOg=
X-Google-Smtp-Source: AGHT+IGNhbyAqF3H3wd6eOsEH9NHFITd4chKQTKscZtNyAguQV2cAVvIpBvxbBSvWAeCxh5CLTOyFA==
X-Received: by 2002:a05:600c:3147:b0:41a:5521:d848 with SMTP id h7-20020a05600c314700b0041a5521d848mr3207783wmo.25.1714636841885;
        Thu, 02 May 2024 01:00:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b0041c02589a7csm4806597wmq.40.2024.05.02.01.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 01:00:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 May 2024 10:00:36 +0200
Subject: [PATCH v5 1/3] arm64: dts: qcom: sm8450: correct pcie1 phy clocks
 inputs to gcc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240502-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v5-1-10c650cfeade@linaro.org>
References: <20240502-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v5-0-10c650cfeade@linaro.org>
In-Reply-To: <20240502-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v5-0-10c650cfeade@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jEHlnNkVElM/Dv55XksX6LWIWYOCpykIugcfp3LIwxo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmM0gnwqWSucVNfydpH170fiqTRXFP9OnzDq66Yx34
 ph9rxtuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZjNIJwAKCRB33NvayMhJ0a88D/
 wJhsrgPOsYvZ8bIAO/NdVEC2UV5guMw9SmoERNSXCB4TjRiS2JMrPa93k+R0f77LqIrYXM5flRBDcT
 bhNZ2IsO1y+TlxBf4h939AwgtEfTuuxuzSimsTvCmf0lgn5+g6A/rD9k2Hj2JzH/1tvA3QBY5K8/mj
 Bh5sWbkts3HQZvcY2S2d9oIfpYUmxwdrwxAx0Uqk2uAbmcROH9g+ots73J9LyMIexYgKt2f8GLvsCj
 DslfUAE+xlmE/8+FtQTZ/6nKX9CTqDtntclALfuHEmpWxFWP0c3VsS40DHfpbfI6HMQCdKwkKIe9oT
 WWLIo2+pb7aclbP7a4yJ6bdsHWWeZQa7YfemWiRxrEZpQs1cueZDTltEkfBkksk+wuCam9XrGksJzl
 UYXdfacP+zVUmHKW4bHcWNSFwKmtBZfFbeRWdoiILXA/rTybC9fgfLiLEglAJfpVUBe8cdbeXlUk/Y
 txm6U1qxI0Z2vnc9omtQFb/EF4sMsVEe+M1SX8e9+WF84DFNdQ46gfFAFM/SwjppK7aXOUoMqOg+tm
 B8DQ2eG38yx9BjpEJeW3s+lZzJNqmXzAuTujaQttjk0odVk3Nn5AzY1av6A6fl0g6AHkxCUEaKffWw
 rhzw1rrYEjRec3imUr1tR6aJ32sYWpWLs28VnzJRcthihgUDQWq/cCdpNVBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PCIe Gen4x2 PHY found in the SM8450 SoCs have a second clock named
"PHY_AUX_CLK" which is an input of the Global Clock Controller (GCC) which
is muxed & gated then returned to the PHY as an input.

Now the pcie1_phy exposes 2 clocks, properly add the pcie1_phy provided
clocks to the Global Clock Controller (GCC) node clocks inputs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 616461fcbab9..71797f337d19 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -754,8 +754,8 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,
-				 <&pcie1_phy>,
-				 <0>,
+				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
+				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
@@ -2000,8 +2000,8 @@ pcie1_phy: phy@1c0e000 {
 				      "rchng",
 				      "pipe";
 
-			clock-output-names = "pcie_1_pipe_clk";
-			#clock-cells = <0>;
+			clock-output-names = "pcie_1_pipe_clk", "pcie_1_phy_aux_clk";
+			#clock-cells = <1>;
 
 			#phy-cells = <0>;
 

-- 
2.34.1


