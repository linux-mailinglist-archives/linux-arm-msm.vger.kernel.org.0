Return-Path: <linux-arm-msm+bounces-43107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1B9FACEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE0497A1738
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9C4194AF9;
	Mon, 23 Dec 2024 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n6Hd1Tlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BB0194A6B;
	Mon, 23 Dec 2024 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948091; cv=none; b=A5X4kDPHxnsrNlczGcdxyKhmaszs1nczdxgwG6MqQLI1Y0SW+AVtLS/dq7IMVeJsOvKDq7Y7J4GGI3O/Fm5/1NujHmLylrA9vzgoskKA+Q3IpHsIeRRul67tAKUIt5JSyME8yd4yUFcJe35S6eJqWhzpplDSBF3YokLpZMmu01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948091; c=relaxed/simple;
	bh=xQ4TINky8S+Qi0afaOMTGOhRKPDk6UWjHoMhGm3CSHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UIz6PntvYmNhnUz8cxDeb+IaiCFwZ5fRg2oE31vAdtyNC879Xn9FzHF32aXZvOREts0gu8PVrwhMzB3QSiQcOJmKETskfInJlwz0V4ryNX9iDZNavrP1SQMrnksCs4EDcKvpfujm9VOwSsYLdxScHWaPwBgyEoPjfrVW8940szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n6Hd1Tlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN5rXmB018305;
	Mon, 23 Dec 2024 10:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TGKfJb2f2/jBNM/SKWtHpEfH
	2Qmi4nxCSndKf4d/ZW0=; b=n6Hd1TlgPOc3HVbHksOe3hnMQqpcDJYNQ0+QweHz
	5JC45zN3HPd+18wxIlCtDFpyFVr47lXbFBOPiOVrQRs3x1+C6DsfIGEnB87iZDWw
	wShIy/br+lFy1mkMGlJWI1izAc43xFmBR0HV9Mysm1n0oD+AGQ8DxgiiXTFpSfTc
	ciKc5vGCvGwe92S1dHpUEk/iSE1A7YNEU/tD+N3lghkCOYVyzXxdSnkwMRtSf5LO
	VK6CcK3tdlTq2GGRVP39cprEbu9mP6aFEdBSPurTk9y/wdTAgjV9KvZMP/SKBwQQ
	pt8R3AdIW1w8EFvgmI6OS4K918B3+6wPFf+zpyHrjUZhNQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q2458x0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:01:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNA1NLb023046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 10:01:23 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 02:01:20 -0800
From: Anandu Krishnan E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>,
        stable
	<stable@kernel.org>
Subject: [PATCH v2 1/2] misc: fastrpc: Deregister device nodes properly in error scenarios
Date: Mon, 23 Dec 2024 15:31:00 +0530
Message-ID: <20241223100101.29844-2-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241223100101.29844-1-quic_anane@quicinc.com>
References: <20241223100101.29844-1-quic_anane@quicinc.com>
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
X-Proofpoint-ORIG-GUID: K4caK7fNs836E5u8shM5FKbo0ChpZf2v
X-Proofpoint-GUID: K4caK7fNs836E5u8shM5FKbo0ChpZf2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=878 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230090

During fastrpc_rpmsg_probe, if secure device node registration
succeeds but non-secure device node registration fails, the secure
device node deregister is not called during error cleanup. Add proper
exit paths to ensure proper cleanup in case of error.

Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
Cc: stable <stable@kernel.org>
Signed-off-by: Anandu Krishnan E <quic_anane@quicinc.com>
---
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


