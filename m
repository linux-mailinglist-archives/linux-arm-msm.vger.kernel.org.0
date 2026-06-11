Return-Path: <linux-arm-msm+bounces-112598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cJ6BIIdEKmrTlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:15:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4766E748
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:15:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jlWrgTvI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=brpy805x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5CA532699DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35885388898;
	Thu, 11 Jun 2026 05:00:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B813839AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154034; cv=none; b=ZkQatTuxyuNUMyoPxlbO9f1TgwfJFyzuSwqd1bfNGjoGhd3ySbLCu1YqVGnUxYBQ22POINa2uhvPFwywgeLJfrYn80+Wi+bDXofKzOYqAh4r7bFpaTXr18VZkRLXfbRfV6trLN7oj+HkB8/O+AgSdIUpIdZ6/zo+2iKAW+GEvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154034; c=relaxed/simple;
	bh=400bzk0D1iSP/BJoYEZl0weep9VQmIgy1oL2FUVxJGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mL6Cra4H/DMQaVAi3Y8LHG8fM4//b2i9APmFxiaKdc6WDo1xG6drvgsfAUUPOCmc3CVm9tsqhtNywPXFeJTBCYzV2sK0rdojaeoCjTScRkR7TxY8UqqhTuTtSC69p7faFFB++2S7dt3FGRhbPlC7l0h6qEuTwhCPPB6m52DuX1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlWrgTvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brpy805x; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NhiZ3183781
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=; b=jlWrgTvIIYjyCBLA
	k7pj/wOYaDfBSmOXcdiVVtkce9oG+kkHiZrIM982/xRWf2opPWISWFwuH9E0R6XW
	dFQc1lbxSF+JjhXCBzehx56V00yuGO0HYiX/DMKp+FIv94p79dXtVp6BLWXxdif3
	YENzDsrUIgLAzVz5uuKrAFVUehXSLgeQwTYVWArzEWPTlpTzinK03ORifEZ1hNfl
	4EJSJrMh8uDiSYNAhEQYaFtOAoF0c5NBashieozqRPk0CHMhMRIYGTkPbAOXASx3
	dALe19y4J5/1F3kt8KYCk1HqJVy/j15ITagvChDw5i7RhPTgSBph5AtrrokhO/4Y
	Nyeuig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:00:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a81c1738so43725235ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154020; x=1781758820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=;
        b=brpy805xpfaF/Fo55FRmHOlpm/pqZUy5+JWgxFvfopPIUTFyhnAS9iSo5JszgRYHeW
         q0x7zekU5RW+1CrNyen836YW0vi4ipTFOQHLZIZCrci8a7nLn/VMmJewHrmRZCQbYg9f
         OOw7G+43xzdsCRjg7oczIeiHea3j+XwDJ1h4mWTzJJngAGDqhUCuChDxkbCC2uGnzd/l
         v4lJXF5/FR3BNMysZCSpzexfYjJc23YTuJ7QHwekM/1QiPRpb/bNxAF9mhKqqgAbVKXF
         O2ctdD3eaSa8qTqQeQextEDj5lrkgrHLjjmUbzB1yjgJPtgl2GRkWn/qGVBZEK0/abR4
         /ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154020; x=1781758820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZGceFhAxol7QBy3EzN4HqW+SsrBKEgHz1ybQXbHhOrg=;
        b=XVC0BfBL9e4gWT8EefQYr3q9ybapIN8ZPiruI4G1GnWMRZfWwMkDTmzANqucSoX9DJ
         vSwfJjZQjZ7YN2IT2XThBBkB35rplacyakd8uPjyEUqb0Wz3iJeTxoTZmnvGRfAJd2xN
         l+dLsLiyjgJg+Zx5ct1IDufmjesi5oRsMPkAe1+gEt0PBo43EuL3+ys8c8fBQ5zhoJ/d
         GXyuyL8ZEr9VMwmp0rHFy0CXMtbf10vc4kT3bB+p6pZN99Z0Q9zzkT7c/BnvU4qPMFY/
         v7hirOnTyWPiKMKQK3fNJ6XEWijRFsYaNywrxObMRh/5rs/thZoCAUOZlSVJAh8DD0Td
         fu8A==
