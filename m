Return-Path: <linux-arm-msm+bounces-107520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDk9MTVKBWpEUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:06:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD353D86E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4646B302DF52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A7C3ACA5A;
	Thu, 14 May 2026 04:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAp1mbwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVfLj5Rd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAF63A7F4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731558; cv=none; b=brbbyDD3povSeJrXtznJAdoELpO2+JTjWHlCG+dZTD4/eecQIwPrrq5npINYFGKXwE+JKEajzQ2nm6i/w3uOo75e9Hv+MlBRIzgRTjXxflh4RXN8s/F387EV92pPM3RjBDQnjG655E44rmC5MU35LlHmS8Y6xG7wtG4cIutnViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731558; c=relaxed/simple;
	bh=ijZovknDajNxIxg3LTmBGvrM7bkdi8po4qJvt9/oouQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrTTqU0wG6YiP3PqYSh4POnHQj2nxsV4Cdh05o5y6e5v0xiKTbXIQENUy5NnBTFG4RzXjDl2lNsbLvsvDUul0vjV3qDOlRZ6BFOeqaQjLAfYs8HTuD9vM2ZTo/kY5OZwH8TJCTFlNRb7VL/Ri6jpgG0oYMNh1MTFShOjGZktrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAp1mbwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVfLj5Rd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E21dnC2524321
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=; b=dAp1mbwEC3EFPfqr
	eTjQBm7VyktFRR6h06BkmCD86yqDPZwknTdbkeAMueEbrDpUIDaFXetwHZhvttHz
	sTs9aNbT28JKZhh4aiYUG51Ik25ea8E4svCSTF+jd6RW0mQ5UCwjLEEKaECmN467
	FfxEHu9L5yyH1pS1AOzgTaYvWEjWVL3TJ5jpSGJxxVdp/0yBT5HptsPBF28k+Z9z
	CZHZRsypaRqcJ2kFOs5X0cmFkTddR3BX9noyvBNxwh4QzhfjCtD+Y45sSDs4gHEg
	2EVe2Y/7i42anjAPGKM4ZEzqtdOy+8jv8MDmlLKb1jozNULfJvbvG980I8ASz/tS
	F550xg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjj7qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baedd2fd43so46645485ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731554; x=1779336354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=;
        b=iVfLj5RduAhh78X8vyqptxV1KULmMoyvQTJuVfEeM/98LpOKiGzjbBjlyjttCiUq1l
         33Vij90p9hM2xQZqiECvEEqKjmgCPjLAmXmHJ6fna9L/pBkTS4157qSw6YsQVAbJ0/Y+
         AxHm8BSAbuMBA1dV2eZKEWQ+NfpjgHSMe4q1pdMhPzHktA30b8eXPEjzzxiysxx0Qtap
         eYUHmzOLPNaie6XYH4XKplUnkFBCOrnaIvmqlU59R111gkh6nbUn3W2B43ERtNRx0kJ+
         AxKPwrx7+AwGXRJKDNYUZfFMYR9qtaoZTeFEbmSAqIRUK9Ag128KTuzVisuFg38JvJ0h
         t76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731554; x=1779336354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=;
        b=Se6CjvXwz/j+mYc25tt9C7aDB2pY/tFEGYVqM90b4ULZ3ZJwvpeUsZSWlYI0nV2PgH
         7XvBxmE27wGH++UjbRTF+f4vQTWML2U4AM6aY7Sd5zmtiw560hEr9W8Rx/CnZls6Fz5I
         HnY1Z7vGRsuPZBq3x9Ivb8Sg4zJrx+wZGD3VGjzzh1YR85aZNE9IFnut/MNlHE1hWb7K
         F+RY+B09cOW8u5ENiGdj89e7S9oAqGht1qYsRel9XJ0bPSPPvemnjNC4qbQf5+R7aHd7
         fpBFqMWCDHZ99ABt/V71+OZOCsvU619oo28d+KkrU/eqMh4liqV2PQrGtpCRwpucfy59
         pMcg==
X-Forwarded-Encrypted: i=1; AFNElJ+yU7X9fnnz53lOjBCRpgm48cFqWHnkVJMopDNfT6vMUbxHTDftOrpN14f+QXvZ0zSxnMGzhyDfdVyFarZz@vger.kernel.org
X-Gm-Message-State: AOJu0YwkluJ3nIA3CGyxHyClrWwTJ47cNhRtMtbIgNvEO+N4iyudTJIr
	ctA+9MJY6NqODVDz/ug0oPsT1PotuZKHoMt2EOkII7f+qPOZNMiBzV43BSuVustJUzieUjYLT0C
	wyqSG/I85kOraelzkplSUcm59Ud64UycofVNKWaN531K+PDQ1xrjFXwqVq9wRBb/9ITjZ
