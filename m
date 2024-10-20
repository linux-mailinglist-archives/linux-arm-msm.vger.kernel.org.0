Return-Path: <linux-arm-msm+bounces-35148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A640D9A56CA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A971C2112D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8101990D1;
	Sun, 20 Oct 2024 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="oTUQkDPs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="Oc8faQKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback1.i.mail.ru (fallback1.i.mail.ru [79.137.243.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A31974F4;
	Sun, 20 Oct 2024 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457818; cv=none; b=lJxp8u4O0Xgr0BAX5nOy2ZsSK5Yrdv+2vACFLG9UcTO9XUq7m0VVWINGmWa37Yp6ihes+fwBqcuKdEKT2SWTb3VfqqcgpsQJ5YPvYw2HS9ojwg/TQumuaNMsFHy8cfbm/9ezznIcMQcHGpEhpTudmH524VyQv8DuvP2c9uc+bi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457818; c=relaxed/simple;
	bh=Cvdhm7pcoy3H4QeWZBUepVwBMWBi+FWDT4HE9XeyxVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8dUiikpuUXKJ8YExMLV+GhSXn/VQEnDEZHtpEG8/J/eMVNxvRlJCpeN95QxS2DGpY85bddVlCLGwxEMYecHI2g1sifaJi6s4X/tn66LY2r+fQ19va01YC2SW2VVJ1KvV/ifqynsN6Bo4Dl5+6Kio8WuvcVBSLuNgSkbQteZE3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=oTUQkDPs; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=Oc8faQKH; arc=none smtp.client-ip=79.137.243.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=o9B1c0WH1bkwI6MDcmtd8YqXjngqiGA5ics3UIHTgi8=;
	t=1729457816;x=1729547816; 
	b=oTUQkDPsYFV386+8l86T0/pei+sfRJCyeWrjkQ97XTl7fODZNRvhbhH/7LynGyipwleK8nsobQL2niWcmvxg2c/nJrbYFU5C+oNpVkxknOt6AYg4bII4Rdz9VMG5l20l1/CrSbJ/MUVzYOfuzGR+SYtWaAM4vyqpq8EGiVLU21Y=;
Received: from [10.113.99.193] (port=41326 helo=smtp29.i.mail.ru)
	by fallback1.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cyl-008l6r-7X; Sun, 20 Oct 2024 23:56:47 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
	X-Cloud-Ids:Disposition-Notification-To;
	bh=o9B1c0WH1bkwI6MDcmtd8YqXjngqiGA5ics3UIHTgi8=; t=1729457807; x=1729547807; 
	b=Oc8faQKHr2UDHlxcqdZrSTNVRMOi70phPAILqBSgPqWZ3cAebn5kjRLbR9b3MImxI1JMz0Sst8q
	XRW9mbDSvqiN51tyPV2dQ6Py0/wg6i4XytqVz6GW1u5oNhgN/JPzH8NSJOaYbizPdjVOrD11yC3+P
	ZEFWE8Q7jPfJgyzHdVs=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cyU-00000000L55-4B0J; Sun, 20 Oct 2024 23:56:31 +0300
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
Subject: [PATCH v3 1/6] dt-bindings: nfc: nxp,nci: Document PN553 compatible
Date: Sun, 20 Oct 2024 23:56:09 +0300
Message-ID: <20241020205615.211256-2-danila@jiaxyga.com>
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
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525B91442D4EA145C2A3EF7BE3ECA51F70B6182A05F53808504005E7E8E0145929183DE06ABAFEAF67050147BA44258392B443A93D006BE7B5D5285C021E7E0FF4E2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71B1B5393BB9C1313EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637051ADBC467AF48EA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80C9DB4E67DAFB7F0718B8CE3092C92CB19C25A185DDA6D20CC7F00164DA146DAFE8445B8C89999728AA50765F790063793270F7220657A0A389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC87AE820D2C17D0E56F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C034D30FDF2F620DBAD7EC71F1DB884274AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3CBB2AD16525BF7B9BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CF17B107DEF921CE791DD303D21008E298D5E8D9A59859A8B6D082881546D9349175ECD9A6C639B01B78DA827A17800CE7DBBA001AFC1C4016731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A5EE9D8F6276D7F97E5002B1117B3ED6968F1D55DDE008CB7C72305013E4AE841E823CB91A9FED034534781492E4B8EEADD0953842B444AAC3C79554A2A72441328621D336A7BC284946AD531847A6065AED8438A78DFE0A9EBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF65B2C896EC435344E8CCFA060E0320CAC1D83FF3928A25C3864644FAC097FE648D4FFD5EE53653990B1383DF4BE982FC59EE31D94E9B07FB1B4999C0876C929561F608AF11B99261F72E9902079A869902C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s4LpkGVH57NoA==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA0D8E165B5AC4796C0888A47FB249FF0906F365114516B2B62C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D4FEDF29ACD4F1F9B93D923C8712EDA72C68F3CF0E9FE49B69586F9C8573CB553BE5B18097C12A8194E2F21AF6BEB2D196841F22F1649A5C49
X-7FA49CB5: 0D63561A33F958A505DD4683D42445FCD0590B56AA5EC637415379F17B2CF6F78941B15DA834481FA18204E546F3947CBEA9B8E365B3D750F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637F226C61412C26ED3389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3B0435DEF61AD690C35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s5i9OnQLiqVEA==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

The PN553 is another NFC chip from NXP, document the compatible in the
bindings.

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
index 6924aff0b2c5..364b36151180 100644
--- a/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
+++ b/Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
@@ -17,6 +17,7 @@ properties:
           - enum:
               - nxp,nq310
               - nxp,pn547
+              - nxp,pn553
           - const: nxp,nxp-nci-i2c
 
   enable-gpios:
-- 
2.47.0


