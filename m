Return-Path: <linux-arm-msm+bounces-78404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25775BFE27D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39834354FEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 20:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2936427A10D;
	Wed, 22 Oct 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO6O/tXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE9A2EAD16
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761164733; cv=none; b=gIScfhzCQ07UaxBIMCA2ATEdT++t7kOZFI6eQKrqg+pqFU18zlEa57tYnJSxAD0TJiV5aEwWqzNoUizDF8z7TCoEPAkDuYV/PckXpRpcJV8McJ4tyqK8tGlTl6+2vPclRcjLwozAJQ9fdkA/2nXT8DJJKpurDO2+aC6e3+hCJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761164733; c=relaxed/simple;
	bh=79Tyqq3NXA3ru1MM6+LaoRhOPUaxg714MMmIt6Ieiaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNzcZf7NCWDfdUGo/DQCv/8x6AO4URDjv7Ma22pAQJx8d67ND7gxUtMExzRN78W3IKwSsTPrNrXr47UUk2C7+LmaWIUNEvMy5Lb02IIwoqMulu1jMis0TkqzJhSva0M5uSuwObZdkiApZfIDzP0Z1RKvG4n/WFUQDhWQfVwXszs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO6O/tXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIemxS018576
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8WTncnGza2Kn9sGuWGXDCvdR1E4ZhnjnCPB
	ZWVK2zTw=; b=RO6O/tXy6IjQ9bSKkDn0tGkt7+7Enp4sAIiHIMZZKfo0LeyVy3Q
	4SZR4AtSy3f6KWUqqOBQ3ZstAvxdNktQmy/dMFg1ikgG2Jgl4W9JlI6HDWoCPeBV
	/sa/rXdKkiDteaDUMzaZ9NStt8HwMaGqzucXFf8rIemn/BhVYWZ499jnWw+yc2Rv
	mEEXqnjz7jo+dept1BSBsVOwqO33uLa6hWHLXhFJRwl3lgIjk4v5yzl0n8T+sClh
	laWIANVbqlOM6PzZdlgbMPswcze+6gSoNc0NjiO5z4SqkSl4z0O8Bn7CuBiysSs5
	AtBoXHkIOfqG8OYpOUc7TOcGiRyOvYHKfeA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pp7vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 20:25:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e892f776d0so2671961cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761164729; x=1761769529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WTncnGza2Kn9sGuWGXDCvdR1E4ZhnjnCPBZWVK2zTw=;
        b=xKuSFWg2WNaLGpnC5l08Ic/J2RJn10FdEnTP/P2Jbnl3vMJFFZgq2pG/4auGSdHZeX
         piLWG78YBh8aM4LMdNkGP/44kKJkm184qUhTFQZdqBIAplLIcuDvnf8q/QAVp0SX8vVG
         iviPDZCaltfoGcJL5oD18sAO8BnT/8gyH+mwG2wOiBqDwlyQvNWLAoYe1pfeiIvA6s/q
         FCG3TpYCr4IHVVD5T0YfJtR/smgLPspJjod1MeDHrH3QicpflgJRh8MaaUHymUGzELYO
         qdnw01Oi05PlvO/kVKmn6zQaCaw5eE/Hps4+XBstCEPVoSdob7eeVAa8K30qJa+IdqBQ
         WHVw==
X-Forwarded-Encrypted: i=1; AJvYcCUn/M485jSfnvX6cV/ysbNdDJqCIpLEJyq1+1kjlf13YeH/7a8jbfux2oThJJqM7EInuLbfeIIgQSqA8MBt@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrQeDnvXOs2V1izaC/HD0sUtPN65LWiuQeR4xb81xZOG1uQvN
	rlbb7+geSGYt2uerWXeqW1SZiGlsCfcrcpyqKYXyeFtXEAQvsyRIT5hqenuLVjOSTDmEu7U89a+
	WxgqQYpf78N5NPJs2Mrd0y93Aa2LwX7RHekHtczC5WI4zDQWWiZgfKpGy66Arn6fp/U91
