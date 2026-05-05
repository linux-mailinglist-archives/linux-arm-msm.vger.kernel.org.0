Return-Path: <linux-arm-msm+bounces-106011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFINBD9I+mmJMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 21:42:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F9F4D332E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 21:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BE2C3012E9A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 19:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9249218A;
	Tue,  5 May 2026 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDz1Iv01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FokDRdlw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FE48BD2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778010172; cv=none; b=anOcRuNRJ9eHrKIlXUlYEzmMjmwxb6Nu/YhFKVVMnzONSCqzMagwAzwX9SNcGXEsZjryUQ/3xoKsJUE4D1Jkt49d6Vkn5REhjKk/jHeKNLBQrHiLFyyQdUyIBBZcEi2DpzgjmDdYtgsxqwBXFvX5HBvxhFHald17Il/8ROirsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778010172; c=relaxed/simple;
	bh=40UCdKruTgVziyXrlrbzoq6cNg08zscmFiF2fNOARAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b3+qNMyjSWEuJ/HUeNldDht8DG0EmmsrriXA45IaQ2AdJ3kR28aRHJUXaOUXdiT45SRDMRfBm8VT2Cr7L9fjjZenQZS9nUzMVMmBL+peKWuwnISGf6GUhbAgOq0BffzM+ENxBBB1zNyEfTcQndQdaFmGOw1n3RQkNmlMaFIGl88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDz1Iv01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FokDRdlw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645HIp9i3091479
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 19:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ciMtM2pPwbAnGSi51q8XNm5t28UySKCH8+3
	9SEw8mQM=; b=eDz1Iv01xP7+PUD7IDfh5TBRpR5F2gPAZ6OwaCm5q8EXM9X4TVa
	GQDTydT7kaqgrmsFRdsDft2qIoOuxtQlHLXhKrFCnu1QogP6veJMQWIOVikwOoKF
	okGsiO+JH6LMQAbhhRrog87Ys3r03chWFKPrFfSvYF0JAY5jlgySGU1BahIZJev1
	QEQ/LlGmV0rcnTU2ytzizI7s1nsZcyboklCoLNSGRIgvV/7LyGshKWTX6WI/iijQ
	iyMTkULjAb2xKy7DcebwwJxmm0yDhamdypjexhCUSC4kuk8KSggQ79VT6lWVsu7C
	BUnH0RowOP8sSPT26fzMHZJKc+irGP4DjzQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyfct20s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 19:42:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c79943d2fbfso1671977a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778010170; x=1778614970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciMtM2pPwbAnGSi51q8XNm5t28UySKCH8+39SEw8mQM=;
        b=FokDRdlwoQ2DpaRWL7Z7fFdsRWXWntXxRoK/uB/iNQG8uz2OPSbhKyeH1eCrHJohV8
         ypWZkkFDOGA4JnKkr/bpYw+7QESEbVrs5qQN0sm1RqXR13xBWCKz9AS+y51AbeYXDDlw
         LbkC9OoHjWLF/zv3YmAg7Tbd6MkF2UHHhP19y2GcQV0I7Ub2RyIERpyslk92fyEG39uB
         RDlXQ1TLSCWCZDsn+N+ooGae4VEl+44Prqtmfar6X2zzu4QMjjZur3r1Wtj4A26D0Rqu
         PmaKgAoUtyF7myCxxyN/iKnCrWv/woFTukI9CKIfjUjbTEWmKmJZTxDDjlLkO1Zs1rm0
         4rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778010170; x=1778614970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciMtM2pPwbAnGSi51q8XNm5t28UySKCH8+39SEw8mQM=;
        b=Gnkav89eF7OCmTKn6prad3jftSrIMjMVPVTYVH5hHHsIPZKZCZYoyaMoiY88Ia0B1I
         1H08vHz+5hfGSkjffPf94fuDUsdotjHEUAENb4DqWxWatPqHzJ6WpeLvBQyibaUwdatR
         iKxKAr8sm/ITXHBnOkIE2DzlLinD1ahlQIy4FBz8M+xM77ZcCJ8eV3IsqucJ7FjJ1uiu
         NpNV19Iz15Vc3KVsMzwxqViEF2r9EXV5x9y01xs665HN6pnS+NpxWTf0GDEPYGJouyp4
         /BQKrHJJEKBClliaXWN8yfoXr0vMd6Y08fyBer3q0821wZwmpGB1uuH+f2OlwphKxrSo
         vb/g==
