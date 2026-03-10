Return-Path: <linux-arm-msm+bounces-96599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH/2I8n3r2mmdwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:51:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12647249B51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 984C93183F2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527E2363C56;
	Tue, 10 Mar 2026 10:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJPkrguX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMdE14hy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A1229B38
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139690; cv=none; b=S1fAGKXfiBuE/pa8lMfzbKg6Y9DT9hoKj8xsy/mhPQX/+0lL85M87IyeZfh/Y9WwYDxvA+DaxpW2lYgFE/pO/TxGv7RvlCn6hC5bCh4RH/bXDcCSYXDyqg0qHeLoLAxmt+2i6E7VFy2qBaA7PLKiGex17V1EJOk7B0cvpWUrwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139690; c=relaxed/simple;
	bh=bVtnesSZgi5d15TH39dhPg834YO0cJlEpOGHYWaCwkc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L2NFdXaI2T75frVJ2L0PRmgoRKWJTV+RN2urK/zb1rD97Tai9zP3R5BbZQwJ9/pcYVFzQI/PlwMKrn99Ajf77AIdsuxrP3J+RlD+6PpkOHOAzY2cNlDC16jbTvJCst1m/ZHpnAqXLoSq6DTKrazYKJdcTrGtOboxPT+7cbIKzBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJPkrguX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMdE14hy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A5lF2i568670
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/2NolHMEAcoJKvp6qHfCPngf0pFz/e/JPbP
	GZ6RuwII=; b=jJPkrguXdBrngS9UNoqqlbVasJOeq2s3oqkcSaAGzVLk5jVjuxg
	hjbSY9nz5zuqlwa+qv4th4LrwvxYE8WGuzbejx5cNrhjlqAKuRnJR0ik0/zJ0T5b
	LI2n0/qU+BwHTI0UTHDhUXoyBYojfSrJSNyVp0h58BAnjA4hmFpP8r3JH3ZmXRoe
	kXCaWx0nvoGmdbnHKKqYUJDJRdJ5tXMzkBPBJbWF8oLnTB2KDpJ8el+7q+dD2uG2
	LmS8ZIjfIPrWX8s14VFUCJcQ//9BBVpCCgR2vbEc3IyYVFpGhLcfQ7xnmtqQcJPD
	PePHqT9iAHfYnOt3BNjnNm9LjlT+is665gw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctdf8h44y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:48:07 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bb57af478so25654811eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773139687; x=1773744487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2NolHMEAcoJKvp6qHfCPngf0pFz/e/JPbPGZ6RuwII=;
        b=fMdE14hy3st4Ptfqq42SsyoKYloYvrRFyp7NMbDelNBW0E2O5Gk027pE1zVeX7GToy
         DfJjSSbqVOdL6rl5lPcnefw2j2A06yaOvyJPvgUs8PMcajwpnVNDzrmXNUfgJ+giTKBX
         ctdtYrff45pW6bBbC03jrgv2rNyRijYHa60lUOQPmv5UOOcz1I7++vBwJtiDKdWqrq4u
         +pd8/r5H5EC+mBj7s7G0J/Uy/CaChCTdRNttzOg67SobTr7RROdFKwS6K+6n19iVpBx8
         lJhW2WAHWbJL98h/Mt7eS6bSEbB4sTxDcEr8i/T9MUanlyxPsAH9ZWnFipS8YMa6h3sC
         6EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139687; x=1773744487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2NolHMEAcoJKvp6qHfCPngf0pFz/e/JPbPGZ6RuwII=;
        b=adycJu4xeTaW0XrJmehy/tRIASOljX+nXSSm6T1vIeI5u+BwxxEsh+wk1xzeJcNyUv
         9tqQ/T0bCgkfljfC9hejcC8VkcaDYFS2+DGGEPAqpUKtX//jfaA7jtxSGa0bNBZny5Up
         xNhmnVQyu62RLGcfV5N7RV/zXNmsH7MijyMeNWWInpjIAOaK2f2TEwtzhRC93DqNTkNq
         jRRRl3kI7ZqX03jiHNQYaag1tc6miR8K5IQeknA+u54Yh7tKXf7V9Nx/DkJjXX3/sJSX
         EaZN4mbv5XLEvDjxMCTUs62pNdbpxiJIE6ZBmBPslmokMrCylu/4EGG4Z52urFMfh2/+
         o7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXzWzEIa5VZt+G1tbVusrguT6GxBy4WS4ITPchB4PYbrK6KSjDz15AACvFxEGRfINS4Zdcy9cFu2ihoIL0Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VDrljX88iO9Rg6zKaApJk3W7+3J/bb5WGx8nvNoLpulB4lyy
	qmGG/5Pnn2tgpzgodxemT9FmvlNumeEF2EYghwZsAat9Sq7fKCHHig237kDuxr5RxR4eRrndkZS
	Yt8EnhSZ/Y7Z7NRsUbyKYrNaMMBJFwYozNWnT2rbT9ZPvZ7OZzTh82Vm9qwZIcr8JQLXL
