Return-Path: <linux-arm-msm+bounces-92870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hv1CbIRkmm/qAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:34:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C094C13F69C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 19:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 042693039826
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34371E1A17;
	Sun, 15 Feb 2026 18:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3FD+9wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T3JOFffo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B3405F7
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771180428; cv=none; b=DpCB4nEwz9JK6U5JZ3c8w3AMl/ZhrO9XiY+FTN9lBflQaA3tpWUVP22m5ZRVXrQYazPBoFvJaqLteLGFHHymXV3tBjYNLCQNEQTgTqsTf2gKSl7KFhvFPkHAXX+4ekdOFSB64vTItL3WOXAV7+cxzMuQLmjdU8dBYnLUxDZwSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771180428; c=relaxed/simple;
	bh=LX/ssufv7H4B1pIaqUkz464JtS0NxeBXZnCRUc/ndPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GD6sOoOPyqZ68iGm6TsAuQ15Ht458JvAivvi4pLwGyXwSNP5c+pynTkItP2pSPi/4BwRc9oVTiOdgSM7S2PKSHpQBUFplSX8n3QR5oQE8gACMxgDtJB3qAPtkk3KVeJJfHgsQ0ix3qdqhW5C45EJzHB0O3NRrVDN1bM5uM9jCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3FD+9wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T3JOFffo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FIFrZg2550111
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=; b=B3FD+9whgRvRX30d
	K3PmaMH3RBlH2QHDLjsfGGvW5UNJSUDsNTeYTQ1pUy0zsDrqzkYIM6Jxyy3s64A0
	U5UesJShdiUp+9F/tGbmEln0Lxrf0FVj9EAQBdl+Avc2h80XEGYgyHt1SVWDcg8H
	jRfCZTXAotCJb3SbPFCIMmN4838C4U/cLAzWtzb/ft+Ms+lRCq3nWM/ZKsgMd8xL
	iN6zBo3jTCgr4HTA3O4RiFFU70pgrYndWqZsz+Xdw6cEgHXQ71N/dPtwiU33rxc2
	Hoyr0XJxwPSomxlj3PI3mPWM8CsorAT0/eI0vgYbcQ1f7yqGji333pCfBbAmchlk
	Cc7ygw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sjpkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 18:33:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6de1ee12a3so1905980a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 10:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771180425; x=1771785225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=;
        b=T3JOFffohOnjfr5wUGxuGCFCsn7cp1Davph9QVPK9ws6bqsdpKblYTuZqucK/3QitA
         1KReWbgkH6tTZS/AyZWqixkXstxsykN6Upc9zUKJ/uPOYVeiQdwUQupjWEw0m+H01OVP
         AG24w99OULCp8ReLocQ6FeZFsPHukArCOW2J4sggQNf5hzl/nhbLuUfhk7GJgTtxt6g6
         k/g4BWWZ9xinwmC4RgZvGfifMPuYMJCF66BY8qAOWs0g0RHwYiUubDYqKdrc5ZXCRQqc
         oVS44033bum0d6R0rvceY14c0NlHiklca+Z9soV3KkS9j4t6DbQvYlmrl8jf4BdW2G/v
         Vs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771180425; x=1771785225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKmw/VHz5oPlDFwnvc5xcd+xBL/HdYhzMal6dUWmokE=;
        b=lxvy3ltsJoqJloF+x+aIrrfD8PJgTDNLOUYkPrT5J9TJQp3yoAkmvNRi9INw/ZvaSK
         t5Fyly19aO4vpIKICVAXCGMClUbDP/Dq3CThkB21dZjXiH/p3nE5NWPJJxF56CpJIGv5
         o99pGDCyKWm/Z+b0TKkyHMeyjXhM4xFtGN7JyIrf+HwrL/OHk9Qo200Y8JSkeeDzfpLW
         XlPf8wdKmXLauqXyfBtls/pKAIDcYaCuMuq7U5ksXLsddnp/6jAwzIer0+7XQOksxztE
         RJ36loSBGFwvcF9OHuNnzr9fQUMqPuwd081b4RYWq4k8En4c4P9im/UX40Vt/qheilxT
         dUOw==
X-Forwarded-Encrypted: i=1; AJvYcCXYnUfNuN4fIAWktb/8sA3LXlaC04NXAelc7alTFAzxBatsi8jF04S8zBR4kY+8hgi06EGZDvB1O5t/2TJk@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/KO7ry+mYxhnLZKPSnHC2xz0xZ32oWVhufGwZDOho0ONrZQY
	zVx5RpbOve2iij5TwyehPmQPZrfS+L/EE4m+s33SQ465q7ieGWiXLSNpx/6OUy4X2hlT5m/AvN6
	TdpKsHYj7hmWm9eqrBm682DWr/e5JrgGWZfCviUp16kv6HnlRxOSX+wHNfMzGxp6JJt5T
