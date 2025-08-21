Return-Path: <linux-arm-msm+bounces-70117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A0B2F46A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7AC11CE1C04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 09:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB932F4A0E;
	Thu, 21 Aug 2025 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTZQF6JW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAC2F1FEB
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769497; cv=none; b=o7XcFl5mkGMXc9mJ8dX7ncbLZMUj3otG5sU2QrxEQumyj8l6JRCOcDRgSu7EKkcN607XizltExTSJrrOX4LB907tfMAkq7Nw+bG91vIEtKTXSxi5aGKCJLwhOcTUqUYoNJcxPoaPM5s2QN+25BUm0okODNl2E6m+lbFs5IS2EWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769497; c=relaxed/simple;
	bh=ekdA9CVOTz1DmJofPhYI0+HcBHPnLV+Txm+2ENdkrHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnHk3iAT9nT5RTDdKDIVIgEh/NSyaiPlQFFQVPSp3W3Q/A2/+zprgrJEEd92NpKKcbx9kv05B7hZHU7LkizgMC88n2LCJdC1clv/WGkuF6HcyjsEOSiYZCAmyzgXLn79H+MIzaslZj9lYPErFts4kCjzdcAv04q+voS33+NI43A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTZQF6JW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7vx024167
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/mJfVjavIoqW9T/ceCVgzgHEhxIAMs4Ha+bWe4V2mM=; b=UTZQF6JWyKAbbNAO
	CEckhQ8WUH5jUPHMkOrnvg0Kb7HHZni+BbQNcdgkrXctZMn3aN9iou480xEw9wVc
	frbMySBIRbYIZK+aiMs9RTQn/l16HSwXoyB2dVFIFmxTymj/SDWzlb8HbZYktwMG
	sloO9nJnQIT5ju+mJGEWWY2AuEz81LXyeC14CPF6WWeJIZ8uyPV5E4MG7KYlF/1s
	RI8GfoD9LS2CD+HfsSEaudSs1pCqkfMURPD5/jUVfcjXPRxZ4c3oiyQmR2zfzjdS
	FRt1NMrLPp4ZqxWMMpQrZ5HT6bt45f+p4Av4gSbRBHBM+zVWFLu1vqQxSe1V1XT5
	+WLHtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ad00p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:44:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32326bf571bso1833134a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 02:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769494; x=1756374294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/mJfVjavIoqW9T/ceCVgzgHEhxIAMs4Ha+bWe4V2mM=;
        b=efwY64hn57Q8e5/1QWcgjKP/mQoB1fcLsaEwhZPOWOMA27NtJ0kgeExC53KQEqAuDU
         GGY8BcRPl4bvfp5gC/J1fd8t9vtrolcjVmPHRGZhhSaaGjbcP9KitlEDFilpHNulkhMA
         Y6F14AJWOVdmuQpjWX+8OJl2beS8z/BWYCUMh8WVCqut8U1CVv5H8a6gZ9E8v7u2Gi47
         JL1BVkM3ewuB5WiXeUjaAxu2cv7d+7wqDAX38vRxekZAutrez2QI76MFotkXPTPJf8E5
         BpXKlxfr5Mo3s98NRCYYqE2/hcWrsRoSstb7k2TPrrFRUpSMj4LdVMdIIMycxnXGq3+m
         48vQ==
X-Gm-Message-State: AOJu0YwiY2nqjNbWWjlpzkCnIoupoodvXVzFcq8wpxGdAW6CNCEePvLa
	QtuF/RmDh6WuQ94yXi+7e1RRkhafXeCteHzh2cu15QSHBM4LzFZ9l9rlad60wL5oUHUxbfNk7Yz
	aOsIJmJWOmk25wb1auQsmUkNxl/Mc8r/ZAHF6vlIj4Dcp7M2ioe/0rV04XOvZCDZ6fEZt
X-Gm-Gg: ASbGncuabND6T+P+IQAS8EHneJjZi4Nvv/1hiehBztqJNr5tXWsaW9wY9FGXyGffFYX
	w2ayF26YUpbzKEM72N9kvXMHMpM0e5GMTRWD2jGWkOyVy5RZrQ4kdw7VmoeKJ6TsDcdIVkDHUok
	Cn2jsqhYS81gmMf9c5QT3M54AEljt/WSaRtM72N0GKaEE9ZQkZOKkg/9XlJ9NtV5w3WpIzGECVT
	yl3wt3nym87J7SwCRpjLjba1XR6EleVcAQnzg/rw++2x6zNic2yAJYlIkMn5AseA8siF2XpOugX
	reMDBaSsZ59cXrtbQ8V7J/IYlUyUCqnd8YgtxzxV7uGDGfQ5bYCdQG5fazR/48cUn/hl62cDvc+
	fc2VsbIAmdY9j464=
