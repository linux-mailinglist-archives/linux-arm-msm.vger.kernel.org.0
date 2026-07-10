Return-Path: <linux-arm-msm+bounces-118335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aLDbDyApUWrsAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:17:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECC73CFC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:17:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g3cIHxj8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fU4Br62J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118335-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118335-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD36E3039030
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8770D43B486;
	Fri, 10 Jul 2026 17:12:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1867343B4BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703562; cv=none; b=Tn7tvNbmTwFovqLfVgyZ4qc5/dYzah732/yh70jJHBs5y4JMw1s0WVOJ1cFoTojgZLBCe+2g/a3oYGWu5wDzEQ0xTZT63Si6n+kxNmU4Bwp/0xJv+1CjRJeWRgNKwLkVzXE+8ge+QRNUFXabajZO9yk+uNFdo4Ix4/jms/Fp2A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703562; c=relaxed/simple;
	bh=CKcPA57E+Oa92HCiw+SaghIFdh+X1G6PfizEiFISbQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uq56K1oruIMkd03d/PYjIR22HRc0PZYMw4tyCF/OBdEtqqT/5IKfBnIjjWaSCdjvzn/YR1whimeGGJLpoqoB7fVeKTnDdqzd7AqKSNbjdCpGWvtv1B+alSUMv8Ok9vvOyD4+G5cYtgdlcF1LHh/49VXouaP6ry4Uzlz5I1tE+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3cIHxj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fU4Br62J; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH49PP1326574
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9kkponGRrhkevTw3sXseMJA8Q766uzDiDCjmMShwDg=; b=g3cIHxj8Mvf0O6CT
	7Q/0YNUmQ2zZkCtagBPDl1wkZYlFc/O7khF1Gsau54YO1tt6xUK8S8g5YSwdFL0G
	now1t9vSg+YGCI7CpwnwqoBzgKbVxsSe0QiirOheAf30NFUPDEZsUTMD/HK9zzqT
	59oqGfrD+D0pGTC7GNos2IJ8q6E+cDEdr0WUrOaqE45qoXezoC6nCb1LEWLkElam
	mz7aB/Dcgm4Oj+ugGXpM6in4FJqFN9XGfUualHGjTmDbWue7e2iqVuLxZEHQPeDi
	CO73fmLc41BWtBfB4kAixBkLOrDWrOAyp8W3KZ5tR0Y+/0Q8PCw0c+u6vVAXM7NM
	7Hg6Qw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb339rf2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894391f000so2423240a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783703560; x=1784308360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9kkponGRrhkevTw3sXseMJA8Q766uzDiDCjmMShwDg=;
        b=fU4Br62JJ6etDDV4riKIc2a4EWwIRFCmF5RIkVv7HaLrPigVlL9EdvGe2PyTCRAZR7
         DK/QsEv4G7jU+Q14tQpumaQf2c7+Z8+0+YXIoUUmugbGukZqBzXBQozHzu+I7AnsDswJ
         PGDwRHSlRAT+UXhXjTCEfhRjtryFAlbVhPL6WRRUKetG1UjvsXA8WCCKkA9mzqFeXJcG
         4sl23y57jt1dy7psoiaHab7OvTTLLYdKHjyi9qWSPo9TJ7kek/volR3UtCMKgkfILASH
         U37pvOIPPHl07RTeV4nf/TPwVv2Uvg/GY2NWreoA5XT1wxSjH8gRd5zWBnIBYbfYieRy
         3yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703560; x=1784308360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9kkponGRrhkevTw3sXseMJA8Q766uzDiDCjmMShwDg=;
        b=POruzdaC83MPne+UlLKtkckFz0gTGZm0hR+spkX0rIH6yjXC+FrXp1cGroCHAYqxMS
         q6FLko3Kpq946zO0OV4a3+il4P8lAj8GCz4aIX1hTz6a6gWy5jGBNHQVidKZd24bYIcn
         0B7Md3UNAT5LkCELaz0MBrh4TYa/4fke9UHctePoEiNtIlYYa/qfh3yjY48U2PpRVmF2
         hbyOKQF7dxCs5pVxtsFL1T2hIvkYn+eaztBT7QkTpVIkLsEeV9VjNlIu/5uX6l1odw+X
         94YlonLzJKZWzGrMkQ+6yOy10piiFybqiIDyaY2JA7/iN/XhH3feCVZNsuMOCWJ2o0sn
         hS6w==
X-Forwarded-Encrypted: i=1; AHgh+RrnOC/7HoVojama+I5fHABn7QHGMI5phsZe0yQXGaBvmPKDBhMiv5MCh5Ik5rrbwmDQRAW8TL2oLureCqQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxmjQQRIzyWTL8e51bxVrBTHVqyOWfBYccxkqY1YbZWE08o7O
	do0RLpLkzf+FglECaNwj8CjIAzNnHY/3YC/SlJGtRpIVFRUZLHmiLtM5Ehl2YiPCsmqQtRHaFvM
	pcXEu4aQ9CzCjC2xdBaKCaiSaZ4V1DbO7mGMeuWb9Gebv3/MVeIxoNYYtOF9wr5vzbuDZ
