Return-Path: <linux-arm-msm+bounces-61031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B965AD6502
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24A4F1BC094E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB7713C8E8;
	Thu, 12 Jun 2025 01:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WubHWjMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BA3154BF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690954; cv=none; b=Z6IocNzT2pgTO+IiXgJPZEsAySpzWlP3LkDl7ECBP9ZCFxNnSypUYf46alDk3OtHS9qksqWOB49JejIWp/t34e77I6qKVkLyrvxRsDcaEFSq86mFoI7+uzQTCGVzflVVZoRXpR/1PdxcccKHY/8s51E3W8JykesLwNE5JdVOOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690954; c=relaxed/simple;
	bh=LqRPAqNQlNO3zu9aKoKgeHnMk4rQEK/l7ENgXrCUZAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IX6pFikU5xhyIq+hhPe56YAsfZ865a6HV63BZNhLImbacIXapsKEciBzQj+8z+6U4jCRM16G3o/4mIHi1DccIjJarVn6tfZE51fR5wcpoDLfMJugfQzM1sAOa3a9MIpu1WSPg6UQL8X2AgtYdlWOw7BogAlhTxzIN45SpZQ0kGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WubHWjMc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32a65d1a966so505101fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690951; x=1750295751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGXO7XE6Zd1Vk08ChbQh+PqLJC+OLbKRi30oxb1Svek=;
        b=WubHWjMcdRXHWWKVCKOkjUI9SRv/lW6N1KGO85u30YHbhzoODvdJH7BFlrEYzbvB4U
         G7YGEQZp+azNp6ZXMNtdj4tvXmKNYCeT6cDgNPbv0VmmYn71/tusVC2r2X3lwbebRMQr
         J2w75gqIquc0E/ktDaOxSliwqYU3V+8OP8+5/7EaZ/7vvaWI9NS252GaHkJpcaJMzGG1
         Az8jSBXRttrLgkWd/yfSsTCI6YeOoyBOvkiyJ7GGQND9ZdwvsJ0vXfhN5ejtuWzbti2X
         QfoF730eWa9M/4GdndiSw9zHd/UDD/E0kVJQSOc6QDoXLl9F7URI/fqYqKapOC6wdS9O
         D2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690951; x=1750295751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGXO7XE6Zd1Vk08ChbQh+PqLJC+OLbKRi30oxb1Svek=;
        b=Aa1xX1CUrnXWdM2X3zaqG9VUqVCJqo5p2/i0xvM+l7qVOC6BOY/ZNFwZt6hf8N6znl
         CuecAK9ruJAtz1i9T7vo9YLvkmQotCMo8vSrQL2VlCAfipflyoD7TZ5RnUr2dSVvPqmC
         QkpGz85dMMn0r8fwgQpc+m/Y8Ggs4oRBwGsSIYAyAj3fQ8F5uQMM1KfZdDu6v1exbgYj
         Rs51ERSMRa9djgfT7EWHjvght01mtkGWdXVVUxTOhVTvI5T2xvt8HWVA8KEUiG5BeNXA
         aRU2KZy+qwak/kPMghlWQICpYyb66XVb/XBv5QszhxKU262evsDiBTfzIObnrOYMM5Ah
         wI2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFvZeRZuTShM6bJJ+Rx7F5TIs+54txNcyJIY5m+7oYHXUTjTVu0g/CYSv5zi7qZ2nWtspspOcNLHGoGmuQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7H18rEPvbblCvaG5ubwU1xMtzvEvkRFKmk3u+QPFgILC+k3G
	xzsSle81wUqePX4C4+toq7dLnesGEaDoW+LLAgdtdzaOxeKe6YV5UwsRM3Y3vB5DYY4=
X-Gm-Gg: ASbGncswy5/Jz3rAC+f2OEOq+kQoFJec5ayU9QC5cI2JRD9xTxxH9Cw7h2ieJG5Mbw6
	RQ7dUeYwHD4D6VY2yv7wbGPPUFFxe8LhlA+rkjE8Rgn4aVkX7XWfrfP2U5ufSj3OuAoBVQ8559S
	W0nZZuv9BAsBr6DcOWKEnrSNKV4fHgCG5qPmYCS5rQs6M+pF9J154ozOL1sitfoykY4V8QmuQN6
	sZO1XTNcJn/VEi4Sv4SXEXiK/eMd+MaquvGT0Aa6/hYS0Az7bHzLeIclIy8C/87AozZDD6n6ZSA
	wFVKFRvOR4c9rmfVyXFIBxAoN7I/9kNXQ2yI4L138Xjl5+DyJV9D+l+hwbZIQ5XFyOpcUijErwx
	LN1HYl9Kc0VtApUD9GoH8Lu6RHE2qNTIe4gPA/5wICMo5sUGvzpQ=
X-Google-Smtp-Source: AGHT+IF6li0/wsba5vOcpZ+7hE86fPFgQ1nbQpeMNRGYiv+YLYSCoO8kXCjs4MSZkmCv4t6gWdR79A==
X-Received: by 2002:a05:6512:acf:b0:553:34fc:3bd5 with SMTP id 2adb3069b0e04-5539c2004a5mr587329e87.8.1749690950543;
        Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:50 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 06/10] media: qcom: camss: export camss_parse_endpoint_node() to csiphy
Date: Thu, 12 Jun 2025 04:15:27 +0300
Message-ID: <20250612011531.2923701-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the function to reuse the remote endpoint node helper function
from a CSIPHY driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 6 +++---
 drivers/media/platform/qcom/camss/camss.h | 4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e03308d7a366..40bb20bbe8b4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2981,9 +2981,9 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  *
  * Return 0 on success or a negative error code on failure
  */
-static int camss_parse_endpoint_node(struct device *dev,
-				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+int camss_parse_endpoint_node(struct device *dev,
+			      struct fwnode_handle *ep,
+			      struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 99831846ebb5..c3eedeb87ddc 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 #include <media/media-device.h>
 #include <media/media-entity.h>
@@ -150,6 +151,9 @@ struct parent_dev_ops {
 	void __iomem *(*get_base_address)(struct camss *camss, int id);
 };
 
+int camss_parse_endpoint_node(struct device *dev,
+			      struct fwnode_handle *ep,
+			      struct camss_async_subdev *csd);
 void camss_add_clock_margin(u64 *rate);
 int camss_enable_clocks(int nclocks, struct camss_clock *clock,
 			struct device *dev);
-- 
2.49.0


