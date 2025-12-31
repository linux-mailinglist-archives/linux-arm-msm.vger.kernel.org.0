Return-Path: <linux-arm-msm+bounces-87049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095FCEB41D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 05:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B2173025179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 04:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C277430F94D;
	Wed, 31 Dec 2025 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLe6889n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fmmsngzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422DE7E105
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767156994; cv=none; b=oiQHsOu6AvHblA0zFm7XXGmrNJFbqM3CHfX+M6kPkdc2nKXt0qjsaRH1a/cB3YYpwzTn9HTDQ2w/3H2OSnm1eZ2hdUmPUA7SENLlf0CpY9j9RI9m/xZF9HELw6ZK3/BUn/Zpu74E4UBxphmLuCthfN+hLoBNt7MLL/VIR+af9As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767156994; c=relaxed/simple;
	bh=XWp7COkoR50DXLNvgSau8lqHHHIoHPVakl6H9Mli0uU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOgAEYNleTxJZXRKLxHOXzHQA1pf89eGEkkX2rVbc0L11fWRio1Uok9GlZneBN6g10XRunZkMmi8jehYvysYQ815HAXtLJJR1uD1uh3HW/OC8UkuQyeNfHTxui8HGuElc7p6Io1tOnufTbsdMYlhoy055Ko81IaSoHepcHv+DvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLe6889n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fmmsngzl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUKo2FS1152216
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hik6Yv4/FlA
	PL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=; b=kLe6889nRDFpBx0NiBBSouL43yL
	U/CkLbQ+F8EaoECTBlWcedwmQxazL7CJ6hQAWjWRxgoyiVsGnQp09s/DCGWRYkJm
	N+2WWV9uUa/ZIxtBVpkOhgsIktd6qI+rmzTbCSaeXNez+LnrQfO6KUxVeuwHM9nD
	sveFkbHoQXyaBptMqvCb14GMdPyu33AxMTBUuH3mFKYzNxV+vUcLUVO8VHCqnag5
	6z/hm+Ev/vPo6NcK9ndUrgLM04n86kPljKTjz1/VUQFTBSEsY+PUrCq6T8VX3PE1
	N+7EbF8HCMAG2jtXzzMEurWo6cEMSV8AKgHDHClD23qdcqx0lvWZzHqI5Uw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gunwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 04:56:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so23168801a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 20:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767156990; x=1767761790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hik6Yv4/FlAPL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=;
        b=FmmsngzlDv4oJcXkdRv7itLj8SrL+qIhxpc16dxOjGCRgEG6BVaiX6Ucu+8HfaQm/t
         mcv0/RxIXq6SrPeX1kiL+vo+xEe6naNf14m1x1MiUhEjZZureEvwN8+pp7vEelfyEVQN
         a+LqLvOoQfCoO3ryTNRto2v0n6zck6H4WmTiSIFetZU2D7EwDq6KgAJlzJug6U1cuy6u
         9bv6qEPgTXTewmOWs587rhbsAp0xnVkO/CRhCB8D7lw6Q4SZr/MFeZFXHBZnW5ROR3jk
         nn2fLRrFCScVo6OuTw/3L9BLdRgZtZYPY5EeZ2XrkueMj1zFzwl4S83Ypu42orsZFB9S
         LtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767156990; x=1767761790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hik6Yv4/FlAPL1T4IYbHNIfPpAtv/lW1BzmwFMKCUek=;
        b=prZI8f2BGXH/Fv7L2OGVSaDi/2vz8JA025sWpyW8ntM5miOkTa+sFshuA15KRtDtNA
         7bPV8Fh0xdXH/oH4/RXOCd8heImoZiEmn2uwT7cxGdVA96R4ziU/4W/gvFZmfyWz8Z9P
         FBUCZ7LYELt9Oc/qDh/EA4Rmc6PdVcGp1DAjhl/12JqR4xeqy+yTaGtf7yAWsGJ4vjpa
         QSiw5pYhWu989HFcGx4gtJ7GGElTsCEGwRjUGydDMTEDcdDgDG0W2WMAD/3PVQKuFfCv
         3iJqK8kfYOD4bjU7i1PLRwL8XV6LzGUdzec2Lwe15cg4NViKOiqu+5jXF+ob0kp85Ep8
         FY5Q==
X-Gm-Message-State: AOJu0YzwiX2NkpPodM2Oinl+YP8xhOKIRHO/35gZchJEit0ZtMCjDNIk
	7PeCbocyIvhRdgfPFYn9Gcl8u89X0654El0LhDXkdjgICvBvYkaTJl12vYphFnAjL9CYERqMgZt
	sWgFa0LLr/QndkgEcP8m3YtXwBAsCpey16zv5if42F+t6vdZnj6X0iMkbFZHWqnPOnPdj
