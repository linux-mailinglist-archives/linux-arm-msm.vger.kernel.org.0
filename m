Return-Path: <linux-arm-msm+bounces-53974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F6A85866
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E1AF189FC2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4287129AAF4;
	Fri, 11 Apr 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/n1MeP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA1298CDD
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365072; cv=none; b=VMBB5EtM5UpAN+kne1TW3z+VM3M74B96m4K5mvdoYH1BQnwnAEI1GbQ04PnpuMO6eZB3DsT3DfwgxbYkxPUhuBh1LUGOBU2islM4lpSVsio90G03OiJFxQQM9KXzkaICS0fKb82lnImYxx8mPmO0rgzOkraYZQ9cJitf78KyHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365072; c=relaxed/simple;
	bh=VPNtz6SZAXaeKvhR4Xe6dLeXms2B1V8n6FHrYC4ztMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N8N/kRyXwbH5vlAQ1FXTNY3wmKES+KeSYueXFxJiHUpJMSGCXgtDHH8zM0iuRju7KqYmLfOdXb7hiDdJcxIlshfM963l6QkOfQDqhBJMwgOBzkCNKpZAUReoCt+/l3luB12xqTCHtCN6rF9JUOUywi8iuAyP38ejQS0uB/Xd6Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/n1MeP/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4fwvc028856
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kkmv75R9Vmq
	9kQbxrsEYeVvWziDZ2ZPYGJqveR1Y+sg=; b=Y/n1MeP/q+L0epKfT9fMZAR+oFH
	e5T89uQM83FIdAhQbaIBETJ6WsYDHhVFBDDyFubZQS8fLnLPM0MjF82ZY8UUl59W
	zmCCuBwwKV3QXZ2ueZSidFMjEmPUhSSdbhGJgJSMRTeH5HMW+5dpmuGiEkwBAfYF
	Uunw6JvQYxf7ELRrL3+XB08j3Wk0iGe7d1H3HMmsEuhwJROUNBDulxl4A4kw/za1
	jiPe88xZuWavSgPgag8g/gGqB6FaQVGlesW5GWxJWqrZXIpuVTgxclDnbsTOqa7n
	ns+8moTnkftHFNqcs23pYQwyayTJ17NMYRaftaNJD3tSIqZknjU6GEZwxIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbut08b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:51:09 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a7aceeaso16952865ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 02:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365069; x=1744969869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkmv75R9Vmq9kQbxrsEYeVvWziDZ2ZPYGJqveR1Y+sg=;
        b=Guo5yWm4ow3xNa8NLZM+egH4kc23TjNacG80GcCrg0rqCoUlVcjhVlYSsVUQCYt6tf
         4W+YZ3y8SJWO/XKq/m6O8GSyOCuvmq67Geedm+onP1DfXo33zNCr66mWF0BW/w/N4iRv
         ePvESbhHgtl1J2BZ2RffafGqOgWoiiEDAktIbmQpHrCHbx2acOtwLlGAuY8tENeagwy0
         cixT13AfHrQuZDoDGxMCvrJZTqlNM8KGa0VvtGp0vOqo1qZNCl4A5M5KTMfmPoRlJ2JC
         M2zpACCwS/Koami9QJo544Lybe5R55ev/fZrwqQ/oB9h9bOMz98Rl1kKbzkIK9ktJOM0
         edhA==
X-Gm-Message-State: AOJu0YyQTA500VE9Zalgm4fhxFsnXyl3Qk0gWF/o+EOSdQqkJR94TUe+
	yuU5vKooOmD9uvYaxF8ufWE7jOKFdLU2dgJHrsalU79+e80ooIBo8ZqQEvvIFv5Z8OzTIQZvt0d
	V6tsvFIUi3wjN2eDErBIch0JeSzLmiAJWl0qFE7+eQHkJhsg8xXAQCG2ebBb2E+RM
X-Gm-Gg: ASbGncuf7YkS+1c1536l0cfwcrIGlx8f47N3W+Iqn8eo260BYK13RiiDiIgYV+9d/k6
	lVMNN0A/T2v+t20ykI31gW6oRnMxrCwrp6gFw4hoYZGh0Sg3JV+7AXF0pSUFxlMUCsfrX/N47ky
	4uhPdjIDyrxcuEwPf7xFQ6oRmgSLcfX7dGupqS9EhuACjh54fGYFI7k8zfr6GsCsBRD8g1RhfEV
	M7ruGhtVII4I3/MaqmRL46O5rAk5jC2+vyvVUMAfplac7earWKi44X7iM8cqtIF6Erxh3NYJUxe
	LwclYDto+peKsniAXDimNIiNGTb1OWZ2/bh65vM=
X-Received: by 2002:a17:902:f70a:b0:223:628c:199 with SMTP id d9443c01a7336-22bea5167c1mr31999435ad.52.1744365069009;
        Fri, 11 Apr 2025 02:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHejv+O3EwQky35i7nJepier66XkmJokjC1FYkgJAErFg9z+HQQX4NmrA9VQIZFdQ2rG1b17w==
X-Received: by 2002:a17:902:f70a:b0:223:628c:199 with SMTP id d9443c01a7336-22bea5167c1mr31999135ad.52.1744365068593;
        Fri, 11 Apr 2025 02:51:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87b9fsm45010875ad.54.2025.04.11.02.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:51:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] soc: qcom: socinfo: Add support for new fields in revision 22
Date: Fri, 11 Apr 2025 15:20:25 +0530
Message-Id: <20250411095025.4067964-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
References: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ruy0Zxohq759MAC9egpsWEK16zDduP8C
X-Proofpoint-ORIG-GUID: ruy0Zxohq759MAC9egpsWEK16zDduP8C
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8e60d cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110061

Add the ncluster_cores_array_offset field with socinfo structure
revision 22 which specifies no of cores present in each cluster.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 0a6eb8060f5b..6319a73a660b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -607,6 +607,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 22):
 	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 	case SOCINFO_VERSION(0, 19):
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 3666870b7988..0c12090311aa 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -86,6 +86,8 @@ struct socinfo {
 	__le32 raw_package_type;
 	/* Version 21 */
 	__le32 nsubpart_feat_array_offset;
+	/* Version 22 */
+	__le32 ncluster_cores_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1


