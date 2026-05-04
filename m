Return-Path: <linux-arm-msm+bounces-105663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPQXCoRV+GmWtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:15:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEF4BA034
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5E61304C958
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6AE29D265;
	Mon,  4 May 2026 08:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDIHqyMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yvb6vStf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496623176E0
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882200; cv=none; b=MeOdrtx8hHa5eH/RZG4mJQh8Qv/qRC8m2oL2jB9haJK58k8VGJnnvGw3Gu4Yy/Sqekg0I9yTyI9yawY6ZuydVNMBUWmbHACfxX4w71WOrGpWqXv4y9fmXaqUcAqsQTd/WeadL66HT93zzMr+EKjDkOMzOHbeprC83jNcQCGmcY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882200; c=relaxed/simple;
	bh=6qhZq5b8SHzeShtJuS8Tcu7cHC/MNTPAlUlPHtvyRtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cfll02qlbBpRNowOI4Bi4GaH+y5iIrYtWyWuOEw1pYRpD4zo4bQiLxwYjMdBlmIp4Vzdt36ZGdGrEJlUw8NhbAo4A0bk6hUITUz+4SpBt6inhLTO4EaN6fCtcnGQBi9ikSiSA5BEDIQZK8pNj8XNdzY6Y1E7YpN9X3YYbGAAGuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDIHqyMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yvb6vStf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DHoC098120
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/
	fqiCXiKc=; b=nDIHqyMvsKhz6nN4+XM9WgrC25a38Rb9BsFbcY0BLOmDFsR66da
	DGVdeVY5j6tAxE+SMX4AFcRR3i7nUg5li3ogxVBHYyaoNkSXoOq+bScp9X/uFb3U
	wV8d2KiWVj6RugqfKrBccuVmur9IaW0M5EeEFr9lp3MuRiomTOk2I8oWZ4k5r+3P
	t5ufCZ9XTu7d8Ev36d6uP1GEciZwoadODp9EprbkiKSlq8NySSZEMe31puWJzUJI
	iKKLmg/iiDB/YIIjDNpnd6xoZx8qzcHhHv8Dz5I+339YKYLNUzhNHtZ9uLiDNHzX
	KzQZSnObum34GmBlbjR5420vBVn2rZPqTTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg4w64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:09:55 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3521810eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882195; x=1778486995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/fqiCXiKc=;
        b=Yvb6vStfwlAL0n0PoS4ZKB0PYpuIdLhv/PFQSyWRetjA3hm2oOS6EWqAj47Yuhv9rc
         x4lHJhU4zGtRhivjJzXYRxIPskGoRzF1HMNSMrnfCu1Xtqdx8BW5Bx3wwNKY5UCQ3JWZ
         n/GALJtOZOXiAod943hPLe4ydyZA5/C45WRLFeHjrGRS8A47mBJiLT+AVWO//Bnr5eyh
         tN28XxsAXStyFVbOscf1g4u1UzGHm8CJOprGYWvIB2C1dDlDNwyjFW4x93e2g+UhajSZ
         Afyg+BBcvyJjxzswZCJLvDCjUakiw8XrOorSyRgi2ZLIUNJBX4jq+Hoy9taskqlmNUm/
         244Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882195; x=1778486995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0ALeNEYrXGxdjvOn7+l1nFE6x+LDkz4A9/fqiCXiKc=;
        b=g/8etoXx5Tge/J6U1snrgQXquzh/z4PE57K0VKh6SCS4j+iYDFvfuehXkWnjqd/CWV
         O9H643J7iFWdjnl6mmqOWlv31moxnJW+yOTVWtfIGP0Vu0ehWr9JrGT6hRtemXf8NqcC
         cZ4YPgajVclWb4TexWFBXPBDoIxg6J9E36O7JuV6MamavHAq3URbpCdXbXG3EgGXVhgd
         2UJpnYERyK8vYaM7+6/WRvczqhv0ULuiKSFdUFFzX/a6I5/dv2Mfd2EB3PomVSBWansF
         qDke/rvvD0DiknOXgBFYAyo8NslGUdv1doSo8OgDAFi77AZtArdJa/6is6AMZAZjzZ+t
         SVmg==
