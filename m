Return-Path: <linux-arm-msm+bounces-68868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F3B23ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FE697B54ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470E42BD59E;
	Wed, 13 Aug 2025 03:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DxPZrRPd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41A52BD588;
	Wed, 13 Aug 2025 03:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755054451; cv=none; b=WzN6tvS8Gkq5UiXPWxRLriBoT4mkaTa8nY9qu/cdOvo/RgVe+zO2cadcm63JdhiG09h2zL62TkYyIWyOOXgVHVZNNDs5hAe3siPOgs8ayHaxav3FElKhpJRS7QnKa/2FiGh4pa2nkHo7/RI2Wwpb41PYjbrj0sKWJqVTpXl5xVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755054451; c=relaxed/simple;
	bh=9Ofvav1/BkjETQLohGdWWSRAd5YphrxUsJmR8jI6KwE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t5W/Hnolt/ULACVO3yh6DdTefhTASs0GLs0JdTRFwMle4C/R4vhGqFz/DkQvnhNSvmDjnnuRHnnxaMjqtQMSqip9yQ6O07vyvb2y4Iw9DPP1zxHPtFHPZmckah9xdmhIkKFQsF0Z1U930c2HtFg/FN5qX10EUqI3yrxYedjpCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DxPZrRPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLAlkR025489;
	Wed, 13 Aug 2025 03:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XbIZ28Tv89nPPKyunuXu74eQ7U6F5KsaimB5zK3+eE8=; b=DxPZrRPdzlksA6KG
	KfjxM+qyGM9LnhpgBr4j/JtXTv26ZE5i/LmWW3J+M5IPzoHVczSTqaC/GJA1na3a
	hZbhJsdnQrVFRtl9EavrhiQm6ij56QiUq/OgaKZvUtb+Syhr3LNSbH8xME+D58eg
	vdKD1ST5FOUJNLpjpIObtfecjoz86p/9kktYCLFsuDIV9JP/xIjV3m9meYy/OoNo
	QkFxZJv9Uk4itXvSsDQ2zuwLs/cukhnurVaylF03a9wZC4/5sGxpbQXKqJ5K6coW
	nlGlMD7J4JqJDx3sJvn1B9/YD8Mn5MiHcAbuhNmkhgFstjr8rWvoLKRXK2g7wm3q
	94/YQw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9stena-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:07:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D37Njj023052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 03:07:23 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 20:07:19 -0700
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
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v10 4/5] misc: fastrpc: Cleanup the domain names
Date: Wed, 13 Aug 2025 08:36:37 +0530
Message-ID: <20250813030638.1075-5-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813030638.1075-1-quic_lxu5@quicinc.com>
References: <20250813030638.1075-1-quic_lxu5@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689c016b cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=1vV_c3hU4hwyYT0DQScA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QJ7sdeTFb1i_22MjpBrrbweNOyICyqjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX+C42fXRfCqJE
 z4oZLE60OQC3wlddtKr3uHlF/Pn6lHk3PITJsvMSoRE77Ove/1qTAQVqE8sfupp6heVNkLtehxx
 ku/73fhPvuZhRuWgjU2UPAV+9INl1F8i4GNpP7L7Wl3PvOHd/6S/kNY5FzouadCYOKlTbPypVav
 2XWe3f+h0QPXF8WsUCpB11PqD3zHOPil6FXEuCgFovhENOJn3oZBShlW7pSsOX+AWlLtbIMfwpX
 mcfRNoAu7RJEa9rtDCtDeqrl+a5axlJhd5MAzlcnD2twDAfjA89SNhot7LTJlbSjR6eyEyWQiCR
 iQm7dexowRCwsrSLZqDkan+Cm7TIy7J0Cheihrpqr9dUwfLq3k3/576BZv6ub//qzOs5Zj8MdzY
 hTVxFPkX
X-Proofpoint-GUID: QJ7sdeTFb1i_22MjpBrrbweNOyICyqjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

Currently the domain ids are added for each instance of domains, this is
totally not scalable approach. Clean this mess and create domain ids for
only domains not its instances.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 2dfcf8a66806..5fc7dec65ed8 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,8 +27,6 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
-#define CDSP1_DOMAIN_ID (4)
-#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -106,8 +104,6 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
-static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp", "cdsp1" };
 struct fastrpc_phy_page {
 	u64 addr;		/* physical address */
 	u64 size;		/* size of contiguous region */
@@ -2243,6 +2239,20 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
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
@@ -2258,15 +2268,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
 
@@ -2313,21 +2318,20 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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


