Return-Path: <linux-arm-msm+bounces-95160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL7cOcf4pmk7bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:05:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F691F2014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 16:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1039D302802A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 15:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD5137B01D;
	Tue,  3 Mar 2026 15:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="It7AjH2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E77382F01
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550143; cv=none; b=hWUpcGmEB1sXxsgW4GrSgpzPILVXzbtuLAPQBT7GhWbbO0/R2NwsYa2Ql/LtO0FIRx8pBu3HF0TF5wpmr/NfeKCeTuoDPJ9fghIAgq0SLxOFQhQuOgQ+9TG9A4Nd69h008aCrh3STFF7kcdDJk83Nr2I3nFymC/tGzRAjMm+UU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550143; c=relaxed/simple;
	bh=gNqnLiUMRF06kVmMGIoKoKFFh7FWu50PSgdQBYVwVXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1PCb1WeObjBUp/l+rstULk63fpSAdZaUW4p4lCbZQdkMd6Jp2cP0pLtSGr+KeMri3I32h60IHs1KKXGxMTPjc3wWmtPuMXGvmsSPGtVofT1XUg5wRPws/8j2F3ZY5Jbck+/ilYOPplrEz6F2AEag455XxG9gjRLji1V7GvIXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=It7AjH2a; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so17825915ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772550142; x=1773154942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbEJcsuZwESDaLeDaKVaWHRTkzFmd5Ebe6jUtHes1/I=;
        b=It7AjH2au4TsGUZrE3drgl/k5w2M+16/U5SjiegC+cbrmHk3OXlyqS3DWuDS48BcR6
         Cem0j/Q5zLTD+fkizfQF9++Li9dOhbJxqD+9f3xVmDCjCdMj2ARN3oPLxqd8VT4wNBXt
         ybGzXeY8AKnjmfJW8KqIwlFRQ4+Hy4B8ytYtjexiA+gWk1IkrOQThgzj0Vrdb8ye33zX
         ARho99eWbHvsbyc7Kl+pUH5zHCLSu1deF6lwKnehTaYyuiAGGDtg6jYCpbeSO/CoTp52
         NBZGuKJvhnqyg+AyC4S8jURJ7Yg4MIAl911nMi7fNnLhyoxIq/7vloGTsiNTCDAAec7n
         xgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550142; x=1773154942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbEJcsuZwESDaLeDaKVaWHRTkzFmd5Ebe6jUtHes1/I=;
        b=h8KwF7w5lf0CW0uFjZFsn0W7VIcmVGtzaRXkJKu5/z+UcAhoHgyK0fsUlz2oX5zcm9
         vbpn02SHSVMfJEkrkI1SsQjvTvpGFNx1vXaJgZ6SHK+s99C2KBdKqLnUcnBZ4Eo77kth
         bTgggZGhZde5NMgwUTbU9nwb8pXQ0aTcqlbvE0yxuvrJIpHc0NURv4RT4Yah38CAgfI2
         ETUqJhwz98f20t+2q/td5HH83otcEsRe60h/woHxZ78OPpwtEW/mG5UhEyV2lhA/IEGf
         GylB2KQjlRv4qYl2C7FpYm7RPQ0waEKbFziHg5RLuWrriM+WBTglazmgs45dCRhIjz/2
         V6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVC/L7HfUOCd5VPfNlwRTKRjfpyZaV742QmpS7FD/eC7dvZ/Z3aHDUZ/t47pQHcwimeJAWUYDvTvBMOseSJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7fkJAuy2o65toHzbLOwRXWaD9hesZDruft8roNzst2nhjgIp
	uVlG51UdpHN+VrrLAf76eUUTmzVtBjObhU4Tz6pzBdd/ANX5lxGoUNhy
X-Gm-Gg: ATEYQzyWLeXPn+gGDSoaa4zk2o6jzKOMiTJqtq8O0UtzEaKiYi5qB7vKenrsdprP9vQ
	PZSrHBZwZsw8rIKTWeUmSRDTHsLMzPrgruneCG2UF7C0wHp0lbM/htgrH4GuqTP5V+w6g9+mTDz
	VBIiMu1Dn9PcsviqNqKN7DMCs7P1A+X3rozCqezzA6hEjPh5DjpCdi6YfvWrvA0Kb/BeJ8MTpjz
	P9IyWYbjFNdWPEqwWzt9BJVV6l0vd39c/bqh4RZHG28pwBo9xavgR/v7B0mIKUG8ePJNJ/+jHXW
	+Pjgnx5SuSkNhB8zHDj0QjiVh4CQ6xi3H7NPodTNyPf12LOOwMUxGMV+VJnnYPZYBb8NC8lvVNw
	6QZOjASzk8SDuZs6Y1bHa3mBwOsE8yTyEomf8l/aRLuwX+6ZpthKhWiu3hoGaAZCvkHaonli9ld
	TwKniF6xbaLwVSZc9/1Q==
X-Received: by 2002:a17:902:d4c1:b0:2ae:4d44:c647 with SMTP id d9443c01a7336-2ae4d44c8b5mr92904595ad.37.1772550140806;
        Tue, 03 Mar 2026 07:02:20 -0800 (PST)
Received: from nuvole ([89.185.27.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm76226775ad.23.2026.03.03.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:02:18 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
Date: Tue,  3 Mar 2026 23:01:51 +0800
Message-ID: <20260303150152.90685-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 04F691F2014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-95160-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Parking disp{0,1}_cc_mdss_mdp_clk_src clk broke simplefb on HUAWEI
Gaokun3, the image will stuck at grey for seconds until msm takes
over framebuffer. Use clk_rcg2_shared_no_init_park_ops to skip it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index e91dfed0f..acc927c21 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -977,7 +977,7 @@ static struct clk_rcg2 disp0_cc_mdss_mdp_clk_src = {
 		.name = "disp0_cc_mdss_mdp_clk_src",
 		.parent_data = disp0_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp0_cc_parent_data_5),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
@@ -991,7 +991,7 @@ static struct clk_rcg2 disp1_cc_mdss_mdp_clk_src = {
 		.name = "disp1_cc_mdss_mdp_clk_src",
 		.parent_data = disp1_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp1_cc_parent_data_5),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.53.0


