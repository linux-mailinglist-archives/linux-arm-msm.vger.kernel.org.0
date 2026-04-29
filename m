Return-Path: <linux-arm-msm+bounces-105210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACoQETIJ8mnhmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:35:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5CC494ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83E2B305A18B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619673FBEDF;
	Wed, 29 Apr 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayMAIMsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jX98IpDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA5E3FCB27
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469199; cv=none; b=Hddkk8XamXX1+BgWpSTOysFW1usZaZiFM8ddT/zNbBbL1JJnBeOmbsq5xby4rnBSdMceZiHUaHh0nMA2ecMrqJRetbhE0LfvLjN9B9Vfnahu1M+9ff0MCfvrB9c7aiVC0LOoOug3vfqke+kmWlz5i/V+H0g4YiniJi8hlZPOIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469199; c=relaxed/simple;
	bh=TWsNgda8GiieojfxzNTcmRnGDRqgLQYd5wH99psLaIM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b8gxZdfPlv9lDKyurrbUFjXOP5e5xhG1GgDUH9rSBHpTcycoD7Jsgy9/YgZm4mEHXUz4HuUlep775Of/5XNaW3nfxOMPCa/Y4vsluv1AHCOVMjVvkClIQVgA8NkkQtwne/zF0vDhty7gnes9GA5WPgVbaCqecmPz8Rvz5mfsol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayMAIMsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jX98IpDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pxux963223
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YWh6Om0xoJ4At8QhzIxPWK
	s+4i1ye3iHifJMEwjvT78=; b=ayMAIMsXtPUmZHF/zTuGtjwwzZsLu3AlOMapBJ
	syLs4ua5I3XC8fm5m8IQpmdJk9Le7NHFBVuNKQiJXaS+gmbn/NDOiHd16/WFM1KN
	T4qTY0Lqpb7v+2n/122cQ92Rl0WaLUfQn435zkkJ3WwfOMpYkNAJzqw+mSF4mOZX
	o1RaI+r2YNvUOowrfvX1fTNo80c67QElUKieicSpCfKJbguF+dyB9ES0rD/PXQzr
	p0zzEYj+NFQNlRq7gsqcORCAcCiXP6GrNpbHOvdEPLlDwJzDFLWFo5xzvkLOb/HE
	Clz3TV6Add4nkeLOYdyATZvV1d9e4HcWBlfMptLHuCNuCUVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4uhtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35fb969a4c0so13426082a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469195; x=1778073995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWh6Om0xoJ4At8QhzIxPWKs+4i1ye3iHifJMEwjvT78=;
        b=jX98IpDqZNqGbXjJzEhQxmzJmE+upuJl8TNIf3gayXYyzZGdl70Gd9PpO7A+lpvjH0
         tUL7x580v55zyvx5eT/mC7CMqx7MxnNV83tx0b4iu9RDIsm+NgYF5EFqkRXbx+BFLQAT
         ebB4wOyXBPk14OQt5T+LjnjWjXIyi+ZYzLwAUXIIg2iAFJY1ztiePKaS74BStOCWyjdF
         BwVGNCMnqAHTvdcVE/HhM0idO6HAi7gmXVoSWcydRKRGNPSQOYr5w+C3pdq1FIpj8B82
         e99Zbs8kaZ2Byv8H2ImwQlxMFif43wD13ebeXz8IfWz/pqkwSjkBy9USS7S6Iz/uvp6q
         bSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469195; x=1778073995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWh6Om0xoJ4At8QhzIxPWKs+4i1ye3iHifJMEwjvT78=;
        b=D6SNujUxBDTgjwc/GxVItYvyFWhoXV9UV8eJihYLnElvtGanXPb/D6t5D88gTAhmeE
         tl/vnWRmOllx2yB1SRvhU9lCGPNzOJvnjfIN3GyhCjDxSnE+mCPMN8MxMonYSm3XXPNo
         42sDwUXJekCqmnzKqxuQwfWUBe/ZnJx04JjfymBlxJ1z3B6QabDdRx3aYP4guIoVnxz1
         HnyUdHKtqQz/N4XGtW56Oe7tq9l8AW+f90lVZBJcdFaJ8YSBXqhTiuTg/p7afq0rZJkp
         Ibnqm2FaymChTLofEodjqABkSvlkP7MLsPaDBmee8sLZS3xn/4h/2wplhTpFKTxcQ/os
         sWxA==
X-Gm-Message-State: AOJu0YwW6nLfJ0NrMcXKoxZZ1i59XTXuyaXrvCiaOHbkG6TR4tfwi717
	N/5ShBhOsEGnIVa1lSmVfxaCQWJgWay0Ok9aDN5Ml9jyFMS95Haq9TIfS3/iw1peYqO5+djVtYW
	xzOf51w92ygjL+volD+BdPUN02sOC3UNsGPQuaiOigJkHtbqoY1WKIbbwKonHrtOENkQ=
