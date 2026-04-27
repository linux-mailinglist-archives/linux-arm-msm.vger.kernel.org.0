Return-Path: <linux-arm-msm+bounces-104817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDm/N7+072mFEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:10:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4E4791A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1800304097B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA2D3EDADB;
	Mon, 27 Apr 2026 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lNcNrHwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqdgWBhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B093EF0C2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316966; cv=none; b=VRYvYJMIYTXXS46OuZ/sgwxixqtveMAsn9mA+BVlWcJoBI4Wz73wKgFl3iHxzL7TwkiPyK6GiEW+DWxAWEsCJ95iAVQEikphM4RMaou53LiUdh0OJXdwvGFsHbJI+HJ17kW9ylH/brBVa5BFuGeHJzrVorRUzX/xjMuMqzpGFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316966; c=relaxed/simple;
	bh=xwUA3LOinRz99aXFkNoUESWamcaKaH4TPR2HucSnVJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Diq/MiTw83LJcj8YIhKmDPL9HBbsNy6K0RaMO4noQWY7dKrVXhvhN9bKtfh/+p/kbZJjz+14npF6ZKxg7Rqwp76YqMhiUJzSMoVMRUVvOJvZsCWvKglCSJdEkdtySGi0PKDhyLATOCcovKvhl/JfMj34yBnjQnt1JItr6phhNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lNcNrHwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqdgWBhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RCpBN82383065
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTG
	Tid3qqrU=; b=lNcNrHwPgkYTE0JzH8D6ZgdLbLGqDJcXiBBbQzzczaX367p7Ock
	6lHWXieQlV0UD6yDfiFUyFsAyNX7JKVqCT5EFmooGCIT6aN23s2SY/Ad77E3RC1C
	25Y4OpxHbv5jc6oBStM1ja314LA+V5TepKxT4wL0s9Hj6xohxuaDDXVGRADr7age
	NgiR45Z6gF32Go07coLsoRkXGSXGK2eBhuNSm0drsY2VC4AcukKhg7vauw68MUMc
	Nu9xk/cbFSy/aXNyvuarOMIeyRpWfFPnDe3HlNei2k90/WiKQoH8XKK+jPBTwuN9
	muq9fVFWRjDw3f3jW0RR6DzeXMe0e8bmbnA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt85xsf5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 19:09:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so196949115ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777316962; x=1777921762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTGTid3qqrU=;
        b=ZqdgWBhIa65LVR+XTbjkc30xh70CWuOIzQUFfdE36h+m1qHtmDsyoHZVeyXoo2iS3e
         Q5ZyjBT/iz0JldJqMAzBSZdjXySRVplT5Aze4cG8tqzRYgU8s2Z2/YGxQ5uig9kytUE6
         ZWsRXPKGZGSp0AYgjf13ay6G9u8eg+7IeFakfTH2r26b9C9AO7RLrvxPZDM0N/dJJIXC
         RdQWeYorlxCuPAShBOYsekoDNKQEXwiBiN8aYBUkEbbKWtD7i+yfRg9um5ziFsIpo43w
         zaTq13maf3Ea80IAptXMILmCcIwB+nwGZ/er3FYeTqyJ2pW3fhJdnPNmntZbVRPOWnbd
         F+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316962; x=1777921762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VN5/vWSpUfq9bwbzgEQDNDzFZoAHnVwNNTGTid3qqrU=;
        b=TVBlnzMgBzCPnXPNlzxWD9jdMSYlNYLYb0oqwvmg4AcyuGlnb2zz32JHiaxb9sJ43N
         TTX9X3OrboUohpaa1NqLX3Ua0U61rJkKsef0W79oXdGvcjSC6Feiqz161R0G62MKSqks
         IsDpW0zeSGzc0kK2MCEgJIfwye2WZFg97hlMi/FkfQqzUmFY/Stdd3Vamqmd2hBx+V40
         YO/Se4YEXvEBP2PIMAj7K3pd4fwFJzpq5OaxQ0lRM3cdvpfmC5Dj7KuYzH8HMXUOt0Hc
         DH0sAF7ExM9bHKZ9FOc8Gayp0yjMV/evD7grnze8mvdEt9ojW6RaU3qQ4hMt8njTArur
         3zXg==
