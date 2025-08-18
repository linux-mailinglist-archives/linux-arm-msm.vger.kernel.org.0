Return-Path: <linux-arm-msm+bounces-69483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF670B29A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EA0F1B21B7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED1E279DBA;
	Mon, 18 Aug 2025 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z514PpE9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42E2798E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500175; cv=none; b=ZMzZxVhWpm4X/+DLfl2eNBqQ+O8N3IVs4uHgwh5NdG/wUDJkSqvxsSLw6lsUkjhUKXjRUU9wypBMnY311HE41NRR6veOelAmdnG2fTBYoQ4vm4EKZEUyOUgSxF12kJP3gDHbUbTUP/3bNYwQli7/0/+8iv4ogG+4capI1CabdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500175; c=relaxed/simple;
	bh=Vtq+LqyHwabRSuVT5MMuwrzUmQB0qL0gtNzL53SbFic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IFH6ZKgPVe7lMDFajsjWXmnDiUFzL8hMMIMC64og4HoCc/IYntORsAallEcfSssZtMPA/rY7BBaJ1cyWrGG0SAWb4xHU45RpCToFE2/S9VUBNJEknQ990D+y09PTzKDord60icRaL5r9ZvkrLvgQyq89VEVpXXD6+0IWlZF2eME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z514PpE9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLnGW4004226
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7Hct/taILfKpdTRmUfYnuJgK15nNJqQFrPMWbLaR9Q=; b=Z514PpE9CAMsdNu+
	nARB143KOo4lF5/LLGV1dFYVjmGEryOkHtOpSNMmUxYksaxoXPIHPaezNdDLPXk6
	QSPG5fgseH5Z8+us4HWJlaAAka3RH3El5QUxrfp2y1XRJtONN3eyfBlK52FZCCLG
	ZljYwtS2XjI9m/UdPbKVL7C1LGmpJEVwOKEFqmwIo7j2k8QKeug8NrtObTZQO+dB
	6SdXs8Aavek3OUdPZg/WkHSMvUTH+vxYKt+nS19ki78EjtNTgBE74kBNpckMgkoz
	88R1T8ca3nvuXhWkKG10Zc1AKWQr6wf39C90t0N2s7zfnki+0Jvjad5DNpqlnAVl
	vlItDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf3tjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:56:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458027f67so90776335ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500171; x=1756104971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7Hct/taILfKpdTRmUfYnuJgK15nNJqQFrPMWbLaR9Q=;
        b=YF8aRKaaJpyQPy7Ji8d/CQ64OcPacpTsPPjcf6zxQubKP06dCQjlr/EkHBBvtErqdU
         9UTgF1VHrfTC8g2fTbhbW5xJElM6R5aWIjYlQf3PRt+04FJVE/3Xsf+pJkQnlnUaHPDG
         5TVDl45QBM+F2Y/6oOIXhpGibWDoWjgjONdX5he2JwWQAbDfzB2Y/5mQ18hSNLx9yemn
         9z1Tt8KMtkz1vPMXXaOovQrk0M1KYw5DnxY5ljYI131q02e6shRLMK4sgLmv6YmSE9gr
         jxOBVeiWlOLSqgF+trklmKVIcHEK3OOENpqwZ/TO864PELnn9EZm4JGMxy89ZEJllvih
         PeIg==
X-Forwarded-Encrypted: i=1; AJvYcCWv1+WbQlQ4CG6kShJAUCXtYIM8cHRWZV/Okm1KBaOlbQ72x6cmIfSF2ih7JDd/cNsvR4XV49qewDqAxiVP@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAF5KlzHJqqKhIOPjuRXzm9LBG6T8ktu2MYigO3GQ5QqGDsCc
	NcwfZQZCF9ypJ1jOjLNMQKMX+Dl2mrEhSjs13Nonwin1O+hMANjAU4ZaXk2EKuqQYLR8m66E4xI
	rXh/CMDKhc0ZzmAdiDLF9+bJENfq4IBvuNaeyIPHoi2BvUU/Wi7ZlJp4zvODR6/jtj6d9
