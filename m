Return-Path: <linux-arm-msm+bounces-71700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA8B41148
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31438560711
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAC818A6CF;
	Wed,  3 Sep 2025 00:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BogbOvWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBD1552FD
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858986; cv=none; b=TBCzFy7gWn610epstT6l7XT6l4D4JWbLHnNnqr15wDh1mDjB84avnzBplfd6cEtgYRzM6ev/HUx4Jl3X3eBo8N3oB8ZM9M6U1CnVbaN+u+arfFB2MeLiwMsAzmH4OQJXwjAfOAFwWvzH5I8/Mi0cnXBBaBCX9x4IyMHtUF0ftts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858986; c=relaxed/simple;
	bh=ItDuIzkAMqI4qhudvDEQpCDeZktM5bnSnYhcN82xNzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfNWncdEmD8t/X+1t+cJhrQZ310ZlAKjfG2WGz0p1wus1KhBj13TmNEtivot9Op4MAEAlpJYA5I59NahiGWHUlG0tuJL3EM0vEKAa44CXFDbbptz5uehK3QEfuYg4DmRvYwdq2t99oFr7kAhx7KnWMC0X2fjDYN4Uv7dAGCnWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BogbOvWN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f6d7a2a09so239180e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858982; x=1757463782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYiTlBqSqi4UmKkRdPwsgwuRwJ/h9AHJojKVB5RqLYI=;
        b=BogbOvWNheqI1tlVmtpzXzO+3YCF70iCOfXJJxhqLZ7hzo+1StkRlWGQvl6mg8UtxL
         11SCxeshADRnKw9VHmJDMNXAUveF19FufejJVZlxMyT+LtQ0jTsLEaaPVmQFS7of7nsu
         4mzKYsw7nirJO4nxcNe7VH0E4raFDOc9uN6dkiB/RCNRA5CoSDt3PGHWTmJJsj6D2nRW
         8kaH9IQakpfEXs3KcQJRZMwPUtY5hseI7E0q6rFz/hHvj8clIdSqoweO4+MwO9y62Wkj
         47iR1/pvOwe+EsLvClIgBseWVhU2Sz+DS2/UeA1m3qj39UmeajdryCyr9iGse4pKyjoq
         2obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858982; x=1757463782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYiTlBqSqi4UmKkRdPwsgwuRwJ/h9AHJojKVB5RqLYI=;
        b=xKF8O9WtXBpnFeUJ8l6GfU/nBtHLNBG/eSbZWZ9odV9nyVo/7NZiVS9P2e6ZQc5GxM
         nsYA1ehtWm9FE5wiW5vZfiZStBCL2uj+aNdGP2nKavqrDmSLwJAa3HiyJ9sNax7QjnqW
         jcAd/PW9bGIvwjAqQZTgLGLbVpyDm1bx72PLf3haXQjd4dSqp0w4bZQU8Fa8xjQozkIB
         6Gbr1Fetl3n0o846nC3gLodJWYfTyfYNL6L+x92TRQ5ts5sZZO7r1IBRNm4m4JskOpJd
         mvve0HOvpx2LUxE788yaQBF5+XquHZMVnmxl6d/YaEwLNgld8lNtxG7BBW97c22Thh4D
         YRXw==
X-Forwarded-Encrypted: i=1; AJvYcCVswtifQ/YoNOV+1bh14VveHLEqcckB9/8453lg5SX2ZoB7RaSVrorSrpqqYK1o99/BhZ0JbCDBJWaQ5RrK@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXujf2xZXglc0w7/S8baGGJb7ycpbrhB6sPRRShBE83SjmAmy
	uu6y7+MJnBDKpUYVckjMt1unl5HOmjF1NySRbZBNRSdO61j83VK+LCP45Tr2XL8NW0g=
X-Gm-Gg: ASbGncuJhORFtwx0ZPi4GgIZQDPb+hfO2KZSAS3htwu+U4Q3uwMblLYptuGd3DUOKZL
	hIctqVFlp/OKeMee+AkW1Pr51ktzsLSjX4CSL1A4dZTwDAqMQs74DyDUzcPriv+H+cqeRcA0sJO
	BkKJTxNJqEjO6GoumVyOA9yJuRlL1oXbpnDmPYfRgubLjzEPyw5bNbvpiAIQY7fHq6fViiuNHJm
	dq8u7YwXYrWncOZJNPOF4Vb2eT258FThkEf+mk3hPHUBK+kaO9kQOQ9AFN5umm5OVsWVkkMStU3
	KJFLZ4VMRc3PbMuwi2juptiSQvLhRZwz6h36/bk07LEOi+9qianGpBtrTaSBorOq+8eGAVGFf3W
	rve4EJnkSo/tn2BQBQ4XlPPrT81/NLiHETvnw2pGiq6d8o4NhRP/LblTbIvUxfEeYxAg9nE5jGx
	iajR7rJw==
