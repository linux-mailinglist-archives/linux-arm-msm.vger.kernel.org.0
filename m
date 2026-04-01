Return-Path: <linux-arm-msm+bounces-101343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLCVN+4RzWnzZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:39:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7037A8EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2DED3016AF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD1A405ACD;
	Wed,  1 Apr 2026 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgwkLVsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vni22YCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A523DFC7E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047123; cv=none; b=l4EEvHFJWYGta7TIi6szZxIpcO7WCCpruZyeR0kcgqzymDDSSVpGqXF7M51pn0WJGaWwkncwUS6iIOOTmMJ7wFhIccXAzIyNCUjvy45ZGga7nl4J58y2VHl83orNDc/Erp4xUMTzyxWuW2+GaP0Yoszf5TtMRHfR3i77JzvjVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047123; c=relaxed/simple;
	bh=2u00Tl2FL9G7O0Q0N6WoMtl0BxIb+vAl12QhPdy6m9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dcMa5ripyGgRndQgIBtsVQybEZ9vWrOBN5uT7R/XKp+pT8JZrMM8tRZAtx9H5rnA1VqCFJZPOhR7zSpG1x5LYkbkiWDzY3+RPNSJpaKwhpisAPtbNaUokPdnLpTmhG8Q3RBBdSe9Dax92N3ZSQQTuzdY3Jtkg6FZ4bZZJF6HMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgwkLVsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vni22YCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AGl5c1562579
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2k
	qeXri1tQ=; b=QgwkLVsyRtKuZp021guh5Sg6lyZqodQUMVnLuPHDZDMZqDrASJX
	F1vKGAetqkridbehMD8VjNF+I7WhYNS5YjqRRMPLjUmYD/fmTErFJQk4hc9zZFKi
	+9vCPkkn2z2+ctdx7aHum+EdVizQVDw0ApXejGGS120sCesSyoCrSjLoKzbrA4Qu
	r3at0ALPIvSt4KkFBcLqFntSMWNBVB6dV/6PLuVc5BR19UZeVWl9h6gC7U4quHvx
	vkas16DCkJb06VOsaCJfRPXeQcJ0nOkI1qJ4iHM5iMBvyo/xf3S83lpA7RXIY35+
	Fruvj4GhXMyEanFHb1L75FzleQqSXaf7xcQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sx1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:38:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35d9278587bso4790591a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047120; x=1775651920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2kqeXri1tQ=;
        b=Vni22YCBlxtzFYif/IVPlvHxr0f2oEXL8Xuk/XoJD5YeQfROWMiWEfIfJHjOpY8l+1
         AjIGlcWfmrsRradq3LSsZpiao7EBsyA9xA5EE5kLyUMSqO8KN7iwwunx6uGlVUd4BHfP
         15nuRFVJWgFh10/JydEqZNCLuSoBYhOsYJrlqWGIM/awjfV1DZMliaD2GQi4mkqF8hXr
         0fvF3yWWKkyKKwBDCIOL4kMudwhKVHCBbkUfrTuuo5cUPlLDuTY6LtHWB6juR5T1jQnB
         QH8krRDB465imtIU+Hvczr34g/keVHr7tI7tbEJscJ/kvBAl+kXBlr0nFW1Q1TJwkRyp
         mgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047120; x=1775651920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MStc51dKMihzz7TM9ceokOk1dVfBfD/Dy2kqeXri1tQ=;
        b=MLqMCsD0eRHLvOjCLlVGxolsXHp5sWfS4TcpXHfzsksYLOGwjTYvEDrW9JyzbKuV+h
         KeeBaL9MdKToJm+1CgWqVhEeGHjWwRcfWkhslD1+NYkBMQSiqnQQGMJLpiCYDiyLMnSY
         3J4f/RJ5NORzeSvQCWIDZizc4jkccckpkSyA1Nljt47O9dFSm4weT87nbORLQ8qH4Ya4
         0aTz3nlKWxxdCiGFJWrYL6N/nkrr48EJaYhoOzvcQTm3yYD0gWv9vBow9y6mAQyQaJeK
         u2Tf1Hrf4YNW+2aepxJXp+JVKYvJxDRg2iQF4pqSGlXKd3UPCdXmDu3tqRfUp47y99j1
         sYow==
