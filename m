Return-Path: <linux-arm-msm+bounces-16136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B605895A61
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 19:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3591C223E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 17:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C40315A4B5;
	Tue,  2 Apr 2024 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wLYxvwIJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9077715A482
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 17:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712077638; cv=none; b=JolEJwLZ2RVhQ12FOUKpI13e6nsqqlEl80CLo0RKg5Y+grLYPSUvY/fFSbyNI2MmcjwE9ir+blf/pNIyUo1bhjv/z2VKFJilCuwNUKMan0J/+tknQgtR7tljGJ+S+eJNJkcyzlF/rNvEBYSwoDEtQ+qX7TB67mV4JWReN3nyFR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712077638; c=relaxed/simple;
	bh=T6Qd+L04mZkzAyR5GBc7ooVeXexQ2iHz4W9MFLmMCFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixBYmyNllcLVtS/mbzh391FgY52b+llHS8LMWott0qFt/4w5TZij8vlsheyv+yhnSLMQysmpRGMpi/BT+P4cenGI3X6S50j5b2qVuL5IZfWm+TEx6Uynb2CSmVV5tbFOhWgssfGZ+p/d4GlmLPT1ZHE7x+paLgvI6V+hSnU+0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wLYxvwIJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-515a68d45faso6103026e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712077634; x=1712682434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqJOpvbyBmvtqRsTmffyDJDkg5th9P0RJAbEDy92BsU=;
        b=wLYxvwIJkFK3S3KAe8zRVy9A8MwzbHZhc7V2RFuTJDzmqPtyzhdXbCC+7MGyssKE8I
         xVFPj6KjlCo/dgO8Wi1ScF4X5sKavfwyKanxeoZ35/5BRnY56avLPXp7IXa7+E2X73vC
         611I5wBRb5RDhsjUgt6ARR2IAWMBqs2X7XaGOq/dOA2XjznSSFk5zxeA9x0fCK3+tgOX
         r/OOtkZrGKbTJXlMVqsHK+Bs7GeBDOpYMhJsM/n2eHTtxUG0J+2rfqFSxiYC5PWYOjbd
         uLnVvKEKcpBF6MmUjO/2vRb1lFRzBK1BtQ6GG14YF4vh41TbXPdG8oGAhWWaZVeIzMyI
         7F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712077634; x=1712682434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqJOpvbyBmvtqRsTmffyDJDkg5th9P0RJAbEDy92BsU=;
        b=R1Atpsx5GiAao4qJyeGmtDNH4a1sh+Z7JP8yB+aUC5MAEWZg288YfmlcblYg9zi080
         RXx24wF6aAwDLGCpQgUVuuEAxTQlfsImbC0z0F1q/t8vkozDjUBAnTjybb9a/TBgyvHE
         qD1mLLrSVUTjmXt2OX/dhkxzzH/MYxPxH4dRzeMd9FgTg4V/L5EwxpZ6mwhzdsu8A8G9
         JILGR14pdEINmmy4wmhQ8wP1CCZ63J+mNW2NsgP3xVksd/Kgv2BmcawHxTAUUQrr4Rpp
         1lzbj9r4KdBF3gRGctJSbftkYo/UY4DZsc0oM/W+5+7r/AXCKHagWHeK9xKtp2jV+7Ka
         5rrw==
X-Gm-Message-State: AOJu0YyFr8O0P2GuoMaO8DsZ4dIzSkmDHTmJQjbddxtFFe44ucoxtFcS
	i84cuYbPiyJ4D2ladddUvb8dOkto+QBkJfPQermF8hsnHe7izotTmvZjBtNoMtvg3RusVLr3SGp
	j
X-Google-Smtp-Source: AGHT+IGEzKzBvoZKifA5mTHxjS7sZ0A+KJr8ySt3TpZcg7TdUU/snRiCggX94wNVAlzdKg1AwIYp5A==
X-Received: by 2002:ac2:4841:0:b0:515:7686:2609 with SMTP id 1-20020ac24841000000b0051576862609mr7622350lfy.18.1712077634152;
        Tue, 02 Apr 2024 10:07:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e12-20020ac2546c000000b00515cc53c5b3sm1603486lfn.125.2024.04.02.10.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:07:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 02 Apr 2024 20:07:07 +0300
Subject: [PATCH 2/2] soc: qcom: pmic_glink: notify clients about the
 current state
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-pmic-glink-fix-clients-v1-2-885440b81c65@linaro.org>
References: <20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org>
In-Reply-To: <20240402-pmic-glink-fix-clients-v1-0-885440b81c65@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=T6Qd+L04mZkzAyR5GBc7ooVeXexQ2iHz4W9MFLmMCFM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxqPtZ0/d3ny957716MSL3ZOe7PGkulvxy1FV66vddI31
 i5SMP3RyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ8E3iYNjo8L03a9VJU+6N
 G9IP800Ru67Var4t7txN8wq1aeFTNk2W3Tn7/qOlVi53X8fZskYpH78jFO3656ywVmSZmIxaeZr
 uGp+lHbc8ivPPXjnyRdeH89V5DcfLeV/8FG/r7txrL6ZX4fpS+9+U+AevYxUXMuuf2JCyI/2Dlk
 jQwZZbZ5efMfCcX/ji+P1NqiVZWjdVSnlvN389mWfccDuwVFBlwl/+RrbKg3piJzfcKU9dwTmvP
 pylSOh9WUNB1C3xDvtTWUK3qiM/1ru+rdtU/0c6+Wq3rWKrktSqpzOn1QR1R1he6LyRdrHlzfM2
 dta4EInEvSyN5WWPHEJafxfnMX/l3GV+Ws5eWyYp8PwxAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In case the client is registered after the pmic-glink recived a response
from the Protection Domain mapper, it is going to miss the notification
about the state. Notify clients about the current state upon
registration.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c999358771b3..089cdfb1c9d1 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -83,9 +83,14 @@ struct pmic_glink_client *devm_pmic_glink_register_client(struct device *dev,
 	client->pdr_notify = pdr;
 	client->priv = priv;
 
+	mutex_lock(&pg->state_lock);
 	mutex_lock(&pg->client_lock);
+
 	list_add(&client->node, &pg->clients);
+	client->pdr_notify(client->priv, pg->client_state);
+
 	mutex_unlock(&pg->client_lock);
+	mutex_unlock(&pg->state_lock);
 
 	devres_add(dev, client);
 

-- 
2.39.2


