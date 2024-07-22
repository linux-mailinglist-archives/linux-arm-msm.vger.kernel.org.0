Return-Path: <linux-arm-msm+bounces-26820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BD8939427
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 21:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3B8228206A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 19:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D5E16FF47;
	Mon, 22 Jul 2024 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wim3zYMP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="C9Inqv2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2936A200A3;
	Mon, 22 Jul 2024 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721676251; cv=none; b=Cli/RWfntkB5e1taEjT3h2BS1Voizr9dD3vFxoZUT//SpVt5mhLh5qwvmALflv2fHhNFE4Xy8pCi2JYnEt4JW/GDob+7J8hQrsun1Pdo7cpOD768ZGaI6FQoedmRKnD4c3c3lTYbGtZfL7N0AvdGxYFWsFuBUxD0FCgscxnjcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721676251; c=relaxed/simple;
	bh=2Uj4/0eeoqJbjBIWqwr6fxVeI2Tb7nsBfgDgdO64Gsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mHWMUrgSmMJuX+o2r9ZzUjMRtJ//MLKBZK9Cy7JA3ujcNDzQPvk6HPjiQwB8FXi8BqLX+DGTXSIYs2//viQy4vlF4/NWhHupH12ceq0vyrq/tCN/aH0oux9X1wvABe/5I6OdeIcr5MHezEStgMDkIMh3AIIaTkgTHXNmRbUDBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wim3zYMP; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=C9Inqv2e; arc=none smtp.client-ip=79.137.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=+rkemg4A/7YwG9uixpwH+cXIdDvzHAfGIk4cdPqNJ1A=;
	t=1721676248;x=1721766248; 
	b=wim3zYMPuMfPuw5mt8MVTY18Zhh81X5lsoV4ir4ukWY/m9nOJLlMA/K6lGLoANscByea0go0KUPfoJZxBkoI2KjzEasjfDW3YG0g5psazwgroPOPa9e73zTAsrhOUtSdRpi70dar3TNOxGuaV1MDFl4GNQhoRQYDE0g3qukdpY4=;
Received: from [10.12.4.26] (port=35052 helo=smtp50.i.mail.ru)
	by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sVy0V-00GONB-Vv; Mon, 22 Jul 2024 21:43:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=+rkemg4A/7YwG9uixpwH+cXIdDvzHAfGIk4cdPqNJ1A=; t=1721673815; x=1721763815; 
	b=C9Inqv2eq5z840pRnA/fcz6A/CDtC12q3EQEydirC316gyV+jrVTRszIq2MB7TF9++jVGKPD+nY
	Hdovt8HouW9XkhnTXhqQvRCo/Lst+tENuWrp7G/vg+Ox2Q0vsH9q1wT/LdF1GD2y3ryc/jPH7QsMl
	FkOh93jBIHo3mfY7O7o=;
Received: by exim-smtp-65fb4546d8-68565 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sVy0H-0000000068S-1YVm; Mon, 22 Jul 2024 21:43:21 +0300
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
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
Date: Mon, 22 Jul 2024 21:43:14 +0300
Message-ID: <20240722184314.36510-3-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD909E26770D4D56B7CCCBDD1BE5E962567A5A873F5605CE152182A05F5380850404F74340FE5EB5FB63DE06ABAFEAF670570ABBE4B8A48E91748430ABBF7BBE8AF3B17CAB2765D6A15
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B5C098D64B45D087EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CAA352D56883AEE98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D84296535BD6A867DAEEA9110145ECC81AEC2AEBB8524169D2CC7F00164DA146DAFE8445B8C89999728AA50765F790063707A1F3761B83B09E389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC84B6F6234D9065C97F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C24F796C710B8583C6E0066C2D8992A164AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38C9B7DB6C49B7CEFBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B652D31B9D28593E5175ECD9A6C639B01B78DA827A17800CE7A5E9F351D2B6D545731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5A2CEBC461A29A66A5002B1117B3ED696009739211D129F5F33EE06AFCD964888823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC6A5837F83B32382378E6EA4E9CDEE76016F6ECE555F0D5390D73A0EBEA1578D80C7DAD1783D929B16E58414F0424C7288818CEE0E697134172AF92A66CE5F5B4D3A5DFDAF9DE2198100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiOIKEewabljvQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981436F3F81E16DA28EF7A6B01B8567BB20E91A1BC8F7CB7EFEFE0723CD85807B622C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401F4E5391F75DBFDFFE17084D77CFDC2474D8639A849E268049FFFDB7839CE9E832BBE59233B4F3742706E38AB0D909C02AF80C9B4DF8AC2DACFC2978A2FBAC8
X-7FA49CB5: 0D63561A33F958A5F0F9510BAEF9C8D2E435EF869C6126F805271FD3395ACEB78941B15DA834481FA18204E546F3947CC11B1E8D35EB7500F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637A38BAC9F596BD8CD389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3975373433331DEB835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojWvq7+FFlTiPVOoADqh7tvg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

A642L (speedbin 0x81) uses index 4, so this commit
sets the fourth bit for A642L supported opps.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402f..91cc5e74d8f5a 100644
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


