Return-Path: <linux-arm-msm+bounces-105573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCXmOFHK9WkwPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 11:56:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 931964B19C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF1533011876
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2026 09:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E2A30FC39;
	Sat,  2 May 2026 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="buot97HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7PWPwVl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0341F7916
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 May 2026 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715786; cv=none; b=paFc+YJF2FAX5FyXXOAo8DA1sNwTP6SMKoi4w9OWr0RAWPzTL1EufyFTXdX1Lha26ZSNmHFUI/xKqaYSM7G7IKl5oLAbBv+QUSQmedRGLr6H9yFdwlHlOuQsn0C/evbMJMLxUvViaHjspTtln4VO45hHSMsPQaHbh6f9hIbyvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715786; c=relaxed/simple;
	bh=Cx+joeBc+rdcVoqFpJms6AZ1GOMKvcbhmc/Ksf/0Zug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XEmWW34M7dHzI3vLefd5+WBJ5vEO/OOJbXarEFqvlQQxTpStLEdvXy3nQdMx8D6G9/HxgY5HN0ulFttQPghmSmGAUdazVb9iyB4ASfW7hmeD1Jjq8BYX9bKxS4x83iIjH78xo7AMU3c8qbHlv5dbJbpT2HKeBAY71m1Uj52AmjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buot97HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7PWPwVl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6423Y0vD2745315
	for <linux-arm-msm@vger.kernel.org>; Sat, 2 May 2026 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzW
	P4uYC3j4=; b=buot97HAKC3hozGmR+Zs5eFM+zBC39ZbBPB+Aeq6GxNRIAZ/lsx
	GCj1Z2bE9/Z1AkE5W/aswlRKXEXNe31tGeRNlX9IxCa9l+ztn7km85zGIcoE0rWm
	AXnO/tR8Z4Z1UeQPrq4NNk5TFvbm2pkqruNeOkJLwktqYPonXPhpUgHB+cFnD7+V
	/3oFRXxIaHfTlQ2fiTezyHt/AQETRKtZ9zWZ/DBKfdKsQEjR+uFGRKs3nB3CSsap
	Br5fYloMip4PtSNZbwBbQpZxiUaQ65KbexN6qbs3IWhtkulHfGeNZDh+qJX3G29T
	/Wv7aY3IG1Jsd3cim5Z4oawon+Zh5+/StIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw87s8qyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 09:56:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so3245740a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 May 2026 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777715784; x=1778320584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzWP4uYC3j4=;
        b=A7PWPwVlmBEz7NR4Qkza9WLUjFHsVbHyiBRNo6C5a1M12N62p8+N4VN+kPhFwIhjXK
         xNtDWIjzwiQEhYN+REiEOcAmHpiuHqSU/GLqkoSsxFRBowHUfTuiq7hHL18s7z5Cdo/j
         jW23d9hdWnI/snXqJQAbFDh9m/dddtv5HBboItgBJBBHhGiYGk5ue0Co0S2y78r/ZWGR
         BoTysSJ6SB+bDwreG574pgMpaFoaEMIbvG/31Ps2Y4JHodqrVHZ1O754uGKH6yFkaArc
         kMP4z7Tpv1BsHR+3q3X4T2fqAohkJWC5iLWiLkKWCRN0OCbbmTEU1mqzqvtUpIYUWEyD
         91qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777715784; x=1778320584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17E1Cq1J3JMEZ4+HCKxcenEnYbEZ7i1+KzWP4uYC3j4=;
        b=PQIH9t6vU2Ox1v0SrN3w7mKgSO66A0lUgQ8DxAtymcujeimavbD6Mr3Zbv6jCQhUO0
         /u7HZQexeB+czs6ZnRvcgZ+oF9q1+nd+hd5mB6LqF+Jig4EjT+hjuvhBBngjq6wa8C3/
         g4rFyXXZO9lJmo79IUprwQSMI6Hbs5A7ri8UCzOCjbsKwHgsIEIi09d4vIMaSOdmDp0Z
         PJXx3DwJfFLUs59MRwzA4+Zwfih9If4DmNjDreQ9ndbvEXCDu4AyOvutcsrnfddpo9B6
         gOwSGg7rYpm1OMxfrwOP9yhJ2sEE/gtqh/ec3F192P/yXjMwZi1oDX9wWU22VKKAQ7Z7
         FG5w==
X-Gm-Message-State: AOJu0YwFh46jkmThE0vV6ONQynjHOkJdk3rm9RwFfji/TTWeI2nIKhEW
	iVOlabbi42xqrxf1m0/y3+fLB85SU0rM8tdRG7Wqzjc+ADee12nALFGxtdbsS6fIhl0LRbomB6J
	1OvbDuRRX66TypHI0uPFUoxtoYPYY7VXETjoPqhts0+nM7aK6zQMcaK2Ahjo4ENYJwzqXVzuMuL
	Hi
X-Gm-Gg: AeBDieuBmAKn64UQ+PH+rO56xC3ybaxzGyIbBCE2vWGwY0Ffw0Lh6R/5XvZ2tNw/2/3
	GQUGyGNXWMPfCaPK8ah8H0INZp2a6Cqq9uXlfMehKETNIBCvT0dQfkDhvYVvZX9Im/CR2WzZq+C
	R8JDTmwpmF/fEw4LNEn5eikMyPX5SSXSJTBjIVjc1pVnXwsfMriu3iCuISnjjtD8ZPn9CGK+KPv
	t9j1Gnf8o0DjALOISGc7n+U62D+ftVehKeuSz0SY4DpGespCZn6XGtG5M3DEhhykx9YN1PMJju2
	ZvRkjijGKZL85iTV3/s6RgxEmy6VVxoP7fEWdsp0ouOGRWtX5ZQpATCGW7lH++JttsucWhnszFv
	lS7qCxlc2X90CQ79w4dfdzQGKpIauzRi8PibP52Uf1c71QmXli+lcxPCfJRKPdEhzwFv+Fy22W6
	cF6BjQxZKQV80uzdkyPHPnflURCg==
