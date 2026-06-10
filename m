Return-Path: <linux-arm-msm+bounces-112400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eckjOnVEKWpNTQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:03:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 002296688C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:03:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ExgKfyF/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S3qDU8FC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29283315AA15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF333F871B;
	Wed, 10 Jun 2026 11:01:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12E3FC5D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089276; cv=none; b=nq1I72DZWaDPGafpNK8ihH3u87sIhM8KBoUqM/88pL7zbhp/uN0sYsFVs3VzdcoK7L1GN24UJaPVxhLGa5VpAU77diu/4L7nZoWFpGnTG2EIibZ4XOO5Do0a0hCVeiwDDEox8Tkj7G0UzALifd0sDHUjDLTytNSIzXN/jOl9ZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089276; c=relaxed/simple;
	bh=DQeBUDvNNGZc6Uir8xeAY9ErKWDMp38iSK8aZbPCGrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DH32nrgOfeUbLIWFZbuWZkJvD5K7Nx830mZONZjf1eDK/ZmzJz0eFFVRvWI0TrQuQDAjy98/u1EQEdXzg5n914qjzLVu7ZVBz76lTV0QKKTKWbvZStVw75r1rVXjuF1FxwQ2ShVf8CvGkNtQ+sDNU6gn97/+czYAz8ugLNs2X0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExgKfyF/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3qDU8FC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hkTN530226
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=; b=ExgKfyF/B6d5N4/K
	E3elJAuK68eRJAYBJs159Bw8pCqMjyxm1M3HK4mitAuE3IJZMGSinauVYlUkwugh
	PUPIP7KI4xiQZAHMLAYWZSQDj2tC7Fivc/uR5owrhpnIRVqZJAPUB1i4u2cQfBia
	AwzaF/f6x82dCfnT435+BL2ISq647d33+7LLhljyrdkTR6T7RzZ/kfoRpIjFH8h9
	f8/Zotpp+uMdqWsr7kB7dnFF3T8bAl/c9qagTh75KWa68m4bJ612LeF5viPlY/gS
	45/j/1/CwbCYg3b7BXOnWXVGqRUZXBCGQLBO6A6hIELEC8kq0s2l2fk8iW0Izwa1
	Inc/SA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2j36a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:01:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so6501295a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781089268; x=1781694068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=;
        b=S3qDU8FCK9Plh79wtMZzuK9OtXqsFE2UAWA/CGlcfASVOKcx2F/wIBy4LWOVSCuCSj
         HL2ht8UdSvGLU/qDyt7OIDAoj5vvU8m/g62eqqWUJFUQkm+w78VBQMHikC+UAcb2lWGN
         yhT6sOXPX9+hAnB3RWHeUIiPc0BT9CLG/BlyO8+jK9o3qc0o/PyBHU8WasQuAl/QAokf
         H/6oU5+zbDlKBw0I9rYnLAEDDA8kwD5+dNwuBkGnjeeakRt9GHvghHRx6owsnH/D3Pig
         v22z6+Q1e5fWdk1gjGpuTTwJyOfCHtkB5TP+6+omGvjVDkX8b6Cy2+qlg5W2DmGfkZCP
         zf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089268; x=1781694068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV4HY9ZnY5FGjZHgR32ng40+lVhKsXil6i71ZkDu+yA=;
        b=TCC+e2PCJIpe/CZFTv+uWXJ6mMxjPoE/JbeylutSBBp52xuWHsKnLDM0jwJ0t2hfyT
         c7cev/O7y0DOwnE1EOX1OxQGcoFC5JOywIJz8i0w3yzqs8jXW9kNC8+Dz164m5o47yRM
         GTpQhoVNHicC41DCZjvS58NJYit2/RdzyWwjk6fixhqDQop2nHV21ylNOVSwf/mz5n4p
         jSBvnm3ZH9wPE+5k8BG+eELna6MTYSv5FVP2cVnJV6M+oI7Q7xDqE+ZtO9wYdENqKcOj
         q8UyaT4XALmKl0iWDh86CGiI3kLoZl4yVPbtZi5um5s1yYGQX6cRe1Y94nOuF8ioAGRA
         NMSA==
