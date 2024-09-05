Return-Path: <linux-arm-msm+bounces-30966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F272C96DD22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA8DD1F2173C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A196419DF74;
	Thu,  5 Sep 2024 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8yZex7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C5619DFB9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548563; cv=none; b=Y7txJF0EVca2hEBZr17pMFcZmNw4Ux1CicdcWSXFGluIv3QJk/yblpb4g8B8pomrawoGq/092/Vsv8zdZYnJCssONwfLN5Oy08p/Oww8WOKmnWYVBWWwV4wl+M77r9qYcC5c6N3BLlagDD7qMjvAKjYx+Jpu1PQyjm5wfRdyC3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548563; c=relaxed/simple;
	bh=DQiGGGdIUmOGLqMSP8S8D5US+EouETuqJzqDRM2nEEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRH8LMqirt9OZ/Y+SLZEcznAwaJjPuxhaIAmSr+xLO5Z5DIziiX4V5pIWUhv18Zty/q48PB27K1ZTf+olyZcryfxWYqiS9bWvS7GBo78htYQUmpS3M4MSgPyiq6H5ZTHyiGeLrIuXP2TJEDJOj2NJylxHXn3mxXCuegppM0AbLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8yZex7D; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bbd3bed1bso1195425e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725548560; x=1726153360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7NNd/zrhBJckNNsMfazAJhrD8NLYgZbQToW3LVZTbw=;
        b=m8yZex7Dbjy6Xxu9RCV6nf5qCpPAeb+w7jLuxKfskbXYoSlBvJ0aQU8thoi/G2uKz3
         MmvUW+S6bRaQtQUpmVrwru9s4E/oN51Bv4vio2E6PXTcFu0KpO/G/ckdW9sBYjYqEv8U
         dg0XF1jQEne9QaiKWLH3aLx3rM2Otma/Athpq0qoHwPaFUxHXwrnhDvGVQOx8umyoV5x
         Fy4oxx7sM4cWUaTeKaiGUstgk3mFgMGgpwLQJN0g47q5jwMtsPTyd8Tpe6FSXZOnOtEF
         i8IXdZ51Sjx4iN3UnJJ4OWqjRby/M2j/Hc0A8EMnu4rUXStyCSM+JSxKzd90m/CMmZ7c
         iang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548560; x=1726153360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7NNd/zrhBJckNNsMfazAJhrD8NLYgZbQToW3LVZTbw=;
        b=BZGVePvCI95Q4FV9EZgu48EWXNyMwEbW0DIkRzdTCAx2P3Km5JWrcD7nx22ZtVwhhF
         SxRA7LJVfUvkrLyeUqe//KgtKy9jyCNffXzup8eQokl1xtl/Swq+MJIp7WDgnIGgVSwQ
         Ky5AsoP4uhp194wPDJc9hiaqFGFlyRvis2HVapCqdlgrUt3ALSt0q9sEDUeWOzFy3itE
         u2JfzYNKguldzuceFNamORgX5/BA1tFbqLOL34clN0OWC8G9nSlXvTqWdf71BbX8jgPz
         79yVGM/lalOQLiQHh0UcQ9BjWpA4i9FHXE5qoDKdlK8BS6dEQ10Ka7bqNqscg8FffVZ4
         cdpA==
X-Forwarded-Encrypted: i=1; AJvYcCVtkJkRKqJVJ9SqaeKvGXJ+0Xs9dcFovGs3SqPaCOUVsXnULvvOCdsSWtbHXII4kHIkLwok+smHU9H8hBWg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7xJHLqS3Xywp/G4VazwCfRqSlbjHPo6jaWix8kUBcdR5SN+Y
	Y6mQ36fUlKHEk6/EDDtSn+L3MAm5cb8tLpxkY6hIQ4mLEhiDKkeX83avlO8Odfo=
X-Google-Smtp-Source: AGHT+IHJlS5UY9DkXnqsdsszOThXDhvA3DLG7+xih+aR/w+ZrYYdsKvCAGQHHk1O73JLUcrl3hmIsg==
X-Received: by 2002:a05:600c:1554:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-42bbb43d5e4mr86867955e9.4.1725548557922;
        Thu, 05 Sep 2024 08:02:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbdda3958sm203212705e9.26.2024.09.05.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:02:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: qcom: constify static 'struct qcom_icc_hws_data'
Date: Thu,  5 Sep 2024 17:02:35 +0200
Message-ID: <20240905150235.276345-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drivers and core code does not modify the file-scope static 'struct
qcom_icc_hws_data', so it can be made const for code safety and
readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/common.h      | 2 +-
 drivers/clk/qcom/gcc-ipq5332.c | 2 +-
 drivers/clk/qcom/gcc-ipq9574.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7e57f8fe8ea6..7ace5d7f5836 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -35,7 +35,7 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
-	struct qcom_icc_hws_data *icc_hws;
+	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
 };
diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
index 9536b2b7d07c..00c48478c887 100644
--- a/drivers/clk/qcom/gcc-ipq5332.c
+++ b/drivers/clk/qcom/gcc-ipq5332.c
@@ -3622,7 +3622,7 @@ static const struct qcom_reset_map gcc_ipq5332_resets[] = {
 
 #define IPQ_APPS_ID			5332	/* some unique value */
 
-static struct qcom_icc_hws_data icc_ipq5332_hws[] = {
+static const struct qcom_icc_hws_data icc_ipq5332_hws[] = {
 	{ MASTER_SNOC_PCIE3_1_M, SLAVE_SNOC_PCIE3_1_M, GCC_SNOC_PCIE3_1LANE_M_CLK },
 	{ MASTER_ANOC_PCIE3_1_S, SLAVE_ANOC_PCIE3_1_S, GCC_SNOC_PCIE3_1LANE_S_CLK },
 	{ MASTER_SNOC_PCIE3_2_M, SLAVE_SNOC_PCIE3_2_M, GCC_SNOC_PCIE3_2LANE_M_CLK },
diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 645109f75b46..0405a2473842 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -4384,7 +4384,7 @@ static const struct qcom_reset_map gcc_ipq9574_resets[] = {
 
 #define IPQ_APPS_ID			9574	/* some unique value */
 
-static struct qcom_icc_hws_data icc_ipq9574_hws[] = {
+static const struct qcom_icc_hws_data icc_ipq9574_hws[] = {
 	{ MASTER_ANOC_PCIE0, SLAVE_ANOC_PCIE0, GCC_ANOC_PCIE0_1LANE_M_CLK },
 	{ MASTER_SNOC_PCIE0, SLAVE_SNOC_PCIE0, GCC_SNOC_PCIE0_1LANE_S_CLK },
 	{ MASTER_ANOC_PCIE1, SLAVE_ANOC_PCIE1, GCC_ANOC_PCIE1_1LANE_M_CLK },
-- 
2.43.0


