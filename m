Return-Path: <linux-arm-msm+bounces-41037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21D9E9300
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8C7A286DC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C327F22145C;
	Mon,  9 Dec 2024 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6JsH1GL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE800216E29
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745387; cv=none; b=f6j2skYNvLDzB1aCfj5pY4vFHbFCjrcCAdsnyJWCP09j6lyRncnjN2cA5U3dcqZXJUJz07Uci+DMAN1yzy+CNIBuYJeIugsazvFNanaGRARSL+uTiBf2EVSTOSRE8VvDln7Kb0OPR+xyfbgb5lqyShMchnZ3JDU7vqLkrRExbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745387; c=relaxed/simple;
	bh=0LO2zPYAqi4rqcBhiJ1BLvPKoKw9ftNC08/t+0RUAyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgLWrVrbbjQvly5cehyurokOON7idEZw40BoI42pswocEeFzFN5k2WW6+xrSKE2KO8mcP1cYKkpli0Y+ca5JX8BNOzJ9IfkuLCLSkXQ3KytQqIAepPIH1Q8+ZaYpYzHQCMkNUg2fY78iQRKakGBwKkw28A9g0++Rcq9Vb5RrL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6JsH1GL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cd8e59fdso277747a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745384; x=1734350184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Useh55TM0tjeQrnlgj6s0Ix5hvl08p6sYbXbXf2KJKQ=;
        b=X6JsH1GLHuoe6kfgGxVKIvfazeDh8iOL85QGHntNsMaBLMUmxlgyTpfb4mBQee9OUK
         JfO2SL7OxbgJDCbj5RwzwcfkJbwZjW/rNjO7fj7YNqfNBzwEy95ucNsPiDBCfdkgQq8H
         B2rEnuByrFrlaBqZRp+lJpl+FQEXp4Q4VGHIuYH5kgCrVszfHl980j69SNaVaxcQ4iO9
         P/lwNGSNuIEzAGR2SeSwmSNQHEdkqPjsqcmH8uIVJ3Rd3ZTRjTwdZGmpAN7oPjd6fFiO
         DbmIEL61/1AqKEUvXrr4075OWj/uFYvQXXk5EhJdNPhwcyVmRmG9LVTsfo0wpjNKiUZa
         gWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745384; x=1734350184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Useh55TM0tjeQrnlgj6s0Ix5hvl08p6sYbXbXf2KJKQ=;
        b=WFZml5ZTFGlRqZohgGe6W+CkULfhBJmQ41hk4y4jtP6jGk0kVYuV2AlU1GhuoxvYdW
         mHaqwZXxVicCJAAAfObcHeQlx5pFfhE9Q0kuncnTI6wWRk644Khdxi3D35AIleMqfCAQ
         jImRGwEnqKO1YVjo4lppDQQq2KuZo6CpUDp915AXoUGx2UIoMursG5obh9LOdZwPOIj8
         5OqPjleWixRJHUhN1fG2Ab8JqNCDQ0C/Y6Cd4+9rsqtMXP6hjqgP9upeblnhKIwX0D6H
         LS48FWbMKsEnxG9WN+getxd0fPjqoOpmmUqmgnfV7DDnc4rIUEYwiZqrsUDUdisFheeS
         p4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXdAvSPUBC/GNBu+evRW286KMSHujv6Ft92OQAyxKi7RodEzo5XJHNd5KccRmjgYEb7xYXO32NZbfLcbG08@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoha6qercZIp17SS+hbqt6mVKdcvv1fRz9KrrvyHqs0WSWQbt0
	4WUb0HWl94Chm9Myh5SD2RyjiglyD3BZT8tFU4REBnr8+5zClVc0dg5SUAOPEBQ=
X-Gm-Gg: ASbGncv2UCF/uaJBt3F7ndoUC7Kt0+s6Jw8fn22INjiZEbRQiQXwj4KWP35GbiJpy60
	bUBP5uH+mj4iMj3rSeazuJVRRulsfbLkDZf8uLQr3BjVRq/30lWEnqLz35LuIhYr2HVarKZeETm
	8fWhWDbtgGZW4+f+rJd8cGunOt5iK78ueMjunC0FKzxr7/KKgIMhA4yF1es0SXzcIFX8wi0vm6J
	yzhT4TzbnqYyijt/d9EmqIjuHYSyhqqoCZEv8H+fL8pOltV10ARuCGTr7zNAxey
X-Google-Smtp-Source: AGHT+IFy0QEwd71L8F3WWzjmNnwcpld/A/VFpC2mWyELkqnYLuwFzGiop941yEx4OjXTcWiq0BYq5g==
X-Received: by 2002:a17:907:7d8c:b0:aa6:9b81:e7aa with SMTP id a640c23a62f3a-aa69b81e971mr17438066b.7.1733745384224;
        Mon, 09 Dec 2024 03:56:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6651c01c5sm343333766b.23.2024.12.09.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:56:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/4] soc: qcom: pmic_glink: fix scope of __pmic_glink_lock in pmic_glink_rpmsg_probe()
Date: Mon,  9 Dec 2024 12:56:10 +0100
Message-ID: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File-scope "__pmic_glink_lock" mutex protects the file-scope
"__pmic_glink", thus reference to it should be obtained under the lock,
just like pmic_glink_rpmsg_remove() is doing.  Otherwise we have a race
during if PMIC GLINK device removal: the pmic_glink_rpmsg_probe()
function could store local reference before mutex in driver removal is
acquired.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. None

Changes in v2:
1. None
---
 drivers/soc/qcom/pmic_glink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index caf3f63d940e..11e88053cc11 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -236,10 +236,11 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct pmic_glink *pg = __pmic_glink;
+	struct pmic_glink *pg;
 	int ret = 0;
 
 	mutex_lock(&__pmic_glink_lock);
+	pg = __pmic_glink;
 	if (!pg) {
 		ret = dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 		goto out_unlock;
-- 
2.43.0


