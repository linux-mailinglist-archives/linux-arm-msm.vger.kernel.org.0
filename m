Return-Path: <linux-arm-msm+bounces-68648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3CB21DBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A264416BEBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466792E2DD7;
	Tue, 12 Aug 2025 05:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USi1VOu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824B2E11BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978161; cv=none; b=nk445sTewi2GYwx53MALmY0Vd9IHRPbERtK/VfSRQKMB6wyZySCcB+y1tjVGFk51N1SlK/GuiDiJHiEE2QxRMH6WyqH5CUSFnHPygzNQ/EcoR65Q/utZ6rRgJl3yExplYc1ECGVhXPKbPGpZvcf3imbRqd/S/1PoHKW3Ka1LYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978161; c=relaxed/simple;
	bh=JQUvjX+esn3VOQ09k8xTcYDpFerXLwFI4n4YqQcY5fA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOrd/U4Q8YChY0RZ33BlHog5DdSquPCcLVK0Frn4dr80TpoXiwJ7XoYN2mvLebtJHHQYK2ZhVWMlYyPQF/T7wXuccOSnGLshdgvHH3rFo258dl1g7pD0LZeNdvDnLYm9U0PAXlRoQCdFuvOR8fSwxUEOxzHUhn8HslWLEGFV9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USi1VOu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4gP1a029255
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G/gG+UHmxNe
	7LerAlOSE0aP8FVlAP6ai2if6JhILHH4=; b=USi1VOu9Ac3OnKiJjJMzv9rjObs
	c2llAkLBtc73gBgqnKvoalGa777xawZnnCNU1O+PfhfcpUxOLjnNvEwDUoBdjNMh
	LEhDmIAFGv+6ot5zuDKmgp/OJSZS8DOUPUzIaAFI/4AQo8zt6dl/A8BZXvoztGsG
	rq34IwN2U3Yp0ThonJyJTLpqsze/HQG9WGGNf6pS6Ek/oq7QcUSHWYlya4bGARn5
	UiGEXRqCcSdQhQfQSAyvQZNw9Wq5AUx6rXTFSrE8r8ie3rxKyy6pVdlWfwUSUeNN
	Ywds6G20TwcRZ8YCy5ihCqoBWYqaxplK/m7hLO0OQl+CYrbGJ9PueRscTMw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sq4wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4310451ae4so6855658a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978158; x=1755582958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/gG+UHmxNe7LerAlOSE0aP8FVlAP6ai2if6JhILHH4=;
        b=QwpXalYJzccH8iOkAsGsfB+N7PeJHcP1Xav5Uhx4AXdUCLagyx6CJtDVB5A3TS2cj8
         gJ8o0pUW7df04GSGR3b0dse75CUlC7eDvhmZ2vrOX2+l/UJZLqzCXIFTCXLXovuh+JIT
         341Reu2mJcrMQN9lDDZQuL+6ufA8llldSKcT6CFRqBmbcQoARF3tYh3ULK7YNh+JbhkK
         EUdZnz1I9T6RGsqFpMHPJS3t0wHjsGLBKbgs8afhveZ5fTeBPhUazJcm1mmUMOCrVRRP
         EF/a378NduT1ZGvb8zYMUhU0dk4mIgzVWq96vcsaCSkRTmoPiTeIlatCu6w1acxZMM5E
         I5xA==
X-Gm-Message-State: AOJu0YxkszsUZXDFYpwnr2u6h5YGf+LnjX/9cGseDkWkYQbvTrHNjV9r
	pDnRAgFOypuJJxPYRkwUP15ax7sGJEfJol904xPQdEYR4JRoZOVNBcn9hgKV7dGVKO9Gh8B6OUs
	eP2H0twg+wGrpSye3HLC3ZUtGBSNxpvyfEDCEs5l2Bz7vvApSyotbqRJ6TTySbHKO5wDo
X-Gm-Gg: ASbGnctvpdXY6Pi8F66ub44mLeE9NjR1VnPkRrAgmucR3ReT4QCGVX9e51DWNtWfrW7
	nzqh8TVXvcICPwFdi7x4iIi+ZsfBgB5yRvS8f0dIwXLq3FeWaOYCkMaPOnJvw52W/uPysAaLLIf
	i8dpvZrDfVk0W4le0m29kerRcZytGTQ0iNKRUkbMzpgJ/DQuIuiuebWI5rhFlRmShQ03Rv/yf68
	/1m6d6sDTOdeCn99WMltIMeqiHihHG9hPnBve0PkH7pXM8naNjOp2W5bPFaQvyKir9NGZR3cV76
	LQtC9c+ZxNni/VVoIfRPmg3VDW/M3Mr6jRE4ZeOlTAATFR2Hh+AlToagEjBffOu5QEvR+migyfV
	cmQ==