X-Gm-Gg: AeBDievP4a27cMD01dK7cN4Y5UML8kEWlI4v5FONMTuyfrn550PDlsAtPHJNGJ0A1t7
	uhEgjyzxtAKWIPdnrtHc2PJwchCAUo323q27wULrTWwL1Lx7n4VzLUB5KqiqXbSemNYYUOQ9tLU
	flcpthRqqzxiqpe4tTfYYe+h8jv/Fmfz6L4BYK7h0e1vw/EuovKOmKzI4ONsiWITUAaDqbIVszI
	e6tUM/pljNZV6gr9hRzyY7J81pVvjopkYSoqxxIqkZQXe9RER8ogAWu0fxx3S0M/hBT69WgCaRs
	RZaN8hz+AF85drP6L7qCv7d9lbI9FvYmeXXPsPltRzsH79RqzkFHS+NmaOrZ6pJO1PeguMGZN8b
	/KJsHYvPkKoXZppcH6q9gVz6pbXcoWYv/1LtHra1Efb8T4HH86IeDMHaKv4rsQQ==
X-Received: by 2002:a17:90b:4e86:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-36491fcd4f7mr7750996a91.11.1777469194671;
        Wed, 29 Apr 2026 06:26:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4e86:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-36491fcd4f7mr7750954a91.11.1777469194052;
        Wed, 29 Apr 2026 06:26:34 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:33 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [PATCH 0/2] Add PM8150 PMIC support
Date: Wed, 29 Apr 2026 18:56:17 +0530
Message-Id: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPkG8mkC/x3MSQqAMAxA0atI1hZq63wVEak21YATqYog3t3i8
 i3+f8AjE3qoowcYL/K0rQFJHMEwmXVEQTYYlFS5TFUljLXdvpRJJjvG8ZzNsbEXRhfaZRr7tHQ
 Q2p3R0f1/m/Z9P8VvR+dnAAAA
X-Change-ID: 20260429-add_pm8150_regulators-a373f53eb48f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=634;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=TWsNgda8GiieojfxzNTcmRnGDRqgLQYd5wH99psLaIM=;
 b=kw/pQYmSeG+EO6iKlZA5+9/QwPju4/NLPHsXJk5SIWDp67HE4HeOyn46PAJaV5GWw2Tf3SDMo
 3UB8CtOQDPMBPyqlICyzslbURaDL3B2vYwO202PgsRwQUvkwZYRNmqg
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfX2fBnsQsTtiBf
 kwatU/5HlkiLwh5k4J/nb5+FCv1LAutuYsqwWIM7MZqpNDMmI84PskEHTc6opQdi75MYVwSo1ZD
 nd3FHeLirMLGm9dmoItPwxpu6JsmqJw3YVxhjtY1mBS/H+0o+AodF5dxCVTYQWA0UzeOaqaLMje
 Oyz17ursRw//56dyFK7GnC9y6tVIpEQWZwlS+4EdKa24fiitnCX75Phoah/jx4XxSl0PfGGzd1l
 sBZ2BVUUoucrpEpU+vloX+w63i5dPRZMbZxFLmAPs+wFIS4uu+0rOWmRPDKiazP8ZIrindbyTe4
 CtvC1FPsX/C8fx9oOHlo3s5bah989drvLtZxv06NOIc5WIPy/pzQfyCNMU/z6vFqFSTFjTg3/4N
 esWonfqzvS0sGWiOTdZzVIEffA6NYLDrfXUyIEJhRJe28kNtLVyhhVktOWD9jsYqXAXcir2Fqzd
 qFOEgd0eboVA0jPlt7g==
X-Proofpoint-GUID: dSbZjUmE-3r_Lcyh7ys2-MoyGGqwheQI
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f2070b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N4TP71FQdQvgXifosQQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: dSbZjUmE-3r_Lcyh7ys2-MoyGGqwheQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136
X-Rspamd-Queue-Id: 6C5CC494ECC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105210-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

PM8150 is a power management IC. It is used in shikra boards.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Rakesh Kota (2):
      dt-bindings: regulator: qcom,smd-rpm-regulator: Document PM8150 IC
      regulator: qcom_smd: Add PM8150 regulators

 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |  4 +++
 drivers/regulator/qcom_smd-regulator.c             | 33 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260429-add_pm8150_regulators-a373f53eb48f

Best regards,
-- 
Rakesh Kota <rakesh.kota@oss.qualcomm.com>


