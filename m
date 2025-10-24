Return-Path: <linux-arm-msm+bounces-78753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 474AAC0762E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 18:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB6441B8541F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57FB311949;
	Fri, 24 Oct 2025 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="creqccD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E63375CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761324395; cv=none; b=rp/rOo8N6rzg+PQ2neZK2eKkyZYKS+9f3xZ7DDA2XY9i1+3KValMd/8l6JFwjiXOGB25BwHYnChOAk2N4gVAn/6TSHicXuLRW0Cyed40zqIoQFD/gyGYkftlu0GVU+ZdPddBisxOMMv6guokFI+gu4bj5tv7c7Y6n4m90Vls/nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761324395; c=relaxed/simple;
	bh=5x0gT9ttX+7tq13Kkr2jPRA/1W/xQ0m9spyq7FAzbyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=itS3T1WuIJCJ3gxRc0vwqoZm1FNaFDsTsJJ4FwU9ZZ4yKYQuqqgoLcWmbhlFfxoorqTnycuTngyI3v0IauSLt41/5gNAIvuE++Ewq2d3cOdFxpaPYsRWeJA6bLwr4KmD8YEQSmVGsbG09ViExU1ZdC9/cprJWDUzQLUCmZyD40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=creqccD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OBVgGS017837
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R/+J0Z7Q44h8QQSeR6zzByUNCi1g1AO74X7
	6qOhV0Mo=; b=creqccD+DhkzVsGiJZNHFiVXzsmOPWTJ33ogwb7H1H8e8BIpp94
	J187nTdxo0FwO8r3Nbq0PVfPWA172lcfffqJE/OgD91l74+YcI5OkdR9O6AktTmp
	Al7uls5GKmA6MiI8UKNLSlrqP5PoZvCYZffhohf55amBM/5/YsMW/ZHVQ7Jepi96
	Ok0sjGX2s+h3DS4/fYKniu070NIelrZfTJPKQ+oZS3rgdVOEc3BmL5mMeaTClHBg
	WBKvpVxNOj98NQ+QxCZSaILQVsq/d0PiakdCgcGJ2Zmh+rpwHjTxJg8XXvMAx3lR
	+K/W7rqdOPgTCSwnMWRSwdTDmYyeamSTo1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49yp6k3wnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 16:46:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eb779d9d9cso50573731cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 09:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761324392; x=1761929192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/+J0Z7Q44h8QQSeR6zzByUNCi1g1AO74X76qOhV0Mo=;
        b=uE0yQnYvq7u12gmlcjCgK/lzaKrPBXY3YmB2T2a45AmiAupDnrDoApncA5lqtLgsme
         y2pU5RpuLP9zeOBp3oCqBhIgNuAcqwOdqXUjntQ82laRYxvSaEK9ka4stJ29GD0mFL3v
         i2QTCZL0iCs339/lFMIX9neFa5g9fzxld+PipKRIP2J6EtvH8FF41SmNoUe+AtiHG2mz
         sXgvuhgrWGbFdXNdg5Zuboeeyvf7+5vF9W7dyuOnzDpEPx30Anr9AK3cpBjNp+Dndfev
         XYowTrxWkf/qNG4htggX3NHdukiRc4+2NrNHq4bLA9le6yj27YfEl+wzyRwx3s1+kE1y
         rWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7qy9oixajlRT+kvANcpZBlRIAT2t7pMJg86izFjY2KcT4yo/YcDFSiqIe8TMYLZWW6p/DDqfhqngw+F95@vger.kernel.org
X-Gm-Message-State: AOJu0YxPsfi0ZH4ni8sgKO/v0AG24pfs806uMLxwyX3NSsqaZcgjjtbU
	AQc0u0ytPTckxZrn5eORNAhKnxKL5mGIZOpShIT9UbWWLSUK99jEIWG2Ode+3PweM4t54Z3TRCT
	SNCSqU8deT+Gdhqam14GoU/saOVR7ZAUjsr/uaVfCpL3y45MGU5aRa9KDeoKoFokRBmlQ
X-Gm-Gg: ASbGncsoPKEX/EyogiyfB6o9t9KasqQzP9qP+/NzsyCTs7g8tWkp47SWdCgv6hg5kX+
	RtsP169pJQV8v6mO1CPExMy6I4SnecMxv0KUZx2oLeKX6KyUCzeRV8kQGgcblzQg5XAePhHbYqB
	hsRqu+LzfVRz1/75/6HVjsto8bl3Ws0+h2Ueatle34UOQyCQx/tbJuH4dTLl1LqIjhm/N6fISl7
	TxpT2V9vfFnq02ua1EYmpRw/xgcddQZ0xYCQ+8o48Gta2860ylEwGoJXYEdLfxLoRL0/kDelSZw
	Q8b88xTkEg2iPlxL0XsmnK1OzhTEsy38Ow6vH2kcAr03wrCC5FqPiO6i4sbaJdSservW++OtTzd
	ar6hVVkw4+IgKe3Cpruw/ThAE8WLgJ7fcPs5szm0=
X-Received: by 2002:a05:622a:a0c:b0:4e8:9e67:92af with SMTP id d75a77b69052e-4e89e679379mr360421101cf.20.1761324391629;
        Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgHy2mmdfYga2+tuySnmD8eHvI48/SndNl24bMfMqUwALDOnDfcHcqfh6kUBMvWDUucnZdHg==
X-Received: by 2002:a05:622a:a0c:b0:4e8:9e67:92af with SMTP id d75a77b69052e-4e89e679379mr360420631cf.20.1761324391083;
        Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51472215sm563568466b.74.2025.10.24.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 09:46:30 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] accel/qaic: Add Sub-system restart (SSR)
Date: Fri, 24 Oct 2025 18:46:27 +0200
Message-ID: <20251024164630.816862-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEzMSBTYWx0ZWRfXxs+SPvj7xDLx
 vAzzcr8AEwR82xAaJIi9Wa2Ir+SRlw9MYL8KZD8oo92HuH4ppsGH79k2UJcFINzjQr2JmoVl/FI
 AEzTkuoC5mTBA7cenmlPr0+X/UOd9imC+6NsTCZXb6foyy9pXqHAL3PA71IhgNw90feX4kLNuwy
 KVNCC0yNadJSbTHiQf2PjZg/rZBUWBBPS1PQbjp3itjwUQvHfNBH63mC7HDi34ycTBTx1XXb5N6
 MTyYhoZCWmiEYoBRprbRui3h+HpPfll0vLVJHEjaQLkams3oA324l8BnJmNiHBHovoiN5OM/SHr
 gqguZ+RtffhB1tEeXckOQyMmb/TGP/nk11MXZPXYgi/4pcbrXus0j8KueihrCx1p9WUTzp2TFCw
 /oTSfnp0uU9WL/Ex8YFnnm/ozGkz/w==
X-Proofpoint-GUID: aSBNOsjJnZ4wADewI8ItDLU1Ik1PtONh
X-Authority-Analysis: v=2.4 cv=bL8b4f+Z c=1 sm=1 tr=0 ts=68fbad69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vm6HeESPmvYr7rZll5gA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: aSBNOsjJnZ4wADewI8ItDLU1Ik1PtONh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230131

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

---
Changes in v2:
- Use scnprintf() in qaic_sysfs.c to fix openrisc build error with -Wformat-truncation
- Link to v1: https://lore.kernel.org/all/20251022202527.3873558-1-youssef.abdulrahman@oss.qualcomm.com
---
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


