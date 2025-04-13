Return-Path: <linux-arm-msm+bounces-54126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A39A8728C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 18:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18707188F783
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 16:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64AC1E7C2D;
	Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lFxlRlw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD601C1F21
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561989; cv=none; b=pY5Vxss2quCXvYKy234v8ZU9h6M7A3cnLXzkOHLTD1YzIrnpMg/TJQSdbdncXfIH7XPQ60a+FfClvKGpAoxepbArcB2C8JsCl0Mf+e9K9cIv62p/BSwabp5dKRPsW1Jb076fp2jcaTgGpsL+NDKs9cgMiYHhJg31l41cYTsebWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561989; c=relaxed/simple;
	bh=9yxMEHvKcP03zKtalrD4vW6AanrAlYnI7Y8o1GM4qBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZNKptzeVLTUPCZduUvFanOwPELzAKs2qvugoAZLmIN4IrZEzQEEW7bCnxVjynWqJPcUrPke1YGH828TUeluo9ZoFwSqCTvdQKKf+1WpbWZ1iB3kXqjNoK6VpQLdYI3BPsXSAw5WafsNl58kOcP95Xf4+1lbr++s/HOlpGJWPAzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lFxlRlw9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DCPDMK013797
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YBl77YCXWG4OvagfLRquKk
	7aupLLR8079UVqKJKZGMQ=; b=lFxlRlw9zR4dMXfQHbQF8y7GJN3ACKQN/PNHRa
	QJhhlQeX24tVvBIUCRQlv6X9zFqROhnfSxnm3izl3XZbBL6thntR4IU7gJXEtV3L
	JfB2QyKMmGVclOEn1tQ3AlkQ8S3MMZ+vRfXMwjnDuIoUMg4rh1N9JjSGOVMgyRJb
	eZSNdIPkSJXghARosTj4nZi2jgfwtHSkIYpOPZegsf0C+wc0fnvtW4060gZl6qhV
	mQJiQqJOBnUM4ThSGSDJ7PxaFyDAh5pNQf05cl9IGo8qR315ti+2VPJF0GQcHhpd
	vfjVl7GcigZe0+c1g7CFk20HQ8ubeml3XEAqI/lxH+SbMgZQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs12e5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 16:33:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91a184588so109734276d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Apr 2025 09:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561980; x=1745166780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBl77YCXWG4OvagfLRquKk7aupLLR8079UVqKJKZGMQ=;
        b=VriB7Nc+UlUVLO3LROZPyVwDyHZymx8N+1wXf1nXfNEHxxMIRbiLp/nmnvIWWudvPh
         BZVZvmeiSTUqjqYYNhOkJmt467qyfqamsFaEmwFL13Wfy8c5dAb+LiXB03Cq4GClB5X9
         FWOUWG//jex2fsyDwTXyXhnu6MZ1ysQtDoePDAe6YM78+fKsYfL/uJJZT45zYqC4OrUZ
         s7sygV08t0G5h5L4STxZFUeiSDQX/meT16aRMV7R8zfAgRQgFFQbKY9fX6CpiqjPCAwu
         kjHz19HYxcMFDiYWL70ljjnq3qHpNcaMbuA9AT9j5K1xu4QNAiWflMbCi7y4ZSbuERyY
         gwhw==
X-Gm-Message-State: AOJu0YxAdICITkolmA9rSZOoTBtxDi7vNI67B2qF2U9if+HL7hqMHmhY
	XkW/ECBR0M/Q4d1s+VtTH+oA1M1GR1YLv5zAAsbgtKYgB2Ur4CGChZqu2Aomn0W1GFHMWzSwSFw
	22d8gESUeGemG7OsNJjkLjpeT80CKzgqVyfzaw3XLWqWKDFKYgGQ1zudECSj4OVuf
