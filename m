Return-Path: <linux-arm-msm+bounces-26819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB069393F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 21:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28614281D90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 19:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55ECE18030;
	Mon, 22 Jul 2024 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="b98yME0V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="MGz5XHmt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173353A7;
	Mon, 22 Jul 2024 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721674920; cv=none; b=ACMUQqnPrmwqQ37XmvurUCw1FuQ6ToH1sjdMLsFx7+WiMsYG0m1fFiN92vYdQOg6Wa4rD3lxUbdAzVRvzQeXsIeb2AqNfwQlyK9A5M3S1w8Jb7+MryQPZXE7iEV9o+RftfLXIICXAfxkUjA/9P6vkzKPFsglzccDQig6t5Ioll4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721674920; c=relaxed/simple;
	bh=0uo14afUEzne9vnxVuwrp9QKQ6NK+A71OhWJJFjJaKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxHzSHnyO1stsS9Re3NuE9NENQLBMoWuxHYKRZc9nxF9soxjdcEh0gkhdkTUopGyPjOhYb0RMg6JF0bxvJkNioB51YvEHoE8n4bgJNMmlYixGJeJYZSIImq2vAluUu/O/FuM1XX/6yTDXdXZh4WsyHhX0Hc/iT5QbQpA/LXdLGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=b98yME0V; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=MGz5XHmt; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ckiLPsfgWLYtV8eCRiqxvPazj8pD6PAqaY0xnFqMvHg=;
	t=1721674917;x=1721764917; 
	b=b98yME0VI0t7OHEnvejTM3lgGw2cQqC0qdqFGPDdikeBWYyFxqSsiJukCIBp0lQ6wPZPZ8KWnFYjN+fU5C/lLeuSFK4MW8opQB51RMtkLLlNnX+SOHn4jQr78vQX7YpYVncLnXitypPH78hBnevS2tz/BYlZnCGWAIAK340eAWI=;
Received: from [10.12.4.22] (port=43198 helo=smtp41.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sVy0U-00Gb0j-5i; Mon, 22 Jul 2024 21:43:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=ckiLPsfgWLYtV8eCRiqxvPazj8pD6PAqaY0xnFqMvHg=; t=1721673814; x=1721763814; 
	b=MGz5XHmtqd9r52CVXUTLNTDk/O4Y3+ldotim6NL7iq+YeplVl3hPNLb0M2z/j4e+kEb2bUiv9QH
	+BAUChNapzXu6jnsiB+Z5xBUqnsJw6mkqnRKp5iY2QP0KEoqjSq36mWdBfJZCJfrdrdWg2zslpOGd
	5oRjYod7JatMrIsnz0U=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sVy0F-0000000068S-1vIq; Mon, 22 Jul 2024 21:43:20 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robdclark@gmail.com,
	sean@poorly.run,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	fekz115@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	cros-qcom-dts-watchers@chromium.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin (0x81)
Date: Mon, 22 Jul 2024 21:43:13 +0300
Message-ID: <20240722184314.36510-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722184314.36510-1-danila@jiaxyga.com>
References: <20240722184314.36510-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CCCBDD1BE5E962567A5A873F5605CE152182A05F538085040F0F80B61667D01C13DE06ABAFEAF67055FDBE47B3E6A5E4F48430ABBF7BBE8AF242CE91CCB49B96E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F50D2638D9B46FE5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370CE92FB8C11ED3D88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81E94834882A825BBEEA9110145ECC81A22F05A9B085546DACC7F00164DA146DAFE8445B8C89999728AA50765F7900637CAEE156C82D3D7D9389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8AD74539164518AE5F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CE6BDB36F057AC83C9735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C35A87C19D41235D19BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5479AB7759459A11B5002B1117B3ED6968B666F38A997E59B47A99E6294EE8661823CB91A9FED034534781492E4B8EEAD2B25D9E4C92BC8ACC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF3F14167CFCFE6708BCFB0934B948D7C73ED3C2987A6945510D753EB2493F531DA0D894938C2B729C16E58414F0424C7233402F1660DCF847172AF92A66CE5F5B66389DE01A966B978100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiOw1HgDt1ryww==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28E504BCEC120683F15BD7E8EA988E412437F8BE30599730E962C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B401F4E5391F75DBFDFFE17084D77CFDC2D378E69A43F7799A049FFFDB7839CE9E832BBE59233B4F37BD64CBCDDD0C36B1988C2E399018E7BC25CDCEF1474E70C7
X-7FA49CB5: 0D63561A33F958A5C671C8A61CDE276B52CAA2AD0FFBE21C2E899DE97C0F60208941B15DA834481FA18204E546F3947C76110848F5F7091FF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006378A96EA883B63738E389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C35499B88F6F3D8F3D35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiPu0/l/w6bsKA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

According to downstream, A642L's speedbin is 129 and uses 4 as index

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506e..99f0ee1a2edea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -869,6 +869,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },
 			{ 117, 0 },
+			{ 129, 4 },
 			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
 			{ 190, 1 },
 		),
-- 
2.45.2


