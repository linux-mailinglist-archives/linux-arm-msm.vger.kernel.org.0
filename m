Return-Path: <linux-arm-msm+bounces-76988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E9BD2A18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6EDD74F0696
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16A8305043;
	Mon, 13 Oct 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SZTfhnpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF55302CB1;
	Mon, 13 Oct 2025 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760352527; cv=none; b=HTTsh1lseH99shi3YW2Z3wgKzLa93UtS0ta2+S5+6eThsZiN4A0K5U9ki8nfPj4LnZkvk4oIUWJY2yKZ2QtungEFXShG/Urs0my7lhYea4bUj6k4gS+FO1XZN373zTOLVVONX+cu4t97uuaZwAY2ew6CXtLq6AFuXBFo8TrZSOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760352527; c=relaxed/simple;
	bh=MMMog+u8JftPetaN9dH9hbEvvzzvY0HtzskNsJu19Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NS6GPp3fe6RWhZRMJvQl2zTu4kgDYUrJY92comCRryTYfQGWKwT975WuyRgBntkGqTy5zwV5gInLK7cAOq7b0pTwXa2kpJqxVX4sTEoXMP5Wvs0zpzjMS5YFlLfMTlrsQ1x44D0+Kfb+q6qPk6ayQcNbPXI/ITuzmKNjjYZAdXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SZTfhnpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAG2kA021343;
	Mon, 13 Oct 2025 10:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=XOr2tGOuNkrHANtey3T1QmgnJfhru2GcUTtG3g7UZKQ=; b=SZ
	TfhnpZ/H+UzklYR5ISfSH5hOZmuUqJ5h5pX5KTPdvWHNFohG6JneZjMWyHgQgfBS
	GHZRukzg/fqAC7Rdv8g/s9qD+vnGsub993uuD/BZkybu0nc2w6ITCUsKYzNhafQr
	GyxfAdYchIyz8Kq3FkfWuGoec1zd//piONisrtqGQVU5QlBWfo2N9k1QwbqA/Ie0
	+FSqEpL4dFwmuPjcgwhnosEH89NFknr8Pxpm2NgCD7rBcVDiur/k9+30OeVEw4HZ
	a/Zvz0V9gY6oyp/MHVtUkJHV0Q3xvg17LqfJ51FMQO/q7THFSAIIOxBKB50GOT6S
	kUhKLBHoPAp/juj8tb9w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh646jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:48:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAmAvI008955;
	Mon, 13 Oct 2025 10:48:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49qgakrrqv-1;
	Mon, 13 Oct 2025 10:48:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DAmAdY008933;
	Mon, 13 Oct 2025 10:48:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com [10.147.241.247])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 59DAm9Jq008928;
	Mon, 13 Oct 2025 10:48:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
	id 00A7F5015A1; Mon, 13 Oct 2025 16:18:08 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for sa8775p
Date: Mon, 13 Oct 2025 16:18:04 +0530
Message-Id: <20251013104806.6599-2-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ecd8ee cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=-1jsOscYHomb0jtPQ3oA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfXzosB/QXqv/p8
 UxoVzH5WPK8cLK85xvM7VFYizkNTXGDy0/7biZHJXkbyv81W3J3rgMndze8N2AiZp53T+NmOlwJ
 rvbeWM/9v0+5BSWZMP8sQSReO5uUsXOuQO83BYJ/L3sPZkM2sv7l7lFiW/0wCJeSBIHWA4SMS7c
 SZYYQxHvct7abznOAU/933YYEpyqK3nNiPZbC0JY5mcNxHupOJTHc7J3TS//bhHoCchFfZ+bX3g
 Jc/jkBOV5Z73dAG+/Chvd6gbVlx7Bz6BOe31Qsi7J7eg23dwkvy9uuFL6oP5qQA/QCf/qIggB0w
 98f4h730Z/nUmFgVMuxLhCVVwV7lQeb+c1aaq0EyvKlYoHTbQGo2mgttEiLlqGMpeKbRWjpvgJh
 CfkbI6Su6YeRQ9cC4RML+lYzNbZi9A==
X-Proofpoint-ORIG-GUID: tgmaQ1v-LJwvE6V5eh4VSK9UJSsZK8e0
X-Proofpoint-GUID: tgmaQ1v-LJwvE6V5eh4VSK9UJSsZK8e0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add edp reference clock for sa8775p edp phy.

Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff..b0e4015596de 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -73,6 +73,7 @@ allOf:
         compatible:
           enum:
             - qcom,x1e80100-dp-phy
+            - qcom,sa8775p-edp-phy
     then:
       properties:
         clocks:
-- 
2.17.1


