Return-Path: <linux-arm-msm+bounces-116726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NIIkCxOYS2q9WAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:57:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203871026C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TspKsaJT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dTFGN44b;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116726-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116726-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DBAE32881E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6815E420E94;
	Mon,  6 Jul 2026 09:38:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06B38BF62
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:38:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330683; cv=none; b=uZLUHn0pD21T/tAb8B0pPiNUySUuREypkTLfOQWaSMZbHGt4XGmRaLf0cV+Vn18a7dSZ6kmXf2Q2uWvfnB4sNmG5FQaMPtTeoRn86bVnJOJ1A0eBHCu6Gc4OnSHpDPHK1y63gM1tNFedhUjAkJjW92kWlTtMJsqA7EKOptMZeEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330683; c=relaxed/simple;
	bh=L9x33N8kaAJ+pi/cD+0MZcVKOy3W4Tm3EptqZaAO8BE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dzwL6xoPoRLWBsXxD1ajLuOl2elE/jtZ2bUH0C5Er4bUYVZsMdeaX1rUUfrXQ5O6wlsAUi0zv77nCrM193uSbC+02T6+mBK+pZGoP0yju/AvFxlbnlw7vu9qfndBKI+NyqWzZhJhHKx+5p7uhEDwLmYe6fh1zN+JwFHR5+YuzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TspKsaJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTFGN44b; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666940dV4108117
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zN9sl4KDiu18GnxHMI7eqmRrC2W1ejMrxfi
	QvPqQWWQ=; b=TspKsaJTnmxFlxXWeoNnxs5eDWOC8rotbU+YTUpDQfEWPWar5ls
	rL/hngVAe0xpPLfSjFjaITURYMiEFs8IWnOx/Igf9eUzWm9IFAbvvJoyIDHr2C7w
	5nKZULBjQulg0xjbSwKLRK1S/TfuNeOkYOH23lXNujkXI6miYcNeugjmMOXuzc8V
	9pzGt8GIKWptB0FPaBVzP8S/kW+qF08OcQaTIkRKrp2NVyDTBFOmn4v8a9u7zYLZ
	2xjNJIZWYcqvv+CfaF3FeWW0UPV0Z8MdAPEmQ1xRftJR7DhNxjHoM+wReZzPPAD2
	jbJGk8gzatGgP2PXROSA2F7xBXLju/JDWZg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrjxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:37:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cae455cf6dso36864595ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330678; x=1783935478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zN9sl4KDiu18GnxHMI7eqmRrC2W1ejMrxfiQvPqQWWQ=;
        b=dTFGN44bepNEVWYzTHGEKvFMQ0tTdZzSp/pizDKraY0Br9Xz4JTozbneqbm6gVILrw
         Jr/vCD5T8WyKxWbZ2Dt93EXysxSj5fk8D+W/2v+sKEnd8uHUIAqvU2zUxxMyxlTVZrXO
         SOUEohSQLu9g4B5nK+GvOBv6xmQKOtMAtyWh1sWOggM3jFfxsKfhNpy+Sv4X0RZ0dRlx
         Jveok0vbfgx8INr3+XGKfn/CU7T+E6r+gy8tvbZVfg1cclUhGuqDOi+kO3K7EcepiE/6
         XZTszHAxK6IoBHGLp1qLXSu9btS1+BY1Pl/4wlLNvXOgLJpN0alZHilqd6u47BaxUki0
         daVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330678; x=1783935478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN9sl4KDiu18GnxHMI7eqmRrC2W1ejMrxfiQvPqQWWQ=;
        b=E+ap2IcshKL34YW6jNdUejTf02Q5slbM4rowh1pcobT8a+LkTy/Zos+zBSZN0S/UpQ
         yKZ49jd7X46AqBSTQt8FA3WeCXVoaFWyMuezDRYKHl9qd4tWbrpQzgZ8xHq6qx0fF3UV
         evHUdpghPhCa7jdIkee1iy+JuSxCEqwzxlYZDJyqmSpeeGA6ldFlrwrq0CKgcSo4Wocw
         XI0t9wl2RmTZDe7GMWUx2sMQ6E6thHiBhGPh4se6NeuQl4UuycZft9OagTK36l8sZ5rK
         c0gGDDS7d0zOOIgewFW43m4gIX0XI2NOwebKVLIrGPIMsxjiWnxqNuCvhQMGRLhglPNm
         CzNw==
X-Forwarded-Encrypted: i=1; AHgh+RrjYXhER4KopckPRQsmmOZiU/ZB7cMK1gBVcWJ4u9JFA8yOBhOpyEZJIrsy259pEZ8bgcCXmQFr6fTk+Swy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzNIwcZKJDDhxhVLc+ctL/8i78ErgYyHbMAPZb0Tsh/DcD7t4
	EN7GUXKnB8WOlstljF8MELNwmhT0981ePVplA8+vrCvvBOjUP4w82IM4HPPbZx2AXTKHlUMFmKi
	zq/B4NOuUwPagruscUxF8dmhYLq0kMwtVERhxlhI8J3DrOlmX09SPHtucSiSHVYqDTvDX5FAcBG
	oE
