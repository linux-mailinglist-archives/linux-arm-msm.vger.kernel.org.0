Return-Path: <linux-arm-msm+bounces-112606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3z5M7RDKmqwlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:12:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805766E6E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dRGP5AAG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pj9qhZ0v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2CFD3074924
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8453932FC;
	Thu, 11 Jun 2026 05:01:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57791383C6B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154064; cv=none; b=I8WXPhDgPo8D8aYeFsJ0F9Wnag1spX1aeZB1X7xGCOsdfgsGk1zk1WQHGuy6zszIbMeonoGV2eYH6k1OIouhMP9vhBuWIK7DrIdjmAMIsekhRWTu1Z3c/3bQwrlvm3ZHKzi8cTgRybPWnfdQ9j5gblXcOQJZBc1TzZ8xt2JF3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154064; c=relaxed/simple;
	bh=FPdfUsfn8q0zPY3BRymviftK3PmEepx18oCPwq5LtH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWxvgW0YCrFpAtb2OYFoMNxYe0Or/KClUI9EXWbxwufoxQaC0zy1KP+K610pzrcrrtDZvbUl1ZVY394W0mj15icpJs3/ayGpI58FpYCDFgDkbZVJceE0lmLe+l6N5owvjaTXC3DMGbFXu11f+DUWE3+P53Ybb10JbV0jz6LIssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRGP5AAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pj9qhZ0v; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NYY33212528
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=; b=dRGP5AAGgPsGhBGF
	phUgHR8nnx+73KmjnZT14uNYb8SBoacBaPltZN+lOV2DQbw5zEK3ZZTll1VCgcl0
	mLXXpenAKIx7D/I4thtkuIdqLYkwkDHaqROzsDXhQ+YDz/avqutABEpwNLgsDyG1
	6qZs16BM+vnUbuX1D8BMg87TUWc9+rn0kkWsrWbI2ZYD5PNXtHq3AnvE+gIDPHxz
	GjWkUyBrpUBnFu1WNmlxyBSetuQ+9TFBtRVVzhbJOeSL2KkTFf/x+wsTM9XMg91O
	RjdeeMYdt0RvjgJcZBRZlsx28NEGbyw+UIpnAnfuq2ybRholXfFh/dfLhdaNY71v
	d+auXg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701ndy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf08c2a24bso72223405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154050; x=1781758850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=;
        b=Pj9qhZ0vrLY+CQktRVR8uy+NQAemb8opHe22Rv75wEw8hgnKotefKzoM2TmSfpcX1N
         6qk/4wSXRMRRIdxH9zsiwW9jORsxEUYuVc+5Mf2duT9vxMRo8dIXJcu5s5iuWpD4wGoa
         /ovlK0KAyBoyAstELoRU8/+H8gSOhDCtVa+RRt9tMwcZXcUvN2XwN5Ipr1cxvDZLUK+9
         xCmAE2AKWrrh+R91DQuvnujJKzPOr4K0PLZO/plRmaLpVLXrkl0rXU54ZjDwrUiEJwcN
         NZ/HnvWHBacwlqJ5caqWcGeyvrwJ6Q6I0Kt2CP826hMYT4bqxwX7KsU/vVGPL3TFOj+B
         AInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154050; x=1781758850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=asIoKSdaGYNn+9bH5fpzO8aem0Ee5lVW7EfTX1oJsBU=;
        b=asj1WksFn9ABBnRGsSMEXLgZ8A5KL3hyUJ2SWeriFQtqxK/Y6dFwijxMuU5AYsBOtt
         PnI3lqYcNAmZzdAMn3pHAEPTHuOJe/86WdTYSh7x62q4PXWh4I/GdWPXo2KK40vGSIvv
         meijLk02V8ZNHT4Fl6i8sw3GEZ4lHC0BhYUB6glQx3jOSYcNnVy1Edp7DjpEAN0YDY9A
         mexf0Xi5ugG/F6kkgzdbcTIAIInOkm6xGr8klPgF2R0M2JmRx8W5U6dXLdV3X+9JSKgM
         pXpbPIeTSpg0pkvNA/dA0jxF9rnGaF72yBVJ8d/V6J3mmWCPykIpoDLE3xvqzzo2bDrD
         Vy8Q==
