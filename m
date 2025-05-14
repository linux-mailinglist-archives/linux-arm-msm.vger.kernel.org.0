Return-Path: <linux-arm-msm+bounces-58011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE829AB7828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAAA3863723
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF841B3956;
	Wed, 14 May 2025 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dv46zFIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303DE2F22;
	Wed, 14 May 2025 21:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259269; cv=none; b=nAh/An2J0aeyJKiPLPdJP24UfE8bp81WqUtavOezNFZ6Xlbcyf2UJmijYkMFtKdf4fcjyTXEfrMOXFiMOmZcYYDMgeSi5Isf+Kh055d9AgskVeMC+l0JAOpzSr3a9S2a82e48coaicI2hR/567XjMpD3DZs7OJT9RsBkJ43PFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259269; c=relaxed/simple;
	bh=no3Ovq/+msXEibW9KWB+PqLeQT+IgSjc0neJeU0qRTQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cPzRraHgdGv0SUQvHGOnXDhF07hcdn7tWVUEluuRFkaxxKeCZ8UCpDeSPG32f4QtFdMK3jQMjTvbyhiX7vqJEWRcm0NfiAAGZ10Fhl5LN3KNR+0inkv4f8WdYpC7gBYRH/7Ul50w9oJOwzIYMdVSdw7NmvDr8oYqiHpXS2teK7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dv46zFIf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKYOBu002608;
	Wed, 14 May 2025 21:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BMGlPfl0PlHnr858h6oVuI
	GE/V7R492wi23yl29+4Ws=; b=dv46zFIfEvpO2JKIpN35EJqCwXINeq0uWWSb5T
	y578rBioCb5gep8Z4NpDeFqiLxhIy7w/Pn4JuZY9OcGbjLcQfMH4NpsctLWrd06X
	pklDJn37deLzHxp++vk7x0hFxTb8VLHPdFaqzS45Ze14bdhgVz/51DFcbkOtIspb
	/msBWPQpmhnaOFI+i6S11rpjEH0UqbsFBBjGR6ks4G7A4qeAKL8vmBfmQt3INvQl
	+WlwQR8T9nEbyohQ7ZPwB1QlVmtjDxTfPEDsREP42GyfPlOQgoHY4o5YqM7y9quD
	DE3qzzlDd4Pjyqr9YunqBEruYZ65lI+z1as6JP8ptOvPO8UA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex45sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 21:47:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54ELlcHe021301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 21:47:38 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 14:47:35 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <viresh.kumar@linaro.org>, <d-gole@ti.com>,
        <quic_mdtipton@quicinc.com>, <avajid@quicinc.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH] firmware: arm_scmi: Fix up turbo frequencies selection
Date: Thu, 15 May 2025 03:17:19 +0530
Message-ID: <20250514214719.203607-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIwMiBTYWx0ZWRfXwzE/Ir0a986y
 bfA631oR17Qm/XA/WzD/K1frTRJRvZ3oWQr3TUxtyVyrVNKCwFqJK9O7Li6zRP/8NJwZc08vEKI
 UVJGbyRL/K6S82jP7ODC0Xo8nxwu7r8LijdIOms0rMOr+atnzIesh9llyCTnOzouJBuCljR18kX
 QDM47RvPcfnhe9jkvg8DlK7d+3yL0BTdtAR+bK3k3gqjcrXvhtfJJsq5dpkQW9+7H/rI7eZFhkd
 6QXFQWqZB+ARfrqnZJZrmX1XV/H895tMGNvhNWiEtl+M5ZYVK9pQSGoUgkxJo9m1Mgc7UbIMGSF
 55dPQWQ0qucSz0H9pyGDUsxFUl/stjHkQ1DzHse9v46loDsesNt5dtOvvjmhlm1gzgCge/zWA4o
 gTMUrDlUFhyAgSHLPoAeDw95Jj+wkq3cT9f47AV0cqTp0w/xCDXmypcWU5+lMCMZe17zJM6p
X-Proofpoint-ORIG-GUID: Es-cZfoA2jWe32OW7ULli-XE4PQLuhNm
X-Proofpoint-GUID: Es-cZfoA2jWe32OW7ULli-XE4PQLuhNm
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68250f7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=1jvTKiyz69YEsTxx_wsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140202

Sustained frequency when greater than or equal to 4Ghz on 64-bit devices
currently result in marking all frequencies as turbo. Address the turbo
frequency selection bug by fixing the truncation.

Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index c7e5a34b254b..683fd9b85c5c 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -892,7 +892,7 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
 		/* All OPPs above the sustained frequency are treated as turbo */
-		data.turbo = freq > dom->sustained_freq_khz * 1000;
+		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;
-- 
2.34.1


