Return-Path: <linux-arm-msm+bounces-67582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 358ADB193AD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2761894385
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD396267F48;
	Sun,  3 Aug 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYi7F71o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7002594AA;
	Sun,  3 Aug 2025 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218897; cv=none; b=PX07pyQAQ1gcxt6HFgBhFKGu05MMLNYvStypvVGBBR88bz05Vdv/Mf+KkUCurRPd9NdkivIX/tuBn7cuw5kOzILJtDHAgvQWwX+tp+WlEBFXch515FRqoKUYtkiaY+WItHufd2PEbW2ntyBRnAgHVK4ss6TYqX5y/oF16RiCGQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218897; c=relaxed/simple;
	bh=bLvtH4TQdESBcjmY3N3VPoUk59BsjSTZcnsTcWBYALw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JiO5K7Z0IuXavLpuRX2ZDcY2rz3I+d0L9bdqmHUPoxaop42VWP6ww2OPeSym0dtcXJAqHIpO6q2gFwGxDF5lBl3GhaxetK2yd6vGNXtMa7E9/cqN+jeDl3Hw+4FPbOQRnQxzJpevlO0VgmPk6aTaZxOfK8ole04fFyw62ZjXJao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYi7F71o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5731o2ld019412;
	Sun, 3 Aug 2025 11:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DtEIXuw8Ug5
	3BfdDfQBUc891aBeP/6X43HRoixdT2Q0=; b=dYi7F71oRmi5nLPqy7mISxZljTe
	BKSRTHBQ7okiqERqCANvQ2nDWEHh3qOy4Rluuj5fo5QxRCr7X4kU9Gefft1xlnc1
	1AJeNqEdWdBXfxFgGsQU8cRekiT5mV9toh/bkvseJPu0DafPF5UGyqwNDnEBjYiP
	N2eAjo6BWFgUrZRWB5S8eGF8r85B28SF1qIPTLvGcIgssJerHPLxk/tEub+JoP1T
	eVKLzsUve0smqXR+deFabi0yuWPg/mk//uZaH9IEj+Ec+4xhMG3k0i4cTqBYQBdO
	IZffXfaNUIFjQn/yDE0+ADj8Hxqx2j2bVjQDwu/firinBYNTE6k+VvZhjXA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rjfd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1Lar015352;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke04c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1LjT015332;
	Sun, 3 Aug 2025 11:01:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1K2o015328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 88E06ABB; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v2 7/8] dt-bindings: arm: qcom: lemans: Add bindings for Lemans Evaluation Kit (EVK)
Date: Sun,  3 Aug 2025 16:31:11 +0530
Message-ID: <20250803110113.401927-8-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JjgIAGajE7z-K23KO_UlszQR9xYRyZn2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfXymVW+12aZses
 WPbCpgtclLXuupSBvHJqClICTMT/kQ5ONDmMZIQQO1s5Zxpbg0HjiC55bPGF43fa9yYLgNHNwbI
 52nl4oGSwLadg6u/+EnlNgqEF92UuWN1JWsrUNdB7HM3xMc9r+7uxX7mY/iVDCY43YZPlBodrTJ
 8yQOHXKibfNuNeaevNrv0YT7Km2gO7AnsBS3EovartBRPd/slLV/VV2dM6GZMz9FU9AnIsQ1a9F
 valGFkqYlfrPBcRGNs/qmIgQLB8TSr7H4V4MICZgUKYWr/nWnpGsoP7ZMcx3pYHTI4wYl44ejom
 N2cVzT36V8NmaFUcqMJlLw5E98YqNNWMUvqn/PH7Bp1NWBwHgXVIF7kLIQktwSo1FG+vqIA878N
 UTgRqO43WwR4/hwAdwgpGjK8O5yfWOyAE0w+ThjeMEopGpcXQfIMWWq/3d+DimeyCIYrltAv
X-Proofpoint-GUID: JjgIAGajE7z-K23KO_UlszQR9xYRyZn2
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=688f4184 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=X1TC5Bqf1UsWx1KGIcQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508030073

Introduce new bindings for the Lemans EVK, an IoT board without safety
features.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 47a7b1cb3cac..09474403ef93 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -978,6 +978,7 @@ properties:

       - items:
           - enum:
+              - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
           - const: qcom,qcs9100
--
2.50.1


