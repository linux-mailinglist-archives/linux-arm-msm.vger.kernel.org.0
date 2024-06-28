Return-Path: <linux-arm-msm+bounces-24599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DCC91BA6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4671C20B52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB6914D422;
	Fri, 28 Jun 2024 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="kAGiZzqp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Kq5MbfVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback25.i.mail.ru (fallback25.i.mail.ru [79.137.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B392139D4;
	Fri, 28 Jun 2024 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564748; cv=none; b=Ys4hO11ltYWq0bxtxqgAY8K2cLsPx7VnOPQ2VA+0tgcR+Tar9gjyOu3G5wztotjkHm7dF87NsrPlKTaMh0eDZuFxEGCRkFD0ajNHSf+Y3fATcAS1Kif1UnTIoelsR0WfniQ8e4zuNHQtOw6Klp7LTWNAXwUOZZtnbOvDMi9YIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564748; c=relaxed/simple;
	bh=6E4ocIGFk0AHL75T3W9lW9HCOpVyOKPovV88BDYLM28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XIPj4rcAWLdApj59VaZ53+/X+BMqNfqjrLa0NVQSQD/VLiZBtNf1Dv7Y0K/xvp1Bxk42P8EM625W+YD9bKgL3LAptTv58NMYf6ztto+gNFxQFU4Qlteu3gIOIlPumL/21TG6tv4m1ldxLcEXNOObxMZEJfAlzd7CNk3zgaRu+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=kAGiZzqp; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Kq5MbfVp; arc=none smtp.client-ip=79.137.243.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=3Ar3P+hPbqFiwyl7C4MmzgFJnQ8mK59RRMKBQofsVJM=;
	t=1719564746;x=1719654746; 
	b=kAGiZzqpfr83stsIPy5sZitnz1oMd+cYu4h/WvKm6ALapJep3U2ymk3rFZm2U7c1TOjscpewcDW4T2U++//pJvdg2je8fPWBRCquvIPgzRnH1lrnZJRkDLncEZ071gMhm0N6/uiKmCPGkwGClZUCE5LNumsCvTQo/m/EAXO7E6Y=;
Received: from [10.12.4.31] (port=35656 helo=smtp56.i.mail.ru)
	by fallback25.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1sN6tv-002UQQ-5V; Fri, 28 Jun 2024 11:24:11 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=3Ar3P+hPbqFiwyl7C4MmzgFJnQ8mK59RRMKBQofsVJM=; t=1719563051; x=1719653051; 
	b=Kq5MbfVpGRXh4FIw6ecs5/C5wHgnrhYQJwODC1NPMibd7SN8pHhrgMp7UKqkNTM/0+xmN9Was9+
	NpFNsuu27di+XClPxxaSfEXCLiFZwbGWDRyW8i5ZIJCL4V4RSevxY8GcC5eQ4PIhwiDMneAVeMbbj
	xvAj5mVoWpxYHQdwe5k=;
Received: by exim-smtp-84f7fbf7d8-dklnz with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1sN6tf-00000000a5W-1OeS; Fri, 28 Jun 2024 11:23:56 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH 1/1] dt-bindings: display/msm: dsi-controller-main: Add SM7150
Date: Fri, 28 Jun 2024 11:23:43 +0300
Message-ID: <20240628082343.28341-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628082343.28341-1-danila@jiaxyga.com>
References: <20240628082343.28341-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9749DDC91F62168F91C3F39031358981B86C3857216B5FE61182A05F538085040266675009EE866ED3DE06ABAFEAF6705D562D5882173DA45D4BAB75C247D3C8DC9EA2F84C7A79465
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F1942E6D70B4A2F0EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D07BBD2EBFB7BF888638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8AE1116DAEA21A0C27927E4C5451573B7D1122D665F0F1390CC7F00164DA146DAFE8445B8C89999728AA50765F79006371FEB031537767747389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC878444BBB7636F62AF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CA5ED62E35AC703CCC0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3C9F4304F34B30F1CBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF7EF884183F8E4D671DD303D21008E298D5E8D9A59859A8B6F459A8243F1D1D4475ECD9A6C639B01B78DA827A17800CE70012B0FBE38D23AE731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5889123BB9B3B997C5002B1117B3ED696CB36F49F8B669AAF1E49B01306B5E3AD823CB91A9FED034534781492E4B8EEADB71243024C627CEAC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF36A14396D54525BDFCDE2E49122C30FF6C598CC6315F652C104649BAC6307798F61CD9246542D0C444A12D68860EECB72109D5ECE7ACAD65A6FFEC9055B244E7DD66B608A8CD852E8100E6DA90CB805802C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3nPTCPlbcxNAw==
X-Mailru-Sender: 0A26D9779F8DDEABFA5A783B5DB0061BCEEDF7D08FB5E6CAB951B70A5BD4BD8EA324EEE37D5E021EE5E949923882BAAD210985D6C440852E55B4A2144138A88088F510C62CFD139357C462056C5AD9112068022A3E05D37EB4A721A3011E896F
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B44E72EF7427BD9C0864826EF222902C20EF4D8836E9D6F665049FFFDB7839CE9EFDED2BF4F082F19585E326172A2798C9750E2D464EE520454CD3A696AC839CB2
X-7FA49CB5: 0D63561A33F958A50CFCECB03F50D42B4106A91E8D6475368FB3DB30C04BE50E8941B15DA834481FA18204E546F3947C30C7C91C97108465F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637A4BA495B1E3EA588389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C35CB5556AFF48B99435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojOl9CAQoHe3mulkcZqffUFA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Add the DSI host found on SM7150.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e1cb3a1fe..b0fd96b76 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -32,6 +32,7 @@ properties:
               - qcom,sm6125-dsi-ctrl
               - qcom,sm6350-dsi-ctrl
               - qcom,sm6375-dsi-ctrl
+              - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -348,6 +349,7 @@ allOf:
             enum:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sm7150-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
-- 
2.44.0