X-Received: by 2002:a17:90b:3d08:b0:321:c2fb:bcca with SMTP id 98e67ed59e1d1-324ed0681cbmr2515845a91.3.1755769493920;
        Thu, 21 Aug 2025 02:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN4QGoSOSkyHCDquqO4K7cRbMNAnFqN11llAdnPwRvafPdrmBPndjXdBnrgoZqS9H+rmNwvg==
X-Received: by 2002:a17:90b:3d08:b0:321:c2fb:bcca with SMTP id 98e67ed59e1d1-324ed0681cbmr2515809a91.3.1755769493384;
        Thu, 21 Aug 2025 02:44:53 -0700 (PDT)
Received: from hu-wenbyao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f23d853esm1426078a91.6.2025.08.21.02.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 02:44:52 -0700 (PDT)
From: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 02:44:29 -0700
Subject: [PATCH v2 2/4] dt-bindings: PCI: qcom: Document the Glymur PCIe
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-glymur_pcie5-v2-2-cd516784ef20@oss.qualcomm.com>
References: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
In-Reply-To: <20250821-glymur_pcie5-v2-0-cd516784ef20@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, Wenbin Yao <wenbin.yao@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755769489; l=1172;
 i=wenbin.yao@oss.qualcomm.com; s=20250806; h=from:subject:message-id;
 bh=jt6UG6eiIFzDb1oeF0pFhVGf3jfLG0hsOnnZ5HuEIJI=;
 b=iVAV8bG9k+1C7FYvQNu0ndV0BZQ3x7EFjTeiL0LohmKaBaK6d5AHjlrw1HUjekakwVBfWMLUH
 8CIuZ2ivKYeDQCdzm1zrXjBWXEQgZcZrjChM6VspFo0bMv8qJlyFeMk
X-Developer-Key: i=wenbin.yao@oss.qualcomm.com; a=ed25519;
 pk=nBPq+51QejLSupTaJoOMvgFbXSyRVCJexMZ+bUTG5KU=
X-Proofpoint-ORIG-GUID: mVwrwz6kIZ6c6ARTC26vfr3OngmllppN
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a6ea97 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WgZgizuZlwTqGGW0kXsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mVwrwz6kIZ6c6ARTC26vfr3OngmllppN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyKNYWPjs+usk
 lJ5KGndaWv0V1G7N29PLJ8F2ITI4lYA2Vbyxc9EtJTEuARYqegygwUAAujLYnyrBhdDnZMjVN9J
 KY8tGuI1CxGBCnhSut6IDLXdDJcOrm3NTPNCM/NOtTr7fhGG+7s/j647e4kq+ZQvC4fKuPNhOQg
 AJLX7b4D2eVEO9kyd3Hr5pnWYd32tnZ12nEC5nvv8CuSsUkJdzeIidcQIjF9jgxnUDI/P98ecyb
 VoP+w49JWpF6xm59NzfSSYOBD4fYGERHifMwEy52aoNZI+mblbKY3nHVtvo3LPpFCl2qh43XEKG
 EL6HeW6ItB/iuhLv8LUwKeluUHuljZNN0CCsZam9Ppvms2sm5EbSP4X75WwJgi54F/vIEnd7GYt
 qqnCHWKQNPm7oc/dDKYEf5Sa9vbQMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>

On the Qualcomm Glymur platform the PCIe host is compatible with the DWC
controller present on the X1E80100 platform. So document the PCIe
controllers found on Glymur and use the X1E80100 compatible string as a
fallback in the schema.

Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Signed-off-by: Wenbin Yao <wenbin.yao@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
index 257068a1826492a7071600d03ca0c99babb75bd9..8600f2c74cb81bcb924fa2035d992c3bd147db31 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pcie-x1e80100
+    oneOf:
+      - const: qcom,pcie-x1e80100
+      - items:
+          - enum:
+              - qcom,glymur-pcie
+          - const: qcom,pcie-x1e80100
 
   reg:
     minItems: 6

-- 
2.34.1


