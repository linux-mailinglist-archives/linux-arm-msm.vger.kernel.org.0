Return-Path: <linux-arm-msm+bounces-106875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEoZI9WnAWrlhQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:56:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC9950B6B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF2C3001058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8533BF66B;
	Mon, 11 May 2026 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzKgWgu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RUFMwHwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8020E334
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778492672; cv=none; b=o2FSQhulZye/KFwbjvXT8UxSaTpKsIim/FaPKXVDF2fK0x4p5csiJ6bX8WU0hFX2ReoMUTdoON19OoXt3xDz9+zRH6u2aXK+evku5ts9oz1Fc07Joxnkt5QfNgumYs9DuiMfsLDB4E5vLmtXAS169zEvqSVHZm5lMsQ/8AuuweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778492672; c=relaxed/simple;
	bh=y8ugfifKWZhQsI6vXzwmg6Z/bZA61CWGb6gUBdjc4es=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RTmI03wOVzF6xa5UZXnC0odEw6iHGs0ZAcgm/ORF6+3NkWb/BLAdl2cffP3XnncGEIw/EyXW1ZYWrNl7In5byvy5nVg8xzXfxYNOzP7wGnRg6yhRyLycxNKi89VdUxEphRYVSfZz/0c+gF6nT56G9Vja3oRxoW1aa+JZdsMp/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzKgWgu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RUFMwHwU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6Z4IW3456307
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6kwotBqV6fsxjKPSXJIEDRjr0eq6H68sZL8
	sg/0hM0Y=; b=XzKgWgu6iV+/7my+zUSdXkiRyMm1/yAiqWq+jceQiLVeVMr7x0Z
	sgGIRvocuPpeIpPNuW1Ox8y2zL09ezDl6DiJVIqXIWdfA2yC/X77upph1uHvLW1F
	GHJNXE9Skka4NX+oayxUmo8aSrRntofCk4ymEuLcrONDFT1ZtCezaUo1rytQ05rf
	KVOpcZHJy1M574xFhtujW8BNVIiKxvRz87AAKatODN9m82QrtKO6O1ApeFXxptXb
	81omALpbNvwa4JC1eoJENu20P3dQPyiPEWiBc+gSeHxRIyJSgh96XLR6/33ByC5a
	T4XjVhboCLrHwHx7VFOGQ8cPS8sNkDYr+NA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksungg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:44:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so4953247b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778492669; x=1779097469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6kwotBqV6fsxjKPSXJIEDRjr0eq6H68sZL8sg/0hM0Y=;
        b=RUFMwHwUokNRPD+011FTmCDHnlZ+kR9Mm7pLdpYV51E1uMINy/XF2pT3NOAPV56z5M
         eFQ3DffKPYeTizUV3+Cu8tXlwXHd8Rcvwl4avsz6dBBrBmq2o7DvOxRlQLM9HpymYwEJ
         Dix8hYy3sb9ZOvkFfgHqC7raiyIVPfzY1hps55+sdHvCyUnpyAjASj5cu3haI1Rj1QRY
         ozMgihh4GjFHhckx/CY/eojZ4+BGBj3TqAcSrq8gU2bOzMHwPhhthA/QgaQR2nLTn8Mk
         Ml5ZqKSIhILnCJoHATmLtaUKYlHk0coxJkjbGVCoM+3NPAtAtBxBvztXDUnUEsiWCaOG
         1xKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492669; x=1779097469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwotBqV6fsxjKPSXJIEDRjr0eq6H68sZL8sg/0hM0Y=;
        b=SiAGEHYPvidhvbc+NZunt5L3jxTFnpJI29KvOsM+B83Meo9IDxu7hzge3hRNnYU5Pn
         FYNoCKrIVxPFuY25O9yTWJJnBpXwKddf1dpvzCQZ4GPvROe8HOGucyL5Ye5Sz84566ht
         QAsT7oLtB0hnuyKpJzHyxs7+fMdKAgnguso54T677lDdxdFakJMuNLLBEvYXdilbaCRC
         QwEI1t3hrMo8g++zqzV6MRGR9bjQdRM9AV7Jh/9c84kygAlJaxZ8BqIm94g9455LDhbV
         JpfwPhhs8v7Hj5/JrMAYFqSDYS6sVizGzK+BC2kZdzeW1tRsWgF3ZWavq/7Fil2ty7rC
         Y5ug==
X-Gm-Message-State: AOJu0YzFzgZwgbsEGhatJ1WvEZe0gUtIIzMK1qZKgjMHzGQlYK5Fcc4+
	/gC0FlgQ0eSdYrjniYb/o0IRDh4PNncqonLSqDAuuaToGFcScVCbcH6n5q+NAviPGnqLYqYQ4CZ
	YHsAJSjjtf2qfdG5lJTV/sTsFkbill3jXPMp7afcdEusG5jhcPHnpx5fQTD9eVFfIKB19
