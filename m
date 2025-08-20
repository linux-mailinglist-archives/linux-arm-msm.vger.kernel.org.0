Return-Path: <linux-arm-msm+bounces-69976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1050B2DD04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 14:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9BE51BA7F1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2192E11B6;
	Wed, 20 Aug 2025 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPzAp2rP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA02ED848
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755694126; cv=none; b=C8wG1wkTAK5xGAuoIX0ZvPSTnJ8T6o0IfGe1vGoBgzZgejmBsxCIy8YDZ3JwcvrRVWkjmEPMSKuyWNtoemLqPKBwedL1RnJjldEPrREtwY/nyJDm47XNIuUfYdzRLsurSAXG/fvUbjCsaVwWdXNg01iXM5BnjHqi57sCuQC++WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755694126; c=relaxed/simple;
	bh=v/R4TrCBrstwUYV7h3b2X+gvhFJUmV73UzhRK9sl0gY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlctaV1469zruyUsrP/zrtVe3ej9cF9mn/aQZozvaTqRl4apLLbRspOKOI6L9CXnajIcM6tHZT8Z3VD8LzUWu0t+9PtPv0/qYnSkZU6eENcMTR+kaJfjE4Mzd6t+DSKmbvVfaF8DwY2VlBFEU8brdxZzuOGZvAX1xldB6YhdI3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPzAp2rP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb74bef86so115543466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755694123; x=1756298923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OkT6TK/LZrlOvYEv9bhxocEXHgpzfm9Pge1oG8/jr9g=;
        b=FPzAp2rP3koPCABTyvD9DlIfQenZet9tNfNdFvliU9VOFlFZVgjaxSKfPaAdu7zi5a
         To4v855FbPuCjsMH3Qx5FkQ2/95qNCGLWxtcZeeifC1v4uBgkmxnBDjEogXcI0nTs0w5
         fx4lYv7hPQAHoBOMY/tf9DLRX1zqA8dvmKPmuCbhFDCVwxbynAw3rZmFzk4HaNSMkJnP
         OPimA93Ev/6dbaukbhPy+fllcMu28iSOHfhT7kus2aH74VIBXkp2A0mlWSnNATC/NV1/
         lwSFy/jTJnDfl4AfUrqWd9HKo+qOSGIAAXJ99bJKxL5anlGYjB0B3xXEidEXxNjiySNt
         qAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755694123; x=1756298923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OkT6TK/LZrlOvYEv9bhxocEXHgpzfm9Pge1oG8/jr9g=;
        b=T6LnYgQcppFDgi/fSaIUeixRopuBrK7wS0JJp+wfdm1GAYHYb3aC8d58+6SCdjEVsn
         HLPVnwwm4Bpz8D6JQkqA3P4047yohmdLles7sVAchMFM2TlPq/kybs3opLPVDtonv4oq
         SnFof1C010EckhDYsGyXUG0lMByuZwqQjTmjx1xwRtSj+/LuXlUo+tfBRbysHKSJb4bm
         blj9A1Sy8Moyg8UC1jTTbgAKzzIcO4wUTNCKsHizXKh38W1nNyGs+FSNeia3RbquBa1W
         5pxtrjiXQVV2YiABh2nluOY5AbWwQvXIBWo2MXPXEDZaOH7Ytud7ayEy1yf4WdU+ZSlw
         4Khg==
X-Forwarded-Encrypted: i=1; AJvYcCWwllnrCEZPn0HvYXewpb9YY4C0EOOIw1UM845GXjRqKi3o7c3S8A/PB3wbasvtYrpij18iOfAxNnYyQgRr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1lTAQS/WU7PEkaiuR6MmLwnucrs9WShxK6FJKMpp7I+tcGOmH
	+1fTKKP+oIBu/cV1arqG2nHIl1GKUquWkNiGWtDiY66JrkY79khwuUUPEhF2Ja1iNo66s4bEtfM
	mySou
X-Gm-Gg: ASbGnctZmxqu1h9MZPFuETCxp1w90AzcHjfsnUg7G4SWghtIO29Guog5DVE+4oJbKEK
	IWko1Lk38/4/zz1OLRCaCn2DlitRrCb/2MprqVtne6W7k3l/qPtQ4g+o+iZicF/bMsa1d6D90dE
	Pwk0+uNXLC8qx4a1x2JYUTeU5Zzm6p6YmgIEPoX0iqizjIVlSUtRspMZfOUfgqxKBa3WMq1c1ix
	cWffB8jZZHM87yS+F9Q1ro0SCU/H9/5OUuCr+cx2852cNAkLDcdg8YI2EbnkW3l5SWFEyqUgBBw
	tp2Dl1Ii1kmzlWOfQYDakLc7oQ3NHIou3ekx/4efGL3myrzvLWeENTcnzA4XsTOh0Bt+irfSi3j
	/GEaSsZMlmWcTNu3yCKLKTwfGUC0c+5EbP2SLJNSrqd8F
