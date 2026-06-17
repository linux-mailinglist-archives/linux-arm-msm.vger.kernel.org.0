Return-Path: <linux-arm-msm+bounces-113507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iHcxGtFVMmokywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:07:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C67976976E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QBOA+idh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OTcvdpid;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2D1D305918B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 08:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2EB3CF02D;
	Wed, 17 Jun 2026 08:02:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6E345757
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683320; cv=none; b=RFD1J8JupSF9C2Fd920OdkuORltfd+RvJ43dAmz/uGsLmDmJ9nWm9e/2GBCBBD6zONLTZE2F6//36wZYz+zFVU9fxuU1jbcP+NKf4yj/EKDa7Jr0esrekAlND/wmjOq1+/ZAj8eIlFQMxZYggwS8275ypOIlQWEPvdg4ckT3w+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683320; c=relaxed/simple;
	bh=oa3HYSodztA2zZt5YrjFAdkccu/0sKAQUh+l+7i5hKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6vHO+Bwd3mpw7tJmksqJ+04PXp+5PbhOzS2vTgPhUGcufTyBukjygoKnIMH2m6/jM+91/u5hpifu30UCcH+IUisahbtP413prePMhMGAIrXwcNSrrDQx50HTlfdHxp+JeOO506CFEgP7CysB0aFiUVqVY0L3Ajo0nYcK0govGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QBOA+idh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTcvdpid; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H5lGLF833822
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Tw
	t01kN6hE=; b=QBOA+idhbLucMQTWsvKsYivubrnqYyvW+Tlpz+lFiJicXRlCEbz
	ekYgUozhsflQX9pD2At2ueCEK1IDVlycA+eMjHVM//PEDtC3J0L7nkbrdNbwUSdI
	GvS2xV+b+7A9Ro3lXXTeYkKFX7JT0m3GUOQFM0GVw+Byk+G6Rkf7XeL2yr0UUaoh
	Wta3wfZAA0+u30p4WOhxQ5mzHhQZEmTdqqPZN7Cmgmo0gy0P4Kdct3A9HxnPt1jv
	xpyUfhjf6tF4uC6tnOSBaQwJKeHbJpGKunmeGaX7Wq4KGsPz4JnBiqoVvHB84LmN
	aofUm5reKNTm4XCH9Miz5t2rOVTFiMszLbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevj4h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:01:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c6cc4e179so1168067a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781683315; x=1782288115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Twt01kN6hE=;
        b=OTcvdpidgbi0k711uYgLqktRwpoMeL26mhL5KyWfAixml+6KfzutmawfX8zrr7kV1H
         cPGLYNuZiarqF4855C4Ml/JemOGNsgyQ+8aDZ3USsXxwu417KhWfj+BbzGFqaQlgriB5
         hBCcgmsvZT4ucnbLjJGkbXI8BN/FoLLKVIe4pzzuisHtsfafM1k09zRnp5emcI6+iItL
         awqYq0gDPXBAY503J52n4EqWK6G3fEABrplHmeiYGtIZTN8Ykipu3thTGXwnojDy6Gcg
         HvdWNaWxxPaM4TOPJkqNeIjgXUFJ0Wl8cMR+04kXjILh67wsEg4UZzb3s6xz5V+k8sRb
         Yf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683315; x=1782288115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOEBn5U0xXyUGgxcaGZZFDOJUtS6PKgR6Twt01kN6hE=;
        b=ZSvLPDlSLTbF+6XY9BTkAeXiFbXHsFNB4HwpRrFgFdBOItNOKV4CwRd9mcw64SkkUH
         Cb8c6B/BKocmfsIUoOineyFxsrqr5g45ylXgqxuiGRdwYA68b3rhtugJjhEpYHBv7UpJ
         6aD3ghJ0l+uDJqz6VdKmhHS2LIRdCe+GUa0YdtbUMllYRE+JiMiumqVaobEC6/ek9zRz
         ztdPO5V7YePVN0ruSDmLGXK4MZOYFVGqnX9c7NToL68HW2s8FbP9kGrC6pO++L/5oWJc
         7iEaYOntuGxSla+zOOWhfgqDfwsTcILgOuND+Xag436aowSxOaqOipuAbd+xOp4mPnHj
         lnZQ==
