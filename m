Return-Path: <linux-arm-msm+bounces-61027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1000CAD64F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2DA2C0573
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 01:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664CA78F24;
	Thu, 12 Jun 2025 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pq1+Mgyb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936CB13E41A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749690944; cv=none; b=fek2R1b8LjyDW8UwpjgKgHNi0QY319+FlcJaFDRAi+42tUm6PRmQnidQGPbamCQZ7OQS7lAhG3KhDSGzcQSj2YLGdDcRgDkio+h4Q6FrTsmXWBT8nFCywv5ZU400VbWmjim27Wrerdqob8Jp6PNq5O+KSmoZfuS79s25rXiZtQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749690944; c=relaxed/simple;
	bh=348Owfu8+NKEBcDAc1yCBm1UctAgEMq/YnSiv+q1CJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L31xyKVc7mWKGDW8cso3HKQrd2qR0AFYCuFPDZSodD4qU+8NltEpuRy4PPuh6CJWE92muiKuocvVD6z3fAF4u1xL2O6B0Am1iAZDq+QKbslvct0FsPvYUajP/iaCykHXXL1sOfEjYDIQfKaKS2v+IRThVSGDwRsFB5lpCksZ7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pq1+Mgyb; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32a65d1a966so504851fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 18:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749690941; x=1750295741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6NTxmPbc5uooQyom/INTaDK9H/lohg3U1Eew3ZB4b0=;
        b=pq1+MgybuJ5kznaUELk4li9ICdbZKSuCzAQWNV/bwGrm0CwUDtOfuBrkaw27qCVbWB
         b198Ia5UtejMDalAGXXqhszVbjDyDJm/mR6GkzEUR41Q1RHjbl/ZK7ext1sCoqozqq7o
         XZv1vmvTo5zW4M8vdjvgx+xi8Ca7v6+gR7XNoZeMvwp4lUsHGssJCmyVhPYe3LF0th0E
         3cyEhwwri4rdCrWKVgvHt8S8oS0qpO+tP3w6jlLU4HYpWx16o3kYyNXPzGIUhIu/Kobt
         qxLJ3ihmgvkyctyrQ9h5ykVESkNi2RAu2fSeaKsKY0YDuyNAH3Du8EesSHaiclwY5SkL
         tyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749690941; x=1750295741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6NTxmPbc5uooQyom/INTaDK9H/lohg3U1Eew3ZB4b0=;
        b=WdgQcItnjCRT326U4XmUcvz6MNs1uYEdirfNAt6hLf8FKoLmZonTyHGjj53RNxYomZ
         +x9JyRkzdYUlbJ+pey6ADPvWpxPKE4GbpL2RzH3GayMVziYflJpbVLNJwneQZMOuBZNJ
         OaZqoYY6qXjCZTK3EFWFC4l6uvjYWha2eeVmFWopPEE2bLFgEQxkQBLUPWNLvJxrEHHU
         P7Yoi3LPGgZtVyvnBzhceQmjD75vclI59i1H96SYhHvIsNQs/hPXz/+ugIvz0wzD500D
         8LrRPnhn+nATCfG+MmkThiYIKtpqvEZ85XKn+iic2WYDuksyKOhlUxJ+N2ri85tu3oy8
         M+pw==
X-Forwarded-Encrypted: i=1; AJvYcCVeaMpeSdsFOH3ck2RuC9CIo74bxoKmeBVxra/Y/cd2kP7a4YQ9huKDUYV4OVZTqoa7poILXTyo10KkAso9@vger.kernel.org
X-Gm-Message-State: AOJu0YzACeO29LX9/JB1VT4rdd/r5DXmn7qvrPQltm37kNg21zux/gvI
	LgrVYWNeLy/h1sxcucbVBwAVdUBL1RnrXHM/e5XM5BFJpXOjs8WRdpBHAxtAksf2Wcg=
X-Gm-Gg: ASbGncvK9Mp7B+H48o7eZYhjQl0RGQ//AUmFptjkLO1HDZTcJwoWgA5ltNHMc5yXzTU
	VKCrziPfqzzH8/pE54Nu3D6pr/loLKEyvEpjmqd0pLqBBAyMT//CKrtEd0+NDdSrkC5LH6B0QhH
	Z1DtWQNnWhs3KpMPj8AotPBetfnIJkuDY8+lMEMdi6NrdTMztdtYIqMrHxMAXqlWw7RQiz66vWk
	JYKiSaBY2sI6N/Rjevy5BO5uXEcTA4Hg8ZYNXYkS63uzja0aXhQC+Tpl/GE+N2ekj/VyZYdRyxV
	ir4dMzULi71GL0iNKb+W8jsNa4ftkXyYoJTiBTUUjYLFUyZDAWUi3mBs4W5v3ehvgqH/UD5/gIc
	TyRWEN/8Fhf1y4MDgIdxslO0Mf8m7ayKZcpCE2yhtxrSsxxkX/+o=
X-Google-Smtp-Source: AGHT+IFkAkj7pcBqvW8bpnlcAqEv/PlsD4qP9gZ18v5DQ1XdvO0ptkX6z7eUF8xz3puBqvAG72yuvw==
X-Received: by 2002:a05:6512:33ca:b0:553:2c44:c259 with SMTP id 2adb3069b0e04-5539c246f64mr477988e87.9.1749690940689;
        Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553a7018069sm62808e87.157.2025.06.11.18.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:15:40 -0700 (PDT)
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
Subject: [PATCH 02/10] media: qcom: camss: remove subdev resource argument from msm_csiphy_subdev_init()
Date: Thu, 12 Jun 2025 04:15:23 +0300
Message-ID: <20250612011531.2923701-3-vladimir.zapolskiy@linaro.org>
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

The removed argument is directly and unambiguously derived from other
ones.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 6 +++---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 5 +----
 drivers/media/platform/qcom/camss/camss.c        | 1 -
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae..1ba3fc2e33ac 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -569,16 +569,16 @@ static bool csiphy_match_clock_name(const char *clock_name, const char *format,
 
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
+ * @camss: CAMSS device
  * @csiphy: CSIPHY device
- * @res: CSIPHY module resources table
  * @id: CSIPHY module id
  *
  * Return 0 on success or a negative error code otherwise
  */
 int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id)
+			   struct csiphy_device *csiphy, u8 id)
 {
+	const struct camss_subdev_resources *res = &camss->res->csiphy_res[id];
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	int i, j;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..d82dafd1d270 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -113,11 +113,8 @@ struct csiphy_device {
 	struct csiphy_device_regs *regs;
 };
 
-struct camss_subdev_resources;
-
 int msm_csiphy_subdev_init(struct camss *camss,
-			   struct csiphy_device *csiphy,
-			   const struct camss_subdev_resources *res, u8 id);
+			   struct csiphy_device *csiphy, u8 id);
 
 int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 			       struct v4l2_device *v4l2_dev);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0d05f52a6e92..695f113472a5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3074,7 +3074,6 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i],
 					     res->csiphy_res[i].csiphy.id);
 		if (ret < 0) {
 			dev_err(camss->dev,
-- 
2.49.0


