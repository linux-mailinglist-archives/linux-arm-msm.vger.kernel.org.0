Return-Path: <linux-arm-msm+bounces-118593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tATCL4zTU2pgfQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 19:49:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676A745870
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 19:49:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bPHzvXwW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NX/Lygjt";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D2D1300D156
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34581365A02;
	Sun, 12 Jul 2026 17:48:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D630E0EE
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783878532; cv=none; b=Jptj5pk0FwWhfIElzkKxLSUC38UWJR4lWMljTlE79wF2k1W/byoE09VUcHROlw5o4zhQJaqle4gyNrrP+emUdegv5lFkpiMrK0ego9hjx6sohyt3kk7xDWuTWkWtXkLLjmrRp8iDSBdcEJb8zERKvLO8f0inVvaWi3CwhCxa7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783878532; c=relaxed/simple;
	bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rw2i2s7C3dbwsPKyGjA7FWhuY6nceURkrtmPKyK6pr85TdnHiYcj24gN3GQVZPhpdTHwqsHArZSlUkEUXPoPMIe+Gs3xIyM7gZlBJJ+w7zb5pXaEg8KA9Poa/S7yFnQBO91+E1+9pDi3UG9nPgV2hTD4dZ5qWPF4iCnsKJHZD1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPHzvXwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX/Lygjt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CHfkqL3274703
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uLI6dtiwQ0bBLx8SDV3mto
	Bn+506m8hldEGF6Ztdkm0=; b=bPHzvXwWiaAKVPDv4ta2X8s+7mZHmGqHl1mNAW
	sNuFOsZt6vXR5ArVIUJGgLE/npraVV56Puf0N5SahII4H61d+Hivg7w9Z8lYYzHp
	kwO1OIkhVGTwxK8K5Cze9irDIoVpFjnIU3RlUosxEL56+8TQjnRQldu9SakfIOP5
	rwFLAfU/gLdpj7miQUeJMwqqkiirpdDDIeZI+ymrx+nmacoYC3xjAhK5mDvt8mJK
	wJu62x7NmW2gSPJweNaPeAnhvEII2T/Br0PXPH+A2AGHRFMyLW1FidB+QQqiMiew
	iypx92G7eB+nh0TkZf2UCx8L3aHRDiSGRHPt1jHKVWi5RR1A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hk9pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 17:48:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3400612a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783878529; x=1784483329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=NX/LygjtITSMRU8iAYCDoXIaCR3VoyfLMBP7R5SlpZtJBoUUnVoXX2sEcvegZBn0G/
         ixzfPj1Z4ZevW455Q9wrqVNgAmTFqpOiAQPES7OK8/MYaEXW6hFcRQLM8anF3V4eodE/
         fCHkRN2cuWkIXmHYBz36NXmuV0KX2KU82LfKC0+vx+LSciq2SZpVhYvuAy2gWcvWzrFe
         nDbTLR5RDHJ7HNhJRqroZRlVkprez/9McBLKpQSB9WfGpFAdWTOl8iZgPXBVTOENxB6W
         KQi+vF4ewQC6kRK1P5ZysC5N+YyrTiXDf5ayg5aVZmpjkJv3MUZlnpUx89xO6wU+fpZ+
         6eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783878529; x=1784483329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uLI6dtiwQ0bBLx8SDV3mtoBn+506m8hldEGF6Ztdkm0=;
        b=D8KnvUKsoap2s/1C/KhmiZwzf4zvQ9f6Uw5/w2rng6sY1qljfUvFHNJwzqZyCi09DQ
         lWIIAQnZoS/HQ/Qd9huPA2PxDKnvhD3rtwDPbiaY9GCqbC6zDSlb9EveLNG1feFKOReH
         /x7ZLIB7+MrH009EkWxGxj9WQ4YbbTM9FmHagt4YxIWmvk3uJPIBeqWiRLxQdsaCKU6p
         BZdCAcVEUgjKG6pcixTLQAnRAweSnH/xs5MZl+kdwA4zbq4xc8TXYIgQA4OtAAauPBNQ
         iXwNFQ7F0GS2YjSB2Df12TvW3luSZ31+6eFb6MIJ/VJlXXLER4UTkU1oH5yWYwl5qMYW
         YfkA==
X-Gm-Message-State: AOJu0YwnWO/HHCMfdsXwzYm/Vj5JIVm9pIM5O9E6xKJi+Xa2qYFH4xGb
	wdXeHzMNG+v1/5EoNbYrxw2CMRhZalhvTl1GQo9PBmtntY6apj7X4Tn4Y9eA/sBXWMsTSTqMs9i
	O6rf968/7mM5Qt3d648EXYONCSPy3ZbEYxDtGQQmXncl12FF+Oz8lJj7cj7izCeefXzMh
