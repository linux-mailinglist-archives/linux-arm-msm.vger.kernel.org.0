Return-Path: <linux-arm-msm+bounces-118718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bi6ZMFa9VGqZqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0B749C79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DoWx5vEC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RDRMlWkD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118718-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118718-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBBF23030D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF523E92BD;
	Mon, 13 Jul 2026 10:26:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B63E8695
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938370; cv=none; b=JO9duppWbeW3N6nBQhxPOO7xAeDcuxEpHlfyFZovqnWsEl7Ti0RVrINtsCWglbDAmNJWfCx8uqiMMQfgJeGxJ1+GCCFdDQFo4JHbXO95mJYWaL60yNM7S7/7RTs7kpuoVMadRjpPKOo9GGoTZyS0T68BHceWuVPWOtxlbG73TCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938370; c=relaxed/simple;
	bh=COtlV2miqSmmuYhN319FIilNNO19z5IJ+7+0E1txUrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBGLtjeBTl0DTHVv/WkHOWo54u82e0BFQbusncViDY+pP8UTRb1fQ9Uhnb0XwA9NFcDJ2iZooMImQNEzGAadw52HP/koKPver5cG/lkHHlJDv5PbswssOXN5SfLD53l6c7v9A/TRPOLy7P8sB5SfqnqOHCV342scsSLYUQO9pyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoWx5vEC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDRMlWkD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Ntsx507388
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=; b=DoWx5vECsak2IS6H
	PGr6Z/YvmXe52ZW2LiHgiignkTJ+cUutDXfpRQTNYLVR0C99bXew9Z1ONfMXyeOa
	tXLbOAfL/uOt1X2naOayPOS+Q3hWoFIG5xjRWyVixbIoQQ23hTLfRNdLOwrgLNzr
	KzMojAXECEAfETt2jRhMbGxPJyXYPKVAR9/+Ilo08uPw3H/onTZ1FxyD5vytwOyl
	m1hAk9XIaUziyjrITutnN3WqmRBJQiA8yY/+DC5eqMXPfP9V59MGQNa8KlvgUScr
	lHfaAP+mB/rIBlrBR0m5arqzs8Gq4cH8vxgAVLLPzzCQ8/BpKMcuxjVT8DUVl8T8
	iZq14g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h1nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3958030a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938368; x=1784543168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=;
        b=RDRMlWkDAws7XCoYeodMlXL6aBN62YWpPesnaXTy1yDHfiaTVJKJTQiIWNE8ngCDyj
         s/Zmlde3JwFq7lni2yujgjqIj+k5PCJYQg7eGQvKnK3biYUkg1LI+XNPg5qnOSQx0m5J
         EiNF1aY8Y/XATnMrXtZAx6t5C8IdK9z7E04EPJoprQp4w9Gmv3++vf8ZLsqaEx7vpRVF
         3YQjMMMj7vzR92VKUjmPu+UYfLyVxPDzSjmcV3qUuj4/4xkUCDH+nDMi7Xr0lEm7M9NO
         Nu0d2c36t76ituN/EKH5RAZfg8Jh3Y4cZzOuratQ3Gr1Q29cE6GDCRUmUIwU50P2GZ2s
         9I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938368; x=1784543168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSHGhSij0Rn5kLkHGE141HylavKbteP3eeIPUCl1dYM=;
        b=YxrHsWByDNDdFWRqVbVgGVM4PeoHoaMcA87kc2spEN6Pytb4z261A6U1fNFUY0G4k6
         w42e8PHYUVRe9Q+OPIlBgjT0wP3BPoG2t3Y4V3bsWSl0boOhwlzg7YXVFfFXCq9bZAav
         K8+eN/z3oAtrnkp3NuyJHyUZvG/Cc2/KXhxSYEwHuf8DrouN565Ohl+4FLK6n6Q+SDfM
         fvbkvVymrsKARFcYopPjpWrJu0RBRKY7CmZrzxVXuSKBtDnXM1kVH+0unZTu33L1RCf7
         u4gfuAeTMXa0ZuXiS1E5BdkElq/4gLhDdY4C4emyEc192KsxamFEoqCqneIkKGBGV3OB
         O7nw==