X-Received: by 2002:a17:903:947:b0:240:1ed3:fc1f with SMTP id d9443c01a7336-242fc211210mr34744725ad.12.1754978157491;
        Mon, 11 Aug 2025 22:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/QanHb+zWPyHYRCRcDwEedFqKTwHXRZJYaieZ2tmPl7kYzOR60yl7cyzs+f7OW+mFxCsIQ==
X-Received: by 2002:a17:903:947:b0:240:1ed3:fc1f with SMTP id d9443c01a7336-242fc211210mr34744345ad.12.1754978156987;
        Mon, 11 Aug 2025 22:55:56 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:56 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
Date: Tue, 12 Aug 2025 11:25:41 +0530
Message-Id: <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689ad76e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ProRYBKZBCDr5nQBVQAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: b-vDtS5DSKX1oBO45-PgX3q9PS3DdVZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXziUfFFQzitnW
 loHIhBDOV7MgE/q1dxnvmKrDgC3RaZY66Srz+m3FstLh7O3uvrvOq1OV3Kwh5WSlofQG7i2FeY8
 rWr3GSUXvHsHjJU8M+pqkehaJI3GtRvjFud+E4sSgBA48DlWLoagbA1pJHTWtAPTtUiCfMGkks9
 Auz34nY68HgGP9BoQeylUlnOt8IUrok0dxB0OG9ha09O0kOgYDfQAy9RZmr7neAX/jay6lZBTUd
 JrW/S+SQJoEPZuXmnn9toRPNRmz1K68Ag++1jnOJylXNTBYNb765Rp/zFS9RehaUDsuYVFTMUka
 zeiO2ZHt07KFqyILq00ja+7JICU4o2HaX77kWoYp3mjLR7yadvJQh37t7OnUxTUWIYxFH/A/HhL
 ScEz3xxK
X-Proofpoint-GUID: b-vDtS5DSKX1oBO45-PgX3q9PS3DdVZU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

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
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index a7eaefaeec4d..d89fbb1d8994 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -83,6 +83,8 @@ struct dwc3_qcom {
 	bool			pm_suspended;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
+
+	enum usb_role		current_role;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -111,10 +113,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
 	readl(base + offset);
 }
 
-/*
- * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
- * validate that the in-core extcon support is functional
- */
 static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
 {
 	if (enable) {
@@ -560,6 +558,55 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 	return 0;
 }
 
+static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
+{
+	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+
+	if (qcom->current_role == next_role)
+		return;
+
+	if (pm_runtime_resume_and_get(qcom->dev)) {
+		dev_dbg(qcom->dev, "Failed to resume device\n");
+		return;
+	}
+
+	if (qcom->current_role == USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, false);
+	else if (qcom->current_role != USB_ROLE_DEVICE)
+		dwc3_qcom_vbus_override_enable(qcom, true);
+
+	pm_runtime_mark_last_busy(qcom->dev);
+	pm_runtime_put_sync(qcom->dev);
+
+	/*
+	 * Current role changes via usb_role_switch_set_role callback protected
+	 * internally by mutex lock.
+	 */
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
+	dwc3_qcom_vbus_override_enable(qcom, true);
+	pm_runtime_mark_last_busy(qcom->dev);
+}
+
+struct dwc3_glue_ops dwc3_qcom_glue_ops = {
+	.pre_set_role	= dwc3_qcom_set_role_notifier,
+	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
+};
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct dwc3_probe_data	probe_data = {};
@@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
+	qcom->mode = usb_get_dr_mode(dev);
+
+	if (qcom->mode == USB_DR_MODE_HOST) {
+		qcom->current_role = USB_ROLE_HOST;
+	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
+		qcom->current_role = USB_ROLE_DEVICE;
+		dwc3_qcom_vbus_override_enable(qcom, true);
+	} else {
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
@@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
-	qcom->mode = usb_get_dr_mode(dev);
-
-	/* enable vbus override for device mode */
-	if (qcom->mode != USB_DR_MODE_HOST)
-		dwc3_qcom_vbus_override_enable(qcom, true);
-
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
-- 
2.34.1


