Return-Path: <linux-arm-msm+bounces-87622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2ECF6AAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 05:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31FDC30334D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 04:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A7027FD43;
	Tue,  6 Jan 2026 04:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W4/o3aId"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECEB225402;
	Tue,  6 Jan 2026 04:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767674115; cv=none; b=pEYIcOGhXwWcIYq4dUfy8tGTZngyYE+QtDxAR2TVc3okhwHyyVIrYpffpw4l49NG2qrMAVDHKPC4/Sh8VuF1oHlm/K0jqSQiEbahFfCu8Qo2PBu1potxQZgJCkWLEFq9bHAxXj6VRXtTjylVFAFYWIQeTYNOacsrVPPHdF93Bt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767674115; c=relaxed/simple;
	bh=vVNGnbrCpo4KVw5Xq+pNi6/ndEtWTEQkqknewAlzLSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sCrY8rWK5YSUkpbuoFetXluJVzj3xu3tQi7vREpQ3J+lwKhtl0MgpUKskOQrzMU8LLDHECEt7gRqGu/DNrdwjsEc+P+xyBb+oxdeVB8DpeSbmA+bbT0Eh5K7LvS2LgOOsdu9gV9C3COGhe09m+9H+EHNydh4hS+hMyOLM/12I7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W4/o3aId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QRIr3301262;
	Tue, 6 Jan 2026 04:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3kiM8B51HOZsnCP0Sf2Nec2S+PJWkkNK9GY
	mKLZybKU=; b=W4/o3aIduTPfPiNqqb5r2fn9BfjCCiQnpY+1p3Vn955BH9xVJcs
	1YdkTc0pJQL8cLi/Pp+D221RAxU0467nT2vbSTWX1E7mtVncVRqkFYm5vIwXBHzc
	9iPPaeilAIiCGiWJ4tju4A2mbmaE5cQbm+GedSE2tCm2cR43hMBLBIKDr9L7JYLm
	Zj0XkjCVdZgmZTFeua1xpAvj1UQY0nfSE3O7LBXqXbKAXJ/6AqHD92MCWkBpQ/5y
	JgcTcxlrL9ClIGUshZi4qLJUk9Ei7wPqkCpdg8yQDNky3BGWmcS/l26KmXs+aX8Q
	yGDCvt0NQZb+dL8nKLO5fdgE2zeM0QZ/TLA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bggsvsrj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 6064Z5eW005738;
	Tue, 6 Jan 2026 04:35:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kxje8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6064Z5RR005726;
	Tue, 6 Jan 2026 04:35:05 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6064Z5Ab005724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 04:35:05 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id 902B923225; Tue,  6 Jan 2026 12:35:04 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com
Subject: [PATCH v9 0/2] Bluetooth: btqca: move WCN7850 WA and add WCN6855 firmware priority selection feature
Date: Tue,  6 Jan 2026 12:35:01 +0800
Message-Id: <20260106043503.534557-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oR28vbyn3sn4K_L6-dGpakExYLZiQxMC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzNSBTYWx0ZWRfX4d5JKe9zl9Np
 ICmtfrV6yEsOd1PUOgL7gKGazkVlB6Sp2mDooaJqW93xa9w22ppoaXhVhPJSGHFhSekx8rpQkDE
 +pM50ud3lvmgBzf2lniqLGLDlzBN8UBCGDsEUF9JsqwR+WyduN/PjxguIKDihkI5GfKmzk0E5/g
 DBo5dnoSpfbCxVkVnP1JYN6/M8rKVSlg929IauKgLM2ZDW1kf/6c3Pnw87dR+Y2c8w0+Kea8MwQ
 UzP81ViAbHPTFq4F1CFWSUedju8rXtou8ayfjvslCxJ0uBnAOWdgA7oHFg/RMl2+9XBbn6UGPBO
 VKJYIHcxXPntczvxjdIeXBLf5IlX+BfURNSipt2mqzJw9Bq9Jf34ETtjaffbulHGgMEbnSrE0qJ
 fHaTAF5xDX+HcY2szhfv/exHqpLK564Z9bPpEcS3TkQff25wPUsP+lfWdQRH1YfLT/YoK/QR9J5
 V+MaMcq2tZQZWwrPb/g==
X-Proofpoint-ORIG-GUID: oR28vbyn3sn4K_L6-dGpakExYLZiQxMC
X-Authority-Analysis: v=2.4 cv=Yv4ChoYX c=1 sm=1 tr=0 ts=695c90fc cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=3rVLPgN0mCaywZWmVPYA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060035

patch1: Move WCN7850 workaround to the caller
patch2: Update WCN6855 firmware to use the new FW file and added a fallback mechanism.

Changes v9
- Add Reviewed-by tags
- Link to v8:
  https://lore.kernel.org/all/20260106024806.480779-1-shuai.zhang@oss.qualcomm.com/

Changes v8
- Add patch2
- Link to v7:
  https://lore.kernel.org/all/20260106020738.466321-1-shuai.zhang@oss.qualcomm.com/

Changes v7
- Update the if logic for firmware retrieval failure.
- Link to v6:
  https://lore.kernel.org/all/20260105055646.3816296-1-shuai.zhang@oss.qualcomm.com/

Changes v6
- Add WCN7850 workaround details in the commit.
- Reduce the logic nesting level.
- Link to v5:
  https://lore.kernel.org/all/20251231075817.2611848-1-shuai.zhang@oss.qualcomm.com/

Changes v5
- Separate move WCN7850 and add WCN6855 fw name commit.
- remove WCN7850 unuseless condition.
- Link to v4:
  https://lore.kernel.org/all/20251226075621.3223336-1-shuai.zhang@oss.qualcomm.com/

Changed v4:
- move WCN7850 WA to the caller.
  handle cases where the firmware cannot be found.
- Link to v3
  https://lore.kernel.org/all/20251117021645.712753-1-shuai.zhang@oss.qualcomm.com/

changed v3:
- Remove CC satble
- Update commit
- add test steps and log
- Link to v2
  https://lore.kernel.org/all/20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com/

Changes v2:
- Add Fixes tag.
- Add comments in the commit and code to explain the reason for the changes.
- Link to v1
  https://lore.kernel.org/all/20251112074638.1592864-1-quic_shuaz@quicinc.com/

Shuai Zhang (2):
  Bluetooth: btqca: move WCN7850 workaround to the caller
  Bluetooth: btqca: Add WCN6855 firmware priority selection feature

 drivers/bluetooth/btqca.c | 60 +++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 24 deletions(-)

-- 
2.34.1


