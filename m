Return-Path: <linux-arm-msm+bounces-94589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOaiE/ffomkV7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:30:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A231C2F95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E2E30FCD01
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA86392811;
	Sat, 28 Feb 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gs7Hhh4/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xeo2dsdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D25F43CED1
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281764; cv=none; b=es0910IrDFPiev3UhwVM109MjzArC8NL7akleSPf9OpLU5941j/K2pbQl8wcTctfK2M/HNHolkSnBPau1OE7tA2FKCSGcoI2cROqlOO3xNDcE/VhE5JWuE2SXyQplxq50qHeyYBFosawinIUyQ5HoJZVWLwAauWCq3BPq9KLWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281764; c=relaxed/simple;
	bh=NojrhXzeuuQdz6Oeg1EabMEIS6kN72TmCV5QcWXGEI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdACrZtq2Gw4587gMXBAFROY7ayvWi2JAaC8AA+gfohrAEYULQPmSS4CUNhFwvJSLk/VuD5Jte6Frqes2l7xP/9daVPhCSzMWH3QA0zr5lIuMM6Ot2V88iocK1xtoxP4axiBy4m9c7bZMH/ZZcOlxn9B5dw7AVElqnJhvwKQrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gs7Hhh4/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xeo2dsdv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S90QwX2088519
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	226N1LW4x8TRys3IYroS3MYxh2aYAuPV5r60E+W9pMM=; b=gs7Hhh4/EvA5NPY0
	Syzs61BIgFVMkg2b4ROfsWUx3H7sjLmm33IWTrdRWYTipvLCjUXgrHoF3tN3Tufl
	2960rZ/DAZB87xb+AiPBBswrYzjlWIaO13g0pNKYjC+rVnIHoRsIHiPWltU6nQlh
	NlgReBMwAiSwLrvt76zbwixptYVYtgM0AKiaF15PHJI6Tlt3fUkP1VI5q/EbjvRd
	85yjvv3L4a8KeeghuuyQuQqPZ9sN6O7r2yxGSoSnxNtIFy+o0keChiOE7N3iW3Wn
	CD9GV3rb7mJNoBVt+nt0MwrrXQLmi2VQsgK+aXtfrMaRZt+TfYBUIktkgGfszAva
	Wn183g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgrrwa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 12:29:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adaa9c4b89so43442855ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 04:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772281762; x=1772886562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=226N1LW4x8TRys3IYroS3MYxh2aYAuPV5r60E+W9pMM=;
        b=Xeo2dsdvhHZJ94RPDUNlpAg+a1v/rt5pDKRJadaNp5RlWUsgaumH2Tzxy4ZgRyIJiR
         cVALFlQ7GkW9ukVlhsiYxRdKN1cWTh8kNIQS2+Kb/DQ3JMWNGN5hpktaf4sRky+nMKKf
         swwH+YWAWgvWPjDjKf4cV+FVlmLRofBOnvt5w987jP+WSDDryEEojHRnqsMRnQBFDVSu
         mgDBP+O1jkUOglqaEHTzjKZIiGqMt69aGM64dmf7JRJpndnBBOj2SzocsygzJ+r2xXce
         GJo4spODnAKcw6T2DKW7HCGvCX8CsmYYaY3olg7+By2rUp0fECT11mJooCTrhZf8C+cs
         KjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772281762; x=1772886562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=226N1LW4x8TRys3IYroS3MYxh2aYAuPV5r60E+W9pMM=;
        b=Klruw4U7pLrRe3NPip+/T/TbmuRcczsVWiLBttwJcyxWHBOSYizV/QvihGJBdTkf2Q
         UL/WBOmkvBeL0RETcMRIILN+yl3PTDHY8QuRha72I/aq/ZT67kBG5Lv5zPpkK1q30Qp7
         MxCXv65cvmrZdkIh+bX3eBMcC19PCw7eA3nr02ZIdNbGGLJ54TJsI9aYv02D1cn2WRoI
         ydOnacrsy6aksaPcs78Gygj+EHtIsNvZHIG9WiRW0llbQ4COz4kNecOJ/6Z+oTz0/Tic
         SMul5+kkEEXoe/WTLvwgDxd/MGIq55M/asdO+QsyHKLaeWdMVKs//ddk4p5EJvpZ4He6
         z+3A==
X-Gm-Message-State: AOJu0YxM4t5YwpRJkhQRO0hRHiK5i+L43z0jBEPa4viPDa6migoxV4ip
	d6kcSo+Q3yL1Mo11pke26bL1pW5eK7WHvxkQ21z8rjVi+7WNOGMI/Y5c94JRgdBdSIdkAfTCyHP
	hY3bomJNUcAQDrVfuVoCUCL0HJuDKrPlDewLwxE4fvVDGs/S05M5+GM8+7ytwIK5WVyN0
