Return-Path: <linux-arm-msm+bounces-61217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338DAD8A67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 13:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93237189D72E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 11:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21FD2D5C8F;
	Fri, 13 Jun 2025 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XD9ilpAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02F26B745;
	Fri, 13 Jun 2025 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813876; cv=none; b=NHTK7DH70y4YtxeAR4QL/jkLM0/m56VjiVN6xjEz5ZW72Sc60yfoBJxx6slHr92PK0aqqvc22rWJZsjZvIcjCurCH+L9ZKhYQtd0i1t1dZQ16xqTvQGvIDEQHyPM8nKxuXYvDLo09AjrrUsnw+i5GIDB+4lAx6MG45Rjwvgcykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813876; c=relaxed/simple;
	bh=ZeNo6ZS7OvB62QTS4WDRSZKTSuTGWp991dNt5G+55Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kwhqjx3yxxPhegnNxmxM6ciWDCAH53zXPwZwUm6XJDfr9JFNepeqkwEBgwyNpJ93g+gsk+602/a9jpqLqGiThCGPG7muewEgLDKHekF/I1MTgnb+avSGiKGjsJEdzPiDmJKbBmvxA31ANyg6vK49Yq+6+guZy3wPgfnG+alaXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XD9ilpAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9emgg031247;
	Fri, 13 Jun 2025 11:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP+m7GQVi3pw1t8Nt1j3YkKGll9fvrKiTX5Q8zlMDeQ=; b=XD9ilpAh8/hUWXNm
	Il0lywbAN34HKlRZ/XLFzI08L9yQQz8mjNbUftPvYakQoBW7+C9B6g5AijACwDzT
	zTEsxdxg5S7CYZeWB24RffZVGhM6A/YwlTag7kB6ii5dKeMnAwiLnlE3sFehNU18
	YNYJ/nJWH0BudkvSjJ5T/GYIxrhWIbzaJMGFWFy/cQy04CjoqNiWAG84DaBu6oMk
	G2nw/iI1n8YFy99YUcQUJJB/ID4mPZVqiZ4yTZB5dpbDy2qNW4Nm+3ZzlOP9B3nV
	dPlHys3wSDnRta2za3B+90B2r20h0MBk1yhCSFOaoN4m4yhP6ptVUtXYAnTY3mOG
	BxiUsg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47753by7m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55DBOU4L003213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:24:30 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Jun 2025 04:24:26 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <=linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Fri, 13 Jun 2025 16:54:01 +0530
Message-ID: <20250613112402.2203617-2-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
References: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA4MyBTYWx0ZWRfXxuNbCLwTNtgD
 iB7m4Gi1GK+EpyFDx2NpikJTGNaqSi5T8WlekjixQXf2qaLyWEIWWGqAkI/crgk/Np41at48sev
 Qt+56jpJyvFYJK42AaOPBvPDh//I2LebH6Yy15FEjiNdBF/b3lWKVUNF4JFsdrLbYLTns2VZyqm
 d9zUxkEk4QqQCACWK+TNnM1Phh6sfcG+GltRHzIqpCDzVN5K1kxne2bwTdUGViw0mbQWit8zrs9
 0ntkB0vij4mw03tKe6xjDve2VQNx4IQJmwgRIFFjYuPJ+9IDiXaY6AE5Fsc7Uwn4oKXSPB4Ztpm
 DunzbWnywDfbhhjUjOrp6UJGaBmUjINa8ORc2IKhOcY17KbuG3Gp3q/DY7lqaXvfIRRgnAVQrMx
 gDov39OvkZ1iJ8OQ/2+94v2QIQyLRyEgCcTjAb0UMZcytFmOK3JxogAcMzjEVOLfiTNLBYvZ
X-Proofpoint-GUID: tYMGN3eDjuX_41RCPfaDpzHtCtywbvK4
X-Proofpoint-ORIG-GUID: tYMGN3eDjuX_41RCPfaDpzHtCtywbvK4
X-Authority-Analysis: v=2.4 cv=SqOQ6OO0 c=1 sm=1 tr=0 ts=684c0a6f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IfUgwc_bth4yghHgifUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130083

Add compatibility string for the thermal sensors on QCS615 platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 0e653bbe9884..c8cc67b65f73 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -53,6 +53,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sar2130p-tsens
-- 
2.34.1