X-Gm-Message-State: AOJu0YyJb1RSD75AGebKV3g17BvDcBlx75OWDJkMv+XrTXR33+Ugd/Bn
	eKR57iCRdpEXwHnxJenkyZZxaNX99k6th5gcLfHoWxQJvdfCRJgoqrRD9CHyBvcEUBbdc0S5Umo
	4PQhFlkeNfPadSLmZ4fu8bUI+MA5UNn6ZfuFeFZQGN6qhpIeWPmP6HYkfFV8tq1YjO9cO
X-Gm-Gg: ATEYQzypMbXyi8qqfeXlqHZ/vSOJKLZVZY4n2nBs+roLlMsd1eHmSVB4lEaot95/Vmq
	6lVt3tptEFIaWETjCDZ8eEo/6pyM47qXd5A83mvDD5keXiTBpgiIWUnEpbrWGIrRDa06LGB6mwC
	FBM5uWeaBTDZ1xprqt5mDVlHSCVEI80OFW1cqvOtcc5ROrewqo7spzOZzCvhvRV8XznkkwZzvbv
	yN1VYGOGihSyf1k4TMfMZ6ZnD2xsoHhKGZ/ALWOMGWQyFdKbOxm6gImmOFDRMHDYZG+aDoKe2zU
	vgBaUFUS6E2HmlCtYU1Gi4vTDUI7irycl8tsh0wXqb/46+Plw0bsIma/0HoVJF7X7wDkOumfZkL
	UnpmpgpjfDqt49fNuodhkCzKt6qO8ElREqF8W4QolnnKp6hFF
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35dc6e43815mr3780315a91.4.1775047119660;
        Wed, 01 Apr 2026 05:38:39 -0700 (PDT)
X-Received: by 2002:a17:90b:2e04:b0:35b:982a:28d9 with SMTP id 98e67ed59e1d1-35dc6e43815mr3780278a91.4.1775047119079;
        Wed, 01 Apr 2026 05:38:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm6910595a91.3.2026.04.01.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:38:38 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Hawi SoC
Date: Wed,  1 Apr 2026 18:08:25 +0530
Message-ID: <20260401123825.589452-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r3mVY9fRZQY_ctz8bHIataHS9G4kFtkp
X-Proofpoint-ORIG-GUID: r3mVY9fRZQY_ctz8bHIataHS9G4kFtkp
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cd11d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZFHeMJQfjZMagkwiXKAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNSBTYWx0ZWRfXy7qZxDiL7e2L
 IirhAb3fXXGDac20nw+TWKUok9gtkv4hxe2A6f9j1j1GRLvpc6cNpnRpdKZgOjjPTcEKVbvXZ1A
 ij2lmK3JwFoG+hhV9mIlMn3Zk63jBxUIyhvmsl2abZ1KTm5ibEnrw2lcw4EHGjIU8+zqupnLaq3
 DctzbwG2eEN3xBXJPWFIXZuRuPt4VKHz1lUo4DeL4avUE5I2P1X8cUBlUpGw04wLRnNozIhZYVt
 rNL8h1dqd5eId1Tz5lifOef4D/LJOQ+TNolVegmKTVuJ1i6okYlU/mu33ZKcpSrKMwAKoaeWBB4
 FaJzq9q1jXpu4jUdVAK+rpQ96Mv7QT0WHywtmmgiUMheMl3FNy4Dil8+rMLZ5GgG1b7y47N0r2q
 LBtxw6AWe5V/EM3i9zhrPm71czlWabDwXlI7cGKV7HWYDdBJm0YkGeWYI5FC3JIKiAyLb+HFNZ5
 CuFWKuDu0DZsQqs3Djg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010115
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-101343-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83E7037A8EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document SCM compatible for the Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index f628b1d70fa1..07eb9b2c73ff 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
           - qcom,scm-ipq5210
@@ -207,6 +208,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-milos
                 - qcom,scm-sm8450
-- 
2.53.0


