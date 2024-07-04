Return-Path: <linux-arm-msm+bounces-25243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9069270CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 09:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7F81C220FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 07:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16A71A0B1D;
	Thu,  4 Jul 2024 07:43:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16963143871;
	Thu,  4 Jul 2024 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720079018; cv=none; b=sxdhl2sBaO69qsBdXy5zI3v192GrRZBZZAYK0PDA/36J+FgT/5vfBzvpnFsESWFiqgEaEGtsqRpCWY5bfsv9W30fMf7VAd/TeiRoQpVOmikABVKIZ/GuiS6JwmqMEnTdIZVj1ZauxbFRFPiAOiOyDWQtyyd/kMsTolFdVi5yNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720079018; c=relaxed/simple;
	bh=aLvPUr6ct/l1w6Xw+7pvRDuLqnCTPtfIyAVjtJ/tQL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uvtm7uz751QfTA6UIVqS7CmE4GXe3yvziv6ArA1R9z94HdxVfduY7crkvtNAyQOHpZOv2VetLGhgE+zj1Jp/IujUa7kPqaMWY82FEC/vmBH9U9WMoVVNfWzs53WjvwPEWt17rDXHB/ile3wIDI1n5mPDF2W7Jc3LnFNyCHG4ssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABHKE2bUoZmJEeDAQ--.3809S2;
	Thu, 04 Jul 2024 15:43:24 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	ansuelsmth@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
Date: Thu,  4 Jul 2024 15:36:06 +0800
Message-Id: <20240704073606.1976936-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABHKE2bUoZmJEeDAQ--.3809S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF43XrW8Zw45CryDuF4fuFg_yoWfJwc_Cr
	18WFWxXw18CF4FkF18Jw45Ar9IyasIvrsa9F4jga4akryxXr1jqry7ZFs3Cw45Jw4UJF90
	gry3GrW3CrWrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBpB-UUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Return of_clk_add_hw_provider() in order to transfer the error if it
fails.

Fixes: 09be1a39e685 ("clk: qcom: kpss-xcc: register it as clk provider")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/qcom/kpss-xcc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index 23b0b11f0007..e7cfa8d22044 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -58,9 +58,7 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, hw);
-
-	return 0;
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get, hw);
 }
 
 static struct platform_driver kpss_xcc_driver = {
-- 
2.25.1


