Return-Path: <linux-arm-msm+bounces-108259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAzwEy5TC2qYFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:58:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D59571CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D9B1304338F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3185638947A;
	Mon, 18 May 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJuvFVUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilKotGe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29C389116
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127042; cv=none; b=s99anQ7xly+wTBf2qcsd0dr4rv5lATbC+BMCJGy0Su04nZavU5oojUp7tzsZakQTUe+JoK1UcKbgH67TRx/oLalIximF0tQHlkseXNYlu6rPMZ3OUO1L6fdqAB9HRaWjFj4yXxHHl7vCF+Qc0XjTFht8LKhKHJ15A3PX6JHM3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127042; c=relaxed/simple;
	bh=0nyRs1xCvidMCfw1zr2HoR8+SkkJFdchyMA/7+/8bnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRjlBvWLZ++WBvX538dONY7UPFTytaI56qOIAseslKl/rpsyMlDInzzWJBn0f7nkx+O/a8JpKqnYiglUwL3WaSSl+KswLa144wvkDkd1WWwN/WgZr2efWEzMfhr2mtn9BfHtoO8HPU3IRmn/4SS3lWPVc79hU6OH2QF6ckcznyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJuvFVUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilKotGe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICp9432438146
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EX8T0Dx6cCRltReKRh3IbYrL3q0hQ7wW+nwXIPZhAw=; b=UJuvFVUr29PJ3GTl
	Lf15QnsEIAhfNBgifkS1tX481o/faE4+XqeJk/12/yO3DeiaWQF/BM6bkOBfoxIX
	+cevGyXiWIrnuKZRIXLpW8PlWYqpEW78adHJ1IU4mldNtoHVbV268v1fjFdJmGi7
	xw/cf43NfMrvbYt7bn17kxRF2IPkxEyA+/PDLIJFPuE/XHXoIhBGcESukZOt1qXU
	4v1yoBhhE+N7VXpkO9hvK5p8EOtc2zLYieQt39AW5VfTOezoZPhXNL5styh6uef/
	MyerjE/CNhluBZUF4a0RfDYTMAAdacZAxh5r/+W/sndnRtISeP+hlEcNUykG8nmA
	2zAShA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v17h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:57:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9b8137828so28866575ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779127038; x=1779731838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EX8T0Dx6cCRltReKRh3IbYrL3q0hQ7wW+nwXIPZhAw=;
        b=ilKotGe3o3lFFpZ+Qt4XsUOUGcufvLgbC/pczb00qOFfmTMRLVCL0yWs0XSQ7z/o+B
         nq9iTk8EEfHnD2/kOD+xxD8nKD/h28Zr6e76+i2XY8PsmEZnigK9k9j52+TPaPTmRiP6
         hJPcYDG2ggqYhRq8HN5AlFW6vU5rspnJ70j6zf/4Axf1Uzx3u985lMdg1QPdj+BIM4Wk
         HVkB+vIQ/YJFbahHyyIwvwt54r0jOQNClABhcz873UVPLCE/ZvVWAIStJnGNEGDxb96O
         AIvJfLcDrfitmu44j6T22xOWppqNr9Y32NHSJsZ6QppdjBT6w1bjSPzb7G5G53499QdL
         +c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127038; x=1779731838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9EX8T0Dx6cCRltReKRh3IbYrL3q0hQ7wW+nwXIPZhAw=;
        b=ZinaqOB1wINVwpHpvS/U8iUGdUk8iAZgElkIIbP7aImmDBYY0rNLhDLtXLe/Rm8soT
         LaU4MOD13QY0DH6mXc4V9K0mjvWkFaIEaq8iJYmrBq8GVhF3aMSPAHIZtgTxDFFnnpoS
         OYgM/+2DRmUPL/hakGFSN18suzo1GWLBQ7Lbs8u2yfZB2jWSy+cdLfiUtfhIbLcZVUQf
         n7WpqRjTKaXw+JcVp5XgDOvFl1JNyXvkZ5cNswk7o/yJKWxZxNefNJXhiOaKsutzfWLq
         eULANLV4lwXdkk1Uf0Yh31kSb2coP7NSYJmZoGy5QoWoAbDkzv2dqRo1bKeHPi58V257
         MX9w==
X-Forwarded-Encrypted: i=1; AFNElJ/qfuNQS4T8Bm8M7WjnNUgpm4pQLexgNQVYFGTLo9cQExLromELcrVi2g/G2Nqi2x0jSgqeiycxeRpiVZlm@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE68igqcKbu2Fq4dWpycYOQbxm/N0v8lhcuRsz1zrwbp1B6IL
	flizY7eYTRdeDrUdTAiF+/+D2JTNHIqVS/2z/sygbkFMeppBzk9hcVeg9p4wgt7lIaMO7kAgx6f
	tsKd6AmDDEnZE+TFJgeCJxGnb1BdtcMwObbHXjjfqOg2wviaS6OIvIMODUzLv+LAmOYgg
X-Gm-Gg: Acq92OE3ooCiT5mkUAo26cBZeIwaAcaR9gXaPFte2JlnFEo9n6L1VWBz+F8bw4YH91+
	joZu29ovbbY9Zrpf2nNk9RfFwmOoVQMWfHVmy6qp+uCnRLYZZ7sGKTd26ip4Q7fwrfKAx0MgrTe
	IGFFor+1xDmg9xG3NfKzuGSFCFIqtR4IIDSbORTFxKt48s+my/xGjHxJVjDjDbOvoMM1Kk79WT2
	7C57/ir7/TTDsGefpiqcx8E5FaB+PqMk26Yro6jCBRVjh6lzXSp7wr64roD4IyOIc6n4s75tLDe
	PXb//2tyyNesbNyAsJgsnDKiCEXWPg5NHGFzkBA+qitwlwHrwoD6374Uda6IY07+qYO2FIDvbkJ
	U/WoOkhpEd20OvzrCPhW4d+E41iujnEyj4FOap8V/htENcbOMk21K99k=
