Return-Path: <linux-arm-msm+bounces-105934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJirOafd+WlPEwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:08:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 486114CD393
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 14:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CAB331C1F4A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC5441B360;
	Tue,  5 May 2026 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJV9UjwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W50NIdfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FEF413237
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976634; cv=none; b=uLY6DUH+dxQ5Z85Om+N4gSZvTgcbEGrY9AgQgW+el2Nw0v4or7r1jTNEOM0mxChR5lyHPSs5L1SyxUiR3sQAIbxuuRE1PWbsIP5w7YB0dIfA0OPDdQ3cYq+MF96Red6r8cbGAoe7VRayYZ5+EFeExoiE1utIfotqNDLeUePfRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976634; c=relaxed/simple;
	bh=RpjSjjB4pjZfFcbB7XVzwzy4YMbJ9NXUiyxiX8xJI5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BamvO2JBUB4a0tUKXXxxHuLOD62u9eiSQiBAJ4dioDcLMTZL3TlVxXJNX8VVIhLSniC8bBIF3qiGLALjRxb2PQWDJgYtj6gVkmP82Io0q0OE9IC5rLAy5B6XfsmjU+bMStJ44bOfOM4ewvretiihqKI+7Sqfw9nU2f4mdb00kEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJV9UjwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W50NIdfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457ein11960443
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PiAJ979ctt8
	7jli43AjJjSavikAkdqiFGxXDSeW5JsM=; b=GJV9UjwH1tw2DMdKgVk6P36gbiB
	LotfKCO82R9ie9tO8aZfYBYr6CqRAH4h3YcpR3ys7pp7OYDIUpkZDeEu/DFM5oOW
	3xO+8lrVQDqODegUyXsEWHlT8gtwKtQT3HW6SvBHLEnG7GhqI66CYE1fAFVwoGN8
	nKlb2f5aT3KfFrukcU8L34fomR9RGtK7vOA9i+G4jjMrhPUWlvrcHNw2EwmxIz1s
	I4MZUpqyCYfIVcGfd3IOtbb7fXrZ4hesCu8h44LPT4iBYXVnWSnb4rgWnsYZb2dJ
	YJkFHulA6C88c3D12992l2RVHJno+hHZcdj3ikganP8aXXAYpRcutQpwYjw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5duv1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso5307437a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976632; x=1778581432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiAJ979ctt87jli43AjJjSavikAkdqiFGxXDSeW5JsM=;
        b=W50NIdfBz08PvBme4Eq1VH8SGMuSRhe/aInYgobxDSX6WbxCvPWNB/kpV5oxYAZg1O
         l49m0D8NPumQdbwm6NmzogMvyDSM3qHG4aZhZ9ATHecEsDDevcOL2vSAUUQatja9Rz6s
         /tCnCZDs266y1GKfrShAhZqBb0U0A8B5vdsLksblRG4ExA4y9QhYy8T6q8uekGAY392s
         sNJkjIlmNWGgFE1b65sCtLYFO31+XOAXzely04eAZuhhHv38is7CBf82YphkfSBFDL5H
         1dhVp17woQeUdqUXnZ3F8jV+hCJKQDmgyTIRs+Dm2eeyyUFTKSD3I8K3rRzItudAmMVE
         ML+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976632; x=1778581432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PiAJ979ctt87jli43AjJjSavikAkdqiFGxXDSeW5JsM=;
        b=c3XvyTeT+FSDxeRYxN28B2DQ8GXkJIxSWNigNjqM3oGCMIpYpnoR7GCYQeTmvzBfKP
         FAP4QhZ/iPSGQpbu70CwL6M5apzbLRKfhC0ReP2pJxrMAjMz5PXn/7ED+jQcX4ZoelzZ
         1+98FF6yahKnMuyZZYmVtkrH5rsrz1Q8oNxKFCIcJUqHhKAahff/ZRXkYKEVX3jIy+Lt
         cKH3i0iLKqogQPRwoxxkS25nQuwHwRBtG1QR2lRtV456iKOJYEiXsVcRzrrW6rjJiO6Y
         E8TolWiBr1Zdf7zw2RmEI9/IJZcoc5KOQtG/AqqFX9/kYZxUJJcsiRpRK+gW5Y9y3Rlw
         X8wg==
