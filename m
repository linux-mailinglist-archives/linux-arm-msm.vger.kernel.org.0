Return-Path: <linux-arm-msm+bounces-55637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA0EA9C87F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA9304E175E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837EC250C1C;
	Fri, 25 Apr 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FI04fkFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A124C067
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582521; cv=none; b=q3KRuFaHj4KXqrF11DJD7b9i301pTEBgHsO3VsgTJvi0Q2Y1uH+8jNp2A8GwBQsV8ogGES9iirye69SBkGcTvI2ymgJLgC0UUwslS6LmtryXXIm804WSE9d3oCeHrz27jq/bHNeAjx0Msm95EslASGKRaF1Zjidrq2q4Jv19ffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582521; c=relaxed/simple;
	bh=RCuNB1mWMaNtm6vRmUVv+04+d3pPrJBXIRhX6cDQxkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brbVl+fLIrYYVh8tz5RwOjS6cOjrfjPvnszXsEEqpuomWWU8DwwpRqQO9WFHraLM1vzK/2vy1KAzAH5iNcTQ4qybq7yIEZswrGXpD8nXXasYDe+eaweHDt9K+4Y89fP9I0kIbegKkE0u5vuRa6tMCGImHKD8pedPDrC9OK2fRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FI04fkFF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39149bccb69so1921645f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745582518; x=1746187318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kN1pqjjlFC9p10HbXmb8Vy14EP3/K2zpEgAzkFrOXk=;
        b=FI04fkFFOUHuVlEGk+5eBkIvYHIjif6gNTFUpDDHoivFEPkfujz3Ki4ZuuzwS6bF3K
         A7GrrxB8BH4y9UtGgoUVMr8Xm5kOkB/mWrdqr2meDGouov7tDuzmIuN8JinUhyIfMbZl
         a8YjVSo1xOzoxuVkK2GWLyvxAD7sacfDek1bV2ZjnE1KJ5o9D1N/rqrI+15EkR6NuTzd
         0xLoMzqaWl747dCS1hlTeURndG7DPk2em8bb7I0dhBJxAdnf9qiLYHP+nWO2tzMd2XpS
         h3ErBuu1vmPNWrIlXuuvLY0QyGWILwEAFukUzUCQyJFhk3kw4YJSJ2XKl1Sic7njsh8b
         /SnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582518; x=1746187318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kN1pqjjlFC9p10HbXmb8Vy14EP3/K2zpEgAzkFrOXk=;
        b=NU7ww4ZGqp425NDn8yscT7RDfrO9jJKRE8Pnb17gNelziLE8T9lmt4Ub2rqU3+SAfa
         DJjP98s2Ss4Q2XjLMRTB4Ph6siUEzE1DF7ncoH68w3Hi+fPzdY2HXVUCAGVBikcFO059
         rgWWSc7aLdj/btDs28CsV8PuGqYKXeIL3ofQQAuhvrFXH1JS3uO98Gy4HNOdPIR6qDfj
         30aj4hzDl3hMZ7LDBRnHDYsCebPugQ2Fuv56QgrpWiu/5GE1nFUyC4HnEFWYlSiIxHe0
         06FNQTDXvJ+QPLt7QRJJ21Ls5/cNODJMGsOncylu6Ewqqd7fygLoY6r91jOmScucrRve
         ONvg==
X-Forwarded-Encrypted: i=1; AJvYcCV1iY//iZWnaNbndsHvwiUJei0G7BkJcmBRbSGsyEd6yUIcjlINWcE/b1hIy1ERlWWHpHhylMRne0cKGZ3a@vger.kernel.org
X-Gm-Message-State: AOJu0YxhcH2NcmryKf2GWz+XD3N/ET+fQyDNVS9yeudEL3Q8BA+Hgfex
	idcojliF8eItkop3Ug/i1XTHDWPC9ES/Sr76glrvqeO6TJItbdpls0f9XbMvzAQ=