X-Gm-Gg: AfdE7cmyv+rHMxRJaK8ddN7YcfZJcaOb9HqrY0VC8KdQ4PsLR7bbe6McFNlE18HVasT
	cnSsyLM1YgSe0oOmAfIuJ5d3Cs5Qo3YTxaE+pye2zGSbZn6QRkAbLzy1k6WKazuG8l8Tc3fyCMO
	ZmkNVnUnE1f1ecfTa7mt9adbgpmnOPK3IJ2TXSEL1QotKFBhV+tPe59ls9viGVZ28v/4NRVHolD
	CP8ndYXe6VWQZ9Xy/Rnf8pRYruMU3jH/2RRotENMl3yrU9AirB+jJl6ErvCYfYvFm68iYm13TCp
	7wbaoGSKtOluF/i3kGPUxIiG5fR3j9U0wYrbdQ45XoSzK2UwHtdujH2L1DbIMZLODPG6BE78z0R
	n1YQSVzKdGqkse43lI/ecVankDt01Ywc2QINsV7nIfkW5RQ==
X-Received: by 2002:a17:902:d508:b0:2ca:d151:3835 with SMTP id d9443c01a7336-2cbb9ea61c9mr99023745ad.27.1783330678127;
        Mon, 06 Jul 2026 02:37:58 -0700 (PDT)
X-Received: by 2002:a17:902:d508:b0:2ca:d151:3835 with SMTP id d9443c01a7336-2cbb9ea61c9mr99023495ad.27.1783330677651;
        Mon, 06 Jul 2026 02:37:57 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260c7sm47333775ad.12.2026.07.06.02.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:37:57 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: praveen.talari@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        viken.dadhaniya@oss.qualcomm.com, quic_zongjian@quicinc.com,
        krzk@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
Subject: [PATCH V1] serial: qcom_geni: Disable closing_wait for console to prevent shutdown timeout
Date: Mon,  6 Jul 2026 15:07:49 +0530
Message-Id: <20260706093749.836121-1-aniket.randive@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gms2554i82SbdFidGgqtoNa-q1fiyug-
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b7776 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NsA6dLvGf97xVj5pE-8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX1oBu2rvhI3JO
 YfqrFJRwW5uRVQ1CL8gC035OxslRHbqsCyJ/7Hglpki1L5y/UapBknUWFZUGiB/SyQbAubKr3zu
 jMaxH4NoWrDME2Z5g7EfC5LQiERJOA0=
X-Proofpoint-GUID: gms2554i82SbdFidGgqtoNa-q1fiyug-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX7aqmwcSdjJJ5
 PDVotvtP3PKwv4ng7GrB4Et99m2l7mmE6gSHEiaMsT7PY4Gc3BdNM+UCsueQmklcNWjSG7tbqES
 fGFXESy0iHyS5sPirHUfcJRB+Fo1ygak5Nv2YueOlZUGTsMrkdx5cdEtKLm8dntcKNEyKKryrxb
 7jdnQePqrZNCiWhDXKgdFUvD4d9rrU75jjSwcenvo8CO8JNkaMrVCJOd8znzk3RPX3QRr1a7WRg
 w/MBOhnRibg3rhNX4/UA425cl69wJK/GzPebPqV8pAADhIGlNBFIF9LBqaBGHW28qpr7mhUtzoV
 CYn9z4eViMQ7E0fsMia91MpI+lA4i3HF99lAf255jV/BYVtgVM3h+HnrF6quVp7F80Y5z73IcPo
 NVhftJQ8HIW95pgE8+AF9VkiDTg8Qw+XP8HoI4ENccRS38sDFp0defzp/x5RKpDTSQ9w6bM/0zl
 DL0+Lv7lwPvXknLrnZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116726-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:praveen.talari@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:viken.dadhaniya@oss.qualcomm.com,m:quic_zongjian@quicinc.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7203871026C

During system power-off, systemd closes the console UART and blocks in
tty_wait_until_sent() waiting for pending TX completion before
uart_shutdown() can cancel pending TX operations. With the default
closing_wait of 30s, this causes a watchdog reset when systemd is
responsible for watchdog feeding.

Set closing_wait to ASYNC_CLOSING_WAIT_NONE in startup() for console
ports to bypass tty_wait_until_sent() on close, allowing uart_shutdown()
to cancel TX commands cleanly. This change doesn't impact regular ports
functionality.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..3d3bed0923eb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1245,6 +1245,7 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 {
 	int ret;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct tty_port *tport = &uport->state->port;
 
 	if (!port->setup) {
 		ret = qcom_geni_serial_port_setup(uport);
@@ -1252,6 +1253,13 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 			return ret;
 	}
 
+	/*
+	 * Skip the close-time transmit drain for console ports so that
+	 * shutdown can proceed without waiting for pending TX completion.
+	 */
+	if (uart_console(uport))
+		tport->closing_wait = ASYNC_CLOSING_WAIT_NONE;
+
 	uart_port_lock_irq(uport);
 	qcom_geni_serial_start_rx(uport);
 	uart_port_unlock_irq(uport);
-- 
2.34.1


