Return-Path: <linux-arm-msm+bounces-28895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FD955EB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 21:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1DF1C20968
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 19:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B3114D6EB;
	Sun, 18 Aug 2024 19:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="WL/oDZBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp36.i.mail.ru (smtp36.i.mail.ru [95.163.41.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C072C8FF;
	Sun, 18 Aug 2024 19:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724009365; cv=none; b=iRrAyxFboP/oYj3l55asYYy6qizgGafrVkO8pVq1x/xOO3KgEqM4qXPDLQ7K8XGYYl4NQYt0Ub4l0BRMkiAzW4DuoKFSSyOueSXr4KuY2KqeCjFSz2t0L9gR95L9V6sTvAOmmeL3zqYeMEW0J2EAXBz6dWMH26MeRlHQttTJnyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724009365; c=relaxed/simple;
	bh=fJ1AfZQaj+UhWBT6v8qe2Z0iYjkVwzI4WPia0tZaZyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAzeBz+3mEDAdCXlWpbYYtPhHQ+IfNK+ZzLR3K1H+4AJVt6q88usyOv9NNhQWAbfsugwdRkog09zIp877erBnSxo2wU9UO8sFxCADtN57kwM8REt56a/vm7c/gQ4sYz72vxUCHxGZ0gxqMM2XBXvcW/NOMyV6M5vNmeXYvavYv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=WL/oDZBH; arc=none smtp.client-ip=95.163.41.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=udl6muVOsy9RhZfqXQpG1Dccrp5eu5GJHorbEFFILnY=; t=1724009360; x=1724099360; 
	b=WL/oDZBHT/Ytsdd8uV7mRItUWOADmNFMyPL4SgmlIalDtrzLlKkb/KX5HjS+8ngmIXsL83asDqK
	tjYoQw85eEJNfUrHJ36t3dcSflIeUdsotIkeHi2Yw4oyvnkQR16LKvmnbotEpAHrF5gx2SRiCI/BT
	BFTOOoQB816VvKD8oK0=;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sflaQ-0000000Fztc-036c; Sun, 18 Aug 2024 22:29:10 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex A55 and A78
Date: Sun, 18 Aug 2024 22:29:05 +0300
Message-ID: <20240818192905.120477-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E2F8667C40DD8CE92DDCF89D65A2CC9925182A05F53808504071AE4BB044892A39411046492FDDF806816939828098F1B8254A407EEDDCE0FF21809EC83B530B45
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE751BC6685BC61E6BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373D58C44ED3182E498638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8FF9F91A8EFA4005C54F63F3BE51EAEC7BABF853B97CD85F3CC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80CABCCA60F52D7EBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C6A1CB4668A9CA5FA9735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C31D8DC2DC17FB59B2BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7A9D141641BA1E09E731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A54221E7CF9996FC5B5002B1117B3ED696A028FEB53A44C288C89B063BDC7FAC35823CB91A9FED034534781492E4B8EEADA757276DBF662F3EC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5AC5FACBA5BAA3AFE47AE3604C9B5D8223762131651AE9B3FC538D687F35EE36A0D894938C2B729CABF86C07854D9473F8CAA9822D0DFF0CE33E49F6FCB2F35A7AF5E636959F39C5AF108DC32EA72A8402C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojbL9S8ysBdXjkZt+GJMYpLvCnV0AfnFG2
X-Mailru-Sender: A29E055712C5B697A0B4B50D4D88F0E82B63BEF66D9A8258B951B70A5BD4BD8E40CEBE1E8290AE3A21401CF93FD6FA55210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
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
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 91cc5e74d8f5..ab024a3c3653 100644
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