X-Gm-Gg: Acq92OGbyZwfc57pTPQhqB7yt+9bpafs9Wk+cszOlOPSIogHbCUba7MtKJNsPswlXWX
	wZwU3DqENBLUtf4Nye3+c7UaaCYNcV+uoRZcOpbrHJpZklkvIFauUzhO0v8Y1x6LjsJmbkoVY+z
	Nx92UXgL5KJOEWDsVNhILfF4UeFOlmw1PdM2A1i+c3ngB21GPhbZxqyehiM1l0jMTjmBUXQkoIl
	j79PI2kh8xdXWk5ZO8zCmwFp+ytbuM2dq/djgP1rhF6w3BB0gjR9VUbIVKfbAIjaNUFnj0pkvgj
	Kn3xOUqmqKi4tX0PfqK0N6l3hKFolpOnuOWRC0qPyiRYwhrO0d74uQQkIAb+JNWZ4tgG/JpWZlX
	9dDSRFZi/ptCzurF5lMAvz9fgFMws/UVjZ8DjvDmEL0l4yioslZfOjuFSNh61QXesbQ3khvDP8a
	pojjwrr3YHu/yPly808l0YSvZv0IMYzSU4d1cT3TbZwT21XTdUL4yAhDo6ymQfQQ==
X-Received: by 2002:a17:903:38cf:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2bd2f70f1b2mr60080535ad.18.1778731553907;
        Wed, 13 May 2026 21:05:53 -0700 (PDT)
X-Received: by 2002:a17:903:38cf:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2bd2f70f1b2mr60080045ad.18.1778731553200;
        Wed, 13 May 2026 21:05:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:36 +0530
Subject: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: NRfr8rMIq0BGOc9lcLPk3UqzpZ-P1QbW
X-Proofpoint-ORIG-GUID: NRfr8rMIq0BGOc9lcLPk3UqzpZ-P1QbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfX08ZcwL3n6J8K
 jkC9haKNft2DSNkMHRnciC0NkS8EGTQVWp8fUYrEo7O4qYHRobJ//e+Jqy1DMpBsUkC6PcROQMw
 H4XBs85pG8INxuKP7nQ9s5csn2QMyUoynPaajbivuGUsA/PjtOjatZMwd1wfeMpBWx/E5OpwYjA
 SRWYDFGJQhotnygjOmt1LA4Cy6rcv9IsFtgZNLoXMsx51GKmQylglzmt636AI82IlJo4kmGypY3
 9dMvYvjo0d35upNJeOKoUvY08yZR8iaI1zmO55mffzLY0UmZmiT0LWIULhJUPTsRhX3k6VJzeSz
 m2bIChLDtn/RXtrHeX4QEsh4salsN2eoyjCtyBtzpflOYHgtUAJxhIxilPNjD9K1gm/MJNRr6Ys
 jusdjfImHJMjfojEGAldHwQglMBKl23mQMwZpGLJHjdcsszrk/5FPGpkjXO2m+oCP800J6kDjK8
 LjHN0hnI+X6QivPe0nQ==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a054a23 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2vMkRBvVivtXAe3DWLoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140037
X-Rspamd-Queue-Id: 88DD353D86E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107520-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use the icc-clk framework to enable few clocks to be able to
create paths and use the peripherals connected on those NoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 3a786a21bdff..1111da24b512 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 #include "clk-alpha-pll.h"
@@ -2602,6 +2604,16 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
 	[GCC_QDSS_BCR] = { 0x2d000 },
 };
 
+#define IPQ_APPS_ID			5210	/* some unique value */
+
+static const struct qcom_icc_hws_data icc_ipq5210_hws[] = {
+	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_CNOC_PCIE0_1LANE_S_CLK },
+	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_CNOC_PCIE1_2LANE_S_CLK },
+	{ MASTER_SNOC_PCIE0, SLAVE_SNOC_PCIE0, GCC_SNOC_PCIE0_AXI_M_CLK },
+	{ MASTER_SNOC_PCIE1, SLAVE_SNOC_PCIE1, GCC_SNOC_PCIE1_AXI_M_CLK },
+	{ MASTER_USB, SLAVE_USB, GCC_CNOC_USB_CLK },
+};
+
 static const struct of_device_id gcc_ipq5210_match_table[] = {
 	{ .compatible = "qcom,ipq5210-gcc" },
 	{ }
@@ -2630,6 +2642,9 @@ static const struct qcom_cc_desc gcc_ipq5210_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq5210_resets),
 	.clk_hws = gcc_ipq5210_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq5210_hws),
+	.icc_hws = icc_ipq5210_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq5210_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq5210_probe(struct platform_device *pdev)
@@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq5210",
 		.of_match_table = gcc_ipq5210_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1


