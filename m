Return-Path: <linux-arm-msm+bounces-49588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C5A4731A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86DF17A5238
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD551CDA2D;
	Thu, 27 Feb 2025 02:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uurGyW6K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9FF1C8636
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623127; cv=none; b=Hm+eJowkv37E4rlFOpwJ1IIeCyxHv0BgDI71aDz7/+qyrYreVgZIBCEuZGnrLvu2LCeGrWjPShJl5QJjDfrcUCEKD3X670NZDmVgXBVf7ZXpSOD2I1qbA0xazZgTcpTU8+ayv+3ATzYaHAEjZnnGKrqvVdALhVyd7Ww/XWWKIT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623127; c=relaxed/simple;
	bh=RyZRLS8pZm8hoJDU+OVp+AAZeLhFhiibO05/Oz7CvDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9n2Ss1w/SW9mfopevPfwzzt73gUCTmcBXfK9v7XJATyC1i/xsherJw+bnjxGY1b0hVGHIGDTEwSt+KlvSyJ6wkMVfVxZ+wXdm/mUohIura2zykAcA0NDq538gVHS5/ALV4acFtaxxfqlxCWjT7prvzlUrmex0bCi2CDqPxThGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uurGyW6K; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5485646441cso422909e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623124; x=1741227924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ouKK+P8Bp77QlLVV+lTMqGiv9R+6akFjSocFKtf2Jk=;
        b=uurGyW6KnR+p2Od28nIZoja6NRL02b5Y+fSueVYdKXTgrnV/OgpA7wSMXH4LU1JD+m
         Anntv9hvogvPxNbPALtHQvxIZoI9S8+3SSmliihR4Q3tZRpPAjLcacFjCkB2VxLFkzlJ
         9GewUaLLLurKqEIw55w/gpfnt6avKvynDEY94MqySqf0X8XwKc5fkzMS25/9XQMi2h9J
         q9X0cJbuaFjvWc8NhNcgemI5QC9OGJCLk5JQsN55pU+tnooDk7BV+m/8ZiG0fQn0F7th
         /1aGcOlu8A9KUn5spxDbwNvKYuGxHg4JKC5SnL0zFqEB/7jAAa4HSTyLJhVGMa5wmIHF
         hO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623124; x=1741227924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ouKK+P8Bp77QlLVV+lTMqGiv9R+6akFjSocFKtf2Jk=;
        b=WS1vSGOZy5qfnD3s43TyijLTa21Y/tpd9unoyIGoCU/Lz88eYQbtO9KQh3nhrlvk0y
         /7RipnU89ak0nsymb6HT46T0jQiYvZrUg0dZTl8r0q4wH4yBKZrM+IWJDRXJimdDer2U
         7oyGKbswGwxOtQXNUc1xdLhZmzFqJLvj3DFz+mcGsi1q5zXoUXoahMPudTfSW/CNGydN
         nslcExa5R2bF/a/9SZ0gDWLPUkjqlRjvXb/0s7aDxGamIwz+ASUeyVH8BwQmKrWk6irB
         Qc4HG0UhDgTBryhy+bIu2tISh2uLXEl4mQ+4gUPbpx468dNo2jz4/Djur7249rxVn1It
         DeIw==
X-Gm-Message-State: AOJu0YzOWEIQW+dqLvZ3+0VYBinRAJj+YZIU9jo5h7/2hZOl0uHFofx0
	zDvAdhNxIuvfSrYxnlZ+o7fy1mMHuXxT1zDu/TApQHK7uUZFRXjb0eogao004yU=
X-Gm-Gg: ASbGncvwt9DtswyfaeimCiJYx4N8s6k+2197Aa/VJbX9bXPDvg3lrCHYjmNJ1+J0zHU
	Ktxd23I7rjviG/S/iVP9bl4V9oJRXIFzckVuHVlHBUA1XEZuI6sJpDqg+NCTOKdCOoT85jrW/XU
	BFcdjWbtXwyktthdIkQbvNfw+NA4bPU6h0RydUJqSSiDouf6hyIv9LNIfnCM09qD8qHgFUTd/Ce
	YO78WwUMKqqFgwjz8202LUOZlYD6pJAdChAaPfyKK/zMEYp5XGANLjVT5o060qzdehhLbXJCy89
	bQd5rzQMsss3JkWaw+NE2Xwr5Ega3nrO1A==
X-Google-Smtp-Source: AGHT+IGw8901cx7jCW8IdagRI7moWHr/MMfNM5yDe+5tE18iV9njnk83dC4KRsquOX1KAt/AJwgQyg==
X-Received: by 2002:a05:6512:3053:b0:546:2f44:ee99 with SMTP id 2adb3069b0e04-548510d68fbmr6201726e87.17.1740623123953;
        Wed, 26 Feb 2025 18:25:23 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:25:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:12 +0200
Subject: [PATCH v3 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RyZRLS8pZm8hoJDU+OVp+AAZeLhFhiibO05/Oz7CvDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80HC1H31A21mg4pym4gsBNuP+Y0XPTOg2WqT
 WP81odVunCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBwAKCRCLPIo+Aiko
 1bN2B/4+9AgpU9l9qzAXAQxbcg+hLFdSjQXilior66+rMZDVFalCW9/W3knGRJVNzfacf2hDInD
 j9l325E0ZCZR1eVT0PXx9CaGTuKokn/6FTCRGnk/YYWG407FY+wlntoX9fObr7ED8+WHRcafZtx
 k9gjzwnEDAym1/FoHs1XpDh4a/856niPt8lgRzoxEu6bA95Z3ko8DD9iomDdDT2itq++sevwF0N
 1QhipfDTUGvODMu/xumMe54Yup2nSs/dwosAzUGm2krQthWKpXy4RH01jIMhXOSXu81lVlQ4wPg
 VAHGB8kgtUGZ5IVJY7DzCQfDdvTTRU6ydn3L9tQNfMO2Tla4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT in addition to using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index cbd154c72e44c848fa65fe01d848879b9f6735fb..a99bf482ba2c02e27a76341ae454930a13c8dd92 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5


