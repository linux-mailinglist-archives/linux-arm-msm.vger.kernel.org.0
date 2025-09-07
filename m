Return-Path: <linux-arm-msm+bounces-72441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87652B47CC5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 20:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31D61889110
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Sep 2025 18:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0830029A309;
	Sun,  7 Sep 2025 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZuiEqgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E371298CC0
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Sep 2025 18:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757268870; cv=none; b=fc/6y017zwCYaaLrDoi+KkbLct8BeKgK2gqINP0tRCTgwZgMWfFDqqfD99Yb/OoTDRSI8YTGF8FIEFb14+XYTTD0MwF937HYhVNKVMux7230yMXroEb3Xm0PBJqVWDVu/LOLcla76YsKoUUjUc5/n8IFr1Bw3vBTLbszEoVPZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757268870; c=relaxed/simple;
	bh=R6KKjfE0n/H51wIYeESx4WmybdDuxempHU7GWuXURpg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aCWPZssKs9uefRAUrgZsr0ITKYgMAm3dCt7xC60ESIDWRyF+9uEOg6YKyXejOsGdGoja2l9wlrX/pruXz85TLA4i7NikZbGt3fDvr6LX5FTg7KcqhUvdm2hjwIxu1cBHSke2EiLEOuIHkO1PixL026x9yb15u2DAuTJ/awyDe+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZuiEqgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587AfQtS031181
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Sep 2025 18:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HqVMPP7bx9r
	Rkhe1pncl2vK9OwnV++uC7gBR+2Ge7ck=; b=jZuiEqgnGmrXFfS6XPlL92fqqQj
	EqfFMKdp3IJqTX9DChqyIRrbDA6gY3cwEp4/6PcLrpTs90RqZKD1GsEP1wvrEOV5
	f8MXc28eTc8W8yjvRaDohOiaYMzi/BiIgoeBMmyZlD+IAFUFykMyNcmphfE+Cv3j
	KqWOWUcP1FfOIe/Wh1zAnD38nHLxXwMcIudTCQfDxFz1JBq6qJxT1hZnb0hmNI52
	ZlWX3j9f60L+13VqgIAUX98XbgBN0naZTWVWgyai/IfCy773ciuAOMFZYv2vvBwi
	LMaaQhN6zrBNL630hLtPjlubylLT5pj1DZ9nByWnJ0fkyXwsNUk22OwyrKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490anfamqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 18:14:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24afab6d4a7so76468465ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 11:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757268867; x=1757873667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqVMPP7bx9rRkhe1pncl2vK9OwnV++uC7gBR+2Ge7ck=;
        b=GxB+EdTtoyWdChDawlHt4SdhkI8IhSNIhoiEnihGq/L+KKri63F0+9ceUBiUSZA2OU
         oMAhpYNLJM76dQLp/GNOmh7u7ERyf0dwnbRjJjU/SPVvfHYeEORStsS4On9irX5DbPB4
         kfUO5TM9pmy+tzzx7vYAsUjZ0BuWQvQX6hmzIbHpDZbafJckMjUajlZUq+v0pdpw+c8s
         rul0ieMrq9RNTYUwE/PSWHHYxogcB7/Hix/7dZFHHBYhv8+/yw1nZ7XNq0Ri4d59B0gO
         sSOgFN01z6IkouOD6+1ltwZ03+JmNNKlPhzh9R3G1lO9wd5eDbXBlgeXnrdkHCQJqsuw
         Lu2g==
X-Gm-Message-State: AOJu0Yyny04qXagRAT4a6bc0sn8rL+IXK9bTRmc1BmPB5ERzThAIpYpc
	ePly2iUF6uUqXHtQqxF/vrETOpRvuqrvzMdBWCY5jYBQ/qyo0C9t6LXZHNUIz8YaFE7ly8iSdUW
	I+FLAiJ4P0npqhPt3g7k27HRGwjtxioaCS8UmYHV0+uODs+9BTiBZJDPxoVEPVTjDn17l
X-Gm-Gg: ASbGncvVYPMbp6MsaWRc5CI+FzAU3Mz2zVZj0B66SwNRcyD/SkH800Lt0hYg45JhFMk
	eYPcXo1b5wiUXLfZswEJWa7EQZCc4h3Gud2vvSzokX4e5rHNNBYfG5mtmsO1hCi2J9+IiulSHfl
	i6o0hJ9r2kHzWB1+wAke5vMZooC0dMVCZAMj33vasDtO7mCHyV1k1Knj0mHYNmvnBdEPQaAy795
	R0k7MsUBD7eFXHZ0Ud5owte49YJAia2mI5z+Fuz9pQjbj4yvm/ck+vs46qrQswkJxWY6ZTHIKpQ
	4tcVb81mEqY/cnirTsDgLt+fl4XLOVd4kJDzpR2aq36uShozG5Po9TsAL4lZW5S+B3T1XECt5nJ
	DDw==
X-Received: by 2002:a17:903:1b64:b0:24b:2b07:5f72 with SMTP id d9443c01a7336-251736df041mr62517315ad.28.1757268867475;
        Sun, 07 Sep 2025 11:14:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExzyBRYl6czyYwC9M0nmWMqo3nas+FD4zYM1tcPoUdDpDX4XkmMGGylyH9dVar7eL9Jvbg1Q==
X-Received: by 2002:a17:903:1b64:b0:24b:2b07:5f72 with SMTP id d9443c01a7336-251736df041mr62517165ad.28.1757268867005;
        Sun, 07 Sep 2025 11:14:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cde5b6484sm84074765ad.19.2025.09.07.11.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 11:14:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 2/2] usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend
Date: Sun,  7 Sep 2025 23:44:12 +0530
Message-Id: <20250907181412.2174616-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
References: <20250907181412.2174616-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4US1rDk9ukKxno8979mEuBzHGdearOBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwNCBTYWx0ZWRfX8hUx/v8hQHmK
 +wg0WC/5y0mko9XfTh8CKIfKrpty7RfSWj6QW9UeDUsijD2kZafBhLepBDU2R/jM8Z5K6Dulpwx
 VfQED3b0KfMz7LzUcshWq4MIVjdIrjhDejfQECs3SPJP2cBD8DhumvEizFGCkAAiTdRdrLb+DJg
 hSEJiz/acwC3WABQlz3zX3RVArWHdj+lmQvCktMpgVTQP97iBcA3G5Gh2ipWlq5qa2kcUC1y/Sj
 0Il8EGc0D9XzYkh9D8AYs0Og9qA/4SLBk43WmFsS5tc/OIY6tmyD8Ddhh0jHbSHrMdhy/GMoDQU
 IFa1Z6CQTB3Bi0C85TKRqaNFiYUv34m8jWOAK9eS8AkkNiWygooFner4oG7GIKVeUwqB24neXDs
 XqyEL9zU
X-Proofpoint-GUID: 4US1rDk9ukKxno8979mEuBzHGdearOBA
X-Authority-Analysis: v=2.4 cv=CaoI5Krl c=1 sm=1 tr=0 ts=68bdcb84 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=ProRYBKZBCDr5nQBVQAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060004

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

Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 8a9018ca650c..ded2ca86670c 100644
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


