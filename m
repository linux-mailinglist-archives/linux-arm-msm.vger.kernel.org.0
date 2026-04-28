Return-Path: <linux-arm-msm+bounces-104931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NYZMdKE8GlwUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:58:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6358C482072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8640D339453B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A4F35C182;
	Tue, 28 Apr 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiIf3M9U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2FzOxmX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D5344D9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367886; cv=none; b=ekKV4v/jZFZfrxM8BbKRn5DtXuENFYGzTqBOoOF1jh1FQc805PYveBAGX3FrGaV82cNPh6NPgzO0V5RqvlNMoEgfwDv5OlHZYH7/aOEOwv0aD1I6wJ+kFU4HXQPoV6jtcmHTgfxpztcF/2yKE8xYceHu73g4i+6S4jADL3+uyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367886; c=relaxed/simple;
	bh=3c+McRZYx4r/+78kAYlP+sgtPACiFLMXKIqLAZjPwlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFV2WQ1XJO+oFhcQbfKUf0hVMy+VWuTsok69k/qR9F5ffmQdVZeXoSyHmzcPWMhVoqYfzLg74S4X3b29xdtkOkq5B05ijDmr8SiZ9ypyAUjxslLPTWE+w9XKTU5she2XxCz24MMUVdd3/rd2Qdmejvf7anLUb3HZQRDMRySoE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiIf3M9U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2FzOxmX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9GIgS662986
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=; b=KiIf3M9UORVOl4Ga
	23H6lciOe4uHzW5LwWoG95xrF9vgiN9JdAW6K7nef1NWJfGdtXLc4nqZ3hc6Tyk8
	RmybKOU5M8PR0SML88e+VMuJ/sIDlC6/YgRLRv4vX74ln8WSVvEz238VWMSEzdJ8
	Uy+BVPHrCg9Y6J09J639WF5VVxC/X3z2k/cyOJf6JGvxq6BaLRk6TUOTJhZZs4DB
	JJQnwFzKoVeARYhwoxBCR1JFjNUGptmdqkkNB3zyUgZqwHsDrZO8JEOVe/Qmy0cq
	c83oM45NtnnH3tLqioX6SbXoOo2MCJ0b374nQypGsM4cmIENh/WHQq/n8DJ2Norv
	Zsxgsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtc5n376u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242b9359aso112232225ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367882; x=1777972682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=;
        b=P2FzOxmXdiAHdFml40EicQCjY839ZVjioa5ZG96YBlQkVAIkDB+4tRnrsqx1EHcLnV
         Z+MauHgjpIahMLDEZ9pnZpc6o9XRGDcI/C+UVHtHQtxER1tFAaD8lUpIR03OjGQexSmj
         fu86dKLLzI4UbfaySsgqFIvSMNHQJ2gqbIaHVxp9lZ0cny0tIS7LBBFmp//7joa6B5Lq
         jNqnkaP8SCltFCHV2W7naszSJGjgQ6JfEy7Gxs3wup8JxBZo+1cJfPhcjH3kwopcPMNK
         iF81QcJBlbATmibF2NURHzNPgYIjRLheaPgxV48kHBWXCWepUtvgV2TeBQEB8fuLq4PW
         5D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367882; x=1777972682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Uvhc1RpeZMe01nOe5pZnSd2BAXonK89Da5N+6loXec=;
        b=GgEZ3XWej5mZPyrOJh9cQbHnqzwgw/E2O+5q8c2MUAKWyPtyCJazhFlKECke5kutol
         dKUwwhYH3Dh1eGntw0ZmC2pb28KLnKMTPv2lepnPJTFp0WVK2BGeGxd1w4vFTXvNx801
         g1lxa+ecWXD2R7W0V5fDCESKzsKxCAY86xKS55eMnpxmQid/ZrwP6LWrKQj3eicgXIcV
         I/ZUXyCNUM3Uyc3rYOMu2GFnqn79Fsb6umyVSEWL2oY4Zv/cPlWcFYHAeOWaZNDJoNa5
         0FKM91U4OhKK3IOQQIovjij2sTeZ6nihTgf4NLuIP+bkus/ySRqjvQ+UJIQ5MJ3/OM5d
         xnEg==
X-Gm-Message-State: AOJu0YwMh6wihwd2Pc6orVILzftNmyVVrFd1BxubJy9TvSeDEjMn57HG
	HYD1VdlNnTj6AsSf2BpRcidyGxeBJSkTb5jalbOoWPMJ6JTUn4bh5tSmAlY5JI4AZrh+e8NL9kC
	itV3EueMMuDMZqFITb941OwYoFmDEbxlquLdR1/WFyOsOj850BIqCJ4R8lzcSv2kzL4Hc
