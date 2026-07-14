Return-Path: <linux-arm-msm+bounces-118913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IHzhJAG+VWo3sQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:41:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7E750E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:41:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oQqS93N6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=McWGyaQq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2EE0300D68C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469D3282F3F;
	Tue, 14 Jul 2026 04:41:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8749220698
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004095; cv=none; b=N4LRQvoFenmDEWj99HYE9EOA8MFnpdj7DO/tSeqPdm7iJWGKnauN5mwAKEgzc4SEIAYcy1RCXXz9CsaFayJpWC/VBdzdHIhz3zhvbhZBxRfbgB058MsXAe4YblBp8+25VBwQ6ELlCophfFRwK1CaUGT/xjf9K7HKqZfPoySYPu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004095; c=relaxed/simple;
	bh=F5tu9JrNna/BYWpAwO56O6y/SAXx4s9KU2PbreLh9bc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aiDa8JWfn521yiIjLc7WNG1Un10mTr18hivToLuSQ83jURmv4x2rLzSJI466GIuwUtJbFjUedxVH39epaQ3RMEmo7RDx67Jyl63y4ghd/sUsXdcfGMO6+6Zt+IMDTskyhSifd3eskFkn+BKcaMhC9gw2CGC5Laj9xM4cep/FzIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQqS93N6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McWGyaQq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382xc3556545
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1hXFQ+tyOWVUdf9tznA3Fr
	IPHdtU5pi07RX1K/x5UsM=; b=oQqS93N6nhgE0C8mM+ziGVPYkZ59uP5B3YveB9
	91T7bcUTzBMnNScZiay7Tu+cezkpz0527O5TG4NFwCGgNWeGEzdCbuEMrJHH/zFK
	3yS2F7B2vq3a99aENK8sxjjUgguW2KjBMRSz3kgfJNhAuv8Pagc8Kb9HFq/3E0Ro
	QlHh4vS6K5uMa8vNHY3JiDundCuUXTFbNxnKt2uYEYOEHB8EMhtjxN1gSRj9YCm/
	7xXzOWtXCavqNjlVDN2+WJOZat37w2kZGqKp8IfBnbVyP0+85pAFsT+Wt2glPwJx
	okqBA4N6MR7KanG8gUKT9oLSFQnwKhL/SGpMql7J6+suQotQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44csydh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so73153805ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004092; x=1784608892; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1hXFQ+tyOWVUdf9tznA3FrIPHdtU5pi07RX1K/x5UsM=;
        b=McWGyaQqpuRBjoa2aNvoGj8SSNt57NbaNOM2ictxyxR4qwpSEVDKHXzlVaEhCyi5P/
         Th1dRvZP/9DOqKy66D2Jxv8KwQ00T/C3prYJfTI5YC0rQ8SyEzNcTvJ3eQxFnD470Er9
         V6qgX2nRlxL1JaWGrJjE0H9e08JVrNw6Yso0LfgMmscS5e3ijjyeBvG2KFzwTVI9/YNB
         b7bs+JwhhLiKKpA1i0VrG1QOJM0UuYntmv2hbVWldhYppG3yDxrGU4AJi0RSaN8xAIa3
         r4zfN5ELsJE7CYpwnUF4N3f+S31OHc/4Stgyn9veEokGXfolfXNv3m9UzuhIRYqppFQz
         JxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004092; x=1784608892;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1hXFQ+tyOWVUdf9tznA3FrIPHdtU5pi07RX1K/x5UsM=;
        b=lcndCjvrBXqVy0mNpKnAg4YF3zxgKZqcpQJ+iO3oCHr1V47atv5QgwrSf23wI9RDGW
         ZmJQcKlMIWEeq+VRIuEODVUAfxgGSHAT1K76Fsu9/dgRKblf+50UJ5VUjWU7w7eBmvbw
         BGaYBG6irVrxYyiuiJTWkn0TDFaOnTm8er6LsCYdnnS6EeZkWgDSofE9Q88cvKzGmn0a
         RIXFqSxWP1849whIDcaVTAAabCL+mOTe3Rx++vh8JQt54cgr7cGOJ8TfhOPuj7b0BWUK
         vWoaCovaWvwDK4nV2dwv9wjG8l3tkU2CRsUtth990JxsNVcDdGMfX0lSwPrKcMJZWMh+
         /WAw==
X-Gm-Message-State: AOJu0YzPSHyAz7dRmZDJJqnW19RhFWFjIJNHLJ4bzkCD9iXpS5Y8VqXd
	1ugH17HkNaMNB5q7vPsV28DsBbgAC+T0W+xzFi5D2Smeuq0dD9gxlPrKMMu5OS45rW9jkQ4IvaX
	ExS/Uq809wuMuTFywdDe7PHw7e6VMevwHLsRU5vTB2qeZ12J4+FLbaff2r2zE1W24WydG
