Return-Path: <linux-arm-msm+bounces-70234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF83B30D8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF5AAC768E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 04:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160CA28C87C;
	Fri, 22 Aug 2025 04:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p8hogmjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747528B407;
	Fri, 22 Aug 2025 04:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755836631; cv=none; b=GBBDj6CtgA+KmnKjHo2W7qVjQsmbw5uZTi9blb4rtYc1Xt6NMZgx94WAYG8Bh2O7/xRweWumY05DUXGswfkZcQRGVhN5EWHy9ocmEdJIdd+zYbJ9XViXtl3z9eN3RqpxsFxKsjyrleXF8fOF5orzUIySZet6u2/SXr/m3SOkq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755836631; c=relaxed/simple;
	bh=UkqtSC/FJj9I3000jkIIEfLXD1w6yQVJXeI827T8xY4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fRmCx4RmRiVfYugTzyGqIORm1dlvPFgx0GSEnbGfZKbqIXPwW24mcZtBgkf3GPAGWzPucLCbvN9Kd57zGloItY/TDv0yjHi/yVsR4KDYkr8Fe7v6fW+JCo1Ar94x7MB6JOdB38Vk5s7KFTdHZ4FJ8BZ6OTKeeQWsqTUKGl0wZZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p8hogmjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI92ja008432;
	Fri, 22 Aug 2025 04:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wngFZv/57K0/S4+LkraOMwUHwslj9CmtVFYR916vK/M=; b=p8hogmjTU32VyP6A
	3b1xj/JFfyTccWc8Lw1ovIvW/aSk8I93H30JqYxn7g3FL/bKwFDYGB7IQ4VChABo
	EvJ/226KXacbQ42yGp9Rd7FqqKQLugCfTcHbRWzQzlKHCFNSTyfcDR36NCFR0I8o
	CeV4oQgp/Wxi/HvL1sczIJtCWq2elRz+T3M978MtdmXJaAQO+SbeD3qwH9Nj25VF
	aeqe45v3bb2nIR1GMmxH9GTIqrVMvRPnQJUWW1qe8nkBAuS4eozS9YxzqJ9y45Cy
	/SHNRG1AAB1gzC9HfMlxEKd1OzLi5koBZ35QE5+eTj8p4vpHrDNMTPlxeJ/GcfHL
	402+EQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5297q83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M4NfUW005270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 04:23:41 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 21:23:37 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300 compatible
Date: Fri, 22 Aug 2025 09:53:15 +0530
Message-ID: <20250822042316.1762153-2-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a7f0ce cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=WJRn_3WVM57aCYA7nCsA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: a3zoj_lsUknBgMLxhsCBl8LbX-W3fmeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzkdP1Do9UxfS
 Klp8GrrQIYv3Q6vDNfB5HJK/cIaqS1lvrpCbtkPNFKAAvF4iDynOw94ATD/k2hpNtxYeIl8dmna
 9f935Zn71PXdwBRwmkWW7RR8xoRE32J9+gOEHmpxSrqWlOSQsbH5eTh7nlDp7M++aLA1SPU2jS6
 v51iKwKEm+Zk+8FqS1fHNmz7hl6HtOcvAlVrDrHZJNIJY1qfUA8SAf53y6AoG/HRyeqeDoxzAVB
 VAq1GChN/Hd+tPA6K3E8YiRMJFCO2zovfYwIU0uvEGu5QdilaB55j730ponY/rwvONLOVwy9bEv
 e0lAd/MPla/M9COb5hbPexFowjTrRcgVQpoCtlMWfLiY31UiXNwtAmuVq8HBzyh6aVtAgV4Nbpg
 B2GSqjHFxwckHnaQWNMpwK8CrzwuIQ==
X-Proofpoint-GUID: a3zoj_lsUknBgMLxhsCBl8LbX-W3fmeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Add compatibility string for the thermal sensors on QCS8300 platform.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 94311ebd7652..7c1f121fb417 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -54,6 +54,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcs8300-tsens
               - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sar2130p-tsens
-- 
2.34.1


