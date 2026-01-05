Return-Path: <linux-arm-msm+bounces-87429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 705B4CF3D78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3D593175238
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76307315D47;
	Mon,  5 Jan 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPOGptQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F5jC64fm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCDE313551
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619278; cv=none; b=EKVd8A8hJbjjVqOHPs9BQAGtCtxM/lsliFEQbo1HKnbYbv3Qen7KIydX4AyRc4Y0GvizxPgF9k76PbpYVQE98BrtsPSZTN7oSCrZffOgnHVWDCWZ3O6yxvc1fGGOsSGLKlZiMec1hKJVISH5wFffE+a/6FoNNXHKXlKuea8ojzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619278; c=relaxed/simple;
	bh=UFVpMdxqB8Go0aDIFeSiIjk4yuqxNQ3R5E9qV1fdxts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1Co0NZQXzagmwL6s6myhEB9sckXo4cSwasHL+BhmIl9O7IFEsq2ttujRhrJYoi2GvlYS+wFQwAXrnSs6zDlrmoO0qpdVOlk15FnOjARtdwVwTRIAVBUo4sm0Xeg3x3ROm6cENq0/MlmVEf4K/m5QA1/3nVZ32RHYDWriT5tFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPOGptQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F5jC64fm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058wAX1594030
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=; b=JPOGptQ9HC8Ozsy4
	//0zUjYmnRVoGcR0t60wT6zvBg1khYqNkL8JSC2EkKTFF5ySo9Zr3jPa9OJenbAT
	xSKJe8KRKbYxICX9EHOndG+x73urHjmbOMQc/agwfqRsQdBtBB2G/tYRQtCLMatg
	nDipbhlcQpfRT+5Vgptv0Fi2fBEux9L8jndpVB+eFJ5KNLfAnvBOozm2SK2DKXaH
	/fpETL3frg9ajQNR+1EegXJQFBgwwYf/WAH2fCs8CdEJxsLzrPeWio0h/OWpRgXJ
	SUN54eSdUBRfLrZDD/xUxTaysbKYiSLxxLDvfQw9I2Uybs2nSUHX/0ZrHZV5O8tC
	IlGp5Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgngr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:21:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ac34c4b41fso1754909eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619275; x=1768224075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=;
        b=F5jC64fmW479Vi9jQ3dwejmAiGlhWHFVz8S9Cr2X7hLtdXZGSdh7Vr66ouRShGWehP
         VT6ZzK+wJjg4QJqJqH5JGYI/CiPxR7UMsEV/UIOnqDFS1yJ5Npy+F9dWdBI8319H0DXT
         Tq08ePpTOSNgOzPtp8p0htTfVEF2aikcoEOjj/VckTu7SkNnBP7rjavS5ezrO8qaesoS
         zZ/WyU16e0UJPPHBkaAL/QACzx6IOaBuuziMfQI4/sIuVrSTXFdOQrcUOQ40ugRHkTPM
         OcJ1ABX9tWxytM/1qdIGwJYqmshzIM6h3M4V13GfcCZND6pEv6XNVoFyPdENAKmR67y0
         Q4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619275; x=1768224075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XsPtTZVK1Z9F61M9EjcIaGrg007+KURg1Ykc7hHGhr4=;
        b=Zl0qpmgevWBQGbH1tFfnouaOIWUgVH0IMGblPSpGuiMqPz66JbDFHbLrni9WmtG1d0
         O/0Q2Wez6y7Us59Hszba9W5Tr8/qTZFPIXYqpgfEG25z1gPxFtqjvl9V+PAObhVdCI3c
         JLpPGHQu3zqR1XNmHGnE2f06A7SOFKCyivgcXuDeEqvwXT/BMelFqHhoVzb6fvlle2pe
         yLmcdhKa6X8cBQEOTRrhJ1mUQV/1eAtrenqlVW+mBcvrCJcKG+NvQgG4++YgcmdKxs64
         wH83h5UMSbrFLFVohaswPDKR9BbhEaVln4uNgQeH6HM3Pb0i9THhf/M1Plwkht0A/Xbt
         ZCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMD8acYcXQ8rO8V+iMbK6xNe62t0w51zDLawanKmgIquflIuar9g6JKgB/rm5sQVedYa3Wy7YepPBhp4z/@vger.kernel.org
