Return-Path: <linux-arm-msm+bounces-37036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C10059BC86D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 09:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A82282DD2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 08:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB061D1E77;
	Tue,  5 Nov 2024 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MRmUxtVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0851D0DC4;
	Tue,  5 Nov 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730796953; cv=none; b=B+TAL4w3J/73qmBKQLFozW1VH9dps+yq1QThgGoqghu0G15OvtyR0ZZ+0tJnoW0N81T5b2aHiuOF9o7YrkpZDlQkvMfw4qWsIQdl/iRnpoHdndJuVzc2uq+VHqT2LsBP8l51nDcvt3uNYH20HFTN4ArRpWJ0GhmHttKwLEkm+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730796953; c=relaxed/simple;
	bh=2CvR1oCzaNurZWOdOoBqN7eJiRBcYPdbdwEWl7S/l4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=WA+ddlF+Pr+Z4XQsdI0onl3+V05tnEIx9WrVQ/EpaMlaZVdKNG5sOW2jA1tKjWZvM9QGjYdanPAIi/nCftP0V6pY2sqiv2Nos6JYP3Z5UWpPRfaEZMtshQO1EOfaE0aWLl4TIGqSHnCt3bzMU+TIjqcMGcm3snX7h6SWZc8O9rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MRmUxtVy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIdnR015602;
	Tue, 5 Nov 2024 08:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIIRlys3D6dOLVwiTlAdbAep+qnmjiyeHha1SBtbcls=; b=MRmUxtVylfY7FUi9
	FM9Z3hwPFXI2NrLJNncF+qCl2mbPSHcaWG6raN3MxP28mm0T5N09trdDrCFf0GdA
	oP++dwKVSATb1dVnLFEkwRRSHmX7uuRabyUq2VYHZS86qc9M88uUVZRht3pfFw0D
	htIjSwX1HBWbPFfTB4/Bk2TUBkL/ja2x43MzQcemoWlwxIaAH6/3AWzrQWGjbSgp
	OIic/kBQXRdpxBnEU2nCY3qEbiOe/s+QFw8s1JWQVazofr+v0EJYU8umVnK3bVoh
	3CSF1G08f16Wnqo6AC5yXAHDI4PAflN32asD5WGqjyQkJ6YvDBwhv3p4jpur7EeP
	7I+21w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8hhhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:55:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A58tihW001209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 08:55:44 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 00:55:42 -0800
From: Vikash Garodia <quic_vgarodia@quicinc.com>
Date: Tue, 5 Nov 2024 14:24:56 +0530
Subject: [PATCH 3/4] media: venus: hfi: add check to handle incorrect queue
 size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241105-venus_oob-v1-3-8d4feedfe2bb@quicinc.com>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
In-Reply-To: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730796934; l=1719;
 i=quic_vgarodia@quicinc.com; s=20241104; h=from:subject:message-id;
 bh=2CvR1oCzaNurZWOdOoBqN7eJiRBcYPdbdwEWl7S/l4E=;
 b=5OJaoUlQg6VeudWVkYvDKDQNC4GkN306kq4QLVfvXaRJMCRSOAnD7otMSyD8uYQM5f99/g5h3
 9EcFPBz8SfPA6HC23ZPSOJv5vM8TcF0jzMokfYgsWfBCKcEH5wiQzz6
X-Developer-Key: i=quic_vgarodia@quicinc.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IC5AqbrcwOPRERz0aY72qJVeo8-P2J0H
X-Proofpoint-ORIG-GUID: IC5AqbrcwOPRERz0aY72qJVeo8-P2J0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=554 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050065

qsize represents size of shared queued between driver and video
firmware. Firmware can modify this value to an invalid large value. In
such situation, empty_space will be bigger than the space actually
available. Since new_wr_idx is not checked, so the following code will
result in an OOB write.
...
qsize = qhdr->q_size

if (wr_idx >= rd_idx)
 empty_space = qsize - (wr_idx - rd_idx)
....
if (new_wr_idx < qsize) {
 memcpy(wr_ptr, packet, dwords << 2) --> OOB write

Add check to ensure qsize is within the allocated size while
reading and writing packets into the queue.

Cc: stable@vger.kernel.org
Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index f9437b6412b91c2483670a2b11f4fd43f3206404..50d92214190d88eff273a5ba3f95486f758bcc05 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -187,6 +187,9 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
 	/* ensure rd/wr indices's are read from memory */
 	rmb();
 
+	if (qsize > IFACEQ_QUEUE_SIZE/4)
+		return -EINVAL;
+
 	if (wr_idx >= rd_idx)
 		empty_space = qsize - (wr_idx - rd_idx);
 	else
@@ -255,6 +258,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
 	wr_idx = qhdr->write_idx;
 	qsize = qhdr->q_size;
 
+	if (qsize > IFACEQ_QUEUE_SIZE/4)
+		return -EINVAL;
+
 	/* make sure data is valid before using it */
 	rmb();
 

-- 
2.34.1


