Return-Path: <linux-arm-msm+bounces-38400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8969D2E43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF3CFB39A20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 18:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BA61DD885;
	Tue, 19 Nov 2024 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7gJwu+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A851DC198
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041228; cv=none; b=kQpn4jWt1s0rE3fdFzNO34B/3+Cz4SwEYA5Hi5GNSHFwWSk4UohnK9JitRyEQj6xp7FWiDVXgWSeCALZRce5IXpek7NQ9PfJB0ZC1NBJRS/qv/Q9n8PIOuCAUK5/Q/qnitE3YQe+6wmVVaOakYE8A7MMZTxBdtcClGgNHXiPoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041228; c=relaxed/simple;
	bh=5TLlUUFMlxVBRA9LfgfySqW4/f430JBLZVgZXAnTFfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sx6ek9WYbYb2I3uOMlPHMlZ8k1P1u2pQtDgI6/q6D3JQ0ngkjBI9YGu7uVTNCg9xfVNK8wAPpbahMwvUHW/cJY58fYYsIvKwwLVX3lPKEBmvWk/akOEfDOXaIuZOiGYryoRHsY8iwJJObY+G5gY+wnpEKsIDm1p7IJ2ZsAIDRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7gJwu+o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43159469053so3484275e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 10:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732041225; x=1732646025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krw1ZM4+VGT72qR1TvdXm8jH8NeT3h/uE5f54vAoMeM=;
        b=g7gJwu+oKeRSGGE9X8TsprElghS+LoJyAlDHbfOytpT9fu2YTbcx5qhAPBkJwju73W
         pFTd5JGLq/C+1BLrDL0FqMQ7gL4qzzIeoMhAmDgcN5kaBlu/tJIiY5aldOYxYMu7YyYi
         lxh2aFnCmDDKMTUzitGT0/zDV7Mj/mrctaFd4/onG8tr3/CwiZt3N+PCxZuItaFgZ0Fz
         33s0kYvw72W3s1+0703gi2rmY/tmWqMM1nEOkYrLjPqxQ8UYc+BXWpeyO6cO/WJdvjQb
         u+uli13+BjzTm2tXwE5rz8axfNnuOxUaJ5kpQzg23w8wAOhChji9reKRdDDFokKTp0DN
         oJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732041225; x=1732646025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krw1ZM4+VGT72qR1TvdXm8jH8NeT3h/uE5f54vAoMeM=;
        b=jV8ag1dEbN8bvuFKqzdVSupZdYzbRjLyVYmMbkjmeeo5h//ujxjzEsUkmzcOE8r5M9
         SXr0B9RgETpy6iLGXeOFpb4e0NyLjy+l5XRriuYXu5dh7DSt3foxcaqKA6QHD9JOP2cx
         dhvvIhACEdUZqJooDAvrb61LU4xFJ2LXAVvSFRk5r7tzKO5B2/QhocxV0f5Fc1VR44BI
         Hj2NGnn49k8Y9RYBU69RSwPMIh7k806AANU7ZfzVSW1Ng29x+FuQFor3yoKvTH4xIO1w
         DLfbB4ENa8CHHCeRzfIrgb8I8ZZ3UMCuLmAq9WoqyM54RKtYjs2XbmxU/uuDZaGkE70+
         SnNA==
X-Gm-Message-State: AOJu0Yx3HWX1kDvombLKPh518oXhs410LsbnILi6nEw19obS64oGxPpD
	39o8kdEc+nFuPS/E3pmfKC/cazun7ETMI+XV+n0jm9+eIJNk4W/AHxseWXc4CSo=
X-Gm-Gg: ASbGnct0J8WDTwG05n0IoBTrlyzWLNx9817NtA6DPWsLdzLVqTitTxDhGTgV6/HjtUI
	sEvVd/jXFIBQan6nvJk3ZrLPMFJNt8U91bKNOAsrs3aZfuTQKKtg1Q69yXonLoQ638nlCwgsqyf
	DorRlWzg6jfdclY98sFualv1v6Neku+20FkkqmxCk88WJc/j76BITs/bbeiAuiSR73B+5I/8gEW
	FvlyCkdLkpt/TEfEpc2wOGYc3deUy8oJk6eiF4jbDmIVceD4RITgRL7QK1+DgU5Yw==
X-Google-Smtp-Source: AGHT+IFKsT1DiSbpf5PXE5z3Wd3P4fsh4a8OVSAGjFSsPxYJz3NDmkZpyljk4ipR8meIpqAZqRhrBw==
X-Received: by 2002:a05:600c:1c1f:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-432df790752mr64864275e9.7.1732041224946;
        Tue, 19 Nov 2024 10:33:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac1fb7asm201566805e9.42.2024.11.19.10.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 10:33:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 19 Nov 2024 19:33:21 +0100
Subject: [PATCH 5/6] firmware: qcom: scm: smc: Handle missing SCM device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-5-7056127007a7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5TLlUUFMlxVBRA9LfgfySqW4/f430JBLZVgZXAnTFfw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnPNn7FzUgjn+Cac29NIvPhw3hxDzi8lbQQrhEq
 VIrozZ5IZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZzzZ+wAKCRDBN2bmhouD
 1+pTD/9arhmbhIWwWWeIpDWqvzkFts1PjFJXdAfWSCfH3WDvOMhlhUTREATysuQnrP+DCg1E5rE
 jn1Ul1wQYfrMk44pXbDOozHS/vIer8FLRpaIMNYBYG/jsrgefeIBenN6PyMh1zfe9edb5GqdVNa
 G61OkT1aFhQEpR3gK0RFDNKcM8P1tU/pPs2f1WpBaM4GkVe0YDdvHE9TRritxqkoWHpKKiBDm7t
 pq96rTJp9h6KbUVAQ+GwMBhGaCiVtMzcaaV1ddAEy+H1kOae05s1QL4718gvvHQ/sxEpATbgLUF
 gCVXLlAPNKi+MserPmxE2e9t8wnSCqe3CXUE+Cy/jCRABUVBJQmsc+XQ9rXw4PXhVJ5ujm+ffmP
 JfLI359OrWOQCC8l6x05UPbaaLjvt36/4oY2X3o5ric8W/Jtwo4gyQx7LguyogZVh/LjT7wyE6q
 iLWifBHS7WhuLTVf3JQm/K86y/QCNMo9jA3v/dDpFogN2NFyUwVbhgiFVuTW/ky/VSnj3CM40dN
 5amoX9FOtnsYuPkaoTfhREg1eMiWKiGdLxvorAPAx1n6BhPN9soE9/FBaum1wKtQxOrsIy/XsWx
 hEpbnVwIm41Do1fgmED9deO87p63GL08bcH5KPVRbaXFvliGXNh+Jt9qWZogi3tSEtZX1TLX2tH
 mzq2FHLKiPof37Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Commit ca61d6836e6f ("firmware: qcom: scm: fix a NULL-pointer
dereference") makes it explicit that qcom_scm_get_tzmem_pool() can
return NULL, therefore its users should handle this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 2b4c2826f57251f25a1bc37c3b467dde28e1268b..3f10b23ec941b558e1d91761011776bb5c9d11b5 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -173,6 +173,9 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
 
 	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
+		if (!mempool)
+			return -EINVAL;
+
 		args_virt = qcom_tzmem_alloc(mempool,
 					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
 					     flag);

-- 
2.43.0


