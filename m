Return-Path: <linux-arm-msm+bounces-38401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F69D2E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7A51F231AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB361DD871;
	Tue, 19 Nov 2024 18:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ED5oRwHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592761DD877
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041234; cv=none; b=N6BRSrqowBGjrV26HG20sOKJU+gxQ9fejTFn6SjHjFBKa8RTqK+NjKyV5bD13unEacdfMvIhykehZ9TfGJK0yI3q/yE8M13KHIpGN58hD0kobLbxtDBZi3+/rhpex28rNRMgnJ6iSAtdbUkFXlrT/hmdBwmMRBaBZOuuGYI2Md4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041234; c=relaxed/simple;
	bh=sXmaBm/EfJtd8mtGNHFuhr5vkWmohAC+J7HluLurjEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DReNqXhMovQyDEaAGJj4H/17Ch0u9eyxIaEVtpkwaOKTSuhUYo7yiuJzVktQ1sDCYCKmxbPuDPvKRl/rk3BHk1+MUNsAUMIGR3aE4YvGLcboTW+Ge10CYDg+UUbuo0KrQrgPdkhl+OpLxbbDc+OWoq6/ETIoYdGOJel0DBSIR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ED5oRwHq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43160c5bad8so3484005e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732041227; x=1732646027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEuzfplamO9MTc2aT52efgHBGucpvCvsmLRhDItr6G8=;
        b=ED5oRwHqp5TEGbotiLV9Uwg761XJSc8rW75PvZBrwGiQw7evVq9658JqyiLTcE7tH7
         NF96BgtICU4qN3A3AY3CT023aoc70lO/C2ehdYXlCOMHuK0c6lxGeskml8ulYA0tOS6M
         Z6lQDArOKR0iuLOP6y3h1qDE4R5JcsxRMqI3S9FSyVep6ILGvrknPozguGyeYKUYEYLf
         byExR5K85wu2RQmdNnzypP4+yssfn2J/n/f1jqlk4eFXLBvHnCzUzAIjCyU7ZXYW05gZ
         2C0EvqfmktLQBPYh0/+iwVKA7WdeRVLrr+EVW7OpHI/SKB02d7WW1FfVmiypPBAG9330
         VmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041227; x=1732646027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEuzfplamO9MTc2aT52efgHBGucpvCvsmLRhDItr6G8=;
        b=UEMqKXYsmHoSdiH5vkj6GdZ6lR46goxJ1ae3J6uTr47KYFufoLetrOx/O0/hD/Genc
         0hVOf4N/0xSF+gN/5jvfhbS8OCtWiEeCJq0/9XMM/ZIZNkNYXJtTX/dSyE0wb85p0I/9
         X6LrmAKqR13zf1c+dpKrRAAya9DziRM4KxJgjcNH1vQbDXhORcQBljrddnciSrlWwCwF
         JsmBt18ktS9hhtieK96yXyoF8KGseC8Q2mKhpxYGyHelzCTal9/vxooO/iAo15tJNg0k
         iY9phnyv0KnI11K2XflsYtLP0wa1JQ2wcN3/zSQY7H9U5fDCtqqYTdwROQKpSNBNpaSM
         V4Mg==
X-Gm-Message-State: AOJu0Yz5g3p8BUocXm/AAsKqDzCW1YRPhj0+VhFM90snmIdXLCKji1u5
	TQcrIKXAMARdx4zHE51hO9Yj5jVIvwuNAhDmisJNrC6YNqUeGjv3PtBfpT9OrFk=
X-Gm-Gg: ASbGncsai5g1Qe3MSYSC57hIKjvxqUr2W1CD/OwGoYc+ZpcpI9xxw5BwVBZM32VzgCH
	LErSU8hAaRbffEQeo0vG1lTJcyp9u2TBdOGMZyLMMbTnicQmRhLRmlZw/1WXmanhbvK4HdIEpkZ
	HGnl21VHGpTlnbU7gafhh6ElluVcBwAYzY2RE/9JiGlN//6x9mLy3nuwvBjIT+IPBN1+9p7tUaB
	jFhvK6eaUxlicCHHAJaeju/+0fvfwkg1gjz0IUonW5i/v2/P7j/q5Xoyq8nFz7PSg==
