Return-Path: <linux-arm-msm+bounces-42917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F1D9F8C8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 336807A1B51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0724B19C56D;
	Fri, 20 Dec 2024 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T3oDMKYO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3E11990BA;
	Fri, 20 Dec 2024 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734675562; cv=none; b=RCJ9bC/ymKk6RgWQpVVKpIbTNEzwdfaUQVOqy/RAa2UCMSGWTM3vq0XlAqCsKAXoxTa45mP1Qx9BGvJYCnrKn2BaKjYqJNLqcIIkYa4M2OupU0rdx6LMRTBr81w/gKdNaCH+po12KPEnOC7OAbTd+b8FEtODEm+fA3pvcgdRPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734675562; c=relaxed/simple;
	bh=caMlUfVLyLJDJZtvj1HDxkm/K5ELQW0FVtf0trOkc6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjhL3b2wMawVpUXxdbZH6jJHgQhHcx9XY6Uqz/2ZMnKMIcjpCEpXXRR0HRko44vT/uUTFx6x2JqKPSAYIC9q1q0YlU+HT/o9J/kc3zy3nn4FfMQThQBnWo+XVkZVz8SnwteDHB4sfmrZtFsnHvbi7+jaCzQQ/cAqEn0UQpIeFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T3oDMKYO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK58dpX015621;
	Fri, 20 Dec 2024 06:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=naIhh6fVa+qs4bi74b2hu6P8
	qHZvYubSlwo7m587zto=; b=T3oDMKYOJ/XbNF7d6VgSF4XVc9d1z8vwgGgXldjV
	f2BoFJqahIVK/7cenrntgJU+MKSqzl5K/ogwT8m0aUvWd79YPOgh3gFIJZMjI/+h
	DC++OxftegAPGNRfWoge9OKuGT9kvFIUhAsnK8X2JmrkB8e88HJGh4240gOxwZS4
	Y+QvCjg9/YyygFiUWSoGJrOe0Q6hpP06IreqM5hwCLWryHOBQr2tqaJINmNF3zJE
	kjT3uR+6Ys9GMzn0vroGBFyFybzhTrIifn83j/552IiBRYdGyH2PeSH+IrTTcBZD
	sVYLcPOwd9bd2GyV0yM91X7PtXA8j3e82KHTebVWb2pVkg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n25m84rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK6JErD018922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 06:19:14 GMT
Received: from hu-anane-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 22:19:11 -0800
From: ANANDU KRISHNAN E <quic_anane@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 1/2] misc: fastrpc: Deregister device nodes properly in error scenarios
Date: Fri, 20 Dec 2024 11:48:53 +0530
Message-ID: <20241220061854.24428-2-quic_anane@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241220061854.24428-1-quic_anane@quicinc.com>
References: <20241220061854.24428-1-quic_anane@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UfeRuTWbG26KgJZyffgYFN1aHepJiYei
X-Proofpoint-GUID: UfeRuTWbG26KgJZyffgYFN1aHepJiYei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=932 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200051

During fastrpc_rpmsg_probe, if secure device node registration
succeeds but non-secure device node registration fails, the secure
device node deregister is not called during error cleanup. Add proper
exit paths to ensure proper cleanup in case of error.

Signed-off-by: ANANDU KRISHNAN E <quic_anane@quicinc.com>
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


