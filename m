Return-Path: <linux-arm-msm+bounces-90341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGlEA/tic2mivQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD621757D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 443BE300D35D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A0E342C80;
	Fri, 23 Jan 2026 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cC/MajCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7AFsc2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E9F332919
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169637; cv=none; b=ayLu3tnNEFIw767EF0lIOCRDkdeQJGtyg122bbfNvj263DXka0s7bOh6IhdCs+zNIPrwWyqL2j0QpjHBTiSYlHa8mD1VXlthjZxXu6uul0/HghLEgCjt9xhFYqyUbJJeSH/tjQGYEpPCxnDo0lTpiJF/dvFpT4uLj4IdP6PReyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169637; c=relaxed/simple;
	bh=RGEcmhOQbO2/JgPqIephPG0/7J6Y3da0ZeNDOn0natw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWsM+xidx+eSPmn8ZrfhOkWObOto5IsnPRrykIOUly3qGB7YF97tUWCk7OH4yBSoRkVDZsiwlOIEph8U7Nt54gzCMnCsMxswQCtOeDoaFlPZjcYkdKGNS0qz2pj6dfQZUlxn7sDWgqLQO3yiQ76u9VPoTxHVy5ZpIFvjtYJh1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cC/MajCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7AFsc2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N8Q5lX3649018
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XMUKnChZ4ms
	ztcRy09JjA9pD4RQsZeOBaIMVGG3QMJ0=; b=cC/MajCGUwdeOApOSmeKQkE6aD5
	6OifzmD0RIfFhCV+JeNHg7skTe/pfbQo3ztpOfv8dQeItuYAfgLG/VE6yww2cKR9
	AJJ3QUILk7Pd4I5iR7yYNxhwdzZWqE7gxR5BVUqi5jdsHwsqLM0GnarYRgfgz790
	+RswvvYsngBP4ITEdafdljwBjYSflFCOq1kEXRHCmpY8NClCbgnLj+q4FoLqjtyp
	IqCHQMnew6YNddkAkiacj+vIzdcKJ25O4y4vOF9UIPjGQxivDQoBVtLTovZM9F6f
	dyLrM1zYetG939HZQsNbNTT8tCZp6BndDyZEmgRIzLfLmvq1U7DWYKd187A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nt79c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a351686c17so19431765ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169634; x=1769774434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMUKnChZ4msztcRy09JjA9pD4RQsZeOBaIMVGG3QMJ0=;
        b=Z7AFsc2eASkG4dcB+N6MiEMHeyIvSn/YCE/kspDN3B2wBLGtYIPBzVBgZr4JRv1zJq
         rdNdfK9I5GGk6hlvZo/aH42c3KXtnpWituyKMnemnNNEs+fxpwJQL304ThohVHBuErYZ
         fkx/HMlNQCJ2rqP1r05RgCpTWswIdCyn3zYlAYwzbtoft+IOoTeRRZDFELm4TZJlD4a4
         EbjmspXPiequKSmGcFLIRz5olqwe5URSAOkUYufVR6uXPM0Ri5evakiCbeMFvLQyo4cp
         GjnOmovmdBh9S1vCBUTIhM2Qrwa6YWnz3zbI0IVFuomw/Vk3SO7QmeCyFu+qvRJ3f4qA
         buGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169634; x=1769774434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMUKnChZ4msztcRy09JjA9pD4RQsZeOBaIMVGG3QMJ0=;
        b=r/PI+H14uthd13C1YGy852uB+Zfms4wMgkmT0I0Hbv2q4AuBZWGjYfCux7nHVtV5H1
         TQ7SqPpF785xl/lHReQDGJIwFgfgfR/Q68Vl1zXxAY6axau/zL8EFMMxbHhkPf78xZ/+
         tuj9MD/unnLVJS+ToChKM+SjwZqTBdWBXk+MLtzXJxL2pqrfng/YgnCuqbTLO/B/py+6
         hpD1XtCT06QCPKpRScS10nhDfjUk0BekOEPQ6Q2Qg/9LwqzuvkNeTAjTCCPDK4IFBNWN
         VY8bEeAKquXUj0PK4i2t4NpA6TJkkcyVZPkmm1Bc1ekOc5sRrdomajzD44gIby8OdkUn
         8Acg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+6x+Ox9uZX911n8XSYpS3CNzTqM8WC5VTO7iT09Z98z5yNN8X3O7j35hhGcCagWs8fsm0Szrz9DOUon6@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu0ipU7lOMuIQA3HhWry704Suj9elqrZz/gLnjTRxLQcWjbCk
	A8UvEHF/hKMRV1AWrobtvGlHRz1vfDtFB3p/AN5bIfDNJ8uLJFMa1ft3EvEIUu+yhtmLsErQGoi
	TsUBwNmjgn0HC+g+6+74h/hTe9eCOQdbqlyI8/9X0r/waXfI58mwj5+GcbgF4OJrImFBM