X-Gm-Message-State: AOJu0Yy/iBrPaiGylCDcg09llKz02g2cu9umlzAFblX4/rK6l9EN3u4I
	H74jpyUJtjwGPfwryJwg0WA0+//G4pKjlGo2bPhXdV2cNnyn3qLlr9s9XPBP31I7U6mCCmDMEKF
	ar4fTXi18c3DYmXFfTcGFDl/YJbxepS+M/jvmoJH2cPy2IFKl6cFpakTvHUGy8CRKJnkw
X-Gm-Gg: Acq92OFoWNd9VRoXEHcN8fkP8uwd9s3Voy9ipKUpdx475fTJ1iP1pR6AHL1fR/vR8Wb
	SyyaLbOLkE3ElV1Urf74NgfVjFjuFZmvmEdmyG8haZmLN8ftMZRvAF7ydFGlXqjIjsGgdyVlCzP
	KoZ2vT+zQYnNcTe0M8YFDJ4GHODg5P1sFJ6EnbeHixOdUPoTCI16Yv8KvO3gcNgK03to8Gox7xR
	ocW7warFQlV9i9/khvqotIWNFt8kFNfHL1bsRHXweT5To09ly/WT9SmkTr9/gGOtt3qsFSwuZDG
	SumtgiJBdnP8YtPmnO7KS7yflO0soxJKCM6dv3l2AW6hn0Jp+RsiYMeKC5LKlwMoyY/o2if0GMZ
	d6twMA4eB0fxq7IiCbVUrUhU7UQZYg5mSaGu+0Dev0wpHwnNpz2ut4EvXnWVudo463dpK1k+GT7
	OiKYmBUAqPHPUfiit6gk9CcxnJugZD75pIEKKPVRMY/410ocxYHCOAmti2OhEVvcPUjog=
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr25709380a91.14.1781089267271;
        Wed, 10 Jun 2026 04:01:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5787:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-370f0284a87mr25709301a91.14.1781089266711;
        Wed, 10 Jun 2026 04:01:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376246afe17sm3535131a91.11.2026.06.10.04.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:01:06 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:30:53 +0530
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9650_pcie_binding-v2-1-69e27a1fbf1c@oss.qualcomm.com>
References: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9650_pcie_binding-v2-0-69e27a1fbf1c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2943f4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=txNWhIGMMpap704yvqUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNCBTYWx0ZWRfX5soSkJuZMHrn
 N9sVgVz5+McnQAgEr9lfhZyOa87UJFaWpaswOrmgpoFkbaYDUsVjPRxGTvXzYfQHxQI5bVej/Ty
 JJUcWw8l9D71iocaqf7NkcSJnVlVHZozR8Mi8KmoXiQwDHeTvwOJyHhqVKvIa4Fi50Ms7beJ3SG
 KWMWCydDa/jQFvinBfijlBQTPSOIgNzhfDYx2VHOsV7q6uPWQ3UYIAcgn+DfaLHWrxPBrVqbaak
 qFxap7ZuakhQgH/kdeAu14zyuBnpPYch4K8n/OgryqnP8yN/kY9GDireLEFPFlcHOjeNX25BqUe
 No5j6rmeiDkc9T0wA1BP2dT7VhhgQBAb4Nsb3T0+uV1tawZK+cX7c3GiSZt3z4Td4ciBx7qIiE/
 dbd67UcENVSEIQBt0stVsFfdpiZCiJ0O6QNKXK+lWQ8XouurgPwosfOVvWPd/elapRiLakfW/sb
 TGAieytNakBoVDWDwYA==
X-Proofpoint-ORIG-GUID: yG-VllHqEsTI_jU2nHprnQVJamuZfukF
X-Proofpoint-GUID: yG-VllHqEsTI_jU2nHprnQVJamuZfukF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112400-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 002296688C6

Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
controller is compatible with IPQ9574 and uses it as the fallback.

While at it, make the global interrupt as required for IPQ9650.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
index 4be342cc04e1..e92acddb969e 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,pcie-ipq5332
               - qcom,pcie-ipq5424
+              - qcom,pcie-ipq9650
           - const: qcom,pcie-ipq9574
 
   reg:
@@ -82,6 +83,18 @@ required:
 
 allOf:
   - $ref: qcom,pcie-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-ipq9650
+    then:
+      properties:
+        interrupts:
+          minItems: 9
+        interrupt-names:
+          minItems: 9
 
 unevaluatedProperties: false
 

-- 
2.34.1


