Return-Path: <linux-arm-msm+bounces-43619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C489FE5B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 12:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4B9B161F13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 11:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B6F1A706A;
	Mon, 30 Dec 2024 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vjpbgo2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AB1A0BF1;
	Mon, 30 Dec 2024 11:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735559588; cv=none; b=JqqT4ypqjxc4WGfqaQDXxR6yy5L2d6srNFtUdKAkP09Dqq9d7b8YLRDrRVX6lS9fFa4x98E1iczjMeDzwO065kD0fWl4oUlaIDyoFvkcZlDkpRByTZTqxqitvutRToF4xTZOvgc13DaeuDjnhgiyl0t36RojUF1YSeFpS6yQ5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735559588; c=relaxed/simple;
	bh=njB2gT10j6GPUeRBsQeVyoae3FlS7zrl40SynnOxoDg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g7G/h+O6QlGuXRqflDkqA9jYCeKTVPJvDq0Hi93eEfSWcUbjF728FVDR+t3o5rhmUNVyalqEAAnMZ93Ex5uPk02mBsOaa5yAN07kKoBlf+d4hPUzoN8EQoDT4A76hqq5v8YqDRATl+59S0QB9EIV7wcw5sd3pmlEbfOTPQOHefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vjpbgo2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU80sMr012100;
	Mon, 30 Dec 2024 11:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=W4OgfFvqZE11Ow6At9Oyt3ivY161goXvFIpKuMP9l/k=; b=Vj
	pbgo2Uz5Sol5uSDdF55Wvc0HGoZ/8gPhuTx33Bh5JotOW2T6ikYvqPHtM58J4Zlp
	HRo5fbK5hypAtOjUkTp83AaTO6trVwqZaXKgNqeXjmLllTXqiGeP3xyd0x1D362G
	E9drnd3Jao/rrSMGYl6oFv0maIBrf+Tl0yb/d4LHJRrTAG50eLc3TWtU5D1UHbE1
	MXMry0YJv7BToY1pQ0xNDBPMrVKV7QdX+C+sQLIgpw9h6a7b1j9SYcpmaykkjR5q
	N14UBjgABCmW7HHrJDpf1sVRCw9IJOh4MhUgP4Ah8hcGziQx37iOGakzEZe9qzK2
	+6K22eMwkHXKtAnCXsbQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uqmqgf2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 11:52:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BUBqw3v021084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 11:52:58 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 03:52:55 -0800
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <quic_ekangupt@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
        <arnd@arndb.de>, <stable@kernel.org>
Subject: [PATCH v3] misc: fastrpc: Deregister device nodes properly in error scenarios
Date: Mon, 30 Dec 2024 17:22:41 +0530
Message-ID: <20241230115241.23202-1-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ks8Na3B7ZgIr_dYDxgOTyg70RG_woKzg
X-Proofpoint-ORIG-GUID: Ks8Na3B7ZgIr_dYDxgOTyg70RG_woKzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=890 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300101

During fastrpc_rpmsg_probe, if secure device node registration
succeeds but non-secure device node registration fails, the secure
device node deregister is not called during error cleanup. Add proper
exit paths to ensure proper cleanup in case of error.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
---
Changes in v3:
 - Resolved checkpatch warning.
 - moved out from patch series to stand-alone patch.
 - Link to v2: https://lore.kernel.org/all/20241223100101.29844-1-quic_anane@quicinc.com/

Changes in v2:
 - Added Fixes: tag and cc:stable.
 - Fixed author name.
 - Link to v1: https://lore.kernel.org/all/20241220061854.24428-1-quic_anane@quicinc.com/

 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 48d08eeb2d20..ff144f0aa337 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2344,7 +2344,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
 		if (err)
-			goto fdev_error;
+			goto populate_error;
 		break;
 	default:
 		err = -EINVAL;
-- 
2.17.1


