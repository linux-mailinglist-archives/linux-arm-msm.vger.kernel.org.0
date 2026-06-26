Return-Path: <linux-arm-msm+bounces-114605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mH8gAIcSPmoO/ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:47:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7105E6CA772
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="g/o5L/1D";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y68mb2t1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114605-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114605-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 855893065A7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946C23CB2D7;
	Fri, 26 Jun 2026 05:47:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2D43CAE8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452852; cv=none; b=DMl6EKpxvGDnofRmZYsoCFu3mZ+1rKVO8Qx+WO/BWBCNzu1E2uLETOh3DWTTerun5Kz+1MrdvLlwNpxrxxcl07vnwi24B1wujbSQl48lxMRxquK4BuyRrT2+3XQpoWCHqvKSeSP04sNwUPrg6tLHnm9cQaDb6E0U2t1GmRdJM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452852; c=relaxed/simple;
	bh=H8ubX5r6+fUjYFZplqHVXsIkPLsSF2uwV17yyqPeBoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2tOlJJDAs3pE4yQmN8mKCKZO9Pq31+Mj7fednxfESLoXYINtd9u0oxfT62XYkkhVpRnjnUZTyZn5UW9/8Atbx8lCKgkLLfCqNPUNtfj44l72MThHR7FcDaSgqI77XitVK4XZI20J2hGrPo2Hki6CRJeWkqF5W0PpmUml9OM+oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/o5L/1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y68mb2t1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ieF0003341
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=; b=g/o5L/1D62Ac3knC
	a85npGhZ4D9hYu9W2i7cEgvfDjMsHxSkUVt0AgVWaaIb5UBzwYrrXf8TWLMM6dSs
	G3zD6upFVXZN/JnjAIlQwQTGTAIp0AAUw/FObQ76aQPZG4IG9nZS/WDRHuFKf5sJ
	5nV28eEUgf1bgARLS9KhOeD00dZu/gH6Papc+Jztel6YaE/6Ef6NfGS8s0qNJmcb
	L5FWPZp6GQ2H/rHqoLX5v8nm/NiIiWjGMksoSW6li1+POH1QMrC/wrO+gQH01JU5
	zYXDKbirzNgshqNP3wxXEF4mL4gOKT8J36nsq1sPLerB8CoPZQAX0IUk80eqvyW+
	ZdRx1Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8xrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:29 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-80c2f05f24bso69597b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452849; x=1783057649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=;
        b=Y68mb2t1c2EtMfLI9CQFyGTFUUtZn3waq5vKth4VMMxv5Ii8rkhyAQHW+r02lhNHuR
         sIsh+m/c7R5rfyIqpYGyu9Qs2FbCLDc30I/vHJ0llDF8tHVQUT6aQx5ngtxmFs0/kuuL
         NYR1RO98VgHeRZemH4YUgqUUu4eZEJa/ntH4R5BztPIdOelKnZseEKyIsml9WSEYcJBH
         EYIwWlUhhRxMpk/kWki+pswKEs6p/QzkWOVf+nnqXefJFsVDp4WuWtNCFGbhtx3RGQP0
         C8y98q/GNoL9g9C9VW21euqIan+xkqH9+txkvy/cACVoupNVMQxFJv5ntSKItDptAoS6
         OlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452849; x=1783057649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U7QEh3CkVHu3vpnR7ozK3pEfgViSKW+CcrIDb8FlQEQ=;
        b=Cf1yoaRpBubCj3Nrm1MSq62EYHPXrCuoJJ1XXfuqi1peWYIO+5hAV6I7khnsMQHXov
         jelydqum47peTXZLCuUEcjyKWvrpFbAqPUokfegjbjW6OGtb7bRtJCZPv1+KW8sVzYIZ
         agrCtZYD42JbV9tZ/tOJ4F2cYSERPoGY8lXRKloEyb0GscE4bvfS1h7wOlWyB6QdkFKw
         u9/GjYul0EmOq0GuILFrASwB+/d4oELhMEeLV1JluIt7kefsSlBYaJulEYnSoOUGGh8H
         M8eYmXxHJfeoc75B2YumixMqlKTyEuCzZobScr9r8T+AaRMxM1xOnL4FCLbKzFwFlPho
         JCrA==
