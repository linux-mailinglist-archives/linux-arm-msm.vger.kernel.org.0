Return-Path: <linux-arm-msm+bounces-513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9C7E8CAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 21:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43046B20AC6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Nov 2023 20:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F15E1D6B6;
	Sat, 11 Nov 2023 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yf1aEC8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541E81DA2A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 20:49:31 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBB130EA
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40a4a58cf80so6553085e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Nov 2023 12:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699735767; x=1700340567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4JO3wrflztQvCLRxh9c/YzTkfu7aFzRvnmTFixGbvk=;
        b=Yf1aEC8gvjEBLNa2uQQRDIu9QEAni6L4ZKokPdnZq8RM820ptrOJ5Ql6S+AB6eGGvs
         S/RKpeFCuXxYV7yuXIwIY1A45+augElV0BqmDwNzZdZtwLVH15yXnShiYJ8/sqHYsIgx
         n3RWm2CpRZzh5CuMOwouHzpJcdHMTCpWiIsm+NSyDKziK6iM8HZemdRf8XtA1wlVPo8R
         YOM/TH1E0gboubhaG045EkwTG2c0IRl2diWnu8wrrz//Ya12UL8Gm0TmonRUIQ/7bGYN
         dwaUesRpU17m4QgxhStQ63nM06dOouPhb1c/846XvQaW3aEi5pjbrzOHu5MKr7qcEgyJ
         ae+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699735767; x=1700340567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4JO3wrflztQvCLRxh9c/YzTkfu7aFzRvnmTFixGbvk=;
        b=AoFfvZ8IPo8qLIj3oxn09GcFkyxY3CzK0KP5pTO2X/nyhzmAR1kEJAMSbZGJBNOAuk
         /XFZZJG9bXPhR0HlMmcFVxtjF1ha/MB2vKTChPsS+IuL3OpEHP1SpCtFUSwYDbWYXcsP
         QmKVGsEYC2tnNr1cg9b2HMpNS5KObvRdOn4fhpEIXhaCPov8s3SBCxMgTutUz7sPFgon
         cRv1widy7vmPRwETDqXeteAXdvaPQQj3huroWZCK0eyb8RVzz2VXBB++Ozq0ONQQL2MR
         1VEnuKdyno9NVS6TsuK5ueHXjif6rFDrQY8ZMOVxGaIbTQZvvbJbVXHgoY5VZDzyMjkm
         GhBw==
X-Gm-Message-State: AOJu0YxfhBlcTdWk9s1GBr4kI+VMZkI4TkrQGVL4CdgaYtx1TvdB2yIM
	lQpTj2SMEqIG3zy2BJ+sqncd5Q==
X-Google-Smtp-Source: AGHT+IFjzvE+DwGmctdnC2uZQLa3rYY7uyaFAoERd5ZpRG3Zgu4Rn66Umq0gb2sScDrhCsXQ91QjqA==
X-Received: by 2002:a05:600c:450a:b0:409:375:5a44 with SMTP id t10-20020a05600c450a00b0040903755a44mr2330569wmo.24.1699735767758;
        Sat, 11 Nov 2023 12:49:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b00407752bd834sm3121226wmq.1.2023.11.11.12.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:49:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/3] mailbox: qcom-apcs-ipc: re-organize compatibles with fallbacks
Date: Sat, 11 Nov 2023 21:49:16 +0100
Message-Id: <20231111204916.35835-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
References: <20231111204916.35835-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to previous commit e17225887005 ("mailbox: qcom-apcs-ipc: do
not grow the of_device_id"), move compatibles with fallbacks in the
of_device_id table, to indicate these are not necessary.  This only
shuffles the code.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 002a135ee868..79136fb62f01 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -145,19 +145,19 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,msm8953-apcs-kpss-global", .data = &msm8994_apcs_data },
-	{ .compatible = "qcom,msm8976-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
-	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcm2290-apcs-hmss-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
+	/* Do not add any more entries using existing driver data */
+	{ .compatible = "qcom,msm8976-apcs-kpss-global", .data = &msm8994_apcs_data },
+	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = &msm8916_apcs_data },
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &msm8994_apcs_data },
-	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sm4250-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm6125-apcs-hmss-global", .data = &msm8994_apcs_data },
 	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &msm8994_apcs_data },
-	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
-	/* Do not add any more entries using existing driver data */
 	{ .compatible = "qcom,ipq5332-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
 	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
-- 
2.34.1