X-Gm-Message-State: AOJu0Yzw6XHTHwz16qEgXy2BcQJv693Ww3+Ciz0gFVwpF25Nepy5wTR6
	JUvfdWKVsCkotwuG3w88R0Xy6QCcOmC22VDO9AmmZhBkx0YbKC58IBLdqLX7UZB1CUk2PPg6OcC
	3QBojfy6XedVErh2KOXzMhOeu0PrgceAtVYgsGlptl6WlWn35YY+PhR85rYclsCGxDGCUl3Ggxr
	uX
X-Gm-Gg: Acq92OGKwY2yM1dKr1GcpNYUBD1H0eJfjXnWI6ourIQpOp6K+dYwOh1eux57hRzETu9
	wpgmEc3eLHA3Y56aiTV5cio7zba0P4+AM2Cm0KdZ3HkuDHHf0xA+a4ZoJVh6BfKwsVxaD1WVFOW
	zFLAoOeq0dH3/MTLyy31nQ2VsFV7KTNGN+j9LSTPeFB1vdLLmYOGDLgd2bNZlV1cTyGkZSoxoqL
	8icVzdQvDlS1xI3Af1OkoTHep1juUSqrpfYCn8hcgvoAjozhfByhNh5X5d7jd8aqfw8pVgfERPT
	aV+xVxl0IpcmLiRxiDVcuazM8ol5HRP/bOIvKXUnEt1uEDgTkmcjXfSG8NxkV9rYEz7UiVVrdWp
	VuEtc+NkW3ULaILjJaBylZFUyDrno5AFgb/9pomc5CxYW2Fm9DobydGGszz94OeajXZQ=
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr13374005ad.7.1781154019998;
        Wed, 10 Jun 2026 22:00:19 -0700 (PDT)
X-Received: by 2002:a17:902:cec5:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c2f005e44bmr13368885ad.7.1781154014627;
        Wed, 10 Jun 2026 22:00:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:14 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:56 +0530
Subject: [PATCH v2 20/37] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-20-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=400bzk0D1iSP/BJoYEZl0weep9VQmIgy1oL2FUVxJGo=;
 b=nZmPd4dZyg7DtClHayJpkkig3rV6BVsKwTQyoD672u7U0ZVxhKir4lSvnM+526RqIPX1yeduQ
 2JvZH0l2EAMC8rzRjWbjNGn/8eXM79lbMvSSqoQwK9MxYewumvqZjGu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Ezs0HPyq6fXc4IFO7LucYbjlvU92z-Sw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3s0SU4+iETlj
 QwY5QBZUt7qFeyzUAmvnVqlbiCLFwIIW5QuLYKR8DCQbuVWJvusTvVI3Bl9MFgA4pQn6KHQf6yK
 FZRAWL21QeOhnxop9wHu0ICp11Vu2gc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/+ng5kzmVDZq
 9AF2QuPecPZ/EMI7R5DeY+nk5PSXPQIMYREXfb+pYlXQwLcPf3PG7zdnPmJa1i7YgKBgSYvhG5C
 /pBdZMEyFKhbh/rzzrrG5AcI9sJqCdvu1jQz90xb+45xvrFGvtd6wK2451NzFLY0DZfSqWSCRRo
 ANrAvAMV8AyHa38Vu7/6/NePg8PP/qJZr/Z02SpH45pEvJ/0o+zQuga3ns9Q+ZKRgdqCQnmKIKf
 Nl24c/q+36TLdW17d95whzCQzcvdzaLMG6ygc3JG1Q3IHHmXOFYqLF9KWTMf+xRlEgRpziBmDSW
 x2WGK5Ss2wkOPbUbmNYtV8AQV+1kif6GxxSLn+RF2qedXz1OnS86rA7HH5PYB5G9U/X4Cu0gUyS
 4O3qHF+9CGONEfZnhGm9TbgeulGF0EAyrGBObbu2XgSzJ18kv6Ix4yQDe0z0H25lsYYzGkG6nbk
 BouNJzArj1h+WugVviQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=w5YLtpWUZy_VJOv5-54A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Ezs0HPyq6fXc4IFO7LucYbjlvU92z-Sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112598-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12B4766E748

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index d41b5c470c48..53e718474db6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,9 +967,8 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -979,6 +976,9 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1