X-Gm-Gg: ATEYQzz+NlKZ05OS4LNqvngQLP98dr00WrgLMiTjBdLFIxtIJBDsY7yg76eiVHqxmQd
	X0TWeFLahdUR2J1UtWBbWp3ZzOkF4u0etZVwpwNmLb/5pdUvUfxyTw67fNMmOLajG+vzjlYmnk3
	EA9Jl3z3XUFOHN4p5aanskYALNfGBqkN6tLOjI/WyLXUJAsDh84GTnrclYo8oO+MLn2gu0Dxolc
	xm77t3T6UY8wieA6flwuEjwB/s5np2gq7monYb2pf1LzMoP7HmAHMyI2d5XdVxhUJMwpytrFyZW
	ZD5V1Fi7Hw09sfpC/vqMUYPFXyu49RQPz3q+ouBHk0oNYiFBcpQk6FVt7auMkwrNqOkHE/qW/MB
	wrAEM+7itHKciivwiRPHcwamye9Gt5s663f199LJ5j3jKns3csAsv8cM=
X-Received: by 2002:a17:90b:1850:b0:359:f9fa:147 with SMTP id 98e67ed59e1d1-359f9fa0257mr460449a91.3.1773139324301;
        Tue, 10 Mar 2026 03:42:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1850:b0:359:f9fa:147 with SMTP id 98e67ed59e1d1-359f9fa0257mr460431a91.3.1773139323834;
        Tue, 10 Mar 2026 03:42:03 -0700 (PDT)
Received: from hu-anupkulk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0c9666sm11110278a12.14.2026.03.10.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:42:03 -0700 (PDT)
From: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        praveen.talari@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        viken.dadhaniya@oss.qualcomm.com, quic_zongjian@quicinc.com,
        quic_jseerapu@quicinc.com, krzk@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
Subject: [PATCH v1] serial: qcom-geni: Fix RTS behavior with flow control
Date: Tue, 10 Mar 2026 16:11:55 +0530
Message-Id: <20260310104155.339010-1-anup.kulkarni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5MyBTYWx0ZWRfX4vb+mU1Y6j4N
 kT0MUHZSsoASBiIADWqVszw8CjRVv+tQu/0xAKJFjDP5KjOskG1RVV5EPyjTpSQNJ6M1aNIi/IR
 5HaFl1mgX0qV47GJ+Gae3IMAdtOljG75wM+MfFFJMx22toNJaAUxM/uOI1c0JjcPdx+A9KbpcaS
 STP+G4gMp3xFyzzjjcglqr8dhXox2RzuulVIQd05fGTqWBw2RhisN3BqJyPUX0EalyVQp2fpuPb
 qiZE2ue/2vuflzSofQbVCZ4y0VG4mw9SX77ShfTp/4M+W8ldXvWuBNfDOVoRK+JhdIo9l6yBuUT
 /s8Q/NoDIs0zCSVaBDiKykrApeRsg31F2oXkjcm8DrSG0CDE4DL7+9P9/wjAY69+Ov4zj+942Ii
 mNUkbp2X5GWG7FGluNN56vCgHIx3P2ZcrVkCKOty9kakN6/N/lIL8U/Hs2K87wgbRD559ZoYDlA
 Ej1cQvT2p8dnQsKP8pg==
X-Proofpoint-ORIG-GUID: IHBGr3YSat4L5wpxuc1Y3DClzFrPd1OW
X-Proofpoint-GUID: IHBGr3YSat4L5wpxuc1Y3DClzFrPd1OW
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69aff6e7 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0mDEy32cLckCWZYzXtIA:9 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100093
X-Rspamd-Queue-Id: 12647249B51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96599-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anup.kulkarni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When userspace enables flow control (CRTSCTS), the driver
deasserts RTS even when the receive buffer has space. This prevents the
peer device from transmitting, causing communication to stall.

The root cause is that the driver unconditionally uses manual RTS control
regardless of flow control mode. When CRTSCTS is set, the hardware should
automatically manage RTS based on buffer status, but the driver overrides
this by setting manual control.

Fix this by introducing port->manual_flow flag. In set_termios(), disable
manual flow when CRTSCTS is set. In set_mctrl(), only assert
SE_UART_MANUAL_RFR when manual_flow is active. Verified by enabling and
disabling hardware flow control with stty.

Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb..9854bb2406e3 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -146,6 +146,7 @@ struct qcom_geni_serial_port {
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
+	bool manual_flow;
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
@@ -250,7 +251,7 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (mctrl & TIOCM_LOOP)
 		port->loopback = RX_TX_CTS_RTS_SORTED;
 
-	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
+	if (port->manual_flow && !(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
 }
@@ -1401,11 +1402,21 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	else
 		stop_bit_len = TX_STOP_BIT_LEN_1;
 
-	/* flow control, clear the CTS_MASK bit if using flow control. */
-	if (termios->c_cflag & CRTSCTS)
+	/* Configure flow control based on CRTSCTS flag.
+	 * When CRTSCTS is set, use HW/auto flow control mode, where HW
+	 * controls the RTS/CTS pin based FIFO state.
+	 * When CRTSCTS is clear, the CTS pin value is ignored for TX
+	 * path and RTS pin can be set/cleared using registers, for RX
+	 * path.
+	 */
+
+	if (termios->c_cflag & CRTSCTS) {
 		tx_trans_cfg &= ~UART_CTS_MASK;
-	else
+		port->manual_flow = false;
+	} else {
 		tx_trans_cfg |= UART_CTS_MASK;
+		port->manual_flow = true;
+	}
 
 	if (baud) {
 		uart_update_timeout(uport, termios->c_cflag, baud);
-- 
2.34.1


