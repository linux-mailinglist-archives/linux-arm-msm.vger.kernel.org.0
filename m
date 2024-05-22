Return-Path: <linux-arm-msm+bounces-20213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF98CC04E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 13:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7A9A2836E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 11:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2938F7E776;
	Wed, 22 May 2024 11:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQGq+5a3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705812A8D7
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 11:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377632; cv=none; b=hjN82A6JgYKt+Ofu92E3aTCpxHG1qDgGLkED3goe12EnJOQMO3j62I0o2hIgc0dkK0QW1etTbOWJE87X5pxGONWpS9hV1T9ZgejNkTa0ULFhYN5Grf9i6BiQon2hH1iWH1JF5Fg2simbB0ymM3wzQj49PPvpa30PTDFAl09k/Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377632; c=relaxed/simple;
	bh=nTvlfb9YGnNTKN6G+RLS44igQJv3ipgoswKOLp1f0ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pCbQTrLwUd2Q/ThWW9qhlwKrpZdZJ8oFZkuCSgk+T5EV9GQNFToZysq9DRhXlqPop3OxW6M+ErIZBc3g1XsyifpS1sEwzn6Qxd+XpQPrG0BJRumxdseEnaBzotsojWN1jKrqdNuLa8/YGxHNl4/rNxTtjQA+na+fXFGOISIxAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQGq+5a3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59cdd185b9so163738966b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 04:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716377629; x=1716982429; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cRW932voPWIlMWkxCkJVneBFSVf5edVVWFRjcR0MAnU=;
        b=TQGq+5a3lxQWfohysyGBcIiJYzGE1pqxbNHhDi2IpgH5lmbjgEJBVKB4Bly7OQtkZu
         f3HkybCO2iPYLIRaiQdQ3grEDWJwGWVCti2XRs0oLnPOnSHzk4dqvKvKP+DQgYt+5fxh
         RFAiLit0Z6Y2XEqyzoZqqDxZw614og3I0lEKKlXH6y/PB4eszeinMKtV0xm7aNB7iGgZ
         XGizzkV9+iNajg8CxXovJWRTilnEBgtEPb3t6lZI94MaB/1vyBF+1z/TKKc2YxYJmNEc
         aMvO4uGV9lqMwaemfM4QX1W6E6TPdEfJCk8sZ37fgWC820ArJ/McWi1PNk4Peh7wmsTq
         pZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716377629; x=1716982429;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRW932voPWIlMWkxCkJVneBFSVf5edVVWFRjcR0MAnU=;
        b=KOAfP8vvjcIb+3ZB31uTXxUvoRjuZUb+yYWXpKzuJXw/bFspogtqBk+niJdyAh5BUm
         VYtEvSPi//hQ/gNxwThg2eLZ4GZWk6JaX0kgQd6CwB5I7tYHUkCNADAu/yFdmrzS2csL
         4uONdoYMFvtZrfkALtiw891tC3SrAmk6dxAjFESS9zE6yj1/N4llzx2gCbV6YBX1vtuu
         sTyVEls+CBfdWLxWlbJ18NFE7c9Da5t2uaCGPk6BIqrL3jSNN7PPD4t5N4hwBiIBOM8t
         q7SV7J/Ks53VgEAf5QPNSEVEszXNPsdiGtfnXYw7pt/JgjDuzNCdX5+AVPYmC8+Mf2mV
         NFig==
X-Gm-Message-State: AOJu0Yzzb+UgRVqJId73kjA/5b/tSrSwD7dpX+y7WfcY7ybT42tKCRD7
	Ixi4cpxiyKrByATBhJty4GX0pJE+700RyH/aPWSMOFqFOdpfhJ6fWAHNiFDbn70=
X-Google-Smtp-Source: AGHT+IHdFu3XoWK3DJSSo9+7yDuyrUMyNNW6xZNAHXCMupaIHhESb4rOw7EWexdU0Bt1/PvMFRv9rw==
X-Received: by 2002:a17:906:7c53:b0:a5a:3908:f4ad with SMTP id a640c23a62f3a-a62230f84a1mr157277666b.10.1716377628873;
        Wed, 22 May 2024 04:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:f41:c55:53ae:4d0a:75f4:a9ea:5025])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d2bsm1748202266b.120.2024.05.22.04.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:33:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 22 May 2024 13:33:43 +0200
Subject: [PATCH] soc: qcom: socinfo: Update X1E PMICs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-topic-x1e_pmics_socinfo-v1-1-da8a097e5134@linaro.org>
X-B4-Tracking: v=1; b=H4sIABfYTWYC/x3MQQqAIBBA0avErBN0KomuEhFhU80iFScikO6et
 HyL/zMIJSaBocqQ6Gbh4AtMXYE7Fr+T4rUYUGOrO0R1hchOPYbmeLKTWYJjvwXV6Nbianq79BZ
 KHRNt/PzncXrfD9Sh3HVpAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev

Assign the correct name to ID 82 and fix the ID of SMB2360.

Fixes: e025171d1ab1 ("soc: qcom: socinfo: Add SMB2360 PMIC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 277c07a6603d..41342c37916a 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -133,7 +133,8 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
-	[82] = "SMB2360",
+	[82] = "PMC8380",
+	[83] = "SMB2360",
 };
 
 struct socinfo_params {

---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-topic-x1e_pmics_socinfo-30462d186a86

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


