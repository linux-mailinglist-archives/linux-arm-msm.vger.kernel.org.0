Return-Path: <linux-arm-msm+bounces-45043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C4A11227
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 21:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 675E7168BA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FCE20C464;
	Tue, 14 Jan 2025 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjwFKVoe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172320B80A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 20:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887013; cv=none; b=AI+h6pcL6xSFuLbyshXnMMK8UE9GbjMVJfbAFc4DdorkSq8a84GZHZnv+7dznvZSE+lk7E8i6uH5Ttw4U3Q1sqrrdN3Qw/59Ez+9b8PYn1bUWqh9mFc+tEvW8KcjAsRyYHk0Yg76hX4IFfUCOdT0o6eU0tPS2vYEnvLiEhMKtFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887013; c=relaxed/simple;
	bh=DBlRzvTLswFCm+rfKv4D6k8mA3vi3W2vtOEjVI5j0pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LK2FMBvGGTZSzHsw4k0OHgHa4r/DLl+y2BmrCNTTkSpPhGSMuhJKvJhh53xiSlQNS3csZixgIITo5qdteB0D3sVVV0dWNUExqNd1HNbFS/9sugO8wOwXWNlM3ClRbJdFF6sAcehzsdp/wzGkecpQK+QIXfstSp5dHWweemFhAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjwFKVoe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43637977fa4so6435505e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 12:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736887009; x=1737491809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bAvYGyeFu8e281JGlOSAn04kCJpvUAp6RFPN2J5Vh0w=;
        b=GjwFKVoeJtBuo8Y5ezIltmOwKNlLtw0CgqEsDYT9AbJewJULGMcSkvvs7/GDCp5I1V
         GICOq1jbp426O2xi4QCyVyEj4TYE18GmaMV0Ee+mahLYsUFwAO5YIvrXunTH5RBaULIg
         zsxjknWVsIaOJh0ycP5M6ryN9BEU0k74JZruh0fAKZ+zFspzvGOwZ2PSIhExBkPJgXag
         QjWWIwM6VOXzO4cC3SVemy0hE46YMIuC3t1eL2CSUdBBWgg4zQ/IolhA0uWvSkVZLbij
         mOfZLd1OyXXBrIc5j5kjUJ/NaDZa9PO02exIKaIzPCG9lhfonbL1L0GcOVf1XerTZmUr
         aEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736887009; x=1737491809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bAvYGyeFu8e281JGlOSAn04kCJpvUAp6RFPN2J5Vh0w=;
        b=seBGEbzHJSj5kFH4gOnXy483ZTctgrz8YzlT1s6lcoDVI6uPu2enQXFSJL7jZqigQb
         OIWTBoh+dZTxsbSBzUMtm0/8qz8Hizex80OlbUQYuFR+ssfsWX0hIdhhA8+Zh1kg+CEg
         C6U5+OAcNmv5XBMlVDswswOytzFg7tZ1M9AsZ6o+rGyW8XhnjiAvA7jXqiG6TLtvJQFq
         m4GmXd+cKcutEF9tepk0MsnGmAF8LzmJPNARxUBd09LcOco50PNIOPRrgFMCAzCRjGxm
         hmU1cXzZT6CBQbkBJ93O7ofYwScwlWnACJ8ehvX6vbRRDi6+PqVIVBleQ+OnpbKQt01b
         JMzg==
X-Forwarded-Encrypted: i=1; AJvYcCU33P9vK5WRj1qK2BweVxax5jeTg6Sbp4DRqbiLHLjUL8/YLC4AiTcMN6wyC24sYvQvS3e5pzeC1ph3ReEu@vger.kernel.org
X-Gm-Message-State: AOJu0YyY2506StNmsbe7I2iAfhoTMJ63f3uKxNMkfWCmbTLDHnouLo0Z
	3LB4l4yINCYh/7lJwWh7NUgfwvC4T6hpN7B8wODGEGTXqu25TdNGSslbMBrys7Q=
X-Gm-Gg: ASbGncswWIAVR6MgVM/HLce18uBbVrMr4BX/qwUqd2cUZ+hZtWyNoOmnldzhM4Up+Gn
	yjYVZSsvZhm1LtyrL0D9h20yZ8Qy+M/NxZ4/EFzrSSvyWQGidd/CeqYmf05kFgc0MaQhi+tVtwL
	sePKPpUNFbnkBWemLqcUGSMu0m06v89WaoDDcuPx7GcFn+FB9opOvMMCHCVANA8+I5wMwNpa/tW
	1IKynjcExGpdWzGRyJK164ZMfMz5t0vj4tFLUhIgmOXfXiQJ5J7b3wO4fux/eUxkWarH9A=
X-Google-Smtp-Source: AGHT+IH1AxZZel/rWX6XENrksgjORmTMJ53M+8w7vOj2GMgiRPx3qqebgaoXnrxaxEjhON+gKlNHHw==
X-Received: by 2002:a05:600c:3d06:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-436e2691021mr106914705e9.1.1736887009595;
        Tue, 14 Jan 2025 12:36:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d69sm185953105e9.30.2025.01.14.12.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:36:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: qcom: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 21:36:46 +0100
Message-ID: <20250114203646.1013708-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 0320ad3b9148..a543ab9bee6c 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/thermal.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 
 #define CREATE_TRACE_POINTS
@@ -358,7 +359,7 @@ static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
 		return 0;
 
 	ret = qmp_send(qmp_cdev->qmp, "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
-		       qmp_cdev->name, cdev_state ? "on" : "off");
+		       qmp_cdev->name, str_on_off(cdev_state));
 	if (!ret)
 		qmp_cdev->state = cdev_state;
 
-- 
2.43.0


