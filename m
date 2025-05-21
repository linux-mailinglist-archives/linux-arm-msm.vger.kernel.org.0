Return-Path: <linux-arm-msm+bounces-58922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D1ABF73B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFBF01B606C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9BA19049B;
	Wed, 21 May 2025 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XRLOf3ew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B118B47C;
	Wed, 21 May 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836502; cv=none; b=Btwil6BU7lQ3Wi4QHaMIduleydFWW266Sb7e7eDCKYBV2XQPZkqnQ782kgKORYkQAdCHE6s5/taaLCz6zKy3Pz0xhafFDxtaVzQI4iCbQJxwlaXaUsxoXbwcQ5HLDLhgt6dbfBED08w10EWzWVfYLM5PaBPwSbs3ZWzNII0k5vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836502; c=relaxed/simple;
	bh=3/iyTvhEMTGEUUPhFMVqWrDj8NKTUF7gusSq9rogfis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhIhgt88/qAShxSJuCY7VjJtwgunxHoWQ1UifRTlz7dioSGg0awlE8EeQRR5ZROFftHkjPLnA9LkWgjC4KtFT9G6N1Kbyzseqr7XRdJbQxHnJdQ9Idjy1odkiMQWjQrhLESWRoYwae/w1KQRXL287eNP+y0x8K5HMgVjwztt3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XRLOf3ew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJvo031694;
	Wed, 21 May 2025 14:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L4k5BIhgS5A
	7asZ5jZXlR/tV7TYlPcMkxSEcntis13A=; b=XRLOf3ewRl82IOj/r2Z+T5CsqbK
	KKkMJdi8kLg8N8HJVvyJdXzNLZOoiyYzWv55KKyIxsOl7nZ9zmdXUEsZMNNQTkPc
	IBuUdtrrDyZPL7ke+eNNTQifOm1dKQSHGiWOJKu01M1XMpKWWeOTQ/thVmV8xCmI
	dch37QBGywEebeEyd4h602h+kHRJPm03OyM1lMD9IRQSX2jWppTXu6pNQjzJH2MB
	6+c2YQ+pmhfA7ULWyzdWJSdG8On5tjgFAvEQhYN1p/UVcLxZO/pZGzGRULvtFwEw
	hettJCb1sfkBSyTpLVLZcohrNNMHkGvQrZq/6KXwMc8KRTt96nK7TBDXQOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21pr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54LE8BqX005919;
	Wed, 21 May 2025 14:08:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhmjbaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54LE8BM8005895;
	Wed, 21 May 2025 14:08:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 54LE8AAY005888
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:08:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 0A72284; Wed, 21 May 2025 19:38:10 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com,
        kernel@oss.qualcomm.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v7 1/6] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
Date: Wed, 21 May 2025 19:38:00 +0530
Message-ID: <20250521140807.3837019-2-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
References: <20250521140807.3837019-1-quic_wasimn@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX8UyjZbBmu0oo
 Lr8fHaPrWuW7vYG5FBwKlvZxGC9aO6Z13XdaU7GaCwSA1nO70YISgeKd6PrOrGqsxpgYloE3gEU
 9ipP0fmVLuED9LbxVg2agEz/pFWDkgQhBMdyjETeUt5B0G83n5vs8culmNFNpvUcSx2SJR/mmMd
 +gFrl+lhsj21gn/UFaGa1G2qgxveCIr+WFcedBvIE5sjF0OkpeVl1tRth3BSMLvRA2HVvNQniMY
 m488iZYfrvD+XMO4sgdEfHEdOvir85FbQ9BiFwfELxep5OIL7uVjghxg+cwnmh0PnKWEfD5PQWA
 PjVfNo0Mjx47h0oJkAkyhYhyrjG0kPcBZHH0KK9RlvyTiqQf0duGw0ZOR1UKoIzkRItV2YZ5JlB
 mnD75MIoHfuWVgx8HiQLBLdnIr/kkVwQ+ugCdcB53w6OzqaLt8zO9VCfBsk+20RuvEfjm2MH
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dde4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=htuHtO1j-8kfaUu6lmQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iqDdQHtw8X07Ao-74X1roxazu85bWC9j
X-Proofpoint-GUID: iqDdQHtw8X07Ao-74X1roxazu85bWC9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210137

QCS9075 is compatible Industrial-IOT grade variant of SA8775p SOC.
Unlike QCS9100, it doesn't have safety monitoring feature of
Safety-Island(SAIL) subsystem, which affects thermal management.

qcs9075-iq-9075-evk board is based on QCS9075 SOC.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803..3b2c60af12cd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -58,6 +58,7 @@ description: |
         qcs8550
         qcm2290
         qcm6490
+        qcs9075
         qcs9100
         qdu1000
         qrb2210
@@ -961,6 +962,12 @@ properties:
               - qcom,sa8775p-ride-r3
           - const: qcom,sa8775p

+      - items:
+          - enum:
+              - qcom,qcs9075-iq-9075-evk
+          - const: qcom,qcs9075
+          - const: qcom,sa8775p
+
       - items:
           - enum:
               - qcom,qcs9100-ride
--
2.49.0