X-Gm-Gg: AY/fxX7OLzYGjpfL+iE/D14f3WJCqUzPZkH3N8yQQShZc4oiXD8Xs9I9oKYWwBNCOrC
	VkV10/hQaVU6cD2fVvMUTwkPXGTalPUD9W5FGlIMZuHI684AA7209ZNSsKPXCkPzFJSBhPUysaO
	+Dc25WSTzeJp4l31QF5jqbNkBMRNNBSYB05dlqvdtAQ/vLxzQFV2EaKl97Bc9rsEjYkoU+yf+SX
	NyHcq8t1TvzGg73WzbIrBIYqqhZCWMQx+a+ZdBUOl1J+xRco+wWtg3M+Pq5h/ykCb864rD4qKQU
	kXT3LLRL45/eUxDy6IQWGFHF/+XKZsUzvczbquX5zUYbEpWYykE4LjZWP0bAriLEjYn/zz3vNh7
	nQTpfz/Hcno+hifpjg3NQchE51k21Mso5qe+KCylk
X-Received: by 2002:a17:90b:4d90:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-34e921d0a61mr30320788a91.26.1767156990350;
        Tue, 30 Dec 2025 20:56:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAmbtw/5/ayDFahPPH4jioa1oTKC6l4u/GuyMepxqzmSJeoizBhSiIQJ9Q9qSSuJuq9LX3zA==
X-Received: by 2002:a17:90b:4d90:b0:34a:e9b:26b1 with SMTP id 98e67ed59e1d1-34e921d0a61mr30320764a91.26.1767156989895;
        Tue, 30 Dec 2025 20:56:29 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7d3sm34547697a91.4.2025.12.30.20.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 20:56:29 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V3 3/4] scsi: ufs: core Enforce minimum pm level for sysfs configuration
Date: Wed, 31 Dec 2025 10:25:52 +0530
Message-Id: <20251231045553.622611-4-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
References: <20251231045553.622611-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z0DGoSGMfJG8CssOLDorHbBY08VGdS6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAzOSBTYWx0ZWRfX4rQ8DRgr0ES2
 Sud36uKPZKI74xBL8qrpE4DedjSLT9t+e3AspKydilrRdI81iV/eKWgTO4efvmLC+faIRQmgGhL
 NvfMIUwkC26sxxljze3ZCpqYPYxpBYZxJipQToINcQtU5hGD2gH3oSTOvIOJBPsay7Am+2+VQsD
 fZwvuxCNBKycsIOTh6jKQmElBMJadsCx1njZNNIzWcIZ/6nL1IRc0DlSUqgXsHJlJeoMhFR5q3H
 4CKsFozjuFrnvqkSmWfylULnTujMSkU3CUgnzO1VNTI/3ep9x+63Kmf/SKh8LOTmw4/dyXQGyqP
 NkQxDhb3tqiMZusYgtIG+kwwjGpD36WlGdvVI6DkONrpdOSGo7Oc1/CjfAvNGr2E5RoXcs+5Hua
 D9UgrN8gPcyJhzuWLgsf18x8wSsaTLlb7J6WYQQ8HVKv4ZSdd/b251djTWvMkSm2YjVOGzNvD5f
 9x/EoQSnSiID/5UYlZQ==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6954ad00 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_fLkURk_aflrY1IPiHIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: z0DGoSGMfJG8CssOLDorHbBY08VGdS6d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310039

Some UFS platforms only support a limited subset of power levels.
Currently, the sysfs interface allows users to set any pm level
without validating the minimum supported value. If an unsupported
level is selected, suspend may fail.

Introduce an pm_lvl_min field in the ufs_hba structure and use it
to clamp the pm level requested via sysfs so that only supported
levels are accepted. Platforms that require a minimum pm level
can set this field during probe.

Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-sysfs.c | 2 +-
 include/ufs/ufshcd.h         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index b33f8656edb5..02e5468ad49d 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
 	if (kstrtoul(buf, 0, &value))
 		return -EINVAL;
 
-	if (value >= UFS_PM_LVL_MAX)
+	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)
 		return -EINVAL;
 
 	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 19154228780b..ac8697a7355b 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -972,6 +972,7 @@ struct ufs_hba {
 	enum ufs_pm_level rpm_lvl;
 	/* Desired UFS power management level during system PM */
 	enum ufs_pm_level spm_lvl;
+	enum ufs_pm_level pm_lvl_min;
 	int pm_op_in_progress;
 
 	/* Auto-Hibernate Idle Timer register value */
-- 
2.34.1


