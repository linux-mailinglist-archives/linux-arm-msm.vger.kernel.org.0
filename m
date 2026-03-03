Return-Path: <linux-arm-msm+bounces-95122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEF0MzHTpmk3XQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:25:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D71EF5B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761553132DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8233DED9;
	Tue,  3 Mar 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ry4fdJzo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DCE33C53A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538991; cv=none; b=hpnQguAqoNBamoMB9VR68zH0W52i/4TceywcOc5mXoU40TNYgppJASZ3wLQVftzzghEsx1whfNfO2HIAHXQjvxfJ0lOrh7tbFR6dmQXIdkriFYpmrRuQ1Kp96iMQtnXZD/q/kISWwxgCD8++HarKc87StDKN2/WQdRP82IQtGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538991; c=relaxed/simple;
	bh=Nv2zMUlIInFRssnbcBMjdZHlwTtFzLVVfa2D6rbgcMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pdSzrQGwiNCpuhVv5W3BLZzGOxmn0xcJI2SPgLlInc7FdU6MtL0S+ze2971tVQQB843leSkaCqphS/MxOac4x4WSBX4o7Trp1IxpucX5VinLP2NQobiubfvCSVoBjYzXZ8Xtn24aJFi2Ch0kiBLMrTRluX6i3RMpXKeHIg/mciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ry4fdJzo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae43042ea7so29167505ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772538990; x=1773143790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/1rtiSmfl+A3f+MiA/i6+hGD+GQdcF9vqBRx2vgd6A=;
        b=Ry4fdJzoxGEYvoRAUbQn9Gwprd+zNwft8jNSQcdI9PJWPoiWPsRcgrgArR9F2WEVPu
         YbwYsthA6WtWjIgAdIUdyhTPRYxqC1CiZ1x8mThyjazCW5gBjH6yz2XMtOEOVZkq/fgi
         iQmGjVWB04AIdLEef15Jvc6L7+x/Hyn25+KOpNCwLhIe9u3K/CIzvBQ7tFuMc8Q6q30k
         F+d+1Hp36FVtfRVD9SmW5gp+b4YducwJ13HZP4ihINosTEXgRgGsn69uTP4ozcfMS9Ei
         cZe8hni9z1K6Du0H7Ah2Mok5w0gWiWgVGRGZhRhi2dbNVLBQT7AoEHbrbJ3o56sTpOyo
         ogyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772538990; x=1773143790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/1rtiSmfl+A3f+MiA/i6+hGD+GQdcF9vqBRx2vgd6A=;
        b=KXDU+TYFV6kmiBNfZsfllb0pT4RnS8CxOHpSBpDlxgcqCDH3/87RgAMdGXtBwpvPDI
         ced+I2isbzzaO0Zc/hKBJbVHnI83/tErRLVaJxechCzTDS3+bKCWW+HZA3MjiE3ig1eC
         e9xCQg4Ldm8Nj/qgqsnhH/HhWmqrx8BFtMG4ckPs4Zl4oYgIXkotonZE8vcGcJemLBbV
         gCYSRmp8sbudKmJQ0A6HIWzw7WTKPgkCPflonbpfTtSEWJxfmjRd3UPFd0UZ9tXoPN5W
         3yhPbfib+VRCxlm652ZMWyPElKiOr7oNSMMhXeb8Sc0dJ11uxCrq11bpRAKzWc5z0lZ8
         nJtA==
X-Gm-Message-State: AOJu0Yzs5lmfEfiYAIcfUlaUMG/zoWe2tDtICTFRRo7xWpydcIpC7cC2
	yI458ez71Kle5UBT3R98meVQ7dIgL5VJGo38SszNYxqUJDO1UO3p1ihZ
X-Gm-Gg: ATEYQzyHfE9ZNFOa5u7D/bRq67qXE7PQQEuf8r/LvbJfxrdWlxg+DOAxc4m62gRli33
	DOAQtQlCMhwo6DP3MybPV6aF672ir0N3zK0ZYxxTGGDAhuk/R7nO4sNyM/irvvUlWmSpP7GNYht
	JSFSZuZ8jrukHyCJVC6H0+0m7posn0QxD3BkGsTPSp2o2KZwZ2SB/WO9IIkb6jkzXeTl1a2N+cd
	4/8xSQOFytdbkasNTCbmFRbMO9TXk8QQoH4ewKJ7eD49ghVpG6G6gQFhPzeo3bEmA0+RlA4g8pG
	sHvGSq1spOK0Ur3Sq79a8upoiW9i+3ef1osYHlSlZWOYT38y2MCG62aXHLMYK5pXzRPMm8c2jKf
	NH+wwZ/VC120URFrn7Hbb/dGM35TeXIaxj+tvpiqmR60TSv4MQkVgbcASveo142rz1ortdew/WA
	0Nit7iR41k0SjzuOfMVQ==
X-Received: by 2002:a17:903:32ca:b0:2ae:6364:e6dd with SMTP id d9443c01a7336-2ae63650d05mr9679065ad.7.1772538990113;
        Tue, 03 Mar 2026 03:56:30 -0800 (PST)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5dbac7sm227765195ad.37.2026.03.03.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 03:56:29 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
Date: Tue,  3 Mar 2026 19:55:50 +0800
Message-ID: <20260303115550.9279-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 368D71EF5B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-95122-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: White Lewis <liu224806@gmail.com>

The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
byte_intf_clk, the rate-change propagates through the divider up to the
parent PLL (byte_clk_src), halving the byte clock rate.

A simiar issue had been also encountered on SM8750.
b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").

Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
so that clk_set_rate() on the divider adjusts only the divider ratio,
leaving the parent PLL untouched.

Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
Signed-off-by: White Lewis <liu224806@gmail.com>
[pengyu: reword]
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 5903a759d..e91dfed0f 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -1160,7 +1160,6 @@ static struct clk_regmap_div disp0_cc_mdss_byte0_div_clk_src = {
 			&disp0_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1175,7 +1174,6 @@ static struct clk_regmap_div disp1_cc_mdss_byte0_div_clk_src = {
 			&disp1_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1190,7 +1188,6 @@ static struct clk_regmap_div disp0_cc_mdss_byte1_div_clk_src = {
 			&disp0_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -1205,7 +1202,6 @@ static struct clk_regmap_div disp1_cc_mdss_byte1_div_clk_src = {
 			&disp1_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
-- 
2.53.0


