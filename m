Return-Path: <linux-arm-msm+bounces-44529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94F9A07092
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74BBC3A07D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A33F215F45;
	Thu,  9 Jan 2025 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hQZlUF/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C8215169;
	Thu,  9 Jan 2025 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413201; cv=none; b=GfQNn9gSVogSo86sbjT0cx3ga6yR7zz6y45mqOkMk2nNSS321ykjhaT2FtRUhCMeTuN/f/21hAaiWcoUrRMeohj0yuFFEvHtXrS0hjyP/18xYsdlYYcwfBPiwe3g6xgsRvOtFhCa/5POWjDIkUvqRS7iT5pzWciQbbop/+1aFcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413201; c=relaxed/simple;
	bh=tOar/7E3vE4H/LLBjDZzg2Vl2BRcHFu7zZAMHGjEgzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YzfapIRlCuanapf8/d2kzzz5R0wxTS1NsLRziE/KC5Erev5oCUBQVdN4DEqznj4MF7N0WcyA3yGvnlHpnr3BiO4mqBHysSzgQb/5jrVWE9Eb7WMR0lI75j5hA+twK0baVK5QekcSun7suQL0MR7zBUbTiz6AzPVGU7GAvlNAB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hQZlUF/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097GkN4019105;
	Thu, 9 Jan 2025 08:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XFZQUbOXo2yzc7Qgr1zVJ8LInwn30jJX/YQntf8dEg=; b=hQZlUF/zqdWpsZdO
	F24VNqubfgml+6OUuU0CKTitEVL1a1c8KMnOIzdqGWu4X4+x+0mhPnemZ+LaLndT
	2ylxuBuAUaT5GR2ucMnMx6/elpEGphdc+X0Inf6dGfhm6tUzRk/WJQFKPN3BV45r
	zyMXB0i694F/YV2tdBEEXQP7ct0BV1sMF6q/Rx221PD1+SETQ7DxVR4DsZBvcsgw
	/i9RXLAVqWChofB7b/5atdD7f3Nmbj6teYuuOWxbri9JyGrDUqITAoS37BsGGpsP
	e/xw405jJMG6BPcXBvOetLfxtiepA3O0jGUDwietqdwYguxCFqrmQy/bDnKIkum2
	vRKTmg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x507tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:59:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098xtr0007588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:59:55 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 00:59:51 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 9 Jan 2025 14:27:48 +0530
Subject: [PATCH v4 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-qcs8300-mm-patches-new-v4-5-63e8ac268b02@quicinc.com>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Pk4ZSvbfEs7V93QmHEOPIn2D28f1UDbr
X-Proofpoint-ORIG-GUID: Pk4ZSvbfEs7V93QmHEOPIn2D28f1UDbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090073

The QCS8300 video clock controller is a derivative of SA8775P, but
QCS8300 has minor difference. Hence, reuse the SA8775P videocc bindings
for QCS8300 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
index 928131bff4c1..07e5d811d816 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-videocc
       - qcom,sa8775p-videocc
 
   clocks:

-- 
2.25.1


