Return-Path: <linux-arm-msm+bounces-76275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C8BC2D2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 00:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D643AB029
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 22:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0DE41E3DCD;
	Tue,  7 Oct 2025 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJ++I17H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3181922FB
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875137; cv=none; b=SST2qcVrZpbd4/339BFWmOUTJVQI1XV68ySKnX4uIsp/n1znl39TczJ271+LrrmK7t228vXGTYcetCoWkDSVCksaf52sP86dZNUWjofqBliVMRK7+RVEA6Zy7QqA6LiAWYokq7Q5OUDGz4BzvsBPbHw/K24w+4hhpNVz3ERxMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875137; c=relaxed/simple;
	bh=MGiRuz2826ic+8IAqAG5914N1gSt408Qr9Jck3Nzj38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFUS9JbijLc+ePkxeBoWLUmCVAFiU+RGBMA2vXn9YoIZ422u6daz6stY1re/NtKT0KdJa1jF2wiM12IGhKNHpoIeiE0bfaFJg0FBSlaHeaaUyv10nqbTLxFLjw4IfnZ/45nXAmJcKiHDLC+wsQzgPFKiH9+AOOrvavdcxMl4HeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJ++I17H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7oe026596
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 22:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xg5m10CEppQ0xzXGimFATjslzJR1gZK01TR
	wTSTNwyE=; b=ZJ++I17HsrqyyE3mNJYv9cczfIfkZcZFxzCAk3SlbdAaQnv3ELt
	kXDqWlX6bd/u6VgVpCiv6SsXvc5b+f19Vb4iJ+4uSNokXK9I38coYozW+ySq5cuw
	My82aiVlY2e5Db45eOh7FjMKj3Li6z1eY8SyY873o4ZlLgai6R7wy8Tt6YKCFO7m
	qHnp54D1wezceGp2mCBXbZF2qL9+Pn9Eg1lqfYjUhabS2YzEX8UqSNdvbn+JijTd
	375eqZ8CE7T5sHfmWJ38D7gEfOD/uuIvt1jYHZXXbytqo2j5Fe1x4fV8xYt2i1ot
	ubuu4+OYihZy+hfxgzDwiG6M/4waXHVuoZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0mejy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 22:12:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4df60ea7a1bso144189271cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875134; x=1760479934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xg5m10CEppQ0xzXGimFATjslzJR1gZK01TRwTSTNwyE=;
        b=w947R6W2hp5q3mbNKtxFTnclFq5HSDwiHMDPXAwnX59wX/O+eTSCUaFRlxd/1L4sx2
         vNIfl+aHQRW5MnPkmluPBR6gSeRLQwFe5oVEK9VTO/MJPeBQJy5pzg+4pgqYJ9QhvZ2U
         DACENeranCH+kCfnjOWVKRjbIrHowb6j0+mW5Xk51meCVr1lcdvc555kkedt2lRi/IWM
         wJR0fJJxl7/B9haS1ASJAyJ+K6pudBGDkB1U8NY+qccMw9V4n/pnerRDO+G5TQP3tfxF
         y1GEBb6I5XtPN07THDN1cU+JQMwQijSDxRtQnH4sSoxVxdx2EV2Qfb+T9m2Lhv6MWvo6
         d7tw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+tUI2LFxPwrRG7WaahLcJ7fNEiW0/yyiWj2z5fxjlwNzlum/1+lbHjf9s0PlmDs3a02qQKiG1Xpz+nXq@vger.kernel.org
X-Gm-Message-State: AOJu0YxGy0cTxP10iHVMxfu+iUZkrDKNeleU59sJtIvcoAXlx39pFv/N
	zBENG7qIunZCzzNRRvWel6p7tzpARBviqSyFcED8Jn4+xC/bSwjTzjOOGRphLsVkoNk61xLZjb7
	OSjQOF7ZPaR2uwb3Dv6fxsNtJbal4FLj0j6YYEQsy5DurbHAdid1OzFArvAefvNfV5TCX
