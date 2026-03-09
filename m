Return-Path: <linux-arm-msm+bounces-96357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG4WCU4vr2mWPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7967D240E87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 21:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B948D310D6C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 20:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1603641C31A;
	Mon,  9 Mar 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1bIl3/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gljdgckk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637B841B35D
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 20:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088429; cv=none; b=AwqTamCl6W8XJ6lQFZgRMnPVYHg11lsUVYCO/CEhVSMMzCxga2+HNbpdgHJxZYWX7/7hxFFD2qRy8gIR8C9QJfU9JN9BiQd+2rU14IIa9iE/nqF6pOYBMvQm5QHvMOY/s1m4KPdtc+xWHa4gnXXE3t5NdTs5fX7IxSCUPFo/GUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088429; c=relaxed/simple;
	bh=1hJpGqDTRFoURWmmoaEOGT/N7Gx5d5iN/Mc6404ctVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BrvZ1KJdeaGjivauQSQyXynbkQiW+BPUW43NNwA324wSss/eJNGzjJKIt87AAQNmCouFj4tZCaSsD9Tnp2Mmr212QkDszaGKR6DWFuE2tGHOHDK7gwYDVnn5MAeQKJrkNI6ihM63zUvDN08lTCYYu5pUly5NBXnXaPa4I8DVD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1bIl3/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gljdgckk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629JFteW2872799
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 20:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mBBMFcAvNte
	4hAjDhm0HFRJcXN1506iQWGvqP070rO0=; b=E1bIl3/QQGzsX6K9vtGnsmBSPQD
	SjivA4NY43warjed/UycU71X4M49FkErpiZI6T0MK0Qj7KTdAfM14zVvP62oK1+A
	PO4jNjTKmPbX0//s+YgfsL3+H4H5rL6aaUFx4YGv5IlMBq2gBVLF7wtYl84c38iE
	too2SybTLm0+oV8xCq3Sa1aG3f7np+S84zYLRJAQYWmfhzmIU3BJwetyrPb3eC7B
	DBOfng0v3upR9mgMQqltjwccsWnC4xGiQyj0hYNYjI2JZfrD7eNtY7spLGQ5IXGH
	8HmeEOA0N/gPOyg2AtYAiEtUM9bqJVpVQnX8GyQv/yrbqSm3F3EfLsUIkbw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477g7mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:33:45 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d7455d63e4so12003987a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088425; x=1773693225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBBMFcAvNte4hAjDhm0HFRJcXN1506iQWGvqP070rO0=;
        b=GljdgckkLU41tV4DcuM0rrw3sAiYGOdNwMLa4vGqd7vhxmZlK6qdVz+ToEIZmDCmqh
         EVIKG0v4lAMjmbQ7xPqWxURKSbjMlifwbXFG6+PML3fTetY5xOm4SJf8cI4BrlPgBfQ0
         s/MKPQnH2vnnXh7eCh4oSXf9ps96nney+pX4vWMQjDkpKG0D7bFGik8+3v6wg/c3uXqV
         4fRhrFbTTjAbiuUBYALBC3+t083CQ3HIWXOfd76q+m/HGRAXAZCZa6t5/ZY+BIICSqip
         Q9YhvMqKG8loYIZNXn7mzzXe/gS6qAUcUo39RvcRRNRr7BhCqyMTJz415eHR+ovbZIkz
         7sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088425; x=1773693225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mBBMFcAvNte4hAjDhm0HFRJcXN1506iQWGvqP070rO0=;
        b=OPBUuYd9GQzqnk/DDkTDjWCtFyMn1GWCVvghNy6lX0hZM5GeUgrR1VxBYlUKRZ9rR/
         NpjYWHbl3ZQHgjqQRtWNsnB3BfEs4WxT63tNK7RxhTmJJhVWoJFI+qv4PKZWZPfUzkYG
         lbuK8rAsirHbgNvg2D8zFdfnmp0jXPtu2wsmb5Qh79gy9lt3TrsYKgvKQSK8HLZVsodb
         FmM1XpUEzgUd7hnYJEEUdB+ghD8nF5+Qj1VzxfONTVqvm5aAzfeExnMjfOH22rCYtyb6
         BGrhW3woRfzjvN2TRwEGZC5qlHTxT8FQlO7MKiqgJ9vAybrN6t1z1DCxslQ9ugOEWieY
         euNQ==
X-Gm-Message-State: AOJu0Yw3NVI8LL6dLLNn0b6Qfxn1Pq/Cz4lmE0S/KPT+TU0glf2molad
	KpLvrQrXVs4Ocd1Orsn6+5RMsvi/+C+TLQcySqegcbJFtcpWGUMGCYHKSNQhIExSDgWvqMWK4+/
	GqmWsngSofIzuSpALpYJHBzYm5sKA8QcXPTYhYOaIlIbP8NCYO5YCm4duizkQaIiaJ8cE
