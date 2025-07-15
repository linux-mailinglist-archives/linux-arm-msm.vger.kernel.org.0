Return-Path: <linux-arm-msm+bounces-65065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18878B06379
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 17:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6EA64E566E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894F8231845;
	Tue, 15 Jul 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQEGVn5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA8225792
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752594648; cv=none; b=iJX1oMjtuEfB5XhJTmSJNn4FKZsF0ImVnKqgIRaKFCSECRUXxJH1k0V2fXoZbN749GQZzgK5WryPfT48lgKxiPUMgFxydfdb8MlypxKcBfWYmwPZqo7OaUJK4UTu0uyuMoeFxcmV70waZL49ELHs0GbnTouNcblOHorUX9qcvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752594648; c=relaxed/simple;
	bh=uVU4qfB9epMCD8J3LDlRZCEMKms3Mo4AdZkgzHl680A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pJiZFKUASJvYWAshLjL6ZWUSVjQgIOaMzu4GbWSwMxUVGJ6Ni7uxmB6p+xKD7eS6VPwY40SuMBoDQNKHaVHlA1URoci2NGpJ5PgrhNsqDTOFgz04bGocNbV+nm/3EWuhEqrzyJ2OYmJXjsSIJ5r1Uy/f4a5PI6bk86LhSOHHUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQEGVn5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FC6i2x027528
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2AcW1BhEgDlmeNBSdQyzH3
	pkKxWbz32d24bGDkO+/0U=; b=pQEGVn5Dv17L6DISZnI07Toff6NA/DaTEf46dY
	BT1tvHmQrg1VLklO5hv9ad8uT22ryr2PkcDvQt95AdFZTgk4s7HtTP2KD6v74BXo
	HQmW5eAO7uDrSgrqBG1UFEt1Qxv+8o2JQgonO/slXMDpFANWvUplTY/imsilwKPz
	6QLdNLniGl9vTKNVW02LFnUeAAsJfzqeg0fmcGjsWKcV+yrXxrAQddNM86ce2X4e
	LdlF/hS1+t7lx8z4h+6gm1ooRfkn9iJF7LcxGgBuPNYuQjlzvEMdmbB2teFDNOm/
	kiSXdTCcQfAHK3sjg7g5VuUHA6eHSU/TKhLr7lfpuVv7D70A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut8qdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 15:50:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e1aeab456cso348580885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 08:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752594644; x=1753199444;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AcW1BhEgDlmeNBSdQyzH3pkKxWbz32d24bGDkO+/0U=;
        b=Zoz6QBAEj5bZQhl1JSpO7uOKxXcgS5ZCmdQC6CHX+Iy1mmtoJr8H52guoohmCHloEW
         g+TbMTtjd98Zah7ZH3ZWb15i9siU8McWnBd/1qheHc67iBsHBpE+ZuqRiCkjryKEwkDp
         iy9GJ9Eu+1YxdnbdT24S4O5rxw8/XVDnWZ4QhD4AsaV0/I/p0YE7LrZ+eYlpyBE/1/2y
         aDpf5ltM1iHfnG+sn+9zwRV10uvO5XptqMWN+z7VbYk1XkbvgI01gaGl++S6EXxr4i54
         MEpH2+TLgyGj0KZlEAyAMD2q6dMCsVsirlO+Aab0w+Z25fpj4nJdszqhAuCHc1bahp+L
         Sx+Q==
X-Gm-Message-State: AOJu0Yz8vhimyu7li1OJO2xXwrHTxydt+UajTom1llxDfSn5hOD+NAny
	IiUlXuoqRsTq1p+Qkq2QlPgTAmSZTO3QfJ/7QDfmHH/LEGHNmnbkbKmOdas1YcyI3WDAqkRgjwN
	vnzFCjLawaDHwtY9pIgZvHH1hKg7WexMbBiTIKllLnpZAkI2712/kX9tJabCt2A/5ELBL
