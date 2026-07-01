Return-Path: <linux-arm-msm+bounces-115555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PdmjC8VbRGrdtQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 02:13:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D73056E8D1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 02:13:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Asl82RKt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28BF9307AF29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 00:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008216FC3;
	Wed,  1 Jul 2026 00:12:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC11BF33
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 00:12:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782864768; cv=none; b=Dcz5WbY98lo6vnaMIMiKVI/1rrK9ei9oY4keIigHbQZLylW04HieMlJzw8h6b0ax3sFx3Z69tIFTGLu8koKSOp5D7/YWZgKWWHeWjv+y8MMUC7PSLupYQKbp/CjjCYDptrv2hHBK28mJ7sfEqah3m0VTS74sMd3AZxw/+Ba97DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782864768; c=relaxed/simple;
	bh=/981d2iTu3k1moKZIW+6c8HWAdcMNNwAINHe6ojx3ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMWhDBkrZel8cJMEPslXcNyd2NTFhxvtAhJUxQCLcr3OHS76gb7xYY3RxyrU+er/HYvwSBueLiHT7QQxZEflwTS6vj5VWKnJpXK3KIwQHCFe9PlEvxBcn6eIXzeHBsaczZa/brRdiyysplvry/VW6wr6mjqI50WWvROh6/FmV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Asl82RKt; arc=none smtp.client-ip=209.85.208.171
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39b1593e87bso136871fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782864766; x=1783469566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTuETi34i3b/LACJpmuwFm7FuPpOJ/h6Tsgd07zA5JA=;
        b=Asl82RKtdhgWG1374HI47aESPdTPE412kflysG6vsvn+i7E7pBJ0PH3aeerkqzRhjH
         9ryOlFQG7w44gg8qmzLcmGCXXmfcmX63/KXHrV6RllMD1snkFtHdk2K4EUlZx4br8f7+
         srQERIOZxpGPwuBgOjgC/yzb9OCc1Nee0JCS1j4ZXZClsr5IBsaWePV/wfoX6DRsDSoN
         0MUJgfAHBzo6XSU6t1pAafTvazXoiq2sK0Zos0l1iH5p65T8f2kRGBZDibcdMFaqlf6q
         iV4QW8QdP9E9kPdGlYE7ogOnDmLSJOyqie85vCN7Ievs/+K6m6IoHwI/si4DOAw/29UG
         3FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782864766; x=1783469566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTuETi34i3b/LACJpmuwFm7FuPpOJ/h6Tsgd07zA5JA=;
        b=BdZuyINhU0bRNeCjKDZxdfHHRpZlwXvODBtG19+DHMvpzoMiuxUbRSatA1lZfD5hwb
         laDukIlwWO3XOjcPi9AxYhhIFPGbg/vN5hvup9Frfk4W2Zf7LwwhrmR8HFxz2Zyu84CH
         MiFZoRwuMHNWQRnI6PLpEeVm9ZhSAHEQVRzf0kX7wFbivx+QwdttRSif9LZorT4H1Ilb
         2LIC4/any0oKejbkKlbW1mSH6x+CfMNQGctFiot9lYXIS14Kff27E1FVUAWuHRVfaBro
         zjQvj77CJKbnnSrXRQCx584Tem5P3sbArReC6KBlIiAm3SgRKMKIVUdmwudIf0Hns9DG
         Hpeg==
X-Gm-Message-State: AOJu0Yzq35UkPwnEMcIkwrSgJsZgyGGRWnip0tfS8e4T19g8G1X1VE67
	y4jDNj1OI24KzClbf6aRlCNoyPx2pfo+N3K1Y46yhLYrZOrWCbdp5UzsVhPiQc5Z28k=
X-Gm-Gg: AfdE7ckSsP07iQ3Fw8ptqS5mu8+zOklNJyD9c+mbcOehCdH2MK2ncRD5KS549JanYCK
	DjcivyJ3/yeqGXSMhDxf1MKMRQEWXvpit5ljf6xJhwI47izI5zLDzOkPp3XY9JlSrTNa0gODAmu
	FshaPZCR3cTh8+bURiW189yN2q/RhNlgotx0MTcksxE7koSWfblJnF5qpvWU8lNQCgzXtbpLuwc
	u7jMjVyFXKvBL7kw9cyRJ82LoDEPXf/kpAsx9oWBQHYAOWXFpiqbQWh6jXxjXFiSze32xlLDwju
	CMKVLlsV6+9shzQiCXmCuc0b+bhqlcNgI9PYBmbS5bmDdL2qmdSye49SoOQYLrzySpu2EU/iXPA
	wvakuO+R5SjaSrDzIYg8GOVJCaib/wyO8m2M73MLy8UodkPoRGu7yf6BpsYGoBGJETbxQmeTfKW
	ZAZzfIdTKi2IbWwLSR3qbaUg+zXJO+dvN23XJ9gfpax2+BMQ/3/1HhAA==
X-Received: by 2002:a2e:9659:0:b0:396:a453:746d with SMTP id 38308e7fff4ca-39b1df91c88mr4688811fa.8.1782864765673;
        Tue, 30 Jun 2026 17:12:45 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b2f9da2a7sm591721fa.22.2026.06.30.17.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 17:12:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Val Packett <val@packett.cool>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for pixel clocks"
Date: Wed,  1 Jul 2026 03:11:47 +0300
Message-ID: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115555-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:val@packett.cool,m:m.szyprowski@samsung.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D73056E8D1A

This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.

The commit causes quite severe problems in runtime due to the introduced
cyclic clock dependency:

* dsi@ae9400 platform device and its probe depends on dispcc clocks,
* the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
* at this stage DSI PHY PLL cannot be locked to complete driver initialization,
  the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.

On RB5 board with no connected display panel on boot I get this error report:

  DSI PLL(0) lock failed, status=0x00000000
  PLL(0) lock failed
  dsi0_phy_pll_out_dsiclk already disabled
  WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
  ...
  dsi0_phy_pll_out_dsiclk already unprepared
  WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
  ...
  Tainted: [W]=WARN

The problem has been already reported and discussed before [1], the original
commit was done for "preventing potential stability issues" reason, and this
time fixing a potential issue introduced the actual one unfortunately.

[1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e59cdadd5647..cdfdb2cfb02b 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -578,7 +578,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
 };
@@ -592,7 +592,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
-		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
+		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
 };
-- 
2.53.0


