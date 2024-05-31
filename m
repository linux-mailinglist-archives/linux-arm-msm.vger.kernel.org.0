Return-Path: <linux-arm-msm+bounces-21332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6222C8D678B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18781F26A88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8571761B9;
	Fri, 31 May 2024 17:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ea9TB5KD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE423770FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717174844; cv=none; b=AFWwUEoTo/XalFmuVylcEMevG0dQRRqfRYlfjQNG4Qsifpi1eUa3JJ8hYwa28h0bSTsX6yo/QLwUL+p3u6cOpvtvF3RyeCIGujkSWuKmmMDJQYJnRabp4XyaWnCI1b5IXvav/VCCDu2MiUC72AXtTq8ZqBbSQAfhAUOMf37VZqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717174844; c=relaxed/simple;
	bh=5jcWigQIeXCdf4Gov9gW8hB/yw2QeIeOgRPM6wsehtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJH5XqdAUvg4qifT3Q4gY1HBs/lM80jtGTwLmHLzt2pwDzQ9dIRvIbnafJhnSsWTTYkWewtZXSRa0vmSS3cSqeGTxLuwEusqIr1xWgi/VFeyI0iuUqcHvSouVRtSazOvsP8ZuTmvYXorD4xh17Zt0Z0xGvASCHU1U4dKwBoLhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ea9TB5KD; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52b80e5688aso2795822e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 10:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717174841; x=1717779641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbPz5ot7V2ABpINiTsk71F3CxfthRVL4eELJXgSURnc=;
        b=Ea9TB5KD+g7w+TH6hvqqx1u9FFdORQE8NfodOwyh1XemhYPtvsb7sGIYY+BRr64ld8
         uiJRP0ce3sNJnziASnAF5tHfWSlrfmPPpLajobHMIjdvHw2q6RC+A25ZXN3EbIBWSw6C
         kvojLqQpN/wahHDWtBzK0TJYAa1FYH6pcRDtYuv1z4bu4Hm8n3/pou0GW2olwAztfSM2
         At2c4keHKRknr+157G82aXTTGMAtu81LQ6as4hJSs2WkeHGRgftYeG+EBuvX6S0z7XmK
         1P27WaPfloGarcSWu1JJiWzgULDk5sfJsf6r5WBF+ldy2zAW+KDXx6d80lAKcKi1l+To
         5wYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717174841; x=1717779641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbPz5ot7V2ABpINiTsk71F3CxfthRVL4eELJXgSURnc=;
        b=ZOd6UUmD+VJZfFYRN2N4wyPtF53i36MlZIahsGA4g3lcFkT8y56SrMnOGku327EojD
         8EfBB9YSS9X0tH1M2Ix8B94pP/plLQflclnNvlzdf7n2qS7lRDv1FttnGbjYGjO959a3
         qbd4dc/477JBIDU88nKViZIVZT4wiS4Hk/hLxC43S5Bz5lTPXDIvSybdREWcqU1g4WhG
         Pgj9rRvTVWifUsUCSuj1stBrx5TDou2jkEEOYRC7VGEgUyoVUrq0mkxiLKJ0+12UfF0r
         iiGPNIioFOxwgRwxjVb1uXxll9viy6VnNgK0WIBzHJ4QUSvzydwaFiXxoj3OtyaxIP53
         1QFg==
X-Forwarded-Encrypted: i=1; AJvYcCUHnJEnwcnqLnwrn9tgvPZSbANiZSy0xWcr/VHUKGbsexrzgutnj+4RuA/PZ2bLDsgNC52DkOmkh7sMxBhZyw3tpL0iHCQf/PUjs60akw==
X-Gm-Message-State: AOJu0Yw+kRAZk+auDRV2HKKHSQqdAFQl3CW0Dl4hglmlm3JomKKHdnGi
	Q1Y/K83iThwrJ0KM7ZwX1Y/jXdHMGRc3EfnSTmLl9DALjnWC2LNcyHCDLAeGIOA=
