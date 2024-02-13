Return-Path: <linux-arm-msm+bounces-10870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A2852F36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 12:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A541F2409F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37A854BF6;
	Tue, 13 Feb 2024 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQHXH/Nu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18B3D54D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823346; cv=none; b=OW88jPjnjO1Jnx52AYei1MXV+HIRq17cYz7hokNxXalM7QtmJyFMijpJDJXBBVw6l8C1gtpK4GHsuPrZbMnH0FKPvGhEv6TjROtpyrvU8SWqqzb5ietSjs8Ou7cvsdws7Tj9PZRKlTAMAq+Ynqo/v2etrvSpoVoILK3MVIK+8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823346; c=relaxed/simple;
	bh=Yu/LzOcQdCwZAyJpUXbklqudqrQ3EIxx4vsAwegkqbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OycCEMhahgtsS4gGs1t/ITzfX6W4yA0gRcIczz2by0TYTsH8lzmyukcZEObulL8CNrBdrQavSffYfPuye7h7SRxhYPVQO1tJuf2CJGOdrMDAWT4fnTOUlv5UvRkLZQr5DBFLFBSGJLg3IPPLEXnlco2MnXwGnDAixZ0evsOMA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQHXH/Nu; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d10d2da73dso4028141fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 03:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707823342; x=1708428142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb+Sg+PuMfej4JlBw0WjutTwckzrP3l1xV8RqoQLreY=;
        b=RQHXH/Nu/ch/iaDc3PXVwQFB4df6CEZvo8a9/KuMIRzx36tEW3Cq/ZJP5L3Ose0kkg
         LR7mH2RQ55XHvMaWhbsBjFI0PLMmlTq9/DxcPcFK5Ae3EOMviUTeYwzMUh4+SQ3w+AV1
         lDDWT3Viowhz+tGOYY40usva6me6IRMCghP/8v22aJ8q+uoLvpdd8oLaRSb3kdLzNMLc
         WPrMGfua6muDTu3IsbEF/ryn7iPUYaVai88nX5Z9G+s+97UDvG/1Bjyq27Toon7v+AhZ
         pIzPU8+00CrAIh8MQOcIpr4/3ojfnrDHFxw7YKS7/BcR+K+/SVqisCjBmqELNsjaVHU/
         sSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707823342; x=1708428142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bb+Sg+PuMfej4JlBw0WjutTwckzrP3l1xV8RqoQLreY=;
        b=XROaVet7HyhKAQQPYQRjq1R9QoTIDTAYUIxr2CQIn5r71z1rnPMGszmMojve/oN1ul
         T3oR8Sf4+tu5yesdLsnna1qo/w+tjWkLVIUhZhb6VfDKizVhJRxb8lBkX9IQQdeUEwho
         0U2RKclMTI/94Ie0PImREoE5HHxJ2ssK5QzgIDTQW76HJtQ+zZmvcDsYRToIPRjGs/gZ
         o3Oxyb83uFCqkUae7XbWpx+oVVXBkTjkztWPHbjvPryEFAwDl6uGfuNWbjb4D9kaUr4O
         JsIG8dkfd4fRZZa6lrAFMbhXv918994wt9W0/45OCIF0ZpSa3Y/JHz+RSqtaxIVzJCjP
         ruAw==
X-Gm-Message-State: AOJu0Yx06GVIFhe4rEHD37pe2O7Z224lxPhLfzYQKg6VNNVii6Rdm1Bz
	o+5pS4mK9d/x2cuyZpm+q9YlCifpzvcDfXrHTA9FVvBb7mTXqEqnGZiOxAipOKA=
X-Google-Smtp-Source: AGHT+IE+F+GH0eHvaxTgRSJ30Bbzk/a/oRD+qe1b1GwV8sVi6ww2WJjxSYqHyiTeJRdZY1CYKyG8IQ==
X-Received: by 2002:a2e:9218:0:b0:2d0:c176:ebcc with SMTP id k24-20020a2e9218000000b002d0c176ebccmr6869776ljg.18.1707823342631;
        Tue, 13 Feb 2024 03:22:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfc7mNlNAD6nTrLVOdnoospwppKVYBYvZ+t2bcQynOTbg4Q7Pni4pV95W2v5kReYQd08uv/mSbLMB9neil8POahVN6KfKKXnMVF62oqpaAbRaVrU5w30SRBhiCod348+hGRklx3gUQ04bHdBIl1BTkAi+bQLuuIU27mMZH9UBjrbU7OsBDBmJ4k7eof7HoE6gciwdPd2GgNDUghn9tOZpqstX672cbvqr9E+em6wWtkMiHJ1Nkv3/SkfpCgO4QqTYsbBjyEkx9Hh7ZcHwTC9Lq/jPcNTPsR3BIje/rgL6a4LBwAXarAiCPix7Cdf7iu0bOIotSCU7VKmUXlwqf22Fv8VClKwuq3Q0h00K9Nxw/UG4wX5gKjcxec1zmzgl/PdQix8iqfS6tBMa3M/1GhUMtPRap5wxxJ8/fpAAGlCbN7xc+oFDlMQ5emJ4sbvl4dquGhkm/tHOJvChwOvTxSgXuKAQQH3VF4BwOR91mpZ0HCJ0nL+rYh8g/oYlyAX6/6JOVCm/WRCEctGPyUyrPJLrK3mpHR4zQJ9H4j51cn/gwR8orBqWma2hXnBCri7RxUhKS
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020a2e964b000000b002ce04e9d944sm451107ljh.69.2024.02.13.03.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 03:22:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 13:22:19 +0200
Subject: [PATCH v2 3/6] arm64: dts: qcom: msm8996: specify UFS core_clk
 frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-msm8996-fix-ufs-v2-3-650758c26458@linaro.org>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
In-Reply-To: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, Can Guo <quic_cang@quicinc.com>, 
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yu/LzOcQdCwZAyJpUXbklqudqrQ3EIxx4vsAwegkqbc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBly1Dqn2+zx6i7LHuLUU/Je5m21KC2vtMGqJSUK
 6aV5DBKBy2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZctQ6gAKCRCLPIo+Aiko
 1d6JB/sGi8mxyK2NqYew8InH8n0loFnN3a8OcHKYSqeZLMUyCYkZsEHykAL8Jf7/mcH/5004XoP
 p1t7f3UU3B/ilNjxaB2aYXXw2Z0zmlXP0X/M59932ZZaFJB+KoEY8RIcqLgfFwts4Pmjvu57zxD
 ggIriyUHd593xs/Beu6euhMKaIqwVYiOJ1kkWeVr49hB9uQpOjVAdxHS7zZXMQ4oCPy5wm/14aL
 cQyYxILvsjiiEzCrUF+Opt6DXZvB08uVyFQeAN81sWspDtZF4F6QPMwirYy3MTq2NmnJxFl6nzT
 g6AqVLvxSEK+Q2iKxoUUaZ76q5pk++zHuY9GnlfrKIhvifVh
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the example of other platforms and specify core_clk frequencies
in the frequency table in addition to the core_clk_src frequencies. The
driver should be setting the leaf frequency instead of some interim
clock freq.

Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 80d83e01bb4d..401c6cce9fec 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2072,7 +2072,7 @@ ufshc: ufshc@624000 {
 				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
 			freq-table-hz =
 				<100000000 200000000>,
-				<0 0>,
+				<100000000 200000000>,
 				<0 0>,
 				<0 0>,
 				<0 0>,

-- 
2.39.2


