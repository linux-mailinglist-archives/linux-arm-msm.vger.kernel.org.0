Return-Path: <linux-arm-msm+bounces-46699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D99EA25282
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 07:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 032677A220A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 06:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB22B1E766F;
	Mon,  3 Feb 2025 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IoQ04YqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1E1D5CC5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564498; cv=none; b=jZS0bZxq9hFoXdbnElQKxgVV17H4B2Wrg6ZCOYfe9FUkpsRqOLYH4eVWBuy8SPdyWogqghHP6uJVeGdv7xQRKC8XwX5rDphP+PV4t+QdXHi0/jJhYY7Jef7XtJ6LiqT2MknfoeV8sHHcpP4HmWBNhK0uRc29mPdbCcbuhk+Im/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564498; c=relaxed/simple;
	bh=Z7++30TD1WmbfjieiAupUdh4f35xRHDtfmGwybMNOtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0frv+vSx/m3l1LZiDCRbRlQl8kxlyi+hBGzYG9QJQ1Zfk+pJrlpT6eetTvmAtlsuIJdNK9U+YFzhNoGMaQ9lNAmhx05pXMqG/mzX/PQK0u7kK38iGVybJIcqsv/makufYA/hAbt37ZD9jkiHcc3r6rt6ElIFSkwjPzsM43P6Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IoQ04YqQ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDOCwL8pLKC2TmvC1CWEJmLmPkxxpASjltOSZmJ9Ck4=;
	b=IoQ04YqQ4zV6NLZ22zmNVp7rXA5+Qhgs5gP968t5WPuxpJthM21mKrzOLtvgL/7cIzRLBx
	OI7dVI8aaBUnzgmtFmQwfmLTpKH3j9ev5lxwCN5DPlot+zOPtHWgIjJvro7GdvGsTj9Zkq
	ZSfBzZHVHvsnwy9LChMAVsNZ2xcTHTky+MAjalS+jZTkJWEAA/BAb28Yt8BEPK9c9TFPvU
	rBQEMEW3tvdSI7lwbk8MYrkoi9ylbJPjf8l4tpwH+Q2Y8uyFGDNQ+asb6URurKpyORgoZb
	W57CbYYlLFSl8p0pWCdxgmhDJaKUjhxpFcF5ozfcfOGSW5Q+tn9lNLvc6GX/Cg==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block resets
Date: Mon,  3 Feb 2025 09:34:25 +0300
Message-ID: <20250203063427.358327-3-alexeymin@postmarketos.org>
In-Reply-To: <20250203063427.358327-1-alexeymin@postmarketos.org>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This will allow linux to properly reset eMMC/SD blocks.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---

v3: dropped "Fixes:" tag since no user-observable bug is being fixed.

 drivers/clk/qcom/gcc-sdm660.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index df79298a1a25..01a76f1b5b4c 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2420,6 +2420,8 @@ static struct gdsc *gcc_sdm660_gdscs[] = {
 static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12000 },
 	[GCC_QUSB2PHY_SEC_BCR] = { 0x12004 },
+	[GCC_SDCC2_BCR] = { 0x14000 },
+	[GCC_SDCC1_BCR] = { 0x16000 },
 	[GCC_UFS_BCR] = { 0x75000 },
 	[GCC_USB3_DP_PHY_BCR] = { 0x50028 },
 	[GCC_USB3_PHY_BCR] = { 0x50020 },
-- 
2.45.3