X-Gm-Message-State: AOJu0Yw+efhi87+2x5wSb4nJ1MQc7/MhcKOdXR9ffUG/ETUFmFBJ5Ab4
	6k2BwsJkwZreYVGMX1aiiHhVbMeOLr6pFLWUmColIDPZf5FtL2hrS+tTJZ+wa+pMjWKkWN8qS0r
	2PfutHjYsGlgpzHH798gEYn/biebY5Lb6rCDkT1KzZbe7s4vcMJCu4STERK2uDuj/s9eX
X-Gm-Gg: AfdE7ckjgJfwu+J6n73S2osT4eCQZ5fJShWn3gjuVRNACmVqlwLy7NT/LitlwhTThw6
	Q+Hwxzb5RvExusGZ9Vza51W9HgSstIdhRxgYAtNkfKdzgDjZVYmmPSJYIrzhh0Dg0S7pyBzC7px
	leALTLB5piAHJ5sijhIjepedkhcGDaytCmh5S3AT4kfSdgTa2qp3+335yYtfmJa93qXJKHWlClO
	VWBRzXXQea5LJjjc0Z8l8BotagzoS2VESfidcHeqEkw1+yz7PKgYud/8nvA3MT3+Wsej74UQBwI
	MWBm1nzEID1VOXl6SXuGIWlBTIeSnksKMlx130Q+VwkCj0dbbjwJU5bLjjB4gmLrv4LnGg7eVD0
	HQqOvW9YdheNMbacSAJNNIwkMn0UwOtXKcpgqXA==
X-Received: by 2002:a17:90b:5708:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37c9425eef8mr2941910a91.20.1781683315191;
        Wed, 17 Jun 2026 01:01:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37c9425eef8mr2941858a91.20.1781683314650;
        Wed, 17 Jun 2026 01:01:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae7dcsm6520972a91.2.2026.06.17.01.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:01:54 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
Date: Wed, 17 Jun 2026 13:31:47 +0530
Message-ID: <20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfX6DE7HdcMV8b2
 XmLZkzbo/dwoD7wqWL9vdMNpR8jLs54PBh4OkqQVGr82f/m9vTaMopIARXY6HbR7Jp6ojEgFW/P
 1feAeQ+VAsxM+3OygaCsJynWtQq+gWFHMgaxf2UkpIK3UA/hsMq0+m+vlDvFlCWiPjg91HG2Y55
 MX6Hdjg1qWNMc4FHR7lARayd7uUpsS4wK97CvO/SioNd/pj+Qf0W26vDp9707ozQZ2xsKTVWbWF
 zCqyZF8BkmCrN8h2nDszZi69NzDBUPpx4fE8UlcwHuqTI2zEisBt1Nwgp/aq1RL8p5Etz522ctp
 JJCOjEms/EFMalibPyHeN2l/47c6Obj1VARSb8dqUnLBvQgGnXOHixVQxv2TcxAJuVWX4qgvhgE
 d6GfmY07Rxjm2C4wV9SAgzzkco3okrzrOhdvYnso8/Y+2WBvvka0U1wgLZJ6IdCLRR+aoNFHvbm
 HvnVYE5abOfhZB5L9Mg==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a325474 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=il2g-N3IprqvI5tJ1rUA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: flRxmoVGhi9YjQ2fg1WXmcS4VUhzN16E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3NCBTYWx0ZWRfX/A3ozTyVPny3
 ++YK8TVV07kwRSVT6ycAKJ9/DWAKEAzPJAz0Qpvd8RftgmHQNOYZuarO3xnD5kc8rkKiJ/sD1Mv
 obvAaMGmYY5SRUY9qoKPXGcar87IlMI=
X-Proofpoint-ORIG-GUID: flRxmoVGhi9YjQ2fg1WXmcS4VUhzN16E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113507-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C67976976E5

Document the Qualcomm Hawi SoC binding and the boards which use it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf6bdded81d6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -371,6 +371,11 @@ properties:
               - qcom,ipq9650-rdp488
           - const: qcom,ipq9650
 
+      - items:
+          - enum:
+              - qcom,hawi-mtp
+          - const: qcom,hawi
+
       - items:
           - enum:
               - qcom,kaanapali-mtp
-- 
2.53.0