X-Gm-Gg: AeBDietMxsNy+jhdEiEJ+Uc4GLl2TCNF+AVHvp10OnucRUYUvy+tBRMnkaJhTllXtC2
	3Blk+Bzwewc2HxLawFE1eFfW57KoxIor463p9sPJeqazGsKZsXIQAqJqmUnBEYRdgx0mrcQvABb
	FylaJhQ0A8Jx13mcOL9HqK4txuAArDKLSqHhei27nFMRQA2Mb8+Wie+4SLqTXesPlTB2DJzt+Tm
	yPUnYtELI7vLc4ZcX1LvhOgp3LrqDSdY0cpt9eh1ez83Hjala25k5K3Aj5Q+bVty0to1CM/uH4N
	+NlltGm+a52ngE6FUufPxcTVLYfJ06CnrGvRBvzk7UDO8+RTpE4Cg9cK/8VzZO3rwtmNYbFF5Y/
	zbztcR6iWPjkdaeuzZ3Jqm0Nfy4y5KGCDJQ/Jyg3Tf36DKUQ=
X-Received: by 2002:a17:902:8f8d:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97c43cd61mr15757165ad.16.1777367882561;
        Tue, 28 Apr 2026 02:18:02 -0700 (PDT)
X-Received: by 2002:a17:902:8f8d:b0:2b2:5491:e32f with SMTP id d9443c01a7336-2b97c43cd61mr15757005ad.16.1777367882079;
        Tue, 28 Apr 2026 02:18:02 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:01 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:47:46 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT
 variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-shikra-socid-v1-1-6ff16bad5ea2@oss.qualcomm.com>
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=853;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3c+McRZYx4r/+78kAYlP+sgtPACiFLMXKIqLAZjPwlM=;
 b=9TydhiPtoGVL8YPYFo/RUN9hpYO+LXbGhL1Fi1Hf8ej18j+Ar5PbSbiPfUss06D+W3qkcj6Pu
 TupYctvlwChBTs9Nhb6EbMQkN2Rk0TscUJZJT2UGWOXsEtUS9/1DdzK
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX7y6PEyztLkDC
 xCUvm0Ke7+O4kqwJa6cKfB+7efp56uBzFKWXxQ+WukF8a0jAYMKukh4ErFbNTlnhYT5rWHSI7K9
 YmUlxfRrDSbGjXMt59Rf2L9gAas7mrhjWAFIACV89P15CojlHNqXYAUk98TuJ4XrGgTlDQzmC+z
 HhoAfRS+QFF0Nr81XmJTMRxgNx5n7blN9rKnPgrUKYLFVVG6kEogDoo4C7Gj4tErDCE+V5QkqDC
 6BVitgAEppNW/+7UqA+nwcFt+UtRduOs0Uov7WMleGeouyUxEOADGsS3OVPXRTFVzNTnpjtkgDQ
 i5OL7Y2EttUd2iYGlLfCdHQCSwPEdtqZhrJwqIPk+vlRb1bSWslZL7ZlfQOfHB6kF6DJnsbshkq
 VmsiUxHw1m14nF3D468rCy5LNXc1sfSK/TQqa7I4xuEoddNy0Ed6sSlLtUml5d/ZJP9QeShnlDE
 841CanMQtaBiSbRp+Tg==
X-Proofpoint-GUID: PsI-UeH_7nlsiEcMTokMT_9m0YJJYlVC
X-Proofpoint-ORIG-GUID: PsI-UeH_7nlsiEcMTokMT_9m0YJJYlVC
X-Authority-Analysis: v=2.4 cv=ZMfnX37b c=1 sm=1 tr=0 ts=69f07b4b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LvLIYPk_e027418G8rwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082
X-Rspamd-Queue-Id: 6358C482072
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104931-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the IDs used by Shikra SoC IoT variants:
- CQ2390M: Shikra Retail with modem
- CQ2390S: Shikra Retail without modem
- IQ2390S: Shikra Industrial without modem

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..c300ffb4a6a5 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -299,6 +299,9 @@
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
+#define QCOM_ID_CQ2390M			756
+#define QCOM_ID_CQ2390S			758
+#define QCOM_ID_IQ2390S			759
 #define QCOM_ID_IPQ5200			765
 #define QCOM_ID_IPQ5210			766
 #define QCOM_ID_QCF2200			767

-- 
2.34.1


