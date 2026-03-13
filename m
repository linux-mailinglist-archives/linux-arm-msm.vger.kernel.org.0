Return-Path: <linux-arm-msm+bounces-97439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPmNNg7xs2nYdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:12:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3636A281FFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1F931F4717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F72374E4A;
	Fri, 13 Mar 2026 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4FiJ+px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D2374E6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400249; cv=none; b=iTVdSNuNafXZPxDBLuz7vb/bZ9fF28E0JJdFEQ+shlhhaLiGAbqHHB/Lkz2v39PWmMnm9PV3YT8hJYYCv74ML3D2CBEV03QZ9LKRZzv4fUO1PA3BF5l5N0ZLACaYTAFOdSxvgH0rXKJ5B995Kq0qMfmAsq2VtTn7EGR7uFmeW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400249; c=relaxed/simple;
	bh=YjeHZnDTNmLswpD9K7Cl/DFnt19DQg/OcvCx1Vxb31A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxuB1vYXVHPb/G04p8lk3+lPnZ7t6Ia6F2tqT5Jx1uVOoinBEID+aPFPpAzOqC88kequla3wDCruH83BhRzG5ScM0D5ay7WZW5g/kAHn/K2/OCxTou537X0gV+CWEMrVXO2QCVmejwyDrvtaLE/dc90/VlOSI7TLqw7numsBMgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4FiJ+px; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-829a568f3ccso1069043b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773400247; x=1774005047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYGIVcFVqzuNdja3UfykwghgGz0iLAtObHJVPJHt+4Q=;
        b=a4FiJ+pxQsxWAs/ARIp076D029S9w1D52IZzxslsOlvV2youDp9nITPoM76huAigEg
         gzw32T+8vsxcWe7kuXxVIIrLdHih4TJYzh1UnDrQoY/AtwaC15z0WukUIzXuVt+ZJg3r
         pdwM2bj367AosQ5b8pIev8nc3StWUL0jqJCXbYQ1szPRMtS1Y4TgxPu4u8dQa7doftoq
         qXv/It+c7d70jGpRSxvPjMTa7cQKcn2moVCH09MEhUN66a3GK7mLdyAXDnbDZPu7bl3a
         HtFcaBurMGNq9Qcnw8YkYD4yV3oo43gD39qO6+441qhi8SJqx58mxllUe8Jxt8PQCj2/
         zXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773400247; x=1774005047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYGIVcFVqzuNdja3UfykwghgGz0iLAtObHJVPJHt+4Q=;
        b=rSdEyOLGtnU8yLp/c0L2dO4ruQzbNU7Mv+SELyajab3HpiGp/OhKGBnqKxhetAOJ8s
         cy+7u0POitBfvV43ZpVoN21lU2oRAk67TEeqlx4QVs6ob1P/cIFWpZfXFKgfMCKuwbvN
         q7aNDoE/1P2NOMT0YTr7PuHkMoDFYMg5X8keluHTwaHgNlRo1EjLBe/IHEeA5Yj2Bk55
         rQ4rzQSQjRLzVEQLLxzXBS6kReQIPx+cUfSbHgtGaIXblAX02yWH7FVCeljlJ5QOR3Og
         zT3kg0BLcrrP5qh0jIM7zMmnt3jrBbZ3qs893C7k3gkVSYID8DEp4T2fo0injd6ydJpr
         4few==
X-Forwarded-Encrypted: i=1; AJvYcCWh2bTIdThyVreDaltOM63F0XParAND6/qAZKI0n9BDPRDS11VR3MivA/TlBRWwTy3TUuvN2DDrzRvn+Hei@vger.kernel.org
X-Gm-Message-State: AOJu0YzwiPE3Smaconpgj4hjHOY232tCKSc/9tG8MkC6ULPKEL3hDPrA
	LPMTk9inhgxgy5p2DqOuF81rVrNROeBXwhQEQMihnT2Fr6ZQjdYyW90w
X-Gm-Gg: ATEYQzzJikwT1zzVNSq5mFY4tmsvy0/9pogpnIdwbSRwAJAtnjqfJAdg2VAv8A2lrSZ
	0gwRyWFmr909nWgWvw/jaKshcpm/RnMp1JctN/5QPwgCdHRlev/UpLbB68PcOdK8DzvUtH+8DO8
	TDql5stCgtvOMSgkXfHRhpyrImLZ1pX8C/QTNYFGtjrjhSROpnPHdGQbRwXnYdEyP6MIwrJ/9So
	TJx1NrvhIQfs8CjE12Qmx17AwBeutcm5wYe9T0xYQTTeWAoOw1R9OFHJwaL9lanfeGEnrOYTqtm
	bgF9akWsg+BFsZTQd0k67/cp414RVxRcDaClQDEGwornahioaQBXlEnIxse9ekgI+ZSc9/rgk43
	n3NYK2bokM53sN9sGBO3siCFZk2x01UTHIZQ+Cf+UT/97JchD9TPqlACu6O5hQtnVay3JLP1kFA
	J+zPCNCelYuRAIZ8vA20rT8KhHgdop
X-Received: by 2002:a05:6a00:b908:b0:829:8e51:505a with SMTP id d2e1a72fcca58-82a198fcbf7mr2256789b3a.45.1773400247400;
        Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340422sm5680044b3a.30.2026.03.13.04.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:10:47 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: videocc-sm8350: use depend on instead of select
Date: Fri, 13 Mar 2026 19:10:18 +0800
Message-ID: <20260313111018.130068-1-mitltlatltl@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-97439-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3636A281FFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both sm8350 and sc8280xp use this, on sc8280xp, this would select
gcc-sm8350, we don't neet it on sc8280xp. use depend on to fix it.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ced60771ec..59c1909451 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1614,10 +1614,10 @@ config SM_VIDEOCC_8250
 config SM_VIDEOCC_8350
 	tristate "SM8350 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	select SM_GCC_8350
+	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
 	help
-	  Support for the video clock controller on SM8350 devices.
+	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
-- 
2.53.0


