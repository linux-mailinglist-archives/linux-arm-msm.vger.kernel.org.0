Return-Path: <linux-arm-msm+bounces-83730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C64DAC91A70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 725253A28C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35A13081AE;
	Fri, 28 Nov 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYeSbLIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIl7vQoU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC13304BDA
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325985; cv=none; b=m8comFFJDA2Qj1WzSY+tOIEvTfiiaBj85YKs35aTSREcgpyrYqlZKdSMa6caRZzyY4+cVE4EU4W59mRZNqWcBTA5nXzEjE/NublOdOgk0HUYDs7SaJDgDr2ZGjM9k1lRY4X6518jdADS67Y2WJt3A8fzdB6I4qBx+7IsPQ/6pb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325985; c=relaxed/simple;
	bh=dJHuYJEvL1rRBBbsEdYn2t33+s5xygGtCdo9UREB6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mxmL2txmio1z3pgGyYmuDs44XFe/eCdcW8+ZFXgrThf6WgDIEmRRVKlWpgSWzU01EK2DJ7Gf+8x0uYL/iZNt6W9UUz4wR1sVmY0i6rPHGcOdsVcWVxTamKMgYzPR8cVA96pmdSa0d9PtTm3836jlpUy+LawsibfppzSHwY0zW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYeSbLIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIl7vQoU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8rmYn3989819
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z6Y7LsJBqEVOLptCuHv55G
	eGUfqMRTrUDxjLNM76l0U=; b=IYeSbLIw6pzukGzPXaBk5l0jC+vajVVYVn3qjc
	xqgl1Kcs5SMhrcAtd04qp+Mw7kzypSjTVUH90inKGM2V8XjGI/4ZSDKXv36vAV/l
	KgdoX3PVwPCbxvn2/FHXOfhVQW+yDhqPT2gh8255uCRyUahQ+/lnhTRmsVLIKxTV
	xXX/5gC/su2B5CGS4nR6j/+uQNv9YQexA2p9GeOY/C4s0wNx8S6aYAGYeONUppOW
	SEMqjPY3+f4mih2TP6YIt6Qq9iMuJJYwJeV4orKtTS5G8sXVM77dGd5z8E2ePUhL
	k8Dj7jnqDnp/uFJVm1xVX7W8u2+AcHeYyjtC8vWmpTbpkVoA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm8a27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 10:33:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so1634960b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 02:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764325982; x=1764930782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6Y7LsJBqEVOLptCuHv55GeGUfqMRTrUDxjLNM76l0U=;
        b=EIl7vQoUNeEgz1NrqDrwLjgQNNA5270HGCVjJMKA29sAKJ1qvfZcX3AIEVeCQtgb03
         kb6fGvVZzIB6PdPn4aghQxFUQEHD+rmbzIDiAFhlFzeLecv4Pp6nf50Il6R+JgQZxoHs
         sgQBBT5ryFImMmk+l+vT6M7SWePWuE0OWG/NihvftFsyhdJziuHBXWUDNQnDbTNebO8K
         9NOugHvsUrt4yaOMtb//qOGj+ZKt+YI8k95QJCb62o2EkVq5mKeBrXaRYKLi1muYJlmO
         wIIr5Wvj+HY0KtpKVFr0F/xSoKVSRFTFSSTQJ8Dt0yJNTqR2YMiBHBhwmI9CvfZZka9W
         QO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764325982; x=1764930782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6Y7LsJBqEVOLptCuHv55GeGUfqMRTrUDxjLNM76l0U=;
        b=eCEYMhXWyyOUbh2xHWmFO20u3sKrBAcXkEook6EBDTyAXSUL5iw12UwW6RHzHjFHun
         QPufR3oBUSmZyppfbHVj3wpHtLGuDr4AMdsOwPW+0cVAn9pkAdH68F4arwlIkFMEoG2q
         Yt1oj29m4TmMoqfkA9ZhGjvzRrfyHxyIjygp7aYAgZkrIeL7lVHPJVVb7bxOtRz3ACKJ
         5MGBjh/qh3Re7KWNqyFK9z8MPwy31ZPSWPHyfqg8aLLei1hBHGex1XxSD7xNGJ8SglEp
         VUs36XIWKXKMehd6f7bdONZu50IGtI4qLTLQhLBtSbSw6ahTFa3F2gUCUAKOGEddwReF
         Djdw==
X-Gm-Message-State: AOJu0YwNDKf2GmMh6pN07NtPKvQm3ndr8wA5bFly3CFGDkYHbqmD2y0v
	Dz1FcjD/aIQ9rD15b8uqJaNYmmRLRTEa9kHnNTi6Asl9rRgng+evdbFE4U0i7vj4U854z+O4O5y
	gqaov0yvSIChRapfUx8275GoAtw1PLmOCc9rKzDd9Y8aNVDNmVomywAM+4K8ZVUV0+LGs
X-Gm-Gg: ASbGncsuvgSectR/kGiz0H6zBG6SGAUFj1iT5VR0Lgd9v0UcyB1HwLNQNHfPpjtwwGf
	9UWN24NXoZB0qN7um+JzVGV0zowbDR08X3qefDqzabF4O0DEk1SLhQXNeOK+2/Fcjlvf2QaZzeR
	RItVCY1d3jK9sFJJ2Nw/1tnG3IncKHtuF8okPD/SgBGV2CZjV1wSlWMbFr2UGrBivLJWdl79Og2
	IQHJDwqlo2h0+UOwvR0V0vAxiltGT0G+7NroV3z9j/9o1VaIK2i5+4/WrWFqbZq1b2IDK+I/VCO
	yJwEFk2bWYSTqhe+fNnfhJ0wc3noQQsJK/QBXHQiDAz145X0NqjGagz+jjiegbaqkQPaCjeRFZM
	jJ9nhuiIGIq5Vaam9/fTRncpWtzhXOix/PXB2
