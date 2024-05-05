Return-Path: <linux-arm-msm+bounces-19225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F8C8BC3A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 22:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EBD41F21D03
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2024 20:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDAF6F513;
	Sun,  5 May 2024 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="0Lo53tZx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="LXsOoK36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DDC8C04;
	Sun,  5 May 2024 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714940383; cv=none; b=IiiTVv5tKCTE/7I+UJQHf9ryYcsOXRmp1lYsXePNIqai/Fa3r14NyNPQjV2AM/YSC//IDFU/bummbj8uDm07idqlFFsfmD46DzAPE+26TeYDSkGa1aUqrFBD0xjiZZDy/sx0UwRKW5pZS+btCTNcXlweHHnxezRsJi7zdXYV4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714940383; c=relaxed/simple;
	bh=Lz32QH+AOYKddndm6VwSvGNpw3KQuTtvlRh9u4cvDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/UZMuGrAFPnoquCu02oP684YHMS4OLA77oCD55NM3ybEJvwrQPsHv4WAbLMrp7J7c2qS5565984p7T1rH73ZxGi4w2pY9I395KHDbJ8P86fkenePGuMWCJ5YGr+AB5ZyxhANeoCn49Hr210cIbI7GtSE/C9PICNZRwEbM6knhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=0Lo53tZx; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=LXsOoK36; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=FtrwMFHUE1DjW11lVUVLp0YQUbtcTC3S6y1SQ1RQPt4=;
	t=1714940380;x=1715030380; 
	b=0Lo53tZxC2reJ2Yr5/fmwmDiRCz/cUoec5gU8U20JH+2OM/kidcwbre8cwy893pOicf7DjlIItwAIA3Ft2nyRJu1MmcuRYiv5kLd7DwlI5uvw6Ou8Rmlskq4rzGDY6tVCFh+uoX+X0XkEBfRYQGjYwKiWYedMBhGd6R0Bv5lbzA=;
Received: from [10.12.4.31] (port=36066 helo=smtp56.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1s3iCI-00C0ZC-69; Sun, 05 May 2024 23:10:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=FtrwMFHUE1DjW11lVUVLp0YQUbtcTC3S6y1SQ1RQPt4=; t=1714939858; x=1715029858; 
	b=LXsOoK366kZMTiywt2VJ0WFubiDeCM+CXA8ruW1rX2geaQDMV+ABVpXdjHFLnPQEB0Lsqq1w6bo
	MHoxR+k2O/ipZFh65mZY2Vj7/k/4kjPEqSrMeSW6E+OzhmxmKy+2pyKpYYS9JGNmXVIQF7xTPgnxo
	tjXwPqsD1QJEPkKcE3g=;
Received: by smtp56.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1s3iC3-00000009RwX-2xqq; Sun, 05 May 2024 23:10:44 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	david@mainlining.org,
	adrian@travitia.xyz
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 1/8] clk: qcom: Fix SM_GCC_7150 dependencies
Date: Sun,  5 May 2024 23:10:31 +0300
Message-ID: <20240505201038.276047-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240505201038.276047-1-danila@jiaxyga.com>
References: <20240505201038.276047-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD949E5EAB5516A8929726E7E7EB1B1F8011C4735D5EC4D8953182A05F5380850404C228DA9ACA6FE27EF1679C3C5FEF95B5D1BE6A8D71B10A5860519C2A0136341BE7375619A971F14906DE0852CB23FE4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76F334650EE2FF367EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379B0255B5E5688AF88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D86EDF986723C87846965C51F0EA95FD594F3141D25FDBB72CCC7F00164DA146DAFE8445B8C89999728AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC821E93C0F2A571C7BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C62B3BD3CC35DA5889735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3FF5CACDDFC76A95BBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7CEB265472FA452CE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5306EC9A3BF3301735002B1117B3ED69651F14BDFFB389CCC47A99E6294EE8661823CB91A9FED034534781492E4B8EEADC8D8B8CB12567299C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC62FED735438938CA003F9EA65382E1DCD87DCD03A7C39EBBAE2AD896DAC8629BC84317DE6256153643425263F8C9A4E6C3AD8F5B33DC60BED97F980A7132E10C3C7CD5921BDCBE7146D90F64BF3396102C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDEqu0GTgiuZQg==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C739498105F947809758DEDF57FFD5DAF71AD12C06A238BB78934FFF5773E1D8D86AC8562C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B476D451B6D5EC6144E7684AE56F92982B086DD955A0C1010068F3CF0E9FE49B69A0D2E209AB8FF7E20D5FD9B4F27CE383B541F3B59B59D1F1E8AB790AC4CB01C9
X-7FA49CB5: 0D63561A33F958A5EBEC787826C2090F549507B610246BBA031F16FAD15614698941B15DA834481FA18204E546F3947C540F9B2D9BA47D56F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637E12249F0E86D8F40389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C325AE611EB865B371089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Gch4W13RDFvZxan6sIvYw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add dependencies on "ARM64 or COMPILE_TEST" for SM_GCC_7150.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 1bb51a058872..2b0e536d6d70 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -953,6 +953,7 @@ config SM_GCC_6375
 
 config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM7150 devices.
-- 
2.44.0


