Return-Path: <linux-arm-msm+bounces-27567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C545943550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 20:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CD11C2186A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DD01BD505;
	Wed, 31 Jul 2024 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="wq3lo9vm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="RHlxdj8G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A741BBBE6;
	Wed, 31 Jul 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722448798; cv=none; b=rS5srR8kLmZaZ+SnmJxQlTBif2CZu7iUEEqEFHHNgw5+iCutTy6DnPrnSlFt0QCWS91P9nuwSXtGWIMpI+qUu3ylLrh8deii96HOfr7aFlmi2TzS9u2sjoBHID7lS9szhvdzqn+j/5W8uccWX5UN0uX5BsZ8WLEulkRAp1G6W9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722448798; c=relaxed/simple;
	bh=T1eFTrTIMb6y9WGMd6sylIOztXNlpYrsNNWtm5WeHyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wi2LLRC5uF7FA0Ex2aOfZNbVRL6+nmBLHZIBa0Zj+XBAIG4j7fDXfrOvafMxB9nas/Pq+BGMCW531TqT8OZIEgeda9dmJ2vvhdqfbgn+8XBjKT2tZ4/0lFnKlFXA9ibEo8hqOmOzH64MKL9VLdb1hGvrdqys79ZAoNyGKS3sYvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=wq3lo9vm; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=RHlxdj8G; arc=none smtp.client-ip=79.137.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=XqZ/G2WIJDam4wXbqePOjxLWOzCteP3sOMpaq2pGzEQ=;
	t=1722448797;x=1722538797; 
	b=wq3lo9vmQ7Rfs6bSVXaQmPgAQ3UtLcdp8K1JAmK428h0ofTaJtmdl6pwwcFqU+JbbKjyWkpYf+jjS92GWbvg7d3CyxtTNwU3SnNuygEye07muWkoW7raB3kVGxCSU0yGLuDjhhf8YC/fnoLhNOV1ZObqBt92ajIFlSo//csjExc=;
Received: from [10.12.4.29] (port=37256 helo=smtp51.i.mail.ru)
	by fallback19.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sZDcA-001K9G-Mo; Wed, 31 Jul 2024 20:59:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=XqZ/G2WIJDam4wXbqePOjxLWOzCteP3sOMpaq2pGzEQ=; t=1722448794; x=1722538794; 
	b=RHlxdj8G2wgs7Lo6C4sEDvjDTnw1rIhkYObN0MkgL/XtTnMTdvpFnATV+bf+PV7w1bCuZbLHBju
	11lRQEK/q906sNomPzcRhCggqJjyLTeIJzBOul7Kb89sCH+1LvMfkHd6sEJSjiiVIj8HlWVVzCsqQ
	amK5FX03MSvOckWONHQ=;
Received: by exim-smtp-5c6c85c787-mv4xc with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sZDbw-00000000IYY-1BcQ; Wed, 31 Jul 2024 20:59:40 +0300
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
Subject: [PATCH 07/10] dt-bindings: clock: qcom,sm8450-videocc: Add SM8475 VIDEOCC bindings
Date: Wed, 31 Jul 2024 20:59:16 +0300
Message-ID: <20240731175919.20333-8-danila@jiaxyga.com>
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
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD926BB450FD17188A9C7DD05013CA63362168DAE368B9DB680182A05F5380850408C548C51594199113DE06ABAFEAF6705F34B576CCAA21DA6F806485F292FBEEBCF9BE0995F4686B4
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE702C8878A98595F58EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377CC130305260E47D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80A39C902867A547B995830582C796B18ACC9972B0C8E21E9CC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC821E93C0F2A571C7BF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CDA7BFA4571439BB29735652A29929C6C4AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C33BAFBCDF8379C95DBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFED8438A78DFE0A9E1DD303D21008E298D5E8D9A59859A8B6957A4DEDD2346B4275ECD9A6C639B01B78DA827A17800CE7CD707F342D9BDC98731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A51BC5DA734669209F5002B1117B3ED696049293CC7C3A8568B74D9144D44E4FCF823CB91A9FED034534781492E4B8EEADC24E78AA85F86F6CC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFFF42130B120ED98C2BB70F083FB51D9B920AC25304BB4ED111DED8236676FC1935D9E4C97941E9B11D9D8FAF50ED830BB84FEE92964D967AC126D84212B092F6DFDF89D49C00D7C6983AD880C8D3B7BB02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3u0a5ll5CyRJA==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C7394981A1FC0BF4BF26A8A1DF237C39DF130474A84D370C02A76993D2E7F062D493F4EC2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B438D8D16241E2C9674218E0EBCD2528CDC4E1543BC0AC038D049FFFDB7839CE9E45E89A588AFC0705D51B518BEFF9D68B4F44CE0ED1CBB39A6D853EECBADFC4F2
X-7FA49CB5: 0D63561A33F958A5FEF25737012EB9900BE4D0819DEB5D31420265FE333822E08941B15DA834481FA18204E546F3947CA8E05A713DEDC342F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B9C56DF03277676C389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C393E899A2A207F19735872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj2j9vV9f5a3vRin2pFkZmBg==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add SM8475 VIDEOCC bindings, which are simply a symlink to the SM8450
bindings. Update the documentation with the new compatible.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 ++
 include/dt-bindings/clock/qcom,sm8475-videocc.h                 | 1 +
 2 files changed, 3 insertions(+)
 create mode 120000 include/dt-bindings/clock/qcom,sm8475-videocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b2792b4bb554..9186d2ee87f8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -16,12 +16,14 @@ description: |
 
   See also:
     include/dt-bindings/clock/qcom,sm8450-videocc.h
+    include/dt-bindings/clock/qcom,sm8475-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8450-videocc
+      - qcom,sm8475-videocc
       - qcom,sm8550-videocc
       - qcom,sm8650-videocc
 
diff --git a/include/dt-bindings/clock/qcom,sm8475-videocc.h b/include/dt-bindings/clock/qcom,sm8475-videocc.h
new file mode 120000
index 000000000000..231cd153052c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8475-videocc.h
@@ -0,0 +1 @@
+qcom,sm8450-videocc.h
\ No newline at end of file
-- 
2.45.2


