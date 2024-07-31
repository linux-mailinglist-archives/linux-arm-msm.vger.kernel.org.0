Return-Path: <linux-arm-msm+bounces-27572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 641AD943591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4441C21719
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538843BBE3;
	Wed, 31 Jul 2024 18:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="O8fyCbCC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Gv5E2ahO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E253D17BBF;
	Wed, 31 Jul 2024 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450274; cv=none; b=lkgyNFYaWyV0Pm+HnhzKnviHNV3gujMOU5dKrhtKgCPQVeOheS0v9A8A7Jxlwynu9Y0IaesHr78UPM2hh3gAs1cCBtv8UKzLz3qQL2O1C9+YOvlJxdsxArdAX0XKIZ6kSk3SN1XeHEOW86O6rb6tJxE4GWZbpvp0E6hdE58jxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450274; c=relaxed/simple;
	bh=MJfuiB9cOzOrd1yNaSpXy2IKfjBLZJe6MeG4ZotORQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYda2PjsjQjb2EO2FpXi81A/iWiZoGMhX3ul0XBkVmZRrgrwTgoTS4/8YzGztNkwKQ2tK3SpClQ+gRDx3Nhxn4LFIwPk2Ix3dAW1PuaYLIEswk3ZKynvT1kmVtzXiv2eTgyS1DQ6n/oTd3KXfsRYj9wxnBRe/U6/uFC263F8WS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=O8fyCbCC; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Gv5E2ahO; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=SBWn8l+YeA4pKeIyBpCJO3mNHGepestoLyky+2s0Mwg=;
	t=1722450272;x=1722540272; 
	b=O8fyCbCCMyAQe9ejhdSDyw3Vb5ogPZIwMAVRRtP39ogzzbShuHTQL1NAL5WNaLdqVkUyDr+Owl3ajjz1IBfoQehRCse6zjLHwAQvD3aoBnW1GORwnZGEDeLhJDGjD4BvEYxqfueub7qrggR5JFjEQMrot+6VhFsBHi4YDT7MAIA=;
Received: from [10.12.4.36] (port=34498 helo=smtp59.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDzx-00AjFX-QM; Wed, 31 Jul 2024 21:24:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=SBWn8l+YeA4pKeIyBpCJO3mNHGepestoLyky+2s0Mwg=; t=1722450269; x=1722540269; 
	b=Gv5E2ahO7rUMIHGaUrXceJbz1cpIgm+qfxRYHAMZioJtWxqx0MgTKjDXP1SWUHPrfTzdTqo/S3B
	8kr6RnbDNeF8rBCzQmtQotnO0aSkph1yYngSNEBUGAUqOe3/GVqR8agHK9iD6iUxfELQR6fgDYVxU
	iVO+SX4u9SZIoV4gNKA=;
Received: by exim-smtp-5c6c85c787-l5nbl with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDzk-000000002Y7-3fk1; Wed, 31 Jul 2024 21:24:17 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	buddyjojo06@outlook.com,
	david@mainlining.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH] arm64: dts: qcom: sm7125-xiaomi-common: Add reset-gpios for ufs_mem_hc
Date: Wed, 31 Jul 2024 21:24:12 +0300
Message-ID: <20240731182412.27966-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9239C2541717B5AEF810C4A468CE7865A182A05F5380850400B3A66E8909DF5B93DE06ABAFEAF6705AE2A59210842E75D8278179499999E65B76EC74E5D6971C8
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B72EF797F6622CCCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063764FE777F378F21448638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D895F56CA89201CF3BEEEB1A9BED80D50F27B4597BC3A8629BCC7F00164DA146DAFE8445B8C89999728AA50765F7900637E992CA9783196CA2389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8C2B5EEE3591E0D35F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB2302FCEF25BFAB3454AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C386712D2D5FBAF151BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF3D321E7403792E342EB15956EA79C166A417C69337E82CC275ECD9A6C639B01B78DA827A17800CE77DCDFB3399A2F72843847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5CF93D41B5C1371685002B1117B3ED696AEF9B14C73DDDAD1F09842853758E9E5823CB91A9FED034534781492E4B8EEADB30A456A8F293845C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFBB22FDA400F3810E9B44713A59936CE125AEB5EA0D0E3E0D9192302E0985663ACCA692FBCDC96C21D9D8FAF50ED830B9FEEE24C9F5206FE97D1BB70384855C9BF955F37CC1522D242BF32D1DA1046D202C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3s5a7me4rw3EA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981FCEEF50472500560CC811723C208B417535B6DFB4C8DD71EFDE607E6EC726B4C2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD13D22A8CFAE84BB7049FFFDB7839CE9E45E89A588AFC07054F3FAAD751CDB6A5ECA4001433B051C3C1DAA99707D53B38
X-7FA49CB5: 0D63561A33F958A57F202396FE379AE7E3E7F073EA23BF38BB447322DD65A51E8941B15DA834481FA18204E546F3947CFBBF6D3A4198F0AFF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063748BA6E06FEBFA861389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3E86F62FB921CF71935872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3tsProRFVSO0w==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

The SC7180/SM7125 SoCs have a special pin for UFS reset. Generally, this
pin is the same for all devices on the same SoC because it is hardcoded
in the pinctrl driver. Therefore, it might seem appropriate to add this
pin configuration in sc7180.dtsi. However, this pin is defined in the
device-specific DTS files instead of the SoC-level DTS files in all
Qualcomm DTS. To maintain consistency with this approach, we will follow
the same style.

Add reset-gpios to ufs_mem_hc.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
index 29289fa41b13..b9cff60efe6f 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi
@@ -411,6 +411,8 @@ sd-cd-pins {
 };
 
 &ufs_mem_hc {
+	reset-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l19a_3p0>;
 	vcc-max-microamp = <600000>;
 	vccq2-supply = <&vreg_l12a_1p8>;
-- 
2.45.2


