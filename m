Return-Path: <linux-arm-msm+bounces-14733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA69885816
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 12:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699A91F2250D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 11:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42322605AC;
	Thu, 21 Mar 2024 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HwkfgSBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589758AC6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711019885; cv=none; b=iXDlL48YxRS+dVXZ5FTKyTaF9apVFx8q4fgdGj/AWifZlnI6H+1k3XYe/ScVP9P93Rmz5RbD0Pv/Fe6jBQ4Mbth8G29SqicJHED3uZKJv8ZhQbzbYrUM/ZIinbMpd+915JZfESPB0bYO1ErPVE5CoVL5Ld3LeISAWhO8IwYSq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711019885; c=relaxed/simple;
	bh=/iKUhklNtsVTlpdt2ueK7v2SeuxwCKURWlmh+eY9/Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTfbSLQTMJglVckHFlrNSEuWkgfnyVtn0OLOHCdvtf44BabuBDfTO9bPnZPrXQo7uWK+Fx8EkuuTA4jWj2A4XcBQYXjBMWwIxD57m9VfmaiDb2+Qny22VeH52+XgKCg7LXFrsl7ehcJogm7IRgDUIonuu/4pBEFS5f7J/6LD+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HwkfgSBu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6c0098328so645652b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711019882; x=1711624682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDRo5ilU3ksVt+woAtfHQdXmIL+jybsRYN2ijwt9Zi8=;
        b=HwkfgSBu7qcX3w+Q9knUv8mKngcVaEk9lGT4lKMU7UWjat3to0ND9cRy8GnNIQbomV
         PwGAPu4YHhP+RaAONMJIUtGIMT03v+R3IoO65x+QJ6GOhKbCv8shsbNeM719FY6HjLk7
         pnjK7RgmReZ0nn+envAqEorlBM6llZVei1MSqT0kvEw/JtwinuM/0t80sHlG2booQy/L
         eusVDqsBlbHA6zPz3lpCBF2D4omeosWAc/jWm9XA23rJMgvYcgaKG6lJChFJQ+KKzpUb
         SmN+UZbFxjnOadIRA2CRrCYjx9S/LhtKsrT+ugRB7ly2cXYwlJAXsZNqH24iEHt9Invb
         0nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711019882; x=1711624682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDRo5ilU3ksVt+woAtfHQdXmIL+jybsRYN2ijwt9Zi8=;
        b=TYs2plbrG+qhgrcRiEUr+3gw1EAxDJt+NrtZqdTt2gTJpAxIkh418Ww0AElHl0PuPc
         a2LXz5MgdUBrXQUnyU6+8qSX4p36m6feZ39RiP8t3+iQ0EYwLFjfks8cfbB894iApmi4
         drG/gV1Jr8T3pTNhkhMtmyxZTN6Jrd8FNhOnIV1FFUSOu29DhRiK5P+0XCMYRHJPpRDB
         UTNSHmcWdxtfW7UysjVmT7K/vcMlp5APxVOlICvTtD6r3z/W/HOR3BS8s2hS50fBScVf
         8uoclvyNfZDJmtjrzQAbCK+Ji8mlTRQbEJ/++H7Q9jkJilknZRrT3MayYKzldd1y7/HB
         +6uA==
X-Gm-Message-State: AOJu0YyEoj6BOYMQ37MGZhFxLUj/yVpROAOWD91MJoh4MaSLuPeCQJNH
	6snA+sDfWRRtjOCiK0mybTB/xy3Ija5f1eWY+J6SjHnWnPYCXlOOF/NrU0IoVQ==
X-Google-Smtp-Source: AGHT+IGjWkn+GHpVB3pgtGuA8ikgm8O+lkiGChIylc9BqxEHgXQ4RTyYJZaqu5CKJzpLBk5Hl+1m9g==
X-Received: by 2002:a05:6a00:b95:b0:6e7:3204:d602 with SMTP id g21-20020a056a000b9500b006e73204d602mr5736965pfj.10.1711019881772;
        Thu, 21 Mar 2024 04:18:01 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:102b:a64b:d832:a82a:837c:6d3])
        by smtp.gmail.com with ESMTPSA id ka6-20020a056a00938600b006e7324d32bbsm5531120pfb.122.2024.03.21.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:18:01 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 21 Mar 2024 16:46:40 +0530
Subject: [PATCH v2 20/21] ARM: dts: qcom: sdx55: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240321-pcie-qcom-bridge-dts-v2-20-1eb790c53e43@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=/iKUhklNtsVTlpdt2ueK7v2SeuxwCKURWlmh+eY9/Y4=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkj9I84XKdR7q36j9NWwLy8PyrdPXPjFSOmp28aOq3feG
 99IEI0w7mQ0ZmFg5GKQFVNkSV/qrNXocfrGkgj16TCDWJlApjBwcQrARMRt2f8KBMj826jtqfD8
 vKVwrrCF3RbHqSVW4dvk/fZ9/j3hIduRV0aMx86FPl/yydhC1zplW0fWMsddvgr9c1SvFIY151+
 L/deR0sL3dfHUB7b+Bzdfv/qc8dLRZya8SRyJu3m6e7z93W6k3Cn0YIp2qH3GI7/lltuytBifnF
 +BE/l8xJkFv3iyvzJTcek3v71qpeK1TV2CXN6vMpQ/NebtNRb101fcvIjVWGFtzV1BeSmZ/Uc6X
 qRe274s1r8qSXHX8+gwycLMORvit4gntbZUrJJ4FvGG1aN/1UzvpxcPcHyMk1B9bzNFedUOu0VM
 NiqmsgwSG1L2TeRkDoo27dIQz2Gu3LI9aW+6TKD241kvAQ==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
for each controller instance. Hence, add a node to represent the bridge.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index edc9aaf828c8..68fa5859d263 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -378,6 +378,16 @@ pcie_rc: pcie@1c00000 {
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
 
 		pcie_ep: pcie-ep@1c00000 {

-- 
2.25.1


