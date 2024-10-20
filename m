Return-Path: <linux-arm-msm+bounces-35147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB849A56C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 22:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9861F21697
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Oct 2024 20:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83EB198A01;
	Sun, 20 Oct 2024 20:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="U9LJHEaI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="LwW+MArs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fallback19.i.mail.ru (fallback19.i.mail.ru [79.137.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEB919755B;
	Sun, 20 Oct 2024 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.137.243.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729457815; cv=none; b=f040uEiq8ixYeJJfJcROMVgw1f6GhXGnefuj4dZQ+wS58pFaaLqBP4rSOBiX68t9rLKcs5Z1ZgPJRav3Peb4XCGnCObJpFTqg32C6S1Vzl7cEcW6/0qm9INMCfrRj66aN4KEDNdkgf0HzKIfAIsXEnSe5SvazxG8hlEejfG9i9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729457815; c=relaxed/simple;
	bh=05bx7gY4pHuTxZBauceo1CWv9fr1UnOtDHtE60VByXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X8pFLchwgn848OoneaewZoDm1+/S3lXSU0yrzShDQP6hsJhoRpkASPUrQ7S0hpQu3GK2SoqaPxwfTbpHNKTfc9YWpARere+jUHnb2QA1zSaf0FnztXqX/AcPhol81B6G5AA5bmaxT/rWUD5V1l3TCL+Qe4/T4hQZhnredZrFyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com; spf=pass smtp.mailfrom=jiaxyga.com; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=U9LJHEaI; dkim=pass (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b=LwW+MArs; arc=none smtp.client-ip=79.137.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jiaxyga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jiaxyga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com; s=mailru;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=57J+vROhgOQl91BKGGCfelts0NdRgOSFNz4SMinUokU=;
	t=1729457812;x=1729547812; 
	b=U9LJHEaI7tF+WUuf09psPwH4yNEm3W5HnXnMNIlQS8fbftY/yvgoKbcJx2rUIciNNpavqzBEFXPGu4uwzKjYJ4bDUL0Ocpi3IgJr+SvOmmZMg0Sni55XzCawf2sMH0AbKKQV4zbn5s21TkjZmDyvXlZRslhY4HSwpuuojQKG3k8=;
Received: from [10.113.104.13] (port=54220 helo=smtp3.i.mail.ru)
	by fallback19.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
	id 1t2cyh-00D5aC-EL; Sun, 20 Oct 2024 23:56:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
	; s=mailru; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=57J+vROhgOQl91BKGGCfelts0NdRgOSFNz4SMinUokU=; t=1729457803; x=1729547803; 
	b=LwW+MArsoVzH8mG0KXOofBbW3jcFVPIWGfSzMQ/UfMlOFmJ2YlXf0xJhPhDniKt0XSmAmxwIsnJ
	jgW1rjGX9j8Hpc2cRc1v/bEQp4oi7XEq7U7doslMNZd4X7RSe2xfSBm2bLQXkGA5jFWDQw3FVKwUV
	WBZjHXTRA0FMQc/DZ/U=;
Received: by exim-smtp-669df98d5-42lq6 with esmtpa (envelope-from <danila@jiaxyga.com>)
	id 1t2cyO-00000000L55-47el; Sun, 20 Oct 2024 23:56:26 +0300
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
	Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v3 0/6] Add Nothing Phone (1) support
Date: Sun, 20 Oct 2024 23:56:08 +0300
Message-ID: <20241020205615.211256-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92EEB9808938F525BF6E977894D3F6F9BB118107C53DC8BE8182A05F53808504089D4964DE8583EA53DE06ABAFEAF670527C49733761D74A243A93D006BE7B5D5E93E1AEB4077C98C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE737AE489DBC023F2AEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370BEBC60587DC626C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8455C22EFDC9488D6718B8CE3092C92CBE407231B465A2235CC7F00164DA146DAFE8445B8C89999728AA50765F7900637F924B32C592EA89F389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC8034D30FDF2F620DBF6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947C4CB6874B0BCFF0B8C0837EA9F3D197644AD6D5ED66289B523666184CF4C3C14F6136E347CC761E07725E5C173C3A84C3048DACD9C49003B6BA3038C0950A5D36B5C8C57E37DE458B330BD67F2E7D9AF16D1867E19FE14079C09775C1D3CA48CFE478A468B35FE7671DD303D21008E298D5E8D9A59859A8B64854413538E1713F75ECD9A6C639B01B78DA827A17800CE7DBBA001AFC1C4016731C566533BA786AA5CC5B56E945C8DA
X-C1DE0DAB: 0D63561A33F958A536FD17B1B44FEAD65002B1117B3ED696CA2C2A905BB773FED57BAD45EC4C5DE1823CB91A9FED034534781492E4B8EEADADEF88395FA75C5FC79554A2A72441328621D336A7BC284946AD531847A6065A17B107DEF921CE79BDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF7C1698EEA8EA884375D09146030D4ADB83B4C066F2B31134FB2A9B3411ECB492D1BAA24A4D7F85D80B1383DF4BE982FCE5BD1349DBF3A47B1B4999C0876C92957BE60F3DBEFC70AB3430F16D2888FC8A02C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s6lnr2pQjWAGg==
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275FCB02445A36FA45DA95D4C5B18C328FC0C70512527E4B940C01F02B2CF4A691EC2C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-7564579A: B8F34718100C35BD
X-77F55803: 6242723A09DB00B4F4F76BB1214CC8D473077125497867BD7267364A997B362068F3CF0E9FE49B69586F9C8573CB553B6C71F2D3AFC53269D4E2AB64A46682710F021A02F9FAEE83
X-7FA49CB5: 0D63561A33F958A51D77A178ADA1990B09AC25E7B18ABC42A3FC4520A10E3A468941B15DA834481FA18204E546F3947CCC237B8757437CD7F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637AD617F2306083EE9389733CBF5DBD5E9B5C8C57E37DE458BD96E472CDF7238E0725E5C173C3A84C3B0435DEF61AD690C35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojRqMkPUKL5s78/yN9Sbwung==
X-Mailru-MI: 8000000000000800
X-Mras: Ok

This series of patches adds support for the Nothing Phone (1), identified
as nothing,spacewar. The Nothing Phone (1) is built on the Qualcomm
Snapdragon 778G+ (SM7325-AE, also known as yupik).

SM7325 is identical to SC7280 just as SM7125 is identical to SC7180, so
SM7325 devicetree imports SC7280 devicetree as a base.

Changes in v2:
- Drop patches 1-5 (from v2), as were applied in the previous merge window
for v6.12.
- Add Krzysztof's A-b tag (patch no. 1)
- Add Rob's A-b tag (patch no. 1)
- Drop qcom,board-id & qcom,msm-id (patch no. 6)
Note: PMUs fixes were applied in a separate series:
commit <89f324ef54a2>
arm64: dts: qcom: sc7280: Fix PMU nodes for Cortex A55 and A78
- Link to v2:
https://lore.kernel.org/all/20240808184048.63030-1-danila@jiaxyga.com/

Changes in v2:
- Add Krzysztof's R-b tag (patches no. 1, 2, 10)
- Add Dmitry's R-b tag (patches no. 3, 4, 8)
- Document SM7325 as fallback to QCM6490 (patch no. 5)
- Drop patch no. 6 from v1
- Document PN553 NFC IC as fallback to nxp-nci-i2c (patch no. 6)
- Add Krzysztof's A-b tag (patches no. 7, 9)
- Switch nl.nothing.tech/nothing.tech in commit msg (patch no. 9)
- Add fallback compatibility for NFC (patch no. 10)
- Fix interrupt type for NFC (patch no. 10)
- Link to v1:
https://lore.kernel.org/all/20240729201843.142918-1-danila@jiaxyga.com/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
To: David Wronek <davidwronek@gmail.com>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Heiko Stuebner <heiko.stuebner@cherry.de>
To: "Rafał Miłecki" <rafal@milecki.pl>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: linux@mainlining.org
Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Danila Tikhonov (4):
  dt-bindings: nfc: nxp,nci: Document PN553 compatible
  dt-bindings: arm: cpus: Add qcom kryo670 compatible
  dt-bindings: vendor-prefixes: Add Nothing Technology Limited
  dt-bindings: arm: qcom: Add SM7325 Nothing Phone 1

Eugene Lepshy (2):
  arm64: dts: qcom: Add SM7325 device tree
  arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1

 .../devicetree/bindings/arm/cpus.yaml         |    1 +
 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 1260 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7325.dtsi          |   17 +
 7 files changed, 1288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325.dtsi

-- 
2.47.0