X-Gm-Gg: AZuq6aJaO3hlJGMmz/m7Vfo5okLKbtrXa3hklBvqYb+nhrCyCNYxP+ORO4zA28YorEZ
	96vMSGfZUjrTL1sQl5lMH4OmCvzWkvRlKNlu59wO6PlcQIVnnc76FbkvVNyi4Z7mctDEysSGvlo
	fjcIDGia5mI4er9Rx5mBcZU7LsLULoVVlRMGntG+NG1P0J5Kr/Dso2AMztYX9y/qabM98FeDj8Q
	fdWf7Rd5otzLiy78c+diZDOF2ngiUokWq9tstK2dLXJGoMyxuaUz3cn+EL4Uw/MLt943KnT4nMe
	NMYcK+Xc8WMPdM9s+Nv+QPIlr4/QXS2Qt8Cmc7orYbkioktxZCaaPgpdJwAiwDxJN5uEkvAX0go
	VhaC3vmV2g5IwBdhlk+SQBLAjOrUkKNjH6tjWlXkiyu7lqEiq3sG3O48=
X-Received: by 2002:a05:6a00:80e:b0:81c:5694:c544 with SMTP id d2e1a72fcca58-824c961b678mr7256715b3a.56.1771180424538;
        Sun, 15 Feb 2026 10:33:44 -0800 (PST)
X-Received: by 2002:a05:6a00:80e:b0:81c:5694:c544 with SMTP id d2e1a72fcca58-824c961b678mr7256697b3a.56.1771180424039;
        Sun, 15 Feb 2026 10:33:44 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2afeesm9560875b3a.2.2026.02.15.10.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 10:33:43 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [RFC PATCH 1/2] usb: typec: hd3ss3220: Add wakeup support from system suspend
Date: Mon, 16 Feb 2026 00:03:24 +0530
Message-Id: <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
References: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDE1NSBTYWx0ZWRfX/sSqbuNJzoyi
 Ii9AwbMu0g7fTUU7Kqe+GADQp4lzAxL1Y5h1kEnxSgzh9HSEa16j86QtDFIPkkXIyWpoFWpFJpW
 7xXV68lS2wtfEXQZ0nFHyp60VXouG8rOwAT+vaNEylADFaWY7CPCn9WiBwdUvrKilOiAwx798Yu
 XjCJ2sRbijlSfDXswTgMEyqa6ABxbTcoEhB4FCqQvjsXsupd2Ju0x0HAseQ1LHUiSQoXy6Oie0q
 3dWAEqXX6j7kvFCGs6mg0OVf1mGstYfEFAuhSgGxxtQPLrwmfUt51CzG0hkNkgjNfiVtHsI016L
 M747Vwz82o9b33eFzli23/ISa+BJRmLCsfAR7kIWpWCB8Qwt/3x58SUG4lmlaLgIelUS8GYXMSv
 2A6IvLzHU/hSQW2r/X6hW4ZzIZ1act+nMlExHtwZmjx+K/SI4+Y74mrOG6Tq38TCYk4g19ep1QE
 DlAeIHvrQgbOTd7ugqg==
X-Proofpoint-GUID: fS7nhFDMb-wP7mYkQ9shR6iDp9kVfwh7
X-Proofpoint-ORIG-GUID: fS7nhFDMb-wP7mYkQ9shR6iDp9kVfwh7
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69921189 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=D50HEyLJ8L71BYmXUZ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_06,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150155
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92870-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C094C13F69C
X-Rspamd-Action: no action

The HD3SS3220's interrupt is disabled during system suspend, so a USB‑C
cable connect/attach event cannot wake the system. This prevents resume
from low‑power modes when the port controller is expected to act as a
wakeup source.

Add wakeup support by:

- Initialize the device as wakeup‑capable.
- Enable the HD3SS3220 IRQ as a wakeup interrupt.
- Add suspend/resume callbacks to enable or disable the IRQ for wakeup
depending on the device's wakeup configuration.

With this, USB‑C cable insertion correctly wakes the system from suspend.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 drivers/usb/typec/hd3ss3220.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 3e39b800e6b5..b56df9349f89 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -501,6 +501,11 @@ static int hd3ss3220_probe(struct i2c_client *client)
 	if (hd3ss3220->poll)
 		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
 
+	if (client->irq && device_property_read_bool(hd3ss3220->dev, "wakeup-source")) {
+		device_init_wakeup(&client->dev, true);
+		enable_irq_wake(client->irq);
+	}
+
 	dev_info(&client->dev, "probed revision=0x%x\n", ret);
 
 	return 0;
@@ -525,6 +530,35 @@ static void hd3ss3220_remove(struct i2c_client *client)
 	usb_role_switch_put(hd3ss3220->role_sw);
 }
 
+static int __maybe_unused hd3ss3220_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(client->irq);
+	else
+		disable_irq(client->irq);
+
+	return 0;
+}
+
+static int __maybe_unused hd3ss3220_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(client->irq);
+	else
+		enable_irq(client->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops hd3ss3220_pm_ops = {
+	.suspend = hd3ss3220_suspend,
+	.resume = hd3ss3220_resume,
+};
+
 static const struct of_device_id dev_ids[] = {
 	{ .compatible = "ti,hd3ss3220"},
 	{}
@@ -535,6 +569,7 @@ static struct i2c_driver hd3ss3220_driver = {
 	.driver = {
 		.name = "hd3ss3220",
 		.of_match_table = dev_ids,
+		.pm	= &hd3ss3220_pm_ops,
 	},
 	.probe = hd3ss3220_probe,
 	.remove = hd3ss3220_remove,
-- 
2.34.1


