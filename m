Return-Path: <linux-arm-msm+bounces-89101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BFD227AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EF813027DA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9D12848B2;
	Thu, 15 Jan 2026 06:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IbWQyiY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D142D7DEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768456818; cv=none; b=tpGkCPoDxSwzO01mhD493rBDQlwFnXLxxpjCyRjEBprAw6ALl5DuL8q4CEniI+xO4H3Uzt7NhNC95tiBfbdNxdJIx7r83fWo/piRCRkusVLHsmOJQEpj6DWoHkj+cDssfqw1DYJzQoYkjiHUdlkKFEC3viAWzB5tzkaTm/l83RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768456818; c=relaxed/simple;
	bh=M2emRNPsd5dLS6UEkhkUcbjO9H7QF2ZNB8ZeyoJWdhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VM5+iRVhizQ3OKTROdxb7bibk85ztWi8vQhv67LGlWRd2JG6ZwF7OoAHCCTsiBHOyMx8cM3+EulBdyEaoqqRvQNjGhC32p6hDVzxKLjimCjfe54JQzzqFeq13d9sEz0Z43CZz3yZCI15h8QLzRq10z+N13aSgD2MkLibe6c5Eyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IbWQyiY8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso235114a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768456816; x=1769061616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dDgez86Z8vlifJV/rVDagwU1IW0RLqLFSFiUpTN6tUg=;
        b=IbWQyiY8Yjg8zvPebTf8SXW/92XlwmYeJhCsY4Z0XnnOr9rDqOGrLGqIdgdImrM6AO
         CWV5CDDSLRilTWMRovnEUp+bx9KYxZHC3WxlAUI8ivFMXmpo/WSPhiD3YRCJjeSw7C1L
         mzTdFYvBphA4J6C14Vq6eyS/CGsw5AXmBQ1enr8a5QBrdFsQgGQ8wCYLS0CnENkkbKrr
         scC7TSxkJc/q2SXjU0S1eW+Ua/mNaeBlzqJfCInDB3jupc/8Q0DwGOp3XRUHNZ7S+roh
         hqlaoZ7tkIxkY3G5tsp1gnlU0ejL4AKOdfaHPqfcLWJV6sFFSp111l+J6mK62+koHbPA
         0KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768456816; x=1769061616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDgez86Z8vlifJV/rVDagwU1IW0RLqLFSFiUpTN6tUg=;
        b=DC6YolbF79JKjAefUy4v9b+wtljDswoTzE42uTbLqOArpiE2uZytwt4GLLUJlLtsn5
         y5aHSTCNbDs+f8QYQ1QyTvTkRqMLuuT6IL1qxa11BKO5Xn11VGZ+uh1q6NQmcPlMceRw
         M24tNVYnMy/Nynkt1KNC/OFh4XWGBPbhElVN3iIyzXZ8plXbe1xrI/Qczk7u8KiVCnfe
         YgkDbpMaNE79xnonHBBobGVQ1jNzEBJDFThJXA66MrpUAu9egDu1ZuwNz02xk1JQgLKV
         8kOGl5pO7DCLE927uIRsA2TyY2q+tCUlvSOJatEbl4wpKJu1l3UFek9A4/EuTDkKR3s2
         UFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMMVw1aL3iLHCIU60DJ4+PKdNay0ZG43MbNTbgJ5HO9xS/GrhAyQr0sTAiXcLkbf9d5RrYkmEqwwZwzTrr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7zEXtVW0sjytwKRzWIIvgfUsxTco5ksH9ooI32DFkGDOFAox
	xdJF3TnQsNdiQrAFtvA/Wysd0lrsiSuKZpPbsZxIUeyOa2mZTgtbsJOX
X-Gm-Gg: AY/fxX5WSGcDVHG2zNtS3cAVGOl+VliNjA7kzH3tMUwUeIQFjC51aeU2icuuo0Kx8fG
	bEymwcyofpYeZ8yA9zY48y5K09jd4v4nJhSSPPVO+usYPmutd5WzUGFmMz+5yon1lOyd6Rw/wAL
	PvnvRKXQTh2qZJF3HhOi7ZSVShzLPjfdNSAy9NbsXI+Zh3NNz17z3kAWx5+WcTUuRUfRp5Rey+E
	zt1ovgPbQiyjTBtIjwZtod6zo2KkZBvvhc2o8k9McoNXPWZFuJM64Z+C+7ZUpy4YiClNeEbRJZ+
	98pNXPD7Yx4FFFhblGC8ijyfxbTSbZiaISqyH6r1qOJSbwLNhBYMiY6wDKuC4kpbjpTmJyrvojF
	6ofdzUqCIfGOx1+WUI+x2Wy1regd/prAOcjRz2MplIKZYsiS2Jd0QwGXP+wlDqhGmT9UovtdYGd
	km7GrQs+awMTZUiPAzcj12bBmxhMaUyeSvsA==
X-Received: by 2002:a05:6a21:32a8:b0:35f:10a7:df67 with SMTP id adf61e73a8af0-38bed0d6fbcmr5294061637.17.1768456815900;
        Wed, 14 Jan 2026 22:00:15 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm23744006a12.11.2026.01.14.22.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 22:00:15 -0800 (PST)
