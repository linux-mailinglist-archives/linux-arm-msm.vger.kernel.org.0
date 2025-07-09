Return-Path: <linux-arm-msm+bounces-64120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F7AFDF8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 07:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4281C27288
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E34E26CE2A;
	Wed,  9 Jul 2025 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g7ki9FOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797826CE07;
	Wed,  9 Jul 2025 05:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040090; cv=none; b=seOQuuB4j7pRVvv61NuDoB1WeZacVX0iJQKVVqLr/mIZ2c0WZRY/ZHF2vos1YVQgwHSTgSC1hHEUATuKOFyOOW4wO8zUmbBH7ItOY1TEXeEhkKT8Qcif7ozIp0Ud+USutVz/PiogOwNrr8vMHUR0F3SgSpkYKF49WhAaJX6tyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040090; c=relaxed/simple;
	bh=Pz3asDTjOSaHu3oHdU5GxMespan6yf+76q/h+2LjTqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZ1cT9rpjLVMjaP4bhwMMEkhFYOP5rBf7zLPijxOxY/Zpvz+XeslBfS/10W1nIDS1Tkk8Z5AAtPR0MbSS3akccHSPaCvkC13dmDRgsd1tMpdDnYHiRr19W1cPAtV6i1plCWTneslweVMzsgHHjpPjLZq8PKplYIvXS0wmYODaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g7ki9FOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5693xMrZ013592;
	Wed, 9 Jul 2025 05:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGGGME+2BWh9Ph8WF9yLDLSHnZIhhlXa8Y417BAKwHo=; b=g7ki9FOAbKBQ3WrJ
	LwthwORGeNbww1sdN/67zSODz7S9AGaykxPCp6fDstzvil67sY8Vt7r4CwRS6xFb
	80PwmOuUFrXI8zletZfpt4abA213+la4Yx2xxrLA081NfluxsI+57BOJkH/rLjlV
	MMvkstYe5bdCd/hmL8e1RQd8P+YYYQEfpAi0imu4xgsgQoEDvJLY293n0g073MBv
	XK/oKLB0Jqwjoy646b0aeIxMcfHM1ude11G2iYDNfzjFxoCjUqKmBRo25Wktvj3W
	p50OmaZNPkxr8fnPC9j6aYn9WZuPZr2GmtmO5kTXCvGbvuS3AyJdYTRqwiVEwiZK
	x1O2LQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdr3d36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 05:48:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5695m1FM023538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Jul 2025 05:48:01 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 8 Jul 2025 22:47:58 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v6 4/4] misc: fastrpc: add support for gdsp remoteproc
Date: Wed, 9 Jul 2025 11:17:28 +0530
Message-ID: <20250709054728.1272480-5-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686e0292 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=d01il73eTdEK0Eih25sA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kLodfiSwblVU5ELh8ZgyuJM_1fOq1Llf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA0OSBTYWx0ZWRfX7CD2JJ5hyOrb
 FkRYpOjOBj1sBhi29KjxF83YQqDIBigl4t0vGSpi8Fua+1kYRWOgK8yVGvrO+aHEJCwxn4gs3et
 4SApfVoFtmQNOTjMHllnksksFkG3N4Q0BC3kIju3RhptX9cssWe33lTkugkmTWtkYefQa/8T686
 MTX7hQ/4ac737h+qo7VOgq2NIQxValsSyN90thdFvFWBBOcQ51L3hamw6NkZTs3jzBDJXlkBeDR
 u7SxFzZlXFB51uPFP2ZTGmYPQZzl+Ts45dbxNdIhoENf/pmN+hfk6+l99wo22v8r1/l6A893zif
 Bw/L0zW0LZdeMHSporwN/dD7n/9t0cCBBu87Qi7mBCQMZMHpxFAdOzVoxjiy5SjcQvXYNzMmZKu
 GyxAghMPNjCbRqcVDamhsroLtDVoGJlnxexlqOJOzwqr3/VYZtTZN8A2gA5zMSBoq7T9dps8
X-Proofpoint-GUID: kLodfiSwblVU5ELh8ZgyuJM_1fOq1Llf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090049

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. This patch extends the driver to
support GDSP remoteprocs.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 85b6eb16b616..d05969de406e 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,6 +27,7 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
 		return MDSP_DOMAIN_ID;
 	else if (!strncmp(domain, "sdsp", 4))
 		return SDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "gdsp", 4))
+		return GDSP_DOMAIN_ID;
 
 	return -EINVAL;
 }
@@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP */
+		/* Unsigned PD offloading is only supported on CDSP and GDSP */
 		data->unsigned_support = false;
 		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
 		err = fastrpc_device_register(rdev, data, true, domain);
-- 
2.34.1