X-Google-Smtp-Source: AGHT+IEHOc90PUEdOLfGFV/Vsa6nH63GOoEniZw5hBiN03ARsjlyJ7qk2VSx0O/iyQYPDLUI8e9Y9w==
X-Received: by 2002:a05:6512:3b1f:b0:560:7eec:274 with SMTP id 2adb3069b0e04-5607eec05a3mr1064596e87.11.1756858982173;
        Tue, 02 Sep 2025 17:23:02 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:00 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] media: qcom: camss: remove .link_entities callback
Date: Wed,  3 Sep 2025 03:22:51 +0300
Message-ID: <20250903002255.346026-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no potential for a custom .link_entities callback, remove it
by replacing with a common camss_link_entities().

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 14 +-------------
 drivers/media/platform/qcom/camss/camss.h |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e08e70b93824..aa0f6e2e3d28 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3143,7 +3143,6 @@ static int camss_init_subdevices(struct camss *camss)
 }
 
 /*
- * camss_link_entities - Register subdev nodes and create links
  * camss_link_err - print error in case link creation fails
  * @src_name: name for source of the link
  * @sink_name: name for sink of the link
@@ -3638,7 +3637,7 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_v4l2_device_unregister;
 
-	ret = camss->res->link_entities(camss);
+	ret = camss_link_entities(camss);
 	if (ret < 0)
 		goto err_register_subdevs;
 
@@ -3723,7 +3722,6 @@ static const struct camss_resources msm8916_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x16),
 	.csid_num = ARRAY_SIZE(csid_res_8x16),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x16),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8953_resources = {
@@ -3737,7 +3735,6 @@ static const struct camss_resources msm8953_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x53),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x53),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources msm8996_resources = {
@@ -3749,7 +3746,6 @@ static const struct camss_resources msm8996_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8x96),
 	.csid_num = ARRAY_SIZE(csid_res_8x96),
 	.vfe_num = ARRAY_SIZE(vfe_res_8x96),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm660_resources = {
@@ -3761,7 +3757,6 @@ static const struct camss_resources sdm660_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_660),
 	.csid_num = ARRAY_SIZE(csid_res_660),
 	.vfe_num = ARRAY_SIZE(vfe_res_660),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm670_resources = {
@@ -3772,7 +3767,6 @@ static const struct camss_resources sdm670_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
 	.csid_num = ARRAY_SIZE(csid_res_670),
 	.vfe_num = ARRAY_SIZE(vfe_res_670),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sdm845_resources = {
@@ -3784,7 +3778,6 @@ static const struct camss_resources sdm845_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8250_resources = {
@@ -3798,7 +3791,6 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc8280xp_resources = {
@@ -3813,7 +3805,6 @@ static const struct camss_resources sc8280xp_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_sc8280xp),
 	.csid_num = ARRAY_SIZE(csid_res_sc8280xp),
 	.vfe_num = ARRAY_SIZE(vfe_res_sc8280xp),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sc7280_resources = {
@@ -3827,7 +3818,6 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources sm8550_resources = {
@@ -3842,7 +3832,6 @@ static const struct camss_resources sm8550_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8550),
 	.csid_num = ARRAY_SIZE(csid_res_8550),
 	.vfe_num = ARRAY_SIZE(vfe_res_8550),
-	.link_entities = camss_link_entities
 };
 
 static const struct camss_resources x1e80100_resources = {
@@ -3857,7 +3846,6 @@ static const struct camss_resources x1e80100_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
-	.link_entities = camss_link_entities
 };
 
 static const struct of_device_id camss_dt_match[] = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..1d0f83e4a2c9 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,7 +107,6 @@ struct camss_resources {
 	const unsigned int csiphy_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
-	int (*link_entities)(struct camss *camss);
 };
 
 struct camss {
-- 
2.49.0