X-Gm-Message-State: AOJu0YxJVbAL8EMhdACY0pHfulAs878ji3XRcUOpHMXFMXWirbsqTmrZ
	sNFIFzf/FHEv6cPlwjp9RBzapqQVvNwcxI2njhn4QLuG1fcDr7g4KVHAA3l3OnwcHVB5sHrvnMH
	oZY91m22EKOgRXS+YnJnmw8eeNY4/tnAEG/Iu2YkuD2It3TZImnPNCMzUze21inUnMDDf
X-Gm-Gg: AeBDiet7yZq8uAqyOUSmQekt6umV5gVyHWPUg7Cu6EcidcRljY0GGzBWbTalS+xDdE1
	+cwzB4KGfa6bu5HGvI4byXeHddL3XdHLnXiO/+RVX0pf0ymlMlACM41rAGNGjXLWfTCxJuPcVg9
	G0u0pnO6pNtTd9dqnHlRXX/JACPUOjxBupDyRdr6KPVnZCYIMu4l4Y5GRDNnGlatbCEpuSwVUKt
	cYEV/GmTgWGgWFGOjKjxj8owpLhpWIBDpWOLg+nXUKv6zOBjHgjYvaLVenjeC6GFh1owaPB4QBP
	7r5MeNCVe8rT5OHlF5gztBy83WrCUAPERUJM1Fo4BFDOtOPPNKMSnpafQ+nHjdTHe21XYncMN7Z
	LTXKxHHDbWcxrQQCIslD5s+At2DymqTSrXkpZjJ4tlacoRHxccFk0DgC1irc=
X-Received: by 2002:a17:903:22c2:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b97a97298dmr4981585ad.36.1777316962151;
        Mon, 27 Apr 2026 12:09:22 -0700 (PDT)
X-Received: by 2002:a17:903:22c2:b0:2b2:489a:f46a with SMTP id d9443c01a7336-2b97a97298dmr4981065ad.36.1777316961476;
        Mon, 27 Apr 2026 12:09:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa95a7fsm2232335ad.24.2026.04.27.12.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 12:09:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: Add compatible for Hawi SoC
Date: Tue, 28 Apr 2026 00:39:13 +0530
Message-ID: <20260427190913.3680717-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Zs3d7d7G c=1 sm=1 tr=0 ts=69efb462 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vdJOUiAGeZ4XVXUCxO0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MO9Jnt5b3PYzg-PdNKAsDXKgQLwhKEXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIwNCBTYWx0ZWRfX1zluosEFGfNP
 fane308nm2ixsN84rmDv6G6c6YVp8jWMl0y65heejeKAFb8o/gLLlDtSt+jE3KqnNE+spTh/6K0
 FHyicWEl1nN4pe0uvgqVhDuA9I4J07wd9Kw3aQ8Ym3iaHDOqmEZQfIEB3amWnnCXQ4m87KDLTMB
 lu+mfjlCzaHvZOrX8I32jLC0eYbiTv6Kupg2L7XGXLxbNW9h73Tvx9dJ+3tGpqHDFBHBXdfgSi7
 8NKGxmHF8ZEhRtGS7hu0M3UYMDaf+iQTMF1yU1JWrzDIHZjsWcyEmutAqCtYPqXh1bS+LmcmSt2
 EZeqtrIuO+ed/bdVDJMxxj1ZGHwCxK6QSQxBWKbPfISEFJaQw9jeOfHlCdTcDpTCaWM73QqHlkT
 cG5O4dO8yIKqxyIdmEiouWqeWFtYPpMHWBfc5GdBnkR3J25TUFQRTyzDIzUMmONxqNOugXqwG4E
 zHSsqMw2JZfVN5YokiA==
X-Proofpoint-GUID: MO9Jnt5b3PYzg-PdNKAsDXKgQLwhKEXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270204
X-Rspamd-Queue-Id: 58A4E4791A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-104817-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document compatible for Qualcomm Hawi fastrpc which is fully
compatible with Qualcomm Kaanapali fastrpc.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index ca830dd06de2..2876fdd7c6e6 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-fastrpc
+              - qcom,hawi-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
-- 
2.53.0


