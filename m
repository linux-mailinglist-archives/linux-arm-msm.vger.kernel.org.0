Return-Path: <linux-arm-msm+bounces-106454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMARHxOn/GmwSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:52:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003C4EA94F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 067C93001329
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5AF33ACEF1;
	Thu,  7 May 2026 14:51:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E24372B28;
	Thu,  7 May 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165478; cv=none; b=IVsvZ3wzHKhkwEpzFMB4aJdjfR9Vevz5rtW/owTC2Uq5WbuXOBfGhXYjALA0xZri1EvJrMk5bgZnIxomHY2dKduoa/8ZrIhzm0C2GhCQaCbpfkY2hmeqJK4AycK77YDEWFLTSLupFISkpD5sudPtbFrtEBqYqyYbEDzhksgUnL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165478; c=relaxed/simple;
	bh=u2BzENob+U0AfUiYF6Z72HYlqrIAOzug7RrdZv9iFNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UxbY2VhZG+zs+fyvWbk1dkJQ5nLFgJj041rdn2/2zyhEq0tuTWjoIAbtl4KtcVZUUQqkuZ5SeFWfdbXBxPKAtzhGuJCMfVWesKIWMjZ8Lt1dbk7xz1Qnqjgujlc08yJT7UvLQnUnkUY0sNkdr9+MXGyxFilzuwlRFaBevuwGliQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz3t1778165454td66e8873
X-QQ-Originating-IP: HuGBG3Ml2Caws39TpFtyy9eUy8K149XoQlT7HOxynHE=
Received: from [192.168.30.32] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 22:50:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5577348788633877168
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 07 May 2026 22:50:52 +0800
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as
 dma-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-sc8280xp-fastrpc-dma-coherent-v1-1-e92aed797865@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORuIxc3ir4iHNk1dBbvSVBmM/
 btVj+/yNlCpSRQuwwZV3knTkjuOhwF4dvkumEI3GDITjXRGZWssrQWj01YLY3g65GWWKrnhaSK
 W6EYbvId+lCoxrb//evtbX/4h3L4p7PsHgOox+oEAAAA=
X-Change-ID: 20260507-sc8280xp-fastrpc-dma-coherent-460cefa58dbb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3701; i=sophon@radxa.com;
 h=from:subject:message-id; bh=u2BzENob+U0AfUiYF6Z72HYlqrIAOzug7RrdZv9iFNM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDJl/lp1dFVMefHDF/1tTo3kPzpneaqqQwjfJfL0G64yKD
 5mMvBeTO0pZGMS4GGTFFFkU4hnmslfmXnsqVqoHM4eVCWQIAxenAEzkLjMjwzeXmcIaH8zXebD0
 Fvz/ffxw6sVZt6yYqjICwmenBahJ5TAydDQG7e7epRMd8XKZtzvr3v8FyXmPRL5uX//g7dl5Pn1
 HuAE=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OVyrbz22gz1neDcTSEL44qsZSeg/C3t6IxFebbXCumOWfSpB/OEr1jgL
	svSE+vULzIv2KBnFvGwQBiWuhnJpY8yFHCbVyvGYioEhj+CTT0hzYFAuvqWW6m7EKAws3s1
	9ilYsVdNdVXhyE4Db30kBtOebR2qsp4SnVwZz/zJ5ati9kXI45u44TPDndpbkq+CFu/WPkw
	EjreiQHFTNj1KCIBvYhuHjFr7Ps7XA3z9PNz93K9rUmghLSHc/NCzFcGQrhjlWdXgHaFnz7
	LGImVkbPVNtM4+DXDSfpveFa2gK+H9ZagQvwACRpaGjEH7wHGKyk5Cw/1tHk1q+EB0WcQ6g
	q+bcuOqxBVRMLvA1swnDwIFHXuhxiJ+0kD9/ytW8pnkyaeGNK9owuVoe7gjacMWHhFHH3EO
	2luri71mX3g56kj+joGajwwU+gkwImSTLuGcXPl9B4BEX5eEBCYmPFOXIqOucvqM7Es6JTU
	9RNRrg2ddru2d8gEcwXxQS2CKsNuL2ksdULGWZekfxXrAhr6jprpSyhLGXQ4tG2VzTAQ30o
	XeADXZGYvd69EKI0FY5BNyR/VYDE/CqVUWwaSB8pNKwYBaqPA2YUqnXJAf/G8OdEmnwGGc4
	LB3vTQQTDCpxGXuE/f86bB4429wiU6FOlxyE12J1l6H3xGerLOaLFW2LTo1wi2aL23bmoYI
	9QShbYdMd2MdvyAzwzmMSrjPZ5g7PA7oY388wST++ptWkz2lXfzt+9O2msxocJhmV+Y8wzb
	P3eIUgj+0EAD16EKrcpp1va0Hhi2n73NJuCwyT9ixblaMCd6yp5uiO8xnOIyfZIR0SIt9E0
	YTeRbAmIDswFVk3thwqQQ77jybITDDQ2TIZJ+wgK2R7+lFr5CyPH2yEIyvA7C8rAwC8RYtR
	hbc30BfIMK0uU4V/mqv8mdXSQ17YnBwDzxnZysoxhXkz9z0zlBqgXH52sIjJHyfKuf8oko0
	nxGuLc/f43L2A3drqVq0kW8BEYj61gKTlEm1ZwNYfn1kwYrskIhiI9ZXG0R47+iWV0bqukS
	1M8c89XB3Qv0VzMcrI
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 2003C4EA94F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-106454-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The FastRPC context banks are DMA-coherent on sc8280xp platform. Mark them
as such.

This allows running AI applications on the CDSP using the Qualcomm AI
Runtime (QAIRT) SDK on the sc8280xp platform.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..480cb85b5792 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2910,18 +2910,21 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x0521 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x0522 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x0523 0x0>;
+						dma-coherent;
 					};
 				};
 			};
@@ -6029,84 +6032,98 @@ compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <1>;
 						iommus = <&apps_smmu 0x3181 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <2>;
 						iommus = <&apps_smmu 0x3182 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x3183 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x3184 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x3185 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <6>;
 						iommus = <&apps_smmu 0x3186 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <7>;
 						iommus = <&apps_smmu 0x3187 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <8>;
 						iommus = <&apps_smmu 0x3188 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@9 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <9>;
 						iommus = <&apps_smmu 0x318b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
 						iommus = <&apps_smmu 0x318b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
 						iommus = <&apps_smmu 0x318c 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <12>;
 						iommus = <&apps_smmu 0x318d 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <13>;
 						iommus = <&apps_smmu 0x318e 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <14>;
 						iommus = <&apps_smmu 0x318f 0x0420>;
+						dma-coherent;
 					};
 				};
 			};

---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260507-sc8280xp-fastrpc-dma-coherent-460cefa58dbb

Best regards,
--  
Xilin Wu <sophon@radxa.com>