X-Gm-Message-State: AOJu0YzefGye0pZmbUbxwnL6ywhVIpVz+d3L23F1q6lHtJikHeVekSoI
	6385BULBLSpMyxSj6ArSZ4DhaIDdwBAsu6Bk/l+3dMJ4EnUQHgZ+4ZQk2dl2QpT9/BxzCMMiDcW
	CVUBECl9oy34S313yaDXBqy4KQb4L4p9yoCOHTzgnxsWlHAjgt53Q/3NaDcTudlV203Lr
X-Gm-Gg: AfdE7cmnTEK45qBw/u1gyXv1BE4Fx1qaFxyEZ/Zo2vOjX1xZsRkE0d5O9aPxw4b+d9N
	vep0cjGssm34KAqKfC6u7eBmW/Tfc+p0wXQ0aEE1OXMJp8isTMQHXXF5k57YQ+WiMhCgIHAE98b
	9H6M/AG9CwOELaaQ6IlOeRZTJJ5VLXajsUh+tZaxVsc81TavZb5yspgeY/zMk948gi25xjU7dip
	gJnEFlLsopQoFQ2fnmB0Jb4EkXXOALjsyrTsqL0EmuLb4GzEQwKtRaf8Oer8HwK8Fq0CBqwtGZV
	snHKS8WgjDafmyq2+kuw9r8w6ioj4CtDx9G8nmzxS96ceVlb8EyplT2KOC44Mmzi0B0iIh9CEw/
	Mb+B0Zb0DMOUpL/Hqz9f4nV5/Y3edAerqzN9ZUs68tbiSdjb7QYodUObSZDxF0Dnu7uQBLIB13Q
	b9lx24KIMg7ZSv0+zlegnpjS/PQVCu+w==
X-Received: by 2002:a05:690c:34ca:b0:7ff:1e32:77ee with SMTP id 00721157ae682-80a6ae87640mr52015657b3.49.1782452849060;
        Thu, 25 Jun 2026 22:47:29 -0700 (PDT)
X-Received: by 2002:a05:690c:34ca:b0:7ff:1e32:77ee with SMTP id 00721157ae682-80a6ae87640mr52015437b3.49.1782452848653;
        Thu, 25 Jun 2026 22:47:28 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:25 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:47:20 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add HP EliteBook X G2q 14
 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-glymur-send-v2-1-00905324ffbf@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: q5fME6ZlE-9qlGSYSSivetddOHhgYzlq
X-Proofpoint-ORIG-GUID: q5fME6ZlE-9qlGSYSSivetddOHhgYzlq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX5JEY7lTCIs7k
 3aXt70z4wr4OlQcUpgQFl0ZTLL99RZUn2fUKosStaYYBdIlAyxbTAwH8sMyFVUOFkVviYD8MjHR
 ogJ3eiP3FwOCJPLRSGn7CbBYVR8Qyz1wZsLylGTqJxMfVN3/LsaZcT+DbvAx5w5TaytM9Sk+X0x
 xej/y1MaQSc6rw7l20HbW4bEZXqsUFP0Gut+vaBjBwPRjRomLbMI2dYjV8e+S4Iu4TNZVOVNRQl
 v1/H/N2GjfPG1zmwc0IG69dDjd7+fvp3rsBTOnC382m05nTH2/e+AsQjnFZbUbsLVchiSPCbFIf
 dLFjZkgNh8qQJC7DCFpsNfMxrgp07DmN/cyU9hn00l737rna8wIurTgfEBCPdf7/QSzWm77IZIs
 kS4+hmUfaWyW5v40eFqTRQro+C5WG9BZ6fkoSElzCMP8r4Qce0YfHeL37kI97GYF93oFHmxKTOr
 8mvzF0MVs2+/SjuJ7Pg==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e1271 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FzA6eXefDna1RhwR9dEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX+NBjYxgaJMc/
 D89ilAibw588Cf3WBPEjJCTizyj/G7GToDC1kvL0ztxDceLAe0Pu23ubo04Q6z4JHTAZLvSu2PF
 QQ8lEbFZ7/pgqVmvsCRVS1xWLLPwyss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114605-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7105E6CA772

The HP EliteBook X G2q 14 AI is a Snapdragon X2 Elite (Glymur) laptop.
Document its top-level "hp,elitebook-x-g2q" compatible.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..934f62407b86 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - hp,elitebook-x-g2q
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.50.1


