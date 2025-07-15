Return-Path: <linux-arm-msm+bounces-64971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B810FB0557E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34D8561895
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72ED2D5406;
	Tue, 15 Jul 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HB90+lCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B61917F0;
	Tue, 15 Jul 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569598; cv=none; b=DvhJQ73iExdOmtDGM7Tjdoy4nTBNjkHCSjpOtjErCs6OV+Oio4wxyRb7lfCsUqoT+5dqWVx/fqzcYxV5Pr6mHOIJ3iGbwgBIKkgfGwWVWV5/kEDic7bM7mDJOhSwdZjpPgptWAZPCyl20inDg6gTGxsgpx9fjs1SPbJGyGux/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569598; c=relaxed/simple;
	bh=v8mrY67QFyveFi1ZZWQloKjL1arCdfRqJXxoqmDbFeE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B74qRWzo0n/7UKtphj4t7iotrRyQ082MhlNrNNLWmVkgNdz/2BcpyyY5LRyKjoEajyL94FdrTZ9S0So+Fm8EM0Kozs35pO2db8J7v4JwcPfzZ0XPg7nrC6YjOCc6hrcgVKYWnOPRY5mbOI+GTG4r4qEcoy2kAa8fXrGmwbhw5VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HB90+lCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7sB4S015241;
	Tue, 15 Jul 2025 08:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9m+ZjqvaLBMxW2VhgG08kToN5ia5OfhliX3Ba/2bA6A=; b=HB90+lCoC+ce9RnL
	zJgmGLYF/5baNni/u3foHSn77wQqIHVthXkR8uXXwzBqnBp6bVPDbEzjhumkBvjU
	z6cRw+vbV/xHxGIZkNli4qULAdrRYNmSckJMqlvwYV7wNS4yciY16FRHoH7B1Mo9
	PIty+Vf1HFTBWpI6g4PRNWyFsZVUbMa7t+kSsLHgms14ucVu3DErK5luwLdPIjP8
	pTMtgQsZM9tqYRVj5qHHUYoKtkcMTgjXAPFGAN/iqpNH9xaNSOn6folZK2PeiYce
	R9PF7fmqu+LehICf/1nA/TaWIWPcE7YlRA6ef02dBm9EN/hQA117fvLRmKyeTYeK
	BJCNDA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu87f2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:10 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F8r9kq028398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:09 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 01:53:05 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Ling Xu
	<quic_lxu5@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v8 3/5] misc: fastrpc: Cleanup the domain names
Date: Tue, 15 Jul 2025 14:22:25 +0530
Message-ID: <20250715085227.224661-4-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715085227.224661-1-quic_lxu5@quicinc.com>
References: <20250715085227.224661-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX3WYmZ/4hHieX
 NI4PJMupF848uYPsHp8z9jo9pVzYAgSY6NO/ZJ0zVO8/b8HbJQisIXZRmU/n2omvmL3qtCPFy6n
 sqqtl80FgglwX4OCgg7OF/X8fXbq3bBJwJ2WDzCBseFI1bsVtG+SzGEhlpMVl3p+/5JmLu3+ljl
 07OB8ZejJNLUkhJD+DaGQ+1jLJDHcYuIc95cGq4Dy+OIOu/m3LNPPRndsFffi1TuoTv2elmbuiP
 T4VFzu3LYB0B5ApjdejwFenLy26fnGvPzWMkk7KNmJ70ZS1hoarSnInm5lNZ4rwS3JIeCEzpS9u
 Eq5EQtdV9/n2DrmU5yO9wTI++S8PnQ1NM1d3fT2HQjnvmVYIhWzYI/AuGvHetQvr2ppT7xIXp9D
 TFS3zJ4VyqeodWb9z61aO6ARhpdR7dpBAnesIw249+T0jnSxLaFEJABqQvLMYIebvMkdSg4c
X-Proofpoint-ORIG-GUID: m5XTOmi5D5hvRw3W1XVDkTjyQScTcVT_
X-Proofpoint-GUID: m5XTOmi5D5hvRw3W1XVDkTjyQScTcVT_
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687616f6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=rtsugCAgaeCb0McjE8wA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150079

Currently the domain ids are added for each instance of domains, this is
totally not scalable approach. Clean this mess and create domain ids for
only domains not its instances.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..083c1bccc467 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,8 +27,7 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
-#define CDSP1_DOMAIN_ID (4)
-#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
+#define FASTRPC_DOMAIN_MAX	4 /* adsp, mdsp, slpi, cdsp */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -106,8 +105,6 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
-static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -1769,7 +1766,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 		return  -EFAULT;
 
 	cap.capability = 0;
-	if (cap.domain >= FASTRPC_DEV_MAX) {
+	if (cap.domain >= FASTRPC_DOMAIN_MAX) {
 		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
 			cap.domain, err);
 		return -ECHRNG;
@@ -2255,6 +2252,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
 	return err;
 }
 
+static int fastrpc_get_domain_id(const char *domain)
+{
+	if (!strncmp(domain, "adsp", 4))
+		return ADSP_DOMAIN_ID;
+	else if (!strncmp(domain, "cdsp", 4))
+		return CDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "mdsp", 4))
+		return MDSP_DOMAIN_ID;
+	else if (!strncmp(domain, "sdsp", 4))
+		return SDSP_DOMAIN_ID;
+
+	return -EINVAL;
+}
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2272,15 +2283,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return err;
 	}
 
-	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
-		if (!strcmp(domains[i], domain)) {
-			domain_id = i;
-			break;
-		}
-	}
+	domain_id = fastrpc_get_domain_id(domain);
 
 	if (domain_id < 0) {
-		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
+		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
 		return -EINVAL;
 	}
 
@@ -2330,21 +2336,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	case ADSP_DOMAIN_ID:
 	case MDSP_DOMAIN_ID:
 	case SDSP_DOMAIN_ID:
-		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
+		/* Unsigned PD offloading is only supported on CDSP */
 		data->unsigned_support = false;
-		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
 		if (err)
 			goto err_free_data;
 		break;
 	case CDSP_DOMAIN_ID:
-	case CDSP1_DOMAIN_ID:
 		data->unsigned_support = true;
 		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
-		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, true, domain);
 		if (err)
 			goto err_free_data;
 
-		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, false, domain);
 		if (err)
 			goto err_deregister_fdev;
 		break;
-- 
2.34.1


