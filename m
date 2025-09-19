Return-Path: <linux-arm-msm+bounces-74143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66217B88B97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 512D31BC6AF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 10:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5F82F83D4;
	Fri, 19 Sep 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vEoqylhK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEF2F4A1F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275963; cv=none; b=W7hiuoBrHdk8WSZFyeyJFcVif4Un+izvk4evP81PZCscXL4qwJbnBPPuFCuFKEcrWN3keQ2t2ByWFKNfvv3auHlttHB5FtsKoLyBZm17kerqQOjat2hnEyOkzydii/xylf0kHMH6Bg4ZU0w259aAyrCsjwpp/NYvdFEbRY0LDuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275963; c=relaxed/simple;
	bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSxMQAYZmyo7kqJWebZ83iF4GayDQ62efRen7hOoG4reiK/gKbuwSRIDUE3c5vuyKGhUoTlvjWWlY1QJUMPtPsWNLIcJnoWOtKvKc791HUpDBjmdDRTvo2URyh9PIIRK9J8Pisg6QNAaWBqhk1GV6/mpZVMRJdKJa93JQGPaD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vEoqylhK; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so3264134a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275959; x=1758880759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=vEoqylhK3QJazf5NhrcZZt3WNxESyRdy3QXc0hxN6SGRoaxH3SNzqSmBa1JyVyq0DP
         mko20UlB9PDTJ2eosrlbF3FymXdOxdz7pgZO0I4QmttIYO5EtDBK+gqXI78gEeHR4PVL
         +qqtU/jZ1m6y/wfLsfe6/I6PQc1bFKh0iym8MpzEcIal8PjyBuxTvBEz2qfNqxmtgMZw
         Te/QECiym/Nd1OGb2iqcgZGFuI2BYeZ3ptR1lfnzXWZ55qHsOddu9hBci4kh2nFy4cBn
         739fSdi4roOOUYk5NNtQvuyA9VhRtgBI+G3uXFldoiDbYH9++6a/EBPLs2L+klDpgvA5
         ZOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275959; x=1758880759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=V05TnISK5KT0CGPRnABRkgq1rbXqW2MRl12DU4fd6jiqjAF8ECPPnStCahsRXGrG6N
         nBGBOBvlEjKhAFU1BYpRVOFIVJkNJIs/mH036k5aitBmc5uWu6fb2ehlkvzZ9qIpEH/q
         eoyk9jyqCkOq1j2kuEJ6goL7FLoX5/kraMnUHvjKOfSA4AiVe6u45jE1Ojov3VZ3m2oi
         MG6wxiYaQeZs8aQ43tMoG0dN9RXrOdtdswvUTMfi6B8fy2D21UsAPJjXNm2McLDqw9fE
         TvsCTR3qSE8fxTNrqnXaRhsQft1gjR/SLdtNknrVFU/eshRmeoq7i5qcWapokC6F1/Pd
         +Hjg==
X-Forwarded-Encrypted: i=1; AJvYcCV2BW1uBvVm2bZtHaqXnm78c8dFVwyCnzBzSq4LEtBKf2yiwdpq1pSWHOYamyxNjjZdve8Liv4s+H/Zlvxd@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAkoTxlUaKyHR/Gi6H0Ct7n+gYYbjTC2ITSewxKORLM7Vo+3K
	Gu18Me8ZMR3ZkjQiNJqVW1VKblbd4tk+zLiMCONeZeJonAgu4+M1U03qc0op8ZKtJNg=
X-Gm-Gg: ASbGnctwop87BagYXzXmxGVlBjpXqqe25Lhv2cMcv3fao7VIZVhVGUX5AdSER9BVajj
	9XFsGT5F197lbf/QnjWS5UAgQXmJ/C8AfJs5RxwJoDXNWxdPVyYMBoDAUewG6aRphcgrbwvGEks
	EGpNvo61336j/eBklGIRtvqyIHYYgVw1WRQaGL1vpnEeIIHq1dvkoHEBgSGYBH2dYHzCvR8G1yM
	N9dVaM0LpxfzHmVYGzs0eMt8yEYMhQ3DhRxnO9q5h4dHUie2PrR4Yn1S5PXqtcsZJywRycavbzs
	e6DZiKuf6YUJWqbs++6ESTwoDhokLZUJLj3zuF5NACyuM0nDrvGMmkwOSWQ9QPw1iYT32gJFt5P
	JF8sFeo/rwMZIt3Ihk2aV7CkYRac9eUjUB4Ms/LCRcU1GXsZ5tsvvBUyAoW9O9A8V6Lggzw==
X-Google-Smtp-Source: AGHT+IGcg73bZYLri35zpeSxGcbf84lNjzcJ9lVXYFxYS+H77YE64UdSEUtkMOObdzMncpDcwGV+LA==
X-Received: by 2002:a05:6402:4590:b0:62f:af:60a0 with SMTP id 4fb4d7f45d1cf-62fc0ae770fmr2120994a12.28.1758275959086;
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:23 +0200
Subject: [PATCH 1/3] dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE &
 MDSS_RSCC resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
 b=9VFYR0Pqu1iH5ar5ZlAGzd8yitkjjLnajYHWb6JRqnUWIorerIbWE+NyUoFK9xsMG83xD7v2s
 JFGROYBycauB8OiG9vpOylV18dL8CshQCYTm9MAqYN8hlrRs+EK1Eh+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the indexes for two resets inside the dispcc on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm6350.h b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
index cb54aae2723e8f20ff3eebde3e15e862be750712..61426a80e620ac795b6f0ccda173654d7e47e59d 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm6350.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
@@ -42,6 +42,10 @@
 #define DISP_CC_SLEEP_CLK			31
 #define DISP_CC_XO_CLK				32
 
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
 /* GDSCs */
 #define MDSS_GDSC				0
 

-- 
2.51.0


