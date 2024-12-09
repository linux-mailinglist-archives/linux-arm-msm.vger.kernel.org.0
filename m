Return-Path: <linux-arm-msm+bounces-41113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B189E98D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 15:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26CC18878AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 14:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2621B4225;
	Mon,  9 Dec 2024 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3y7NqoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D351B0430
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733754498; cv=none; b=iT6kmjEO92BkweO8fvkE4etDO8JoFFQ78zWzf+yVy1DlMoZ62DK8MpzQkyEHz2xA1T99XZygGfpemwVC4QhXxWc3Y3A9JywX1n0gVKIZdGBPdDLHL40wFBuhTyENd1SIuytw+RVV0/8VOBXJxTT471lqV75+KfRgftZAFTVnHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733754498; c=relaxed/simple;
	bh=m0JRt1yAWsfjNKbVlgVQYTxcRzJBsIOwhATVf8sbhII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OANriAHq8Mcxyp6m+GGBCljCbIJ2g4LVpT6UpBnk+uH9k5KRTAgGncsfzC9IrTjNg3mfgSery4ac0wZeP6BoKFwjjvL3N+h/a7cBdbCDipyHDPhumVr7skrzmdbTtDHEQ8gDIrwg/J56rcz1iDVRtbtCG/8IjHSrQn4+FCDfQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3y7NqoW; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3c1f68ef1so536760a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 06:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733754494; x=1734359294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpF4sxmPjFaBMoIz7MrnksfqhjJBtk/BSNuz7mOTvt4=;
        b=S3y7NqoW8mwTWrzJenAGRaMoLeNkzpI+9kMC2Dozwo+n3pGcNCafxFzWjUZG7itP2W
         m/ZJwdJvb5TZNJWvric0uGn144GSQXS+tXTLoA3MWDZWD7CZUoMI/hDuEqL0xVLiIb6q
         pvUvmdxqUZNLZZSmvSJEisgnTm+gbM5MSKMPF6wivnZHExIqWBCIqlGkcPDLMr1erhWO
         t7S9X8XEnE8oSoDQ0kZMebvQErTLyWZNkYYWr6shVg6ReAX4vWBG8eU19/cZvAnJhkWW
         Lys80kO2ktgn9Lzf05kCU28HFJKQc5WJR0hLwtNvmi6RS7qiXBfb8tUnYnHCgSk0syBu
         hpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754494; x=1734359294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpF4sxmPjFaBMoIz7MrnksfqhjJBtk/BSNuz7mOTvt4=;
        b=JJhXvjLFrhfswVjZiDZskCXExAc+mc1g+q8WIfnz9c/BqoNFNt+Y8vVJT5VPhVJw+a
         OFyEdpuUjkMkFEJxlWFFpjUe3RqVwbMaMBWT377rwWl/lJTeKcgtWORIc/yiX2cc6ad9
         GlwAABexW8s9R8l4b0f+KwQnAa256Q/4cli6/OHjHTly/iOCKRjUpsZ6CnlvwyKznPO4
         gkTGtNdFYiczmpDjyLwHJYjhnBWxbz0j5x3UTrnL03QHFJZl/DRnMYEWhuI881Bjl2u0
         XhIEvj/+lJ1wgZ1gF86qff6vcNx6/f0txhVjFnZSmXcdCPd8cOsHE0JiCexGzKNiWPTi
         OvPA==
X-Gm-Message-State: AOJu0YxZbzrkgvVfX+gY5yAODWs4WBJ2GntYICfjIT8EkovWNoEO4KwA
	UxNJvWdBinJBVTR+4JLp+H8o/bvK537YPcJui9dygR9IXHZYraGxSVy7hAaQx9ntN0llsB5Ju1k
	h
X-Gm-Gg: ASbGnctfwWagwjtFbXwQNZAUIaIsJSQzWz5yheniBDfqXDS2DhfMjFrOHT83ts6NxO6
	2D8/tMUGhTrELPb4VvXj3hSdMbls06w5IM4YQx62+7guyqJMmY0xTGHPY6weZ9I+213uvZEm/Ra
	mZekjYLtvlnxk7Vqh4ce4yqlEdwGQ5kTmABGLXFH5JM8gQPqiYjMoYuLMEzezhlY1hkxXifHwTC
	rhRMOwY1Mv/OKXDRPzmQF9v2v5cyS2PGzOcos8w0qi4IkcIMT/+YNQtWwt7/w47Jw==
X-Google-Smtp-Source: AGHT+IG6hfXrt3hvSblfYqRULX6DPNyKDKRfmtd5xsNKFaYDrZhdtBXI/mAT7EM8nZSdNRA5dztggg==
X-Received: by 2002:a05:6402:51cb:b0:5d2:7356:e0f4 with SMTP id 4fb4d7f45d1cf-5d3be6b1320mr4599602a12.3.1733754494536;
        Mon, 09 Dec 2024 06:28:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb109bc9sm2887141a12.42.2024.12.09.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 06:28:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 15:27:59 +0100
Subject: [PATCH v2 6/6] firmware: qcom: scm: smc: Narrow 'mempool' variable
 scope
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-6-9061013c8d92@linaro.org>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=m0JRt1yAWsfjNKbVlgVQYTxcRzJBsIOwhATVf8sbhII=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVv5yGQauxg5c5bYfzNG8tu0ldbo/Dw+zHJn3E
 83ron6hYf6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1b+cgAKCRDBN2bmhouD
 17jfD/0b/dA4aucjMR6lx7H4ZacY5FDvdKUBfKGqITx0jWDckMCN696DAGVLpTk3mGRY6LNui/y
 JwRjzqvlrzdveRYAUulCfB/d625LkXA2MpCI1+VW7PUISAL3jW4Sjk0vLzB/nNd1kG9fYflVaSM
 2BbhOoOs2SWQYJGcec0a9/TtdWMS6ZNDPdmEFt9hsoQuuwf2VTTrevsByU28FN7lL/KFIKYGdiQ
 GKjdTZuE5d2QFVS0NBtSh7mt+0VXLdPITmi5J8P47x7ngX1tf1Tlam1Pda73rt8PExR3wU91yhG
 mpBxHwaS2944mHAaErzIJ1vuWIQltJrfuAJth6BcsVLH84ODKzI6Tqw36WrazM0G85GbAvJzpb+
 RKwCCGn4aQjY1SmXyNEw9XnE5mmC7TX6iD1nt6+osQJrSs3car6kEqkwhhAPWQkd2kZoQIn9bgT
 Co9xX8rYYznpU715mSPXpY1FgRhJgioJH0WUVh4GbasoyKcqWNQplm9SAKfQqD5vngrqfFSe3fm
 0CdJGE97KP+9l74F5nUTB06EYh/3tnpf479L88LeeQUpQjxFqsGoDD6GfV3Qmvk+SqFncTV5LJo
 7BobCjwgBEjcwqeHNK3VXkxkEedhrYEjwOVWT0N3qJdPpHBeVKytO+e31lJFVDGLShZbYiya58z
 Tma8ut7loh/ywTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Only part of the __scm_smc_call() function uses 'mempool' variable, so
narrow the scope to make it more readable.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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


