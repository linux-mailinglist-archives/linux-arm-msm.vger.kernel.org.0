Return-Path: <linux-arm-msm+bounces-27575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7A89435CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1210BB21C46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E215D3EA7B;
	Wed, 31 Jul 2024 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="o1K0q6Ju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp61.i.mail.ru (smtp61.i.mail.ru [95.163.41.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FAD262A3;
	Wed, 31 Jul 2024 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722451579; cv=none; b=dQSX/xZQzChuRhtRjDVAGGLJN75shPSLCua5NgQzmgxGIt4WTreltJRhQRS+vToaF3uWpHcKy7kSLla+qKetErkJnRdnsdWhsLPsNNn1J1Rm8BHZUFOTAnnaBOSNNvIsY1K0W49WeOsvr0Dmo1oSwAaJ56vDgaaGeX1Qd36EVd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722451579; c=relaxed/simple;
	bh=zS75Mc3DJ6hfrQRKtgAxvIMbmdgfQwBsuAtw8Kn7vp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cllkx838VCbXswfnRDyYNP63rSMNxxUKBMq/yKgUa14DbOtnCBp0rDi0TNQ73ybiSBAZH6rAyzn99KvgFZ5R44UQcjEtvkqzfZ3/haCQpM4SNzEPmltDHsazGRdAPxLjwZyBUnKoI95eXzXPoy12falnK1pmkLkrk40ZEm0/W60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=o1K0q6Ju; arc=none smtp.client-ip=95.163.41.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=GsimduPJxkxLe40pEahOpdoqbzbbrX3CY37r/6vDoas=; t=1722451578; x=1722541578; 
	b=o1K0q6JuhsxlroCxSVPrO+VKG4briO82iKIC0T8biya5Np7auh3hC7AGY65M9geF2TknEj5UJAx
	KK4iFvRU0AIN9u0g6RT/0ghYEPwHDUI240bxoBHehgjKI3CcFC2leq6iwkLSjarHvlQmpZ1wwvfL8
	l10rEQNuH3zpKFd7HaY=;
Received: by exim-smtp-5c6c85c787-dzmgd with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZEKu-00000000AEA-2SOK; Wed, 31 Jul 2024 21:46:09 +0300
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
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
Date: Wed, 31 Jul 2024 21:45:50 +0300
Message-ID: <20240731184550.34411-3-danila@jiaxyga.com>
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
Authentication-Results: exim-smtp-5c6c85c787-dzmgd; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A979C5030B5D4423D655FC690E8AB11230182A05F538085040AC417E07BA2DAF233DE06ABAFEAF6705770B92A079CA97B10FD0310B1A6FC1CEAD00EA28E3F2047E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7E5895F94C5021202EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374384886D4B4FC9F18638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D835B5154C5D3191BE4E40561C8114314486A83C465B63762ECC7F00164DA146DAFE8445B8C89999728AA50765F7900637172F725B8F3BEB6B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC816F36C0CB6DCE122F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C643FE6A0CAC512C72D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3E4A64BF2429643C8BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE7BEE702378D8A34C7731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A51E2048C3D4E8BED65002B1117B3ED6967924BD83B26E21A5AD0703CEB2EF9A27823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC107623907F3ACEFD0A5838B2BEA6F79F2AA47B711326877B1623DD915619208614F3626C4CAF4331D9D8FAF50ED830B33734F9C359E65B42E95572611F80FD25B568A1492006FBA500BB373BEB9681702C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3scjqOC9Te0uQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A5B90ABC46C0EF5FA7CF1FCFAF80C0E9D05CCF06E91720A33CC7438F9FAE1BC72C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

A642L (speedbin 0x81) uses index 4, so this commit
sets the fourth bit for A642L supported opps.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..91cc5e74d8f5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2834,14 +2834,14 @@ opp-315000000 {
 					opp-hz = /bits/ 64 <315000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
 					opp-peak-kBps = <1804000>;
-					opp-supported-hw = <0x07>;
+					opp-supported-hw = <0x17>;
 				};
 
 				opp-450000000 {
 					opp-hz = /bits/ 64 <450000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
 					opp-peak-kBps = <4068000>;
-					opp-supported-hw = <0x07>;
+					opp-supported-hw = <0x17>;
 				};
 
 				/* Only applicable for SKUs which has 550Mhz as Fmax */
@@ -2856,14 +2856,14 @@ opp-550000000-1 {
 					opp-hz = /bits/ 64 <550000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
 					opp-peak-kBps = <6832000>;
-					opp-supported-hw = <0x06>;
+					opp-supported-hw = <0x16>;
 				};
 
 				opp-608000000 {
 					opp-hz = /bits/ 64 <608000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
 					opp-peak-kBps = <8368000>;
-					opp-supported-hw = <0x06>;
+					opp-supported-hw = <0x16>;
 				};
 
 				opp-700000000 {
-- 
2.45.2


