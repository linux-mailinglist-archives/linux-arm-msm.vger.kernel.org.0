Return-Path: <linux-arm-msm+bounces-117923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nAN1IrtlT2rQfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:11:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E23F72EBC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:11:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Es8xX8DG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZobNzBQP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117923-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117923-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B913318EB5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2553D40629E;
	Thu,  9 Jul 2026 08:53:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3685407590
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587180; cv=none; b=K3CkwTV4uCFORwnyAuExgK95Gh+DetgHMPqUT95SFNR2RlhzZtNUzRutqyRnlFLp/Yx1EnnsdmRPqLuDSR8N5BEOvMwkl0vIX/4NnQ1z/Z6EjYj/vaTPg74FuNb77JDo1JJ273m60sebuU5gKgcyOcifhRtg4Aj0HWXw5jDZg+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587180; c=relaxed/simple;
	bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jn9XpLJzc6zgKI0XY5wT5gGaJiulxAOH6G/WXJnH6EVZA2wFBJ20fMVGlc/AruYNFW79A9qmtfDcMeUkKb3fW3qj8zTehS0OGQJ/5Q0a8PWD/WhkgHJWa9BUYDLkEliMkVL/s8xzJIHxQq3Ou1CUwxN7Gv6Af5lRBFQpZ6VlkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Es8xX8DG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZobNzBQP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Gb9887925
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=; b=Es8xX8DGbSdw82bC
	cVPQq8CvFgYjvE3JtCRMqRxkSB7RuxScWKd69Z5cwSJ+kjyj3DUJetbfL4b8r0Uc
	1lsWeHISs4gDBFKWftZ1gBG+x7+nxX9GeMTF1QvcOlIxlyiIrCMDCo63Vx4vQjNX
	2R98Zp1uA9pN0oEigFc9TAO7FKD9q+d1Jg64erl5iESBGI8UP01aOWsi3E35ydCZ
	RD5orcEiE+rSTIvJrl5Z9aq2rsUov+NcnmEbRs60pHNqz5bsInIv6ugStqWdISLY
	B2wIuNWBF6H+uASyCDmPHYlSzC1E/hQr7gjpeCfa24E8kO4O/KlYvNCQAB8AeqCP
	/Wn1ng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33nhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so1488658a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587175; x=1784191975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=ZobNzBQP/nc9Mva+FSWR77LtKM1wjJHH+5yZpZ3fIhHb+VNEoaceo+PoWOucRUFP75
         PNbVK6mfEHIQPihWWuEkZVppVhnPh6HT6P7NTyamO12Ylm187wrlFTcUGpCpaQEPoALf
         zM2S3iIM3AS4SWLr9Ol7BcaLJeg3hgtcj16zEjIkOx54HqT3eLSINmjrOfm8IHQmEw4A
         xTBtOiZE1u7GCH0xGlNyquFXOvlrvhrm/ICShsdbJTBvp6Gu4w2/6VBgD3frbhjBYgj5
         ujeMHdvUy6S8cWKy1Zht4NNxN+PCgBK/IEwFTjYMlamvqGtMjXs7FUWnOcu0KZ6v109t
         sXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587175; x=1784191975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7C3LES9FKlhz1br8iIOlDOOSpebq/xu1aRezenbPuY=;
        b=FNMHWfBs2JR8dQcd1OlxgPiXgS7o75Id7pvFCTBViJ0wgf71AW2s4CrUWPoNSSF9CP
         I0x485Rh2Fr6v8BRlQ4fMtGENh3WP6frhlEV7EJk99J3OYU/SJDrgY+XFF/l/zBrurtU
         T5kpLPx8Y2zrenxPXWZF254Qcvs2K5y+T+WObcN0EboW4NiOS7/bA91O/IB9vCTswD6D
         o4D5Mb94Vk1wcuH1l9o7u9i14sbAaBCf7eO5cEd8/15E6TZPoqILKuENcZLcxLO9t9uW
         kQtlqQKJKIzJ2uRdEYzVniThTVu5KYAJOIDUYcddWibFiQ1zSInejG9Z5WQuGU7VOd6k
         pOrw==
X-Gm-Message-State: AOJu0Yy0qEX9fWJ0sg+EcrVx1AuxAY+MtK7oPAoXZeI+JiuBrl+aM7u2
	AmaHSANUWMl5NQ01rljLxYfTPcYe9YP7Zm960bP42FWrH5pdMdBw7CXN+XGJ6kb754YTu8FyIrq
	okmU3KUtjIbdfqmcCEQQUsoYdHafRngB3W56YqJA3632zsJd9/UPRNnotzGsIWs8euE0y
