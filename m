Return-Path: <linux-arm-msm+bounces-97266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEceKCbksmnyQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:04:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF98275269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 17:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8C1832454A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8893F7886;
	Thu, 12 Mar 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqu2glHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFRlib9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A213F6607
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331016; cv=none; b=EZvsScb9+zlKDBwqDPIgz1cHeHjho0Ol1du4EN1NTP3dZVz3Xki5ESH2DGM3aCbqW7/e6WWdAo5n3jnBfoAC7uVLYL/S4KaCFfTP5J4k4hwCuMYjD9wmsnu5Sw2MSDcwVlx1/1Zut4pYfHjUh7fUY+SOIrgNT4RxNahlYQI8MUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331016; c=relaxed/simple;
	bh=QOSYTgCaUcMKAsSL/8j8RieU+DwqZrAkCE8Aj7ml/hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ekpjd200cgVAhVrpaXN+kj71KOsMZ15+lCK6uXi3PUSpU+hi2Xwf0WsAxBRBPjJ8VHKnf+nZOxZn4tGWsF6z04xFGRxH6cbWKnxW1S57u7i+TIhD0n/Rrn6fa8gYR5RQN56nrcT9Fy7o6fSH/Ckgw7lYYihmTQx6S/nwV7SqgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqu2glHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFRlib9f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAM8Gi1756601
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=; b=hqu2glHYf04RA5mr
	U2UFJH2xE7nnBbfTW7K0ICNYAoA8Md9uiqmD3lblHVF/pcQMOnD5WSktesmZ30VM
	r5abLt9fD+zkiFE84llwfB4I99egRJx22Bov48iPvbklKfrqGQ7xUgHeQUkQD1Eo
	Lq2Z/C/kizbGYbsLaLJ3F0iNNbGAWHjIMAtUHYrZRGzznpUa/ryZC5kffalkbJxr
	QQ2NCg+LnOAeljixDXmBXV4z9J25cS/OGOTtZ4amDC8iSD621Yv9Wu1cQJo6NCju
	V6dblkN/QjzeyLwCU6gK4LG0S6/UvZDlhzuJ9m3r/jyYQ4Jdvcy+oifgNx1tvas7
	b1YZnw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53jn5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:56:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b8bb5173so654937b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331013; x=1773935813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=;
        b=KFRlib9fQ839BdVh8rVwqvU+4zN9Ku37db0F9Oq7VVpEnJIidgSJI8eq5HRCduCN82
         +vO2l43045lR7CagZSKQaLBS4U3CSi9X/mDUoWiyfPNv3JVSH+YgBUUA/TnacraHlMGu
         D8wqrvJOQahZbI23/cCIhoJ9oppKcTY7BO1FLiKPxMZjR2JWdD+WnmKvOEpBUeyhmnXO
         wrcRfwexbcTcSww4d/d6QQiPn/NMMZ42UAaCsa14h7aAd/PDwmy2fuFqmv8hT6rDGLvw
         XNZxI6MAKdndrz0QCMuLOZ8Ribv7PoWWyw1OIv+NxpglXhmQP2FD3WEinPvuHShUgWwS
         DUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331013; x=1773935813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=;
        b=gpDSPmG2s8pEAEnKKeNQldQ649rCw9ftM8OzjibJoybdXIV7hss0/7GsXWaC3AiXRq
         U3YPmDh/wkfQh+tG9nGHEhUcuOC2anfjTBckiHdRt1zPZDiAAq0aHroJn5hRlEIddW/d
         /AISWNDKIiIiuiOE6HbT1O+a6pT+q4DormCIszTmJyXjZ0pflDwqkfGTJ+6T2k1rx4+8
         doL1emnstrQpDfYr04hY34kOEv70ZGAWp1GjO/A/mPvcUMYWoG6YD7gdqfGrFG4NkB/Q
         n8a11e9h7bZmDsyx4T0KISFb7CkASo67fJpW1FQuVL2xkGYpUdAbmCeGr4aJPvDQzo1b
         /GQA==
X-Gm-Message-State: AOJu0YzU+OeeS1sqJGNwSWtTrvgqO4gCM6SsS4uxF3dNRP/zppWrn4EE
	W0OVF9Ocscg+93qtauHgkHNVagL8dQLQOxuZg2v8FkvWxOagVKfdorh8sncYa1ok21DuUAoecks
	UeXtWUQfv8gksSF6Yek7hWv0GRRumFQFXBansh67kWhO4ZmSlTriH7hXgrZn3oaCb8XFc
