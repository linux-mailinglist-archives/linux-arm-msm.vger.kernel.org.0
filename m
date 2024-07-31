Return-Path: <linux-arm-msm+bounces-27576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3FD9435CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7551F23703
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA11B1304BF;
	Wed, 31 Jul 2024 18:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="LZVyD/zz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="HMhWZKxY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F194EB5E;
	Wed, 31 Jul 2024 18:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722451582; cv=none; b=um+nYz+pxHKkueOKIfqa20s6N93ptin9hY9yi05rpR6mN7dAjyU+zw+gU2y4UA2VqXVrKZj8Equb5pS+s0v2hqPZaf33xIbltvn8RVXt6SPtI2Eb735gkjtbh7tMtNLM3Q2q82W9fjmoJqowktiv6TBJsCfEfopo3wgLAaY4EaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722451582; c=relaxed/simple;
	bh=JPq0pFtlvTBJSOv63xE03YI0UMVQwIGWIXC2+ZnSErc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s3qC0UYfy8OpXLXA+eczJMaTtH8X79w6tYaya/aJWb2Ek3MrDSTQguGUdaV/OtqNxx8pvWOAQkEv9LyncBl1yBET7fLZ5MgHcbgc06gDITkUU7bRaCY3ZiKSFySdzGxkk6hhNKLrCktQxiHKnqjPMqNznRbX8FipIsiz50mtfSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=LZVyD/zz; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=HMhWZKxY; arc=none smtp.client-ip=79.137.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Sag3F3fZq/iL7pB8r+76bTd5Yz2B+KcPYVSx/oB190g=;
	t=1722451580;x=1722541580; 
	b=LZVyD/zzv3weU2TyrYpyrg7emgXZQ1PtB4XMl0zPBrVsXkDNGU57foar1kbvw2Ae98+XZKbmAJWGPDYf12SQLrRdYnYTz8/xyPPD/jmbWOpaKMTb+UI7AmRthU0Wdpqyoz/z8ZcF2OUMfahI9T00+UTJHFiB3YAnOBEvAhuibKg=;
Received: from [10.12.4.35] (port=42852 helo=smtp63.i.mail.ru)
	by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZEL4-00E8GQ-O2; Wed, 31 Jul 2024 21:46:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=Sag3F3fZq/iL7pB8r+76bTd5Yz2B+KcPYVSx/oB190g=; t=1722451578; x=1722541578; 
	b=HMhWZKxYpnPTx16fOtZTLEThRmGtMrOz0tGMUhxktcaVo4wIOXiCgZAY8doYoRfOZXamFIO/jbl
	B8AkDGve/oYl6P3qXGNlYpWGmWKTDCgvIRo7pVu3BQ06OVdTKNP4bA03eKdHSDspAD+XaxfGc9zR3
	X5ZDCYRaDrtamYONHlo=;
Received: by exim-smtp-5c6c85c787-dzmgd with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZEKq-00000000AEA-3w0s; Wed, 31 Jul 2024 21:46:05 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
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
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 1/2] drm/msm/a6xx: Add A642L speedbin (0x81)
Date: Wed, 31 Jul 2024 21:45:49 +0300
Message-ID: <20240731184550.34411-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731184550.34411-1-danila@jiaxyga.com>
References: <20240731184550.34411-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9C7DD05013CA63362168DAE368B9DB680182A05F538085040FE44FC3E3A8453483DE06ABAFEAF6705EC7E1BD1AF91146D0FD0310B1A6FC1CE42A26DAC8B975E28
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE743D95D1474A4F818EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373CF509324F67ED188638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D848A14189AF4F51BF4E40561C81143144BE0100C0070E4CDFCC7F00164DA146DAFE8445B8C89999728AA50765F790063707A1F3761B83B09E389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8D95D32202655EC45F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB22D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C385267523C8841599BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7BEE702378D8A34C7731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5E6AC3A34A2AD65135002B1117B3ED6967C34B9FB9073C66AB91D2EB2DEE3878C823CB91A9FED034534781492E4B8EEADAE4FDBF11360AC9BC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD6CA8787F5BEC78B1DA63D0116CAEEF25912BDB422C9982FF868416F26C3C0CB9AB7DC20417E21151D9D8FAF50ED830B64D912D2482B64592E95572611F80FD2BE1552F50CCC6197500BB373BEB9681702C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3vC4ymuBFrNAQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A5B90ABC46C0EF5F0623C2DC5F880BF92CD592699A16E1C11271C29BF1EAE7272C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD13D22A8CFAE84BB7049FFFDB7839CE9E45E89A588AFC0705B2D1DC6AA0A37503AD3E943750C91A6E4F0F38786286195C
X-7FA49CB5: 0D63561A33F958A559346554EEDEE0903D0B0320C18FC6ED7A987966275003D58941B15DA834481FA18204E546F3947C5D19C1A866823038F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006376D29E9A4E2269F55389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3FFCBA205665D830A35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3ustpGZLV77ZA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

According to downstream, A642L's speedbin is 129 and uses 4 as index

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..99f0ee1a2ede 100644
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


