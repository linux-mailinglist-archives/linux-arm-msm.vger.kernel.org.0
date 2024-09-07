Return-Path: <linux-arm-msm+bounces-31212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102E9703BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 20:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFA64B23603
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 18:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3E1168499;
	Sat,  7 Sep 2024 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2/Dinxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744316630F
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734906; cv=none; b=lj1Y+MOPfCgmxUpoE8ABD0F6h2IFn5+nusmicYmmX/rbbCO2ys08pnJEvo0UZay5ooia4/S40YujrgkPZkZ/q5CtIsPMDj1jsq1Q4qLVPCPgu9RnbiMB/CZ2EgUDSwCLl/fwjiD2vNIz14qlFhHEtWvt/tUp0SiQEYNWlYz0nMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734906; c=relaxed/simple;
	bh=6TCDPpBkY5pK/ecMFCBKg6KyrCqiL2Nwxp1MC/3FL0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FcCl7jj/mKvAn0opcqDbkWO8FsHVzA1dqyJyC11nQASHOVz/7ZRSFCn7XuyzNcvu2p0lC69SA+t3SRWJinpjQXokrti4UNX8DNKxnaKhpDbsHhPItIBzLW4Yysqa/tPuhi/r/GDvu1R7n2yLGf/e6qRMvvZh9PjlRZ9G6dKaJ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2/Dinxu; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f760f7e25bso1797511fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734903; x=1726339703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm1chB3YeV/rbRF4sUAZL0Reqk72Eb44oLJJOE10AxM=;
        b=o2/DinxuiNLO9bPGDLhnAmyLnEno7TrrrNLvQUpC5lDqNo46XLOMdYEEwrpo0yEsbT
         HYDd4ZwmIAbnsAQNfsTCfrIhxj3BX/rMTRLLIgR8GoF5BGAA5WL+pvzQCshyAhfHYBel
         bxKbyJTaskrrh2OOYjxk+X8X3wOEhzEXIylpOdB87yhOyPcBACjcXnQFliaRsphGhlFy
         vo34DWADOqK16j1e3CTLoedhx3URW+D5VmPkmKG+DjZDD50bK4Ukug7x5tMUiWewEmfD
         HdHpXUSlfTRtu7aVltXvD5mghONWBiaUVCvmpEcDKfI0wsrEAj8TH6eIW4kRs3IKvwLN
         sYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734903; x=1726339703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rm1chB3YeV/rbRF4sUAZL0Reqk72Eb44oLJJOE10AxM=;
        b=Ni1cSzhf8EEXWMF7TSICj0yZqAEJWne66ouSL8Q0oMuJYAbuY/xd1yd3msVZ2eHRL6
         giUjG1ZRgTUL4mwUdvsxcOvdRefJqUR+PuRNUkiT7LupOyJfPNKlFDwO4DaaXJAcfAH9
         phzLjyQAXhux5WviHZOvjEpnsuN1fwESEfnVjLvbDVzTpS+vrD+gx9vZ3oC7iGuoGB3N
         deZdgYIETEsi1XwRUGR12TDom3WPUZ11Ac3/6sVohVq5sRLkbv5WMCJO/g8ekPlCco14
         1OHgdCYxcmubv56sMOyMiNDM9FfV8ygqSOMlXLgT69KmY57Tqv05ztDPvhJz+M4GTep5
         zLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaoS40T2nTKyqQ5ctoXtfZIAV8huZjY25U5VEDKc2e9RNTDYcyNIIcS36MGXy8PsBAonbKv7hBp6WGjoCR@vger.kernel.org
X-Gm-Message-State: AOJu0YxlxBgMiHnuNaXIOZKoJjb1iU/Q4qs1tVUGFncbJ1lu7H39eCne
	3B6xd6/JRRluAnjT4ZSIo58ljnLUOBY6B1K8e/Y5WINj5Fo0jZJlsIhsdiK6EW9gO87XfvJ84f0
	9
X-Google-Smtp-Source: AGHT+IHu563+x1ywd7U+RrDE+KW3K25LUY98BF0NdOnVsnzEUTN6YUx2CDuriBbnNOmez6VMCEAmJw==
X-Received: by 2002:a2e:819:0:b0:2f7:4c9d:7a87 with SMTP id 38308e7fff4ca-2f75232641cmr33900971fa.21.1725734902386;
        Sat, 07 Sep 2024 11:48:22 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 21:48:15 +0300
Subject: [PATCH 4/7] arm64: dts: qcom: sda660-ifc6560: fix l10a voltage
 ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-sdm660-wifi-v1-4-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6TCDPpBkY5pK/ecMFCBKg6KyrCqiL2Nwxp1MC/3FL0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/yYgngcJjUMb3ImAgjjHipMpb3WTf93cRNT
 iQYHXaOttKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf8gAKCRCLPIo+Aiko
 1QQ1B/9bAfy4pGc7ZPqq1iHOoY3bTcWAcmd7v2Qz79lyDxIMcv6LmE7qVWnxa3xXBT9FzGon5UF
 9mVlaNnMAPckOLbCL5rLh1e+ipDAycCXla3X8iPEmzZsLdvzdSsNjm7SJ403+kB0JkBoBmLzQEE
 5c7OuYEkLOhNkb90pSzBBV/UgmfvZoAGSEaes2pf4FwH+R4Qz7cFFCj/iHI5AY8JGVKr89eFJH8
 9i1ITgZ4uEXit1VxxeEba8+y9wW1wlGe4yXolhk9o8pOSifAYL1qWLjEGoUZSfMXxgthP6yN+7/
 GpgBONEmhzqQy9Mkb0GsjthGtQu0xfaLV1COcEVd8ObQS6jc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

L10A, being a fixed regulator, should have min_voltage = max_voltage,
otherwise fixed rulator fails to probe. Fix the max_voltage range to be
equal to minimum.

Fixes: 4edbcf264fe2 ("arm64: dts: qcom: sda660-ifc6560: document missing USB PHY supplies")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index ac0197624c09..09bc010ce56a 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -104,7 +104,7 @@ vreg_l10a_1p8: vreg-l10a-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_l10a_1p8";
 		regulator-min-microvolt = <1804000>;
-		regulator-max-microvolt = <1896000>;
+		regulator-max-microvolt = <1804000>;
 		regulator-always-on;
 		regulator-boot-on;
 	};

-- 
2.39.2


