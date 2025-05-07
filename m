Return-Path: <linux-arm-msm+bounces-57065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D85EAAD669
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FAE1BC5397
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4400F213E99;
	Wed,  7 May 2025 06:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VwK4ih8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDDD211479;
	Wed,  7 May 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600695; cv=none; b=gdNkyXxEcS5+iGZazODpK5fGHME+YxZ5kgjfGiABJ+sukzXcOu8rSpY85A8MVwIg0aZBNeWo30dpsl1LqLxkbE5U4g8SnDt3mNBAb57kmLbEyYnhnbDQxEVXFfieL+pURPwEryxBVopfqvDHniBYT+FnFdb3C8MddRWc9ljs7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600695; c=relaxed/simple;
	bh=k7augqJ/aC8e7Zu+AE9coTnNnHWf4m0zavqTka0cxKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOUzwZ3CHgxt3uQGoob++Q4oj7/KA9fXDfrJlbBfTLM/+Yv8rbwFOdLt1Rdv6ZdbDtMUcEj7vOphCYz/CV2+i8nHZzD+VXcVYuiRhrtVv09ZblToRWuu0KDpsPHSKlbC1VG8lJCE51QpO98vGQ+ee6aVmw1YoXCFpBt3C/2XYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VwK4ih8j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GvOk021549;
	Wed, 7 May 2025 06:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=URMzCJRzn/D
	s3PWoW9sH/SXHhjJHVtsCA850YVLOKKY=; b=VwK4ih8jn3XLv2A0fKKtN0SvjQE
	5s+1lt33PhEvZOQnauijcsUAD7ZqXMpsV420faSMSTPQkVyuzzo9iuUi6dBIwS1S
	YO46+3026D3m7J+41ylzmAzBnbsFLospt8+w/lwUPrjVTS5Xrjow6MMca23wpgAs
	OoGQn5vWQhXXvvALc0frudbKAgjcgl5Y12+yN6sNJ/DLhXrPpW+xHUJn4AJObn54
	Y3ZoKe8NRzsIohsnPh4TmS7Fl67xg+nThWQdLMoMKui/0E9+4p7aZRu8lYjnYxJ1
	BNkTFOe5QKEdIv9EjSDQP3jRSCiNGOdBWrQeRkWYtwft9uxN1mLtSQaorug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtug46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pPuM009496;
	Wed, 7 May 2025 06:51:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pO7J009458;
	Wed, 7 May 2025 06:51:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pPZM009539
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 4A8E25B8; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 7/8] dt-bindings: arm: qcom: Add bindings for QCS9100M SOM
Date: Wed,  7 May 2025 12:21:15 +0530
Message-ID: <20250507065116.353114-8-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681b02f2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=pjXT74PbbL8aJGsS5pMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: r0SwcgL1IPd9lUx8tpO-oeP5-g7PDR08
X-Proofpoint-ORIG-GUID: r0SwcgL1IPd9lUx8tpO-oeP5-g7PDR08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MSBTYWx0ZWRfX2bBZmFGzL15L
 2vLR/0AWEfha9UjB6dYQqx2ZAt5a+4IPhB1Db5fWCvU8Y0UUIjO1qGJP1/9ePptRcBzZd3EBXD+
 yqhbj5BbCTSQ9vlOvlcATUoNky0ngvX67Ey5mIQeZDLZ8dcZFDlcCSPXsOZMMyWRbdlAqKV/wWY
 RRH8PlB/QJA+Eig9DflJSyYGzxtGtUWnweqxQul9wDXaJyj48boeHF2aVnyJ+hzB80MgIN7s+6B
 5xPAIvq44YPX6ZdGErGllkEyV6PqdrUGkg4oO4+vI60dhgSGC8CvYvWJN21MfSKEkvFuGLL3w6L
 qcmTDsNIozVQjJJZLiZYlU4YJhr0a6Y1X6/5XKLrFP+kRqFcNQjh3/klV6NwpWOMn7ryNJ9ds+B
 0kAIxBkweJU0Xwxp/z0auDJRnFVLYv+nnIiHfFbtongfX49oPmz/m35x9McW6YwGHJ+HPoGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070061

QCS9100 SOC is compatible Industrial-IOT grade variant of SA8775p SOC.

Add devicetree bindings for QCS9100M SOM which is based on qcs9100 SOC.
QCS9100M SOM have qcs9100 SOC, PMICs and DDR along with memory-map
updates and it is stacked on ride-r3 board.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 671f2d571260..514ed617565b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -964,6 +964,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs9100-ride-r3
+          - const: qcom,qcs9100-som
           - const: qcom,qcs9100
           - const: qcom,sa8775p

--
2.49.0


