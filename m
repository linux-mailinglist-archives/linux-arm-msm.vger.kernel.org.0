Return-Path: <linux-arm-msm+bounces-36284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6689B4851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F28F51C20D37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE91E205E17;
	Tue, 29 Oct 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BkbCAJ5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8A1DF989;
	Tue, 29 Oct 2024 11:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201458; cv=none; b=T14avxDxr3aIoqgNc1l7OV7b2KVb97vl4kMM95b6NCxcM2SNIuHbHYRgAotSM3RMMkQ+TEqZP1k837gG+kPXaIPbOdkcx6stzoqBMwTaoVxeTd37xDVFjRQpY7TlcOliCoh5+5EU/FsYTQ1AV78gEBzVbIlCIcXKB+gLyTmBxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201458; c=relaxed/simple;
	bh=3UJKn84bpVZdRjaR0hEJpne+j8aZQh3KFJ+sxOxf7xY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpSNAegRWQL/uXOvEbqhSSBYwXcyirnGIO/EtwaSoQhC1HSBkWSloaxOEo+0yxJjvMf2kdNbeyVPTORM1Gmr5PfIBW/QGZBpEpz/YBmPo+dkBbk8F8stbAftSKONznOOmnu9t66qf4sWqnieMIrgR6M4qtw5d0bsvB1FWK8fhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BkbCAJ5k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T8KiET025359;
	Tue, 29 Oct 2024 11:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	le/AGv0MI1oqSF2q9H5UUeI6HLIberoej2bF29Jj9pQ=; b=BkbCAJ5kJpcN4ThY
	nvyDYhIzTmW5/JgiQQK8SFfGzpA7tiR9zAQ57ZlcGdH4a11H+cClsLAMRWD8p6OQ
	zyirnI7u4biRxsOtgW/dZiJV7Z7vE6MsD8xlweh+cSrBRTtV9dbUWhCL4sebf4yq
	omk/gTn1wjbuxYsR3sg3J6U7c0xPDhnG6Wkxl0/8WKO+m7Z0/LSvWstC6I2WxbBE
	gdXrfY9fC+Amjouzwp60R0c7+yUGLtoSdplgAl7+0PrMICC638zRhATo6OEG0J/r
	7Vg31izSiupOv5p4T63Uh+3238viW7jR8r6uysuwSCVH6LlfA7QViqRPnwiKzKno
	T+0A5g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskk04b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TBUXlj028368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:33 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 04:30:28 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 1/3] dt-bindings: ufs: qcom: Document ice configuration table
Date: Tue, 29 Oct 2024 17:00:01 +0530
Message-ID: <20241029113003.18820-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
References: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pHZ3CHzZx0oLLuxxVS17me3egP1Z3I3R
X-Proofpoint-ORIG-GUID: pHZ3CHzZx0oLLuxxVS17me3egP1Z3I3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290089

There are three allocators supported for inline crypto engine:
Floor based, Static and Instantaneous allocator.

Document the compatible used for the allocator configurations
for inline crypto engine found.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 25a5edeea164..069bd87d3404 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -108,6 +108,11 @@ properties:
     description:
       GPIO connected to the RESET pin of the UFS memory device.
 
+  ice-config:
+    type: object
+    description:
+      ICE configuration table for Qualcom SOC
+
 required:
   - compatible
   - reg
@@ -350,5 +355,24 @@ examples:
                             <0 0>,
                             <0 0>;
             qcom,ice = <&ice>;
+
+            ice_cfg: ice-config {
+                static-alloc {
+                     ice-allocator-name = "static-alloc";
+                     rx-alloc-percent = <60>;
+                     status = "okay";
+                };
+
+                floor-based {
+                     ice-allocator-name = "floor-based";
+                     status = "okay";
+                };
+
+                instantaneous {
+                     ice-allocator-name = "instantaneous";
+                     num-core = <28 28 15 13>;
+                     status = "okay";
+                };
+            };
         };
     };
-- 
2.46.0


