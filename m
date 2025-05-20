Return-Path: <linux-arm-msm+bounces-58625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD435ABD0E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C15A77A19D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037CE25E832;
	Tue, 20 May 2025 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oag6NdYh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2F625E821;
	Tue, 20 May 2025 07:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727292; cv=none; b=prz/M4zFLWSGtG54dPkEJFtJmVdr6d2ayhO8+SdkxlOioNhZyAP2ApAyJW1I1u0DZSy7UeRD5ZskwKp6qdrPuuVnO4RlOYof/tWSoo+QF4YbWcSR/ZPigGX6oHUOU1hE1m5fQJD8lqTRagaxLEwbvFZJDkJ/tQXlDAEf0oDfbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727292; c=relaxed/simple;
	bh=3ade5NNbcbkks/ieGbkZlgPqHXOeSyThNGjaZIOKmOU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nt9+X1ZgM+d2vmEVasoqzPhNF2KF9Jw/jWJv7oRZ2l8F46n6nZQZURW3VuUUmOLrppNE/2+rH4sA9IGkT4wk9b5+3smZWmIqt/6eUaXs0CS60nX1EMp+nW/X4FdmfPH/Flnj5fFN7VeP6ICdM4xx8slQv7TIeJnaxJ3n1Bb82Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oag6NdYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4lpIw022850;
	Tue, 20 May 2025 07:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOnFgP9Ua5wi+hdrYmU6mQfxDUyMa6LWWNeMxXh5vHA=; b=oag6NdYh+ANU7BmX
	21B2NJgPQey79ylkxvk+PjDrKkAGEkfuBWL+G0uQmtlJ5XPRuS/qLs4xUYlpQ0cA
	Epaa4zqYO1gSRVmlglhWEOVzKaT5QYQNmCOH8Lj0k2szD0AlOlQdplJJtzZQUw4S
	yZ7QgmSCU2NKLJ4KFAVrANl3SeFyebpyUhB36MTsekb9vG9mWHZAZF+VDOnMwJms
	0E3XQA7BUmQBwIyz40HH4OGUzMt9WEwnhYT/x7m3sUWnGDkCyXdazOuH5yVUOXrE
	WDScC5KjP82FVxuYVWuTXAch4X2zfOdLGID0E3ECSr3XJrmE1KnyjrT/jqSZrso3
	NUuf8g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041uhwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K7m6NS003566
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:06 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 May 2025 00:48:03 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <cros-qcom-dts-watchers@chromium.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_lxu5@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: sc7280: Add nsessions property for adsp
Date: Tue, 20 May 2025 13:17:36 +0530
Message-ID: <20250520074737.1883495-3-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
References: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA2MiBTYWx0ZWRfXz1zNkP+SNEln
 IHLqK+uc4DheSKU/3YcjuDg2+RZz7Q6YZzAip88oqDN+9UNiTR0jkTU9ZQoaRGlDPLJJi6/vGh3
 UDcLDjNmQ9ck4q32XbNIspTwK5rc96OEJ3vNv0UEhCA7rLsmT16V5Z8LtetaSdAOAKtwKhDsNt+
 TiG8s4jK+vD+MSjXJKiyzaQ3/l93pYo1k40edf5Sw1m4z+qGXlq5rV4DSX2DmtmOshhlSy4XRjQ
 kyoGbNfCRWrVQG+4LhYFobkJcxqRSDPAHyzemoSue9ZBGgtERqRz86rckAS+TUE9JjFalc1EfKh
 ygyRICPfR5V2N/u4gQ7Kw+eY7eUatcpKlnNi9m1zyxvKRy9CiEwXHJ8gkDwu4CgXnsTNz8o0J7p
 ev/VsKbeLmXixQ8hIESgDZN8mLU7Uj+RoPymwbIq1aaFIN3HJVvHikfQ67gmlUjVcbmErl98
X-Proofpoint-ORIG-GUID: ild9Eq3gVbr1Ha3XfvI55N6kEKl2MAFN
X-Proofpoint-GUID: ild9Eq3gVbr1Ha3XfvI55N6kEKl2MAFN
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c33b6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=xzk0jXLcH6ia1Ng78ZoA:9
 a=kph8uwvA8Js1ya5A:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=761 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200062

Add nsessions property for adsp context bank to make sessions
available for ADSP offload.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index aae6c54bcdd9..17f244929714 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3893,6 +3893,7 @@ compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						qcom,nsessions = <5>;
 					};
 				};
 			};
-- 
2.34.1


