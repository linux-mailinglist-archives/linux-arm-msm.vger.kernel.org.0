Return-Path: <linux-arm-msm+bounces-112286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 92DlEJP5KGp/OQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:43:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDA665FDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:43:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SAvjX++l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bd8eDtgw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112286-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112286-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 132793079FEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24962358363;
	Wed, 10 Jun 2026 05:43:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E922E7BD3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:43:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070217; cv=none; b=DQoZl17JorzfxQIolMvszcQbp3MG2OI9A34rPyKAGRq/eQquRJ+kR9fYK3YKliEb4YTrWpXm2AesQmcvAeR/aHZ4ATrCgoD07ccdc6OxO4FefEC98b2q5CPbdi8U7eoFx1O1cOsSJY9gjEAItT/FiJPYePyPl9tgym1rRV3y3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070217; c=relaxed/simple;
	bh=cIJKHUE9rzKAjsGKA9B9ahAX3w1JOCBwy/twHqPbJGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aPGMFwg4v19OioDh5Epy/skTr5jBPNaJ0WlzV7J/8n9jIEdHXRlWgz3lSRzJ8wlJ98HhC2BNaVZG1365TgpZ2qXDcertaM5MZRC5Q9NlQa/qv4mOe7cVuCkdIqr1xvd6gxAj13ZV1DCQsG/im4L3eAMS38bkv6MlvXOEUvAnqsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAvjX++l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bd8eDtgw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2emNM4061604
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g1S7auhmrVhVxzUSU6uZb1
	0uD+w9BPqSmI59wEYDAjk=; b=SAvjX++lfH9LTD+/e2MZxXGJhYaEH4q7IaHzC7
	vZP0IXbgFCcNIl7kMG4XMXeBfNv6jBQuoQbp1hf3gkwr11VrZGsrNrKJ6ohtPGqU
	24xLuWFOKUt6p4T9aQ/uiV7htlueOL7Z0aPj+LlVFUT8R04J7vmXUBubcj8+EjqE
	pTnhLN4lCwmYcj6aJ/DSRxR7c1AcDH4KgyOJMwfpQ+b0kpm0gQjUA+OrZdvtuy6e
	cf2wQnj2o4pLdIXaK+YFCK2QZTdkEYpJPz4DmsE40ovanjzGNUOAMRW0PpIMN0cH
	LqFU7cPry+5xlW7BHlxCJItzprrwLxVENxiI1joldIyf2GMw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2gv04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:43:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso6553146eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070214; x=1781675014; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1S7auhmrVhVxzUSU6uZb10uD+w9BPqSmI59wEYDAjk=;
        b=bd8eDtgwJXcDHeQ1gI7zoMDFrIh9oTMWQ+jwG4r1elVIe/viCP6vOffdZ+4FiroE4I
         91Q8n7GT12NwrRwAu3oIBZzU6zQNLfi0/z1tO0OExby5TNC4SJSCBzP9G1pq79WSDFgb
         2MwS8hhFXuEdSeNvpq6+ZjVv4EXEHa34GPbPxy3nmw0Ktaoohq6Wuf4EsFPVQaU9Fk3j
         XJc0+v3CNlHm84dr7gzq92wtd9kN5khuWFPRPcX9YajGz3X97QLgrRnlT5vNXCJQud0h
         8orez/O9eEMXGnKOvstrbfj3mzhNHm4ba/AFNTtZDuNFRy6DWReV69IeMNezqIpqLKbp
         AHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070214; x=1781675014;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1S7auhmrVhVxzUSU6uZb10uD+w9BPqSmI59wEYDAjk=;
        b=LBriYMqeVvEbN8HYsDr2xKyXKKRf8bd96ZfqjO11El3knTrYoDpdRp5Ro7lKKxGj6Y
         /tueHySbDmmP1RU5a5lEikLvmSdMBS4M+v7XBWkP7v8i6bGx2QWy0m9grdIF5L5mIiAB
         XomoE4sIOS0PaLTbP6nwnkVhRLlac55c5Kf6/+m5JgQn76O+jjP6qAvFX2G6DBKgU68G
         9k5slBKguLXjm4s0vOhcJW4ep1bpSrvpaayT6nL2Mj5vLynvFEZAkTQBTzLSlZpKjJJv
         IAKeAMWaA5ORLeSoCyPfjRw03xLEya6W7ygk1AprY1kF8x/dbcE+4qBWuPRisduYS570
         aoGg==
X-Gm-Message-State: AOJu0Yw3LKJ7J35zGHIHO4b7JoSEC7WduHgJHmM70oUWPDuGi2GcgOY3
	T0CzyEhjGfzUjul83zRTVQG/FBa6RiS6XD3gQLzuCS1Zejebu2HuwM9/ocLAsCYca9SSr8hupz2
	IDvP6el8r6/WHhGQMSuSVsJdYOD7fVPGF+zwjj1xjI2iSa8EyFFwGQLfUhi5WYJzZEBg+
