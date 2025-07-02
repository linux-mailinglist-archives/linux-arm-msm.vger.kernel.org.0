Return-Path: <linux-arm-msm+bounces-63336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677FAF0E9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A36A1BC7972
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EB123E355;
	Wed,  2 Jul 2025 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pdj51PIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54523D2B1;
	Wed,  2 Jul 2025 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446798; cv=none; b=NQ4SdNapyWM2s1GIt8UmKLbWyoVSyTl8HCz6IqWYkraZ6Z0oaOUqAyWOvYVejxSpxwEctDzTWXqn15w9U0s+401mgNrPIf4r9tUB4d271lD/jPQjCVqj0Yro+cQNhtCHJFhHFff3VHMxnIJGORkuuuve2LemVybAyDp/HyE7+fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446798; c=relaxed/simple;
	bh=2JI+YfrowwwUcoBJ2M58P69wLwPAB2vYNKdweZuO4VU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfuXRp4w9XwACxaVmZmRikAjZNnwc6Opu4CP7DkV542zIgJBO0ySSyqY+bF4wz3b8xIO+nGEPS9AXQyk/ktN6JiYU3UaK6eVUeI2fyn8nkRFp2uDcFJjVKn/p2LffgrpXGl8YRz17664TGiIBC4I3t/MyXU5s+uhwDB7V37zN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pdj51PIC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5623fMqd010624;
	Wed, 2 Jul 2025 08:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3GFLc6L3D05CPEwQBB+vavRm
	RtyzaTOYISZFCs6voPo=; b=pdj51PICn+xmwNUnruWgGhT4ALi5hL1eYInMv/Bt
	x9hTSGVtGuo+K7dkHuaAFpbQGa1KrVwExxWyqHBY7NlKOI52tnIsOL9jKlIdZyaF
	Tdp/kjBq+DlFtfB+WKkCYlNap+ye5Cxv0Tvf+Oi+iqGbqMiiL5KSyAQmBFDDKb+9
	Y0Htpry8kGSlC5dO0mFHPrKAuB6pmgfyF+rPNKcr9NK9Jg9N4+n3oZ1zSlvx/xgF
	nQqVqtytQqeXc18zDM1d4aE/PnfeKicn3Rxoi3EU7QGRlIRojm/nog7X1XZ4FBo/
	85w8EIA/EfgBQ2IHiR6+TetN02btTLCNSjlNnimLwIEDIw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw308vph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:59:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628xsMf006041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:59:54 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:59:51 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH V3 1/3] dt-bindings: mmc: Add sdhci compatible for qcs8300
Date: Wed, 2 Jul 2025 14:29:25 +0530
Message-ID: <20250702085927.10370-2-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702085927.10370-1-quic_sayalil@quicinc.com>
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6864f50b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=KZcgMjtcvL42mtwMZ7kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J9s04rFQfJT9xBNHx_eaQysnbavir2ru
X-Proofpoint-GUID: J9s04rFQfJT9xBNHx_eaQysnbavir2ru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfXwOhARaT6so+3
 cNugTnisrqumkJ7B1gOqERp2NmKEJ/oTS5gF1AcmFBlyYtRV+z5UwbNpThNrV5eZ3y0bHbU9LsT
 A6IwmWSMD98z4rGssj26kxse5rPgF3wZVOJIMAYRLhHhyp535CSzX5wZLg9g4fpm9XRWhSizAF3
 zyIGDTJevGoNXlvhssQ8CWt0Uim6NelicBLLJ0NArt7wTTi22IT3M6g7OtV7KbesixUKfKBfzir
 7lFGcPhBsQlDTqH5KXh9o4P4Qg5TSduArGKRnquP3SuUpNbLVhXseEPCDA6tzwMHC82YGLElGK3
 AH6ZyFaNCqaJOpL/Qpsup47gYhPjrbBxR2LZgMmTgKc0gSwmS93lVrAleM+CsRnfM0urKWQ+xAt
 LZdduxR+S6ov2g/Mg3b/nMlc5ihOP00X+RMR/76chSrKvY323lbRsyeHL64gw8eCkwiYePv5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=653 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020072

Document the sdhci compatible for Qualcomm qcs8300
to support function for emmc on the Soc.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 2b2cbce2458b..5ba2da8dbc7d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -45,6 +45,7 @@ properties:
               - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
               - qcom,qcs615-sdhci
+              - qcom,qcs8300-sdhci
               - qcom,qdu1000-sdhci
               - qcom,sar2130p-sdhci
               - qcom,sc7180-sdhci
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