X-Forwarded-Encrypted: i=1; AFNElJ/xy/wJLohhFTEL389cEpWKrmHjfGL4Uy3k9/J39tM8G7kqgHgs/LZe6tpkCL3LdmX+OA3TudZQOLZ6GmnR@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOFf9rkS5COK/3OKmVNkIkyoxPWQ3bdWKFQm/N++Uoa5O2Nsl
	uLRr2cljVCrMaJSNI1dEyhC76MULBTiJT/YLgwYUddy2qnpM/zgmax/DM44QxqBpQbmqftioOS8
	2q3DGZTZguNEW3PMeNNjLEvbt352OeRBfR+/yK6v/HPZoutoIAqc4iywwPqhm6YonzYJm
X-Gm-Gg: AeBDiescIF4zXN5E5QZPSyYfEHRaxlM0XvNGH8PRNqKMkaAmrKwRm7Ic8hUcWMbrfiz
	nc1girmTGb6tGkGA8pLqKeywXpTDYI3d/STtMY622XTzRor7RwvGBh3pIULL5PpRxwokPALatgz
	IpTL8KB+V6LhgHLTnKQQYztXoPsHerTqavqOenI5o50hJNe2ov4UyG1lMSNV7BnJTtuL6rygxxQ
	vvQY4iY4+NPOax/OCcfs6Dk3HtG7Sy3sg4e39fJcIjqQ1UM37rNQKfQwgTyvRcDtZEFP0z3PzdX
	YmT2zq4m9ExI6joD6PoKqwbckoSiiEgapGY4qVdBHsQDDTK4VlH1whq3Q1PHeKnQsK0D7IeveCm
	gq9K+8V4NWU8xKmsYHqgyr06jZfcg5mKlmQyOAuT2SJYWKOqLK21hZjzJz7gdy0BAxLHzCFq96w
	m7cbFnRIeRFeiiuU4+GILViScQ9wN3HGBMuM0/g/e1zg7soEGbVuRHoLXEj3O7rA==
X-Received: by 2002:a17:90b:588b:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-3650ce8ebb8mr12021958a91.13.1777976631691;
        Tue, 05 May 2026 03:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:588b:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-3650ce8ebb8mr12021923a91.13.1777976631188;
        Tue, 05 May 2026 03:23:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:50 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:10 +0530
Message-Id: <20260505102310.2925956-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX32eRsNyu8QYm
 FwbtHn5aRxxl1RJMfY3o3+EYnBDXjAsCLX92r8nL23LkxJY/48uJDz5fcmzRzDwnmN9Jv5NZUqj
 yY3UMk97R8tsZrZ35zx6sHVSH//iFoghXnMX0PLoY0IwoMTPtNfe9yO3GNbhVtMHoA7jGGUXDjS
 ltnz6SMQNGfEX+jTfSNa5vOmnfvzPCgLgGk1QnzEYGL71ePfUNJPa+DnbU+SGQh5g30p9mo1xAU
 WcCksA3jcVH/TDvx8EAOAmoaKxDybnAh1mf/KDoa3WiOs9CYGeW8cHJiYqZpK3qzhbrmnHL+2wg
 ZaTU8N9CsvVFa8suNhL6BE1G/Cq7m6oebVUyoUuuplHFBNKyftdvXRjw5W+20qA7ijIy7qBeRtq
 88nW3dMnkvOuMR579BcWVD4AUz6eW2r1suYW6WLrbWpKJr2iVccMgcUfL/5K0xXM1jSF53Aa9/y
 iILIYtLWd/+ph2jFA9w==
X-Proofpoint-GUID: WvS_OS1oNkY5geYYpt1WRh3m9IzUOpx5
X-Proofpoint-ORIG-GUID: WvS_OS1oNkY5geYYpt1WRh3m9IzUOpx5
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9c538 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: 486114CD393
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,outlook.com];
	TAGGED_FROM(0.00)[bounces-105934-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.975];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..5c828c855c98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -914,6 +943,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1


