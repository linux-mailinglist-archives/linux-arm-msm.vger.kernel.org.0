Return-Path: <linux-arm-msm+bounces-76921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57427BD1582
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 05:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 471E94E3910
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 03:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C34527F736;
	Mon, 13 Oct 2025 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsiHS6h/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA42AD1F
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760327972; cv=none; b=fz4RhhS17+waJEztTJtLEj1AdUBfuCU1tsr2Q7045M2xUCjyzLlEkRkR0HkOr2h/0keBFikwTwaBCjOB68DgN08tx1UlvOspnDe21j981YLAHzQVM+Yl1oLJoHfQe/9KjKVWqrY8HKlMAIvgTFCxhyXxUiTHamtqOMfH6MXMVcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760327972; c=relaxed/simple;
	bh=4s97OXsE4t41H2WY4gfLk660rhvi503He0pOltw2Gjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sb8iA0CJnY3ml4L4i7bJ6Px4CaPVeFjmXSnJ2tPvC4ZrmTtX//AZ1ib/Xj8mjSQn/AEcepfLqBcS07VX00Ul3LIaYTtJw7QGGyuilBeYcoOAtZvtu0A7GBI17iwvHXVDwjGxhcw6xq4srC0cnXCy7dW/NHo9UVtE1zAJT6edhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsiHS6h/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n4AF028756
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RMNDKKR886AjMuufIuUKdsSR0GOZWJ31sPM
	ac5ueuzg=; b=OsiHS6h/PXetzJ68Vfd9KrL4bPcXsezkfZvFDHjSke8nPXovoLs
	5NYN1nzjyGwUiXfHvaGbSBOPB6jswbuVxAnRGFpfa22wPFFX0htfrKNS4gZ4+XM9
	PmwyX1RGR/HwnfHD6jyhHe0g4tbs0SQARIC0VXaugmoQDOrcyUOPyrcar8tafBKY
	t2WuEJ+MzNXR7QCh+1BfMFQC8bLMWQ+odcrLPTSI7/f43HlgVBVMx+RR1IjzkbuI
	19lCun8l1FUssEUoHq9KeyLTiURdP6Bua6GMZM1x228w7+8nlfFVxRFc1hJoYfhM
	OcH5AFCCtU5cisdBb6KDljlDs85DTgqBvFw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5b5wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:59:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2699ed6d43dso78278375ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 20:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760327968; x=1760932768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMNDKKR886AjMuufIuUKdsSR0GOZWJ31sPMac5ueuzg=;
        b=HQRjekMjo8GB2DMd/ZG7WmGOdLCGnuz2hcjYyGHJGR+q3nhEYuT6oiRKH0MrTxTg6a
         58Ze4DQOmNxWoYKrqSheEnHn1F62SlX8LC8TNJ1RFMdxykr966FqO2Ntvd8WhW/jCKQ6
         6DETXD+4t9rLa/ocA0QNjt9jGoAN9a8DgO10Ck7+Xhl/X2dHcFdMCRCP57bGzzLGWINm
         FM3gCjlcxYx4YpvRhP3YIIKSQpFFM6C6RyPrkM2eRDFJyDe3USeZXCQ2YfzkjIrg99aw
         5hJ3rZaokgbQeVdXkWbUAAyIVXUIoG4wfzV15SXdq8qSXBjvVcXggbxfYxqqgZih2A5V
         Seig==
X-Gm-Message-State: AOJu0YwbaYCXYM917+YJPGwkzAHUTgwFIz/72W40DeCHHbpYnqwp3qW/
	nVk3u4kebPaa6O94bbP9IxK76dBUran9d8rUb8V+oM4Q+JFJlykgthym5HozACdIM2RS6edabzp
	zUGLvyV0OngOxxKZg+ejoCz9yecBGWV9Ww4ZXK9g2dQg1GObGAnFID+vnE55Yoei3uVnq