X-Gm-Gg: ASbGncsXJRve9Cd7zMjU9D00/AlOLGccyBArS1eAKkGA8XSsza5I8jZw6kzqa8PnvDT
	EOXCTzjmDdXoXniGCdji9iMpNjPn5v2f9ULFDmU9A5LoIMcm3ESwOhhanaFfmxeAmMxss69pwx0
	TO0ExxI3rPcwsS6ap7IYavpyDFVF6ggG8Xgjzw2M0tl9i2X8x7/Q+yyXpRFtIrS3VkAfnM97VPg
	VV+k7oBx7v7mY6pZQ1VmWwZPHjV6XpVEQRMoeWAKhAXirb+dueYdifKe4+7Tued5qqdu/3n9dZN
	1gVgyLdL7VZXmHCGU164Jxzy4sRJ356QPk1UqtqjePRx3fWppEy9oUTnzMgu46bxKq8bjj4ZrjI
	=
X-Received: by 2002:a17:903:1107:b0:240:48f4:40d5 with SMTP id d9443c01a7336-2446d8bc395mr199357115ad.39.1755500170848;
        Sun, 17 Aug 2025 23:56:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm00coYUmrKJrf8oBX7qk5XondVTD7nuk4SBWcSqcmNI9kSTJQX11L4conpVEGYpJxs+Wcyg==
X-Received: by 2002:a17:903:1107:b0:240:48f4:40d5 with SMTP id d9443c01a7336-2446d8bc395mr199356745ad.39.1755500170330;
        Sun, 17 Aug 2025 23:56:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f664sm70240105ad.75.2025.08.17.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:56:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:25:46 +0530
Subject: [PATCH 1/5] bus: mhi: host: Add support for non-posted TSC
 timesync feature
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-tsc_time_sync-v1-1-2747710693ba@oss.qualcomm.com>
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755500162; l=8702;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=e8/ku6lMOX/7dfksgna+jLyXTGndYgqBNn5EzeuwPa4=;
 b=bFTgC9gnjTuDnHGgcj5Hxbjh0jbXrId/75gtSEqawLCqdiCBxldVVKzAENfPY38bDoyFYbAPX
 RGiOj+Njge5CHJwnlarCkmTMYxYEKEFbhwqCgP7DmxUpxoPF6EOMQ4x
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: yAvDW2wmzuwgZ8IfXL-244qq6RtdHq_w
X-Proofpoint-GUID: yAvDW2wmzuwgZ8IfXL-244qq6RtdHq_w
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a2ce8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=DQPGbgbYSupBwqSZGUIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX2otSWPJ7cmPL
 K78aYeI3evokzHiqbzc9zhpbrFrGu+Hs0FvxK1S8v+UgCfxRvgfq5l2Xa9Sv1hg4GOjKckEXw0e
 N+gC+h1hIWoMYr1EWCfeupZFh4Yf8BSz360jHOUFbGDgYf6FM5Bg3K2eO0+xRx+3E5tx0S4a4R6
 466YgNAkToq+T/rXxiBMDwaEfIGMljTkh6+ijQOavxahf4rzTaR+0nnclExFRmagO3d8cTe0HPI
 vvGypEQ1UIejLbTL6Py7JM8jaxL3EGMC8ZnL0ID68nKHVCXPbXZNcEdpIednBArK6MOG61AG0CK
 v0rMyFzYXSkaRnKV7ImrIeiN9ZzjYbozfwWFo0vx4xiC08wSHkkBUynvzIPIWk53iBVp3TBXaZO
 4Hqtc9UV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Implement non-posted time synchronization as described in section 5.1.1
of the MHI v1.2 specification. The host disables low-power link states
to minimize latency, reads the local time, issues a MMIO read to the
device's TIME register.