X-Gm-Gg: Acq92OGS9mcCOc2HFP9699Limkwzj5NewBJ0prWwPg4tUBcKFNRLrE+KpX6iuR+Im+b
	vMS/8lxc2TSYAXzhfOCAOmyN2irVGriMG/CAmHNVTawPGBq8LCIx2c315WJIyRTkl5FpEhjEy2t
	t4PwZLRPd76cTLPwY6BWmkf3MBilyuyRvAlSaiyBygruWPz35qt9SrjuVoVkytBQVHDzbALC1qw
	/vky0itHrjIaUqyG3Nx2DjyTA0dukSmkiYmAD9mN6MZlA0HnsD9C7s6kZM+PARo6j2/E2IbLcaV
	vO3lHLU1my2klavpS8pPbr1Sb+kVefQBRCSp5YzmDXT0HV5+4itUkpoP3sT/cxdAKxS1dcpHWOj
	u1fZRIAqoqEEdU/S9vni2mbWvaINqSk/bMRXpvmW9+ZtOsyTvBBMjPDqigR5E86QfJN5sqRxgHH
	N26uuHMzZr4dxxDUw=
X-Received: by 2002:a05:6a00:2e96:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83bb8b74857mr14461536b3a.23.1778492669311;
        Mon, 11 May 2026 02:44:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e96:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-83bb8b74857mr14461513b3a.23.1778492668651;
        Mon, 11 May 2026 02:44:28 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm25070887b3a.16.2026.05.11.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:44:28 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3] usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets
Date: Mon, 11 May 2026 15:14:22 +0530
Message-Id: <20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4d0ZnvTzLVCE7NHPUWvT34mLDYn9qmtj
X-Authority-Analysis: v=2.4 cv=d93FDxjE c=1 sm=1 tr=0 ts=6a01a4fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5E9VfmP3G3YUVyn1PBUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 4d0ZnvTzLVCE7NHPUWvT34mLDYn9qmtj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwNCBTYWx0ZWRfX6+1jo3RY8YGo
 EmYJtXS2ApINjRuMyxKKPIIjF6dlI0gre8+Vc3tV85+IpbgkhdMx7UwOb67dYCwPcGIfguFa9T8
 0sUVcQya+HrOngkrmnSH5zxHPD9vO1wUhabfHWt/82Kk6eK3A/kRPVWHAS4rCd6IOSAP60W02BV
 srmzErOV4lP3KUJ/4RTxzeY7Lkq0W+Ytk7XinoWx2r9C+cGrXRC653lACYlvI3yFbDeoRKGrko5
 76/WEWAuyEot+O0VJz9moIxu1p1Rc88LdaS1SwmNbzYdxETHe6grKhjnqs3UNG28KGNyZ9/gq0g
 rTyDOm+rS1X9fYKSo3INsllmFlIC6fnJeLuFDaiP61kTTIDSVdAu/bboIlb/c8tl3RbL+hmhCYD
 MO1hfMiw3emVEFS+7sV6qQ5gvhCMxajCbqkfog+1wFjJKQkGtlcJ1lmKvAIuyVHwnLX46t2OAWe
 UePt5IAJ22SxoZaTqrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110104
X-Rspamd-Queue-Id: CEC9950B6B4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106875-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

This patch was tested on Glymur.

 drivers/usb/dwc3/dwc3-qcom.c | 94 +++++++++++++++++++++++++++++++-----
 1 file changed, 83 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..3b025d4beeae 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -60,6 +60,10 @@ static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
 	0x238,
 };
 
+struct dwc3_qcom_platform_data {
+	bool			uses_eusb2_phy;
+};
+
 struct dwc3_qcom_port {
 	int			qusb2_phy_irq;
 	int			dp_hs_phy_irq;
@@ -85,6 +89,7 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+	bool			uses_eusb2_phy;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -272,15 +277,23 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		if (qcom->uses_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		if (qcom->uses_eusb2_phy)
+			dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		else
+			dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,8 +302,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int port_index)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[port_index];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,12 +318,20 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->uses_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
-					    IRQ_TYPE_EDGE_FALLING);
+		if (qcom->uses_eusb2_phy)
+			dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+						    IRQ_TYPE_EDGE_RISING);
+		else
+			dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+						    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
 					    IRQ_TYPE_EDGE_RISING);
@@ -324,7 +347,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +355,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -609,6 +632,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
+	const struct dwc3_qcom_platform_data *pdata;
 	struct dwc3_probe_data	probe_data = {};
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
@@ -624,6 +648,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	pdata = device_get_match_data(dev);
+	if (pdata)
+		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -838,8 +866,52 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
 };
 
+static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {
+	.uses_eusb2_phy = true,
+};
+
 static const struct of_device_id dwc3_qcom_of_match[] = {
-	{ .compatible = "qcom,snps-dwc3" },
+	{ .compatible = "qcom,snps-dwc3", },
+	{
+		.compatible = "qcom,eliza-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3-mp",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,kaanapali-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,milos-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,sm8550-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,sm8650-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,sm8750-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,x1e80100-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,x1e80100-dwc3-mp",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
-- 
2.34.1