X-Gm-Gg: AfdE7cmBzpEU1oKPko+lm+mR8yWN26lrjxbfnSpLxAE6HJlamffI2Zeqw7dgihA5quv
	0l6JGlgMLrjiNsReYJKXdO2K+T7pZh/RW9YytBFpTXKm4atT+jPDOhlUaBZvKP0eqL7G8uMg8pH
	qEjfBewbMs8VPiKZcj9/RYHOxnhPb6K3r2U7I+e141POWJZGVMhhlbeqlevw09yFIaHDBi0WNYh
	9AiL98Li+dOqw68etgZXSi/EP5KatbThhHWebdsoNVOrGkJJ1YWM19gYTh4HxJTQ/hdDm1bZt+U
	OR6mkzJilw785US1xHvHueQX372PJz4Yn53EnLf9uBMHUnfqJLZvH6loKuK1ePN0WhHMuZXEw4z
	uvsdbNEtCulBoR3rsCy7VzUG/pJ3WRufMB275mmH5txVKdipcMwMV7toBZApZ6KGayKOsh++QG2
	06irbJ
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673936a91.36.1783587174674;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:387:e0bb:57f3 with SMTP id 98e67ed59e1d1-38941bce507mr6673906a91.36.1783587174229;
        Thu, 09 Jul 2026 01:52:54 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5574c36dsm822771a91.6.2026.07.09.01.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 14:22:36 +0530
Subject: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
In-Reply-To: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783587165; l=1037;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=uBXqfc4mbtwTmOdfZ2rYPKZ6TJPThoipKevya/9xmEU=;
 b=R+gYRQbVGrxaHiTRKfJDYrz0XjNuxyCDbx4jW1Lf4CNygeQphMdL7BcC8MG6qG7tH1zGX5Rnu
 Uh0S/vHgvnBD6Uj7HOa/Whj9Ty3kRDnzflTxYBv3a7/IfCgbA2JN7t1
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: VVzy-hFSuFbhCZBAk0A8OPS1npXgLmfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX4JTgEtut+TLg
 tOYtRygH1eYs8esMZDlC5Aapzegx3BnkbJmutne4OOTbbMMiXciBzRLuOBi8jbEwOEGZ7PrW301
 0/pgt/f3xOjJm1Q5X+WY+gTAGS2PfYHKHfIcBT6cczluWXeU5R6KbnFSs5+Y2RGMmkZ3A8rp55Q
 Qet3rkMUloLzFVwqy8p4Pn+BVHIt6VnW3G49cNbMx5fy6Zw9/ojTKW+Q0Mftz5Q4DrcrXUZ3GRu
 Y2AJn6zi/mNxhfpUMPJ8ADsP5TQkjtzl8gmvZx9k5cD+GL7pFRNgEzK04oUCwJTcz7Kx1+pXvIU
 bmYWqG+v7Dht3uEGgRREyf0/lGPhWbBXIa6anNAEitSD+RbgCyTdKLYzykw4JtYw4tBulwWCAGc
 o1slRlaxbSnJXKSEasm/yX/Sy/yvWsqb1Cjnh+CbM+d/AwKmhqema4v56m73flWLRjpr6jJxK27
 50f//QZx+jwq4coUdnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX+8Cdu4xcxKJV
 Zb52Z6eFJmoirtuIv2ucyipVPkmLfuc9KO/Atsq3zRvvUN0eBJAun+vnVUyOfUM1WmgXm2QRb64
 jv4fqO7VDEqCexf2/mdKU5Gd0/oTJkA=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f6167 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Q2m6lpKfM9RfMUJwhvMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: VVzy-hFSuFbhCZBAk0A8OPS1npXgLmfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117923-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:Thinh.Nguyen@synopsys.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E23F72EBC0

Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
or not. This is used to modify dp/dm interrupts during host mode suspend.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..0c6a839be82f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -152,6 +152,13 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  qcom,has-eusb2-phy:
+    description:
+      If present, it indicates that the controller is working with eUSB2
+      phy. This property is used to modify dp/dm interrupt configurations
+      while entering suspend.
+    type: boolean
+
   wakeup-source: true
 
 required:

-- 
2.34.1