X-Gm-Message-State: AOJu0YyxaMpJaSkt3AbG+q0n4f10D3CfE6lA1YUEbaJfTpFDtYsu8Bk9
	HwlU5Y2Y/nADCh34nICq9mg8NEk6MejwoeKgeuUX7y4r7T59j25Pos3H7Gy0sdZwEp9P2cNvNug
	qtxVKZPvC4y8Wyuk8DsmpESpsUi+R4sr2tSmEPBUeirPx4AHR5RwvJQpwsZcPC3CtEEpa
X-Gm-Gg: AY/fxX5G7b4BdzxQS0YA/A3EUJWpXuPZXOCosiqGMFsxbLxZqKCLIX7035YUDl40HJC
	BXMCiorCAAV4UlbvJpVDAQeBuc1qmCoblubl/pmLcMCZesSuh/QLjkI2szKo/myc1hkhFA+3THf
	50fpld6pO28Rz3tlk6gIg+5/bCQ8k8NgUvcWpm9rABS4Gage5KA1c0no8YdVgT2Ijt4M/brXZUO
	SIheqeV6W9XmfYULaUig1uVlkl9qGxWM/oBSeLARPR/mEFsvZ8k9Td5pDfEJ66nQvvRfj5t4SES
	O/AFmyn3Q0BDPYNazOJuKRJZ3G8IvffPTg1i4NPrjgWOwH1I0zVu1j6M9Y6Gt1IQRL+LImyW6lr
	dc0PPsd7lCwACDmhf1HAJy0l8PjkM6DRQRfKukttX4Tcg5pB0xi1FA/E4Q0BK1pvU85UVbh6h8Q
	==
X-Received: by 2002:a05:7022:e01:b0:11f:46b4:449f with SMTP id a92af1059eb24-121d80ea3a1mr5933883c88.24.1767619275345;
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdoZ3uP4i1UEVgcC/YVX5f8TTaRDDrAwyxL78hprVR5p+hE1Tun8eInn4KmIpoIthzC497pA==
X-Received: by 2002:a05:7022:e01:b0:11f:46b4:449f with SMTP id a92af1059eb24-121d80ea3a1mr5933857c88.24.1767619274715;
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:14 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 05:21:10 -0800
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,glymur-tlmm: Document
 Mahua TLMM block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-1-7ac036f700de@oss.qualcomm.com>
References: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
In-Reply-To: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=1086;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=UFVpMdxqB8Go0aDIFeSiIjk4yuqxNQ3R5E9qV1fdxts=;
 b=fdl+WiRyCRrPjKZMOEfq6kCPUUIwDPo0KX94xGI6oaw7q25GAdh6AE6ZI8myzFgd2H7U2zQv0
 N4Cu2tbSX2xCeoiDU85H8KOhdkQswOFR0NUTGCd4kUXceWyTXnUT9xN
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX9Kv+kXSepXUq
 91FktkzMH9ESQ8TPURZD6GWu1U82t5ROu3jzvK6E5b59FJAwIP0yYB7T4LkR7V+rsdHtrKvB/Vv
 ovy51b01dsTGFDVgqcp9XZLdCnliAeOp1Pl11pxmZLCav6AFwZKeLrpYtkNhufdFsbY6+J3TTP6
 wcpdC5lRGLwK8E2z4RQsD56hgly2RQMLgp6diAHJMTvLzXnBB7Q150F5l46+1U/+YkmmI0KJf0G
 syQbZmHl+UdXuvcG5dr3QymKDfE6lFocnd967Y/HO8ql7cxr6ywCipVKB9zT7YlXoT2DT7ClpNK
 H4TjmWsUV6Kse9bnbb5fbNcwywgiUjE3I5F3hMkNY2DH1XeO5/16mRyheimUlzSrT0njKEoVVnj
 +RjNolFmqRO4mc2/F8WpW+BOkSVZqm0dP0ILXIJZLUuBBx/xb2rGxMrr1hl+08NTRKDGVNSSH6p
 JTc7lFoaqp3QGT6iIwg==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bbacc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_GxIMNjxlj-suDvTKbUA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: J1R2A8JlJkux4-U3wZ59EXIZkI2_SzFy
X-Proofpoint-GUID: J1R2A8JlJkux4-U3wZ59EXIZkI2_SzFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

Update DeviceTree binding for Mahua SoC TLMM block

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index d2b0cfeffb50..2836a1a10579 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -10,14 +10,16 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
 
 description:
-  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur and Mahua SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
-    const: qcom,glymur-tlmm
+    enum:
+      - qcom,glymur-tlmm
+      - qcom,mahua-tlmm
 
   reg:
     maxItems: 1

-- 
2.34.1


