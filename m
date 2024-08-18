Return-Path: <linux-arm-msm+bounces-28908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B7955F1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312111C20944
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47975154444;
	Sun, 18 Aug 2024 20:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="NCZWqmAt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="hNT4R/dR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback23.i.mail.ru (fallback23.i.mail.ru [79.137.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D109914C59A;
	Sun, 18 Aug 2024 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724014501; cv=none; b=GzjW2S40waNrsNnI93L32shkOL4QtQXd6869adgUjjrWM5yqEsGArAhY90cvJ9MRCQPYwWu8JzbN7Ha3F5xSJEUfKFShtx6YY/a80eTed0NLoFuVC8Ctaj5XJ31zJ9Fp3c32b7bg/REdi0zxexZzw3QLcv4px1JPyyx9p3jnzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724014501; c=relaxed/simple;
	bh=b129wXb3qgWwkLy1GvJfxgywDrLTsUz1oalTrxk81fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GytBDLy4rnh9oitbFFFXdmjvGBZ9De9nctZXImapBUob3/LTbJUwQfS2aK9sYnP7flnG/lWx5Tn1g8jbSLzgqSucCsO1mORe6vgm/UWLSfsp52+ZW4o5MYhIE1AsUfvP290oxwKc5/dvoB6BdYh/w8/XPXOWGRglyc2qa+5gx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=NCZWqmAt; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=hNT4R/dR; arc=none smtp.client-ip=79.137.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=ne3B/Rzdy46tnZdyG/JRr5IRweK7PyGUnDVKHK4tROw=;
	t=1724014498;x=1724104498; 
	b=NCZWqmAtQGzYKWQB09FFzl6w9C6hPeAk1gnb2qxOFRm8EUayx+Nf63dXURZL6e2iTPPw9scI3B82EAD5ZZrax1DwnSK9Qb2TGQOWQaOc5AK04xVAvyMBMAYA+G1aDNxjmslMTlZ8gt9yPxngrt72i3HhooqULjvVsSXCBAfP8XA=;
Received: from [10.12.4.5] (port=53048 helo=smtp31.i.mail.ru)
	by fallback23.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sfmkz-00Glt6-2o; Sun, 18 Aug 2024 23:44:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=ne3B/Rzdy46tnZdyG/JRr5IRweK7PyGUnDVKHK4tROw=; t=1724013849; x=1724103849; 
	b=hNT4R/dR1f3vjtd0/7ByAxb+0r1DyVLD0Dg/e73A6XnrVnNGXH10CbLIwJNS11n88eUtm8nJ8IN
	D3pQAf5CVb2v94jQrkxyL6MsaI3gFTggkQdLZq3CyBhacp21LcU2IG8cdUNEtQ767Kxhyi5L2vDok
	BChj35JzaL1+ZXVTxgA=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkk-0000000Cqfx-36tO; Sun, 18 Aug 2024 23:43:55 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	vladimir.zapolskiy@linaro.org,
	quic_jkona@quicinc.com,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 01/10] dt-bindings: clock: qcom,gcc-sm8450: Add SM8475 GCC bindings
Date: Sun, 18 Aug 2024 23:43:39 +0300
Message-ID: <20240818204348.197788-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818204348.197788-1-danila@jiaxyga.com>
References: <20240818204348.197788-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD9DAB542EDD08389FE770B27D8AD976A05EB0477873736AFE1182A05F5380850404C228DA9ACA6FE279E6A32E3BAFCBE1A0578E6996F3834135905C4A3742C897B323C04D0FE7BBCAFC9EA2F84C7A7946D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7FFA2A8BF6367A61CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006376CE4E8B6A85920B98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D83659F55614FF304FCD7AC5B2B1C5E9D27D97D54D5B0A0EB4CC7F00164DA146DAFE8445B8C89999728AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8ED96AA85C75E140D117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFB445B9DA8B742BABBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6E4C83BE986F2B39D76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CE1AEB6AF2DA18B6243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A55859958B52B230CE5002B1117B3ED696976FF4F3CCE121F0E20DC3F561CE4150823CB91A9FED034534781492E4B8EEAD87AC71952E7BCFF3F36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFBEB7BD44F114325F64DF9F28B6574C42CCD2ECA5B8E0FCFA32DEB8533B305D86E781F4E203C57078ABF86C07854D94736E3274E36D4C1DB2F37AA835A6091A5EF75BA9B045ADADDCF59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmbTAtyUmjy/pA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554FCC811723C208B417811FC577C4773FD2C245D736E0277F212C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401572549E177C9B7D4324AF0E71CFA34A25B9239AA6F4954049FFFDB7839CE9E4D3E270CF25C1BA89EC7B6EE532E09F1EE4654FC34F77458531387CD8D6537FD
X-7FA49CB5: 0D63561A33F958A57A0BEB16D9AB721782915B5004D3CBBAC642CC7947D3A6158941B15DA834481FA18204E546F3947C98A01D7C647FC0B3F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006372D3B7B5A639A2778389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3375ACB23F92DE42535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmZ1MwqjkK07GA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add new entry to the SM8450 dt-bindings and add SM8475-specific clocks
to SM8450 GCC header file.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 4 +++-
 include/dt-bindings/clock/qcom,gcc-sm8450.h                  | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index d848361beeb3..77273aee5d52 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -17,7 +17,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,gcc-sm8450
+    enum:
+      - qcom,gcc-sm8450
+      - qcom,sm8475-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index 9679410843a0..7320e63c3a2f 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -194,6 +194,9 @@
 #define GCC_VIDEO_AXI0_CLK					182
 #define GCC_VIDEO_AXI1_CLK					183
 #define GCC_VIDEO_XO_CLK					184
+/* Additional SM8475-specific clocks */
+#define SM8475_GCC_GPLL2					185
+#define SM8475_GCC_GPLL3					186
 
 /* GCC resets */
 #define GCC_CAMERA_BCR						0
-- 
2.46.0


