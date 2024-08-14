Return-Path: <linux-arm-msm+bounces-28525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B25951F97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4EB81C21708
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87ACE1B86DA;
	Wed, 14 Aug 2024 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvUXnbDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BBD1B8E94
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652094; cv=none; b=YTA1diNWkJ97RxKUlbOn+PKOhshTEffuEUVy882PhAR3ppY4fYsZULUZ180k1fpn9BNKCUe9P9a7WP2+tbG77MEaEdyxHzGzYFy15B2AmMbg2+8GVnCjIayFNs7BhSkGxoYDso0eYx6QL7cgqeT3w5xDSjPfnapyt2U5um4kHKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652094; c=relaxed/simple;
	bh=gqbMiXNwJFJXl+62Es6Vo115fZrEynorUGC4qCQ9vDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnwlSSgt2+ttTaIUH4DBCiajpbDJ6Pxz/XjP4TK2a408iZ1xIZbvDnBp39djDEkBpbCPam4EScKNCYXTVGSq3YDSEg/Lhvm36CE8oZ0aQW3GghNSYIVPV1Of0MODlsTZ2P6/c8dOPF1fC0RN24lCobiSHJlGZ5CX2ARReSl8zM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvUXnbDd; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280c55e488so112225e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723652091; x=1724256891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdXwJjU7Fbh1uS/qpTeyladuU6fek5vMFj3oZ/ZloqM=;
        b=fvUXnbDdf4G8UMXheWZNCgWZGhAIj3EK6CT8XBt/pxqXA6oJOD35EF9XT9l0fcnNrB
         3UtYNYGfv6SntLc5FAsIMAi1lbGe09Lk4PVWhH/La9OUbgxvY54Lwt+f484A75ONlJdT
         LhtqoENvjcFUTDBRrge40hIwHmza1VFCn21aIOSQyYA606MhJBmLTT0/JWTvVCllbBW6
         LDYSoZuUCekK6jxmve2Oe60iU5zReBx+sYC6HXCeS4mUG4bU5scvVPqEFPgMxSoe+8fG
         dlghwehHY3eDt4X7Dx/SaPPYS2B9vVc8Hyir5l/lKneInSxKo4SSlWHDfFrINlEC8Cx3
         3OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652091; x=1724256891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdXwJjU7Fbh1uS/qpTeyladuU6fek5vMFj3oZ/ZloqM=;
        b=w8+P6OrIXvztbM0B9PfS+KWwy0JVKJYuX94bqYcMYz2U+5+B2L12OEWsKn2/MQ5XwV
         GhujNIsPJ+pwEZSVScQKUswmB0WhtUFq82wBdyLcHBd8of2VWTIdDsrXJ2ugME3tFAjS
         ThxoQ90VrBghXtAcZ56aDCzgXGvXfdmM5JhR21MHD9XSF/QdP1jRcFoIFvGnDPg+bYVF
         bTFlBY7KMMrKw5NJOBIILdAxkLWH8hCQnC0X5wbVq8g0QUZ0+CC5hE5W5w0ahhwI1UUn
         E+gk3zR35YlCnIpwJnEZT1tr0ahmegtHskp+cRubqd2BOJFopPWDX6wPixXJgC8E7qvq
         wKjA==
X-Forwarded-Encrypted: i=1; AJvYcCU6BYkdfta92AcQNQMRLikF84Vv+zGIM3IxdDQ9fCPstVTnWIpA2sIq1/6JUgkmQIuovtpw38YruhTxoNtID3MwSWjdtXXcio+jUmE9Ug==
X-Gm-Message-State: AOJu0YwAeYptGQW8UPhsUkfg11povSR39vWay8Qw9OTM0j5Kx7Rmx41t
	FGxe8bUmkGWWiBuLt6FGcl18pJt+4uNPOGS8EAQMNtdTttCTYNYUR2yRfzLWGaI=
X-Google-Smtp-Source: AGHT+IElmNJ3m8B/wz85EEfNBjA8nlEQnCbDf5OaWkj2K/ZAN1S51QP7jcXUNJ02UuqmthaHICfZmA==
X-Received: by 2002:a05:600c:4f55:b0:426:67fa:f7 with SMTP id 5b1f17b1804b1-429e2344fb9mr1509995e9.9.1723652090851;
        Wed, 14 Aug 2024 09:14:50 -0700 (PDT)
Received: from sagittarius-a.ht.home ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3cc80sm24200835e9.21.2024.08.14.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 09:14:50 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: quic_depengs@quicinc.com,
	rfoss@kernel.org,
	todor.too@gmail.com,
	mchehab@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com,
	quic_yon@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] media: qcom: camss: Add hooks to get CSID wrapper resources
Date: Wed, 14 Aug 2024 17:14:34 +0100
Message-ID: <20240814161434.1484857-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
References: <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New SoCs have CSID devices inside of a shared "wrapper" i.e. a set of regs
which is responsible for manging the muxes of the CSID to various other
blocks throughout CAMSS.

Not every SoC has this top-level muxing layer so make it optional depending
on whether its declared as a resource or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e797f3275fb0c..6da04cac93f3d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2037,6 +2037,7 @@ static int camss_of_parse_ports(struct camss *camss)
  */
 static int camss_init_subdevices(struct camss *camss)
 {
+	struct platform_device *pdev = to_platform_device(camss->dev);
 	const struct camss_resources *res = camss->res;
 	unsigned int i;
 	int ret;
@@ -2064,6 +2065,17 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	/* Get optional CSID wrapper regs shared between CSID devices */
+	if (res->csid_wrapper_res) {
+		char *reg = res->csid_wrapper_res->reg;
+		void __iomem *base;
+
+		base = devm_platform_ioremap_resource_byname(pdev, reg);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+		camss->csid_wrapper_base = base;
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
 					   &res->csid_res[i], i);
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 867e275db4bec..a9b733cc626d8 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -66,6 +66,10 @@ struct resources_icc {
 	struct icc_bw_tbl icc_bw_tbl;
 };
 
+struct resources_wrapper {
+	char *reg;
+};
+
 enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
@@ -94,6 +98,7 @@ struct camss_resources {
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
 	const struct camss_subdev_resources *vfe_res;
+	const struct resources_wrapper *csid_wrapper_res;
 	const struct resources_icc *icc_res;
 	const unsigned int icc_path_num;
 	const unsigned int csiphy_num;
@@ -111,6 +116,7 @@ struct camss {
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	struct vfe_device *vfe;
+	void __iomem *csid_wrapper_base;
 	atomic_t ref_count;
 	int genpd_num;
 	struct device *genpd;
-- 
2.45.2


