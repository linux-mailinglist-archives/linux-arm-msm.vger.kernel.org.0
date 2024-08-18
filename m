Return-Path: <linux-arm-msm+bounces-28906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CB955F14
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79CD5B210E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E74158DDC;
	Sun, 18 Aug 2024 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="cBpbgN8G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="IKqsONPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback24.i.mail.ru (fallback24.i.mail.ru [79.137.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47815852A;
	Sun, 18 Aug 2024 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013860; cv=none; b=km/BqEIUtKhqPveuHu0ba1/sw6SG25H11qmdo9yXPmvwIKshbMk0ZOgPSsBfwyBnMvgB5YvXUlh8snEGrVnNInkVTnf4KefjLMJJyE2FsHxlBaDHP7xy/THsGJnaVzH5jMSLQRU+r4QY2ElQu1qeQFMRO6AmJFcSSy+zQT+tX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013860; c=relaxed/simple;
	bh=ciLaMRgqIm45IOkH9yhJRajgmxEor4m20GgFY276ack=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gChH/10HtjekLI4pSiq1XHVqpWFxlRBlEX5NJT89NglZBTbgKI/yzNspXdpV98ewg0m5OcRh9nyk7DUe/FQwzCpaLqx8axs9pAUysFTMaXaHVsDPDuAHFpvsUC+ndssIOzT1QXW3umYZjQn2kUtOsJ+S5W/7e50X86GcTEJ8GE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=cBpbgN8G; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=IKqsONPG; arc=none smtp.client-ip=79.137.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=q+DxIY7Pdbtf1Zduq3Wr9adljnJd7fLQTNtc72IaZbQ=;
	t=1724013858;x=1724103858; 
	b=cBpbgN8GfW6BBsdQc9yp7pl5piz3P2MRi6XhDCgJpXTeGl91g+B0uLGGuSfbgCCuoB3uA0CAR6crQVTgr+oO9IJRKGZWQYii400DnxpZHFu3QGebvwgih5hPYwQQshL2sIjn4BhKjm71RPpTDG34Te3987tnb7uPfshtiGuKJT8=;
Received: from [10.12.4.5] (port=38006 helo=smtp31.i.mail.ru)
	by fallback24.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sfml0-00EJCI-W9; Sun, 18 Aug 2024 23:44:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=q+DxIY7Pdbtf1Zduq3Wr9adljnJd7fLQTNtc72IaZbQ=; t=1724013850; x=1724103850; 
	b=IKqsONPGrFQXhJuLCO14O67DDv9gZtAv51CjE150Rk51HvSUhRhvOQCS36MPV/cy4GpBLsNIqcM
	F6sp5usnptf9ESfysmGJZxNnkhS7XrVYmUPgE/uMtBHRpiJQMxSQWk6o9m28yes+M6HQNKFJB3XtR
	nyqfyKcMXssJEhXwyMc=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkn-0000000Cqfx-3qUE; Sun, 18 Aug 2024 23:43:58 +0300
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
Subject: [PATCH v2 03/10] dt-bindings: clock: qcom,sm8450-dispcc: Add SM8475 DISPCC bindings
Date: Sun, 18 Aug 2024 23:43:41 +0300
Message-ID: <20240818204348.197788-4-danila@jiaxyga.com>
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
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E2E053F12B874BEA7ABF7E130D634E7BB8182A05F5380850406D2324DDF972535D0578E6996F38341315BEB6F9CD6527B6323C04D0FE7BBCAF8312A077F85E9B44
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB84ED444C624799EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377BAB68A65B44F13B8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8519A61B87960E983CD7AC5B2B1C5E9D2618BDACC69ECB978CC7F00164DA146DAFE8445B8C89999728AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC886A7C529F68B8E5CF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CAD74539164518AE5C0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C38C3FA5C133757E88BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7AD892BA7D319F029731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A55661E4F001340A685002B1117B3ED696980608CF2CAC8AB8E772F934B9BCD185823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF33FF9454C939B793AB1B087214EFB169DAFD7C7F3AFF06DD16D5018CE044E22406D2A967A71B2380ABF86C07854D94732E213E62C5CD78FDF37AA835A6091A5EDE41F414EE1874BAF59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTma8zp9Q2afdUA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F0045A77C8BEB847DDCAC57A5A3E2C0B73CB691084787515A2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B401572549E177C9B7D4324AF0E71CFA34A25B9239AA6F4954049FFFDB7839CE9E4D3E270CF25C1BA8FBAB3A84B2FE6882655B3D688361E8E3EDD2E956AE48EA52
X-7FA49CB5: 0D63561A33F958A5317E1F91C627CA8FDC28291F6CF534FC1BF1888CE61C86338941B15DA834481FA18204E546F3947CD2B897A0B7B208E1F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F79006371CE0A079F1B3D4BD389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3375ACB23F92DE42535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmaz7mC8kD1RsA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add new entry to the SM8450 dt-bindings for the SM8475 clocks.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
index 4794c53793a8..e9123bbfd491 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - qcom,sm8450-dispcc
+      - qcom,sm8475-dispcc
 
   clocks:
     minItems: 3
-- 
2.46.0


