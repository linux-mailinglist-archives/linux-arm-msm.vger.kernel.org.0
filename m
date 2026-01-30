Return-Path: <linux-arm-msm+bounces-91271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ52BqiLfGnuNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:44:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AD80DB974B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 066283004634
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1303D377564;
	Fri, 30 Jan 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="evFskupP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnyKxjWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297D36A025
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769893; cv=none; b=QgboiQZtDPH1JDcS2KAxlkkEY24d8mNb+ZEzZflkPryRcZqEoVEWKlKWyB8VwXcL/pWpxk/kyvMntQ5DsegXRGjo+SU1HeKRV4DejsHQ0xbGetvsLdCQxh2iSrU8BJu9PErZSfPS9nHFLT7xKqhU2VL3n6vfRP+wTGLDIqxJcR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769893; c=relaxed/simple;
	bh=gXjLhnZi59oOsbpgrLnWCxeacGmYdwxDOwfKkKznY38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG+sq5DsG+M8KUCjJDc3qaaN9f2NDIq4H4W3sblbVHNhMESdhjKxn/CpyrIh/B8qWLqJaDp6OkzgljfzjHLrpaSyH6WV0CnfJTgNAuH5VHpZabgPyyFV7S9nDG4LYH3gteRM6/N+IZOHE/AQ9cu22D0ZiHi4avlncP+mYQVtsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evFskupP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnyKxjWj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7GTUG2414441
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=; b=evFskupP39VRPEPS
	Mzu4RA90HWXBPF0o6MOSymnz0Uo9GSUeaI2GuZKZ4OFR8xoFXKojdC2SPWCav+4m
	1M9fJVT6Eh09gAyk4dEWKqz0GMXJEgGtu9CS6DFbD7a1XXbcVg65pIWSo/wrOjrF
	I7/sTZJS3pi/XrSB+0obl1rN4Pm9p3ngjrjSS+GxDg+vQGw96WsR6+8WBWClDGKQ
	RYWd8ZRrVEp851oBoaSceibtydd4Z+IwdscL+c/bLIvU4K1jSjzDOUgwykIOLM8A
	kPktfJiSlBxmGFn+JbpEZ/ovWCiMZJW2hLh9Vvm9BHoHjahMoBup2yNCJ7j16LY5
	FpvQqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41gma0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1440374a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769888; x=1770374688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=;
        b=LnyKxjWjh9iC5OC2949W1p4DF4sIHH7H7thiAJac14uMwwEcI1qZSeN4ktUt6YN0D8
         2clcNJkAXOiZ+iJsOU262clkZnOiiyeG3C2ize+pE0Oujnd7RFUA6roWLeWkT3JYC7EM
         AZojkCktiiMBgLjqnK4nOI/pPjr2NrHNhzTzWa9+MZMa4xUOJJXyGylSQ5NbSc2yGJm9
         pOYkSzUFlN2F4tkXAN/4bBU9p/ISZAKqZFSNmGjTtI1+56NgUWv8/6AicVeGh1InU+uC
         dPcfe+ac1RTAfm3nqlZ49wQYJzbJ7OfdR8obxjN9UyMxc+xESkV/o+k1WtkeLUi1MoCv
         GOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769888; x=1770374688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PUD22ade3PdMTmII8Q4XbTg9RtosH4P7yKCZg5lJof8=;
        b=ZGHqIG/LHprHrN5JKDpMWm2XxodhSVbkIwwzQAuAmJsS5sqnCjOK7Q3i3O0Kw7iy65
         SaLtC8OU/cs2wxXTLMPsV+nVUqzbeBCVM6JydVDofX3Y2DVOD+FHT6rhCs+cxDgNg+g0
         wnRD+B0OW0yCFTWvamghe5E7S49UliTd0MJJcacJFbt7N4FdLS00AhSHCtRunlla5Mmx
         MdtKguUI/KFquQnsvjs2hjuSNWNznDQqsjpbmXbB+yLXqaOW5riG9/jttWuPXivXS1I5
         L2WY4jTX+xnmWRWc+3PB4xeber4Ub8NCqagMvi1Xh0KrQdJoMCorSBtcgr57d3HtPm+O
         xYOg==