Message-ID: <fce9ee85-bd84-4e5f-a2ef-81095b071895@gmail.com>
Date: Thu, 15 Jan 2026 11:30:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix
 inconsistent USB PHY node naming
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
 <20260114100043.1310164-3-tessolveupstream@gmail.com>
 <444b2e30-5675-4a17-89dc-ca24ca3910d9@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <444b2e30-5675-4a17-89dc-ca24ca3910d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14-01-2026 15:49, Konrad Dybcio wrote:
> On 1/14/26 11:00 AM, Sudarshan Shetty wrote:
>> The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
>> and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
>> This patch renames them to follow a consistent naming
>> scheme.
> 
> Sorry for only noticing this now, but usb_hsphy_x is wrong..
> 
> *every* other dtsi uses usb_x_hsphy, please flip it around
> 
> $ rg 'usb_1_hsphy' arch -l | wc -l
> 93
> 
> $ rg 'usb_hsphy_1' arch -l |  wc -l
> 0
> 

I've updated the patch to use usb_x_hsphy naming  
convention to match the rest of the devicetree files
as below:

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 0ca6b50a6de1..a5f763cf1a55 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -609,7 +609,7 @@ bluetooth {
        };
 };

-&usb_hsphy_1 {
+&usb_1_hsphy {
        vdd-supply = <&vreg_l5a>;
        vdda-pll-supply = <&vreg_l12a>;
        vdda-phy-dpdm-supply = <&vreg_l13a>;
@@ -632,7 +632,7 @@ &usb_1_dwc3 {
        dr_mode = "peripheral";
 };

-&usb_hsphy_2 {
+&usb_2_hsphy {
        vdd-supply = <&vreg_l5a>;
        vdda-pll-supply = <&vreg_l12a>;
        vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 95ed335bcb08..a236f8a65937 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -556,7 +556,7 @@ &usb_1_dwc3 {
        dr_mode = "host";
 };

-&usb_hsphy_1 {
+&usb_1_hsphy {
        vdd-supply = <&vreg_l5a>;
        vdda-pll-supply = <&vreg_l12a>;
        vdda-phy-dpdm-supply = <&vreg_l13a>;
@@ -572,7 +572,7 @@ &usb_2_dwc3 {
        dr_mode = "host";
 };

-&usb_hsphy_2 {
+&usb_2_hsphy {
        vdd-supply = <&vreg_l5a>;
        vdda-pll-supply = <&vreg_l12a>;
        vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index c7dc507a50b5..cb32bfe732fb 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
                        #interconnect-cells = <1>;
                };

-               usb_hsphy_1: phy@88e2000 {
+               usb_1_hsphy: phy@88e2000 {
                        compatible = "qcom,qcs615-qusb2-phy";
                        reg = <0x0 0x88e2000 0x0 0x180>;

@@ -4319,7 +4319,7 @@ usb_hsphy_1: phy@88e2000 {
                        status = "disabled";
                };

-               usb_hsphy_2: phy@88e3000 {
+               usb_2_hsphy: phy@88e3000 {
                        compatible = "qcom,qcs615-qusb2-phy";
                        reg = <0x0 0x088e3000 0x0 0x180>;

@@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
                                iommus = <&apps_smmu 0x140 0x0>;
                                interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;

-                               phys = <&usb_hsphy_1>, <&usb_qmpphy>;
+                               phys = <&usb_1_hsphy>, <&usb_qmpphy>;
                                phy-names = "usb2-phy", "usb3-phy";

                                snps,dis-u1-entry-quirk;
@@ -4476,7 +4476,7 @@ usb_2_dwc3: usb@a800000 {
                                iommus = <&apps_smmu 0xe0 0x0>;
                                interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;

-                               phys = <&usb_hsphy_2>;
+                               phys = <&usb_2_hsphy>;
                                phy-names = "usb2-phy";

                                snps,dis_u2_susphy_quirk;
(END)
                };

-               usb_hsphy_1: phy@88e2000 {
+               usb_1_hsphy: phy@88e2000 {
                        compatible = "qcom,qcs615-qusb2-phy";
                        reg = <0x0 0x88e2000 0x0 0x180>;

@@ -4319,7 +4319,7 @@ usb_hsphy_1: phy@88e2000 {
                        status = "disabled";
                };

-               usb_hsphy_2: phy@88e3000 {
+               usb_2_hsphy: phy@88e3000 {
                        compatible = "qcom,qcs615-qusb2-phy";
                        reg = <0x0 0x088e3000 0x0 0x180>;

@@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
                                iommus = <&apps_smmu 0x140 0x0>;
                                interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;

-                               phys = <&usb_hsphy_1>, <&usb_qmpphy>;
+                               phys = <&usb_1_hsphy>, <&usb_qmpphy>;
                                phy-names = "usb2-phy", "usb3-phy";

                                snps,dis-u1-entry-quirk;
@@ -4476,7 +4476,7 @@ usb_2_dwc3: usb@a800000 {
                                iommus = <&apps_smmu 0xe0 0x0>;
                                interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;

-                               phys = <&usb_hsphy_2>;
+                               phys = <&usb_2_hsphy>;
                                phy-names = "usb2-phy";

                                snps,dis_u2_susphy_quirk;

Could you please confirm if this change aligns with your 
expectation.
> Konrad


