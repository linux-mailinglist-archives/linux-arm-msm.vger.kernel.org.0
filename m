Return-Path: <linux-arm-msm+bounces-35866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C79B0269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED6A1F234FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7E3231C99;
	Fri, 25 Oct 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B2g3jUwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59033DABF0;
	Fri, 25 Oct 2024 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859585; cv=none; b=ds+6XRAqontmnLEnHrrXRl1HjIZ+MMX2+K9oM9iXiP/zKoJ3E2QXnDOfoRZB/CoE/4QamQX4WF3qLSeb7tx6jK91i0xjMAQh3JnBjAEIi+8VLRSmPYOw9rJ5VzZpm+wmwMPmOFnS4Z/IpEXSmNIll9Q4xq+A4MLWuDM1pVyFo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859585; c=relaxed/simple;
	bh=72I+j7NeYPRjei6MYUJIImxwcE8tumUbFk2Mhy0a9nw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2EBxbrd4v7fAPpvHBJ5ovwxXhGu3kcvLO6MhRrzEvnhl93jC65yln3UHVmMgh7zyAeMScP5y6InntHnobgzw5K+TtxUInJ543cVqLyLOcnIQSfeaZWhzXpfJXsU38iBzcS56gA4WyCeEOEyAZDN+XIuTWwpyvN5VleH2hSungA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B2g3jUwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBjVas009516;
	Fri, 25 Oct 2024 12:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBW+1uZ16IsgZrZUKsNHGg7wtSGuox2qzBJKNiRGNs0=; b=B2g3jUwRYtAMI3uh
	MvJP6HTmVbeozQyyBIgMjzoxhWN1DnYQkJRlgjqBzugrdMkH9gO0RtfiKZHxw2nF
	3XI6mGeRpOGSCE9nX524paEEvEwB9/4UA8vp+WJMBN6E8FvsdWWkIQurlyYxWsLc
	Gd4q4mUJgnM2nufD7h/Irl73lg8d5prQIwUQ9ZmUda7YHeO29l572sP/EIX2Ca6I
	O+6rcXohQgeDqGzY5YX+IZh9Rm3mAafCnU+Dt1JfeHFtqBpLzKTlAKMq5FlBJPdT
	a4omNy9/Z+V4hUYvG7BUT7QB9MAjiEgMqTP2jW1U7dKWiRXkHe81UmljAyTW42Tc
	XKCgwQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43gy97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PCWvRi012881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 12:32:57 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 05:32:52 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <abel.vesa@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <quic_jjohnson@quicinc.com>,
        <maz@kernel.org>, <jens.glathe@oldschoolsolutions.biz>
Subject: [PATCH V3 2/3] firmware: qcom: uefisecapp: Allow X1E Devkit devices
Date: Fri, 25 Oct 2024 18:02:26 +0530
Message-ID: <20241025123227.3527720-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025123227.3527720-1-quic_sibis@quicinc.com>
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S_85f9122cRQbO7jZc0JDlbN5vvKRfAw
X-Proofpoint-ORIG-GUID: S_85f9122cRQbO7jZc0JDlbN5vvKRfAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250095

Add X1E Devkit to the allowlist.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 478538604225..95815e64e1e6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1751,6 +1751,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
+	{ .compatible = "qcom,x1e001de-devkit" },
 	{ .compatible = "qcom,x1e80100-crd" },
 	{ .compatible = "qcom,x1e80100-qcp" },
 	{ }
-- 
2.34.1


