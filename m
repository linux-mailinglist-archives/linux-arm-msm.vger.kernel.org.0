Return-Path: <linux-arm-msm+bounces-27564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C701943545
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DCB9B223B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7D4481B1;
	Wed, 31 Jul 2024 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="VRR7eQjW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="CLV33i2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2504644E;
	Wed, 31 Jul 2024 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448794; cv=none; b=b20M0VX+fb04IBq46KfvBAAdzDbuDcXxlwRxfnshIUDxpmLrwMlS2rizqsg8UyHggDvF1x9Pslgp1fShXEru6AvuSUHGQOy338oPQrNRVW0uk0l8w96x9Rk/P6T9kPLvjS7MT6Edc7bb2Icv27sJ/6vPhhiEMtPOrO8R6bazbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448794; c=relaxed/simple;
	bh=eGnQiXjHr/Odv/ACcge8s/raPH3IMfjr+83MGXKqmfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hBKFKxtjcXdAVKsibk6H/LlfnhzbHet0W5B872wUXRqEayJM13iY5epe4NOt7NyUpF0HEK5v/2aXMy8lJxuudsSWbe2iu4DwPtcenIxm7zWfUOCEUOyRn/7nBiUdaHwlnFB26iYgXJ/vZHF+XaHc3U5YG2pPVDGtGhAmmCwEUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=VRR7eQjW; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=CLV33i2R; arc=none smtp.client-ip=79.137.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=g8epCXay0Jg+C/diMxaa0Up6nv/rRA5yt4XrpKr+p18=;
	t=1722448792;x=1722538792; 
	b=VRR7eQjWGwvL0aeqKmT1w/05lEDZz8GeYhY35kkupdPpVbM5lsV5PbzgryVKZetr3UbUjctkF34yXVQgt1+78WrU4a8ySzpVQmJfoJv1GKvU4ieqNbHmH8jX3jLPGMZWBCsWsIPiguir/AgreKTdb8QnWh3iAjDDzsKWtVDfUU0=;
Received: from [10.12.4.26] (port=57706 helo=smtp50.i.mail.ru)
	by fallback16.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDc0-00GzsK-9U; Wed, 31 Jul 2024 20:59:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=g8epCXay0Jg+C/diMxaa0Up6nv/rRA5yt4XrpKr+p18=; t=1722448784; x=1722538784; 
	b=CLV33i2RR1s3OZdZZy6upyq8KId+tc8aBkUaEEafJhuTeSO7Mnad+QfiHiPbL6wh8a0Gf7++bry
	nOBrOtcoT0S2CtQ50H7RP7jl9x/SnDcUFHo9nuvBVSl70GAoBe5AqW+C7jPp99zTz39f7aJuqQG8H
	DCM48JsNRV33Bd1g2VI=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbj-00000000IYY-0mGF; Wed, 31 Jul 2024 20:59:27 +0300
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
Subject: [PATCH 01/10] dt-bindings: clock: qcom,gcc-sm8450: Add SM8475 GCC bindings
Date: Wed, 31 Jul 2024 20:59:10 +0300
Message-ID: <20240731175919.20333-2-danila@jiaxyga.com>
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
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A915E3E16B49BA92E473D9E9365E0544A7182A05F53808504090544F0EEE1FCA413DE06ABAFEAF6705711FB7C5DE05C8A9F806485F292FBEEB141B3585208100AE
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74D0D2DEF2EB846B0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378ABD31E9FF1CD53C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D847B723E399AC477C995830582C796B1883259F87B893204ACC7F00164DA146DAFE8445B8C89999728AA50765F79006372A3B24BF85B2E607389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8ED96AA85C75E140D117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CF56E3D212986C9D9EBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6D91B6531E6CC8CCB76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249957A4DEDD2346B42E827F84554CEF50127C277FBC8AE2E8B2EE5AD8F952D28FBAAAE862A0553A39223F8577A6DFFEA7C5B09DCDDD98ABCD243847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A54D45E046ADEAFA725002B1117B3ED69659213019B8A0FB3BED71F038FC046993823CB91A9FED034534781492E4B8EEAD220496FFA5CD4785C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFAAAE386D03EDBA5BB96FBCDEBE75CD5B6201D079E1A4D3280325D02851A02B2BA4BD9291AB2A84561D9D8FAF50ED830BE81C388445EAECB1C126D84212B092F69C9D13D1AD570697983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3u1/U5B8RMY7A==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A10841F56765D88C405553DB1DFEC3BEC947F2D2A5A79AF8E32C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CD2DC820544DB7BD83049FFFDB7839CE9E45E89A588AFC070541965E3F48AB11C69E31339189790A75383B57F53CC0B9B9
X-7FA49CB5: 0D63561A33F958A50394500F873E365473F50D156C539EE3A9131AFC1D147B0E8941B15DA834481FA18204E546F3947C1CF6DFABFD638A7DF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637AF8DFA94C5B6F7D6389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3777F8C72A04D893B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3uooJveIBPrFQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add SM8475 GCC bindings, which are simply a symlink to the SM8450
bindings. Update the documentation with the new compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sm8450.yaml        | 8 ++++++--
 include/dt-bindings/clock/qcom,gcc-sm8450.h               | 2 ++
 include/dt-bindings/clock/qcom,sm8475-gcc.h               | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-gcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index d848361beeb3..c7d75ee2a23b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -13,11 +13,15 @@ description: |
   Qualcomm global clock control module provides the clocks, resets and power
   domains on SM8450
 
-  See also:: include/dt-bindings/clock/qcom,gcc-sm8450.h
+  See also::
+    include/dt-bindings/clock/qcom,gcc-sm8450.h
+    include/dt-bindings/clock/qcom,sm8475-gcc.h
 
 properties:
   compatible:
-    const: qcom,gcc-sm8450
+    enum:
+      - qcom,gcc-sm8450
+      - qcom,sm8475-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-sm8450.h b/include/dt-bindings/clock/qcom,gcc-sm8450.h
index 9679410843a0..5f1f9ab71a22 100644
--- a/include/dt-bindings/clock/qcom,gcc-sm8450.h
+++ b/include/dt-bindings/clock/qcom,gcc-sm8450.h
@@ -194,6 +194,8 @@
 #define GCC_VIDEO_AXI0_CLK					182
 #define GCC_VIDEO_AXI1_CLK					183
 #define GCC_VIDEO_XO_CLK					184
+#define GCC_GPLL2						185
+#define GCC_GPLL3						186
 
 /* GCC resets */
 #define GCC_CAMERA_BCR						0
diff --git a/include/dt-bindings/clock/qcom,sm8475-gcc.h b/include/dt-bindings/clock/qcom,sm8475-gcc.h
new file mode 120000
index 000000000000..daafdd881892
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8475-gcc.h
@@ -0,0 +1 @@
+qcom,gcc-sm8450.h
\ No newline at end of file
-- 
2.45.2