X-Gm-Gg: AZuq6aJKTOZWlMHmTAEoSEhsifqosPSOUrGqESTNlAmKhHxnHqjfQoNhGvNSLpgP9Mz
	+mVHsjfXNcIgJh/AjGpgkGms1qR3aZ9kLouSazYX4o3HWz21FT0BzkM3uqK+oj8T+UlwsjQveEj
	tiY0Z9qVclwPBw5QgCEWB/vd3jhJa+Fxc7KZsfP/enaBWGhdzccBbPI80cHl7YyLlFVunN9B/Gg
	b2pfvm/Z+SPfRhnWLneTiF7ljrYo/SZ7sul2P6HQ9x0MVAACwLQfEZjbXrjOpJoGZvG8fYBfmVg
	ZOYWaUkPbjMcGLwJbisxCLLQHwIKQfhEQaxbVXeqkPcyy2elwIiYL90WJG2SIfu9JFDHEcrRvRH
	lDXYSZfxxx4NGJnzWsuc3fIN7QnNtOX3xqvjoV1U11W3QjUUUu0OBq6OfHR9ywy/AX3HUb1ne5o
	TM5Fj47+Jt0h9rOQNgleRIWOmqELLC1WmyJzIwTnc=
X-Received: by 2002:a17:902:da8d:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a7fe745d5bmr29705495ad.41.1769169633858;
        Fri, 23 Jan 2026 04:00:33 -0800 (PST)
X-Received: by 2002:a17:902:da8d:b0:2a0:b02b:210b with SMTP id d9443c01a7336-2a7fe745d5bmr29705255ad.41.1769169633404;
        Fri, 23 Jan 2026 04:00:33 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dce0ccsm19047295ad.32.2026.01.23.04.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:00:32 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
Date: Fri, 23 Jan 2026 17:30:15 +0530
Message-Id: <20260123120016.3671812-4-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8CkaiOOlXO0KEcER8nTwEL3dqiwiD642
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=697362e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JRUVTfR8_6TOY5epFHwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 8CkaiOOlXO0KEcER8nTwEL3dqiwiD642
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX3n8eCypXGe34
 nGumAwAckzIDtTIu+jkrmFcYxYaQ4guCWv0I7FL199UFDnsClEh9tgP0oHv8r1ZGttB6XJs3Vww
 Awc0n3JkSz3bhUuae3HWDz0D0lptqInWoRp2BDCjp/ebWQK4/b3HT+i8fgGZ92KT2YFSf7xlKef
 8KIDVulDuu7w1GTy9gNoielmPumBKdJhhCENwxJPECDXiot5haLQckwZExz/n23K0nujxDl24Li
 cF82PUoySF9nvSE5WKzIqst9USF04c8PwlDqUNZ8yz7l9lcH7x5XIT2hECzlOMJfzcLLYlOHpe6
 5DRwyD1NFWU7j6MbTQIgDULxV0xNDM4esysa99f3B9oE9ivWdj5amIpAjfR+v8a6+QBOWh5QczI
 QK3uZdOXAdScOGDnSsrRBxMxAI8QYIbf0qOSaScwejpZeMZ9jOfuRYWzu70WndAfLr0AmfEzHoW
 BDubpAM+KbAPtAAESbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90341-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD621757D1
X-Rspamd-Action: no action

Document the IPQ9574 AL02-c7 eMMC variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Update dt-bindings to include the new variant
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..28f9a6a166a6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -323,6 +323,7 @@ properties:
               - qcom,ipq9574-ap-al02-c2
               - qcom,ipq9574-ap-al02-c6
               - qcom,ipq9574-ap-al02-c7
+              - qcom,ipq9574-ap-al02-c7-emmc
               - qcom,ipq9574-ap-al02-c8
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
-- 
2.34.1


