Return-Path: <linux-arm-msm+bounces-90620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOhnFEj7d2nlmwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9028E432
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 00:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 381D5301113C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 23:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D618313E34;
	Mon, 26 Jan 2026 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLeeNpmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQ7caOR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9F93126C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470720; cv=none; b=TXJT60wZsk7Q3I05T3XdzFQucYb4j/+afhHinUFYJMwX2qxEWVHIn0OiY59AKmyNTjkAgPEZhYFkINTYL0Pd47+uzweq70HE8yg6CQYYrAdz77i2hr7EGg+O3qCK9HUrCmsh6zs8jCycINRkM2Sp59N7D86pQmkaCuOBSow7IV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470720; c=relaxed/simple;
	bh=8QuxfXdYRJcE3fyNR6NyT4XaseLCItGHgJZH0P+Yloc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UnGZAyzGZO8hG3zODizzpJLhQWmK7OGF0JjOBYQOWRPCW8FpfGfCSqetq6eWUc4al87yiaAXFSL890pfFPg2U8lFreo0pEyDqpOtcKPha87aPN1YCG0SZM+F7Pe0E+WpH2wH+42DqujJRIzAY5jKbKborOmLgIMKToj8CdHJMmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLeeNpmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQ7caOR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QKgJ9N3399299
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VKaYciJerw3
	mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=; b=pLeeNpmojZkTBxn5u7o150Eu3z6
	4cxiNJIl7nDThgv6WeYvyZ56HyNhHb5vhn4FnTh1z1HA80y13PSPg0JM3OCWd0Km
	QzwaHjU3l5GH8C2qNqCBGAS+M+wmJAQuV+Z20BrM8WvmrIqZN6ji28hZHIe2A973
	oRzbulbsqb9Im8aRDzD7DUYFf7q29Yks1nJeg/XLBu4MCGuzn2DTjNDxpO7nDjgB
	o5jVMHSQTUXgZ1V+sJkHntznhijIfKAnGi67QKSuGLm77qz/TLZSxHSpqSaA35CN
	DHJKTqfarnTrbx8RI9crgVTHrfl5MO0QynwADyl/XgMVhRjYb6dXsaoW5bA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9gqx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:38:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b74766fae7so3667886eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 15:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769470716; x=1770075516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=ZQ7caOR+g5CBQPFASca3Qbku61HvR0bnS0hqqT3MbpxbReTrl+gAH9nREveaOjyqg6
         n5fyN+i9hTSGi0ata4F11hmdTqUZ+fvLFzU14ju0y9Sqo+1T/QoUSlzXJgbB1mhsxbMI
         sswtdvsqKGk/2AyOVXoVCiZo71jQ/u5dh5TTaz2ZUWDKvX8kVL8wmMwpr2BIjQ8IGVcl
         OkMpuVAOY9hvg7rjcT0ckUGt2//prftYmgOKa/Ek2ILTEPR7o8iki7lthlxFKR/hqEF2
         oPXIxga3RiQ1HubVlkNaugN4fZ7UPxWXMPsMnGKDD8hQcRJMQ8Zx06xUkU3SASJsDJ1z
         utDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769470716; x=1770075516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKaYciJerw3mJBDnc7jGWgSPFPx7Co7DTR1b7g2zoXc=;
        b=Xn9Nps11i8WGrAcZEc5r0pLpsPuRjzLuSTSLge+gtMWjHxcmZIwzI2FneRG7qFtXIw
         rs3OX3fy/ORNh0EjUUPady0l8rbUqi2kx0QVzMOkDbTdVZt6FPMicNC61sdfEHb2NR3t
         jO3v67HWDjUcEW/IHYksjQA+30K79kdZBHJZBWzpp8IDoeVXtzz3SPQJGdV57IaTVU//
         5nF8aXYpbM5Iox5TwiVmGlr9xjj6cKhS8TJV9NHPpkZblKXJiI1m2Zj4LFMHo6dvMuS3
         BZMeQfWakJpEQjgj162qez7SWnQs7WatgHNzD7Fnt2YYLVvqVde0YYsime2d8LtQNoTF
         VO7g==
X-Gm-Message-State: AOJu0Yyg5smh/Ntw1HyamW82ux8XnwJ4U3oR3mXXqzgv4dShgcQdQOPn
	ZX7nAySPiufN+M7au2kHMR2LoDUewmz67xEO24hdL0ee+MgHT9+5kLzH/PnryldlZ87ZQFM+NBr
	6p7JNMcbKpVplSOFqMiTmjOBKwG+QZxmqBT1HtqzeJ+ivr6X7r2D0NYuGgzmEzR9F3Qg7IfKlBo
	P4