X-Gm-Gg: ASbGncvv1Se7Zfe2qcy5ZcSf/XBCOnUs0wA9FQfCVnTUdXLlKdWudpYo7jitX6+exeS
	QZux1gqUssfTu4FzuKquKdoO1WLAax44PnUA3amIg1Xm1P1J9M5BR7jij/3HKqHZV2Vx5KkIlFg
	PiNUyK8hGhh7XUFoMglO31rHPdSHERMSuSbQwY/zCzAvrdbe8J7cDcbXhIppHoASKg2Thv/sKeZ
	rqd4ul9gOowwOmmLoTsqSxi8DPKi/h0zDpwNGuydQ2YBJHf46jU7kLL/34hcUjuP3yLm9zG9uYT
	PkFv5GswUpQ3OrXtZZnaw/KYJHjbDjKdGwiu6+GWblxkZHS/hNdKqvXxvk2T56eskPO8bmwB+MG
	+Hw==
X-Received: by 2002:a17:903:40cc:b0:26e:d0aa:7690 with SMTP id d9443c01a7336-29027402c79mr221611375ad.41.1760327968215;
        Sun, 12 Oct 2025 20:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHVGLZBxpNB4H/Xm0MJmTnYuQju81RnfMPIBs8IrHHp9PZ9c6HxbnrwU84W6QcEl3NEorCEA==
X-Received: by 2002:a17:903:40cc:b0:26e:d0aa:7690 with SMTP id d9443c01a7336-29027402c79mr221611125ad.41.1760327967714;
        Sun, 12 Oct 2025 20:59:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54c7sm120732305ad.10.2025.10.12.20.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 20:59:27 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix bindings for X1E80100
Date: Mon, 13 Oct 2025 09:29:20 +0530
Message-Id: <20251013035920.806485-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 13ykAM2iRO0CX0o3pO9OfdZah_7Wdis5
X-Proofpoint-ORIG-GUID: 13ykAM2iRO0CX0o3pO9OfdZah_7Wdis5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX1H7EsDzi8PbJ
 YpVjfZ30wKjAQUg9e23G3wxygPAnavtqvtJ84fq+6GRmWGVsO8Odv9fKArYjwSDTKBX8++Ye3ni
 PERWTtccnFvQmXXUi0z15/xwOqQBa5T8N4RQmCFe4N9q1B4lmVSUk78rN22gacfrje4muBCfrkj
 L7nVOCoPv84P+wpF2a1gKJKWkOAY2o4qCeMfUurCcAePSeUMaheg1lbFXhCu0Zbej6NTcAHnPXi
 9jIR2gk2vhvKfG1Z0P+zvHSsal/CpmuGDj12U4RHWENW5mPsqtavOwyO38zl6/49gLlnYWTER7j
 qDDNx84Fdrbn5HvYhFNimOidsUtN6tworcIl/zPaIW38XsCPltxmbKHyQzPplXtNdp1xDdT1DuM
 Ax8wgZbWEwd/STk3sfoVnS1grDm4PA==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ec7921 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ojRqNddluEt3zInEAqUA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Add the missing multiport controller binding to target list.

Fix minItems for interrupt-names to avoid the following error on High
Speed controller:

usb@a200000: interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixes: 6e762f7b8edc ("dt-bindings: usb: Introduce qcom,snps-dwc3")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v2:
Added fixes tag and put error log in one line.

Link to v1:
https://lore.kernel.org/all/20251013011357.732151-1-krishna.kurapati@oss.qualcomm.com/

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..d49a58d5478f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -68,6 +68,7 @@ properties:
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
           - qcom,x1e80100-dwc3
+          - qcom,x1e80100-dwc3-mp
       - const: qcom,snps-dwc3
 
   reg:
@@ -460,8 +461,10 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 4
           maxItems: 5
         interrupt-names:
+          minItems: 4
           items:
             - const: dwc_usb3
             - const: pwr_event
-- 
2.34.1


