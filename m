Return-Path: <linux-arm-msm+bounces-35153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3479A56EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 23:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EC101C20C74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 21:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1631990A1;
	Sun, 20 Oct 2024 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="viEpNdc5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="jVcukGwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback3.i.mail.ru (fallback3.i.mail.ru [79.137.243.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162EE194C9E;
	Sun, 20 Oct 2024 21:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729458904; cv=none; b=J1M3vPPepfWDtpoPfRUzl1yADThliP4gVFXagMOHQH5r5fYsW3eoGvfzMnopJ+hxTTn1Xluxaa0vUvV1lnVN0kJRtLNrywb/mKELAUEucIQQptQ2V4BNoggyxcyFycRLujBSFLJwQ1ZHNSZeGB67SP7ZcGGSwyjnldVjDkqMzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729458904; c=relaxed/simple;
	bh=4/goLJkbYMWU9KjQLvQXzQziEVnb89ZrcCKDKvl3Uq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fj+9Yx9YnSqY1LYCRaHq1ZhKzL6fllmxRGPDIbrJ/WKvSlzr/YvqC0gjld5+rf2JT7WBXJimuHryvHpK90fdeteusEHGG9zXRBnoE3p7ZP7YZAWLxYdciOnkiXcoNenyANrr+cu9SEdDBrhtSVabxpB543V6l106Ab9a0AgPtg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=viEpNdc5; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=jVcukGwU; arc=none smtp.client-ip=79.137.243.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=nd98pUhkeOqOCtUhwaS8bU34haL7YR32/Ufh68olpbs=;
	t=1729458901;x=1729548901; 
	b=viEpNdc5iD498v/jh0LHWX9kZ6hyS0wRsvEpFdXYlHsr891dhyiD6mMoBnTe3sHl5E6TuWhHEDnqGwuhjmSjMhgMm5B9qtxggoiHY+A0MlfNDaFYHmT1fen7f9PJPHQnu0XrdNJkEqHouY4Of91o2ng1XukiZHkWEWceScdesDo=;
Received: from [10.113.175.237] (port=41532 helo=smtp61.i.mail.ru)
	by fallback3.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cz6-00FqQf-AS; Sun, 20 Oct 2024 23:57:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=nd98pUhkeOqOCtUhwaS8bU34haL7YR32/Ufh68olpbs=; t=1729457828; x=1729547828; 
	b=jVcukGwUdVMvol1n2TVU4FIVsyLQ+XHZ0W1UcsqcopZHOFx9YrygqjjfqAaWIU3sSDJ6tub2q0R
	GxR1e8d0av3/cRF/53CPfYc/kIHcrbUs1EKAGRdluFEzMvFFjFut15jA5egf+600XxDrPst35S+IR
	fcjwikbIjh18MM+U7yc=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cyr-00000000L55-3ddY; Sun, 20 Oct 2024 23:56:54 +0300
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
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: Add SM7325 Nothing Phone 1
Date: Sun, 20 Oct 2024 23:56:13 +0300
Message-ID: <20241020205615.211256-6-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525BCBCD8352AE5242EBFE8B3FCA056C535A182A05F5380850407B575BFEFDC62CDF3DE06ABAFEAF6705532C3632D8DFC69143A93D006BE7B5D5679C55F6EEB1E644
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78D182E101C1D8075C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE70312E9A300D47E3BEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BC08E230531AC9C90EEB0765107B6EB8E3581F73775418FA373C7B7D0ED8C235EA471835C12D1D9774AD6D5ED66289B5259CC434672EE6371117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE759A2DA0C93DFCD719FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7B069F7EBDE4CC8E27B076A6E789B0E97A8DF7F3B2552694AD5FFEEA1DED7F25D49FD398EE364050F4B6963042765DA4BAD7EC71F1DB88427C4224003CC836476E2F48590F00D11D6E2021AF6380DFAD1A18204E546F3947CB861051D4BA689FC2E808ACE2090B5E1725E5C173C3A84C34964A708C60C975A089D37D7C0E48F6C8AA50765F7900637569CCF021E1EA749EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-C1DE0DAB: 0D63561A33F958A548FFF8326FB520CA5002B1117B3ED696D2DFCE6761BB38F8CCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEAD21D4E6D365FE45D1C79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CFB15934AE39018A84220CDDC10CA06413283DFB4C5EA4FF1212C61BA85426CA88A703FE8D8B5282210B1383DF4BE982FC25727F2A38A285121B4999C0876C92959F9B23C4714E51AAF72E9902079A869902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s4/idOO8DD5zw==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA20C74B26AAFF9345B15CBB05148D8919FC399A8396EA591D2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D4DE1AF98544F7A4205F4A3A7B877765BC68F3CF0E9FE49B69586F9C8573CB553B128AA3C79737AF567A6B6C82748E342A47B4208138E82915
X-7FA49CB5: 0D63561A33F958A5C3C1E48ECFDBA1342999E19A473ABD21AF8C8168E8B552EB8941B15DA834481FA18204E546F3947C124FB6D01C44F684F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637A58AA41A0F9FC58D389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C360C233830BDED4CB35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s4nE6OwhG3U+g==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

Nothing Phone 1 (nothing,spacewar) is a smartphone based on the SM7325
SoC.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0d451082570e..0f18cb35c774 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -76,6 +76,7 @@ description: |
         sm6375
         sm7125
         sm7225
+        sm7325
         sm8150
         sm8250
         sm8350
@@ -990,6 +991,11 @@ properties:
               - fairphone,fp4
           - const: qcom,sm7225
 
+      - items:
+          - enum:
+              - nothing,spacewar
+          - const: qcom,sm7325
+
       - items:
           - enum:
               - microsoft,surface-duo
-- 
2.47.0