X-Gm-Gg: ASbGnct4q8/EwA3H0HYWXUbfID8mV/im05aPzWvCldGyXi2jtNB/JBXIRVk55fnffb3
	wxxsB7HPwxjbw8E2ug7EkF2/vN8xzl652cbAVeEa0bkG5vq+JiHeO85T76ZQ4H77nT2Mxz3h/dB
	7iS1yvWALLKVVFo0S5EX20mh3Ek9zOAGVX+Hr2sDrmpyvxsHY9130Yfc0tfbyBFdUfM2KVX/ceP
	DR8jCb1ql53aSyumm7u4e00WLTnSRRQCUpkL+JPLPAMUtLdBLhytBMLqZQWWQZKm8GRpV+1OLDY
	6tVo7ghnxKFPgTuqJqkubsPumZlC0JaO1sIKOM5hsV4nCEKYktBGey1rL/WRnu8AGwLgvp0x9sr
	rGSOo9g==
X-Google-Smtp-Source: AGHT+IEdiDe5dS/VsCnzDJjmA5qf9ZUMHuvRq5adCp+43Hm7VVJe8IjsSuwxQTyvh1eQCKMHb8d1qQ==
X-Received: by 2002:a05:6000:430d:b0:39f:31f4:f2b9 with SMTP id ffacd0b85a97d-3a074e3814cmr1312135f8f.32.1745582517469;
        Fri, 25 Apr 2025 05:01:57 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm22648985e9.17.2025.04.25.05.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:01:56 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Apr 2025 13:01:52 +0100
Subject: [PATCH 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy supply
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-2-2a3dd3a47a6a@linaro.org>
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
In-Reply-To: <20250425-b4-media-committers-25-04-25-camss-supplies-v1-0-2a3dd3a47a6a@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmitry.baryshkov@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, 
 vladimir.zapolskiy@linaro.org, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=RCuNB1mWMaNtm6vRmUVv+04+d3pPrJBXIRhX6cDQxkA=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoC3mxVVqy3KNvxdEXoSmdKy+go9+MVrTbrnXkM
 2rCz/S9q8OJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAt5sQAKCRAicTuzoY3I
 OiKKD/4/0F0gvyfapk5PUy1qefu8GI6imCIRGSsDe3rGpwEN21GXM4TeuSMaIoQ0ANQPnkhzkCW
 SvA6dInH7uonXaN4OwrWqWt7Z0v9uV3vd0bKJfIW2jSORkyaBsV/XxhbItttTjo8ZFtuJG/2bL2
 Z2/dWtp3I0PSxhg2SP2zoRSVmZ7DxRY1uOSolZ41AI88pOaYY6bmpvlqFr9fP/Zi5+1psa6o3KX
 szgMUQsJ3p7cp4mAoisbS1dO1NypoI8XBssqxXwmMIHXWhnML9tr+TAcQPidKiIwrYTp0qkgt3R
 lXiRJyjWsqS+ov/btEWZIsrB5DEz+4r1JQKQe6MXx9UT6+V4/HTJEaX+/VGGWhvCpCrKbSb/R3V
 t0LjGU0WvbuLdkP+DdRwMztRZ9PkjlvIdE5MPiXh8WHkdFlO+vIeS8sFHSHw06/jHobvappIvC4
 qPymTFMM4CFR4PwkSqljycu2BXJxHYStassHEDcpQi8WFbiYeS+TvQ8IcDFeSRjMxGfbKrQAVJK
 z9Wv6sbtQy2udHNRRQbrI0u6TtFDTO1vSHtrK5XdII+nzOCOtxO5SgNJWA1+FxyBefyB+nsIO9/
 NkPlfF1f0vItr3Z43kKAThW0OfC3NR/jJKsMpSaf7aFB6coeQhoRNnU4T5XOAssopi8x5epM570
 McWPSbtI+/cs6jA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Amend the names of the csiphy supplies to be specific to each CSIPHY thus
allowing for the case where PHYs have individual or shared rails.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f02f9d8d83d06ddaa972eacb593f8..d63bc7dc951690132e07ee0fb8df7cef9b66927d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,8 +2486,8 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy0-0p8",
+				"vdd-csiphy0-1p2" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2501,8 +2501,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy1-0p8",
+				"vdd-csiphy1-1p2" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2516,8 +2516,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy2-0p8",
+				"vdd-csiphy2-1p2" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },
@@ -2531,8 +2531,8 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8-supply",
-				"vdd-csiphy-1p2-supply" },
+		.regulators = { "vdd-csiphy4-0p8",
+				"vdd-csiphy4-1p2" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 300000000, 400000000, 480000000 },
 				{ 266666667, 400000000 } },

-- 
2.49.0


