Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD8B372582
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhEDFaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhEDFaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:30:03 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1CBC061574
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:29:09 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id k19so3325916pfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aNWYHyF10Ocv0rGRJlTBLbyA6sxWZ+weiafnUhBtEKk=;
        b=H16lLhHBiZ9W/Un4AkE6jMkWBw2frgqbf7Eg/+/OqK0hiBEKl4VgMUPRdXXJH1KIT/
         p7N2P75kCYNBGS4+kG259a+H/Q207cyygXepskuVu/jHb7QXptY8Irnr3720q2qI8SE7
         4SRPDC1HdmfAMkgO1QjxSrYDiqNXJGGHlgqFfepy3q8kdgNZgL8Tl38Fq7D0fdadyg4Z
         KVgGWxmNY1A6537b+G1tUHWUXGAziNpeDDwtq3InYmY4lCCKHFixy4Yp7ntqVoHw2WwB
         jU+5UkeFfwIwNKYVwyTH6T3UWJ3zIzizk8WW2LqRdHXpZg/8FJn1/NQlNsosF4KzDZzn
         LYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aNWYHyF10Ocv0rGRJlTBLbyA6sxWZ+weiafnUhBtEKk=;
        b=GRdgXKkBkFtZiYdBgHOSzdMiCf2lIICrqZxmAspbOoBvg9J354wApDhLniNVB8hDy0
         nnQ3Uc+ih/N84Z7ZgGl1gL5KmIywLFmdg90EpL2j9onetLsp2P72e4MR7UC7WrMgtGUB
         iNRyiBUJKjwJtMTDo0eaQI/BoENTWmKguDeulwdZn3clNtdVWWHBV+pn1jQ0Bz7QgFl0
         r7qz5nOJa98aZdXxLdbUUCSpbyKFesMsdZdpfV84bPDtDMe9hWwx0hYu7Id6izVQ7qXv
         uYZFDJgio0Nw7pFKz+9LY7SGdrfQIstpg/rjR48Um+d1OmvzNnqjy39uujwIrFocpCkv
         oEZw==
X-Gm-Message-State: AOAM533knETbAGVP604pXnNd0giTMyQsPe1U0vVjcmoVIOSm2mHXLGu3
        E6FdEBkOIOvN090c0JOjDctV6w==
X-Google-Smtp-Source: ABdhPJw6gk+A/ek8Ww3yAM10K+9EaBpiqvwqGmfhQYxlE90ziBHkIsISurjqFpCvB0me3kWn6Hj5vw==
X-Received: by 2002:a05:6a00:138b:b029:27f:179f:2c20 with SMTP id t11-20020a056a00138bb029027f179f2c20mr21803788pfg.37.1620106148803;
        Mon, 03 May 2021 22:29:08 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:29:08 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 5/5] clk: qcom: a53-pll: Add MSM8939 a53pll clocks
Date:   Tue,  4 May 2021 13:28:44 +0800
Message-Id: <20210504052844.21096-6-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds support for MSM8939 a53pll clock of Cluster0, Cluster1 and CCI
(Cache Coherent Interconnect).  The frequency data comes from vendor
kernel.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index bfa048dc01ec..8c6f8bcc6128 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -26,6 +26,45 @@ static const struct pll_freq_tbl msm8916_freq[] = {
 	{ }
 };
 
+static const struct pll_freq_tbl msm8939_c0_freq[] = {
+	{  998400000,  52, 0x0, 0x1, 0 },
+	{ 1113600000,  58, 0x0, 0x1, 0 },
+	{ 1209600000,  63, 0x0, 0x1, 0 },
+};
+
+static const struct pll_freq_tbl msm8939_c1_freq[] = {
+	{  652800000, 34, 0x0, 0x1, 0 },
+	{  691200000, 36, 0x0, 0x1, 0 },
+	{  729600000, 38, 0x0, 0x1, 0 },
+	{  806400000, 42, 0x0, 0x1, 0 },
+	{  844800000, 44, 0x0, 0x1, 0 },
+	{  883200000, 46, 0x0, 0x1, 0 },
+	{  960000000, 50, 0x0, 0x1, 0 },
+	{  998400000, 52, 0x0, 0x1, 0 },
+	{ 1036800000, 54, 0x0, 0x1, 0 },
+	{ 1113600000, 58, 0x0, 0x1, 0 },
+	{ 1209600000, 63, 0x0, 0x1, 0 },
+	{ 1190400000, 62, 0x0, 0x1, 0 },
+	{ 1267200000, 66, 0x0, 0x1, 0 },
+	{ 1344000000, 70, 0x0, 0x1, 0 },
+	{ 1363200000, 71, 0x0, 0x1, 0 },
+	{ 1420800000, 74, 0x0, 0x1, 0 },
+	{ 1459200000, 76, 0x0, 0x1, 0 },
+	{ 1497600000, 78, 0x0, 0x1, 0 },
+	{ 1536000000, 80, 0x0, 0x1, 0 },
+	{ 1574400000, 82, 0x0, 0x1, 0 },
+	{ 1612800000, 84, 0x0, 0x1, 0 },
+	{ 1632000000, 85, 0x0, 0x1, 0 },
+	{ 1651200000, 86, 0x0, 0x1, 0 },
+	{ 1689600000, 88, 0x0, 0x1, 0 },
+	{ 1708800000, 89, 0x0, 0x1, 0 },
+};
+
+static const struct pll_freq_tbl msm8939_cci_freq[] = {
+	{ 403200000, 21, 0x0, 0x1, 0 },
+	{ 595200000, 31, 0x0, 0x1, 0 },
+};
+
 static const struct regmap_config a53pll_regmap_config = {
 	.reg_bits		= 32,
 	.reg_stride		= 4,
@@ -98,6 +137,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
 	{ .compatible = "qcom,msm8916-a53pll", .data = msm8916_freq },
+	{ .compatible = "qcom,msm8939-a53pll-c0", .data = &msm8939_c0_freq },
+	{ .compatible = "qcom,msm8939-a53pll-c1", .data = &msm8939_c1_freq },
+	{ .compatible = "qcom,msm8939-a53pll-cci", .data = &msm8939_cci_freq },
 	{ }
 };
 
-- 
2.17.1

