Return-Path: <linux-arm-msm+bounces-74278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F70B8C921
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 15:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0E21B27831
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 13:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373B7433A6;
	Sat, 20 Sep 2025 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFag8S1d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA652116E0
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758375211; cv=none; b=bA5VOakgfIHfh8HDjXU+O1EUY+UTUC1Ah0PYk8nauNpdo/Ov9AmbHrognTqxBjiCDG89lELYwpMKhoWuGZ84IxH1yF/L4Luh3HQ4EMc1znQ6RD1ON1K6JOt61oohIMSHMheR9YyhgUGbiWI4tNj8F7pNVUM5S87ZqkSxIoQFlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758375211; c=relaxed/simple;
	bh=F9TNTcJ72Xy2VjV6mYwy+LXLtuaD1jREw8ipqjoUmO0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RCcVKLXaLNiZwhuDjAZqaGtj0SlJvgIoGgS9Qvu+HL2txV49ROL/dgkGi6V4BCcpUBOOTLLnB82CGs6AxkxrpsRJ2cmITRVbrwJfm/Q/HGG9Ox1mbXg12gvlftBvtrJYVyAa+L2cc9YwlvGQTHIk6/XaFW9T4MELti7XUxTrN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFag8S1d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FY05000535
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 13:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wQKOe8P2vr8uFWPix5zvIsvn3idrR/hD0KQ
	7uhrpj7c=; b=PFag8S1dtcbglqAqrkRrP2bzkibX+1yi0racELwU338xbW54JmB
	7J2aR93BTbKfFwm45AihfH0RSd/h7AYy0O4YTIHGjRxHMdwxO26dkqllIL/SSrKq
	H9+rvLV9IJBsw/yrAYLX9SQVrqTvsMNMcJBsRk/WIIEsPdPBFYQSVh7YNNAyf0im
	8mPvSa0iEkOmie7v01cLklRAO3VgJ5RtBRb/73K7i5haLl7FYbl0B815QpwE+2AN
	QO0VNUQ1gPt2cUp+4S9vLZuxo23cvjRM1o5qdtATUK/Q8Uf5MiwANb2/k6d5xOCx
	5q3p/ygq7Qt3S3Fdop0Z93KaEK8LXrxorrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnh1p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 13:33:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce13aso56888545ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 06:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758375207; x=1758980007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQKOe8P2vr8uFWPix5zvIsvn3idrR/hD0KQ7uhrpj7c=;
        b=ShPwfZP8K2MsyJI+jHlMaV5WKJ0oF5McVKqxQdpUVDzbIgJiPUG5zMgYlrbnjDEdfc
         bAbcJ2tfP5xcyZs1/uSYjK2fyhLrG9bS4l4QII8HFQnbRmrq6lzOuUiVbTcjW2tKE9U9
         Nz5xarPsqeEyRKOoheNY7GTzzm7BsvIocIPtuTApMVX7s+4+UeJGqzP+gmGjx5Xpu9Ff
         vZjVTorzHhHe5dIR0dJvLzx1GYup+OGrVMmj5x+HZ5POhstsvuB3Z2ahyJm8pMxoGvKi
         EtsWeFnE8C4f23Wx6nXqhCJK283Lav6xvL9GjKD3TenAqm1lvvYhImrS3uoSYsHcQbM0
         he7Q==
X-Gm-Message-State: AOJu0YzJkWzcQtDamp6Ovf6fNxhTGG87zuqFUNNsp2THSJ/NyIXTVJc0
	nfwe8O9xQ8DIe0XnK/mXjAOkyyQlbg+EmnmuY4wceJSQLPKnG01r+/L99SGV4JO59KyhusMzczK
	jY8+IX7gVz2IZsehMo4rByYXymLDJSeYZSU3thx6gOnlOeC52Bu7hQSznk+I0/Tm5+Og/
X-Gm-Gg: ASbGnctmXzlRs5OZ1VF03F8Fc3KmqYvRTEobMaw/wSeyiviyybW3zdG75vwSejDTuBm
	t43cTj/f0WdJS2XclcI7xhMiLDhUwdMoRrrz8CSJTVD/vGOJ+6skRyT50BAOUOGQ6ZMKexMEGbT
	Mlb/XPFgnSnCvKFnjk0Q8D1O110lF7WdLZBh3c1iimHiaGqH5PXmmzopw6Cetbc9AVmwSqH19EJ
	jGnyR29teeD14zWrbLmQx56wXKMCTl1db6nxrG0u7CRMqnrs2L6sL9rPfROu5a5igLi/ldcDvfV
	cKytnXayaftwLTDKmcMlOz7mlO/2xknbkR1ZPLHV7yqTNr59E2UCa6tdNiW7Vu6YmT/9mPSsPvB
	v4eCezrgcZZp6T4xhJMyQEPAPJO/MFHTzoc9DrlNFfjWC0eV910wLQRXvwwaX
X-Received: by 2002:a17:903:f86:b0:267:16ec:390 with SMTP id d9443c01a7336-269ba447e48mr101206545ad.17.1758375206976;
        Sat, 20 Sep 2025 06:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESKYfIbIXZygaF2oDpOFzQL0vr9vZbzkA5zah17knkO7iUUouvAhI2R+Ga4XBlOwc7OXlIyA==
X-Received: by 2002:a17:903:f86:b0:267:16ec:390 with SMTP id d9443c01a7336-269ba447e48mr101206145ad.17.1758375206492;
        Sat, 20 Sep 2025 06:33:26 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32fbb96f3afsm5375009a91.3.2025.09.20.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 06:33:25 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Document the glymur GPI DMA engine
Date: Sat, 20 Sep 2025 19:03:05 +0530
Message-Id: <20250920133305.412974-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68cead28 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HaAzngDW_a_fOyBJVOMA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VzbbQitQ9bl3qVs7KhJ3oaBbuqgTnXC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX/Ohl38wDLAf1
 jyzU5CR1tNH0OVu/iqLt0yWOZjotMBlCVHz2SG8JxkpX7xawj0i+TBLklN1JZ/oxmLb+yULD+wG
 AR7CRehN7cN0rGlV0Zjuh8VhE6KUc7MRrMEbGj8HwoZvNHpx34QbaSxoX4Mg5LLBB/iLymQw3gj
 V6fs8awy5aQOYLzB0Qeof4VaucdXnbhmTEkfTF9jVD2JRt3lQw4Cv8/nl8i7khV2GFaR/szilS0
 qx9OZz5vQNOdDDnCLNMwcxw9aQTvJdme6D8U7HEjY6D3xeErxG+IpRS5eROsVwM4Ezmrm8wcmds
 BkcxSqpf2Gvmoa08n6Gvfx8TY5nk1YGw5ShMCv1eHCJ8iZ0r2JS9Ccpx3zoQossR/OSBcIls+wJ
 hmlQnS2V
X-Proofpoint-GUID: VzbbQitQ9bl3qVs7KhJ3oaBbuqgTnXC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_05,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Document the GPI DMA engine on the Glymur.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index bbe4da2a1105..d595edae4f44 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,glymur-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma
-- 
2.34.1