X-Gm-Gg: ASbGncvYTk8EIxDORP72cR5IUpaLnZeXu/IlcG53wJ2DR/dMijsvvtcyXT6oHFT1MZN
	RgN4/+1xPyxuR/0N/DK2JQhCPHGLXeccaGrHTn7sTnV4NraBNw3SvOT+UoV2ZVPfqhwDy143VNa
	Cp/7teDxThDFWncYmqMpv2uFI4c6TKr94wNGcB52fk9e6nkP0PC2F5SBqO+yYC90TFJNNnyTTHM
	dE79CFhLF4DTYNr4B/x7RUTWj3+tYlzjmaQXptbTN5ABrRDeCsoCrId44yAjEJNKr23Kdf9/YcQ
	X+y+s9fVV1zOqPySA7gpe1tvG6NQNSFw5hWknWSKbv2rbPmSH305Eezap4f8mXhDl1baPUrKIrL
	jta/P/Mdb8CUt3wt9VsQsTjHqUVjd3JJu6+MfmOhwuL5QSuJ0oVyy
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id af79cd13be357-7e338d264c6mr486436085a.50.1752594644283;
        Tue, 15 Jul 2025 08:50:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrxYhCkGKF/J8/9k5Ypj9qfEmAc1PmrxBkRJd163wQETFD40VBBA4U2idmT11OhS/43lnZgw==
X-Received: by 2002:a05:620a:472c:b0:7d7:891:83f with SMTP id af79cd13be357-7e338d264c6mr486430585a.50.1752594643555;
        Tue, 15 Jul 2025 08:50:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60786sm2308820e87.145.2025.07.15.08.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:50:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 18:50:37 +0300
Subject: [PATCH] drm/msm/kms: move snapshot init earlier in KMS init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-msm-move-snapshot-init-v1-1-f39c396192ab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMx4dmgC/x3MQQqAIBBA0avErBtIS4KuEi0qx5qFGo5EIN09a
 fkW/xcQSkwCU1Mg0c3CMVSotoH9XMNByLYadKdNNyqDXjz6eBNKWC85Y0YOnHFTzjlrhqEfLdT
 4SuT4+cfz8r4fE4pXNmgAAAA=
X-Change-ID: 20250715-msm-move-snapshot-init-b1fffd54437d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uVU4qfB9epMCD8J3LDlRZCEMKms3Mo4AdZkgzHl680A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBodnjRCX8PRuLqC3PhqWisV8FTS/LZBRS33D4vt
 9r54Nq5mImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHZ40QAKCRCLPIo+Aiko
 1TemB/wOWabSbpAVUdpuqEgBsVBkcM4kWTZlNSLw8MTSO8yEie3avz/PZOJbEqbH39/8WwNKErB
 0fGXWGf19X964Zk91BWY7sjnUS2t9G5orqYoJChUdfNXcDQTglHpqrlPtNy5UTYmAp6xWXu8879
 vu6q9lv3QkF39V6/klZ9iRl0LS++VPxUAS8wMAtaBNSRTHQk0j2wNFurnyjIXoGBy5QYO+4ENj6
 +8FS3PtXYTDStz1jgzgV2iwWoidl28EbABqQiE1fEbPKO3DXB4+HQKfQ0E1lnuugGjh1+vxBLhH
 bOPmbM8E/SXXfA+hk/PFeEMerXDhfjeQTuZQAjF/SkU2wPRV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687678d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=B_53bHkj_faIvDvQsBsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mbrhkge7qS2QNsBKBgTFW4JiAmDBNcLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0NSBTYWx0ZWRfX6dZ7evIVla2C
 EdpJaE3Ot8UydS7jSRxkO7tBT+epYG9nc4e0TBJ9Gr8qv0dyWIaE5JMcO0yTM/JbSYoYkMosjia
 fYsSmPMiYnO0Z0cavkwcEQUTm1SOT0MI7JWSvYB79K/+T71c4quUCXZJb4iDJOBfbCB5R8oXCQO
 wzOw0pvFNpjm2UGJJEz2KhWWU7c6lqa86rDezSt3Elt8rze+0O6E0PMbAF5vwV0xkPA8lxVcyQx
 73n/x2VtSpP7fBsNT11DMarIQZ3u2zm/ShgxI4HTDO713eVLTSZnV0XUhDn34F1ZJ8PRGNbmZVp
 7UH0P5yWGutpckLN0P2RGQDPBSCwV+g/8bFusELa7swUF1jAGn6kO2BWVa9yG6/tZ/YEp9qOpKu
 iTNGuzdEBQZ2laFaEDTWzZYrGITGJhXPb/pfdbxC11s72lvIwwAQgbRXtllFbO6G4T77/OWN