X-Gm-Gg: AfdE7cnhiXacecOrX0H0q96meMYXYnwUg8svp/FnM18scrb71XFO0FP3Ll7Ntbucfat
	fMVRClJJkiIX6VXfk0YUnIsWK93HfZ0iqkSnNXShsTf30CfB4ozP8/TRkjnP01FcpV7z0SoAspI
	FFeOuVpUG68MrHqX+t3rpVaMmzzhHFjHmy/RC0TDygOxG9UhVmaE6FZxrLLHt5yhy/W1IR7e7vY
	RDtDqwJpXKSixuGj9Lot/7/OVzP1wtMLH2IC6H2j5EyRCIegU2IfCm28E3CU7sOPwXh7a0s6pMb
	shQxF4rmDTpRNwMXLY/ZNp1tNJpvTQeiJaAGx/XMGX5rkNks71Bockl9FCo2hwVySL3tcjiu1KP
	0QR7XjrVEY+h/5TLhJxuWaWtVsO5H0XKsCyqNuWbLTkgS
X-Received: by 2002:a05:6a20:7289:b0:3c0:9c1b:d0b2 with SMTP id adf61e73a8af0-3c0bd2953a9mr15495160637.61.1783703559845;
        Fri, 10 Jul 2026 10:12:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:7289:b0:3c0:9c1b:d0b2 with SMTP id adf61e73a8af0-3c0bd2953a9mr15495124637.61.1783703559349;
        Fri, 10 Jul 2026 10:12:39 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm46636277c88.12.2026.07.10.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:12:39 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 22:42:13 +0530
Subject: [PATCH v6 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-add-tracepoints-for-qcom-geni-serial-v6-2-2bb6b6836dfd@oss.qualcomm.com>
References: <20260710-add-tracepoints-for-qcom-geni-serial-v6-0-2bb6b6836dfd@oss.qualcomm.com>
In-Reply-To: <20260710-add-tracepoints-for-qcom-geni-serial-v6-0-2bb6b6836dfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783703544; l=4300;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=CKcPA57E+Oa92HCiw+SaghIFdh+X1G6PfizEiFISbQ4=;
 b=1t6BRX+ncPwj/eM99WkVtM7CmN8G92EiLwYoon4VdQqjaw3BKziVTmfWb4SrhqTVUfGjEK6gd
 d1UsJrFaSM4CMqQDz4VIze2LKI3BAYVR32li96VCmvetweUJ3s0U5ZM
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3MiBTYWx0ZWRfX9U+8JUFixJ2r
 nMFpNjDcJptkSeeq8z7tCkzVFE3DcQKNZXMnDakozPddizPCe/H/uaXkSCPfxJw6I1tMLCyproy
 aQyg7+cidIk+UBMGYv2eqva+4JaE6+Q=
X-Authority-Analysis: v=2.4 cv=Re6gzVtv c=1 sm=1 tr=0 ts=6a512808 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KXSloCXmEunfo-Xy6rIA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: vbBtHKfddw3kE4NiieLIUy1Y3ibnxs5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3MiBTYWx0ZWRfXyBAm3b6MfmZh
 tomYfI5c12GtKgoh6AgOItOqg8D8czLKVxkqHF2g4f99hPZCloEy2wnyNl1rLuYJMr5+3XQgGgT
 NQiUDvCqDiXHf5A31JxVoY8yNa2fe+ItfM3JPVBKFDhD/Bf9wVQWg2DLfIi6b4plH+1deHAPr1a
 XbsgI/wYVlrDzOcVi4sJko4TBMi7l1XfcaWnfJMRlQYQjaRyt8iQkcqgryrqYDRC+LWbXIpIRTG
 fObH6FoLmrFRSw2WyKU3LDaMVzkiIvPaV3sXMR1yYOyKCH/l2TnhnAjqUSf0/c12moGY9yXwhvh
 lVfJO2JltNz/Zlrb4IosCEDZ2Pg6z3HRb9+ArPV6iS+BsUlfj69NXgyKGnVKV4vYl0Sqcr+Ky6l
 whChxRrPstkoupARvKW2IGhj6KmAlw==
X-Proofpoint-GUID: vbBtHKfddw3kE4NiieLIUy1Y3ibnxs5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118335-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFECC73CFC4

Add tracing to the Qualcomm GENI serial driver to improve runtime
observability.

Trace hooks are added at key points including termios and clock
configuration, manual control get/set, interrupt handling, and data
TX/RX paths.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..23024fef95bb 100644
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
@@ -907,8 +916,10 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
 	if (!rx_in)
 		dev_warn_ratelimited(uport->dev, "serial engine reports 0 RX bytes in!\n");
-	else if (!drop)
+	else if (!drop) {
+		trace_geni_serial_rx_data(uport->dev, port->rx_buf, rx_in);
 		handle_rx_uart(uport, rx_in);
+	}
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
@@ -1079,6 +1090,10 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
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
@@ -1291,8 +1306,8 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u, clk_idx = %u\n",
-		baud * sampling_rate, clk_rate, clk_div, clk_idx);
+	trace_geni_serial_clk_cfg(uport->dev, baud * sampling_rate, clk_rate,
+				  clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1452,6 +1467,10 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
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