Add support for initializing this feature and export a function to be
used by the drivers which does the time synchronization.

MHI reads the device time registers in the MMIO address space pointed to
by the capability register after disabling all low power modes and keeping
MHI in M0. Before and after MHI reads, the local time is captured
and shared for processing.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/common.h        |  4 +++
 drivers/bus/mhi/host/init.c     | 28 ++++++++++++++++
 drivers/bus/mhi/host/internal.h |  9 +++++
 drivers/bus/mhi/host/main.c     | 74 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mhi.h             | 37 +++++++++++++++++++++
 5 files changed, 152 insertions(+)

diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
index 58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd..70319ffa62155f8f450944a08d4cd524094d01de 100644
--- a/drivers/bus/mhi/common.h
+++ b/drivers/bus/mhi/common.h
@@ -118,6 +118,10 @@
 #define CAP_CAPID_MASK			GENMASK(31, 24)
 #define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
 
+/* MHI TSC Timesync */
+#define TSC_TIMESYNC_TIME_LOW_OFFSET	(0x8)
+#define TSC_TIMESYNC_TIME_HIGH_OFFSET	(0xC)
+
 /* Command Ring Element macros */
 /* No operation command */
 #define MHI_TRE_CMD_NOOP_PTR		0
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index b5f23336eb6afe249c07932bc4182fafdf1f2a19..83b92d8beef12797941140a314b4c7878e89e525 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -499,6 +499,30 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability,
 	return -ENXIO;
 }
 
+static int mhi_init_tsc_timesync(struct mhi_controller *mhi_cntrl)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_timesync *mhi_tsc_tsync;
+	u32 time_offset;
+	int ret;
+
+	ret = mhi_find_capability(mhi_cntrl, MHI_CAP_ID_TSC_TIME_SYNC, &time_offset);
+	if (ret)
+		return ret;
+
+	mhi_tsc_tsync = devm_kzalloc(dev, sizeof(*mhi_tsc_tsync), GFP_KERNEL);
+	if (!mhi_tsc_tsync)
+		return -ENOMEM;
+
+	mhi_cntrl->tsc_timesync = mhi_tsc_tsync;
+	mutex_init(&mhi_tsc_tsync->ts_mutex);
+
+	/* save time_offset for obtaining time via MMIO register reads */
+	mhi_tsc_tsync->time_reg = mhi_cntrl->regs + time_offset;
+
+	return 0;
+}
+
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 {
 	u32 val;
@@ -636,6 +660,10 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		return ret;
 	}
 
+	ret = mhi_init_tsc_timesync(mhi_cntrl);
+	if (ret)
+		dev_dbg(dev, "TSC Time synchronization init failure\n");
+
 	return 0;
 }
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 034be33565b78eff9bdefd93faa4f3ce93825bad..0909c33568ba1b8c736b8c41a5696da524691529 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -15,6 +15,15 @@ extern const struct bus_type mhi_bus_type;
 #define MHI_SOC_RESET_REQ_OFFSET			0xb0
 #define MHI_SOC_RESET_REQ				BIT(0)
 