X-Gm-Message-State: AOJu0YzfcaBpRclOKrcfs6V9iTo/DgMsw3UeJ7vlhoGxb6hvtsMC8LRE
	mObj+VScOzi+qqeGf8+m2rpDPjYLjn+/Izgh6aCI1VDJGcXuHDnl9SwVfszC6Ap15l+aBcimgVf
	dHeZt8RL9t59Ut6bszlVXBmIWbv/OPaiYwOcZIhAWian49iaLz+iEi9eJiHTdaMRKX5q3
X-Gm-Gg: AfdE7cnYz2Gd+6hL3N8TeXtLAuWGuRssq469017c33kS7hU3ccWUJNJA4j3+xY0+wtj
	FHLF8/iQC81RTF52WGCAdYJgDJD7+jcxLRqPr3TwqgJmFTS03hsgH50Y9O1YvEyQauk3rgoCrbV
	XGGu1EXkIvdz1pXj9xy8ljL7ZhVQNRNRcK+FQN6OybLdH5lOsgfefAtr4/hPyWFu1IiIu9rTyEW
	1dZDGpw4TtIyfqTXyfJUCEmx3jGLQh6kfNJUIstuxx4//KpAY1VybYabNtQDb2/rFmhnuqMNQQ5
	WB4U1yMdx+T/TOMl2VLf4BnLCra8dZMl0ADvVRwuWIH3ShWbRjby2YyLqnzIFTIsTvkF6jixk8D
	zE/zxWBwQnxc9RJYtNKocsKD87E/rklAqk86TSHwT
X-Received: by 2002:a05:6a20:734a:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3c110160ca0mr9007119637.24.1783938368077;
        Mon, 13 Jul 2026 03:26:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:734a:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3c110160ca0mr9007097637.24.1783938367637;
        Mon, 13 Jul 2026 03:26:07 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:07 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:41 +0530
Subject: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=1210;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=COtlV2miqSmmuYhN319FIilNNO19z5IJ+7+0E1txUrA=;
 b=6t7jhm0HMzkfGytAtFrNqMVZJWIuA0ebRB7sryxlujGphaPD/vNnR+BaWhRgY4GnTTtYWPqta
 I/d0wZ2XUcODBeD9nhM58bxH1cq6mWrMGGhpRvkZqlyvTfhepE5uqB9
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-GUID: NHyH2BvrUDY3uPxWX12V9oO0Zjd333SD
X-Proofpoint-ORIG-GUID: NHyH2BvrUDY3uPxWX12V9oO0Zjd333SD
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54bd40 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vgDixf3xU3NtsmyF1-EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9nR2vbCj5V8b
 FmfLrBhEgPR/Zk6sWCqAU8ZQEfZRwZZZ6vp1p2BrPYba2zCeVGZensvKkPjZJVlpOt5lJnN0ZtT
 FFMKBzTIBzO9SelgxExEHvkwnccZAFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXxyDtCCHydY/k
 UFGvicpxZw4DLAjI251er1kIHkMpFyBQwl98UVE242zL9HyJRzkWYlVV1gGFdrUnyHqfiSyEjmD
 ODdPgUqPh1vvd9mq38ql+fGecVYCaLYke4pvlGL9Exbcwwu07KD0YaBxuBjj3TXMmG7EZ1+HGJ+
 yjorAp1cRE176NwqtizTTnlIFE0AAlNH2CyrwBgR/lavIYl0+LGxrOdAib0cUIVPMIyEzMxFjFx
 iDwjci0oQLh1p/dEqp7H+H/PUjrWfsa5qqltUnvse8zSC5ktH4hvUf6fx1ztVqi//Kg0ZwHUstr
 zZegScTL5Wz//O0GfhIfRHPyUzZAkuFEBQVgnIbhBDslcSI/1/cnC3X/EUcvCNqRvr3aoMQZJxd
 7QJEytvVuyl6YlpKfIM9CQruyCGnZ6hSz+/l/xspca5bnQLDnBY0bodtKnZCYqgo7bv6fFgp4Hd
 czxWt9KZMZNinXsU2tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37D0B749C79

Remove #power-domain-cells property and add power-domains property for
MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
@@ -68,8 +68,8 @@ properties:
         - description: MPM pin number
         - description: GIC SPI number for the MPM pin
 
-  '#power-domain-cells':
-    const: 0
+  power-domains:
+    maxItems: 1
 
 required:
   - compatible
@@ -113,6 +113,6 @@ examples:
                                <24 79>,
                                <86 183>,
                                <91 260>;
-            #power-domain-cells = <0>;
+            power-domains = <&cluster_pd>;
         };
     };

-- 
2.34.1