X-Gm-Message-State: AOJu0Yz6Xqs2ipPASeHoKL2HdHa9Qq5shN929f4dDmMBseo68IaRnPIU
	0F9l06N8sCEgsX/bgNr2thGAKAxlbzIaFTWGhCXaGs8/9DuFulqywwSM0uXjOq9rGqh5tbPpcrc
	1IhmS6nfzWWEb9v7/7wktJTSEOhNu5NawDA9rEHVak0O9uuy8CcOERPDyUnZi041GmTx5hBTWfQ
	Mu
X-Gm-Gg: Acq92OHeHN7Zcgiy4WlVq3PYW1BmH/VNAWTrU11c8sfCBV/o88YIMiUHGaRUg7lWN9W
	KtQNLTYBXG24OF29T1vds/VfNs2C001Zjg0tcKKkfUzh6OnrV2nnpRMLxjScjscFRL/69D65i3N
	bMftn9Phxs5RIdrsllP/9nNR7+n6G+tXFSw18HugLEhWTDSZGqiCg0TttDiUqdsPq4+1NpVBSkI
	kanT7MdlCPNoJ0Ee/7b0dmfFElGNZ7fCgGBcbcM3BLbLQ7+6RgkkV7BksRvEEkACeV0ns4DUxMt
	UqlfDi+fCCr1SZfleX4+YCBWOupgFKiamBdIh11ImSkgsm1qQWJylT3+PhuJUTtGvTNCpJ1RlmX
	NK3pRGwh08iL0G0ZNWwmF5ayeWy33dotMZBdQV2iAZoK6ZbmhaRWB5SXPuC1CpUuE+lc=
X-Received: by 2002:a17:902:ccc7:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2f23a04d3mr14469015ad.28.1781154049809;
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
X-Received: by 2002:a17:902:ccc7:b0:2bf:23c3:34ba with SMTP id d9443c01a7336-2c2f23a04d3mr14468565ad.28.1781154049317;
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:05 +0530
Subject: [PATCH v2 29/37] arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-29-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2280;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FPdfUsfn8q0zPY3BRymviftK3PmEepx18oCPwq5LtH0=;
 b=/lFkgaYqz7IDXrx+lsoAH5DarjM6mDXiklRFg8njNZcsrWvcqIv+fDptZTC6Tp+YWq5hnnmK8
 /px+L4jGDwjBs0z84bMTdxlIffGf/Zh8ChxMt9D4TBQfVwMcgel9WK4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ZuOtoeSEg6fcJMnl951Lui-gM_UP8Hn1
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a4102 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9EUQBBJHebFp
 RN6CwcDFlQWQm1oPBtRkXtIB+ICZg50NpE+P2NZlUN5UuJDr6hc7LEkT7GH4phzL8PUwRO3VaP0
 LAtiVPyzy/fHZZ42Qlw3N3eu27wEmOVjIFoBIIN3/RgvbKt/xsgI+VJ0Gi/Jjvyx5rSpbnnkgKs
 cjD+BHQnfq6GB96y8cl8UFiOaMefjVPFX6jN193fOFpeM2VLScnyThr4+B6t3IaNkhCCT0jykv6
 PCremdduT6wuOsFRUrQ6mAFLx9SnnU8EkadOQL5wx8NSt31DeePCnXzYMCo4oJTKpXL6n0abBNQ
 uoR7Yr0f1MLK0CeOFw/ogRevemkLXCX0hLczxz7wamCQLtfJak9rtQRhE/8bubquLw99wcs8fKg
 XZMMmOdGonUoY0AGC6GbCLI6QC2vbbb+AfRbe9Ymme0bdTZ6KMbAOxo1li5crCBn0chEnxKwdFw
 kkjYepzpy19SufoEXdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyevbdhkAcuh2
 1+l0h+oRWkGKd8393xOrDJqrXbOrCE8+V2Grd379hTp7t0kMAfrIPt4XF4vrYPHFGcTVFji884s
 PQlRlnWPLOydsm29CL+8KDKIT7UpIzg=
X-Proofpoint-ORIG-GUID: ZuOtoeSEg6fcJMnl951Lui-gM_UP8Hn1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112606-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4805766E6E9

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to pcie0_port0 and pcie1_port0, adding labels to
these nodes to allow board-level overrides, and renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 8da494de4308..f13c67e93db3 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1901,18 +1901,12 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1920,6 +1914,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2019,10 +2017,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 			pinctrl-names = "default";
@@ -2030,7 +2024,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2038,6 +2032,9 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
 			};
 		};
 

-- 
2.34.1