X-Gm-Message-State: AOJu0YwgY1/kAKZMJdpVshlybGovdwepCgyL1f3EjCpza2j9l8qhXa4o
	h8YKi1dPPEbE9OAdWZdkc97cmJckFKFfXA0moEWgxUZpdJjFm6jlaPuwNUW3qld4rdIX4YOaryG
	EsERkQNkQeozJte6+o2qCGhyq2kNdtWEy7S1il4R+bea7SNTgL1/ScPJxb0gW6f6VyrBR
X-Gm-Gg: AZuq6aIXTS74BWSFe+S8KszE3zTe56iWzkGg3bxlCb5rAnm3xidBWQIpZBwUrD9+qx2
	1UQU4LtsiymatBRIrpeTTY7jOuuFbYsmKw5d3A6Rq2+SdGXyS3CQ2jfhnEbqX43L213cq+yY1Db
	3hnWPaXEe7cqABim7D8ukLcCGhQKcet7HwLBfgE3PfYJsMop46usJRJzsXDT2E6RHH165V2l4vO
	x2TUs25wVjHlYPzFdxXXhhUazNNjPn48MNwUSCZoFLWFGPYcnmvdjNWJUv+eYAJ9bOzguQ5AUo8
	AL1+wHP1RoeGSsJ+JdtF1MmANn4O50tc60jpJOeuMIV6flGCyfxriMU/wGepK0FeyK0qIzUbFZ/
	Ge2XwDgjkmAaAU+tjRzjgRYLlIo8qgW2f297VXEP1/M6JzTpa2UIIZ68PNze7K8c02K3Q1XdoY5
	dTCzQCegkrUdrKfUlpRiuoeR5baUeitJHn9IKwixyxy+jt
X-Received: by 2002:a05:6a21:7906:b0:392:e5eb:f04 with SMTP id adf61e73a8af0-392e5eb12f3mr1673100637.72.1769769887759;
        Fri, 30 Jan 2026 02:44:47 -0800 (PST)
X-Received: by 2002:a05:6a21:7906:b0:392:e5eb:f04 with SMTP id adf61e73a8af0-392e5eb12f3mr1673074637.72.1769769887303;
        Fri, 30 Jan 2026 02:44:47 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:46 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:31 +0530
Subject: [PATCH v6 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-2-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1507;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gXjLhnZi59oOsbpgrLnWCxeacGmYdwxDOwfKkKznY38=;
 b=iyCnNzRbBhnBPvMnE4k7TYWY2XLp7FU3ecZLTl2matj+diTY05JLq+kQ9oHgrsuZJ7P1YpPsi
 /7qqukJLPccCZvmDd9+IJ9XY38LrA4VeXr0xQ7i38XGWjcEbN1O8Kz5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: p91rmnST6lzsmfrBKf_uaPVUP_S7ijV_
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697c8ba1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: p91rmnST6lzsmfrBKf_uaPVUP_S7ijV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX4rxAeZfyl/Sa
 UQ/XZrzfxtNw7iFZ1hpaey1zpf13PaWLtxPix5c4YeUhupVVF8zZUD/73Lo5iHEOoOeHVkAQXGl
 g8cRbYMf/AnQ3uZwtvPOIBwiLFUSTu0a8KefMyM690lcowjvlFxkx0bMgSE7uKCNdpUDtKcINkK
 hAU6H0ohAyyZBkkbiBpcNBdnhQeu7Kzzi63u+AAsRpr/4eU46t08V4vW2tNJNtSPWe6bqasTnIN
 tyUyq0IHtjzHP3D0IYCPNfSyrqLB5Jt3zxDH7jTEpvWbnY4/L5aGa7kmxkCHu1frSW+eyg6Ov91
 o77jNizGQ4goVirvNizeF8qS2M7fJoCJibJW+ex1C4N1KDSOU+A/m+GtyxqS9FZqxz1C949Cqw7
 bKkJwoGdfI1+pppdQuJNqdjtvxrRNd0WIwuQsnfrlv+2xga+yk4r1NvK1vk0dICZV1QPjHA6eeT
 VN22otMy5X2KGPnCcuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91271-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,8a00000:email,7d000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD80DB974B
X-Rspamd-Action: no action

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	- move to mmio-sram and drop the Konrad's R-b tag
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728f0b2fc8cd93c849f8c170d76e312..90790f99f0597b63801d4e07b9b72cd372ad46d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -697,6 +697,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "mmio-sram";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1


