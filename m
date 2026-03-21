Return-Path: <linux-arm-msm+bounces-99002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBQzAhVqvmlYPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:51:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF52E4845
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 10:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66FF5301D310
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 09:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004DD2D4B68;
	Sat, 21 Mar 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVm6gEZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DD12848AA
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086672; cv=none; b=HU+Acov0jPCPvO+7+BI8toTW5lPGSsGdYvW7U2ztezNNuNT7vAJ0R2HgrHKr+FusD8H80jIESnCqDFt4p5xSV30qs8HXqTph0TgbaNFwqzIvnpI89bh4kIDtBsZ0hd/TNWJ/sfbjQGqC8ML5Y8xCPVxAQt9/QahI5Umr1qvj9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086672; c=relaxed/simple;
	bh=oYGllORQe1KtTW7SJUoYEU6wdznpdgBDarm6BDzeQYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j3MfTdK0oS8143e0hcDIKfi7Tn34g8tEDhwUicFfrDZwloSNryadgls20cmEOnvOOG550FKVWsXwKfZjarZhD/VXzPxzYlR9sdDgUGyLe1dDrH8FSN8GzHvcStlZl9OOYsAUPsaAGT8tAgynZjjWeRQDRgPrjFl0c+wbR043R/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVm6gEZx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab39b111b9so6171335ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774086670; x=1774691470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGQi8LEv7kZuoyjue24gJuvJD8zF1I0JZAlNaZK/Ick=;
        b=hVm6gEZx1fI8m0t2TMocpsirmw76ToBGwNd0D8B+sIRgo3O0IJm5XdpATTX3H5fOj2
         hORzgjTH35pT3BQYsMSHSkCWOVt6ZMk+OyuAv5W6bMWcDozHrUKsMBanwa5F+XebkDMc
         scQqf2SJ6oZ92XOwgL93F8fb73i5AJ+AsFpfu4S4VxVh8sXhafNIz+yDojUPLMfE/ZFR
         Uvo5rqBtxWuK/hUIiFTTe7fan+nuZS0gvzUGnpV0GOKCOyxvaK6gQmqtGufT/QjC9ZYL
         QCVna+5Z7gqegkEkKn8pEoaXRalVGEVC+x4KU/iLACmei3kcQwj+cvkHiNxdGD0mBGN0
         bU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086670; x=1774691470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGQi8LEv7kZuoyjue24gJuvJD8zF1I0JZAlNaZK/Ick=;
        b=jWvzvhxmI0bdjqYpGp2zw8zl1VzpQKbhOygDBtn4CAq1PwxEncQ7pqd5aR/JgflPiY
         5MpiFnlJ1SKkjE+zYzm62DdG4nop9oIyPUDaMX/jvwAx62jUrH/CfIfms3/42cEDBxh3
         hNRn0eY3AGpkPvukKW9AIoDk0ZTNE3+lrmh2tsWCNioSUZZgJZUGj6SipzgSbbyeV6p8
         vOVQ+c/rLMWauf/zakm0a/lJLQFbDB/0topo/auTjZ9vpzAlMvLBviaWR888x0jGyEzb
         lnuJIjKU1vSLN+Ro7hKMZwfDm3iMWQ8hGkH5RVKpxorJehc+ozXl3uYfC1Q/RIhetLs8
         /pkg==
X-Forwarded-Encrypted: i=1; AJvYcCW4BuZrCoQZlh76r6XrUM4WfomejCZiDtA3b9PcYNR/rME5dvKeeJiYfh5nPbaLhohSx/ImkgbSZyR/nt81@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Wl8l8acou0eAsnM91CwyqgqnqPEd/R5i1Vf/Y4cDh6zlfwIw
	5QWZro+rRTgD0lSFYn09qM+p1f5sMn/hYUTSmT0NSoci3z8DYlhDlqYv
X-Gm-Gg: ATEYQzynkTcoXc8WWGCFGOk673Brw5rGw3JfUNe1FqOzzUPL3i9wr5Z8AxIkYJ03Dae
	Y/0HjySO94OdqAT0vITWmSXm+Hpo2Xloi2N0WClQIYu+tZU+UVyHOYiLtPnBvmjVgY/76wrW1IN
	WxKtdLWhJYfxfGrBQeOKVmNVCdj/6pUSLV3PVXPt2gYigow1tlucmuE0IfZlf0BZUDr4Pj3UOkt
	uNWPC8ZX1fGpaVpyMjo5S0YK8PMTU6KpWTEB5NxR8YeLDH84lhoAjZXVsZjDyprMVdU4slpw5qT
	I4fZkgiqujNcy2FAHJstKpFEoereQUwV/yRDHjjCxvLY05yfVwO5j+F2tO22s70xD+zd1KYByHr
	CTSt9LD5wCtUM/OsEr/FQeraMio3+lcxAjFBRSaDSk3w/ffYVa++2fdm6jG0zcGyCZwz2CJJZ53
	iij24+omLEMzaa7rJE/qWVfyNV
X-Received: by 2002:a17:902:cece:b0:2b0:69bf:a3df with SMTP id d9443c01a7336-2b0827a4fd6mr56886375ad.27.1774086670002;
        Sat, 21 Mar 2026 02:51:10 -0700 (PDT)
Received: from nuvole ([5.180.78.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549f63sm46739095ad.30.2026.03.21.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:51:09 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Date: Sat, 21 Mar 2026 17:50:28 +0800
Message-ID: <20260321095029.2259489-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-99002-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4CF52E4845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recently, when testing 10-bit dsi C-PHY panel, clks are different
from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
now (dsiclk_sel = 0)) And we failed to set dsiclk's children.

dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000

byteclk was set first to 108120000, so the vco rate was set to
108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
172992000 on mdss_pixel_clk_src later.

Since there was no matched ratio, we failed to set it. And dsiclk
divider ratio was set to 15:1 (wrong cached register value 0xf and
didn't update), we finally got 50455997, apparently wrong.

  dsi0vco_clk                1       1        0        756839941
     dsi0_pll_out_div_clk    1       1        0        756839941
        dsi0_pll_post_out_div_clk 0       0        0        216239983
        dsi0_pll_bit_clk     2       2        0        756839941
           dsi0_phy_pll_out_dsiclk 2       2        0        50455997
              disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
           dsi0_pll_by_2_bit_clk 0       0        0        378419970
           dsi0_phy_pll_out_byteclk 2       2        0        108119991
              disp_cc_mdss_byte1_clk_src 2       2        0        108119991

Downstream clk_summary shows the mdss_pixel_clk_src support the
ratio(35:16)

 dsi0_phy_pll_out_dsiclk             2       2        0        378420000
     disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
 dsi0_phy_pll_out_byteclk            2       2        0        108120000
     disp_cc_mdss_byte1_clk_src       2       2        0        108120000

After checking downstream source, 15:4 also seems to be supported,
add them two.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index fc696b66cc..6064a0e17d 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
 	{ 4, 9 },
 	{ 1, 1 },
 	{ 2, 3 },
+	{ 16, 35},
+	{ 4, 15},
 	{ }
 };
 
-- 
2.53.0