X-Gm-Gg: ASbGncuYgrSdk8milvz1W69Jmyta68OGoqh4Du7vQHTxAaX9tqysLrbA6MK9k1YD92m
	GFUHwI0JxruiEAqknnhivNLwBHNPPaefCl/+kOkIGCdqJcKdWEryD3+zdst7Ewvc6t/kumuUFml
	mwURXc4RWVhed4s67zNTdb25wPMMFZcQrzqwWOkAgKnelRUrU+QiYOEYFLwmKgNd6LyBq5YeRSq
	RHStIPQ8Z91h3AchAvHculN2vTYJvAwOZdVnkpAcC1Y7f27mCsrYk8JiHtIzpTGRlNKDpxXeaOx
	JG14ED0HvlvlIt0ia6Tqh5e22U+CJTJ1U/eKCbqVcAsslaE545oEjLLyhobA9iw1ixYsas+7Bwx
	QntB+OiVoXxw0YYDMDbz5TNfOP+nAChlzLC66bFY=
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id d75a77b69052e-4e89d1dd2f1mr289828501cf.12.1761164729282;
        Wed, 22 Oct 2025 13:25:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9MXmiprMdwUKIxdLcE2lxIjNarD784+69rh18fxO6NZuqDYy+756Rfa7vCNVdOJRHSD8i3A==
X-Received: by 2002:ac8:5fd0:0:b0:4e8:86ea:9ef5 with SMTP id d75a77b69052e-4e89d1dd2f1mr289828161cf.12.1761164728853;
        Wed, 22 Oct 2025 13:25:28 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5141a207sm4998566b.52.2025.10.22.13.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 13:25:28 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] accel/qaic: Add Sub-system restart (SSR)
Date: Wed, 22 Oct 2025 22:25:24 +0200
Message-ID: <20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2tGupnONaFbA
 yhojf/HOj36rHCUc/1UTRO/8vx6Y1Quvcg4vwiDqIFEp4G+nYwj6uB/Avz+ngzvIZ2ijbFk+I1a
 9O6Xk6vfgbFMnkkHWN9+kgXgvHPBxQEpwXuyrdZnI3CUW0xl7zm5EJIwTjLnkubds1AIzSpzMrW
 dtp+CRx76GVVURurZiQ+XzlLBFq9Ew2FZ10pBiHlwaiZ5+gpSO+OmCjgVUp6uzy3WlahOXRMfDj
 zp5GsJRi6rwXjUMKXr885FCz3ZASQu8wWWRn69zGnI769TsV/Woc/vgFgV9E6dHbVEBuzzTueue
 I5tpikiMkx/obbDzHoH4tT0E4+6rb4U/JOeeTVD9eTN+Lg15yxNjwJjaVkqvhu+dpPHlN212WiB
 U8zYJKa2ag471OcrNUpkWo5bYTi70w==
X-Proofpoint-GUID: ggUEHQo-_XFft8jWeC1HjzbU3RVhKkoh
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f93dba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bJ9p3azHXPqUh9OXqB0A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ggUEHQo-_XFft8jWeC1HjzbU3RVhKkoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

SSR is a feature that mitigates a crash in device sub-system. Usually,
after a workload (using a sub-system) has crashed on the device, the
entire device crashes affecting all the workloads on device.
SSR is used to limit the damage only to that particular workload and
releases the resources used by it, leaving the decision to the user.
Applications are informed when SSR starts and ends via udev notifications.
All ongoing requests for that particular workload will be lost.

During SSR the affected DBC changes state as follows:
DBC_STATE_BEFORE_SHUTDOWN
DBC_STATE_AFTER_SHUTDOWN
DBC_STATE_BEFORE_POWER_UP
DBC_STATE_AFTER_POWER_UP

In addition to supporting the sub-system to recover from a crash, the
device can optionally use SSR to send a crashdump.

Jeff Hugo (1):
  accel/qaic: Implement basic SSR handling

Pranjal Ramajor Asha Kanojiya (2):
  accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents
  accel/qaic: Collect crashdump from SSR channel

 Documentation/ABI/stable/sysfs-driver-qaic |  16 +
 Documentation/accel/qaic/aic100.rst        |  24 +-
 drivers/accel/qaic/Kconfig                 |   1 +
 drivers/accel/qaic/Makefile                |   2 +
 drivers/accel/qaic/qaic.h                  |  36 +
 drivers/accel/qaic/qaic_control.c          |   2 +
 drivers/accel/qaic/qaic_data.c             |  61 +-
 drivers/accel/qaic/qaic_drv.c              |  25 +
 drivers/accel/qaic/qaic_ssr.c              | 819 +++++++++++++++++++++
 drivers/accel/qaic/qaic_ssr.h              |  16 +
 drivers/accel/qaic/qaic_sysfs.c            | 109 +++
 11 files changed, 1102 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-qaic
 create mode 100644 drivers/accel/qaic/qaic_ssr.c
 create mode 100644 drivers/accel/qaic/qaic_ssr.h
 create mode 100644 drivers/accel/qaic/qaic_sysfs.c

-- 
2.43.0


