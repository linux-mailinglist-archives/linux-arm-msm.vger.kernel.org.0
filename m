Return-Path: <linux-arm-msm+bounces-113659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OuP9GV+9Mmrw4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:29:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEB69AFE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:29:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AciaaipY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q3szIjtp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113659-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113659-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6F933036AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C7C47ECEC;
	Wed, 17 Jun 2026 15:16:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58847ECEB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781709373; cv=none; b=ggBr1R5D65iNHAnTJVn1/ppi4oBFoZpkiunrEtYTBu3eCr7Mzn2UB2AF+50+gmYkD1eAIY66pIug1VWoMHrh6vxE2vQovEvCSftS+rr+z1UqKmaejHSrFA9N8jwTDGSBA1XpMP0gDWto7eI2hTDF1n7NEl7Lx5emfCAELYmIl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781709373; c=relaxed/simple;
	bh=7MlmLv3VO8vqh/hM90ukRRnh4oXqp6UM51hzXjr3aTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDWlloa8SnBgpHrT5omTBUzyUUss56gra37LvYWRNrH6aHsRUmVGGgZbVGBdyYJ5EGBCDZqd9ToTB7cAx2PvEMu+CGSvP/bVYd9GP4+2+VYD2TkCGLYtAR8h/JwXklxcEbjVgbYpC8zvxPod32V75F/mHp21fFTmrpm8dyTQIB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AciaaipY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3szIjtp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEEXif2428553
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7
	ePatpqes=; b=AciaaipYs4qujRKmsL3jb4xgdH0SE3J/2Ha1vcEvYnw1GVvR2BW
	nnRWJU2dFUXivB7KYgqkUjrm9UGEfKU/zKVV9MldMMdQ9VNp1hlt16ug/Dm9n5Zw
	Epw7BeYipcbnDO+cO2eg6WXek85ZSv9VQs2wIbA4XUB/zSPZKVLFER1ESssGspBw
	1M0Gj0X1I8tIpOHpRGJOn2EeHNoBrCI9Tw2Xmg0nSHL89a6pfHfps0CGhsyC8Nzg
	9v9MehuWo5s/S9KzLFiXn2A+/hP4xPk9A2bmc0CHZFhyt6IfBevefWe5Peg/RIcc
	I1mMOMf4BeDAywIc0YWLfyMW3p5LUS9Ktkg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer3tf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:16:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37cb796cdcdso494975a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781709370; x=1782314170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7ePatpqes=;
        b=Q3szIjtpHkPTf1Do2hhhu5+vxGf30H9LsfQ11Dm+9i1PpNfJfXFDxWKxju2r4y4EDI
         7rhLJPDvkBVotARKZGEabxK0XyWFEKWUcksRPjFM9YuqX41CVXKGdA5RG+7pqTCugHdf
         UzYyc8/vRhaAZkfw+p7i5fXNa5X8oxKHcmPEv6DdOMO1Y6lghSYc9sSHxK95fzmCK72c
         u8efH78RwgqmlB+1Gu1LGx18npf26SxgTFLeUzxYuoUdbs5xB5MeYZeTvEFsRM3Jfr00
         L71iRiQDrf19oMOalO6kGTf8CEIIiSl3f+Qbn2VrqAYDbzVH98CBb+nQI8u2bO6UZvmc
         mdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709370; x=1782314170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKoKAFsy7dxgnKK1cXgVyulJwzqXr+KCrz7ePatpqes=;
        b=q0vH/GdLdh0AHmRCP5vsOnjaGyAsIP1QrdYo9KYvlf+5LVJBkj0tmnwXYJBBcVvYXL
         a14nkTSK6Xh43mfEhcYIg0cYyVXwCQzSgEtP26JEM2eWmbGXUEUhMt5Tuvbr++c7YMZM
         mirvdrFsaXRIsuJaROo2M0mKYXJn5fxoyYqzFkMmczMoMxmcmnewbFrv6taH9BwJfBaS
         YPXi0jdBwZvnmap/39Z1mdEOpKN4XHITdwmQi2fvEoh1tCwcH/IJhFJM6mOJsaRl5v3d
         3Ee8DRpniVfvX77TH7sI4qPflUN9qAn3XN8oiohdIIMvTiv1eb7yAwq8ZuwVWHQ5laAd
         Zj/Q==
