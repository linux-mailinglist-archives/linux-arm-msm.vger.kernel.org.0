Return-Path: <linux-arm-msm+bounces-57668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E69AB4E5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 10:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3B616D821
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B648F210198;
	Tue, 13 May 2025 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VRp7T+p+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AC211A1E;
	Tue, 13 May 2025 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125820; cv=none; b=CAfK7BStZgGOOSNiZCMy0Lk2QLL5eXphFyy42rRwMkdC42yTZhsUb9JThL66x7NlZs/PQytLQfV+X/fuzDWwuBQ8Qax39lDi7y0h6bwCo1ALk+g2nu4+iRhkEwsupW1LAsAkJ5Ff6Om+xSJr7T7arLmrAOmDzbwdNJnBKKArCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125820; c=relaxed/simple;
	bh=sAJtUjO1j+IRyFTkcg7Hhrk+JYUv7qVhZqPx22Bp49U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnfCuk94C/+VeZQwERV5z/mlPJwCwGeJxGLeAmwl3jFVQpefMt7rfBe72lS3pV4bgTZqLELce/U7OQcF/xD7TJyGbi+V/FJhSh/Q+mE0shgeRbx0xE/5VCoi54UzrataA7ATefGgLtJDyTu9VUbJjQ7OuGioDuSFf/QrWPYWEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VRp7T+p+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D7MQ3g030171;
	Tue, 13 May 2025 08:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DU2YWR9qU+QTqwcarWiHxuOo
	F0fMbARlrvWolphcCxI=; b=VRp7T+p+jfLQypOX0fE4N7wxdL6dOYNCspQUGWKb
	eIntdttIkKkS834Gvw6BGG/LrCudDXAzfZJtcprXf49+u9Itw1SAIXfWw6BXXRKt
	jlt1WXoA6gX7HDgf5gX5yH49vH3xios027ltW6Vw4l2+FN1P2xh66md8IwyQwd+a
	6HN8mRQ2wK2AVMf5qW51HsXqz6mKCIhx9g/8wAJ+24JoyoF0DLbDHN2+3QPSfofb
	QVVhJy2roZw4gZMUeqv7IzXq1zcZNvID8HF8nFGzv1O/MlMwCtrzSYYml+eWh5C3
	f5UOoauK9Fh8fzlTI+FP652rjHO57kqZXR/xKMG1b7pe8Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k73d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D8hYpO006239
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:43:34 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 01:43:30 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Rakesh Kota <quic_kotarake@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
Date: Tue, 13 May 2025 14:13:08 +0530
Message-ID: <20250513084309.10275-2-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513084309.10275-1-quic_sayalil@quicinc.com>
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=68230637 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=UysH_iaXXmthhl1OG6QA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WWyXN18d0YCpXj5-zX26nXLjAouLvpfn
X-Proofpoint-ORIG-GUID: WWyXN18d0YCpXj5-zX26nXLjAouLvpfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA4MiBTYWx0ZWRfXy46pEegDmzQP
 Ujd//IcpYIpKwrjyX+4Huq2CAHFsa0jy7eXQwRG6p35LKBFoJupCAn+BlUjD9yQ+ObZVwhyKCiN
 PGZJUAPV6eYHg6gXlm1kEbO0AA6CQ1FTJuvFh19bZ3w0drMWj3cgaWn3la/BFFw9mAmjccwAbIF
 LS7d+Lk29YfXakKp3jp1Xuy75zs5A3sdm22fqDCnuB54/19VcmejUBwW/vIE2S8gPerh2gA7Muj
 41wDX62Trl0UaNnpkv6xFhZsSQEcLB1f1lsiGyU4ZeYjCqEIzZIhNVz5q0zs43dSELRVEsiq4/e
 lyPESErqAALDI9j2KSUzgKKLqP7CTFkmcH6gYNsJtPHMY2Fi8y/X9d4qdnlAPrDlAmWxmBA3qrs
 d6OEwRK/XfU7O4sy+Z6smtOEuJyKFVk0TLoJvQnwqRLaPAMhyhGHCPEnrEbn5q1i/JPVlRhc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=563 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130082

From: Rakesh Kota <quic_kotarake@quicinc.com>

Add support L4C LDO for qcs9075 IQ-9075-EVK.

Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index eadc59739a4b..a3ca62c7eee9 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -143,6 +143,16 @@
 						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l5c: ldo5 {
 			regulator-name = "vreg_l5c";
 			regulator-min-microvolt = <1100000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


