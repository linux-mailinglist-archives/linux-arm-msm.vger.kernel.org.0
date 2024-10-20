Return-Path: <linux-arm-msm+bounces-35150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52019A56D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95383B22CDA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A3F19AA53;
	Sun, 20 Oct 2024 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="sinodWRK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Ax4GYoOU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FB199FA0;
	Sun, 20 Oct 2024 20:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457827; cv=none; b=muGOB+Bnuns8sNtkx1E7LvVilrgnkZ+VO9NnJPPpzMvd+43BxA7dsQUbg2DUx+AHICY9l4RjEvelE5KkAcVPWlQZlH4tciRECWWP2Nkl2Z/105HVJ7UgSwyDOXcNAQ3bcyDWihMzOU7oo0OJC74gHGVs4JgPpc4+966W3ZhdFvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457827; c=relaxed/simple;
	bh=uBVBllxMTlGvUHZjqzI6BshIhJnKr2CzLsrxK7KUSzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvMw1j9y1gR1oP4cLI9Pw6gpqFMNczk86ZjqtfJplFqs1/FRv/1F+QQ1cJdqhMHnx/8v+OVjddM5RtbjXMcGn9YwLrIduA84+u33XUxEPt7VhsbzffGxYyJG0POYIlTlcZXgTPdMCGSCwOF3mMxo7c+sC+EHccL2VVxMXSntWyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=sinodWRK; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Ax4GYoOU; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=/JV818YVNl3eqjhHHbDpTsd1ZSMqaQkrrj6coyaUxKU=;
	t=1729457825;x=1729547825; 
	b=sinodWRKxFms8ovvLLDDqj4q84jbB+tl0NLrdaKN4JM/8uXEFFzxh/pYiV7ifIP4n1w9jSDVXX2LiGzGqSGqZb+lXpPrdw3JlUiGGOpTZQGH5CeMNJDTkR6e/U4nIxmB5jMGbJ+5Ctqsjq2udCnSReEsPzz+MGevKVBrLsOK1qU=;
Received: from [10.113.90.223] (port=48640 helo=smtp32.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cz0-00FrTW-NQ; Sun, 20 Oct 2024 23:57:03 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=/JV818YVNl3eqjhHHbDpTsd1ZSMqaQkrrj6coyaUxKU=; t=1729457822; x=1729547822; 
	b=Ax4GYoOUIGxD3v/VSEPYwSqMmBfMwpddTYZOHKl2UOsNQP3pc+jnSeLLm3S7NXejHGbE3uF+8sA
	BS36UH6JQeBPx68V6p9n+dqEsBjKVK2UeNKSiA/baZhzDyd9yPNzAN8nGdygf4BrXOO1l9ooKQ4AQ
	nsQDi7Eav/4wneEeXmY=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cym-00000000L55-1WE7; Sun, 20 Oct 2024 23:56:48 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	quic_rjendra@quicinc.com,
	andre.przywara@arm.com,
	quic_sibis@quicinc.com,
	igor.belwon@mentallysanemainliners.org,
	davidwronek@gmail.com,
	ivo.ivanov.ivanov1@gmail.com,
	neil.armstrong@linaro.org,
	heiko.stuebner@cherry.de,
	rafal@milecki.pl,
	lpieralisi@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@mainlining.org,
	Danila Tikhonov <danila@jiaxyga.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/6] dt-bindings: vendor-prefixes: Add Nothing Technology Limited
Date: Sun, 20 Oct 2024 23:56:12 +0300
Message-ID: <20241020205615.211256-5-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020205615.211256-1-danila@jiaxyga.com>
References: <20241020205615.211256-1-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525BEAEE9FA8344CC1B5E1023763A8405A29182A05F538085040FA131339EE5A3FAD3DE06ABAFEAF670597F281994077E3AA43A93D006BE7B5D574892205136C5E50
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FCE92196D28EA6468638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D806A818852BFB19FA718B8CE3092C92CBF0A20935DA27CB2ACC7F00164DA146DAFE8445B8C89999728AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8A816C540FC8EEC30F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C251EFD5447B32ED66136E347CC761E074AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3ACA9F7D16C0C9468BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF27ED053E960B195E1DD303D21008E298D5E8D9A59859A8B652D31B9D28593E5175ECD9A6C639B01B78DA827A17800CE7DBBA001AFC1C4016731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A57EF999DC292C1D475002B1117B3ED6965F7E77E446CD60D1C66B2B37046EC955823CB91A9FED034534781492E4B8EEADAB4674FCF129DEEBF36E2E0160E5C55395B8A2A0B6518DF68C46860778A80D548E8926FB43031F38
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFC491945A0EEDC496F84D6A0E265E13A9EF302B9EBF38960014134CFFD8A54B39DE1AF985A89825B60B1383DF4BE982FCDF93864FD0A92AD91B4999C0876C9295F4946ADCD415B220F72E9902079A869902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s5SZXZFpC6SWg==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA4825860F061DF214043D27169FF265618D52D8A803B3004D2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D4FC5AAAD985BB12F92E1758D93CF716DF68F3CF0E9FE49B69586F9C8573CB553B04F210ABC4DA281DBC5D070BD85F8755C5E2CE4BE88332A3
X-7FA49CB5: 0D63561A33F958A575FFD625A0A87943EBBBF726533EAE98F52315F2D56618738941B15DA834481FA18204E546F3947C9F3D0DE012848B35117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE7C8FBEF6EAD8577B08941B15DA834481F9449624AB7ADAF3735872C767BF85DA227C277FBC8AE2E8BBAB85A1B463F485B75ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s4ggwDt/1ephA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add entry for Nothing Technology Limited (https://nothing.tech/)

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 45f08f014ad6..b3fd32cf3153 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1053,6 +1053,8 @@ patternProperties:
     description: Nokia
   "^nordic,.*":
     description: Nordic Semiconductor
+  "^nothing,.*":
+    description: Nothing Technology Limited
   "^novatek,.*":
     description: Novatek
   "^novtech,.*":
-- 
2.47.0


