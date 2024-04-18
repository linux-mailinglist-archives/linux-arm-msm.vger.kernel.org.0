Return-Path: <linux-arm-msm+bounces-17815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A53EF8A973E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1A71F2368D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 10:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23DA15CD6C;
	Thu, 18 Apr 2024 10:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lO8HbYQ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5857815B969
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713435759; cv=none; b=ps2MaJStK2T4SuEDfatyGyLN2c6WZEJQULbioaW9b9lqHc/iUs75y91DiiqRsGXAi5mPMeYZ0DhBBDABryEgMwIsmmGABOOlHPgfa/3WSYmbZY+qIP7XE1kGLEtYXjL3/HLObCBBuoRhtQ3RjpeOOkJ67IezQtJkWFB8onR4Iwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713435759; c=relaxed/simple;
	bh=7GpLZVZmb8i9TfKBnOQlREy+56bJMbzxa2IuOjKc8R8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sg60D6MRMLfDHiwFHNZhbxA8cslGosfgR4HX8pVv0YoEKUOajqFpuTzrzLmbucrcjbQQW97FWYyGSd0GbnGEkHfvCbyZJCgUDeop+T/2VX3a9nazIm8MF2mi0s9nwBJvdY+gWyc6cHm2mek0Bo4p9Mm3juMDvKMMOQH4Ae/TEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lO8HbYQ0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-344047ac7e4so1142988f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713435757; x=1714040557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIpP74SBRbvnsLSeXLPH0e/Y8v00cuzF8mq86DytmQI=;
        b=lO8HbYQ011nI8bL/utqmto4uteUpoZL03ZMVRLnO5919qYFjjk/OVlvR7e/qtPcTHQ
         fVb9byjD6sRUCBpWfMq1ecOvLxGbg49JpiLQxl9ZlsDWP1s/gaeWQxFXbLXcr3r0FJZ9
         yTqTM81dI/qkwb/574mq+yT6vypcIeCOfU2ZSf2tWQA5uEeJYyMeSv0nSvS3VuhRP+FB
         kf5CbgYkBmKBOG6Pxa6KxuUh7laC+aEicPSnU4/Ad2RNUtv7jHe7sOvwbdeUbhhTvYlI
         OM6MROrMyPwkaoce+hmhp0JW9PPTN8Fw3a16ngSrThm/XfZwSEU04BJAK9oJ3aYZ67Vx
         Fldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713435757; x=1714040557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIpP74SBRbvnsLSeXLPH0e/Y8v00cuzF8mq86DytmQI=;
        b=UtxoP/nobRrKgZ1QhqQ5U6hSp5ftnRN/ezwKP6H7bcVoC/mHSqxJGZSbkzfnQmD865
         N6kRj+IwgFRK10YsL2Eh0w4fBT9YtRa391at6YU5Z6+eKZ/sMBDQJyNKZtHMsfWc1e8a
         OCCI7/B6LIb8ldOfqMihyIBdaZAM6jPZR6sVFA6iNK99QNi6YX+rPhsk/o65zi7ErpRP
         Yh8DzKkFUONooD4kBboUW53mTX3VbK8/kiIkmeqVh+I+oXmAoN1WGToB73t8UEFmxq+W
         NxNpewOy16wK4q+ekfItoaFEeUpNFSNrEVrdbXhoi/5HXQp7dJGjFnso/tDB+q4GvR3w
         7xGw==
X-Gm-Message-State: AOJu0YwHye8hPrOTGapjN6XfYJZpFFnD3zzNt3yNNQ8oNGaGkuzext2A
	iVWOax4EykncU5Y9i7lclv76ceU1q/FzecP2q771XihqSCQXVSghSMvgRSLaUlxvE9A1CQpuikP
	d
X-Google-Smtp-Source: AGHT+IG3d3Al+0fXQsknI8MlR6/Rh9X6wgwlEWzldDRSyn3m7LXcAjShn+LIL1iWdTSr8YsfICtkMQ==
X-Received: by 2002:a5d:6392:0:b0:346:e2f:a21f with SMTP id p18-20020a5d6392000000b003460e2fa21fmr1384687wru.8.1713435756541;
        Thu, 18 Apr 2024 03:22:36 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id e32-20020a5d5960000000b0033ec9ddc638sm1472731wri.31.2024.04.18.03.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 03:22:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 18 Apr 2024 13:22:18 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100: Drop the link-frequencies
 from mdss_dp3_in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-x1e80100-dts-fix-mdss-dp3-v1-1-9f8420e395d4@linaro.org>
References: <20240418-x1e80100-dts-fix-mdss-dp3-v1-0-9f8420e395d4@linaro.org>
In-Reply-To: <20240418-x1e80100-dts-fix-mdss-dp3-v1-0-9f8420e395d4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=7GpLZVZmb8i9TfKBnOQlREy+56bJMbzxa2IuOjKc8R8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmIPRnXB6q1R9WL1Wy/skA3bZ+dnkBuUxa6mOqL
 9lvkcilT2mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiD0ZwAKCRAbX0TJAJUV
 Vv7qD/4tS+AiTcSLlzOJHT+e5KQdsvw6JqDfU1guv7ATaftz5QJxq92ClgXTCgiogNRWnCWH/AD
 FhyvDw+r1khlV7w2PrgvL8BoBFOMQPIKLzpDSIMjN69UfNO1QDcyUqkpjWCQZQ29yAUvyNuaqhw
 e+1YEFmCQ+E+XWOj2iMDvaPQt3ZEPe1IFCC96OHQUCHSZXpZIvrh0wMuqDWkyzkJqLZOmc2czAt
 uOPEtM4lpGsJaIWu+pMCggXFiRt0Q0UyRWKpGfPWuLKH4G6cv60TZGeCpaL03K3uXero6BYGrg2
 KS5lXZblORFmSQembRto+wgTllG2FPwThYSoZbMHtPL074Qfi8EJN+q92DwwYCZ4WX5yIvnX6bu
 JTg7Yn6wcsW8uhYqsoqv2f1swwVsGDzt1P63MJchJ3OgsY68+S49mMH2AD0bFHQiHm1xK9sMY21
 WXJmcP9Aog2nuNaBNb69D4YIBSZvZXNKLzdQzxLK4Huot6CaLilYjt97st/MN9wpTzJnbqy83fq
 NCtwyI6kytx5xBt6PMVjU0w3p8KviywZ6pKYzIV4KB2fgSs3av8a046oVYn7w0uqATHTNGt+ACg
 rwkVRo3aHtQxW6hnYQyrtyZLwlz1+PbGGgfu5zQFYo8WlB0Wbm9nQhVlKbKgW+4DRT4/TYUi+i3
 hVkYg3CMV1Qe9wA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The link-frequences belong in mdss_dp3_out. Display is broken because of
this. Drop them from mdss_dp3_in.

Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index f5a3b39ae70e..0642b5e88639 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4096,7 +4096,6 @@ port@0 {
 						mdss_dp3_in: endpoint {
 							remote-endpoint = <&mdss_intf5_out>;
 
-							link-frequencies = /bits/ 64 <8100000000>;
 						};
 					};
 

-- 
2.34.1


