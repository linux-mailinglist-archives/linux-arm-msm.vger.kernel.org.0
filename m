Return-Path: <linux-arm-msm+bounces-32622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B806987AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8397B24B69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E6B187342;
	Thu, 26 Sep 2024 21:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIsLFDJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F5187334
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 21:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385612; cv=none; b=JjqoB1Ez569UuqOInY6l9MnQW+g+0hD8CzFQ4EVlyWJikTvUvqrsmMNqN1WqkHOI4BhQbA6+uXMm5S6/Qiq+CvEbwBbYf9dtt3+m6T63bVsBbAdxMbr/rnzqjDL7YWORu6+4GhzRroE6jwFsfzbhDbd/roeqYM6M61fAGCRLj0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385612; c=relaxed/simple;
	bh=1sHmwkQeldUvan3DXa9NPnUnQcQojpW+2E4OZqOhIrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLfbKne00yY8WusfllkzImNEAE4ZdHJ1blg7pxz9/zENHtaADynNOtqJZMdfoF+GMqfa2gzyk9c837q+jgQD8VprGxNEqShVjspC9A/7DncXIA0L4FbZwhTZvUTKDmHheF95jK9VQlnz5PeU2KD5/UAVnjgfgih60yaVRJZsOcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIsLFDJN; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f7556a7e73so1115371fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2024 14:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727385609; x=1727990409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6mj3rVPPTOsGuFLiJ5WXlKwr0a8XbVZn0thC7dU/MU=;
        b=ZIsLFDJNTliM/hZAUqxMCOjElqkOu3B4HDfUFLxirXrTUhv6VhKa4xB5036/d7Kofz
         6DaDdevUrQ+IdXqAqLak/4idZCZ84vz+J7q1hps2HhiTQqdyhn37XSdBIrpzqaAgj6x8
         oLQBzSvxh43c9Bw4px0cGrmQHz2gKCdUWrHBmU1WpTauvRLtLJmEDKO2E/pfsiCxKxwb
         DvuWA72hdKsjktS2S1XIj+k+VDjQbZutGSlCau6pmxZbPGwCVEccgzaF/4TjXCO8+GSD
         C0XnNtqxJU/XHAfj8tWLdKGuCgWyr/G4rHxzMeYSWqtpNOelOjGnj67SGAogoOCV7Tho
         55bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385609; x=1727990409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6mj3rVPPTOsGuFLiJ5WXlKwr0a8XbVZn0thC7dU/MU=;
        b=Wg9LjdY9bP4f7bMbSJ+puuv+Ksx63+yF/w1914AyyLtjWj2gSWGuyPlPhuWEIeSEHg
         U3MDPgstopCmo7fkw9jrhomZ3/OAzd9JISEXRincDRYyTb7eMrz1kCoYKSLdVVl1KVKV
         6TOXenR7swkvn8yvscCqiJQLeFbkxSMYzcDgqYEuM0Pql/PFnyP+CGR08GMkNb0a2bYS
         gpglvom9KuvpFpj2lEY2OTznBNvRFZ8pxyrztpByVFeTL04X7eAqKIbGr3j4MhYzv7rH
         2n1t0ylvV3YrcHYZM7Lty/6XMj104Qp9diGPXGQTFrHBojeKPdHz0mnF0opb4m46hrJ8
         tazg==
X-Forwarded-Encrypted: i=1; AJvYcCUSnyX5nLWk6S9Pf0YVIPLXfJL9hnE4/lzgJhvf7+26PAkWpQHvbt+aHAeeRZg37qhkVtFGshtgbNwT55J2@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeE3+BDahoF2fhl0we9pFCRBJvyA4U7gTnapGl0uIGQN/LTTs
	TwRG2Cp0Uwq1CbQrsNWti8pFopTntDaeLMeFrvi8inX5zFMx8pECHSJdesVLywQ=
X-Google-Smtp-Source: AGHT+IFIONc1IAhkFsnT1u0FsikeU7/QX6SH2g8WSnDaV/EJRgArVIrexFJtr6G9azzr44ECbFVw2g==
X-Received: by 2002:a05:651c:2229:b0:2ee:d55c:255f with SMTP id 38308e7fff4ca-2f9d41a4ccemr2009351fa.7.1727385608856;
        Thu, 26 Sep 2024 14:20:08 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f9d4618a80sm684901fa.107.2024.09.26.14.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:20:07 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] media: qcom: camss: move SM8250 regulators from CSID to CSIPHY subdevice
Date: Fri, 27 Sep 2024 00:19:57 +0300
Message-ID: <20240926211957.4108692-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
References: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Qualcomm SM8250 SoC there are two sets of regulators, and each of
both sets is specific to six CSIPHY IPs. At the moment there is no
proper split of two "combined" regulators with quite arbitrary selected
names in the driver or platform CAMSS device tree node, however for sake
of clarity and better hardware description it makes sense to move the
currently existing regulator resources from all CSID subdevices to all
CSIPHY subdevices.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d64985ca6e88..576c9cb2aa3e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -837,7 +837,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 static const struct camss_subdev_resources csiphy_res_8250[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -850,7 +850,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -863,7 +863,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy2", "csiphy2_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -876,7 +876,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY3 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy3", "csiphy3_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -889,7 +889,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy4", "csiphy4_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -902,7 +902,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 	},
 	/* CSIPHY5 */
 	{
-		.regulators = {},
+		.regulators = { "vdda-phy", "vdda-pll" },
 		.clock = { "csiphy5", "csiphy5_timer" },
 		.clock_rate = { { 400000000 },
 				{ 300000000 } },
@@ -918,7 +918,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 static const struct camss_subdev_resources csid_res_8250[] = {
 	/* CSID0 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {},
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -935,7 +935,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 	},
 	/* CSID1 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {},
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -952,7 +952,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 	},
 	/* CSID2 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {},
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
@@ -969,7 +969,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 	},
 	/* CSID3 */
 	{
-		.regulators = { "vdda-phy", "vdda-pll" },
+		.regulators = {},
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-- 
2.45.2


