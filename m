Return-Path: <linux-arm-msm+bounces-64972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0DB05580
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78FF53B82FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510E32D46DD;
	Tue, 15 Jul 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KNvMzGSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9A2D63ED;
	Tue, 15 Jul 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569603; cv=none; b=sQAXDWhTkbI0Fla9iniLK7xBQQIUL+BtNd0Lnh9v1qifXdaZx+prk5pOujnLPSAIoCGR1ughZ6JvoIUb+sPk9UBsA1bwU1qjkrEiB/x/GYmPNyiRPlj5K1VjIMkbq3b3G8Yk4tqutNG3KdiVxyQETHT0g+0/TdbwEqyldwNSQW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569603; c=relaxed/simple;
	bh=wh3aZH7JHjf56fWSZDNnzPpfLSa9SIptWDYI1qpnE6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c1wa5z570ZTfGg9NNm9WTfkxlr6T9nqGdcFGBk3pkJutUNZoWGFB8fO1LHpRcDaql5u+18OYqNeh6wyFnpMu8nk/JSikIwAkM/zIyQigdHMLJV1P9HFVGHhYV/pIauNN9HjOclvHN3RGTyMgMyaMijUDA8PZ38quIgnyw0MsOxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KNvMzGSM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F681lN000723;
	Tue, 15 Jul 2025 08:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PmLT0fEksY/hu/qFDbYMSR9Tr86pZZtMwBoeWEsgmNo=; b=KNvMzGSM5w502Bqe
	iWKk3WaaImboOPuQcC1gd0gbt/YNfsZvpinMqQsVSBLhiW4Hl1ro59fnvWKc8cna
	BXCsOvDxLZgwbNK/g6H/8rxabrfVjGpikMNFeH89TA7CdUI4RDMfqxQxNalte2lq
	YSgj16cZA2MKKHOUWvWe/AUENjoA56bym8lTlYDWbOUfFf9pec/TycUsYO/0PMjK
	NqZeUhH1YX2FDrXUZmXTpez2SDETyDSHqOwaEAYyu5ieMovfBiO2rbWPVbNWkoEq
	jGWAtgBeUK7CSS2u2eDore9jHhbaQe6l+jUKjskOWwBg+ZG3/AVj2HhUEMtegxnh
	ICzBTA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmyuvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56F8rFtN019358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 08:53:15 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 15 Jul 2025 01:53:12 -0700
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
Subject: [PATCH v8 4/5] misc: fastrpc: Remove kernel-side domain checks from capability ioctl
Date: Tue, 15 Jul 2025 14:22:26 +0530
Message-ID: <20250715085227.224661-5-quic_lxu5@quicinc.com>
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
X-Proofpoint-GUID: n-3KWSv5chLlpGmk-H3eNWk358KycNrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfX0Hv8XHhh8ITo
 X5yf+5RwuyMemaqLQUSDXubiimMGA0lO7OaOCF7H4TRU1Q5I4D7okhyJW7G2A16oPGkCJxuX6BT
 q71LgKfW1Oy2SFsC4BGCWh/ofvgBV2i24teF++E/BscvYizd869fp9tHwR5SIX8ZWCOh4IHVCXi
 BFtDUF2JbNtCGhSHTsPhpa3WIvq86u5c1GjHPb2rM/Uaco5IQb1FHsVO7zGBx/dv10TVq6IYk1O
 bHgEHteTnLIgXuFa280BqS4Xvqhd1qUVBjJe6MiYDLRsgvDqeadzb0ryAq6qu4Q6i7QpkxLV2K5
 DQXxT4ntAxkiobUpJqcP36bUbtJL6PhpbFFfWqA9zUxoyvV3kUVI0VQ8iRrf20puAP6jvZoaYOT
 UDHkMXQwvfjpLm4bjj9Q+mavoALHTCw/Czfhgnr88+FYUtWhCjEgvDLIfK5fXiGnetPP7BJy
X-Proofpoint-ORIG-GUID: n-3KWSv5chLlpGmk-H3eNWk358KycNrv
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=687616fc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=AVwB9L8OO_vht6zXYJ0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150079

Now domain ids are added for domains, which is different from userspace.
Remove checks and log messages related to 'domain' field in capability
structure. Update UAPI to mark the field as unused.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
 drivers/misc/fastrpc.c      | 15 +--------------
 include/uapi/misc/fastrpc.h |  2 +-
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 083c1bccc467..85b6eb16b616 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -27,7 +27,6 @@
 #define MDSP_DOMAIN_ID (1)
 #define SDSP_DOMAIN_ID (2)
 #define CDSP_DOMAIN_ID (3)
-#define FASTRPC_DOMAIN_MAX	4 /* adsp, mdsp, slpi, cdsp */
 #define FASTRPC_MAX_SESSIONS	14
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
@@ -1720,7 +1719,6 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	uint32_t attribute_id = cap->attribute_id;
 	uint32_t *dsp_attributes;
 	unsigned long flags;
-	uint32_t domain = cap->domain;
 	int err;
 
 	spin_lock_irqsave(&cctx->lock, flags);
@@ -1738,7 +1736,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
 	err = fastrpc_get_info_from_dsp(fl, dsp_attributes, FASTRPC_MAX_DSP_ATTRIBUTES);
 	if (err == DSP_UNSUPPORTED_API) {
 		dev_info(&cctx->rpdev->dev,
-			 "Warning: DSP capabilities not supported on domain: %d\n", domain);
+			 "Warning: DSP capabilities not supported\n");
 		kfree(dsp_attributes);
 		return -EOPNOTSUPP;
 	} else if (err) {
@@ -1766,17 +1764,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 		return  -EFAULT;
 
 	cap.capability = 0;
-	if (cap.domain >= FASTRPC_DOMAIN_MAX) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
-			cap.domain, err);
-		return -ECHRNG;
-	}
-
-	/* Fastrpc Capablities does not support modem domain */
-	if (cap.domain == MDSP_DOMAIN_ID) {
-		dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
-		return -ECHRNG;
-	}
 
 	if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
 		dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..c6e2925f47e6 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -134,7 +134,7 @@ struct fastrpc_mem_unmap {
 };
 
 struct fastrpc_ioctl_capability {
-	__u32 domain;
+	__u32 unused; /* deprecated, ignored by the kernel */
 	__u32 attribute_id;
 	__u32 capability;   /* dsp capability */
 	__u32 reserved[4];
-- 
2.34.1


