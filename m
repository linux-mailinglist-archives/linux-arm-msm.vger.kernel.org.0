Return-Path: <linux-arm-msm+bounces-73032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32432B52591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E019E3B485C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D764A04;
	Thu, 11 Sep 2025 01:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ndx/kEeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5591DEFE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553147; cv=none; b=iZyliS6Rza6iVi4haTmpThO1Bu/HrItaV7/ixDnyxr06z23jaoeX6CLDafTOmdNdGx8rtBu30kiM6r36V2R48wqghsm/iIaIS2S8z2y94WxOdplZNAcycXVcTOkOEx6hfFIByZZUNO14ucecSVYzgw/8+6hKghNgd6u6bdf8rJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553147; c=relaxed/simple;
	bh=lny+i6/yVgFizIpIJrlHz0PaIRuaWNazlMaLqYSMAMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7oW+uY0t0GG9FgLiUuczhG73kW88shXyBLtT7qLa3JQgLn5WZYL1M5NipEsP5VgBCM4eByGscAnfGHA+DvvZReypzt1JimFJaDyuaQbsqFgwQ1YgcAn4XfWTbqZay7eu1aZ5vB04eB27FyDefPBqQiqz5J+Mt+5j/whcNQyht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ndx/kEeU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55fc2236ce0so25080e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757553144; x=1758157944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02MT83MiCKx+KYBmaRTv8ahirZdU8YNNjP3slDfY1Pk=;
        b=ndx/kEeUWtlJ7VjVoyGJtaF23GG4pYs7CaBnmp0TkrmUi8ZwW+1Jp7hJqs54p+O9rV
         oUl00G9Yxq8PQ0bzQqIU8wlQH2ksuzaoLUA8Bv189Syq21ez+THMrSrM0RUEyI3NeV2/
         tD/aW8EF9QyMgiXeqt38ZP/CEkpr95DOWG5Q8/oNHQ+kAffwZM2pOxUx/pTBBwgC4ifG
         FxGGE1efQSv+TEw0qm2yw9lnUEBHJCvMgm0VJQ4lv6zZwenaZBuGiIVeQtp6lrNG1n8R
         0ekE7Q/PTrHbujvq7uuHKO3edUrNY7cdqRgYhNGzhJSk1AxyeVi3UMg3gUdTJg0hmdKS
         D5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757553144; x=1758157944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02MT83MiCKx+KYBmaRTv8ahirZdU8YNNjP3slDfY1Pk=;
        b=j5bKM08GTjBdRd5ooxhtqhoy+ItTMP1lqIm6JYlpUM8dijNnNcsomNRS8JyGq9dtAN
         vhxPOrtohhhXWp4fGhj75B1XJNsI/wXdlWPIegFktd6VPJhvN6BUZDFIuRHsNtiyLO+E
         WLLBGxNOmma4BIcYrOdmc9BMuWzpSleK8vzQxXIYdMdNvliqt5d4xO8t2fiNTNMvKhjQ
         7GQh8cHmEfii/05iUQ+q0ZaM2dFfNGYy/fsyKEQeMdeA35MgPRqD3VbXqvw5uHRSFj/5
         USMOMHvpceQfOLrUE0mg799qApt7U5gnnXpx9cKayg0GdqRPsQeZC60M9z+bLGRWqvPv
         ncoA==
X-Forwarded-Encrypted: i=1; AJvYcCW9klRjaR2Z8QwkFcfzMsWWXZyVqNIfNA9/0TEqxkZdjFSL02S/9VOkxubrFlNXdnkUl0eOcpItm/reAlAl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3fdTWH0Dbqqy3sI9w7pJFkZLjjJSI/bBqsdjDyYgyWk06iMts
	Y0UO5QUXJzUnYPA5y87lClNzPVoZk1pkczqjATHxcA3nqG5Sz3lnwyVCninCYNWIAT5SUtqWHxt
	vpH53
X-Gm-Gg: ASbGncsDRxsg9U1bkvgRcXym66ZpVjOM/FokHrZnch0R8ri0CMIRZXdlh9XtJUWku9G
	kgen1sQh7MyYWgFvkPanpyXGtJg1RNjWvTSQW0DoI41KcpE921XpZQaFoNr6/blraX/s9g3mtPw
	f9gtAZgiwvrRh+xfJ1wxtdGtCaGcuxirYOjghRJ1sQFB9ftOE6I9ORyytrX/rQSCSYmqfOf621N
	1pOlDBQahAko3luAc3rH9yPtFBdMeZzNroWqqr8q+z0B0j+C+c9IdwJ1VpMt3dc8kEi+E/19G6d
	pEkj5/Twvs0y+2IklJ5/KnnTCiw6LUxt6SZGX1nEYFAOsIWdGcLQ/+pz+2AYf4Puz1WzQczsPwe
	2ZKBBkdxZvHWiRZZaVsK2wvAWBpS8XWSwC3+7KUKDmcmxMObNftThCaCWvgTTABI05wp21wCgXV
	KrXlRhGA==
X-Google-Smtp-Source: AGHT+IEdI44g1/3JRS/obgEgFRR8e6UwS94D2kroflQQNBo7gfc3dUszd3E81tYEoGgE5krDED79bw==
X-Received: by 2002:a19:6417:0:b0:564:7824:7771 with SMTP id 2adb3069b0e04-56478247976mr1746672e87.11.1757553143851;
        Wed, 10 Sep 2025 18:12:23 -0700 (PDT)
Received: from thyme.local (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63f3esm45786e87.67.2025.09.10.18.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:12:23 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
Date: Thu, 11 Sep 2025 04:12:13 +0300
Message-ID: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make Titan GDSC power domain as a parent of all other GDSC power domains
provided by the SM8550 camera clock controller to enforce a correct
sequence of enabling and disabling power domains by the consumers.

Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index 63aed9e4c362..b8ece8a57a8a 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
 	},
 };
 
+static struct gdsc cam_cc_titan_top_gdsc;
+
 static struct gdsc cam_cc_bps_gdsc = {
 	.gdscr = 0x10004,
 	.en_rest_wait_val = 0x2,
@@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
 		.name = "cam_cc_bps_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
 		.name = "cam_cc_ife_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
 		.name = "cam_cc_ife_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
 		.name = "cam_cc_ife_2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
 		.name = "cam_cc_ipe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
 		.name = "cam_cc_sbi_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
 		.name = "cam_cc_sfe_0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
 		.name = "cam_cc_sfe_1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &cam_cc_titan_top_gdsc.pd,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.49.0


