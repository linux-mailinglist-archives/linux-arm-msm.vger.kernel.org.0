Return-Path: <linux-arm-msm+bounces-35149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45799A56D0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEFD1F20EEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D642D1993BA;
	Sun, 20 Oct 2024 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="i6cpD3BG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="h3kzUEls"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback22.i.mail.ru (fallback22.i.mail.ru [79.137.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8B199222;
	Sun, 20 Oct 2024 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457822; cv=none; b=MQnyOtyzAzwUcYLfGh8B/+V7nyrWwHl22hFvz6Ns/PdVTcocD8okeoH1+Ydflg2dLfroM+2ePMhtOCr/s0gOjAcdv+JXhTpvlEtOKI1EVN07R3zjVgYNNDYC9Ih6PnjR4tpt+wA4gJ5bkycJU1FYdxydTSkBRmmICp7gwFi8Q18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457822; c=relaxed/simple;
	bh=Rv+rlJDgL/W41YcmZU6N6gKayF5g2c8roFwOXjPD52g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOUFiUFjYjK5JaLMCeNdvZ0fjMKwdl9HiX0k9IRP0V8RxrRaL0josKFTDGLOmrVQbLT3qI/wvbB6j6rdUsj1ZXU/mWsFrsvLlEdxEpM5HrOtlsNaB0EU5BNZ452Ba2WfZfr3Drvxtscct49tBcmYo5RA5AXNJ83iLBxrLV4QqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=i6cpD3BG; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=h3kzUEls; arc=none smtp.client-ip=79.137.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=6lxwLuILeuP5Sblxr/a2QDsEkd4Cq23q0UNeIgLsxRw=;
	t=1729457820;x=1729547820; 
	b=i6cpD3BG2wZfPO80rjgl4HKH5gE7gscGDHCLW6ua71NwbPKjxyrH0FEJH/xtarJ/RjL1xAjpRf3ZEp5dHSBF4EZvxqBB76Nip6K8JNh6CBPQcIV61F9/HDnHRjgwij0cz5lyMfyDZYxl1O/OwJe7eqKSHyaFjawYsGmGRQGdyBQ=;
Received: from [10.113.199.133] (port=40706 helo=smtp52.i.mail.ru)
	by fallback22.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cyp-00FrIW-Kq; Sun, 20 Oct 2024 23:56:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=6lxwLuILeuP5Sblxr/a2QDsEkd4Cq23q0UNeIgLsxRw=; t=1729457811; x=1729547811; 
	b=h3kzUElsuwTxr4/UmFP9EhZ7brv3C2RXQLU9xOByuGPJ8/7pQ6EWZHjjtTWbGfHqmkPIPDpg3mF
	/HuhyYMa0eHiw6lVNMQvVDbHcWM98caex73aZ/5O+JxxFTnRvME9xmCZGKVIdu7dwFPLxwmPzp0Jv
	m7eNmCGhXs8MnADTM7E=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cya-00000000L55-1NIY; Sun, 20 Oct 2024 23:56:37 +0300
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
Subject: [PATCH v3 2/6] dt-bindings: arm: cpus: Add qcom kryo670 compatible
Date: Sun, 20 Oct 2024 23:56:10 +0300
Message-ID: <20241020205615.211256-3-danila@jiaxyga.com>
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
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525BEAEE9FA8344CC1B5E1023763A8405A29182A05F5380850407FDBA1C41595331E3DE06ABAFEAF6705804EDCD91E8F5C6343A93D006BE7B5D5E4D98B9586BF5A92
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE759251087BE69EEF7EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370F98874192B1BA168638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D87EC1FFA8C8B313D8718B8CE3092C92CB511F1F454421E13FCC7F00164DA146DAFE8445B8C89999728AA50765F7900637DCE3DBD6F8E38AFD389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC865B78C30F681404DF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C1DAA61796BF5227B2D242C3BD2E3F4C64AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3A2E045C6B1EF423DBA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7DBBA001AFC1C4016731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A56EAC38C87BE278E75002B1117B3ED69643473338EFF6DF4FCCE9A60C8CB01D7C823CB91A9FED034534781492E4B8EEADC0A73878EBD0941BC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5D021057AC91964CE6182E2D5CA6A5080724F119B1EB34BD8DE797691889A81CCCDF2CE9FE05F2E70B1383DF4BE982FCE94E25EF2AD03FEE1B4999C0876C9295E4A056E05E33FF82F72E9902079A869902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s6zGiPpnYAZZA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA87A35C9C7BBE74BEF258842A8BBEB303E75189F1C3DE724C2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: 78E4E2B564C1792B
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D4D60278447EFCEF25FCB08AD8BFC90DD968F3CF0E9FE49B69586F9C8573CB553BC322B671B5B25401D66D67277DDAC68E45E550E418322250
X-7FA49CB5: 0D63561A33F958A53C8866B9A3A7A50B16DC3659D66D0071110AB0773A2EC4518941B15DA834481FA18204E546F3947C6B0333991EC3238CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637B17C8D3FD77BA83D389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3628704EBF2E554D535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s5wlc4O3Iu34Q==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

The Qualcomm Snapdragon 778G/778G+/780G/782G uses CPUs named Kryo 670.
Add the compatible string in the documentation.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7e..cd62d215264f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -202,6 +202,7 @@ properties:
       - qcom,kryo560
       - qcom,kryo570
       - qcom,kryo660
+      - qcom,kryo670
       - qcom,kryo685
       - qcom,kryo780
       - qcom,oryon
-- 
2.47.0


