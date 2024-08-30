Return-Path: <linux-arm-msm+bounces-30305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D615A966963
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 21:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33933B20A5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29D6153810;
	Fri, 30 Aug 2024 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="hV0IAs+e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="w5xied+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback21.i.mail.ru (fallback21.i.mail.ru [79.137.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2AC14882D;
	Fri, 30 Aug 2024 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725045323; cv=none; b=n0+ZmjxTWX24kLggnrFFYcMyuAsDisIJ+XtGAgG+4x5GH8Z2iIpdZBqcuzmXxLXCI/nDcrAcG0bqvinP+P9ltwfNAv9RhdhkXyQin2FGmISwbtiLdf/3CpMojlfuw/siWsWuazF0S2KcWm7Dw2eabYL+55S1u7E+lAlLDU96nmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725045323; c=relaxed/simple;
	bh=7JgpdC3r/Dc8SWeR85JgtFoGu6PBRPFlKlrTbo1LOLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqTT8HG2hnQqovAG5Ql2goMFAXM/jXdbBYqhtkgh8Q5PiRKmTZIKkXDAuNC4qx61d4bf0DUWUmJY4e1jbpk9T2VnsccytY1aRNakUBp6ne8re3IcG6b52PREIO8YlpliEXrXyRXCgeomk/aVrarvT32415nKSVm4lmZCwRO1dAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=hV0IAs+e; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=w5xied+a; arc=none smtp.client-ip=79.137.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=TlkuuWIYYjxPVb8X9lC1oL65+0A5hT/f5+F3NUgyF2o=;
	t=1725045319;x=1725135319; 
	b=hV0IAs+e03DuUGArTk+8g4utLvQGHBlto473uUqQLbCKaMH6InQ9qeWZLs89zmVSIxAWGgAWj8szkK2dq+BrQfXT872ldMmaODvJDWLOwj3WrIGzqcTLVQwK0Q478nfrX4Ry0BKBBXGfQDn7tt9wG60bruBUWUI9ro3VjX1fKR4=;
Received: from [10.12.4.23] (port=49774 helo=smtp49.i.mail.ru)
	by fallback21.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sk75R-00CgEN-Og; Fri, 30 Aug 2024 22:15:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=TlkuuWIYYjxPVb8X9lC1oL65+0A5hT/f5+F3NUgyF2o=; t=1725045309; x=1725135309; 
	b=w5xied+akTirme2zc630Xd5Wjj27cAvLWdZNOTRX2elG/LWvqoYJdj3TAHO9F4AWzuIYvyHtwPL
	4ZaDKFSbdS417Q9ZiNNB+hCadUKbJDDKPzv6vcRVwnjjDCntsui8yTbIVgtMdjswyFRtj79TPb3fx
	18+BheWQr4+sEdAUIMA=;
Received: by smtp49.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sk75A-00000007DYm-0yW6; Fri, 30 Aug 2024 22:14:53 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	stephan.gerhold@linaro.org,
	caleb.connolly@linaro.org
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Fix PMU nodes for Cortex A55 and A78
Date: Fri, 30 Aug 2024 22:14:38 +0300
Message-ID: <20240830191438.31613-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9C93E46B305ECE2F0249F169BB24CB0A5C7A9AD6AC88D4349182A05F538085040BCAF3D067DCC291591417EB218679B8227A96C81A81CCFB066EA1851754432E02031A3DD069C1E5A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72B221FD723B94806EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376F978168E59B07A5EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F36BE868374DD4E4E0817011D1B108520E23215EE5C748B724FA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77A825AB47F0FC8649FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C345F93BA578C2B99F117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF0F8511E1817A89B6BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B66CA36251E56197FE76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B2EE5AD8F952D28FBAAAE862A0553A39223F8577A6DFFEA7CA54E1600D0FEB00543847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A511A36AB736364F7E5002B1117B3ED696E3D3859F0ACAD8217E0012C66AE17B00823CB91A9FED034534781492E4B8EEAD577AE849BCD98940C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFCA37F0FAAC39AB353E7CFDC5791D0A9D2B84FB54C0AD72A7CB5BB072DA424F6708FC8DA71D3854881D0625CC79A2C08BA27D3AAEECBE3558AB4D463F2B443DA26A3F6EB56583E291E4FDFA4A036B0C3902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXi+G+POQ4bvZHFPSz/DnwXr
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949814401E8268629B70572C88FB39F7EDAEDEF2FF673EE89A01B1267C678217D07542C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B42E4E0EA5DD42FB3B0A6C8DB02C8A37D260EAF6CD36254D6A68F3CF0E9FE49B697627277BE3231E6EA694019B0EB672A87CB291610A66D62B2FC79171814E017B
X-7FA49CB5: 0D63561A33F958A5118A1AE8A45AC28949B788EA3E38265C0659A02808F3E03B8941B15DA834481FA18204E546F3947CC6B9E49F474DD420F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063765B844AA1125649F389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3BED49B5C3F21B02335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojQYgdG78G+s1uP8wKeAgTAA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
consisting of:
- 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
- 3x Kryo 670 Gold (Cortex-A78)
- 4x Kryo 670 Silver (Cortex-A55)
(The CPU cores in the SC7280 are simply called Kryo, but are
nevertheless based on the same Cortex A78 and A55).

Use the correct compatibility.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

---
Changes in v2:
- Add R-b tags (Dmitry & Caleb)
- Remove the ".dtsi" part from the commit message (Luca)
- Link to v1:
https://lore.kernel.org/all/20240818192905.120477-1-danila@jiaxyga.com/
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 3d8410683402..9d14a70c307e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -845,8 +845,13 @@ wlan_smp2p_in: wlan-wpss-to-ap {
 		};
 	};
 
-	pmu {
-		compatible = "arm,armv8-pmuv3";
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-- 
2.46.0


