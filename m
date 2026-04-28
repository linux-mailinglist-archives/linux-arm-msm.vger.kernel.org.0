Return-Path: <linux-arm-msm+bounces-104932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF8uEnuE8GlwUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:57:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 486B7482010
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AFA33089D45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727B3371D0E;
	Tue, 28 Apr 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCMrERII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOmdOJcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182CC36D506
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367889; cv=none; b=ue9Yqw0qhe+TU0s9AVEADUS3GfeMiomTdYTJcrktkIpPmM1cJRr/gsT7jtxpeWen/KHweNx3+keamJBme5Cj3fPGcCF2bMw11xdngH6SFDcuvcrtl7SjjImiLkHWFE7HBRR7qPDo3Lf0wKCQIivuJ1/XxZwNRgPOjJ+U9JgW7Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367889; c=relaxed/simple;
	bh=0zmlQoCa7bIjbCwfu9zO8FG/nhxkc2X/El8W20NrRlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KK6Dz1Pyl3FzXaLwoSBkEvkbo4BmJzJ6JeVDsAiA7zIRssv1atE5q/8Lk71MN9dqEbeX3kxW22Fysrzu1kqFTq8eQAW4flqYmOwS/3LT0n94I9HhLEycE4szbrLgJAcEvV4tDgmuNOoXEPeaDgC/eM05mfVqCrn5EJI2ier34aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCMrERII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOmdOJcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42xun1329658
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=; b=QCMrERIIhE5SmPtq
	HLXRru6JqCHuB0c+mFRC4/DhOqLkss1plF4qHxrZH9yhcoB4a8kN9iy8ScDRprpA
	ytnwYXSHQIwiMBLTK9xLeQghVxQqvvZ8jmXG9abuXPV+HHArQs4qJEPIbiWhGiQ1
	vm2X/DlXZPfk2fd+tag/FfEALLywWg27dr44ukd82BsqTOYVID6xH32kBk1+8q/d
	BIwyKxZo4o2YnRjDwcrCNVyifXATra0UpoJGq3vKbNLG54EMqAH2znEKqx7koNEp
	wYA+NdSKXokiQ8nOVe6glHdtA72R1UXEhQ+keaRXoQ4sHGEEyXK8X5ux2MzQZ76b
	putmow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhah467-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24611696eso76585005ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367886; x=1777972686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=;
        b=LOmdOJcxyoQa6KfgzKpKQF6Aso3Q5eR0BYLhb6EYHrdyPCdhlZDSioO2C+vixi+/ZC
         8Jqt2mrsHzEa0EZYX0SF8i/MPrDN0QvPGgPcv6nMQBixzJBmlahkseuA2iNHc+dhBBHE
         6hYvSJIbYs7/ITt/+RS1l9aVvhSWQpuVBB5d3R0m9aQg2qPFIX3CdBGUyM6cJxk8K6Ry
         JBQYBt5BUZzj/BwW4/d/sMvhnk52ikewIVjsJiTTFHf2OFZotehNuNFsmmEYqwN1L3rk
         F8WoWd4AYduttmhbUaaZjYqXerLnDHfdWQCTVaTKrCN/toIyWwZvpf3qDaI8A2ahhJ9v
         QibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367886; x=1777972686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kWTp5zkgbaZx4e4AZmjYa1jMdyIf9wa3QliWzgpJZA=;
        b=Kru21YLS58ExAdQ71TDBhpiK3aUt3xaB3SJV7G2CrXvnE4UXOZBuR6a5bHtirGubnN
         5dJgZRYrfzjfR1bADAuGVQlWcXD/b7I/yXWWCqqtYrGNT7RqUH5u1Na4sv/rbm5bprtL
         VInzTyy7Zln62GEFNR3FKYF5ZDVtrXVmaxMm4W8IlZo2G3xmX+Q206gmlZ6Ij7Vl1OQK
         KBuskL7bVZnGN6nJSPrvFaZE7Ct0IXCxGrcXApTK1T5bQKiUU+i8LlAe6KIRfrZGMH+Q
         k3Vzohom6NlsI4yzx3zbCbaRpjOoDzaInx9GUlFGAKIvR4EltJmtqpmt9Je2ehGxyTUF
         JMZg==
