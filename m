Return-Path: <linux-arm-msm+bounces-63869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5CAFA7D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 22:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 982691796C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 20:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287272BDC19;
	Sun,  6 Jul 2025 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ZOvFP4HH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EBF2BD5A3
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751835556; cv=none; b=FlDJVRjVBwKwNu5V9eaU9lIaw0r2H4Rqm7iwQJmVevu5edlArfoHutFHGeiwfxb0PhWHBIdiWtkYpgeUbve0XDlNfFAujslcKmuqL4vKBx9P0vniQ03pjfGes0nOcT6lOErZgBV6//nKRwuDZY6DDjuedIWqRlB7av2rckp1yAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751835556; c=relaxed/simple;
	bh=UU6tATJzFwq5dTFLMgHMJ4uimWg5kKSYyOmbxAGd6QI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a2ZJPFVgFCUDxRPkrB0Imv8onWdgPBxOJjzdWdHXGZg54tqhnrclJm1ixLVdtYgHW34nZQTW+JN12ojpq6f7arGlBComYkj82VHFkGxeVyJRRTBUW/qCzcAO/83jw6ono2n6X0cUnzXVT4xVtpLME4veC4DF67TG0yt03qvJu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ZOvFP4HH; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751835551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+eDwq2SRc8vLb6yDGCfDM1xp95H0CTlXPndJnkQFbw=;
	b=ZOvFP4HH+mmziRCo2hRrKYYMuFqfc+olZJU5uncY5tw45plyUJ03tPWDWUHcVvrUgHP66C
	hLkd8s5Tlek3b44S7nRmwzcIjHVqKh5aJErOmE0HMprliHe1N0ZO+N3YoaRKvtCXrNAFDd
	rNqeMmEBmzqKSlB51jxO09I+n7oHhk2gVAgI9d6dksTKC2Epb6vXfjyQXXrFE4l8d/ZUCt
	z8CqGf32fwham772AK7hbPNZ5CwaCTWKbccXsklS0cdDdqQoO2E/LFJy0NWwNh2IfCqM30
	TSKAFGAAimgIg+1fjYZ8VAbvCxR72bz11RLrEftd0Vc6J0HQgjDKdxpMzl+iWA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
Date: Sun,  6 Jul 2025 17:50:26 -0300
Message-ID: <20250706205723.9790-6-val@packett.cool>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
References: <20250706205723.9790-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow these machines to access efivars through qseecom/uefisecapp.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b0..b001208fefe0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1988,6 +1988,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
+	{ .compatible = "dell,inspiron-14-plus-7441" },
+	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
-- 
2.49.0