X-Gm-Gg: AfdE7cnfEuP4oc2YaU7Gk+4ZLSac6J4L/md44eUsczv8pGI7JYTRpNnJMIFqt0vbwPR
	TwIFCj7kSl7V5Hpe4JvFQepxGrXAb0EY6YlUQbK8hb0tmDc7dwqnKfqU6R2PYI7CwtN/gH6XOhF
	KFh/dZV7AUNSQEbo/McWmlFRLlPz6+c6IlmNnbHREc0BlOYtizGrHp9By61bhEvWb2YKraFocqQ
	zZUCxoKVlx5RdYKndqgq+mZc2vIU4sDj8hlh1qqW8Z7G73oV4ZARXcyqJMKo/U64lWnW36K6p0C
	ACq9qzvMU5mo92BcGoGn9y6+SO9Q1MyUnX9LdU85HxsntfXSDum8ZDihCrMXlgEQ/wPR4k58wxK
	wISvxjYsI9doHqOgAdBZNnZhnTubvr/KKq88rNSrlskCIUpGxeRGzOVFbvb0PUOY0uEck4pJ2y/
	4LDrw8
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050720637.16.1783878528679;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:e584:b0:3b4:8880:2089 with SMTP id adf61e73a8af0-3c110a47008mr6050699637.16.1783878528239;
        Sun, 12 Jul 2026 10:48:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm10369954c88.0.2026.07.12.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 10:48:47 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 23:18:35 +0530
Subject: [PATCH] dt-binding: qcom,snps-dwc3: Add Maili compatible to
 supported device list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-maili-usb-dwc3-binding-v1-1-fd6697fa1e21@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHLTU2oC/yXMQQ6CMBBG4auQWTtJKSjBqxgXTDvib7SajigJ4
 e5WXX6L9xYyzVCjfbVQ1hcM91RQbyoK5yGNyojF5J3fua72fBtwBU8mHN+hYUGKSCP3wcdWOtd
 vG6ESP7KeMP/Gh+PfNslFw/N7o3X9AFp4o1F6AAAA
X-Change-ID: 20260712-maili-usb-dwc3-binding-9c2d4b70953b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783878524; l=1581;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=VJcjUXbtX3f4WSQdzSuuHqAJhBkkCn09H/VEJXL+J0M=;
 b=kinRlM8Q7KyFXC9K6ofEAUKJd+qvlawCj0u78m9N4+eSav+8r9Lm5D5HhISbJqmQiXoDsRsu9
 CqMxIbUPN+OBWwPTsH3Xr7Rh5m8YuLLtcWXehZNfC3gqmEFIEcaIUS2
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: fchwmC3U_YFVyxcQyteWjPPU4qXioGcJ
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a53d381 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-cuiU98Imdfp90X4gAkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: fchwmC3U_YFVyxcQyteWjPPU4qXioGcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfXwEwqsPqyEYmJ
 T6SAjKYjBQhJHRc79yhGiJIMnZvWVHRPWykKMy4PLzBtJX0ficx/O4FJixLfuD2eEYw2fsVTNGA
 uk43VKVAd2O2w7o4SA7rl2GJHommSt4l1qRAZZjoTPrqeXe7foN67riz3UqLZT6ovGREzg8Ck3n
 lRykpOo7azWogTQTndLlNbXpFtLK0yXJVfuWNSG4J5yA/+k16NEEifV+SAIb6wDVOmTCemMT5b6
 nOSdAZWSsh3WecM82sXYj9HqYO0fg5lvdFHs927hQgvr+/eHc267zr1sAubBPh5/Ldy+HLfCVpQ
 s9hsLyJi+qy8kNCU9Lje4Nm6cpQ7cpVI0iGKcEpcVfhk1ooemtNAhea9RCitBzW9BIqUtuFBZon
 qy+N9hCh+FVMKIRWghEHSxrb5Tdp4A31xqnzd9DJiybPprMVAhlnq+XjZ47KVt05utgiEGYRBqL
 pNt6aT3EaW5Pnr6m2pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE5MSBTYWx0ZWRfXypP80eohKCLw
 LezfaGlPEcfNASmYEhJzZruZNjdg11INnYG/guJXlgHOwkaPHaeuoMYM8A8uLPlIoyJurI77g1h
 jziW1wu5MrYYqrB6wVBSQF4QXk4g3vk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120191
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118593-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4676A745870

Add Maili compatible to supported device list. Maili has one SuperSpeed
USB controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 932d7aea43c5..9eec07dd33de 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
           - qcom,kaanapali-dwc3
+          - qcom,maili-dwc3
           - qcom,milos-dwc3
           - qcom,msm8953-dwc3
           - qcom,msm8994-dwc3
@@ -208,6 +209,7 @@ allOf:
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
@@ -546,6 +548,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
+              - qcom,maili-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3

---
base-commit: 1db5c6b0b9834aee2f14e39764becfcc29d09ccf
change-id: 20260712-maili-usb-dwc3-binding-9c2d4b70953b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


