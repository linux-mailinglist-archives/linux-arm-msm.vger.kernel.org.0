Return-Path: <linux-arm-msm+bounces-3621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA9808308
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 711922813E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 08:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113AF35276;
	Thu,  7 Dec 2023 08:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lo8aTH8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567FC193
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 00:31:57 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33340c50af9so660217f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 00:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701937916; x=1702542716; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh1NrgCHmse+ZYlXJuyJbCPI+fbxd0JyCyGWo75A+PU=;
        b=Lo8aTH8SnhVeFVjFaNm6Lh5RWMuOjZk2uWN7xKuQuycpouvbgs3JF8sIdDab7s1Qst
         Sa0YeQDr9I6fH/vLCYLSR2d+ibxh2u97lEdvjjnyTaLcd6eSD0YryQq2RIiTk38L4jjg
         vp1JBEiL2+TXlF4t0uO/TJd6Thg18qwnskajFQcQ0YV1CIJsQlGWbTK/bkcebs6NWBOY
         c+UConRfcHFguKY842xEya/RVF955YHsMdXoQ279UA47cYJmokvlYSPsRcZHsyBmRcMI
         U7GhGRo9qLiWM32QOosoZnBHScMMts6WhRz50SRejcqD2SEnsDjZ9y3YZ6njEDSOX5AZ
         R+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701937916; x=1702542716;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fh1NrgCHmse+ZYlXJuyJbCPI+fbxd0JyCyGWo75A+PU=;
        b=dzzbIyCmpcIvdsUdUKjZLfgJStA8Um3PKP4GjUZqYM41uydzek+7TSqsZ3ScdC1lkU
         sZRs8KydDcqUXUfriGfun36t1jju9nMZwf4xI4Mpk7X9UDn6LlRd2B/Vievk1Oqzo77l
         jypjiEnwdNNpNfU6HCbkxmc4nvOh8yoif1tJgBzYeM2B6bY7DBa6jvSsvcAY0oujeMx0
         zDQT+vFloNgUHE1sxlhf0P26OpXglqAjUtohjxTvkdtzVYSZVapkzC7y658kl3pN+2+f
         3XI5LPqNpDEXAAFo0MZdL1jSY6t4TnNbTUyNPmj2cLQNhs2RfCV1/oWXrs3omahfEQxa
         kEKg==
X-Gm-Message-State: AOJu0Yz1tUH6kF89+nABF1MWdKMYVGJ2t4Fk3VhwGH46ZOq+hDFYsz3Y
	yL8o1adT5QHLB6wvCWVNHUylZA==
X-Google-Smtp-Source: AGHT+IGKRXWqRX58/R5hEGTRWgoBRkbzrWTK2pRxk0780vN4fRF8cdCO/3fhDML5W/SU60ovB+jAQw==
X-Received: by 2002:adf:f5c5:0:b0:333:2fd2:3bda with SMTP id k5-20020adff5c5000000b003332fd23bdamr945532wrp.147.1701937915688;
        Thu, 07 Dec 2023 00:31:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d6-20020adff846000000b0033335c011e0sm808519wrq.63.2023.12.07.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:31:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 07 Dec 2023 09:31:54 +0100
Subject: [PATCH] soc: qcom: pmic_pdcharger_ulog: fix sparse warnings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231207-topic-sm8x50-upstream-fix-pdcharger-ulog-sparse-v1-1-43f75455a9e3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPmCcWUC/x2N0QrCMAxFf2Xk2UDbWRV/RfYQu1gDbi3JJoOxf
 7f4eOCee3YwVmGDe7eD8ldMytzAnzpIb5ozo4yNIbjQ++CuuJQqCW26bdHhWm1RpglfsmEdm6G
 ZFddPyWiV1Bijp3OiGOny7KG9VuU2/hcfw3H8AI7YwySBAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ECERn2a3qajYeOy5z/ZTUwI0A7Gm0+Y7t1J+kFVUTvY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlcYL6m+1mKsqAEtJlh28PMkYavE8geYm4Af2cZXKT
 EXP0yYWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZXGC+gAKCRB33NvayMhJ0X/cEA
 Cjk/KfUjEN3S8SqMj/BSdJnOeLJj/cEvCdCAVsZbqviJ9CxKjlYT+Lcfyn4P9qbwbeayuiQZ38veJc
 3QD4F+8aU4CUoRMo4lmNlRtVcgquiK5g1Mr6KeCCMlPLyioncexBhCjc8mTGrsGZf/g6wXihAzG3aU
 /0cd25Y0VP+qq0AcXXWvSj4Dgpj9OyM0U7sUBRDVYa3+0wP/q8D4fCfoLBAZBl9qOOITh84VdIcO33
 40ApjZ4Iq6fOAfLyTD1dmYxB0z9rWM9XO4VRmGk0IKoJ8k5hu5RCuq0dVqTLhdhOsMZpN1n99naiBN
 pqgsroWjZKDVnroM1MAAYTy3vCdxaXzA76cnwjfn4F+bFpytV7m4tmH6kVvuhX1TOX0Z0IucOr3mgt
 a9MLpV3X8D2naD+tdywqbOyzsFdACx5AOfdUtCGjWA7/Y6D+BuQrE6bf6kTmeHtb6TkKMP+v3xz6Yi
 8RMw+5dGgRFwVbe57ODHRQrXryFMa+xDTIJRfJc+2i7d3dh0FliEDsAshgfCU2vHvIW8ZqTZ6yeg2Z
 O+GfZaQf0lrlqj+5TVVTfc3h64hsjtywVR0s7yFYJyiAW6YaOwlNUALWTRNzDeUF1TF8OnlR1DiLbN
 txYW203ukR/tJLegaHGopc+fhtFL546TddWZmRt7OQzczUgzzhk3HNuWwvdA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Fix sparse warning by comverting values to le32() as expected
in the get_ulog_req_msg.hdr struct.

Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312060355.M0eJtq4X-lkp@intel.com/
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/soc/qcom/pmic_pdcharger_ulog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_pdcharger_ulog.c b/drivers/soc/qcom/pmic_pdcharger_ulog.c
index f1aaacf05005..238cd38589dc 100644
--- a/drivers/soc/qcom/pmic_pdcharger_ulog.c
+++ b/drivers/soc/qcom/pmic_pdcharger_ulog.c
@@ -54,9 +54,9 @@ static int pmic_pdcharger_ulog_request(struct pmic_pdcharger_ulog *pg)
 {
 	struct get_ulog_req_msg req_msg = {
 		.hdr = {
-			.owner = MSG_OWNER_CHG_ULOG,
-			.type = MSG_TYPE_REQ_RESP,
-			.opcode = GET_CHG_ULOG_REQ
+			.owner = cpu_to_le32(MSG_OWNER_CHG_ULOG),
+			.type = cpu_to_le32(MSG_TYPE_REQ_RESP),
+			.opcode = cpu_to_le32(GET_CHG_ULOG_REQ)
 		},
 		.log_size = MAX_ULOG_SIZE
 	};

---
base-commit: 8e00ce02066e8f6f1ad5eab49a2ede7bf7a5ef64
change-id: 20231207-topic-sm8x50-upstream-fix-pdcharger-ulog-sparse-51a4ca55a6b3

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


