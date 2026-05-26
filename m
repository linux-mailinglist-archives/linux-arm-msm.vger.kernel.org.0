Return-Path: <linux-arm-msm+bounces-109905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCwkMJvaFWowdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:38:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C75925DACC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 662E73012579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C7D3FDBFC;
	Tue, 26 May 2026 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH/ftc1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Peg3beMX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00846413D96
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817082; cv=none; b=XA0eL9iDLWufNfzWY7XI34u0aPKs9efEyLk0dwwVKQmhMK7STHPU9L1rVKlnkmefOdY68vVH6XxZ4m7xX/2xYU69qvSinAMdoVdyDIEv1NwbdTv2+pFn9TdMtc57AUancItkuCf2pQpU88kIgOny1Sn3nf6tOgkvDIZaaqrWcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817082; c=relaxed/simple;
	bh=UK0w8cVX6HonoLLMdXc+3FVa/9hg3gdhTjqWi4T6mns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNGbMu1PmqY80v3IcQMEMgxmE8QG6hniAM47MMaqLJ1zl54rkcyB+Enjgrt/DahCWasnJbAW+WWVPTXmDxGX8TpRSoWXDl9tzMGI364X6P4RYq/l+A2Y2kFrFNq+nImcWwFRcfumzseBAvT7MOWI3RHdLAm+aSDup2jY5II+724=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH/ftc1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Peg3beMX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QHCucl3314601
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxStlaNB4x9Mu659Ds+9UQmpLOGQ5xsUav0PKNZl0Yw=; b=UH/ftc1Go6WNiRG7
	P8ZitGD+wHJFBCNIrhG93ShLh4eYvKATklbEHd7i6ogf2pp7kjDcPIHvJmnNwhcA
	pSal/sXJMId2vvSFN0e3OOwuH0qTFJTnQPiYPpmI+9zioiyRUGJ7l689J0wjFpOC
	Z5H6DvjPqwMI/Rz/ke8OS7mZ34Q9ZLBDgLfAtr9VeM5aZzuEerp7g4/Ob51ObSP3
	uvmI8I9bWWrVG1b6bW6eMpk9F7/X+7KRps+nBHCRCWN+w96juaRbp0DjbndxYtUC
	GqdZt0BLlDkmEvr05Arf0CTBqMoXzPkGz9GoTfSNmpZbnSWspYKjQ13Blh3xvKKq
	mwKgfw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk03xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:37:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-841d02525b5so404604b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779817079; x=1780421879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxStlaNB4x9Mu659Ds+9UQmpLOGQ5xsUav0PKNZl0Yw=;
        b=Peg3beMXwzgXSfd7NHVFJAk+BQFEw3OrhJqli2ZCFQXgrXuquDyrkzALsGBS+v+CTy
         kNZPGKM/4ZaFeiW43E1jGIx/d2ghXxn+v2ThO5x2+2vyt1HWRGMLOk9qsXKh884wT6hG
         O8+Z9KnnOslm5UR+pluxaVolUkhSyLWE+cArtAx0mnWVaxSNdA+a6kzJZbHHBFyrw0mA
         qfGnLb8dahSADdWuBikSrDkE4uIMHukDuqMf+9dCt5XLUWDBHfkS7hsdak7ElPrz4u1E
         xkazzEAqbFYth+jhX5NXBag8RTPx0mAi7vq8QBr8dpyaB2OL4l/QXuoZSheqj2OPK43H
         SWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817079; x=1780421879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxStlaNB4x9Mu659Ds+9UQmpLOGQ5xsUav0PKNZl0Yw=;
        b=SiRTa4T0F4MLOimDgfucrMVfjczr1bw2Q5Xhc0Cz0FBtMPk3c9PJtZAT2SKOOUWt1B
         W6yO72ES0hVTvALlYZMvXK49v/B4GsK+qBlo02WI9uNPKa1iPrW4pvHR+YBBvJHgJr/U
         WvyG4cfVFve0nMbf3bAkfEpE1EuxsAFBZ324juKBvoulhZZqyAes7SO9iDdIUjCYWVsF
         hEYctaJUd76ZZyrposSL4E1EKEdp+gDwC6d3CLN/UajN3e/jTvA/1mc1ZDQLybhhbe3d
         uNVRsJMI3zA7tZbU/tj65RjtdJ0ESQ8kBEy4sndY8spToSlFF8cFHBqSwfaOTHfJVdi7
         Tkeg==
X-Forwarded-Encrypted: i=1; AFNElJ8V7B8c3Y8QM1SH4l8LgnWHt306EOlfimIiz0VqrjUNI2JCFiwHMn7HjimcISBp4QlNp8DzxSjTzoNjq3KW@vger.kernel.org
X-Gm-Message-State: AOJu0YyE7Tx1h/4nT7R+nUvQYFcpgmm4Z/NkzN/tiSoflMd2FDZfLoXx
	JqwPlke0/ztFT/EBW09eZ5UM9V/aBGMwE7gTxE9LaCdgPwnquWC6TYU9f/wxcIPTZiXHAM/1t8x
	82ACdGztv1A08a8ahTKpLv5g0YSmcUo6NDzUdJXT1DTyqMD1fI4z7MxlmrZ+8PKbLr2ji