X-Received: by 2002:a05:6300:218d:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3a7f1a955b8mr2520319637.16.1777715783551;
        Sat, 02 May 2026 02:56:23 -0700 (PDT)
X-Received: by 2002:a05:6300:218d:b0:398:4bf2:4285 with SMTP id adf61e73a8af0-3a7f1a955b8mr2520287637.16.1777715782870;
        Sat, 02 May 2026 02:56:22 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c801bccee15sm170506a12.9.2026.05.02.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 02:56:22 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Modify interrupt handling for EUSB2 Phy targets
Date: Sat,  2 May 2026 15:26:16 +0530
Message-Id: <20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: w523vBCniMxVyaMU4sHe-Aq3NZugMgZk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAyMDA5OCBTYWx0ZWRfX5ndvHbRLhUJQ
 /fNGafiaG19L7Vq68X41QKBB5T9yv3AdFEAf907isv2nGWt6/G5s2ZJMojYJdQFtn6I0P7ZsuD9
 zdaZrfnADJ+H12cQlvKrcfH20NOGZnbkyOKHKuNDTX13L66MoxjP7LRaJIooyTfmacF8UN+f+Zm
 VVLt0qu4yDrgNuUW9Hm0AxZakmtoQK8ygdtM7N8qSyBXfPCRmjo9AtEAY7Y/7gxUzspy5lvrqFa
 oSYb1GO/H+sx1NnpihifYSMzeo9YkgIEWUBzIcJiXqFcJm5AzPvwn0d74AKF6LAISiletEExdoH
 LagSh4lw//xGw4xrsHye5CxSh+DWAgRjME6oNVO5/y0+3m4RKRZUe5uXi9kdjH1bDROVHFqDVIv
 1jSmDj/j3kag85lw9NT1pcWjpVL4STsNrvVp4wCJoQppQFPUW95NUjUnsK470RPQV9UMNBKpftT
 3UB2NAWBImoFnHRz5Ag==
X-Authority-Analysis: v=2.4 cv=O4IJeh9W c=1 sm=1 tr=0 ts=69f5ca48 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wyrcdbDR-kVNaWTReRsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: w523vBCniMxVyaMU4sHe-Aq3NZugMgZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-02_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605020098
X-Rspamd-Queue-Id: 931964B19C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105573-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Modify interrupt handling for EUSB2 Phy targets. Enable DP Interrupt
when an Low speed device is connnected and enable DM interrupt when
a High Speed/ Full Speed device is connected.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Tested remote wakeupon Glymur device by button press from a headset
connected to both Type-C and Type-A ports.

 drivers/usb/dwc3/dwc3-qcom.c | 63 ++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..5956821eab45 100644
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
@@ -272,15 +277,21 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
 	disable_irq_nosync(irq);
 }
 
-static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int i)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[i];
+
 	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
+					     port->dp_hs_phy_irq :
+					     port->dm_hs_phy_irq);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
+		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
+					     port->dm_hs_phy_irq :
+					     port->dp_hs_phy_irq);
 	} else {
 		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
 		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
@@ -289,8 +300,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
 	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
 }
 
-static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
+static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int i)
 {
+	struct dwc3_qcom_port *port = &qcom->ports[i];
+
 	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
 
 	/*
@@ -303,11 +316,19 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
 	 */
 
 	if (port->usb2_speed == USB_SPEED_LOW) {
-		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
+					    port->dp_hs_phy_irq :
+					    port->dm_hs_phy_irq,
+					    qcom->uses_eusb2_phy ?
+					    IRQ_TYPE_EDGE_RISING :
 					    IRQ_TYPE_EDGE_FALLING);
 	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
 			(port->usb2_speed == USB_SPEED_FULL)) {
-		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
+		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
+					    port->dm_hs_phy_irq :
+					    port->dp_hs_phy_irq,
+					    qcom->uses_eusb2_phy ?
+					    IRQ_TYPE_EDGE_RISING :
 					    IRQ_TYPE_EDGE_FALLING);
 	} else {
 		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
@@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_disable_port_interrupts(qcom, i);
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
@@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 	int i;
 
 	for (i = 0; i < qcom->num_ports; i++)
-		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+		dwc3_qcom_enable_port_interrupts(qcom, i);
 }
 
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
@@ -609,6 +630,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
+	const struct dwc3_qcom_platform_data *pdata;
 	struct dwc3_probe_data	probe_data = {};
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
@@ -624,6 +646,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	pdata = device_get_match_data(dev);
+	if (pdata)
+		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -838,8 +864,27 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
 };
 
+static const struct dwc3_qcom_platform_data dwc3_qcom_pdata = {
+	.uses_eusb2_phy = false,
+};
+
+static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {
+	.uses_eusb2_phy = true,
+};
+
 static const struct of_device_id dwc3_qcom_of_match[] = {
-	{ .compatible = "qcom,snps-dwc3" },
+	{
+		.compatible = "qcom,snps-dwc3",
+		.data = &dwc3_qcom_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
+	{
+		.compatible = "qcom,glymur-dwc3-mp",
+		.data = &dwc3_qcom_glymur_pdata,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
-- 
2.34.1