+/*
+ * With ASPM enabled, the link may enter a low power state, requiring
+ * a wake-up sequence. Use a short burst of back-to-back reads to
+ * transition the link to the active state. Based on testing,
+ * 4 iterations are necessary to ensure reliable wake-up without
+ * excess latency.
+ */
+#define MHI_NUM_BACK_TO_BACK_READS			4
+
 struct mhi_ctxt {
 	struct mhi_event_ctxt *er_ctxt;
 	struct mhi_chan_ctxt *chan_ctxt;
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 52bef663e182de157e50f64c1764a52545c70865..070b58a5ea75f121d4495d9dfd532f33cace274d 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -1702,3 +1702,77 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
+
+static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_timesync *mhi_tsync,
+			       struct mhi_timesync_info *time)
+{
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	int ret, i;
+
+	if (!mhi_tsync && !mhi_tsync->time_reg) {
+		dev_err(dev, "Time sync is not supported\n");
+		return -EINVAL;
+	}
+
+	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
+		dev_err(dev, "MHI is not in active state, pm_state:%s\n",
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return -EIO;
+	}
+
+	/* bring to M0 state */
+	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&mhi_tsync->ts_mutex);
+	mhi_cntrl->runtime_get(mhi_cntrl);
+
+	/*
+	 * time critical code to fetch device time, delay between these two steps
+	 * should be deterministic as possible.
+	 */
+	preempt_disable();
+	local_irq_disable();
+
+	time->t_host_pre = ktime_get_real();
+
+	/*
+	 * To ensure the PCIe link is in L0 when ASPM is enabled, perform series
+	 * of back-to-back reads. This is necessary because the link may be in a
+	 * low-power state (e.g., L1 or L1ss), and need to be forced it to
+	 * transition to L0.
+	 */
+	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
+
+		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
+				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
+	}
+
+	time->t_host_post = ktime_get_real();
+
+	local_irq_enable();
+	preempt_enable();
+
+	mhi_cntrl->runtime_put(mhi_cntrl);
+
+	mhi_device_put(mhi_cntrl->mhi_dev);
+
+	return 0;
+}
+
+int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time)
+{
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	struct mhi_timesync *mhi_tsc_tsync = mhi_cntrl->tsc_timesync;
+	int ret;
+
+	ret = mhi_get_remote_time(mhi_cntrl, mhi_tsc_tsync, time);
+	if (ret)
+		dev_err(&mhi_dev->dev, "Failed to get TSC Time Sync value:%d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mhi_get_remote_tsc_time_sync);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index dd372b0123a6da5107b807ff8fe940c567eb2030..770d51e9bfac7434ff4b4013ad045c041c26adeb 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -288,6 +288,30 @@ struct mhi_controller_config {
 	bool m2_no_db;
 };
 
+/**
+ * struct mhi_timesync - MHI time synchronization structure
+ * @time_reg: Points to address of Timesync register
+ * @ts_mutex: Mutex for synchronization
+ */
+struct mhi_timesync {
+	void __iomem *time_reg;
+	struct mutex ts_mutex;
+};
+
+/**
+ * struct mhi_timesync_info - MHI time sync info structure
+ * @t_host_pre: Pre host soc time
+ * @t_host_post: Post host soc time
+ * @t_dev_lo: Mhi device time of lower dword
+ * @t_dev_hi: Mhi device time of higher dword
+ */
+struct mhi_timesync_info {
+	ktime_t t_host_pre;
+	ktime_t t_host_post;
+	u32 t_dev_lo;
+	u32 t_dev_hi;
+};
+
 /**
  * struct mhi_controller - Master MHI controller structure
  * @name: Device name of the MHI controller
@@ -325,6 +349,7 @@ struct mhi_controller_config {
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
+ * @tsc_timesync: MHI TSC timesync
  * @pm_mutex: Mutex for suspend/resume operation
  * @pm_lock: Lock for protecting MHI power management state
  * @timeout_ms: Timeout in ms for state transitions
@@ -403,6 +428,8 @@ struct mhi_controller {
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_ctxt *mhi_ctxt;
 
+	struct mhi_timesync *tsc_timesync;
+
 	struct mutex pm_mutex;
 	rwlock_t pm_lock;
 	u32 timeout_ms;
@@ -809,4 +836,14 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
  */
 int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
 
+/**
+ * mhi_get_remote_tsc_time_sync - get external soc time relative to local soc
+ * time pre and post using MMIO method.
+ * @mhi_dev: Device associated with the channels
+ * @time: mhi_timesync_info to get device time details
+ *
+ * Returns:
+ * 0 for success, error code for failure
+ */
+int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time);
 #endif /* _MHI_H_ */

-- 
2.34.1