X-Google-Smtp-Source: AGHT+IEbHBp77Yd6c68qIRswrIHwNemz/LP46FQZao0WEifvrkkZhQW6J5+adg160ciW6LtYS87ayQ==
X-Received: by 2002:a05:600c:4f4f:b0:42c:bb35:b6d0 with SMTP id 5b1f17b1804b1-433489861cbmr48655e9.1.1732041226661;
        Tue, 19 Nov 2024 10:33:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fb7asm201566805e9.42.2024.11.19.10.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:33:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 19 Nov 2024 19:33:22 +0100
Subject: [PATCH 6/6] firmware: qcom: scm: smc: Narrow 'mempool' variable
 scope
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-6-7056127007a7@linaro.org>
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Kuldeep Singh <quic_kuldsing@quicinc.com>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Andrew Halaney <ahalaney@redhat.com>, 
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
 Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sXmaBm/EfJtd8mtGNHFuhr5vkWmohAC+J7HluLurjEY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnPNn8rIB+XBSdKxZJHA0MgPDAuwj/K2aS2hOzc
 gDc2EAOQcOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZzzZ/AAKCRDBN2bmhouD
 11WiD/0br3gwbDJTHdnKByah6j9dURjMn3ou5Kz8DxwRZzqBfSfwonWfwXuC95p/xgLY/gAx/6R
 ytsnr6GGMaDtPH+djW51iLom1RFxUL+clgh7qe+6linxTxP+ZLHzFuvLRDxO1qZ8zNG0XlAA+Dh
 fBN+xjNW/tcu4Rkl8W96g5bJJNarojOtJrQNyz4w44rRTIA+ZrfTZ+lHqtVr5Kqsip17JllwRvx
 p6Xn8FMZMLnX/0D+1NjUvNBHQcRAZOjo1PioiGshRVuqh+X0u2BY8Qlgo5AH3v7Ax17jv4nrE2O
 QyxU8v3FnvnHxTZ3cjNY+k+l+4q5lN79w9s51FNJBBehh3BAsL8OekpRr4dEYu2OrLasQvJzQqp
 hc/kwvyiz5oCsMefFJjtyz4zaPJ5lD0+ZwcxxCRWqrDrhApZguP+krdtZ2vjKE4Zzh4E3RmIfFs
 KhZQvKFqFnXaFI1mPeYB/ttbivht5/ZVSYcmfUhS0Gs7qbqqim8073JoeP3KRZ7prrChSDZ/7C1
 dvuFLmqy9ws/1ESJuZtdkh+FahWPtrU0yVvRnYLA3V4ayS8YKdxsdRi5owtV1jdmoGWH4kpBDLA
 SoWO6oVl5bmFruHPZm1cYdSOs9A8a9RpRZk10ljty7kb/JrlzuU970/45NWZLk7KLW1YWrXkFlq
 ycJH4MySyymhzHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Only part of the __scm_smc_call() function uses 'mempool' variable, so
narrow the scope to make it more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 3f10b23ec941b558e1d91761011776bb5c9d11b5..574930729ddd72d98013770da97cc018a52554ff 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -152,7 +152,6 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		   enum qcom_scm_convention qcom_convention,
 		   struct qcom_scm_res *res, bool atomic)
 {
-	struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
 	int arglen = desc->arginfo & 0xf;
 	int i, ret;
 	void *args_virt __free(qcom_tzmem) = NULL;
@@ -173,6 +172,8 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
+		struct qcom_tzmem_pool *mempool = qcom_scm_get_tzmem_pool();
+
 		if (!mempool)
 			return -EINVAL;
 

-- 
2.43.0