X-Gm-Message-State: AOJu0Yz8Yqn8toe+tmaZVxRMra673tauoDk9Z7Aj0Whiis09PAELk3pt
	soQ4TlCM25vTVnD3kPdzOTM7ZWd7X0ATNWjfyAeQDx7eMr+SJRO8W4goFaS41TscUbATEkpxpGr
	6kIPt9up7+n1z9GaVTdkXj3uXj6BXNxBxMoMuO2owOGGV5+EfRXhabG1fY74rGFZyeEZA
X-Gm-Gg: AeBDies/Ergr1c6xDSRu7hKvM1vqKswMfwKR5C0kf9r8a9+o8dm2u0LzHhTzRZun3fW
	ByyisPIwTJxi69Yn80JQCACXev27m+/JmaIr1C/eWsRwXx+geSmUP0fK1c8/WZxIeuvRv9DwYEJ
	wsBCJgNKjZczCXElSt3eFXtKQaPWVey84NGrme45G8apdmdCc3nQ9XjM4qKmEtPcYFcDLT3VNHZ
	yDUV95ddqwIPcGak/X8R7sS5OjbCoZzo4UmqPERemQy15nXstnQeJxeHdcYQTTBEJsvj01I6FmX
	gSJDgG3FM8mrMA18IGqUDh/I1OHCr9ZUnJA6NuA+prhNpAg3u8zzyrBx726oaLQ8q8eDrdWw31H
	8X8hWXE7Apl1/LoXyoqe2mx9RneYtPDMY5z8kqenfX4LdCYE=
X-Received: by 2002:a17:902:f54a:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b97c434cddmr24567365ad.16.1777367886061;
        Tue, 28 Apr 2026 02:18:06 -0700 (PDT)
X-Received: by 2002:a17:902:f54a:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b97c434cddmr24567125ad.16.1777367885584;
        Tue, 28 Apr 2026 02:18:05 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:05 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 14:47:47 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=739;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0zmlQoCa7bIjbCwfu9zO8FG/nhxkc2X/El8W20NrRlk=;
 b=AiX9B2yXfvJ1ugOFBY63ITFK9TkkOvUz+sotJCNW2IOF2Pqoeq8Imlv5c86YUVz7ZlDrt72lH
 Zt9vVeLvHX2CwwayvrIKPIP5bPdlyozXjGeivt5EmatTKWztym6xAF/
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX9q2TyREflsdR
 YcUT/HFwpkW6E6pIFTO/Scp67IS3x4EG4RT6IvGVhEyXiq+8X3qb19amD6DbI3bPgiOjgiyLWql
 SzG6tm5zHAAdl4MLfy1YjkhtIVDestl6x1FoqvguyO/+XkNXjQ4Eltktwg0L/rmoIqd1erA+Wmo
 VR13ExEtnWbLxg6kkNvujkzds+P6fbuYbA9JvvKT6bs3jY0U9jYwsc+Qd5rmLCyzvpRb2WGGK3W
 ttpFpqnMy7AAIpUAnnMlw0ClmUzLD+hMyuxok0sMJJtsK9eIc9QgLFI8Sl8S/Esw1H9JeQ/I+DG
 a+xx0C2CTub+pVhuse38ArPW1LOMQgnvqeHrbnIVBVMwbbxFh24uUnt8Us9fQBhaKLUr08eDgJU
 gYQqFLFXA+7wDeggSL++FrzsRwHFelOpIg0kVTOWeV2gETHLtLRUubrCfb6IoFEATpC5+e9xfAl
 x8A+S2fhWzC/bEunhzw==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f07b4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NSp3ccVLS7Iw0aC1VAUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: h1e2xt95OUjOQxPY9RMs0A6dZhk2wIoU
X-Proofpoint-ORIG-GUID: h1e2xt95OUjOQxPY9RMs0A6dZhk2wIoU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082
X-Rspamd-Queue-Id: 486B7482010
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104932-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

Add SoC ID for Shikra IoT variants: CQ2390M, CQ2390S and IQ2390S.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..396a9c66b240 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -528,6 +528,9 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
+	{ qcom_board_id(CQ2390M) },
+	{ qcom_board_id(CQ2390S) },
+	{ qcom_board_id(IQ2390S) },
 	{ qcom_board_id(IPQ5200) },
 	{ qcom_board_id(IPQ5210) },
 	{ qcom_board_id(QCF2200) },

-- 
2.34.1


