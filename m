Return-Path: <linux-arm-msm+bounces-112399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sRqUCDpGKWq9TQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:10:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1D6689C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E+2teSjF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YOS+qZYW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4645731D72DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2407400DFB;
	Wed, 10 Jun 2026 11:01:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB443FC5C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089273; cv=none; b=pop6ct0FJ67NhTiJHeNxtm4RKrwP7E4fylV9ABvLqqurq24Fuh5Sp372tYTtj01M+2shsrM8oXVR6DiB7HrkFJnkVGHFBqoTAcaOHyB4StHlVgNPVhfntocgNs9hSx+gxh7143DlC3ZsjtawXHJBCN6p/FrN4Hxrfky3y0NBByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089273; c=relaxed/simple;
	bh=1CpPw2eZrHS5NhoB2KKi4APIiWeEUM8K7bQ8hFcdrf0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p6Ih5M5xwPWguHaW67oQOlhlOvMkMuG44heQd7Lpr8WRVdijcKB1VFjn8i9fp2A7lrwzqO34ujEtU6xKccB8V+232hiiDQk4682ReuXgQ4OTMw5mAZ8Pw5+JieeevnPAOAJ9eiApbHLLgzZey9IeXZf3PGIAhWmV0c3Ax3AkKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+2teSjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOS+qZYW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hubK531358
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=salhqSuItVvrpsXRu2WH6h
	IO7huOCzSeZ94qvGl+a+Q=; b=E+2teSjF6PvcAIa22AvkSPFc9rQReRAUInxKOE
	lzC3yyE01Rfk3emtFQV2rCraWUz+AG5JxQK0XZhbiaP/8poduhvgRoAYaI6MpF7Z
	dtevulTNP97N9D5REm9tgLWBsQ5N6VMwvbPnj2HAKk7Y6wF5o0E5o1unTGqHUcit
	P8QTzzVXlA4PMo2mb7JH4lzslUwQFjVZIpCZdcEb/+1beWBLnywED52e70ubUNJe
	Dr5Nv/k43PGpT+owkfgkPMrjlVRtVQiMAlK65rg675JuEKuDLP9Bv66OBHaMIN1i
	2AtcQ7cGAUoVUp9aePPP5cxVseWkyfGCzB8vN0xdEPBH6VzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh253x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso8884084a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781089263; x=1781694063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=salhqSuItVvrpsXRu2WH6hIO7huOCzSeZ94qvGl+a+Q=;
        b=YOS+qZYWEE1hf24+kq04J1Y7Apo3LUefybq36ObIU7fXMdVFu0WJCWFp2wHjxPSKUQ
         M7tvW/CZdKRIRc0Oil1mq2SWW+i8QWl9rSGojtx/ApKKxKFKp9br/rF9KWDvZ32hQKxX
         jwxqSFFKvRN5mfR3uFftikkLtDFJvf8NxcpqfvPVzOVKNL3sONX2JlCYFaj4Ekd1K/Jl
         M2ZPeiEY8Ji0W/8WDzDHvXTI8sgkq6NaZqh0ntOcwBz4cOgdbjv7Q10uPALw3V413adz
         ILrI3VQnYfkri8w7APdVAr5JhoP57YJoukveE53x9/g8Yv1Ti79BXIktarbO9PkAlu1X
         hOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089263; x=1781694063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=salhqSuItVvrpsXRu2WH6hIO7huOCzSeZ94qvGl+a+Q=;
        b=qp5aGbCmzJX8YXFLRZc2u0NSRb5mw8RCYF/jlcQjtFZnNIKDWBf7XfpCb2vIGkVJjC
         M1vD8K7eu/kpugjRu7YKfeqP7gVCA/vLc2I1bnavcR3+4ehGubRSdUu4wI6eASGds+Cb
         RVlM6scTOOdv8969+EVuUmIwr7E4cLRq9DQslx7MhgU6dKSm/g7KXWDLjcE7PAatOOb9
         19mJ6RbaRa1M6HtkUBO2kwogdOer+vk8ogtcOCvCESr6oNybrTlLmRuM5Hf44LP9XHwo
         BqKf4HwZi00DtbvtbR9Lbv/1j4dsJNr5wUlVzDuFhQ9BS6s5bncanBJjn8WDSBhbF4yq
         QbhA==
X-Gm-Message-State: AOJu0YzDqVl2CZ583ofwf1W+k4c+o9XTGE4UpcHAdCXsB92tj6NSU8kX
	Dr2cVRSt1JsA+DgKFU01f7xn+nxnDFPmIOcn3FxQY6LBRhAY7QteLrVT2/hsJCApsPn5ntnBrLa
	03kCLn5Er2Uf1jzsB1vCiu8CdX5H57brh3gSCuF4BdKcPDZ/3VkrYNRXP2X1NXaY+keBjqIDTtF
	a/