X-Gm-Gg: Acq92OEC3/0WcTFhEmMsaVlbi+1kAGKd3L33QCr6igRDZGFYcCl6AL+sRUErgwVOaBM
	FFWwD0lDjUduDOc5DoCvFx6FcoTXvlBHqRVraTsd+O/702/tBA+NTEcN2Mc3CGfRyFDtEdIWbsS
	wm3Fn//DEHMqLgs/jnIDCUtrpqeaePwx2wKht3kVyYbSde6SNUS70DTxNRQCKhtEhZGz7/uXLG9
	fB7HpH9lO+zYrI5fUXNHoDAkmPBZs4IUm6F53l1WT1VA3o4FeXU1f23G2Dn9/gl88ulE1R53ruR
	7eo5tqfdvlm7trKIp//KxuJj+fRVfUWHqXVwjFqYx5brJiue/54DxAtkrEK4+oh33jox6S12ccU
	cH6m2wV2lU2AEuwsz2JvheNfeP7goI+29SrZIDkJAFLOccY77dRHafd8=
X-Received: by 2002:a05:6a00:887:b0:83a:7516:5be0 with SMTP id d2e1a72fcca58-8415f3f197amr18011091b3a.50.1779817078477;
        Tue, 26 May 2026 10:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:887:b0:83a:7516:5be0 with SMTP id d2e1a72fcca58-8415f3f197amr18011061b3a.50.1779817077812;
        Tue, 26 May 2026 10:37:57 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841c32b511dsm3260461b3a.48.2026.05.26.10.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:37:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 26 May 2026 23:07:40 +0530
Subject: [PATCH v4 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-add-tracepoints-for-qcom-geni-serial-v4-2-e94fbaec0232@oss.qualcomm.com>
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
In-Reply-To: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779817064; l=4256;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=UK0w8cVX6HonoLLMdXc+3FVa/9hg3gdhTjqWi4T6mns=;
 b=B+01FdhrNr8H2zS6hZLDVdozovxGugFAYbEnpRfGUk2mrlnH3CoqferFlm3DfPXRabC8h9zWA
 319EjkjFMRxCu6AuiQJkRJ+vXYD3MveQrlKjWrs1Vq2HBfl2ZCkbV7H
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a15da77 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KXSloCXmEunfo-Xy6rIA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: qSEHGWZPqV9uanl9uRwA9WfjuZCSKWv2
X-Proofpoint-GUID: qSEHGWZPqV9uanl9uRwA9WfjuZCSKWv2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE1MyBTYWx0ZWRfX9C3jqbT18thB
 ewepn9CqZskNEV7ASJQlEcBAXG7s7MNv/jgM9RKT+hjS4jOeDjr+OAm4P66NkUSKrwntfCN7kmE
 N90oGX/Zi/USTMRnz4eS/n4nf8eaeS8PfEJHRp6XODysxQyHrJbrOHX/FyQFxbHV0jvQZDzD7ei
 XavW/pSS30UdKIbaasi3nFt+JiTHdLTPkxaG7g4v4sIXQnwmwq2psaIpHEUYjt8W5WLK69o6lCL
 OctlTnA5cfL10YPBcuSD7C0IYoC0lUkVM7hOnCbeEUa6dJZdtwaP5RayO/Bof17jOgQts4/jvAR
 fG6KekwFsYxx8jk/pqv2yfwLB1UckTa4ZvrisnyO/w2JpUFjG09oPiU2NbaXQB1rsb8LcKRMKtl
 NEGFOTXyHxUx/0qVv/7NfvbJlxQmrzjRVQ0t4jZlGWf23u9t+mDSdpcIHSSoG+jaBtJEmbqpX2I
 /6ghXNO+1yxq/uaekmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260153
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109905-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C75925DACC1
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
index d81b539cff7f..4b62e58d4918 100644
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
@@ -226,7 +229,7 @@ static void qcom_geni_serial_config_port(struct uart_port *uport, int cfg_flags)
 static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 {
 	unsigned int mctrl = TIOCM_DSR | TIOCM_CAR;
-	u32 geni_ios;
+	u32 geni_ios = 0;
 
 	if (uart_console(uport)) {
 		mctrl |= TIOCM_CTS;
@@ -236,6 +239,8 @@ static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 			mctrl |= TIOCM_CTS;
 	}
 
+	trace_geni_serial_get_mctrl(uport->dev, mctrl, geni_ios);
+
 	return mctrl;
 }
 
@@ -254,6 +259,8 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (port->manual_flow && !(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
+
+	trace_geni_serial_set_mctrl(uport->dev, mctrl, uart_manual_rfr);
 }
 
 static const char *qcom_geni_serial_get_type(struct uart_port *uport)
@@ -684,6 +691,8 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
 			UART_XMIT_SIZE);
 
+	trace_geni_serial_tx_data(uport->dev, tail, xmit_size);
+
 	qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_ON_SEND);
 
 	qcom_geni_serial_setup_tx(uport, xmit_size);
@@ -910,8 +919,10 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 		return;
 	}
 
-	if (!drop)
+	if (!drop) {
+		trace_geni_serial_rx_data(uport->dev, port->rx_buf, rx_in);
 		handle_rx_uart(uport, rx_in);
+	}
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
@@ -1082,6 +1093,10 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
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
@@ -1294,8 +1309,8 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u, clk_idx = %u\n",
-		baud * sampling_rate, clk_rate, clk_div, clk_idx);
+	trace_geni_serial_clk_cfg(uport->dev, baud * sampling_rate, clk_rate,
+				  clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1455,6 +1470,10 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
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