X-Forwarded-Encrypted: i=1; AFNElJ98UYq9zkUsKdYzAwjrOcmXaWsKy1XaSCi5vek7hAdiqlNLSr94lV0NKDo9KPEBRm/sxkb8tro5JduzSnTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9IXZiqXGRfMRhL2GH0L1wNPFBtRNp0pOx/1dztyTPJ5FAriN
	4NYgdv8yTaaVkFBMZgHrpxrERdhOZfSyCImN3fwJ1o83BG5VDtfI9u0UJNzedy1t6dCNiG8opmg
	gwg+qhw8wKXNd1DxX2kdwtl8Sxn9IwkgDoyzmVAh1U75z0m77/ZUZoQaGyGgAsCCHIwRk
X-Gm-Gg: AeBDiesN/XvZ4G4Q659rAWaYHaQYpVA3nOEIjjsU8cKnJCYJPxzKKS9kX25KwGrErSr
	l2Is18BXHIRBpdx9QJ9LpQ2kDnyQj6bVeA02Wkxc5sfTf1UdQZCT7tKPg4PR196z9hiQJaHT5K0
	/YG+TVnZZW05aDdXmf49bZXCvhaoAE9oWLOADUPSwJaYnTdb4kLVXvrHK/Zi84Jz3zGxN80yIVo
	zCypM7xpWkHp6vT9v1X+3YweO/aGb1VLKfaDDrv8Hv2zphuUedl6ZWGdiU6y768bU2peN181so6
	/8lWJlwqrX6awcwnqXv+btI7kl7NrkqgEQ/RExDexbcaTFzat7PrTZlmOy/9Qh1c61rv1l3430U
	Q7nCWu1bktBo9yu6Q0XwFkvN5iRcgCjouK+GBtWmwroN12Hei4MFOhoU2SdI6dKZsqB20liAbxK
	HWOHD516NphxikwYIf
X-Received: by 2002:a05:7300:570c:b0:2de:aafb:fef3 with SMTP id 5a478bee46e88-2efb7bdc7f2mr3480645eec.1.1777882194498;
        Mon, 04 May 2026 01:09:54 -0700 (PDT)
X-Received: by 2002:a05:7300:570c:b0:2de:aafb:fef3 with SMTP id 5a478bee46e88-2efb7bdc7f2mr3480634eec.1.1777882193905;
        Mon, 04 May 2026 01:09:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71bccsm14247134eec.11.2026.05.04.01.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:09:53 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: arm-smmu: Add compatible for Qualcomm Nord SoC
Date: Mon,  4 May 2026 16:09:43 +0800
Message-ID: <20260504080943.825496-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f85453 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gyBjFjMxxG6oYBEMJicA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: QblQwZeI_uQeMcAt8bgigrmrrtusHGms
X-Proofpoint-ORIG-GUID: QblQwZeI_uQeMcAt8bgigrmrrtusHGms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NyBTYWx0ZWRfX7BdX8ZrjSnLf
 /6T4wEK6dGpuM3yojTx1Xl45GUq2bx+Xa/DC5oGbdC9dzYvCfk2PsR0HkQagEEoV5akeiMBo0b2
 Pd1Jp4i5mxIsAoZuAdpeEDSzr7FmvWr69xdx273kkCvUCSi9DZYG9Jb3dGkpoI26yM7YMFciFn/
 SBtcsCbxQaSJ/nlYndm6OkdhKSm4ZOJzc09by1/eC/H7Cb2R+7CEdyKKNEgV1hiLmWpycbDIT7j
 ebbcJtmibvXJ1InfjvxvVX5ZRW8hTTkgh9hK6z48qQKYGNst1K+qsRzL3cLoSM1yYYmZkaVI1D9
 5e0jhsAPrMpIWjmHGwVbiwJSPKLPhWuhcukv30SUJcy4G1KT6kI77tHRB+NUtnDEmTXv+8PTe4I
 5R1m6IjQa0RTJSt0NsjwqOCAidahE6Z3Z0+HoFR04iAnfsGExuadj7ID+CydEBmYDyZ5f7M8KE6
 NRp5gbNMFekmi0y77xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040087
X-Rspamd-Queue-Id: BDCEF4BA034
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105663-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document Applications Processor Subsystem (APSS) SMMU on Qualcomm
Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to expand APSS and drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427011728.231026-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420022452.1239665-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..bf29e453058f 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,glymur-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
-- 
2.43.0