X-Gm-Gg: AfdE7clRbDP1WM11QgJAv8xTYvhd1SR62ZeMfYNDXgIEDOc87OVAXRwZN3UCRfXVgKZ
	mbbWmAvjq4dWVCylmw3SedBth+yxs5Y/3b4mTjtn1UVJzZJWhz7Y51hDsH681nNWh4M1ro9SaPU
	vB3XOGZ2e5F5MAhrOXTEiakaD+fL0E9tYhRlSYWCeib4EuMdcPe4ehmgNZuHVWjKCP5FjNkKROB
	gLyMY1vcpbwF/vbD3udNemldPzHexfKqKZyr5XsPuLb1a7wRxEmFxT0xk13UhVEoANaCWTzwAZJ
	8HHXWfy6W0soJkZxfEZBbAsUztres/iCN8wglEiZFBHzLHjI08QorcGzQASBXdkrYuWzMmjeLJ0
	Q1ZPCi9RNimvBt+znVBen3aQ+v7WyZPSdMs8AxfCNQY/0fhIg8vgqKVPBHBSai1bnB10T00uv+/
	HwmPJ8YxHgZhjigMR8mGTJOo44AsxoW3tcNjo/uKiZMFTapw==
X-Received: by 2002:a05:6a21:1b81:b0:3bd:394d:addd with SMTP id adf61e73a8af0-3c35741cee1mr972225637.33.1784004092460;
        Mon, 13 Jul 2026 21:41:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b81:b0:3bd:394d:addd with SMTP id adf61e73a8af0-3c35741cee1mr972180637.33.1784004091926;
        Mon, 13 Jul 2026 21:41:31 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/5] Switch PCIe node to new style of bindings for Qualcomm
 IPQ SoCs
Date: Tue, 14 Jul 2026 10:11:19 +0530
Message-Id: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+9VWoC/yXMWwqDMBCF4a3IPDcQI1XoVqQEjSd2Cp1I4qUg7
 r2pPn5wzr9TQmQkehQ7RaycOEhGeSvIvToZoXjIJqNNrWtj1OQY9hNW2DlYwWZ7loFlVM1ddz5
 PtK8ayvcpwvP3TLfPy2np33Dzv0fH8QPpooW1fAAAAA==
X-Change-ID: 20260622-pcie_move_to_new_binding-750af0620f37
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: aWavEIGBW6H5xUxte0eDUcRi3h-g1oMY
X-Proofpoint-ORIG-GUID: aWavEIGBW6H5xUxte0eDUcRi3h-g1oMY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfXy++kHto/uQTW
 mT+5O0iFf6H+kK7WGTCcMpvK4hZoU4TNeuQ6B8yQt27hi0GqiqTlRt4gK1gux39NpfrwU2oOvoB
 XT6wX8X/lxpRLajT9iJlGKapQddkn90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX5l/3c9UkksHc
 4eC8ap13OyqSM6RN3v1WLk9DvuwBZnjqKh32zpfQ2p75ELJ7bmls9Y/YguV56UU4M8e/xRTnHMD
 BjCMiNchWP7vKyYSqioG9PhN8za9DgjAj78Zw8Cm1oyv6vkStc+AU52QroOy1vaBenX68u4JEyH
 61u6T6Mvt7FL8TWmih9jau69fSrHq67XmpuqppvY6jyVNdPzccpGVeQBJ7TToqceg6NHJPlVfbW
 5MkxNR+RLhOgLCvPtVkPFJhNL0deklJDXPVkHf+ntf7e4AGM6GEMqWg4He8e4eWxK2khNQmnA1P
 P3sbQKn18Xy2dSkCiDvxwiMVt8KzRBFHLH/n6zrvkG4XIQ025qSnNMP9WutoBGJg7fTNHnVfcby
 Qu1BJnjTtlhgWlnGdb8cdMj3J20LXCLMNG1Ul2qHHvY7NpPjBrlbCQBcIYST4HM7aeogdiHOof5
 wuVvHMwbyoX1HhMAmXA==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55bdfd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KChmRlnxpG4Vddxeym0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140045
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
	TAGGED_FROM(0.00)[bounces-118913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6C7E750E9C

To align with the new style of bindings, move the phys and PERST# to the
root port node. IPQ9574 is the only SoC which did not have a root port
node yet; the other three SoCs (IPQ8074, IPQ6018, IPQ5018) already had
the port sub-node but still kept phys and PERST# on the host bridge.

In addition to this, enable the PCIe support on IPQ9574's RDP454 to
enable the Wi-Fi support.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (5):
      arm64: dts: qcom: ipq8074: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq6018: move PCIe phys to port node
      arm64: dts: qcom: ipq5018: move PCIe phys and PERST# to port node
      arm64: dts: qcom: ipq9574: Add PCIe bridge node
      arm64: dts: qcom: ipq9574: enable the PCIe support on RDP454

 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  8 ++-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 12 ++--
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  5 +-
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts          | 10 ++-
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi         | 10 ++-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 14 ++--
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi | 33 +++++----
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        | 80 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 56 ++++++++++++---
 9 files changed, 183 insertions(+), 45 deletions(-)
---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260622-pcie_move_to_new_binding-750af0620f37

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