X-Gm-Gg: AZuq6aJGM5SIQJUWMcoMspd0Ih+wSugGDRr7LwwXrdNZNqJ5iQN8AKaYVNk3U9rZNZG
	BcTdev6BiJdEACTqimuHFBA45ElvQesh4HRuZ9ysiyh7o630iKFCFqtRIB0DHyyPb6hPyZPKIEA
	bbo5gLq0kB3qE1RlL6PnoH262PBAwWY59M2F9WqqCkc3hzxNrQHkvhIqbVvYXGxYdQeGwPOTWHC
	Yi4dqaVQa6X+qFp8Occ4qCvGZEHOT6aQeLvyDQLTh1nBEwmoubN7yl3DL9KbHzLgSpQP0aLJZud
	ULCUhPAkEIOGhFaaA1tpDILH5GUs6DhX3On/IakjWtki8FnsVae7i5jIpNBsZtcfSkYMYsEExAa
	j6O0q+nof0AjkLOTBT0lRgB+A3XiBC7WFzOSXO3Ek84nv11A0WQNz2hkZaQjvlhE=
X-Received: by 2002:a05:7300:cb15:b0:2ae:59d3:46d3 with SMTP id 5a478bee46e88-2b7644f9a2amr3597633eec.25.1769470716057;
        Mon, 26 Jan 2026 15:38:36 -0800 (PST)
X-Received: by 2002:a05:7300:cb15:b0:2ae:59d3:46d3 with SMTP id 5a478bee46e88-2b7644f9a2amr3597615eec.25.1769470715403;
        Mon, 26 Jan 2026 15:38:35 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm19948967c88.4.2026.01.26.15.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:38:34 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Mon, 26 Jan 2026 15:38:25 -0800
Message-Id: <20260126233830.2193816-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6977fafd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_OGk7KolV25BrENr9Q4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 4SelAFCgTlZchHAaUwvFqLlOZMRkd3KA
X-Proofpoint-ORIG-GUID: 4SelAFCgTlZchHAaUwvFqLlOZMRkd3KA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMiBTYWx0ZWRfX/QlUAbadiqG6
 Ol1nhSEIv4XESZw+ItvxETlAiOikjAB2QjNl9J2EXXSEdWX0xhcxS0SXHzptO6LsB3piI1biYur
 3owEA3dC4c5U+20VDq2kGeVnnPy2DyADRP49dtcaVY+ihGuo6L1+DuWFbO14GtQqF4nVUFNkBOU
 Z+YIpggooB1mJQCCpL6ni0DtrX+E4Can08BPmx3eost3FdQLTdRJq+PpIVmJOM1IwUqpga4xubl
 52GTyiR+nVnzxLOT8G9Frlm52mhl9p5iGtunZatgzxLC1QpoFSVaZTHv7XU99TuZ6ViQcca3VqY
 tG7Kq1cw3zlYuaGxEiz0QlB08Rmt1GpdkRese04sg0Y6GTOJALxPU7Zdznbd5sWcwGs5XKRLbPv
 LlreJUa54aIycmqlznQOVvSsbRISDqlq46pO2D5VxM+acRb+ntCocgxCJ8wMllmj5VXls41SbE6
 SwaT1kFHBtHXrbgYr5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90620-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,role_sw_desc.name:url,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B9028E432
X-Rspamd-Action: no action

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 80 ++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 5cebb64f4a67..a58022f50484 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -38,12 +38,15 @@
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -129,7 +132,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -287,15 +290,21 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+	if (!path || !path->controller_sw)
+		goto clear_irq;
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
+clear_irq:
 	/* set and clear vbus_int_clr[0] to clear interrupt */
 	writel(BIT(0), chip->base + EUD_REG_VBUS_INT_CLR);
 	writel(0, chip->base + EUD_REG_VBUS_INT_CLR);
@@ -303,15 +312,45 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "Failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
+
+	return 0;
+}
+
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
+	int i;
 
-	usb_role_switch_put(chip->role_sw);
+	for (i = 0; i < EUD_MAX_PORTS; i++) {
+		struct eud_path *path = chip->paths[i];
+
+		if (!path)
+			continue;
+
+		if (path->eud_sw)
+			usb_role_switch_unregister(path->eud_sw);
+		if (path->controller_sw)
+			usb_role_switch_put(path->controller_sw);
+	}
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {};
 	struct eud_path *path;
 	u32 path_num;
 	int ret;
@@ -342,6 +381,32 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 
 	chip->paths[path_num] = path;
 
+	path->curr_role = USB_ROLE_NONE;
+
+	if (!of_property_read_bool(np, "usb-role-switch"))
+		return 0;
+
+	/* Fetch the USB controller's role switch */
+	path->controller_sw = fwnode_usb_role_switch_get(of_fwnode_handle(np));
+	if (IS_ERR(path->controller_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(path->controller_sw),
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+
+	/* Create a role switch */
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		dev_err(chip->dev, "Failed to register EUD role switch for path %d: %ld\n",
+			path_num, PTR_ERR(path->eud_sw));
+		return PTR_ERR(path->eud_sw);
+	}
+
 	return 0;
 }
 
@@ -359,11 +424,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
 	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
 	if (ret)
 		return ret;
-- 
2.34.1


