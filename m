Return-Path: <linux-arm-msm+bounces-27566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDB694354A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88DE5284870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E708F1BBBF7;
	Wed, 31 Jul 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="QilmELoP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="xr0SZFrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0E716A39E;
	Wed, 31 Jul 2024 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448796; cv=none; b=cW2N3XCeJmGmlEN9X4IgG8Km+UvPiNE4Et50HpNGeoRMOUoGSoSgHw9glS2r9hdrOUKJ6R+lH3dKpIBMwIAlGRrEqWgNwax+DIQo2960ilZAaxXxi1PDTwa2WPET4fzHNUUks9r3O5/wbSDsBpi1QpmcV2nIxWXBVQe9pRSIXws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448796; c=relaxed/simple;
	bh=7BiVSTp3ipFx/xE9LwMMh5Q/IyQJ2ry0DLOohAHvCA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsKGN8zIXAdKGB5tc9RHF4fGkJzKVVWOCRZly23bmi5TJRzrgYMzwQaVizaUTDER9qisb1m1w68ZAXhyrAY7BuW8wH8idcfJJJHkdqDjSeyYPw8Wj7xx9ectZmdCZBtysvchz+EH4bn6e2/XJAjqaTJtqaNi4Axuc3gVAj8kRt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=QilmELoP; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=xr0SZFrh; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=tTyvRcEYnFLqFl4flGhujQ20YXK/jvtgvtsDkP2RFcU=;
	t=1722448795;x=1722538795; 
	b=QilmELoP4s9Gzt/34iDiO2B+q3JGWi3J1/vej3TIxhtSFp6GIsiSTgthVn8HYjF/69iM6pyrbsmNJVxvNSpIVpowKJy5/vEzdaDaK3DSGSsf+LYpudfQz/dyW+Mz4goKSzEFRGj6OktKSTQMsNQiPb/uQ6+TCFzWdwhEtHSS3dM=;
Received: from [10.12.4.13] (port=37440 helo=smtp38.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDc2-004x7G-KG; Wed, 31 Jul 2024 20:59:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=tTyvRcEYnFLqFl4flGhujQ20YXK/jvtgvtsDkP2RFcU=; t=1722448786; x=1722538786; 
	b=xr0SZFrh+8E7aykimeg0iabcrwXREc3XkwKpFvIAR4cafAGfPxkM9l3nnFjsBzsfxki/wU7nOkT
	eAPvw+iA3SiFPC16tntYfhXCASGVmJ09qR/gNLy7XRjOZJMA4kZrS+ROSxLZtvIMUjIvT3l8KANrq
	Q2gRxpusL82J5yv89pE=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbo-00000000IYY-05eY; Wed, 31 Jul 2024 20:59:32 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
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
Subject: [PATCH 03/10] dt-bindings: clock: qcom,sm8450-dispcc: Add SM8475 DISPCC bindings
Date: Wed, 31 Jul 2024 20:59:12 +0300
Message-ID: <20240731175919.20333-4-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731175919.20333-1-danila@jiaxyga.com>
References: <20240731175919.20333-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A979C5030B5D4423D655FC690E8AB11230182A05F538085040CFAEA242A4FC9DC73DE06ABAFEAF67054C5B48E4B1FE5AA3F806485F292FBEEBF649426FA9741B02
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CE4525FFB91B9BBCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D7045943A292EC88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D87538BE0652F5134A995830582C796B18AA194C8F558D3EE0CC7F00164DA146DAFE8445B8C89999728AA50765F79006370277CA7F994D7EF5389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85FF72824B19451C6F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C6A1CB4668A9CA5FA03F1AB874ED890284AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3A78DCCB29E2E2A1EBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5A77830504CF1C8115002B1117B3ED696B91202F9FA77A261CCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEAD14747542773C033FC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFD81A8C66F8806F767DF23AFE2F7978A3AC5597832B6083904D15EFA9ABB8D8866E5D3BE3824D6F341D9D8FAF50ED830B3EA4EC4CDBDB6011C126D84212B092F601F0A8D2C7E61E87983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3sPRhtOdFi05Q==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A18BD48BD36611AD3418789DB3FE61C819228F990716340DE82C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CDDCF3B354911262EC049FFFDB7839CE9E45E89A588AFC0705B63E2469D1F9EB179B393084698256E732C84063841A3680
X-7FA49CB5: 0D63561A33F958A5C78CA147A22D38EFF11DD77A7244D5F700A6B2849ABD88918941B15DA834481FA18204E546F3947C3775554D4E35D8F5F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637CA7571BDE729DAE7389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3777F8C72A04D893B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3uds12c7KYvRg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add SM8475 DISPCC bindings, which are simply a symlink to the SM8450
bindings. Update the documentation with the new compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-dispcc.yaml        | 5 ++++-
 include/dt-bindings/clock/qcom,sm8475-dispcc.h               | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-dispcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
index 4794c53793a8..76f5a8cc42cc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
@@ -13,12 +13,15 @@ description: |
   Qualcomm display clock control module provides the clocks, resets and power
   domains on SM8450.
 
-  See also:: include/dt-bindings/clock/qcom,sm8450-dispcc.h
+  See also::
+    include/dt-bindings/clock/qcom,sm8450-dispcc.h
+    include/dt-bindings/clock/qcom,sm8475-dispcc.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8450-dispcc
+      - qcom,sm8475-dispcc
 
   clocks:
     minItems: 3
diff --git a/include/dt-bindings/clock/qcom,sm8475-dispcc.h b/include/dt-bindings/clock/qcom,sm8475-dispcc.h
new file mode 120000
index 000000000000..21a9db2d0f09
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8475-dispcc.h
@@ -0,0 +1 @@
+qcom,sm8450-dispcc.h
\ No newline at end of file
-- 
2.45.2