X-Gm-Gg: ATEYQzwiNaHiwdShAoF89wFdffwjOjZE0u7XTWz191zK4xQLNzENmrw54TxMBFypq1f
	oBellyVa9Nidz6mQRwzY2fAG2+9RYbqB4MnsQ81JoOc1F+xcEWNnBMnP3QZfaf/WbonsZpUWlLu
	ahFlHyH/tyRVyDQUwhqXxTBRPI+wS5UkkMQ9JWMCwYdFJkHpSPcn7CCKd8v/w1I2GPN0eue6Byi
	pmYoAs3NmyCJrTYlGO2koecqQyyoloBj+JYmRzaLi8GxHldrhAZZy4laJyZv5JkotXjfhF4DlZ6
	d419K/1jyaeTVsEtxLytxllb+pi0IIZmcmV05yxWy0pR8SCTEzGkxQj8ORv2/0zRp6uSY3MmSSp
	2Z9B1kbGXvE2ZZFHkzr/+7vnmiJcET+3iLVmvmb02vjrmW8Vs8g==
X-Received: by 2002:a05:6a20:7345:b0:398:8dbb:d2b with SMTP id adf61e73a8af0-398c613774emr6285886637.58.1773331013182;
        Thu, 12 Mar 2026 08:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7345:b0:398:8dbb:d2b with SMTP id adf61e73a8af0-398c613774emr6285859637.58.1773331012653;
        Thu, 12 Mar 2026 08:56:52 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:56:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:36 +0530
Subject: [PATCH 2/5] dt-bindings: interrupt-controller: qcom,pdc: Document
 reg and QMP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-2-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=1350;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=QOSYTgCaUcMKAsSL/8j8RieU+DwqZrAkCE8Aj7ml/hE=;
 b=vpMHwGtb+th0Tp8dNLcy9+dpWI7h4sgUaLhyFiP3eXoPG1Bjk/hZpF6GwjeiB8dNOXp8PpvYI
 Psv4dPIRU4NCujY4h8JilSKBMXyf9TNk+hbWBS4VdI3i3b4sbvZklYa
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2e246 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w7jjODl3O23ZzICBv2cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfXwFn2bC6iVncW
 n2OSwLRYVnQxnYAJfOoy07AwsYAXbFTau7su1cmHDBq8moQvcDTkS0cb1eGrLybCvO6Fdf8frMP
 YRhRx//w8y7yUcLX9PdZzvGX81ji3bxs4pYKRxy8h4f9FS5of1p943JBC0tNHZLZmN8MpPtOC8O
 jHy3NjVgWUDZArLba1/crUrONYJhuhN3Vl3ZwlKS4bDR0H9pMNTGriyctNjmAIAvEQ01AjsAbQR
 yYfRiLlfbA7D8MSgsXCyxGha1vGVdPFjQmb+IKZwoNngE7HNHJCF9RLEAXSpJ8aory3P16yStEg
 ZGTi5FbYol5Unn2aRRa2RKR0TbB9jnsffOQb9oCc/BJpGJmD/taa4OF5heck3oVwpsmuN0HYvam
 TZC4gPF8/jJ8Po57aPz5WUfBwW50IOXQ8NZ1cn4w3j1bbXOsQ2GQ4U+9SPh5oRYSUK1Lx/IVgcd
 LYKjKJk1h/PRPPSRzhQ==
X-Proofpoint-GUID: d2ErjPR_vffXMw1w_vRIr-kAYE8FPsq4
X-Proofpoint-ORIG-GUID: d2ErjPR_vffXMw1w_vRIr-kAYE8FPsq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-97266-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4EF98275269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document PDC reg to configure pass through or secondary controller mode
for GPIO IRQs.
Document QMP handle for action concerning global resources.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 5ad68b2c6fc630fb4044c7224e6791d3bf4c2937..00eb9b28170c29c811c17b1f02f1f4f14779752f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -62,6 +62,7 @@ properties:
     items:
       - description: PDC base register region
       - description: Edge or Level config register for SPI interrupts
+      - description: PDC config for pass through or secondary IRQ mode for GPIOs
 
   '#interrupt-cells':
     const: 2
@@ -82,6 +83,10 @@ properties:
       The tuples indicates the valid mapping of valid PDC ports
       and their hwirq mapping.
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
 required:
   - compatible
   - reg

-- 
2.34.1


