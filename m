Return-Path: <linux-arm-msm+bounces-27300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04F93FE8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65022282CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A91F18A93C;
	Mon, 29 Jul 2024 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stTmEJ5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897F189F2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722282745; cv=none; b=S+vWFqgKMv8BUNj2OSEF6DIcZfCi94nPUO058bYFYRMRtWXNpnuptZreOLQ3o6cxsQ2BahzVTPIjZ6vGCUMgOiccsMQtQdPJWJs/Z6i/zxBKbdQ2WSR5QOhIGCdjdC8ZPb2hUgbtD4gPAIN6vGNY4JbL7rSff6+mBKaLs2XZjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722282745; c=relaxed/simple;
	bh=kVkXAl7R2Pvj8xirOh7/6K6Hs00UTZujRWEkyOWu1QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EqmGR25bK6IaGa4cc25hSvZFbNgZdZfqegkA4ydCXEjzsud2ccfBKgHHqwR0zPpb6IofkCIesf2QscX8nlp2kDT1pimrdGP2nM9GtvhYWeSHggmgOjRXh8xseOaudE19bEn2E6TkEy2ZOtYH78kHGRVrRtrtMBXMzE86LTJrICQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stTmEJ5f; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efabf5d7bso4540210e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722282741; x=1722887541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViqDaruiHXbptx0fiGh8fZJQctF4985Hl86hrFZw7F8=;
        b=stTmEJ5fzNNGxp41qAx7Eg+1CVX2O3wsq4+u2kuOlELNxhizRlSRKhrL4jFqquSY9B
         OwlCD5VW2VE8gGtLtxHPr4wv2iT/dqG14lJKoX9m2s3QbdNA8H0OI4yrKKzS/U9ASF8H
         dk8emSMJVdT15OAoNhoBmE5sLewxTFIQUvL+4zgEqGQ52dNvsWJsSh+L5HsLA2P1+SGf
         V13JTlj2iNjnRu6wEvlheMymIVZWh2TN2ilTWUEQJXBEbx41m16CKAc3+4o1uKaWBrPR
         gSN42fQoD+GJddwvAyVr39Du4jmJ3xjyw+GIRjqaPpNroE6Tv0sDc6UOMIOChl7f1mXN
         Zf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722282741; x=1722887541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ViqDaruiHXbptx0fiGh8fZJQctF4985Hl86hrFZw7F8=;
        b=NwYbRHuKvs/+KGZWBodpOQ1t5RmxdU+zFSIKxakphLfvTL5OqYhNUXU1HtOCJCCaXn
         RZWPQRsmRbear5AhUukKPxRW14HU3BWlx3TVIX5hOSJhIcMklssb4ggiuHd7q6VOhxFH
         rjkU/a0lyxzCJwe6qc4+2RXp9z9mXqgXaidVQgVbzLJaMvpBK4IiU5CW6gau2o83h/vn
         GnqTib+loeufF3sRuRnNG1UdcmfRT61r/C7jw7hiw1bpb8JSrMLHqBgxleXF5IETs+fx
         IwxLaNpOr/rkCsqrzlTOxgYAaMRCnLXi9NxFA6+9KOoqkk5Cba3qWULhQdHy+objsFdX
         S7hg==
X-Gm-Message-State: AOJu0YyNArzcctUQW6vNO78KOlwy03RNWeR4kmgHGt28mFKq1o3IMER7
	7IbuigGsS5ID/5VtL+B5P5LNRuLIgDJLKXJd0bRkBIFK9ENelfsMNJOYKPmTOCw=
X-Google-Smtp-Source: AGHT+IFexp3G2I6sO12jbnFOJx1PCXPxzNUWYcCLi2HP8O60fTbn7j08Ddj7eJsW+JD+GP8hUZ+LfQ==
X-Received: by 2002:a05:6512:2c90:b0:52c:8b03:99d6 with SMTP id 2adb3069b0e04-5309b259b94mr6233879e87.6.1722282740717;
        Mon, 29 Jul 2024 12:52:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd1088sm1615590e87.106.2024.07.29.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 12:52:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jul 2024 22:52:16 +0300
Subject: [PATCH v2 3/5] soc: qcom: smd-rpm: add qcom,smd-rpm compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-fix-smd-rpm-v2-3-0776408a94c5@linaro.org>
References: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
In-Reply-To: <20240729-fix-smd-rpm-v2-0-0776408a94c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kVkXAl7R2Pvj8xirOh7/6K6Hs00UTZujRWEkyOWu1QU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmp/LwMeuRa7T7m3PaZuVgQrlb9LEEscj63nHSc
 1f2nLzUgdyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZqfy8AAKCRCLPIo+Aiko
 1T5CB/sGGLhSKM634uBrEQH7FxynC8qWlegbofundznghsgVkaO0y6qznIgHHIYV9Unu8SqpKTL
 ga9/+7dxFMTVyZR/uZUmbKpa/TlasxBp/2Ar68yRC2r0LkroxAKWG0hpVow5JPLmQupFpnZzV7Y
 l7x+M/Y/f7ItN4xp46kLOZj44ysyb3XzKXMkF3K12ocJpPQ8/XQnr+fls2hzAOfh+AQ+ohEgZ6Q
 m22wXBp/OtE5YNbfNU6H6DdU1xdC5pC8V3lGC3O1pMaOwUsVMl70s1pgxax31R4iBMj1QCc5p/Q
 Sf2XYrABmnpRfJILqMhadNJkQ+eSeFxsRauooobJ+/VzX+dS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add the generic qcom,smd-rpm and qcom,glink-smd-rpm compatibles so that
there is no need to add further compat strings to the list. Existing
strings are intact to keep compatibility with existing DTS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 9d64283d2125..f2b3e02abdf1 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -216,6 +216,12 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 }
 
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
+	{ .compatible = "qcom,glink-smd-rpm" },
+	{ .compatible = "qcom,smd-rpm" },
+	/*
+	 * Don't add any more compatibles to the list, two previous entryes
+	 * should match all defined devices.
+	 */
 	{ .compatible = "qcom,rpm-apq8084" },
 	{ .compatible = "qcom,rpm-ipq6018" },
 	{ .compatible = "qcom,rpm-ipq9574" },

-- 
2.39.2