X-Google-Smtp-Source: AGHT+IHKzzrGEdiFYsueiKwx9BaC4fDCRH+9fw+xj4goJdji8m0G9uuzPSNtNUweFSOs0P0skvdibQ==
X-Received: by 2002:a17:907:7e8b:b0:af9:3397:ee9d with SMTP id a640c23a62f3a-afdf00a8954mr117729666b.3.1755694123212;
        Wed, 20 Aug 2025 05:48:43 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3020cbsm176871966b.31.2025.08.20.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:48:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] clk: qcom: milos: Constify 'struct qcom_cc_desc'
Date: Wed, 20 Aug 2025 14:48:22 +0200
Message-ID: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=v/R4TrCBrstwUYV7h3b2X+gvhFJUmV73UzhRK9sl0gY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopcQV5wdJMvBk3Pq90PuYVZPxhRxJtpOTusSnG
 rvp0AkCBrGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXEFQAKCRDBN2bmhouD
 189LEACLV67Cz9njRk3BXJodF1sFdqMpzV3yMBrD5APiRGfDd5Iim+lO+9042OVAQEzX6gEpDto
 j+mySuZTaLYVtvsqREB8UacL+tlR1I0pOEreP9WhFqkGyv9f2UrjygNkboeobuFmLPHEzHCJbTk
 oP8Qj/M7RkjOJT8JCJtnQwqIlK83s4NzFfw1WyuEq5rpdq4bdZFBLQcFP0Qu1XOdLyLuZWjJlDS
 1F1Ds8EtMxApSsK8Mkw7fK7gstDVoC05LBeeA/e6guY2vVr5Se9xXe5eWdChqiwM3BqRjTaGo0V
 y2QLt4Nw8ksmXb05LMIJRFUj0Vt2QmYPQ9bohGtEebTWWot8DeQKQpy4j6PDK1V5gYG8c29DlWE
 u73Wi8YaadpnzK9zTWm2LzIvihAQv1Mi0lodu1cXYv0TdYUKNdzf0Qfy4KQ0YCkw2XmuY9kdCpA
 UHXv/wcofTrqUBw/DowCwAnH31aG+v1NuQkHba8muy92gMfaS/CI0kk01E5p0Dr+33gxli3JGBT
 VcbCL8kHet4fOR7sNhJ4wMhuv7nSN4ippJiqyk041EZHUVismnlFYfk1s5hoBhhymmvOaaYM46F
 CECZzayLAaz701KBMnEq3FmHnTGvf8pISase5IOwtBjKD/bjMlyhhyr3Ws3qMKDlDSvTYpXYsQT q2isQaQm4Z/GKnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

My standard commit... I just keep repeating the same over and over
again.
---
 drivers/clk/qcom/camcc-milos.c   | 2 +-
 drivers/clk/qcom/dispcc-milos.c  | 2 +-
 drivers/clk/qcom/videocc-milos.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 75bd939f7dd1..0077c9c9249f 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -2124,7 +2124,7 @@ static struct qcom_cc_driver_data cam_cc_milos_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_milos_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_milos_desc = {
+static const struct qcom_cc_desc cam_cc_milos_desc = {
 	.config = &cam_cc_milos_regmap_config,
 	.clks = cam_cc_milos_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_milos_clocks),
diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 602d3a498d33..95b6dd89d9ae 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -937,7 +937,7 @@ static struct qcom_cc_driver_data disp_cc_milos_driver_data = {
 	.clk_regs_configure = disp_cc_milos_clk_regs_configure,
 };
 
-static struct qcom_cc_desc disp_cc_milos_desc = {
+static const struct qcom_cc_desc disp_cc_milos_desc = {
 	.config = &disp_cc_milos_regmap_config,
 	.clks = disp_cc_milos_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_milos_clocks),
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
index 998301e0ba88..acc9df295d4f 100644
--- a/drivers/clk/qcom/videocc-milos.c
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -366,7 +366,7 @@ static struct qcom_cc_driver_data video_cc_milos_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(video_cc_milos_critical_cbcrs),
 };
 
-static struct qcom_cc_desc video_cc_milos_desc = {
+static const struct qcom_cc_desc video_cc_milos_desc = {
 	.config = &video_cc_milos_regmap_config,
 	.clks = video_cc_milos_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_milos_clocks),
-- 
2.48.1


