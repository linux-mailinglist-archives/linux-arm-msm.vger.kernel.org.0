Return-Path: <linux-arm-msm+bounces-83149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE10C8306A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 02:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B63F44E5D8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 01:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6B1285050;
	Tue, 25 Nov 2025 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WK/PEvpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2501EB195;
	Tue, 25 Nov 2025 01:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764034408; cv=none; b=ChJYNdiKbJpB7h7cLK/Wp+hC0SlC6E7W3gIYUPLv4yjtQ8FvtA40JKnZfpxhkZJcjzP88r5eMhX4Fsp+t4kv2KUQYyCe6ZidKRiNuXftlXRJxCUQzD9G7DxpOGnchlg4B3gnOAmCdphqhC6/kHYKNhFfhqFFn8Hz01DWW3Cj5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764034408; c=relaxed/simple;
	bh=zWDohBuHGCbVaynzSRDxQlI7G7QUQywTDw5l360oR4w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DgX6Id3LhlJ2/JXyWxRoM8cdf2a8j6bG0AHMy9FtsdwYNDDRcrJsnG7Aravpc+XCh0ghBZlLtn4ZndYADlFz8ViqSg5UZkCwN4N1aes3pdcImw938SAvMuU65NlZyQAejChPRBQXuEpQO8PVD6v3Xb43NC5sHcpIOT2qAetlU9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WK/PEvpK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOJrqmV543284;
	Tue, 25 Nov 2025 01:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jW7f0AdjkTz
	8mnJHXkYkYMzOGrGE8Ug51QiY10kxrQ8=; b=WK/PEvpKlRvTEClgq8GMokkmQzk
	/pI+HbaHU7kO25SdMl3521HrSZBkQDApsYX1e/zsc3UQgusRkeniQu8xwKoh9BYo
	NJSR6FdkCULCjDwLw3R/1/2lJX9cpJ7ROpOEVwyzDBGlaxmCM6dIJHfVXEkKWCMj
	U3PDSQNhKODhuz/a3fkqwE8fIGS7Potjl8/l7kXFumP5Jb40nkcSLW4IPVR7KVX0
	WBtJWVBuoNSPpCUWVgGloA65GkEMgedbLzqqpvW/LOlOTEv4sD8B7z+2IpNzID4n
	EsqfDesSLAuTv4+lrEiMb8X3RwJs4YO/NZ1bTSIY1Jc88NaiUmLdvSSoS5w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amk10jv95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 01:33:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP1X6GO027345;
	Tue, 25 Nov 2025 01:33:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68mvfg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 01:33:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP1X5eH027319;
	Tue, 25 Nov 2025 01:33:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AP1X5sT027314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 01:33:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id A08405A0; Tue, 25 Nov 2025 07:03:04 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v3 1/5] dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
Date: Tue, 25 Nov 2025 07:02:58 +0530
Message-Id: <20251125013302.3835909-2-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LYIbBrIvGeIad-rW8bwCbH2NYlH-MKrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxMSBTYWx0ZWRfXzHbTBnLf+HSI
 UCTB1Jn8dI1shHKjwM+QbI1Ii9Jszvm8gQDXEDGq7qIlsZLN46tZidbi4iOYl/7y1Hzw13q/dvZ
 5cwsNlGNQX4HwqtHk2C0MiFWtfLyEuqwHxlsIBGA/MWRe5QAFswaJCG1G+rL5fRenVfZo5IEnWF
 t9xTLn4Z/f9JGl/4Z7iJQBoMPLky/U1piRBDdUjbpM4BHtmCb5bC61eHIn60xcq+wjJoBK2tSar
 6HX+rocWMuFSctTeKgMx3UF7yW9Q5PMY+mWzagpFo7Vcly5Z+pxuSl/6Fd4aBs0UIZ3FkZS8qGW
 sQPHr70vOF1QE2zclVR09rh+YKSJ2Z/HAKKNlSTT0noG7JG1ioA1gBj/NiRcOc5C/VavROs+Bvf
 TGPboqFCJ91dbObM801hAODOpAaP+Q==
X-Proofpoint-ORIG-GUID: LYIbBrIvGeIad-rW8bwCbH2NYlH-MKrO
X-Authority-Analysis: v=2.4 cv=SP9PlevH c=1 sm=1 tr=0 ts=69250756 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=Zt1aTBg4y79HU88dGMIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250011

Document the DSI PHY on the QCS8300 Platform.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..7a83387502da 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -14,18 +14,24 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,dsi-phy-7nm
-      - qcom,dsi-phy-7nm-8150
-      - qcom,sa8775p-dsi-phy-5nm
-      - qcom,sar2130p-dsi-phy-5nm
-      - qcom,sc7280-dsi-phy-7nm
-      - qcom,sm6375-dsi-phy-7nm
-      - qcom,sm8350-dsi-phy-5nm
-      - qcom,sm8450-dsi-phy-5nm
-      - qcom,sm8550-dsi-phy-4nm
-      - qcom,sm8650-dsi-phy-4nm
-      - qcom,sm8750-dsi-phy-3nm
+    oneOf:
+      - items:
+          - enum:
+              - qcom,dsi-phy-7nm
+              - qcom,dsi-phy-7nm-8150
+              - qcom,sa8775p-dsi-phy-5nm
+              - qcom,sar2130p-dsi-phy-5nm
+              - qcom,sc7280-dsi-phy-7nm
+              - qcom,sm6375-dsi-phy-7nm
+              - qcom,sm8350-dsi-phy-5nm
+              - qcom,sm8450-dsi-phy-5nm
+              - qcom,sm8550-dsi-phy-4nm
+              - qcom,sm8650-dsi-phy-4nm
+              - qcom,sm8750-dsi-phy-3nm
+      - items:
+          - enum:
+              - qcom,qcs8300-dsi-phy-5nm
+          - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
     items:
-- 
2.34.1


