Return-Path: <linux-arm-msm+bounces-20326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C13968CDDF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 02:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E876B225A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 00:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E44BA4B;
	Fri, 24 May 2024 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kQrrathZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CD6803;
	Fri, 24 May 2024 00:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716509480; cv=none; b=YW9goKTeyXZAS6jzJKA6njQFNWaI3YhuEm3zg7bAaQG4ySR/gYJNrXlIUFUH98JxTWkP8yx8umxj5PDQuPCy10YXtk5QlNTJolzqtM9Ugo2KZZ7hUTATMUQmtmGTqIcE6dznWm+hwtRKR+JXI2MbuGww2QSRUoPISLrFgDrtdqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716509480; c=relaxed/simple;
	bh=cUtHOLNf0R5GOdviTZVOeP6thiX8pbViVYJ0ZvcMhT0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sxr79fg/bvaTMVFHUZuEG9l5s6dlsTnD3UntG4CcR1wvnt9KWc009zmfXqiKFI2Mbuaw2j0buuuibw0vULZ71874VwdCzu7oNshm/ogHGcZH78r1VYSVaxmt2GQY4zYtj3q2pvpHg8w/8rO7SS2eaWhcUnixE0gmHLIL5b/75No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kQrrathZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNOtgG030705;
	Fri, 24 May 2024 00:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=db1DiRDPnPzv2WrnCumz0mnC
	v8rXyp8CcEMm0K1v/Ns=; b=kQrrathZHm56MoD6JwNyivwLtO+6Y1se3Mi7kzLV
	m6e7LHv9zCXC+0jrV41/UuLWc5kAWSf4smIIt8uiZ/jF/i9bqK5Jz34MxTLTlaur
	e11W1sSktGlxx5drnR+ByaKdxBXCr17gws7mnSR2nUJ5YXzPqV+A662m6ui4GFWp
	jIqNhrnhuxPwLo6WFbXYtb/T8VOX8Y8uemu7WJmC4a+fR1yuL8hqk12+mNx6otYd
	KbyvzFCqDHIcLDgGu8NzkNOWaQBO5e/5vFWOcxTDNPTvTT7LkI/qrSaYdEm24M84
	gCQkRbTfsC4F2KCqVgxFAYgglyOad+sVJyxIXDkDntIQNg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j0r69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:10:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O0AtFt009578
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 00:10:55 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 17:10:54 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v22 02/38] usb: host: xhci: Repurpose event handler for skipping interrupter events
Date: Thu, 23 May 2024 17:10:07 -0700
Message-ID: <20240524001043.10141-3-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240524001043.10141-1-quic_wcheng@quicinc.com>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4cC5U7PxWX7RjiF32U2DrKnxKUgX9K9T
X-Proofpoint-GUID: 4cC5U7PxWX7RjiF32U2DrKnxKUgX9K9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=901 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405230166

Depending on the interrupter use case, the OS may only be used to handle
the interrupter event ring clean up.  In these scenarios, event TRBs don't
need to be handled by the OS, so introduce an xhci interrupter flag to tag
if the events from an interrupter needs to be handled or not.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
 drivers/usb/host/xhci.h      |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9e90d2952760..80dca780317a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2951,14 +2951,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 }
 
 /*
- * This function handles one OS-owned event on the event ring. It may drop
- * xhci->lock between event processing (e.g. to pass up port status changes).
+ * This function handles one OS-owned event on the event ring, or ignores one event
+ * on interrupters which are non-OS owned. It may drop xhci->lock between event
+ * processing (e.g. to pass up port status changes).
  */
 static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
 				 union xhci_trb *event)
 {
 	u32 trb_type;
 
+	/*
+	 * Some interrupters do not need to handle event TRBs, as they may be
+	 * managed by another entity, but rely on the OS to clean up.
+	 */
+	if (ir->skip_events)
+		return 0;
+
 	trace_xhci_handle_event(ir->event_ring, &event->generic);
 
 	/*
@@ -3047,8 +3055,9 @@ static void xhci_clear_interrupt_pending(struct xhci_hcd *xhci,
 }
 
 /*
- * Handle all OS-owned events on an interrupter event ring. It may drop
- * and reaquire xhci->lock between event processing.
+ * Handle all OS-owned events on an interrupter event ring, or skip pending events
+ * for non OS owned interrupter event ring. It may drop and reaquire xhci->lock
+ * between event processing.
  */
 static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1c6126ed55b0..efbd1f651da4 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1430,6 +1430,7 @@ struct xhci_interrupter {
 	struct xhci_intr_reg __iomem *ir_set;
 	unsigned int		intr_num;
 	bool			ip_autoclear;
+	bool			skip_events;
 	u32			isoc_bei_interval;
 	/* For interrupter registers save and restore over suspend/resume */
 	u32	s3_irq_pending;