X-Gm-Message-State: AOJu0YytZwpW1WkLsey/q7raMy+fvj6n+pa7x47yFtjdqU3sGUgJ6kqj
	GAfcmY8xqGsojInwNKRW0pABrMoQ/RafjjAIQCcQE/gYeTYf7VtuUCeVg8wQIbSwrwRhbKJ3EWl
	nmvBY0Dc2pGg5+jXwSntIZkVKARHflWr1NbI/vHfH84burUxy8qqQVXI6CJVYnSEEplMY
X-Gm-Gg: AfdE7clmgZZQ6+DN8fIVVzo6X8i1sNBb5qjfGBYcRXy5w7cYzgTcwGr2y/U5OHumqsV
	ibvV6fvB9FaWMfu4tvLMtcOuRBkzKYg++v8tg4YBVV2B2oY/EqOMBgsfOI7cPeVvJDyU3LaJvhP
	t+t7mATdxtgxqZlJRBcU6XLsApSCw1Qjufwn6GDexDdk0nwgMONl3KJvQXtrfJk/EhVQbyIa0qI
	0PH1c5pv9u21jvO+jjj4rGeHbFwz5dqxpANGPwS/M8GqMTpkIyVIgeTllDY9d4pyNqU+Enip97p
	BYV3HbUHBVhOJhEYOpGHIa/R2Jha7grZcf+bFvrhSURwGxfrtnhaF09rjfC3q1kNqMBTxAjk59V
	s7q66zgJymhyMUjiynfM4b7stuYE+H8weXAEMbA==
X-Received: by 2002:a17:90b:3e86:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-37c936bb27cmr4522836a91.14.1781709369402;
        Wed, 17 Jun 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3e86:b0:36b:e8b9:46a4 with SMTP id 98e67ed59e1d1-37c936bb27cmr4522792a91.14.1781709368801;
        Wed, 17 Jun 2026 08:16:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521a959bsm6533307a91.2.2026.06.17.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:16:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm: qcom: Document Hawi SoC and its reference boards
Date: Wed, 17 Jun 2026 20:46:02 +0530
Message-ID: <20260617151602.2018579-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K1bvUYyYyu_KQjBeWkgEkCS5_zAiU8wU
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32ba3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wnZTGxadBF8afskeHx0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: K1bvUYyYyu_KQjBeWkgEkCS5_zAiU8wU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE0NiBTYWx0ZWRfX7b+UCgcyu18/
 NB+hK+IueX5EOScPX3AnET1/ZfmgajaMon5zpnuqL5yNGQqjR7311d7yxGyHRJYkR/LACJn3PCP
 vkD0Ku4reA32YidC12VUb2KgoIXJ9ho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE0NiBTYWx0ZWRfX4Ka9mI2+Ud3g
 h8cgycm5vGExNFPQXRFbvOolfd7TKFnHMJAFrBetX9m7X6ybEu1y2JuSiFOkc+ZJMWOz58ecD6L
 MllDXk+8l9VQtxLSPKwBfPJn6le+uQPfCoRp2MYkxxmyPFumfjtq5ehzQc5QOIBpflD4/JKIo8u
 ZWPX6qB8yo9Y9Ef6pJ2+IRGLdZJ4jX4yf9eA3e2ZwxSGC+vJZLr7/smDRuI3GplXy1YIdniBYze
 cjamgqD6ZWbjuEHtrHn9QyOMxWpY4aUG8zUuJV7eK8pvnfWJQyGPyonOEV71mKLKl0Q2pyqItQO
 7Bu17jtoXShj6MNhU+cxrFIoeKuhMYPowQR6dBZRC2EheuDvMwbUrSPIy2MvTO40rrZD/nq0ra2
 GTLTvSSD3fV5s9YwGy4mPUmiPHfcFs2gP4oKUbz99ef9JWvtDkpvaxw5ZdSzJcHmG8ldO6sldeb
 IJtuk+Bt3oyJzQWu47w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113659-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BBEB69AFE6

Add Hawi SoC and its reference boards to the Qualcomm binding.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260617080147.1657632-1-mukesh.ojha@oss.qualcomm.com/
 -  Fixed the position of the Documentation.
 -  Corrected the commit text.

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..e229c0097e6f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,11 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,hawi-mtp
+          - const: qcom,hawi
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.53.0


