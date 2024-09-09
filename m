Return-Path: <linux-arm-msm+bounces-31328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A8971BB5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1F9B21DC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54431BAEDA;
	Mon,  9 Sep 2024 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyoDWfk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD41BA897
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889908; cv=none; b=Md0BdpEsF/wQUrHxW2qUjSew6vfwsBL+7hjSlQ07HK5pHfy5FfpujR+qJw4xbdBwnhfOe8ElAPQ4AYH5M39dYOxMWYUq+SYDvFay8e6a7sjZLopt0KArzkLHbC2pbd+g3tfvzRK7vqN7+wv++gF0i5ZQJEdzBzywArqzDl+wFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889908; c=relaxed/simple;
	bh=NpUoubZdNxPAP0/VQA+CguJJu4K+4PwUlJgiCI3BfEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0NXwtW1OnspJ4UquqNfLPad8NFWA5RJHMgpCTk4jkgxS8yYjVCAuUstsU0Zyxx/hMh43A2S4txx5jiIRe3uvrz3p2Og3NG+iI+D2EF2CV/3KmxV8JLSeu9k591IdyqNrCrbouAfSNrITQIapka0YiKh1aU8DaIKbUcE55oaPPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyoDWfk1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a866902708fso26993366b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889904; x=1726494704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5ubU/nIvmhUK+978Fu438bn7v+wIGW6OXK49tq6QXU=;
        b=cyoDWfk1hwq23ev/0KNkf72vlqXks7zcE5fbWrbyQltFACZO79Rc64bR/T73D2iO2v
         EyUEqCALE8KnEA6ZuNKdlZcoBWvxSpoGAxc3cDYvxFQKqZCLQBgJBYFZYsMXUNtD7b0J
         0DEdYpDFYX1oikoAxZx+DbmjLiRqpy9h7BnayCHiIftdr0J9NAgyWvXTNa2uznthVYZA
         SW7Ecc/I4nCqI6IJmT5hfMTxTsqdTizLvGT+bGmBms6XzbJQpzrK+CoyqDL4fM7JSi6E
         HpFN8BqQMh3JwnjpjT73SiSZzH5iyl6QoXL+pYpjrsnQSGDBOaWs9HWTcdCG7yiiy0os
         1P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889904; x=1726494704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5ubU/nIvmhUK+978Fu438bn7v+wIGW6OXK49tq6QXU=;
        b=kmg2rqEIAzM7VD8KmHd45q4PJay15W0h+VeMTq4+onWYpy5kLkRQKGwF9nOm0wETfw
         KdH4fWuwGXfXrNh69VBGKt2CYw7V1dKDe/LT9W7mJmIxNDsRrfc3WlA89Jxug2/x9qAY
         wfVf7eST7vE2oFapYLsKZ1AL4SgCcw4O5lvoj9OKX9JTIkLNtWcXTaCUfPuqz1WRTCwD
         TeanncigYIwfTkLruUCa0+UpZd9GUaRfBYB1DzmTAqZ8tP0TTdpRQUmqUknj1wY+O3aN
         cy+nvBNSm6jTeOJMDDDHHzM8/uEw04pM5vUjDfiVjWQEBYHX/zuunQEtUB/U+Yi7mllC
         sz7g==
X-Forwarded-Encrypted: i=1; AJvYcCWzryAnSrKzormwuTlmBTMcmgtYCqLKjpNgV90WxFOSy5ztOyBrHQaKlSdyZPE/iRCVyj2rJEl3Wv4HaQwU@vger.kernel.org
X-Gm-Message-State: AOJu0YzGwGi+3omfBa3jDAIazbjj/C9X0Wb36Sx4DIJJkZq+ev+EbUhx
	OfpZXLKExyIs+Ji6t+CL0VTdABSQ84O2uxyCHkIilF535RnB8I/uqgFwUy1VtKY=
X-Google-Smtp-Source: AGHT+IEugSgsSV0xgb1AxjeRmN9gIBXYvzLHz3hHfeWqWgETWGq55T1TciET1HOvhecAnGFDnoDFNQ==
X-Received: by 2002:a17:906:c151:b0:a86:a694:aaff with SMTP id a640c23a62f3a-a8a885c3502mr329789266b.1.1725889903950;
        Mon, 09 Sep 2024 06:51:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:15 +0200