X-Gm-Gg: Acq92OHuBKKQZSHsnwAPWKL/UCrBqBFkkkssZFbr5fClRIeq985oSovM97tr6H1Q8MZ
	ViY0uVBVDus11eTkkqIC4fcUggB7Ekp9t69cCezU8aelwHFwyKxQU750jWxzIWa2jrqS1/pxCDR
	spyyV4BKyXju/ZtuR80lMoRKqJ5B+hJvpQGbJa1JG6GxlJNdgAMx8ZECMGxLRr/STFYdmYS+Qsa
	JACYV3lrurVGWCKYOmZa2Bhi8uNlb/VQle9bMv3mMYEEHxKl7mcDPyDQ/nzNaMZ6cpAx3ggN8+C
	8X4BZrqAgmvYVEilwWZHIvVotRks2sKvnNEsA3E2OIkL52JDt7hSWoUDtNNKhLn/IhhuM9gfus0
	PtuNzcErM1cvggz4g4OnFVoFCKQ6R3KtKTzLqPuivsgJZvgTAQ1UBtTk/nxftGtmtSH3LjFn6vB
	Lfc5due0UB
X-Received: by 2002:a05:693c:2c01:b0:304:3c33:7ae7 with SMTP id 5a478bee46e88-3077b32a5aamr14613476eec.7.1781070214135;
        Tue, 09 Jun 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a05:693c:2c01:b0:304:3c33:7ae7 with SMTP id 5a478bee46e88-3077b32a5aamr14613457eec.7.1781070213554;
        Tue, 09 Jun 2026 22:43:33 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df75ff6sm25549178eec.26.2026.06.09.22.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:43:33 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 22:43:31 -0700
Subject: [PATCH] dt-bindings: power: qcom,rpmpd: document RPMh power domain
 for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-maili-rpmhpd-v1-1-c8f976377726@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIL5KGoC/yXMTQ5AMBBA4avIrDUZlRKuIhZVgxE/TYtIxN0Vy
 2/x3gWeHJOHMrrA0cGe1yUgiSMwg156EtwGg0SZYYZKzJonFs7Og22FxLzAVHVGJQ2ExDrq+Px
 2Vf3b781IZnsfcN8PQoyJEXAAAAA=
X-Change-ID: 20260605-maili-rpmhpd-2079035fc51b
To: linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781070212; l=1082;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=cIJKHUE9rzKAjsGKA9B9ahAX3w1JOCBwy/twHqPbJGs=;
 b=5ABKL5UCgk1pHYzu9Y0zk4aP8vxqqWvVRAGDmaji4st3pbWj8+IHfM17045skvX0V9RlGLcfA
 IIF+E2NNBVLAMBk3vPKFhpi/NWlOp2VRa+d1aRLDsutxrdKWr/hsmsQ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a28f986 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Vvp70IE03rMNbhAYA1sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MSBTYWx0ZWRfXyKALhsVpvBvr
 h//PK/4iyt96/8s8Nmy5kDgVJYR4G8USxDj8RhYy13Ccqf7q1zi+1929OPS6YrmhNh6QdEGnYqU
 qYcruJwqCK331dYwyHwb3LVcIik1Nd4MgBGPskJNHrXWG9WHsesElbBEbSzwh0lv/1M9mL5guyk
 uDHaMDxpAaNVYqX4qm9F4nTMTiPNDxAhxmS41c9HuAtzj9x6iwClu1w9GnGwgXKR08fR3xcUx3n
 PFWVHfsXDaNG9Pbbj1qSIXU56N4pcF33DR4bQlcdKyK30WwOJ7vZRiCl/fdMwLhz7hAjNFYR8Pw
 NxZ0Ktz5Xp7IbGJ2Bth3MfYLli8ozmopXoDcXY/h3RKVkfEI3j3qqcxMUJhX0qazbUMiQBLnwWy
 E6G2jnAqzn4YUasIG2kWetcjONVBnBUG1DfvStZZCpBSKARkzCCTmAPvXDghsSDU7Pk3+PXq2Rg
 H3fgeWb+aDEyeaQINjw==
X-Proofpoint-ORIG-GUID: JeE5MykiR6RLyA-lRbg-JJqRxoomyovy
X-Proofpoint-GUID: JeE5MykiR6RLyA-lRbg-JJqRxoomyovy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112286-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83FDA665FDC

Qualcomm Maili SoC has exactly the same RPMh power domains as Qualcomm
Hawi SoC. Add "qcom,maili-rpmhpd" string as a compatible entry for
"qcom,hawi-rpmhpd".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a9964..9f3c8cbe9d72 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -73,6 +73,10 @@ properties:
           - enum:
               - qcom,msm8937-rpmpd
           - const: qcom,msm8917-rpmpd
+      - items:
+          - enum:
+              - qcom,maili-rpmhpd
+          - const: qcom,hawi-rpmhpd
 
   '#power-domain-cells':
     const: 1

---
base-commit: 3b7a18a34e8d3b14c7c926f033488a0350de9759
change-id: 20260605-maili-rpmhpd-2079035fc51b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


