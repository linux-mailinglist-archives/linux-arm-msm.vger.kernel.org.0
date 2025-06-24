Return-Path: <linux-arm-msm+bounces-62167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AEAE5D1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27AA1B671D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D59248869;
	Tue, 24 Jun 2025 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V68Zigft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A295157C9F;
	Tue, 24 Jun 2025 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747825; cv=none; b=YnS5TmLU2Dx5OkeWO0Ym6qCTiEbDP5QJcd28phDVhyvK2XpSKINf/6mNUX5798xDwEkA0myPeUPKt6swZGJuroLIZV6fcAJxr0n3uNrBdYtXOygWhk83+/4RMjdt4I5bTU2dvboc6Aa6BaJB1B5eCLuNEZ0/QCrLb8o2Uhd7iXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747825; c=relaxed/simple;
	bh=ZeNo6ZS7OvB62QTS4WDRSZKTSuTGWp991dNt5G+55Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rXpXRuCGrsFly4VS7unX9Y5VcriVM+DaO24yJxOnepmikpB/ZkOm3OCnfSZoXr4OtzcakbrTrnk7IOmb7ghRJfJUhLezsl1zngZutbHz9275dHOXm2xgCrmxhq0xNdPIlReEoMStvpSu7Dc1iwn8Aop7Ca4dITagotslnmHmAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V68Zigft; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6RaKN011465;
	Tue, 24 Jun 2025 06:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tP+m7GQVi3pw1t8Nt1j3YkKGll9fvrKiTX5Q8zlMDeQ=; b=V68Zigft6T1srvui
	9BRbTnY5DNJ6NAVLzHrjTiBsLkK+uJEvpzXi5Cx8KZsylkcnp+sAXnryLgzp/tCV
	+g2JFaBVo4qewNZj3OZt2OFsyLAKJ5SH8ebkapQKYrNCzo1hWCag0Z9gstHtztFT
	05eSZFNO8jqzEi/vDV2OEbuPaakK3c4efBsDQ6Ml+uMhL64q+wOxBisuBzBteHfd
	EoDfZMNjOWbFrYOzw/VjsBdeVztx/7cm8ZxaVfod349zNdsrN9a1biyHRBXxNTSE
	XodBZ/GMS35MkuB4A6NGlYSuWvXvuWaqRf5vGFrIxBBun32CV4TzOdje2EAUBffP
	q3wZ0Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmmqy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:50:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O6o9nc001750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 06:50:09 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Jun 2025 23:50:05 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <rafael@kernel.org>, <daniel.lezcano@linaro.org>,
        <rui.zhang@intel.com>, <lukasz.luba@arm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v4 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Tue, 24 Jun 2025 12:19:44 +0530
Message-ID: <20250624064945.764245-2-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624064945.764245-1-quic_gkohli@quicinc.com>
References: <20250624064945.764245-1-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BVCFtv6PjEZv881PfYICUsmMJT4H2IE3
X-Proofpoint-ORIG-GUID: BVCFtv6PjEZv881PfYICUsmMJT4H2IE3
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685a4aa8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IfUgwc_bth4yghHgifUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1NyBTYWx0ZWRfXxsr7kop2EZsT
 UIG58LQXIzN6jy8cEYWyrNYl5ScwFEUMSfJzRZGzwNNZThrcpeUEfi4jz+cUoxuFqS9Q+v5R8Mk
 6ombp1EeOihM4RovxD0CbdfeUbqkr2Tui53rdbQJJLpUlIthMSSFAynA5ucR8Kw4d07d11JddjP
 ofMQLczr8H7ZuxviJbqZEeEEplDUfTrfLAya4/9vupvePMAfH97JN/k9KCU+I9Nmuhk/CpnvC5k
 6aEscPZXg3t5+hQPrGELBWGdcCD7VC+A9uClFYBitVbT4OV4bFTA42z6+Fx00N1Q8oEhLCwFk7H
 eLmdIjm8+a0W5wWoAg9UOFN0xs1/50b4jxTTpOoeuDzeXVZSNAJ4rM17XGng4j6A4SEodLXvqVR
 lX8iw4fK9M8c4JfKz+8+Th/D0qzxUYZKWgZb9VM5YKq+hFkVhT39CIwDnIZ1YcqYZ4kAYGyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240057

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