X-Gm-Gg: ATEYQzz+tDXHwpIdtpR+wwmnvbBgqAA9WSH0MQu8C/puIh9fBbQRPz9zPAhdqmrbtkN
	R7BsMAHVupe3j9kx2zPDfWIh2LU+d3zzgNrnPiodAyohfU97L7+OWpQjtorocn6qM3KQnRrkaNl
	CuemuqEDIQsMdwh1jfrsl1eooSFx0JWSLykI3HdD5v0UzycC+TZY5LiazmeXXRyquhxkWKjsFhT
	voddEuZ0xUtYznv9RKZbulLSiAfxpipW9p/1Ff2lSsg8BzsxtqeVo9sBVFe9q1iVntfhO5TEDeQ
	L3aUeHkmZMEvrQ4cR0SqsCYgRaMvpuTepZj7iK5HPufYn/ZYUbTMkAdHoiS50ulqtSr8ZWvM8Or
	Ju8FczW3prTafu5PlK+3PifePPUouKSAk7VvEAfIugiaR6/vQgjjfQ53vFUa3/xIH1NI9brG58I
	B5QbBf5bcNn5is6bHs6tlVPS/jH+mAiwyXobfoSnCwy3ehx8N3EQlAs3xS
X-Received: by 2002:a17:902:f141:b0:2ae:3dcc:eb13 with SMTP id d9443c01a7336-2ae3dcced6emr8145805ad.22.1772281761947;
        Sat, 28 Feb 2026 04:29:21 -0800 (PST)
X-Received: by 2002:a17:902:f141:b0:2ae:3dcc:eb13 with SMTP id d9443c01a7336-2ae3dcced6emr8145635ad.22.1772281761461;
        Sat, 28 Feb 2026 04:29:21 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4e10csm8130048b3a.1.2026.02.28.04.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:29:21 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:59:02 +0530
Subject: [PATCH v9 3/5] dt-bindings: watchdog: qcom-wdt: Document sram
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-wdt_reset_reason-v9-3-f96d7a4825d3@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
In-Reply-To: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772281742; l=1600;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=NojrhXzeuuQdz6Oeg1EabMEIS6kN72TmCV5QcWXGEI4=;
 b=CFTIYSZeKBPHHFsteuDSiDp3zdW0bMxdH71ZPhiaX0yU0gW3awcBSaUEdmnFLk7zX7u7AZN4N
 GxNCCRh9rLKA+fyNHoKYbL9vCQBamQH89lK28yqbMyly95qXSp4IFZG
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDExNSBTYWx0ZWRfX6MMo7Ooogp1+
 V9N4rpncWeRXJkg2d4SCPkRkK4u0zVFwyN5J3XJOGAIBBqD4W0aLQvI37VzJLoHhQrjDRCSzmqP
 7DwpG9g8ZVBpA3JYPe6u1JdKpfZFhClZzxoUmSgYUR0j39EruVEioQ76tcdaJJJ8MyxCXylHfN9
 OUShbmymKvA2IZaVzQuFKNMF/oR+WB3SJJw+yUEX/NV9KcmoqNWAIfe6f1ciQdq0JBbKusVIWRG
 7vfUVyMLa9dd6mX3xyLkyIgOpAcK4IkJ9i1LLTQbxir9VzKHHLBqdaDTpsvAW5oYhYvcWC/18Wn
 5w0wu+mFhKG0hJqcNlAClq+VYSPI9AbsA2wA93QCbwKN4ox+Ci1jX01JrsJ1D/v7O2Skhpu56tF
 2vl85K0IVoJa10Nppsu1KsYTqFXQhr4A7vWs8Si77ZaprU2mqMw1hqZTQFHbf4fgxB0/McbR4sX
 0qyZQqzs8DkU9I2mbcA==
X-Proofpoint-GUID: YVHeHGMB0514Mb10bjweReM_vIrR_vAh
X-Proofpoint-ORIG-GUID: YVHeHGMB0514Mb10bjweReM_vIrR_vAh
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a2dfa3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bt_IPO6jKyPzq02bTywA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280115
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94589-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A4A231C2F95
X-Rspamd-Action: no action

Document the "sram" property for the watchdog device on Qualcomm
IPQ platforms. Use this property to extract the restart reason from
IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
entry with this information, when the system reboots due to a watchdog
timeout.

Describe this property for the IPQ5424 watchdog device and extend support
to other targets subsequently.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v9:
	- no changes
Changes in v8:
	- no changes
Changes in v7:
	- Picked up the R-b tag
Changes in v6:
	- Update the 'sram' property to point to the SRAM region
Changes in v5:
	- Rename the property 'qcom,imem' to 'sram'
Changes in v4:
	- New patch
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e8316ae88f8078a86043a6d04def8..3ead00da3cd6ffa0f6102179565723d4ab6c2929 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 1
     maxItems: 5
 
+  sram:
+    maxItems: 1
+    description:
+      A reference to an region residing in IMEM(on-chip SRAM), which contains
+      the system restart reason value populated by the bootloader.
+
 required:
   - compatible
   - reg

-- 
2.34.1