X-Gm-Gg: ATEYQzx/dpK+YbEJzheH8EXB5c7YYips3y/qNGgrSDrhaHwUrZVHR8sOAANvjbKeK9y
	ovIB0o0pJNCCEv13GE/Q5doDEvffeI8ZLhcaBveI6Y1uQMLho4bcmCSEOoBYqwfk0jGTc+NQJwt
	MQBhlmrArRY1AKOkQ9XJdJOF6FtefxOjEs0f6rPTfujha4CnYOY0cAdY1ZLE2I6McGH7ep0WEEg
	kXISfnz5e2GCrra2xvhedRDTJ/YV89+HfCQOwMc/7wxapZ+hyB8e4aPDsleR5/vCE7d4sGCCsFe
	temMtm2PfffMpQQ2ojK/mB6Ek9d/L9Q7YOVmtqwSyoaYugVqRL/CnA64rWOyyBKJcRwyhotED2D
	fIVcXZ7yXiDrnMYVxK01wRgbTuiNzpE/ROBxTmDDRV/sHGaYun1fdg8qZNXwfZVRzKsUpNk6f+w
	4=
X-Received: by 2002:a05:6830:610d:b0:7c7:b4e:edb4 with SMTP id 46e09a7af769-7d726f1520dmr8306674a34.8.1773088424725;
        Mon, 09 Mar 2026 13:33:44 -0700 (PDT)
X-Received: by 2002:a05:6830:610d:b0:7c7:b4e:edb4 with SMTP id 46e09a7af769-7d726f1520dmr8306648a34.8.1773088424304;
        Mon, 09 Mar 2026 13:33:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 04/10] usb: misc: qcom_eud: add per-port role switch support
Date: Mon,  9 Mar 2026 13:33:31 -0700
Message-Id: <20260309203337.803986-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfXwwtNU1yfQ915
 nGPcFJdXfKib9uB9OZqlVHzBt+bx9FZQ5LUGaBYe5arFalq02Uk6yvGA9p8nQYAcKK0KmN2ElEh
 v/xgyWFU4aK47B+2wQCU7DJMtqW0zUwl6iBr53+YDPGTvyXH/gh2piOTpK+vKvk51O+VbVgI08U
 ZykKZMDXFBG6029Rfzq4lqPaWMHdJeS0Md3MQe3QORLQdkBqJGBJ1FELuj/fSFZD6D9fDooPuw4
 urzPxRYeaGgTjg/7jFcHBOQMVh679h8gcZg4dxo8UmxFS6qt+rb42sWXxXeq+N8FJopzgVr4Ab6
 VWngpas4Ytz7aRd7Qq2gWfs5ErtVJCukCW+07FPNvJiwo7E4QFI0On0rvFyLdVwr4X/+BSsXeTQ
 B01NpB04+9Sb8vpjqrp0LzDAWZV39gd/MfEeGUCGqzSVSXIU/cBLBSshvl6kn6m4fpfoZ5B1U/o
 yVaemLX7DI1zAbqKrSQ==
X-Proofpoint-GUID: hLhfQuokrcpjG6Ay6vNBf1qrhHNOe9iK
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69af2ea9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uchPniyQPeoRSj6hJMsA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: hLhfQuokrcpjG6Ay6vNBf1qrhHNOe9iK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 7967D240E87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96357-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The EUD hardware can support multiple High-Speed USB ports, each
connected to different USB controllers. The current implementation
uses a single chip-level role switch, which cannot properly handle
multi-port configurations where each USB port can operate in
different role.

Restructure the driver to support per-port role switches.
Additionally, remove the unnecessary role switch call from
enable_eud() as EUD need not modify the USB role upon enabling.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b042e01c6ca2..1936b45791d2 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -38,7 +38,7 @@
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
+	struct usb_role_switch		*role_sw[EUD_MAX_PORTS];
 	struct phy			*phy[EUD_MAX_PORTS];
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
@@ -112,7 +112,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -272,9 +272,9 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	int ret;
 
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(chip->role_sw[chip->port_idx], USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -289,6 +289,7 @@ static int eud_parse_dt_port(struct eud_chip *chip, u8 port_id)
 {
 	struct device_node *controller_node;
 	struct phy *phy;
+	struct usb_role_switch *role_sw;
 
 	/*
 	 * Multiply port_id by 2 to get controller port number:
@@ -309,16 +310,31 @@ static int eud_parse_dt_port(struct eud_chip *chip, u8 port_id)
 	}
 	chip->phy[port_id] = phy;
 
+	/* Only fetch role switch if usb-role-switch property exists */
+	if (!of_property_read_bool(controller_node, "usb-role-switch")) {
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	role_sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
 	of_node_put(controller_node);
 
+	if (IS_ERR(role_sw))
+		return dev_err_probe(chip->dev, PTR_ERR(role_sw),
+				     "failed to get role switch for port %u\n", port_id);
+
+	chip->role_sw[port_id] = role_sw;
+
 	return 0;
 }
 
 static void eud_role_switch_release(void *data)
 {
 	struct eud_chip *chip = data;
+	int i;
 
-	usb_role_switch_put(chip->role_sw);
+	for (i = 0; i < EUD_MAX_PORTS; i++)
+		usb_role_switch_put(chip->role_sw[i]);
 }
 
 static int eud_probe(struct platform_device *pdev)
@@ -344,11 +360,6 @@ static int eud_probe(struct platform_device *pdev)
 	/* Secondary port is optional */
 	eud_parse_dt_port(chip, 1);
 
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

