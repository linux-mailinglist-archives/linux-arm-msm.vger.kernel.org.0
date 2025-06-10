Return-Path: <linux-arm-msm+bounces-60735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE7AD318F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A526188D745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508CF28C854;
	Tue, 10 Jun 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6nEv3E+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD528C2CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546855; cv=none; b=H/ZmoxZvvDeELVsitW9ePLsUZtp9nZ5qXYnOBPKAtpbv7jAKPPHCzayv1vZ1ZliRNPPyRopXcvRukBKYDlymrl+Rhb5/17NlJgRYL4ZdrX+I/NyoG/0MeV+LfZOi342aM2sYJoDFrZvej1Kyxh5bqXLds/bQqFkqVmoScq5XLBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546855; c=relaxed/simple;
	bh=XZz8NYJcJqcKiaoFso9j55BbEfdRP7VRJYZy6cqw9xI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tK3ipqKNRaqyDaNm55xnuX9nGaTbfZa69GdQblrLO+Te320T6uuTvZ1wjRdVvUqfkpgnByJlAs+utBCu7nH16pqlyc6TFEfR0nPfVfnATcXu7SsifaxoHM4dBdUH72FO1Qcpd887SL8xYW9DGcCNfOtGKewEs6g0t9s+LqewAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6nEv3E+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8QBh0012939
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ga2rUmJ+JCY
	bbNKq4VW4zGbDsFYBkFaP6dwRBff0Hrg=; b=C6nEv3E+F/xziSyANiQLmI1N/zp
	1OP27zq0xf0ufBmPp/uuWWtPRfvSilvGEplbxaSmwx7CvtjfW5Rvz98Le7kXZnV3
	i53jP9cddMc3q2VpbxtYb0lWZZPX80A3PR7L2e1z5cfuRd6ilsREItjPh7QxsT9I
	3VoU0+zO7NzOTvVwaWUTlcR64wbKTobKAa3XwCVkgjRGrTtC8IcG2WWON9R0Rml1
	vVUhdN/S62cvQeOeXvy/dhQWjqXsJRBeRDwfzrywUe/BHtYfAAUpIsSQPNqJ4Rbj
	VSmeKesAh2YUe1wXGBZfex7010Azfwh22ChNwnQH3BCLvt1Ua/oU6koXkyg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcgpd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2350804a43eso84505745ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546851; x=1750151651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ga2rUmJ+JCYbbNKq4VW4zGbDsFYBkFaP6dwRBff0Hrg=;
        b=hohCoByUHd79K219ByiR3D5Rdp2xsI69/POnRrWmlFiyR3Tal0tEsXm8m3+wEJkOR2
         OR7QtBhCMvUtRBxnl+DqdOytd9vq84d6pKbCUJBqzXCJJtkq+04/iwA4r3vYbHlewv9z
         zu2wiSBy7kQPhbrGA4yQiT7eMimT25CpjcuC7hLEkxwmuFpqItVvBh+C0Tnmla5pFYZC
         ZAjEELmIHOk6MhkjBYLX0CreuyHWGyYkulig4Izod97VYRtidRfBf/J7GrND4sq6BF6u
         YrKqK9wH93v2aZ7bLIC0WmpoEvv4E1zDidfEDwDGppXAUxTrB4NQT+Um8hSd5ga+5Rxi
         l2WA==
X-Gm-Message-State: AOJu0YybBioyhiPCL9DjaZRMYvgp/5UBFjdpKeFGTrxlz43ATWjWvMx3
	e120znQkGX10X5XG+/54MLMGwUgBDedRAeW+aE963fTEpGVmAfWVAxJgsxzeRSZId7nldOdrTFh
	xn3HROgY2N+gHsDK8mwd2xA7aGKVXeap2szh6wL4rwWrHXdXXTNVqXhrvcbbs2tWyiipCcjqy0H
	CQ
X-Gm-Gg: ASbGncuPFmI8bwQG81XIODMUkvYstVE5pW2ZWdQI1WkjySQURw9wG2CFxY3zlNfU3Ms
	fjbNTtB/FEcosb5CZQrfrJDw44g79bxEMpGRoKxmFpe0/f95OeeMdI5QmHgxznwFzZ2EkotNjgs
	4r+UYHaBAOGWwkeAuUhtfjiZNnyzdkpQzKwouvByTp8L94hS42IxycjaUZ5f9luhvGYdXmTQlQD
	+Bt2MvaFK1BEj71iFd46eOsfeWBb4MEU4JO1OYP/4RS8j8jn1F998SxXEUmYZNDolgBJfB8FnPG
	0+AINE0dhZJlVx13939R8gEMRGjEcTfdLNrXu3SljkXdv0ZzvNkQn7k4vYSq
X-Received: by 2002:a17:902:e742:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23601b49d15mr242506675ad.0.1749546851532;
        Tue, 10 Jun 2025 02:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOwMPNGYBQKcN+lk7fWsFHzfkA7PJwctZFoqHIwgQuY6QdCy4j8d4zLM9Q0vh1s9frun+smg==
X-Received: by 2002:a17:902:e742:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23601b49d15mr242506245ad.0.1749546851127;
        Tue, 10 Jun 2025 02:14:11 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:10 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
