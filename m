Return-Path: <linux-arm-msm+bounces-76200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F35BC1466
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:58:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0821892B1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82391B4F1F;
	Tue,  7 Oct 2025 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZBVIrIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F539FD9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759838276; cv=none; b=lIisC9ADktFQUrMrrsi5W7Zmxt1aWXYHXLI1WSDwi6BhGekUj0QTXSNGHLbRKUb7dT8HqInD9fTqzNdr6KBCdDGrIt9Edb1SFP9S2SI0u+UGMuIestGg0qT7ATjao915QoDSb0Un4LkLPwyi3mIeamttdvselYyuJZvT4UIeNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759838276; c=relaxed/simple;
	bh=ngU2FQC6mEUrW6gmVtd1tV1f62z6SGlqmBk8CeKWIoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+xqnMFKevLffP4PvwWrsUoEpMcMEDIIsRpuPe31H4JXooM7yWhdVwduAVah4m7fqVKgvJUWPEu9sm/Tr2tJUYxOjdPlSGKa7fkpmSdwqtjn7iYC9LsUD9T/LuL/PTxVomlDk5cN++dT0ZjKvFOBDV8hN6F5Qmv0BSV5f4lAjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZBVIrIe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973D4Rh021746
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 11:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x3FrYPMxnfKh2xjFx0tCvhblzRITWQjtLSz
	NuYM15SQ=; b=MZBVIrIeaHSPY3TV+FU++iJ8jwgOjyqsV4ws6tuSLyXLBLkCxLd
	8pxWFllqE23Nud1i1oRKk43Kr85cmyexW5TUNRYzLl+00mN1GQVY0i1Kkk3qXszS
	TRtAz+lWTmNGQU40hjAMBFzvn2Iq+BELDX9iIgzu2SG2FpjPW3Rdl9I9SkZYQFhM
	S6Ny5M7IqHqz+PBxqE6naIHZo4NrmCxzHAsof4p6W6V4cyuuqmyAlP37XdOXXzgS
	yQgq0Hx8q41k3a7ThLSFLnej/aYEANtCDcYn1cTClvy0dvjttx1svwiL1tVJizdJ
	TW9hcPTb0epH/9aZNHdo7xWiVZOPcB0vHtA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6y2ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 11:57:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ddc5a484c9so156641451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838272; x=1760443072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3FrYPMxnfKh2xjFx0tCvhblzRITWQjtLSzNuYM15SQ=;
        b=H6ZJuNwq1+6BtmCyToTO/RqC7lZqRfmVxTmquaouOCCCEqgycLs10TSK0K2c9uP6fY
         GgNkzYDXpsbjerOwgKvmxO0bVRXK2oBqUyichJOcz20eA53MHaFhHatPnG7lplkoxLRJ
         zG19ReGtVguPqkT1YS3SZhxqk1sxEd24sFiAKlZXYuFMX5lHqTNWGBr7bdczV+rNa0iH
         kExLO+427zDSrbxBztR1WNpsZ2fgT72qXahrlxruYgl6QTCDKQ+yV1cyMhCoBQtSN0tj
         2+PAItAvsq9wsVh7wyYyUNoR34eZShwv25fbRKpjyYWMnAYD2FCcgZZVkEYZcpWs5jq6
         Uz1w==
X-Forwarded-Encrypted: i=1; AJvYcCVpJZd1AjPtbJXDgQEztKFZtdwKPmdufO/iQI8zYJSRtlpnf/xbNLLrK+cYyIsBiBSMysasbbDvxaNnoXsW@vger.kernel.org
X-Gm-Message-State: AOJu0YwGljL3Z963Q6mb7gTF6uY32SZEaLmeE/HKMsMGRzH0Q3uWuEbz
	RuM6KQT4nNofBXMjrkD3sUVoHnyhTinZRLE5iWEbpFY7fgLneiJR/HEmG3wX+PQJffQtlkJe6iY
	NQ6/CjEfSLQY3taWTMpCf56Odm3Js363iXJenOgBss8vF6rEm5o+HwnvV9ey5XZugawH/