X-Google-Smtp-Source: AGHT+IGyrjK/hyOAFotSF8SVbeCAsj/wzMr9ELegjVKLYOqLw21wKVMsgSA2YnChS/o1Px0vje07YQ==
X-Received: by 2002:ac2:43cf:0:b0:51a:c3b8:b9cf with SMTP id 2adb3069b0e04-52b896b86bfmr1916860e87.69.1717174841165;
        Fri, 31 May 2024 10:00:41 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73f9a22sm105533166b.60.2024.05.31.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 10:00:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 31 May 2024 20:00:31 +0300
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100: Fix PCIe 6a reg offsets
 and add MHI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-x1e80100-dts-fixes-pcie6a-v1-1-1573ebcae1e8@linaro.org>
References: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
In-Reply-To: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=5jcWigQIeXCdf4Gov9gW8hB/yw2QeIeOgRPM6wsehtQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmWgI0OZvnhzv8jJBrne721q2q+1gqSu6+ylkFB
 udHFy+JlLWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZloCNAAKCRAbX0TJAJUV
 VtO7D/9Y6mlTgcMvIDRrrO4vcsqGtYzCHmA7EYdWVFtriqKJp7eW4fI9jVkHRQuyJlqJkdRzM6q
 pcoOeqvGH7G5SBxobQTIX/9ZO447qNgE9jSN4teUHndp6w2XTHNoXTbp41WuKA3Wtwkk25PLoEJ
 5tGWso7MX6Ahxz1CvC6g+kOdZ3m24Nzngjot3rQmrmlarata5rgD3L1WGAm+mE5bkrAu5nJT4Uz
 V8pDGhBpJReeq5/0DUWkUUyyxDMhIYVqY0G+Vxun2pQnB/v62NKIpIkcl+/CioxXVSTk4jRdTkK
 3fCqOb9OKG6xK3RU4hyAKMlMF1GnPMVWFLN/kHc9ApSi7XvfxjPHFWUugAhkzgWZAjBtBA2AelU
 LThVZVAE7fT45glPqZgp5XzURDe/nlVmEy2PVExKsbBoi0zrCCiSDWMJBddAQgomh9rO3qhFryd
 N2vgd9z9yn7BemZSQGaJGaCPO9FwdOrrtPgs7Btz09BBI2kxPb2CO9Wr/U9GHOT2U85kxguU1ZE
 Q1x1LIu/77WJLfiXGVwy7p9UW8bcl1BnRm72u9XDP14VKBbNMks9cYdU067L5mqeYYzwb/lphNy
 SA6ge6VW+cIF6HR9DcPga+Y1UqjcpVejWPt/FPbaJTM9ZIgrRZlod5XjJOkMe0khrriIe0/PVmP
 pO5rEoh65Cv0c1Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The actual size of the DBI region is 0xf20 and the start of the
ELBI region is 0xf40, according to the documentation. So fix them.
While at it, add the MHI region as well.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cf8d8d5b1870..fe7ca2a73f9d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2818,15 +2818,17 @@ pcie6a: pci@1bf8000 {
 			device_type = "pci";
 			compatible = "qcom,pcie-x1e80100";
 			reg = <0 0x01bf8000 0 0x3000>,
-			      <0 0x70000000 0 0xf1d>,
-			      <0 0x70000f20 0 0xa8>,
+			      <0 0x70000000 0 0xf20>,
+			      <0 0x70000f40 0 0xa8>,
 			      <0 0x70001000 0 0x1000>,
-			      <0 0x70100000 0 0x100000>;
+			      <0 0x70100000 0 0x100000>,
+			      <0 0x01bfb000 0 0x1000>;
 			reg-names = "parf",
 				    "dbi",
 				    "elbi",
 				    "atu",
-				    "config";
+				    "config",
+				    "mhi";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x70200000 0 0x100000>,

-- 
2.34.1