X-Gm-Gg: ASbGnctgKJZGnL/m/X7g6hZ1n/JtNqhDpo5KVYhZKuwMsrkxeyOieMITa4iUE7gUVw0
	OhHZwXxIOtEtTzTe1nqpf12folX/GiqjpJaaPdSmCk3D1Lo8Uj7g75G0f86WNdf0xnsjQAc6mk2
	pmk/xDnx7dn+JQBUMrqkxxrK1tJM7J3RBwgBzHhG/j4ugETCAiTJEnTPaO3HQgX1T7y+YNlftLk
	3gTpw6x+DvDifRqWQbeFGQQ49IVzetTw01RvFQkjK7nJ1oBcDgi1SJR6rvEueOwORIWpOlPFcHH
	u79oKHdgcPLrSURxgDVBBE/Rv8RL4az75/Oyb949MmyRyD4QkaxpjtUq9/bbG/pY/vN2rV8kkYb
	ErnEi4EaOhIf8DirBC7DAhmre
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id 6a1803df08f44-6f23f16f311mr145153076d6.40.1744561979958;
        Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtCj60GSXxfWYW6yCvFGLGwmwV2r19VcaQu0T/FGwl59yVWji21Ut9R7m3Ll7RuSOvQbKz3Q==
X-Received: by 2002:ad4:5be4:0:b0:6e4:41b3:497e with SMTP id 6a1803df08f44-6f23f16f311mr145152756d6.40.1744561979496;
        Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:32:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/7] drm/msm: rework the ties between KMS and GPU parts of
 the driver
Date: Sun, 13 Apr 2025 19:32:54 +0300
Message-Id: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADbn+2cC/x3MSwqAMAwA0atI1gbSUhG9irgQjTXgpzQqQvHuF
 pdvMZNAOQortEWCyLeoHHuGKQsYl2H3jDJlgyVbkTMGN93Qhws1rHKircmwa9jRTJCbEHmW5/9
 1/ft+QL+XvF8AAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9yxMEHvKcP03zKtalrD4vW6AanrAlYnI7Y8o1GM4qBg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c4vA3nd9QkmmdiQrZIPvD22E3LjnDqLpDGA
 ryY5j7Da7qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOAAKCRCLPIo+Aiko
 1aPSCACvx9Tr29RYG5QYv4mlFUzXExNlNdqg2FBYwRpglLSvUiiNhiLE/JINv+O4UNIDQIAl67N
 QXDf3cOGw5+9GuPQWMZfDZ6zIO5uUXnmyLUlbv4lmz2zmaqB9K3ddfls6oIot9C12zfu5nRx3Jf
 fGW1FIUAAN0cbGD/OPwER5sX2wCcW29UBzkOzPDHaxmqTTuUhhchVxT1ieZQ+m16x+nGQkvrAeO
 bK1QTCWmym68tB/O58e4YiQib8OtH4f9OkC0xqGRgGfFx2ni3684pkZFSXjYHuFuVs5P0tp9ZFt
 oVMNVLYEApTa2H0Etq2VaYlo8TTjVDpQjh+Y1M726qplCqDe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fbe73c cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gunw-TT0iufYsHqiWz4A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: A1zPjJR_6HyvWLQXZQcueWUeWGSHGcr2
X-Proofpoint-ORIG-GUID: A1zPjJR_6HyvWLQXZQcueWUeWGSHGcr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (7):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices

 drivers/gpu/drm/msm/Kconfig                |  34 ++++--
 drivers/gpu/drm/msm/Makefile               |  16 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  39 ++-----
 drivers/gpu/drm/msm/dp/dp_debug.c          |   4 +
 drivers/gpu/drm/msm/msm_debugfs.c          |  97 ++++++++++-------
 drivers/gpu/drm/msm/msm_drv.c              | 168 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  13 ++-
 drivers/gpu/drm/msm/msm_kms.c              |  36 ++++++-
 drivers/gpu/drm/msm/msm_kms.h              |  25 +++++
 9 files changed, 285 insertions(+), 147 deletions(-)
---
base-commit: a4e1d05abd6847ba11edf46734efecec86a1fe2c
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


