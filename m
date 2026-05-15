Return-Path: <linux-arm-msm+bounces-107813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLtTHor/BmpiqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1254E2B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB489316075C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859EA4779B9;
	Fri, 15 May 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QzHuypwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKBwK7qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C2472769
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842616; cv=none; b=rbShMSdOccX0C0XhIurhuWGeV2bqB4cR7jSf7KyMwIvUKXHI221TJDveVTl0cnv5YUItL3NPljCOVhQSZpVcDW80F58W87W5jgFa51kPBwh2wxI8M1R80pZG1gin750ifsDLh0hnIHVoPd4FK6qGrLZP+VdvsuR7LV/wa0YEY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842616; c=relaxed/simple;
	bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bow//cf8EnJBEOHLVMYAfL4oibIBEgBcq4syBhPFWP2BZhok6A7UUr+sgqEqyPCochrVq2MjM7S1QnQl7PkXoIm0RzFWdrPdFQITYf7ApKACxR6vbV8eHeYD7y31t8sR7w+vyGNo2oICeyJbJ9GBEI/jFj888fzWVl1KQ/qC6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QzHuypwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKBwK7qp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4iFJ14008413
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=; b=QzHuypwnW4Tnb+TV
	3i+wRHhzreroIdtEORdp4PGXjUs/Q5AH/XV7AeqykUKB8t+J8JKDfe2/+CTjk5fo
	3EqbUQTGm2HCdO40VThOHaATFOTZHZF6Upp61jeprFWMdH2pphYTehQfkIMKyY0I
	iDrHknZy4p9BVwBuY6WHaJAWOl9jGordNYsaEOX2vocFXsZTZKxzPvLQnygtL7Tc
	61F4qY9kArEeRtfYcx9Y7Feh+gl4n2oUzqqWFSEbVNKo+czZ3IPvTNVTJwLeGxsp
	RGRy4Xn6mN9kawKTuHfhCjKanMns3yOStOI7onnPvcLF8XrpjQrcuYWMHqvhubyT
	fiop+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stxqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so60496971cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842613; x=1779447413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=fKBwK7qplnwqDlPwYjr2Ztt791Da54GnEwdEnddN2KDM5OusiSuWvNraIrJxQ6CbI4
         3az3gSLMCVWipBmK9lNFiEbqHzK3WQYaJjQx20O4P6NRo7BoNKHlZwxA2EB/55DE224t
         +wAEFhfuUDTRZpMUufU2ozSGx4lfXedD2t2x/dwS/U4UaZOOJQpw5S496KLMWpAQpT73
         CEoNKDBwowmpbhwHfmZ0+F2JXa4pgmnuhw42WwFEIAKAIbZbwu3zpPhDUIu5W1sAnipL
         kOVAJaHYOx4sbnaQGzAOXNZUEmUgsv8whLv4X6DGJqhgsiP5Eh6PiWF7IOUnyz+PtAtX
         +Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842613; x=1779447413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkPfJy0UESjSRY5ynRNQIxd5SdMCMpmKmDZo2BYGsVI=;
        b=siyrPv2eRsmPwfyACRFyeElib+ZXwrI3wweUJUgnjdmPFAqFh/0Bv3SIqcGolLSdVW
         OYT0WQ/jQozNVH07s2F5tqRjCN3R4ixvSLSgeIkqaWBIC/y5vbJD6PpFrEXg3RWP1jIJ
         8BPNxezienka2h3wz+8xEEbJ1lPlSbiftlRukwwXKZu7uhEoDjTaW7hSUauJskWxCJud
         JtmhARMBtp4Cny5W82RgcNZWobBt2oHqCEGsTBnlRDYcTUqiI770XJ2dVa/+t4XAK3Us
         4lshK9qvjdTTW2sktqpuM7hurAQ9pmQHJfFKW+0C2wHHButE8xNQA9QcRKQ3iWU1/DV8
         JoUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8JHa/Vpf96lIspSB0WWBrEYKbQ5Ski+njuTgnanxixuVPTtj+lXyBleBXxkb27EJH2RUmxXDxxFckWqyd4@vger.kernel.org
X-Gm-Message-State: AOJu0YxRYL/7yNvllyr5+sBJqjeugevsWQW+fnTt3oqx+v3lBBJOCMPr
	9bNt7QI40P5uTIkC3ewRmDd9bvEJCVJ/a3o7fyTd00AAxlQv6tIUM2mx0xy8uL/3BXsaETz1VCD
	h6qvKDDdui7PK7vN0eDgi+VKTNAlbOc46u9cbeARMlWhjBcaPJ4KfYkz0Cm/87YkDgsAb