Date: Tue, 10 Jun 2025 14:43:55 +0530
Message-Id: <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXwl0cfWFywlyd
 2FDrKgr73jPMw6/X+HjZmFy8F06u6RZq/yb3xlvrfzXHUqLlkk+Er6dr7ffQHyxNuhAhg0oOUje
 rUBkoCslSxoN3YdQyi4RMUaXHJjc89khVVM/9rDxP3HVbxnPYQ1tNSIKek3dlBTh5aKUY0y8Z++
 vF//33CJ9EvLysDmTqyjxhLxRTvNRKpqF2ylh+KU/u0kvAR8bGY82HXTWE8UK1e0ktiTSkDA0C3
 O6s2zWYmw3v+UFvQWjeI3fYAW7Dr2+5yMHHS0vXqqzi2jp7T671iETVWVhsHBuxnfz2DPOruaR5
 CB5FunJAajZdT2+siOIbQiSuI5UXVplNX4jSwTRHb/7iK0BsiWWUHIZRWUqJAH8lBmOuiqw9cuN
 8waNDi5ejM8K12XQnTuFBwW0kY7TVBDhABLj1OKre1xUzUdyR5NfEeLqeQqjSRxJjqjbeKzh
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6847f764 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ProRYBKZBCDr5nQBVQAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: aQ0noTepTsgO5hriAIt08hDwaO0Gwa6O
X-Proofpoint-ORIG-GUID: aQ0noTepTsgO5hriAIt08hDwaO0Gwa6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
device mode are generated by controller when software writes to QSCRATCH
registers in Qualcomm Glue layer rather than the vbus line being routed to
dwc3 core IP for it to recognize and generate these events.

UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
to generate a connection done event and to be cleared for the controller to
generate a disconnect event during cable removal. When the disconnect is
not generated upon cable removal, the "connected" flag of dwc3 is left
marked as "true" and it blocks suspend routines and for that to happen upon
cable removal, the cable disconnect notification coming in via set_role
call need to be provided to the Qualcomm glue layer as well.

Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
there is no mechanism through which the DWC3 core can notify the Qualcomm
glue layer of any role changes which it receives via role switch. To
register these glue callbacks at probe time, for enabling core to notify
glue layer, the legacy Qualcomm driver has no way to find out when the
child driver probe was successful since it does not check for the same
during of_platform_populate.

Hence implement the following glue callbacks for flattened Qualcomm glue
driver:

1. set_role: To pass role switching information from drd layer to glue.
This information is needed to identify NONE/DEVICE mode switch and modify
QSCRATCH to generate connect-done event on device mode entry and disconnect
event on cable removal in device mode.

2. run_stop: When booting up in device mode, if autouspend is enabled and
userspace doesn't write UDC on boot, controller enters autosuspend. After
this, if the userspace writes to UDC in the future, run_stop notifier is
required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
event is generated after run_stop(1) is done to finish enumeration.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ca7e1c02773a..d40b52e2ba01 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -89,6 +89,12 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+
+	/*
+	 * Current role changes via usb_role_switch_set_role callback protected
+	 * internally by mutex lock.
+	 */
+	enum usb_role		current_role;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 }
 
 /*
- * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional, and drop extcon
- * handling from the glue
+ * TODO: Validate that the in-core extcon support is functional, and drop
+ * extcon handling from the glue. Make in-core extcon invoke
+ * dwc3_qcom_vbus_override_enable()
  */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
@@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 	return 0;
 }
 
+static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	if (qcom->current_role == next_role)
+		return;
+
+	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
+		dev_dbg(qcom->dev, "Failed to resume device\n");
+		return;
+	}
+
+	if (qcom->current_role == USB_ROLE_DEVICE &&
+	    next_role != USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, false);
+	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
+		 (next_role == USB_ROLE_DEVICE))
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
+	pm_runtime_mark_last_busy(qcom->dev);
+	pm_runtime_put_sync(qcom->dev);
+
+	qcom->current_role = next_role;
+}
+
+static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	/*
+	 * When autosuspend is enabled and controller goes to suspend
+	 * after removing UDC from userspace, the next UDC write needs
+	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
+	 * done event.
+	 */
+	if (!is_on)
+		return;
+
+	dwc3_qcom_vbus_override_enable(qcom, is_on);
+	pm_runtime_mark_last_busy(qcom->dev);
+}
+
+struct dwc3_glue_ops dwc3_qcom_glue_ops = {
+	.notify_set_role	= dwc3_qcom_set_role_notifier,
+	.notify_run_stop	= dwc3_qcom_run_stop_notifier,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -717,6 +770,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	qcom->mode = usb_get_dr_mode(dev);
+
+	if (qcom->mode == USB_DR_MODE_HOST) {
+		qcom->current_role = USB_ROLE_HOST;
+	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
+		qcom->current_role = USB_ROLE_DEVICE;
+		dwc3_qcom_vbus_override_enable(qcom, true);
+	} else if (qcom->mode == USB_DR_MODE_OTG) {
+		if ((device_property_read_bool(dev, "usb-role-switch")) &&
+		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
+			qcom->current_role = USB_ROLE_HOST;
+		else
+			qcom->current_role = USB_ROLE_DEVICE;
+	}
+
+	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
+
 	qcom->dwc.dev = dev;
 	probe_data.dwc = &qcom->dwc;
 	probe_data.res = &res;
@@ -731,12 +801,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	qcom->mode = usb_get_dr_mode(dev);
-
-	/* enable vbus override for device mode */
-	if (qcom->mode != USB_DR_MODE_HOST)
-		dwc3_qcom_vbus_override_enable(qcom, true);
-
 	/* register extcon to override sw_vbus on Vbus change later */
 	ret = dwc3_qcom_register_extcon(qcom);
 	if (ret)
-- 
2.34.1


