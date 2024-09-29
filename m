Return-Path: <linux-arm-msm+bounces-32720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 809AA989525
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 13:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3251E1F2278A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 11:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117D8178384;
	Sun, 29 Sep 2024 11:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyxavJbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C6F184D;
	Sun, 29 Sep 2024 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727609345; cv=none; b=g+NgAQBhh3t1OlHAfngIuCnEigo20rCwJfYBWQUY0BJpZvcHCFsCGr/n9+Zt6G9pD+kvPEYYyYeH+cPLcugmQdYVPJKEpoDkH1+yhtUiEmFuOOf76gj+HugGMPICjoCJRKWAzHfRBlS9vgWW3HahiceOBgR3jw4j7mTrzByceXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727609345; c=relaxed/simple;
	bh=3qv3OsFbhHEsFwFzcjtMSL8CLzt+eW9pIWP5pcDqRJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxnMRFwYrYEVMGMJMi/XAdbFBrCa8vDSQvEgOxTYli84Y3ixw0MAPCUm8326Xkcm6Zygz3XbDRZQVGU5p6tSSvezgPLFrgA+1o0+X7wWVfkdp9PrR5TF0qeVq54NbNv9M3ymlRwu80WWi3ACSIm8SICVLhVvSVxTJdYUI1/aVQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyxavJbp; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e09d9f2021so2244500a91.0;
        Sun, 29 Sep 2024 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727609343; x=1728214143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3i9xLfp9/J52UJ68f+odFhRxtsq2MouTqkwu7BAAmY=;
        b=lyxavJbp+ayF95L0ZFPdj714ZsPYyUZ6loV1zcxjUtUGT+EmqHgEaTijZUKPgB2D0w
         gPr1Tca11RYsqZqos1/FNqxY+tSO7okNlkmorAWkk9wUH/clGz+adHW6ejH+28UmbWYc
         9y/Z7jdKIIXzqlZfhTQBnPoa2OCLih0bH4xSbHjOk32sNXG6YbAD63fRzmGqIwl2WNIk
         TI+lRBVH/kk/1Xm9NQhvOzB3IBm0c8x81JxeuGnYNI2jWtHr6KmPESEg5sc5Z5FdeWy9
         95oXiUYA+GTytvMe6LgSc1f3Yjhu25og/Zg9XMqsbroHxHee9TX7f0Af1N97AKRijrCN
         5X0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727609343; x=1728214143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3i9xLfp9/J52UJ68f+odFhRxtsq2MouTqkwu7BAAmY=;
        b=uaz/bJdpmEOKL/K8UHgNqDYeU7QKt31pkn0YWyUUKH1Hsm8xhYRKPFQyBj62X4w4kT
         UIZp3BQSyhPTzgIceBDQ3nVFg+NfiL5o9W6JBAX+EbhnBLmSYlf3iwvyQzDgHgS9Vv/L
         3kzIGNZgln0LMsc3BLHgrWrEGAN45/oeFgY8sK9ZkULvIjs5hhJO5UIUuHN0GQYXzCUw
         2kXIDmp/iKwdJXLlGmi6X2Icvv7vwyNk91z+sOk03Oda0fOtOXopuMZvW4+QIkQ5sZN2
         PkL2aN+Ih2QwZ0pIiCu61gYMImIkmVZh0DhEM2ZXFNkFaQigz3UNkEyWHk9pyjvTOENf
         9sXw==
X-Forwarded-Encrypted: i=1; AJvYcCUh1EhkMlZlp/iBWFb4uOQPEKFVoGpkyDLWMnzpXDPpQ+Ey9j8bFo7UYkwHq33xvBy+dF+FPdswL+UfX5cB@vger.kernel.org, AJvYcCWvt30GjHA+TgFhXb0ZTlM4rjnzXUljMh7C6/CgB1KuakeGwQzHzRw1w+y9nCScROF4CcHpK2gC8kwN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuQ19/TewUQcRA5GMqDvGVt6wVWNeX1zG1xohKv11KufLLDZc
	nUoCBwHwY6coCjpjKSylb0uJZJDg/wrcmZsFCGrWXbWjl1WJPi1M
X-Google-Smtp-Source: AGHT+IHCEQzumuAx/HhIoMTx9zWAJmwo6jsLknrwbznzBpBuVh6wY9D+4zf3S2mPBCZUXuHRGoUvTQ==
X-Received: by 2002:a17:90a:f40f:b0:2d1:c9c8:301c with SMTP id 98e67ed59e1d1-2e0b8ec8c02mr9875116a91.29.1727609342866;
        Sun, 29 Sep 2024 04:29:02 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e11638e859sm893650a91.8.2024.09.29.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 04:29:02 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH 2/3]  arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Sun, 29 Sep 2024 19:29:07 +0800
Message-ID: <20240929112908.99612-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240929112908.99612-1-lujianhua000@gmail.com>
References: <20240929112908.99612-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add wifi node and this wifi module is connected to pice port.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index ebea283f56ea..05a71462325c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -680,6 +680,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pm8150_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
-- 
2.46.0