X-Gm-Message-State: AOJu0Yw2oatrv5jX89NOPBZogMcR7ndzA58cxea7Ar/r6BC1V7Hr84jI
	UtLGzk86lzi4xIEypi8LXXUzChcJQQFmWrOy5hj6v4v4TSSg1dId45wzYcfW/a64YE++RIjP8YL
	tCQVnrzmxwJukuuGMgE0Em/o6eptfFDJvSNZFH774vecGhlKrOm1zrvsugbPTOgZXrcwi
X-Gm-Gg: AeBDieu6bs7RebuuHo3yV8b88r0AUHW8qmYSZwjhQeh6n83ZNEq7AS2HxgDOSDmcsqE
	G/MtuM/qZPiGAhAvo0Kin+Ih+4wXWhTFgTYt4a/i7XPH7nLhEheITCEAjnN/KqGW8o2a1bLH4vy
	Z9stFdR5+KShkR893FPM79G6ncocAClVr5ltlWq9gewuKfbFJVJ7S47lKkElxjQRfyObekA8hPl
	kdsdVf2EUzrTZuQx+uYv+lHtmnJ3ZKmVtxZX1pN6x6Pq9dFOz0WelMW1kIfQcH1i2AR5r1Fx07y
	2tXAh2/HALWoMeuEH5Xr1ZYC326NG5xo/BAqxGZklDuJF7UMrs48ycLwKRD/8MKpMZPhnO10yt/
	urshv2yuRTvLXX1EGvHI1kTmct50wON9KzjnJTX+x1na9Pj/bbH8xdZzCFUiW8iNnapoIu1ogL+
	tf9ZIqG3FNoc/pbV62eil+cbxWdQ==
X-Received: by 2002:a05:6a20:7289:b0:3a0:cd5:82a6 with SMTP id adf61e73a8af0-3aa5ac8dcf2mr270681637.46.1778010169802;
        Tue, 05 May 2026 12:42:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:7289:b0:3a0:cd5:82a6 with SMTP id adf61e73a8af0-3aa5ac8dcf2mr270646637.46.1778010169179;
        Tue, 05 May 2026 12:42:49 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242bc1e7dsm23294a12.30.2026.05.05.12.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:42:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets
Date: Wed,  6 May 2026 01:12:42 +0530
Message-Id: <20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ulnzY5Hv0GMu0bhFpw3sjzjKYXgJ3xZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE5MSBTYWx0ZWRfX4uCrtu81n7bk
 /vPV/5LS0NFS7gsOvJHVDlhgt7Fw1+FUSiTMCOuEfOZxUZGeCrSSGygmi2IdJXHMKytfNY7i2FJ
 GpeNJsnJHP4ka5c6FvvDTK3Rojd4wW+2aO/8UONRkVNTzGDFF4Pdvs2qeM/31oxey60aD6X3Npa
 TLl137TvgcYxmlPHkv0o462FBCTe6gLiWizH+JeYTRsBtrUB4I8ACfPOD78ec0p/Ptp7Y/MSbAY
 98qzgSnbeq88p3+rBqdrAkc7Lp8ODqXP39JBCKOtBSTK+u3SijOa47T3iXeJjWj+BBSBnnErMIh
 jNwdWbXJ1K44iWgcLr8uEkZ3THhMdU4jjJ3MMyYtrc1L3YUudrJs3KRgI2pRbxG3i4zQEMrjo+7
 XwSjSTatvMDz3EW6jqVkGjUmPh8PqfADXZfcFZAji5QXYDMiSGbkQ/SZ+b+l57clQ75BpJPyHsf
 MSpfn3IzHaGf4mLUDFA==
X-Proofpoint-ORIG-GUID: ulnzY5Hv0GMu0bhFpw3sjzjKYXgJ3xZ2
X-Authority-Analysis: v=2.4 cv=NtXhtcdJ c=1 sm=1 tr=0 ts=69fa483a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n47XyvxCgL2-tsnZnB4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050191
X-Rspamd-Queue-Id: 60F9F4D332E
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
	TAGGED_FROM(0.00)[bounces-106011-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

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
Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

This patch was tested on Glymur.

 drivers/usb/dwc3/dwc3-qcom.c | 99 ++++++++++++++++++++++++++++++++----
 1 file changed, 90 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..4fc0017c697c 100644
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
@@ -838,8 +864,63 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
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