X-Gm-Gg: Acq92OHC2B1QUYVS5JeJQgUJb0/hdVurDB1QGno3mQM3WPfzarFQTshkDFYjJy0gsn/
	0h5sii2K/ZBdSxMLlu/xrHiShTRg+QuopwjcC5tcx0Hn+v6NcMKhn+7NUpKRiFV5L0550AITlk7
	RdHZArGJTzXySaCQS+uWSXanXxmeuhMs9E6SoC5DpR9l7G/MZa9aEMQ3k2Gc2oQokA4FbtHCLW2
	hUpeHHWBPvr0ZVQIOjPuhjNSWigNRT1CjISQmhrwd3t7VtcZW0KDudvu9jGj/RMCCZRtkO3KkmE
	7C61wZz1yvuh1oU64GwAWCDDBwXgg1oTpt9CqwdmRvb32ESiUnr7GtpNxg7ZRc4g+FUT9wu/Hos
	8Kl56PioWPIwOsWWR43Hyp3+BxMX6NbMzyn8usr3Hcxqcq81wXQx/Vj8GslYwYAUL9Dy81y0w60
	chOU7xaE1EP53o0ZZejJ/Mx7q5/5IE9ycujcq2x+QxzcqUWA==
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr43698341cf.55.1778842613057;
        Fri, 15 May 2026 03:56:53 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:516:508b:bf55 with SMTP id d75a77b69052e-5165a276f8cmr43698061cf.55.1778842612582;
        Fri, 15 May 2026 03:56:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:35 +0300
Subject: [PATCH v7 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-1-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYtKt3xVT767f/e8GatW4qi1b551mF4Rul2GLUG2IWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvwLWCZB+oe3e5CSx9Vt9pT8JGtQDQ1/Bmn+
 dvxqQY6mPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78AAKCRCLPIo+Aiko
 1f1oB/9dl8rcVYlxGenpqJJ2qI0jLaM4OJyYbgfr3Tev2ZfXNlsumTgYL+2OrDhvM4fT9qY/iwP
 DtqNtuiHhsZFp0dwXdt7um0kwpPoQs8HDKgbIqFSsIdDV5XZ7F2ERPgoOzkqfXG3RDS2G7DN5ak
 5AlZ9K3gDj0dkUP7GNCcYirN9TzYiTKV7yyewjvvyAk1954iQYoCfBsBEyGlzviPZLyUj6AOE4t
 ZbbXOZxCDXcRFR9Ixew40HX/iPf+vLtRs/dxKa1alolYa4SLCUTcjzrvpp2sh8tqc7iuQOm42tS
 9QCIMD67pthPQKubFj4YBxxfvNiPx21na80A9bEW8JQiGsur
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: yRFQThfN4JmBhatBd_G6GZ8N50Kzme2U
X-Proofpoint-GUID: yRFQThfN4JmBhatBd_G6GZ8N50Kzme2U
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a06fbf5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX0bmR3AjZlTv4
 TLwWwM07fNsnMdIN9ltbOr5pkC1Pf14C7Bs5CTwfhq7XlSLCNTJhCkkXH1gCPM1r2VeaF1TXA7N
 bdvcIZTnC5IfFr2abR72KReYPHggkllaIuKUbQc/Ie0dbHmcfytCJGqi+YodhBUdfrI0FmPQG7a
 mX6NegqnReYUELvbzd21ONSdkTUWHIfM7ox2VkpOD4ZXJK/BUMJVXVoHWWyWr4mgIBGYSfx6IkN
 GVojsHs0Ad1hQGB6hpSGV967wJSHT0cyhqfp32womsO9M0+0KOEiN9669WST42rm7ix2YdcrCqk
 1v4ejEH4ZNFXKyjnDDB+j1ZTb7VNR2vUoprvJZF5GvtFiBfxNyBUPHvr3+Bw67BxtoVBR8QEaRH
 QiJ8SS0yAs+8oLXV8HH0C/eRiNaTeFjHtI7PGjBulmRAI5u/WOvY/b2rvOc8brERD53lEcQoclN
 ppEAtzspW8hwh01IrPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 88B1254E2B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107813-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..aca748e42aca 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+          - enum:
+              - qcom,sc8280xp-iris
+              - qcom,sm8350-iris
+          - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3


