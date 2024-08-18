Return-Path: <linux-arm-msm+bounces-28899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72383955EF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 22:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 147B0B20CE4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2024 20:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BE1154429;
	Sun, 18 Aug 2024 20:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Ic5UQY0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp31.i.mail.ru (smtp31.i.mail.ru [95.163.41.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA08125D6;
	Sun, 18 Aug 2024 20:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.163.41.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724013849; cv=none; b=gKnhqXmsfaw+dcqtS6gchFPfbv2XOu0UafognPskOoIDacunC4sQ0ALv0VTcd7ED9zdY5wvygXAdMrYyzKdTf3NekW79gyOkjg5r76j7GiflBrvxEyvui1l9o4pt+IJLNBb9Cgk8gqF5uL9So9mQMJFrHvth6Dh0UiGP1jm++KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724013849; c=relaxed/simple;
	bh=c60Q3txKO7TBPLh+plOZUUIA+nTDUbS/PnJCKlul++g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l7p1DSlGSvaomcmP0J59QqtBiabBo5Bylx/IjQWoBXu9I80bZFKNR6wdCDnuJsU9nz5xLUj3wiaD+U0hbTccyB8uTzYoTacncVHAkC8bL1jPOl+SE+kAIMgrQBV2QsRWnaCnU3j9kjCWaaPlnsA5kDBgzEIVnzFHrXOoXrIktPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Ic5UQY0p; arc=none smtp.client-ip=95.163.41.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=xeki5XL/apdkkAx15/rMH0jndoRd9pH7Sb4r07QccvI=; t=1724013846; x=1724103846; 
	b=Ic5UQY0pWUIO4Urjz8ZlME26Mn3wBRzCdI4fAgORkIan5KFtxmFLgsFR/vkbL9Hmm+3JhJFSSMe
	Bk6gEdPJxKXLP3dkweNQGwCckuYSyXeZ3IXreNZohK/q3v7PW+JRNQl9/rDDWHnt2taX7FcOIkAxN
	RiF7tBj41s/paJQCnGA=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sfmkr-0000000Cqfx-2CuY; Sun, 18 Aug 2024 23:44:02 +0300
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
Subject: [PATCH v2 05/10] dt-bindings: clock: qcom,sm8450-gpucc: Add SM8475 GPUCC bindings
Date: Sun, 18 Aug 2024 23:43:43 +0300
Message-ID: <20240818204348.197788-6-danila@jiaxyga.com>
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
Authentication-Results: smtp31.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD9F97E3C14763C38E2F8667C40DD8CE92DDCF89D65A2CC9925182A05F538085040D989909C9EF6AEE90578E6996F383413CAC287AF43D02D69323C04D0FE7BBCAFF8A48EF99929F69E
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9D6DADD6B53929DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377BB8DC46C8539357EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38B043BF0FB74779F360D455247F930E7142050ACA2FCB4889824B1DBA2743E710CA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE767883B903EA3BAEA9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3E97D2AE7161E217F117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFF0685002530F4075BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6945E48972B8D6B0376E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249D082881546D93491E827F84554CEF50127C277FBC8AE2E8BF1175FABE1C0F9B6AAAE862A0553A39223F8577A6DFFEA7CE1AEB6AF2DA18B6243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5C0152B4DADC615DB5002B1117B3ED696CC5C73604F6F51A2CCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEADEEA082C9A12FE455C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFE6419565749E62795A5F6373CA2898F08CEAF41AD946CA597F631433A691B9D3744A43F78FC6FA90ABF86C07854D9473BFB1FEF98A9FA57CF37AA835A6091A5EA19A85F39C1455F4F59F2EA2782EDE9C02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojxd0rRjfnTmY1WlOlIvQdBA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949816B4BC91EC7BB554F20C74B26AAFF93459D66119557440A8C912F5E38557B6FD12C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok

Add new entry to the SM8450 dt-bindings for the SM8475 clocks.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 2d2c59aa8c6b..b9d29e4f65de 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
+      - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
       - qcom,x1e80100-gpucc
-- 
2.46.0


