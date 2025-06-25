Return-Path: <linux-arm-msm+bounces-62267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C258AE7612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 06:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEF337A5EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 04:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EA11F866B;
	Wed, 25 Jun 2025 04:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fd1RfeVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EA1F4CAC;
	Wed, 25 Jun 2025 04:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826220; cv=none; b=beRl7Smgdqhqq3V1kPxJojmozsrPHEnlL1PWjklQrNQaqpMUBf2DI7t7jhWPiPEhKIj11kYL4cukfR4R6bI8iRJu17UNj99pAa90IJ9vwHk/Jq4jTi+bFFodSL+U5B9djToYwra8wy8NQkgabIF13XDJ/DKOqYOVqnUlgv4OWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826220; c=relaxed/simple;
	bh=otBZh15OOyjJkHH2CKgAxb2GW+HM0480P32OmU9pIq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8PeBSob90ZINjiIiLRwNnqzRxgHD10h8AyAl5jg5vE3WspBW0YIvLHbbRLwdT7mT3vtOEgs/c0oWFfTXJjc1Qm+G+pYQ9plSuvev7+PIZiW4jK4why1WB8RdLryWTqp6vhgwjOWlR7do8ajTEHevtP2ZxVMtevEYArMH+3uKg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fd1RfeVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFtCeD019573;
	Wed, 25 Jun 2025 04:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DESyyby3BI6Fcvb3mJCAa+KVqYOAQbycV1UC39W8JRw=; b=Fd1RfeVn27rCjwbw
	1XGFv8grj98VrFGlVflfTxdTj/7xn/bYH9Btkah00+uEWQpEJ+1/rmBID1WgFm52
	MejVmeqMlGPuXaYNQAI0EN6x6ASZ445d5cMZsoq1zcXnkb6ZDVI4YlqRCQS/jswI
	Wqmr8T9FypkTxcYD6dzrNgOPyyWBF/wGJkTeZoiMmdAcNZw5mR6AEgXcX+u7dZ3J
	wa/jjziLMxPkqmBp7zg/dkmNa8j1ICNDDKUSN88xTXFLeZMqjzrFYKHw3xP7746S
	AI7+5N9h3YGxPN6y8cpj9G/PsdVi5OqZp5Lflf7A6tUMAT+keBDOn0tnnA7ynKVQ
	t9AwOw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4qqdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P4apJh021598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 04:36:51 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Jun 2025 21:36:47 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v5 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Wed, 25 Jun 2025 10:06:25 +0530
Message-ID: <20250625043626.2743155-2-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
References: <20250625043626.2743155-1-quic_gkohli@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685b7ce4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IfUgwc_bth4yghHgifUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6EZvP2rFwHsQE5A98dWDkfj7i_GdxEpO
X-Proofpoint-ORIG-GUID: 6EZvP2rFwHsQE5A98dWDkfj7i_GdxEpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMyBTYWx0ZWRfX7BKziKh0a0LW
 n3nHxVJSTlkwhz5/+n3rT8iHiHrERvKvNmZomT4HR0duU7txz7qJBn4+ppJGtZRPcReqPNz2Ya4
 n/Kij96Pf1Pm8QTA5Bs2KiyyUK05hiT6F8PVjSssBXMffn4EzIb1GZQt5x5nVim3uSprFhpa0VZ
 JT4whFl/vyjyusQ3P6qiu7RU+He960lzNtvxbURzL78ZMai+4emQwy2DadWwvkDR6QgrLM2tmrs
 9texqot9RVW18kUIO0xsDx0K30nwdEN3B5fR16zqnFj2unJL3JpJ4YOrSIZe1T+AfOmwjqw8lAn
 3FYquQYmeZh1Crg8GFs1eoanjOHu0JA/PDCeTlRzv0xwV6jZreOMgxqSHL49aNGsNkkxyXVjCF5
 Q8fNhcGMOEe/hbFRbnaJVxPu3sPqJQ7r6HXWKbJU+1kNOAYbBXrGC3buMZuOUHSeB2DpnkTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250033

Add compatibility string for the thermal sensors on QCS615 platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

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


