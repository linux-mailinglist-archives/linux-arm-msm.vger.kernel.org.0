Return-Path: <linux-arm-msm+bounces-42049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1139F0FCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF1D28389C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DEA1E766F;
	Fri, 13 Dec 2024 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjiRcWaM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155AE1E5713
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101679; cv=none; b=EQV+9UIUzSVmj3h9cyHd37GC7xXT4QyzXvNAjy1KvXOAka5aFBJ1IoHordbRps4Ohn9/5Au/N/2iQGPjL9/j8g66PMtDLVmys9Gdxk6hKjNBgvETL0KOkiqUeXOf7vSY7PzNNvlPIPgStNc1sI0o9aEpIJ9rIhi0m9j9taR5Bzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101679; c=relaxed/simple;
	bh=t1DYQrTH708HNfSqvTWYh3NTNjncX62oLPLPAgSDGUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJVU+8m6UNWdRGvwZ8GjQm7a0Pjnlec0DTlmVJfbzRcZedZCEWmdypR+0PqoUfQZr64sqFeckFpSBXmFq6KZ8HY3WGUEBkMP0pKzCJXsStT0wu3OFH9n9WK+zdRn4ygB3A4NJPD8fIRmtJJcbX9bOE1rcWUGHWkDTuDnnfXpR3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjiRcWaM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so2064795e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101676; x=1734706476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhAQOwvh0yTBK2Iw1/ctnZm/eVjW6CA195nsjVVLwEM=;
        b=ZjiRcWaM9vv4F/jpeABIma6/dlIlMufoHgYfk+nEt2RslFdzxOF3qXf4X3BJ6YkzIl
         PivlRM8MqnJfta5ewko4doBIJ5mMQyxtpgknRHrrsR4VJaoZcBHoazQI6czOWg+RbWCp
         bLIeemLEZ462EUlHeRh2vQygVRxUSIJQDI3JhrjQ+U3Y7gVKFp/3/dXuWxNUojghR06Q
         aPGUugw53vZRmQC1ezLykii5cLfNk3NSygQO4HJVv/p5MHNWIFLId/bzkLsm1JZQuOmX
         ngt757+fPj46thI7rwpzl11PXh+c+Pq3m8whorOQi0P15MtVtYtxmfj1EB704ZW+EXT3
         KMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101676; x=1734706476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhAQOwvh0yTBK2Iw1/ctnZm/eVjW6CA195nsjVVLwEM=;
        b=eJzs8JSxX1nRg1bRpUoa+0v8KIeTlhNUYVawLBEtRuaIzY+KSOh873LZRR3KXKq/Hy
         da0Ih5r26UbtY4gVvhj9I9nz2jahR6tjper2f9ZF0mvjHqRVU+Jw63GrzccRHOHq1URO
         J+IH9XizNPEe4sxPM1WeCiDxUteFXEWafnmm4GTccixlGE8qP8bIPqaUj+HwRTf+9UcQ
         IUVcp1xuq80T35Brpulw5XL5pg2YJwIajKra/hErvndSPyMP7EcoYL0PUYN6o3fisnDm
         b2BMwdFQ2wyNQI08nst/Vtz8Q+1xu7ycUqCprALebfNdjSJlgoMCeMq/XBCd7H3svmDB
         oKLQ==
X-Gm-Message-State: AOJu0YzQg8WopYf8OhS4p9pFindV8IwJZgUzycHyQW3LSyOxXlLsHWAH
	Bfa1ZetPM6v50ohH7jm8oh6sr7FleMX86DuxH2LdgWxU8wWPDwzb8SGlPXc9i24=
X-Gm-Gg: ASbGncuoOUoHWJhtb87pSpNyRU+m41HrtmsSxrla3XO8/azRObDUXse5OnMcNUqQEP9
	LTOpfyBbNrBwi7TeKEpkO0FdkYkj6JEIcXPBlHNzsk4yxAvO+34//uTwFTKohrWGGOvAb1o+lUf
	hflpjhKXTJarbmi6El3JRCDRpaPAIc2Jer/N/a0E0xHwho4Hn01hH9MMFJgE1kFfZ9CJAcZJWnW
	aaW+3Ilk73bfm9/O56Od4MMCEpyssFlFq9zHwpqcCh10nmdYmp9Jiot3bz4MDi99doiFaeW
X-Google-Smtp-Source: AGHT+IHx/j2sBGSnRub+RaGUP2n+gCdzHV8EsieYpm/J/mv+nGk615H2fhvSSXX3qDge72y7X/UR3g==
X-Received: by 2002:a05:600c:358f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-4362aaa1c24mr8899805e9.4.1734101676494;
        Fri, 13 Dec 2024 06:54:36 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:54:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:53:57 +0100
Subject: [PATCH v3 08/23] arm64: dts: qcom: sm8550: Fix CDSP memory length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-8-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t1DYQrTH708HNfSqvTWYh3NTNjncX62oLPLPAgSDGUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqO0uA+9RvgLDwsYaNZDK31gVU79LLlTQs28
 Z8uh81dAyuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKjgAKCRDBN2bmhouD
 1wB3EACE5pokcOACQ8Ys2jLKPvwaek3olyqL1lSuc457zMWt0znZsEPzI3lxVo6h1h7nQ5RcUYO
 CGJwi1K5xOcTvYMOPUP7msmjITiWBvPHf63G2HvBaUv+pp2eB3DTiC32i5ceGTx7k+ieNltHHSa
 BKNwfvQST2XksJz9D9WILzzEvQnD0vesNUIcy988003ivia5IN7ck6hrRhpzVkwCLJkcIapFVJU
 DrNYfDeRYTwXKQ6uJVN5arOTbfZ8cLSvLvshUKQyeXnQtIDWPk6bZsOai1UZtVpq3GFBwmeHoJh
 NeW3NPhKKSxuOru8W7VrsJxKu/q1y2/6pH8uITEON5F3XKvjAgUDAYbXiqANRCTNWbkW3fsLHn+
 lZ24JkIj9AD4/03aOmYha3SyTIvMDWgCR4z2KtnKXg3Vb8xYPovA4WoiBn/CF9daVz3mmdGQpza
 3Xtdh3Bmy/g6zhFDtXY9WdPbRmbe7osUF2ucvQOq4SLEGnEr46pscRRPuYhDwtSp7IovF2YhOAx
 zrl3MPR6dhvTW6r9axr1cnDWFko6dDSXqFVxaeI6PQ6LW4Nq7lSE9WViToJQ3r2BQWyeU5UhMMe
 GYG460f6YxFPMzd6tHWKF7dmICMY3vL+5kppKYUgYsmOkgW4Ln/KpJ1PLWwtAs2gRm6sYGt8GF7
 HQTCLLEPJ9toIOA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in CDSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
copied from older DTS, but it does not look accurate at all.

This should have no functional impact on Linux users, because PAS loader
does not use this address space at all.

Fixes: d0c061e366ed ("arm64: dts: qcom: sm8550: add adsp, cdsp & mdss nodes")
Cc: stable@vger.kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index f454015c5b90c7d792c01bf85256812857d79c64..541b88eb5f5300ef9e20220305ff638db9b2e46b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -4716,7 +4716,7 @@ nsp_noc: interconnect@320c0000 {
 
 		remoteproc_cdsp: remoteproc@32300000 {
 			compatible = "qcom,sm8550-cdsp-pas";
-			reg = <0x0 0x32300000 0x0 0x1400000>;
+			reg = <0x0 0x32300000 0x0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