X-Gm-Gg: Acq92OGGqY+aQdkpzy+cc80i8t6JPlqZ6EOSiyatR3AU76HYoQ7SNUNA4f9S6o0dtPh
	irX7itsx+jOl0Xgj8P+EwJIh1FE1nW4bH8oevmR2+GsU9BAcHB2Kl/4XQrnVcm9c3idPJ3/rA3A
	z+KKs2qVdlIyV87XEmn9MdtX1lvQURVGH+NadG+lJgHa31AtJLt+pKkXn2IE79ZVjFfElspGSzL
	AumhvM2ygfaf4N6NEixP6FBM+Mg4ceHO/9wYcpIzZssakw7yCNa79DUDzE+LwD7WmABTNErT/VT
	kwaaLq9veXpzNCmP/fOOlB8/vkIslYfnJwaz/HUtxz2p7Cra17QWTJGTU9L7lcXii3oY7dRHxO5
	xlASgtLMWCERBHVcJoGpPbSeSRLmpXL791MztEVeJDXZkIS062XzUEcIt2JFv71JEjS1JMJHgZU
	yBQW9HibbJMVCmO3jy41kaqivVp6MNlLKk1bdKwcU30yXlCHMWXSoHaEAGu+UV5FTNq2U=
X-Received: by 2002:a17:90b:57c4:b0:36b:75:6387 with SMTP id 98e67ed59e1d1-370eea202f0mr25353020a91.8.1781089262605;
        Wed, 10 Jun 2026 04:01:02 -0700 (PDT)
X-Received: by 2002:a17:90b:57c4:b0:36b:75:6387 with SMTP id 98e67ed59e1d1-370eea202f0mr25352974a91.8.1781089262036;
        Wed, 10 Jun 2026 04:01:02 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376246afe17sm3535131a91.11.2026.06.10.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:01:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add PCIe binding for IPQ9650 and IPQ5210
Date: Wed, 10 Jun 2026 16:30:52 +0530
Message-Id: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAORDKWoC/22NQQ6DIBREr9KwLgaoUOmq92iMQaD6mwoKatoY7
 17UbTeTvGRm3oKiDWAjup0WFOwMEbxLwM4npFvlGovBJEaMMEE4oxj6QQpOql6DrWpwBlyDqb4
 KIrnkuZEoTftgn/DZbx/lwXGqX1aP29fWaCGOPnx370y33qEQhP1XzBRTnBdC8Qs3qtD87mPMh
 km9te+6LAUq13X9AXZkckPRAAAA
X-Change-ID: 20260521-ipq9650_pcie_binding-1c76095954d9
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfX6mEB00B4CVLV
 9dJO1oD5Q6s8wkJcOTG2pR2SoI0zWmtW7XqHtOGL0FrDgzp0fc67bANtiUVnTWATSNYAQxPdXV+
 mvvFYDvxDNfu67VL1DO2cN8KG3VRahWgXwdxODmwZHNdD1ym8rhzGLEZA6L5Ui+Pd4D7lJzPirB
 ChpDDNy8LDgWyQ0ivDgKQt8sDGV+ecw58dvGscb9bEfikmdAp0001YckKPd1A0QaeSsSJikQP8I
 mLIBOYYy+V53BVBKcaVk6IBbIONcGJp/Y+OkV5X2Roe5TxQm6E2/1KrFW5KQhNJiY9L2O0/2Pb0
 xjR9sBfuO0Os0zmBoWa1UWVvZa1RDp7UqZD/zqR1jECRqb05SB8I1LgespAeCzB/yH6EF+9LyQL
 4HdTq3katNTAMzuccJqqGQ3QXI2xDWXQexGnUa0lUe2ShcaXwi2vuyNV/Ld98wCct+iBr63gJUj
 iHQLe8hgvMXHxqmfGFQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2943ef cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8
 a=n0z3TVQIEMT6cdfUBsUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: cADRjs01LIiBhhA9n6Yrj9BUfHp1m7-M
X-Proofpoint-GUID: cADRjs01LIiBhhA9n6Yrj9BUfHp1m7-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112399-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83D1D6689C3

Add the IPQ9650 and IPQ5210 PCIe compatible to the IPQ9574 binding, as the
IPQ9650 and IPQ5210 controller is compatible with IPQ9574 and uses it as
the fallback.

Make the global interrupt is required for these SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Made the global interrupt as required
- Incorporated the IPQ5210 binding change into this series to avoid
  conflicts
- Link to v1: https://patch.msgid.link/20260602-ipq9650_pcie_binding-v1-1-486a535da8c5@oss.qualcomm.com

To: Bjorn Helgaas <bhelgaas@google.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (1):
      dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650 compatible

Varadarajan Narayanan (1):
      dt-bindings: PCI: qcom,pcie-ipq9574: Document the ipq5210 pcie controller

 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260521-ipq9650_pcie_binding-1c76095954d9

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