Subject: [PATCH 04/17] regulator: da9121: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-4-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3601;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NpUoubZdNxPAP0/VQA+CguJJu4K+4PwUlJgiCI3BfEs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1bGMGjRSX40m+jFUd3qXmQIrwJMipZzv7er
 WSu6zsXuOmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79WwAKCRDBN2bmhouD
 18ryD/wIt2dvPBpg6GfCuXTwI8ZHq/Xhw0UUKgiDvi6l0M1lAqmPdNe0fQPYFdpV7zloCImte9+
 P1Rpg8oK5fB2xYfpH2YGpbqr1Uhp45D3NIXMWFiwAa7P73jVOxmn+pZE6+S75b0NBihnwBDjqv3
 NL+/U8t1DkPGHOMx/S5pQEuto+kc7rPd1Cfw99rlH0l/lzWxFCcWQlABzlx1P4BLiiA0ao2ODqu
 b/ALGdnj/u5blpYURBGbHBgJ/eHqljdezVIzg9T1mrzgl5rOOrQIhrUWD4ipvwr5NEo/W0y4nsN
 luFsScVmEoJCcxj9Zm2tdwmc8QNWI7cZjM7r6NM6X/0vujLWQfb+C8O/RrZXkdMsRey99nU+XTZ
 siCy5IFha4lpKRaEUrjQ36PxSn2j6+NhxLSi98Ap2WmDA/tL4vEu+5aU8/Vik/zUhQVzQ56Y4kG
 JsRIM+M9H+zlrQqGWCgPeN+1Tr6T8r9aAmrQ6sqclP7XEYOZBglrDetgxW/lPldfEDwGHdDizXE
 cs6pOl6y6qIifPvAtZ0g2YecHTpN6UlRVS1nPSXvnVuF0kvICRhgHpvK3wfYnEHvv/fSEzP7qzF
 2B8SBCizdJt1YFjLGsqVYGocM+c7PHZL+/nyoTU3nG99OO4KBmwJqaadqY8XKMT6J6IbL7aaDNx
 6L2A2Di5T3Pdssg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify static data with regulator description (struct
da9121_range), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/da9121-regulator.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 5524bd314f13..ef161eb0ca27 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -53,7 +53,7 @@ struct da9121_range {
 	int reg_max;
 };
 
-static struct da9121_range da9121_10A_2phase_current = {
+static const struct da9121_range da9121_10A_2phase_current = {
 	.val_min =  7000000,
 	.val_max = 20000000,
 	.val_stp =  1000000,
@@ -61,7 +61,7 @@ static struct da9121_range da9121_10A_2phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da9121_6A_2phase_current = {
+static const struct da9121_range da9121_6A_2phase_current = {
 	.val_min =  7000000,
 	.val_max = 12000000,
 	.val_stp =  1000000,
@@ -69,7 +69,7 @@ static struct da9121_range da9121_6A_2phase_current = {
 	.reg_max = 6,
 };
 
-static struct da9121_range da9121_5A_1phase_current = {
+static const struct da9121_range da9121_5A_1phase_current = {
 	.val_min =  3500000,
 	.val_max = 10000000,
 	.val_stp =   500000,
@@ -77,7 +77,7 @@ static struct da9121_range da9121_5A_1phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da9121_3A_1phase_current = {
+static const struct da9121_range da9121_3A_1phase_current = {
 	.val_min = 3500000,
 	.val_max = 6000000,
 	.val_stp =  500000,
@@ -85,7 +85,7 @@ static struct da9121_range da9121_3A_1phase_current = {
 	.reg_max = 6,
 };
 
-static struct da9121_range da914x_40A_4phase_current = {
+static const struct da9121_range da914x_40A_4phase_current = {
 	.val_min = 26000000,
 	.val_max = 78000000,
 	.val_stp =  4000000,
@@ -93,7 +93,7 @@ static struct da9121_range da914x_40A_4phase_current = {
 	.reg_max = 14,
 };
 
-static struct da9121_range da914x_20A_2phase_current = {
+static const struct da9121_range da914x_20A_2phase_current = {
 	.val_min = 13000000,
 	.val_max = 39000000,
 	.val_stp =  2000000,
@@ -104,7 +104,7 @@ static struct da9121_range da914x_20A_2phase_current = {
 struct da9121_variant_info {
 	int num_bucks;
 	int num_phases;
-	struct da9121_range *current_range;
+	const struct da9121_range *current_range;
 };
 
 static const struct da9121_variant_info variant_parameters[] = {
@@ -188,7 +188,7 @@ static int da9121_get_current_limit(struct regulator_dev *rdev)
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int val = 0;
 	int ret = 0;
@@ -219,7 +219,7 @@ static int da9121_ceiling_selector(struct regulator_dev *rdev,
 		unsigned int *selector)
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int level;
 	unsigned int i = 0;
@@ -259,7 +259,7 @@ static int da9121_set_current_limit(struct regulator_dev *rdev,
 {
 	struct da9121 *chip = rdev_get_drvdata(rdev);
 	int id = rdev_get_id(rdev);
-	struct da9121_range *range =
+	const struct da9121_range *range =
 		variant_parameters[chip->variant_id].current_range;
 	unsigned int sel = 0;
 	int ret = 0;

-- 
2.43.0