X-Received: by 2002:a17:902:da84:b0:2ba:3e2f:6874 with SMTP id d9443c01a7336-2bd7e94d060mr170798015ad.26.1779127038409;
        Mon, 18 May 2026 10:57:18 -0700 (PDT)
X-Received: by 2002:a17:902:da84:b0:2ba:3e2f:6874 with SMTP id d9443c01a7336-2bd7e94d060mr170797725ad.26.1779127037825;
        Mon, 18 May 2026 10:57:17 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4973sm158348015ad.41.2026.05.18.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:57:17 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 18 May 2026 23:26:56 +0530
Subject: [PATCH v3 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add-tracepoints-for-qcom-geni-serial-v3-2-b4addb151376@oss.qualcomm.com>
References: <20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com>
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779127023; l=4237;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=0nyRs1xCvidMCfw1zr2HoR8+SkkJFdchyMA/7+/8bnc=;
 b=9qCjOxVvFpM/Poxi6zQQtp/qyXLfxex0492AN6mDg/xyAIGAMML2WuY2nhkBgrD4BuG+bvdcL
 6v3sw9dC+LUDOGJw+92TSVetI2egmGCtUUmqSyajPwL+bCRozdjkhfN
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b52ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KXSloCXmEunfo-Xy6rIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tCwsMIoWdvrVhS2_1O9GStfQLBun6YgI
X-Proofpoint-GUID: tCwsMIoWdvrVhS2_1O9GStfQLBun6YgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3NyBTYWx0ZWRfX5/mM7qvLIgOh
 RfMdTWfW0ZLVYmUbeq+kXbdi0eCrSD6PRI6z0761qlAcMEPo+tLQX8rtVLjIqDMdvkevwYyzZ8v
 baUWz06vjrjFsr3zr9aFLMuxgYViXukPFQM6ljVIdWPvlXlbR1YrptODOwT4BkQH0vJVHZwGqs4
 UQvTEE+Gk1iz15XyDT0bLC019XiRiU5xQt+s+5JmO4a59U5CQG3gp0Iqcoau2Qe6rm1qMJXaDjM
 TY0gGmVWezbwySqamYgYAW6PnTggH0Q+MN5tLb/Lq2weWCCa41ezg1PurjXNNlTwxUzkWPucMGH
 F8BuQOREbWRYBCZUSNksf65IfkJ/n8wR+m1wPowD/ZVwhWHjXIoCBOpt/ubfU4P142Z9m7ITPDs
 VzSrjy9SACXs1AT2tC3geMhaOLVoDrEHVcYPC9GxyxdtsaYNRyiC5OWZjlLJGBG/zK1X8nBL3Ka
 CXHFR03mYPCCxfzoVGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180177
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108259-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05D59571CF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracing to the Qualcomm GENI serial driver to improve runtime
observability.

Trace hooks are added at key points including termios and clock
configuration, manual control get/set, interrupt handling, and data
TX/RX paths.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Updated commit text(removed example as it was available on cover
  letter).
---
 drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb..9e2de074d799 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -7,6 +7,9 @@
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_serial.h>
+
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/io.h>
@@ -225,7 +228,7 @@ static void qcom_geni_serial_config_port(struct uart_port *uport, int cfg_flags)
 static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 {
 	unsigned int mctrl = TIOCM_DSR | TIOCM_CAR;
-	u32 geni_ios;
+	u32 geni_ios = 0;
 
 	if (uart_console(uport)) {
 		mctrl |= TIOCM_CTS;
@@ -235,6 +238,8 @@ static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 			mctrl |= TIOCM_CTS;
 	}
 
+	trace_geni_serial_get_mctrl(uport->dev, mctrl, geni_ios);
+
 	return mctrl;
 }
 
@@ -253,6 +258,8 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
+
+	trace_geni_serial_set_mctrl(uport->dev, mctrl, uart_manual_rfr);
 }
 
 static const char *qcom_geni_serial_get_type(struct uart_port *uport)
@@ -683,6 +690,8 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
 			UART_XMIT_SIZE);
 
+	trace_geni_serial_tx_data(uport->dev, tail, xmit_size);
+
 	qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_ON_SEND);
 
 	qcom_geni_serial_setup_tx(uport, xmit_size);
@@ -909,8 +918,10 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 		return;
 	}
 
-	if (!drop)
+	if (!drop) {
+		trace_geni_serial_rx_data(uport->dev, port->rx_buf, rx_in);
 		handle_rx_uart(uport, rx_in);
+	}
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
@@ -1069,6 +1080,10 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	geni_status = readl(uport->membase + SE_GENI_STATUS);
 	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
+
+	trace_geni_serial_irq(uport->dev, m_irq_status, s_irq_status,
+			      dma_tx_status, dma_rx_status);
+
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
@@ -1281,8 +1296,8 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n, clk_idx = %u\n",
-		baud * sampling_rate, clk_rate, clk_div, clk_idx);
+	trace_geni_serial_clk_cfg(uport->dev, baud * sampling_rate, clk_rate,
+				  clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1432,6 +1447,10 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
 	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
+
+	trace_geni_serial_set_termios(uport->dev, baud, bits_per_char,
+				      tx_trans_cfg, tx_parity_cfg, rx_trans_cfg,
+				      rx_parity_cfg, stop_bit_len);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE

-- 
2.34.1


