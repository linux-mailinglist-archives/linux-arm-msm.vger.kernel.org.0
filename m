Return-Path: <linux-arm-msm+bounces-34372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9799D7D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 22:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFF931C22292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 20:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93BD1CEEAA;
	Mon, 14 Oct 2024 20:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Xu8K4lx1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="NEBmQmwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback20.i.mail.ru (fallback20.i.mail.ru [79.137.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7301CCED8;
	Mon, 14 Oct 2024 20:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728936312; cv=none; b=ZVORdUteqHQUVd/jHiK4kSGJoClGyovA0uZpjl5qNW6BFIoFuZYsoRqpQLdVvNe2CA4p/7Fcp+PqwbhQEjTGJZXt3PaqmYEkazOXX9z6aLoVi365OQ1vhYe0YvxMvQML7iVap1le9M9bDLzE4eDmpNR65PIVzeYdiLeWRxm85QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728936312; c=relaxed/simple;
	bh=+wvtWXeeW+kNT1fmKKhThrB3xWRbIJ7nSgFtLroVjwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYsRDEv3lyhk8xaFxQved3vBkQ+QSygLFTiMQWagkxHxIa0rMLs0lBbEdWNWWQkoEi+8SKsTxK5KoZOOzAtZO9xubP5EUqptf4kD26sbiQ4XQ5OgcfrLET2UgSf1hB/zJ778UVxHtxwConM2e75e3EEheO6Ptatz4bWgetCjeds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Xu8K4lx1; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=NEBmQmwH; arc=none smtp.client-ip=79.137.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=nNzuh9W+BAqQXUDW/DqosGkqXBuTkMV/nRiKIKVvpcA=;
	t=1728936309;x=1729026309; 
	b=Xu8K4lx1huCYNLzrKooU0DH3YBXGZ4qAjXCwxecAuVeNkq37IAmfKoFkswhw3/YIHJwmbGid0DOUaVKgxtfakZycNQC+9xRNo2vYKHu3L07PkyS27j9rzlLuTAJKUCJT1C0J2HteLVzfTPfqesAAOqDoDeJiHdszBi47ey46IiI=;
Received: from [10.113.26.114] (port=45910 helo=smtp57.i.mail.ru)
	by fallback20.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t0R3g-008vXQ-0n; Mon, 14 Oct 2024 22:48:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=nNzuh9W+BAqQXUDW/DqosGkqXBuTkMV/nRiKIKVvpcA=; t=1728935328; x=1729025328; 
	b=NEBmQmwH30lnfj0zOjTEvYBg2WptIC7nOyV5JAoEzB1FqbAhUrDgRJwuuFKj4gMXzw6D8XTdZVr
	mRjEXeJmy6Bpl5zUbz7iDT+fxw7aE99HRwDOi5+iBbiseTUCRVu5wMNQnV4R/l4F7EbnhT4BzXbLM
	nqVUzCME4ktxghYlWLk=;
Received: by exim-smtp-57f79c7799-kvcm4 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t0R3R-00000000HNn-26LZ; Mon, 14 Oct 2024 22:48:33 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	fekz115@gmail.com
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [RESEND PATCH v2 1/1] arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
Date: Mon, 14 Oct 2024 22:48:25 +0300
Message-ID: <20241014194825.44406-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014194825.44406-1-danila@jiaxyga.com>
References: <20241014194825.44406-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD93347B6B2CAA5CFEE642B8753852C12B9C1761D26FA01738E182A05F5380850404B42FC2425DC84F33DE06ABAFEAF6705CD4CAD9ADDD3152E13C45BCBF80DB7AA4212A8CB8A084C4A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CFFD65163E56A654EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637775FFFCA96730EC9EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C90060336FFF0C393407053895519BD0ED70659800122DDFAFEA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE7ECE82AE7387CF2AD9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C374207B34A79F3760117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFA607D462841869D1BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B667DACB3AE4B8FF8576E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C224952D31B9D28593E51E827F84554CEF50127C277FBC8AE2E8B974A882099E279BDAAAE862A0553A39223F8577A6DFFEA7C0E67A00557831CF643847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5599BAF3EC0AD78CC5002B1117B3ED6960DDF9B07C4B401605D145BB8EF0DE66B823CB91A9FED034534781492E4B8EEAD09F854029C6BD0DAC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFCE1DF0CE873FA683BB8137D4C2A5031ADE98847B8024DE32163725C3E817BCDD5B8C288B04B80C1C7C85317C21026A49A9049D5CF543A6DE7D87006C6522FAD3D82A262C40F0E56942BF32D1DA1046D202C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLPWNB68Sl1Ix75lwjY39LQ==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949810EB9BC1412517BD5AAE6F637C7150CBC2751E3629D4A76E5B090D92EA22FB7CE2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4E23526250136A413FCC71D50D2AC2E68784773A26408DE62049FFFDB7839CE9E3928B87FA8A99B44623695520E6B861FD121BC155CF15BA7EC36587DC4EDE98B
X-7FA49CB5: 0D63561A33F958A56BCED09FF701568B7B20013DD3CA9ED44A0F5B974F0060A18941B15DA834481FA18204E546F3947C454D481E49D84BC7F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637378F05E399FBC093389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3A8421AA044726D3235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojLPWNB68Sl1KoLjr6dO/sQw==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

From: Eugene Lepshy <fekz115@gmail.com>

A642L (speedbin 0x81) uses index 4, so this commit sets the fourth bit
for A642L supported opps.

Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b41230651def..7c75340b3a46 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2841,14 +2841,14 @@ opp-315000000 {
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
@@ -2863,14 +2863,14 @@ opp-550000000-1 {
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
2.47.0