X-Gm-Gg: ASbGncu+MDXAahev/LlhcdAYhKs9BWxvtec97m02AhrHvYjOWRP3Xhe5S2MtggQEx8B
	ajmFoTGmZhzaQWKAPEdJM/OqgQsUooARR6tH9cZW8eqgB84e4f+2T5Ktsgs+IHQoRuJN5Vpg21p
	oRuZD7Y0G+0Yv8+RVn5dDZ2Pn9CHCq+2XIl6+ytLCTSnefDz4s7GFrrFlJwIrvRf91qTVYAG669
	jVoIyApc35A3NmWPdGD9D0p4USCg7cSDpPbH+L4R+LZX2yiXITIY8a8RSxOyVAxzqka11G0cRCG
	34xwZ95J6DkUjlD9PzVBiuOqF8eR5WRCIFhmRDD+LDtOlBa/5ycZrQIqpCwOwe8qwNj0tDnrRAw
	OtsVzFvOLwQ==
X-Received: by 2002:ac8:74d2:0:b0:4e5:834b:ca45 with SMTP id d75a77b69052e-4e5834bcae5mr105583201cf.63.1759838272494;
        Tue, 07 Oct 2025 04:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU+Ujm7vTcAuTiF9tQ87c412Co2eQ7Yw6aihhoqBCStMmXR9FP97MI9cAvWh2to76AohJlAg==
X-Received: by 2002:ac8:74d2:0:b0:4e5:834b:ca45 with SMTP id d75a77b69052e-4e5834bcae5mr105582871cf.63.1759838271803;
        Tue, 07 Oct 2025 04:57:51 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa62csm1339064066b.19.2025.10.07.04.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:57:50 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Fix bootlog initialization ordering
Date: Tue,  7 Oct 2025 13:57:50 +0200
Message-ID: <20251007115750.332169-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e50041 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aVJJzlxB05kmw2s4GJQA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fCNiyhWwvvdT0-WYhgsIIKuvUr-nLfZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXz23lDQs6uUek
 UQXRHff2x91/BawOZuhGFwBOUoJhGpoT6NTEf5EumrOYjRAh9qPEmH/I4+1J1zKrKu0FFKTW1fS
 v12EMyjLvKaWk8q5RBKmZqd6SjnDDKaJSLzMqrgg/7pelmnA+1G4KI6ewz78fdQyRTx1w+y1x6O
 o0o5urVUYAg+MqIPyd45q/GNT0VvURUI0xdZryeWe/piUEdtU7ho7sTI5t2mYFEqaqNzJFIECDd
 SUDPFfFHjizLuaa7tuFZW+NQ3pQtlReTvrgUOh9UqWSKdAA8sy9QNxbBCrVmnDknuqjHRCSH6Q1
 s4F4dqm2EbNoMZIJ51DxbUG0SpqJklCWYIAXJRMX97eZjoUc3fT45RcYisEL7Df5g06Yif503rB
 HgeTDxUKgVCdbo6wWjehlizKV2VShw==
X-Proofpoint-ORIG-GUID: fCNiyhWwvvdT0-WYhgsIIKuvUr-nLfZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

From: Jeffrey Hugo <quic_jhugo@quicinc.com>

As soon as we queue MHI buffers to receive the bootlog from the device,
we could be receiving data. Therefore all the resources needed to
process that data need to be setup prior to queuing the buffers.

We currently initialize some of the resources after queuing the buffers
which creates a race between the probe() and any data that comes back
from the device. If the uninitialized resources are accessed, we could
see page faults.

Fix the init ordering to close the race.

Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index a991b8198dc4..8dc4fe5bb560 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -218,6 +218,9 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 	if (ret)
 		goto destroy_workqueue;
 
+	dev_set_drvdata(&mhi_dev->dev, qdev);
+	qdev->bootlog_ch = mhi_dev;
+
 	for (i = 0; i < BOOTLOG_POOL_SIZE; i++) {
 		msg = devm_kzalloc(&qdev->pdev->dev, sizeof(*msg), GFP_KERNEL);
 		if (!msg) {
@@ -233,8 +236,6 @@ static int qaic_bootlog_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_d
 			goto mhi_unprepare;
 	}
 
-	dev_set_drvdata(&mhi_dev->dev, qdev);
-	qdev->bootlog_ch = mhi_dev;
 	return 0;
 
 mhi_unprepare:
-- 
2.43.0