X-Proofpoint-ORIG-GUID: mbrhkge7qS2QNsBKBgTFW4JiAmDBNcLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150145

Various parts of the display driver can be triggering the display
snapshot (including the IOMMU fault handlers). Move the call to
msm_disp_snapshot_init() before KMS initialization, otherwise it is
possible to ocassionally trigger the kernel fault during init:

  __lock_acquire+0x44/0x2798 (P)
  lock_acquire+0x114/0x25c
  _raw_spin_lock_irqsave+0x6c/0x90
  kthread_queue_work+0x2c/0xac
  msm_disp_snapshot_state+0x2c/0x4c
  msm_kms_fault_handler+0x2c/0x74
  msm_disp_fault_handler+0x30/0x48
  report_iommu_fault+0x54/0x128
  arm_smmu_context_fault+0x74/0x184
  __handle_irq_event_percpu+0xa4/0x24c
  handle_irq_event_percpu+0x20/0x5c
  handle_irq_event+0x48/0x84
  handle_fasteoi_irq+0xcc/0x170
  generic_handle_domain_irq+0x48/0x70
  gic_handle_irq+0x54/0x11c
  call_on_irq_stack+0x3c/0x50
  do_interrupt_handler+0x54/0x78
  el1_interrupt+0x3c/0x5c
  el1h_64_irq_handler+0x20/0x30
  el1h_64_irq+0x6c/0x70
  _raw_spin_unlock_irqrestore+0x44/0x68 (P)
  klist_next+0xc4/0x124
  bus_for_each_drv+0x9c/0xe8
  __device_attach+0xfc/0x190
  device_initial_probe+0x1c/0x2c
  bus_probe_device+0x44/0xa0
  device_add+0x204/0x3e4
  platform_device_add+0x170/0x244
  platform_device_register_full+0x130/0x138
  drm_connector_hdmi_audio_init+0xc0/0x108
  drm_bridge_connector_init+0x318/0x394
  msm_dsi_manager_connector_init+0xac/0xdc
  msm_dsi_modeset_init+0x78/0xc0
  _dpu_kms_drm_obj_init+0x198/0x75c
  dpu_kms_hw_init+0x2f8/0x494
  msm_drm_kms_init+0xb0/0x230
  msm_drm_init+0x218/0x250
  msm_drm_bind+0x3c/0x4c
  try_to_bring_up_aggregate_device+0x208/0x2a4
  __component_add+0xa8/0x188
  component_add+0x1c/0x2c
  dsi_dev_attach+0x24/0x34
  dsi_host_attach+0x68/0xa0
  devm_mipi_dsi_attach+0x40/0xcc
  lt9611_attach_dsi+0x94/0x118
  lt9611_probe+0x368/0x3c8
  i2c_device_probe+0x2d0/0x3d8
  really_probe+0x130/0x354
  __driver_probe_device+0xac/0x110
  driver_probe_device+0x44/0x110
  __device_attach_driver+0xb0/0x138
  bus_for_each_drv+0x90/0xe8
  __device_attach+0xfc/0x190
  device_initial_probe+0x1c/0x2c
  bus_probe_device+0x44/0xa0
  deferred_probe_work_func+0xac/0x110
  process_one_work+0x20c/0x51c
  process_scheduled_works+0x58/0x88
  worker_thread+0x1ec/0x304
  kthread+0x194/0x1d4
  ret_from_fork+0x10/0x20

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..56828d218e88a5fa597755c8ea20da781929386c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -275,6 +275,12 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		return ret;
 
+	ret = msm_disp_snapshot_init(ddev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
+		return ret;
+	}
+
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
@@ -327,10 +333,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		goto err_msm_uninit;
 	}
 
-	ret = msm_disp_snapshot_init(ddev);
-	if (ret)
-		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
-
 	drm_mode_config_reset(ddev);
 
 	return 0;

---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250715-msm-move-snapshot-init-b1fffd54437d

Best regards,
-- 
With best wishes
Dmitry