X-Gm-Gg: ASbGncvc+/FINdUHwWf3wI40jCHeCELAfWRrGjVwz8k3Srl5zvlx+T3KiMQNk+Nux5+
	HMEb6I31wzc8BUt4MMd1KYRwq6y3cpU0dCLqSTj4q+0yt6aABi8rFujX5koCkAADBhcrq8WKa5R
	kp9UV4zYvw4BhIYxlORGZ4MTB4g/8CgVKEJBgYEejjc4xXs3To9xKErjN9uw3556zw0YU52T2sG
	Uo0hqaXgrVhUgrFQw/k4ijhZZ+hTze3vzMnlpTxg2a8FaMs6uwfgfbp0ooBUzwAY82UYxyhbO0I
	sIck/H2L3NeaLbVgbkz5tEMDEcJdFD/mqQkmRuxoNZcHwKtygIsUpoh/8m2gyRLKuxhq0Q8QSJr
	yaFy/BZtZ2A==
X-Received: by 2002:a05:622a:30a:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e6eaccbe4cmr19293441cf.1.1759875133608;
        Tue, 07 Oct 2025 15:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsW7IJmcCaiKfH0qMCqGiVY2cA1KkP9PYbwomikj5gixk5mB1EP5eChI96s7SbKEPjTn5o/Q==
X-Received: by 2002:a05:622a:30a:b0:4b7:a92d:3d99 with SMTP id d75a77b69052e-4e6eaccbe4cmr19293061cf.1.1759875133128;
        Tue, 07 Oct 2025 15:12:13 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa62csm1451441566b.19.2025.10.07.15.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 15:12:12 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Ensure entry belongs to DBC in qaic_perf_stats_bo_ioctl()
Date: Wed,  8 Oct 2025 00:12:12 +0200
Message-ID: <20251007221212.559474-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HW0Jnu8DaWZD03yMhaMLrqBnJS9V8USm
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5903e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=NS4B5lQ4yxVAsqoyy1cA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HW0Jnu8DaWZD03yMhaMLrqBnJS9V8USm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX23OKLIP/X/TH
 Q0oZ+KOkQ/SqY39B04IIJXCBV0rc8seBMaFAZL2QPgYDY8yfXQLugszlhzhzdDVy1xwfULe4IW9
 /yoY33JA45pAqCXNuEKvaVFpG1l40znaqHZqMe6VlheF7mYURAPx94voR1Vgo7P9Tu7uBuVxEze
 aPJZMi3snVch9O4XyNuTtrL6Jl4VlQXb7Iv2ZwDB/yzC++/6UDzcg2vWHjFaVWH1RLyaPdLMx5u
 n4K7aw+ACvJdS3+e1tUK81n5CdgxrqrHxMoHxYGreApPFH0Hqt4bi7qFtwaAxBGecQHkFSq3g4J
 K/h0ptAM7wqNua2EgzNd5GC1V5WUoZrBLVRKpvTbwaGaxaWKBR8imaOMcjAoYL+8U0Eu0HYXPOu
 ZdW09LK+FzSgbg8hWW9RrQvC2SePiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

From: Youssef Samir <quic_yabdulra@quicinc.com>

struct qaic_perf_stats is defined to have a DBC specified in the header,
followed by struct qaic_perf_stats_entry instances, each pointing to a BO
that is associated with the DBC. Currently, qaic_perf_stats_bo_ioctl() does
not check if the entries belong to the DBC specified in the header.
Therefore, add checks to ensure that each entry in the request is sliced
and belongs to hdr.dbc_id.

Co-developed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Signed-off-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_data.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 797289e9d780..bad587b56b1d 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1781,6 +1781,16 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 			goto free_ent;
 		}
 		bo = to_qaic_bo(obj);
+		if (!bo->sliced) {
+			drm_gem_object_put(obj);
+			ret = -EINVAL;
+			goto free_ent;
+		}
+		if (bo->dbc->id != args->hdr.dbc_id) {
+			drm_gem_object_put(obj);
+			ret = -EINVAL;
+			goto free_ent;
+		}
 		/*
 		 * perf stats ioctl is called before wait ioctl is complete then
 		 * the latency information is invalid.
-- 
2.43.0