X-Received: by 2002:a05:6a20:1591:b0:341:84ee:7597 with SMTP id adf61e73a8af0-3637e0a594fmr16151168637.47.1764325981928;
        Fri, 28 Nov 2025 02:33:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEExCAMbX+V78gel3+8+XZSxOXBn9rI5asFn0Tql4THeBDZpdi1KGWI418mohHn8qMFpygXvg==
X-Received: by 2002:a05:6a20:1591:b0:341:84ee:7597 with SMTP id adf61e73a8af0-3637e0a594fmr16151127637.47.1764325981228;
        Fri, 28 Nov 2025 02:33:01 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b683fdsm4567815b3a.2.2025.11.28.02.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 02:33:00 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4] remoteproc: qcom: Fix NULL pointer issue
Date: Fri, 28 Nov 2025 16:02:40 +0530
Message-ID: <20251128103240.1723386-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BKJ0FRoMSQzC4l0_nURilSdiS3K5t4YF
X-Proofpoint-GUID: BKJ0FRoMSQzC4l0_nURilSdiS3K5t4YF
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=69297a5f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=L9BFLZDJu6oL0ZB2OBoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NiBTYWx0ZWRfX5vwmn7dUcST5
 WjZsUWV4fxQFI5YuyCkAnvIPhlh7rFlO7bve7KoliOhuF7JB4Yvi84okPgMSSI2Z4d06/d/LF4f
 BdZ+DtI+0n2kPEG0uMef+TbNuzYx/YjSP6VZ3OFBWc6OHgnjnb+oZ2KJvoyIkO0LDWVfpyZ43DN
 jlE1X7y2GD3t+2jX66Zg0HJwYvLavNzjX9xoQOepHe9SwjWGeMjk+nc2l+AoKUUckFDpIcQAEbX
 REIEPQlQdN0IbFoIiLjF7sZJQeNR6GOwx1uoqFeTluAZjHl9h4Tyb40k8MVegK10JKb2zKORunx
 0/1kYSHG0N3cW3UV6Z5ZOSpHzBOcdkMohmmK0xhLb3KNzikFxujZW4h09fAYtNkuEWSWL0elJAm
 PmUZxgjcwAYeYXuWCLoomZYsx8SiPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280076

There is a scenario, when fatal interrupt triggers rproc crash handling
while a user-space recovery is initiated in parallel. The overlapping
recovery/stop sequences race on rproc state and subdevice teardown,
resulting in a NULL pointer dereference in the GLINK SMEM unregister
path.

	Process-A                			Process-B

  fatal error interrupt happens

  rproc_crash_handler_work()
    mutex_lock_interruptible(&rproc->lock);
    ...

       rproc->state = RPROC_CRASHED;
    ...
    mutex_unlock(&rproc->lock);

    rproc_trigger_recovery()
     mutex_lock_interruptible(&rproc->lock);

      qcom_pas_stop()
      qcom_q6v5_pas 20c00000.remoteproc: failed to shutdown: -22
      remoteproc remoteproc3: can't stop rproc: -22
     mutex_unlock(&rproc->lock);

						echo enabled > /sys/class/remoteproc/remoteprocX/recovery
						recovery_store()
						 rproc_trigger_recovery()
						  mutex_lock_interruptible(&rproc->lock);
						   rproc_stop()
						    glink_subdev_stop()
						      qcom_glink_smem_unregister() ==|
                                                                                     |
                                                                                     V
						      Unable to handle kernel NULL pointer dereference
                                                                at virtual address 0000000000000358

It is tempting to introduce a remoteproc state that could be set from
the ->ops->stop() callback, which would have avoided the second attempt
and prevented the crash. However, making remoteproc recovery dependent
on manual intervention or a system reboot is not ideal. We should always
try to recover the remote processor if possible. A failure in the
->ops->stop() callback might be temporary or caused by a timeout, and a
recovery attempt could still succeed, as seen in similar scenarios.
Therefore, instead of adding a restrictive state, let’s add a NULL check
at the appropriate places to avoid a kernel crash and allow the system
to move forward gracefully.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v4: https://lore.kernel.org/all/20241016045546.2613436-1-quic_mojha@quicinc.com/
 - Brought the same change from v2.
 - Added smd->edge NULL check.
 - Rephrased the commit text.

Changes in v3:
 - Fix kernel test reported error.

Changes in v2: https://lore.kernel.org/lkml/20240925103351.1628788-1-quic_mojha@quicinc.com/
 - Removed NULL pointer check instead added a new state to signify
   non-recoverable state of remoteproc.

 drivers/remoteproc/qcom_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 8c8688f99f0a..6480293d2f61 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -209,6 +209,9 @@ static void glink_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
 
+	if (!glink->edge)
+		return;
+
 	qcom_glink_smem_unregister(glink->edge);
 	glink->edge = NULL;
 }
@@ -320,6 +323,9 @@ static void smd_subdev_stop(struct rproc_subdev *subdev, bool crashed)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
 
+	if (!smd->edge)
+		return;
+
 	qcom_smd_unregister_edge(smd->edge);
 	smd->edge = NULL;
 }
-- 
2.50.1


