Return-Path: <linux-arm-msm+bounces-118205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id InYYDOm5UGpI4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:22:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D36738FD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:22:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I81HjiLY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hDBqFcZe;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118205-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118205-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31795300D1F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995C73DD537;
	Fri, 10 Jul 2026 09:22:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FB3DB996
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:22:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675360; cv=none; b=d4/AtaCi378fHulrRDIB5YXj9RcNNPEEvkmJZ930fp9MzD01/sXTHoMwvw+ez/s8GfGPnuCXJqzqUcqQ6WQzhK1Hgyj3PI83WCKT5QPgDeS/5ljncH2yxFk8dBNFrxoXc8Tjm1t154Mmz1je4bucxLFNXwbokhrmvHVoy9fjkgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675360; c=relaxed/simple;
	bh=RqyHW0IaMsqAhVvqhdhpa4R22HDdXI9mCD/eBUCRSlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J3a3e0zQGOqzabcWiUG14iQmBr6rPM6/HSjIxw8maumdgF+QAnvaHmGGGbe8XPY/epTzOeGWlYlTuO1/zQYLKJi8of+ou6uq2u08DbpZo9rreBxh9jg+RQnyh7QHI3IHU+BWCk+SkVtLzWu/vlHUOA+KECY6quRYfcQ8kuFF43I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I81HjiLY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDBqFcZe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dTOm4156489
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W7oU3IZfHQjETmHidlQ2tZ
	qPHO5HhZmNxF1CxZNhCYs=; b=I81HjiLY7FSVjvZu5xuyeEh1phAF0mptjY+t86
	YXBZEBTmwpi7XxYRiS9BR7fKadQLD0SDcI1CMJxMY/1EqQQoJ6EooYZILt/2t4XL
	LQbcQFNwniNRZKkf51jQO4/uChIl5rMViQhs0yuj/3XMDx6Fiy2mAB4oj2V2mEwC
	rbjBQgnXxkpEqFxGRH8VX4puMbTzJqj0nt2Ll2zBVei8PY85xIdKbDv0fw4n06XJ
	n75LLKahRoKbpxtjVA8EqLkuzIf/2NVv8yk+KZs8uR8x+mwQ2iGbi4d63zM1iHq7
	e8PExjYMJFp5Hu9ZlSp0uTAreWe27s6lxRYxV+J81S6eOkcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jkmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:22:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so2021815b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783675356; x=1784280156; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7oU3IZfHQjETmHidlQ2tZqPHO5HhZmNxF1CxZNhCYs=;
        b=hDBqFcZeV+vfO0klhYDgygcf8nozgf3Os/VmPSCKGPqe9G14wSPUpbjhmHcoBd9hqn
         tCoAC3+5rICv6kZqCANHxhNhLGuep1kIauXS1Od+Go/YM6zKREX1Ils1kRLrdHcO4Ira
         x8UeDq8WAt7u8HOYsW4bohsmtNyvC0wBg0dnGOxjAVS/ny9vL09pXv49oq+OmP70/WGA
         yuS1k/w1xx02FTxaGE7WuoSnmYbopbiHFUoc/+IOyydKq3qsTImqfvwwL//VEQtdiMwQ
         Iho6B+evoNpl0mU/v0XAqTQE25Vs3YbusnUgVbFlO+/C90n6TjgWejKpiMHaDDAt5sd4
         bmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675356; x=1784280156;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W7oU3IZfHQjETmHidlQ2tZqPHO5HhZmNxF1CxZNhCYs=;
        b=hb83MZXMqQ7khCUT1qo9m0AhE13H6YHwyHm3hZl7WUbMgyJFbgE88J/RszrklD6js5
         wZrDfYmVVRbdYKdaJouHVttWMh7+ku1KbS5dv/glbnq5XS30hcV1Q4mLOcadOpB48Wj3
         oc3+KTN5CFHKpJL4bCAFDwIMcEYEfdH+1tvX+6fc0xOdDhHSQYW9T9YbwSWjQOHItYUT
         jLc1rVjnSFFcP/3yZvk2vA4Tlj1iUc5Li4PHskKYOh57hlN4eeX/Ol0MlVcH3wUnGo+b
         xvuOWJExr/99RKKYij6lXdjeLeqa+lFiwrCiU/XjB/s0bn6AApoAZZXUJ6Gal2AbytIe
         JQVA==
X-Gm-Message-State: AOJu0YzA9HNVBmcwYCvH6OXcGVMEDgYMIFtf03PGAJKRCRTQLXMG1WWn
	iRuW0dGtkQ+FDFdGHkF31kJu7Fnv5G9q66kyCTZ54wFUicBT5DgNsm7qYU/aQzSoxLe8ZYput4E
	yeB8TcyN9OqElJSVJTTTJ/Wj0tGaUWPuDrGrCQuNgV0yPU+p2HjmjN4VIxX5C6hsSr2WA
X-Gm-Gg: AfdE7clyxvbE15XmjGCxTtfNfIPfWeowuIIf0x0C7ERbNq+B8Iu0e5zWiKbBGlUGGFu
	z2FXX2DD55cQs2xB4Ng1r4HKZ/THDIOqFSyXDK1H/3lh7QObX78vBCSJmHqASDvcHxXEaFQP8mR
	c2eBIgKUw58jfbXWvvlH8nfJTAAnGFF4grjlScNUQShv+NR3hG7ORGU3VTHp7JEo+e2A96DVkQj
	5kP2gbpBbzt+m5lHtE4wvZUIJ9QL2Pci1Kb4SCCuVLktIOs+g7jvObgK1YoBEuQJzayfujVQtcq
	G82fjLnPUVku2jV6ix0WWMMJDTk2of77RLt9ui5cHG6URQnWkq7pjtvo6ivwzI/fiEX1kqEwPWL
	zIVYy+Mtt7kLkqbkTtjxtFm/Rn3SFMD3nMjoyUnwbXrvz
X-Received: by 2002:a05:6a00:1884:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-848432dae99mr10916258b3a.34.1783675356362;
        Fri, 10 Jul 2026 02:22:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1884:b0:845:c5d5:3745 with SMTP id d2e1a72fcca58-848432dae99mr10916230b3a.34.1783675355795;
        Fri, 10 Jul 2026 02:22:35 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4edb4sm9959355b3a.33.2026.07.10.02.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:51:32 +0530
Subject: [PATCH] serial: qcom-geni: remove .pm callback, use runtime PM in
 startup/shutdown
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-remove_uart_change_state-v1-1-8e8468da22a1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJu5UGoC/yXM0QqCQBCF4VeRuXZhNWirVwlZRjvWBGnMrEsgv
 ntbXn5wzr+SQQVGl2olRRaTeSpo6oqGB093OLkVU+vbow/+7BSvOSMurCnui2iJExw3Y0A4HRi
 9p3J/K0b5/NPXbrct/RND+vVo275s0YPufAAAAA==
X-Change-ID: 20260709-remove_uart_change_state-a1f7e783aeb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675351; l=4513;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=RqyHW0IaMsqAhVvqhdhpa4R22HDdXI9mCD/eBUCRSlo=;
 b=J8sMP5fCjVG7SkRW95a1Fs6z48yLiPE93pufCw/TBXoDZZGZrEuUYNJH8TGVXxd3Jlyl3fplh
 KdwWnT45ADeAjxm2EF3J87Y608RZ0aGjBlKaJxdHYT4u6sZJFEFU4U0
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: PIrQ3heVLxQF-_QlQI9ZoZcXeNeGS5yg
X-Proofpoint-ORIG-GUID: PIrQ3heVLxQF-_QlQI9ZoZcXeNeGS5yg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5MCBTYWx0ZWRfXznMBOt6uBrUS
 yApURAjXByT/iZyMXR6wAje8PhTg2fwppcePENo8WX6uS0tSoakMlzbcvQkwUdxL74E70sXu3zw
 MYwmGKWn7oT/l++jEHz4GVr9X6tfX3s=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50b9dd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Lm143-4zXO_JaeHAvGEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5MCBTYWx0ZWRfX9MvItHrK2DRa
 1Dsek48r2WF/VDkeB3gcicCtmUaOpXD18ku4i+fK2XEoMrT5vS33CjPWLAsdfRaULQ0bPM11YJK
 zaUdEjJEUwqWbtaCXEKLTlcCyh1JO2gIMNf9t5oGIZPcH9AOSOgcLuZQvorOmD8TuWLi4c+XKga
 YYQYgIXehndFeW0a7yQ1ZRC0+2WpfWfevGyNRfXIQv7655dE2uf4uW6ZQGjjst/i+VyoawbBKdD
 FNOCMYfhyCZqqCLQsGJilNreMNAhooVIbZkriFMTMO+lovTgUt7bwgkHWDJLRR2XHmTr4RSqveQ
 6SrswhbSbpYygUylbPUH9wpEkh6Y5cdAqX38/X1+XUAVohrJisuCTuixlg7XRK5dY/VGL3NZO9h
 fyqsg+/26qdJnPZZQOXwhT9r4Irs4S60xPnB5jR94TbxydPc8jVgaQJ3TUN12ZCOnnYS+x+Lf2O
 FQr+JB/cEr5DM/wOJlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118205-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andriy.shevchenko@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95D36738FD4

The driver currently relies on qcom_geni_serial_pm() through the
uart_ops.pm callback to manage runtime PM references. However, the
callback has a void return type, so failures from
pm_runtime_resume_and_get() cannot be propagated to the caller.

As a result, startup() may continue and access hardware even when the
runtime PM resume operation failed, leading to register accesses while
the device is not powered.

Move runtime PM acquisition to qcom_geni_serial_startup() and release it
to qcom_geni_serial_shutdown(). Since startup() can return an error, PM
resume failures are now detected and propagated before any hardware
initialization is performed. The startup/shutdown pair also provides a
natural place to balance runtime PM references for normal port usage.

During probe, uart_add_one_port() may configure the port before any user
opens the TTY, meaning startup() has not yet been called. To keep the
hardware powered during port registration, wrap uart_add_one_port() with
PM_RUNTIME_ACQUIRE_IF_ENABLED() and PM_RUNTIME_ACQUIRE_ERR(). This
ensures the device is resumed for the duration of registration and that
the runtime PM reference is automatically released afterwards.

By moving runtime PM handling out of uart_ops.pm, resume failures are no
longer silently ignored and all hardware accesses are guaranteed to
occur while the device is powered.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7ead87b4eb65..e16a31b5dc32 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1178,6 +1178,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 
 	qcom_geni_serial_cancel_tx_cmd(uport);
 	uart_port_unlock_irq(uport);
+
+	pm_runtime_put_sync(uport->dev);
 }
 
 static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
@@ -1246,10 +1248,18 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 	int ret;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
+	ret = pm_runtime_resume_and_get(uport->dev);
+	if (ret < 0) {
+		dev_err(uport->dev, "Failed to resume and get %d\n", ret);
+		return ret;
+	}
+
 	if (!port->setup) {
 		ret = qcom_geni_serial_port_setup(uport);
-		if (ret)
+		if (ret) {
+			pm_runtime_put_sync(uport->dev);
 			return ret;
+		}
 	}
 
 	uart_port_lock_irq(uport);
@@ -1724,22 +1734,6 @@ static int geni_serial_resource_init(struct uart_port *uport)
 	return 0;
 }
 
-static void qcom_geni_serial_pm(struct uart_port *uport,
-		unsigned int new_state, unsigned int old_state)
-{
-
-	/* If we've never been called, treat it as off */
-	if (old_state == UART_PM_STATE_UNDEFINED)
-		old_state = UART_PM_STATE_OFF;
-
-	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		pm_runtime_resume_and_get(uport->dev);
-	else if (new_state == UART_PM_STATE_OFF &&
-		 old_state == UART_PM_STATE_ON)
-		pm_runtime_put_sync(uport->dev);
-
-}
-
 /**
  * qcom_geni_rs485_config - Configure RS485 settings for the UART port
  * @uport: Pointer to the UART port structure
@@ -1778,7 +1772,6 @@ static const struct uart_ops qcom_geni_console_pops = {
 	.poll_put_char	= qcom_geni_serial_poll_put_char,
 	.poll_init = qcom_geni_serial_poll_init,
 #endif
-	.pm = qcom_geni_serial_pm,
 };
 
 static const struct uart_ops qcom_geni_uart_pops = {
@@ -1795,7 +1788,6 @@ static const struct uart_ops qcom_geni_uart_pops = {
 	.type = qcom_geni_serial_get_type,
 	.set_mctrl = qcom_geni_serial_set_mctrl,
 	.get_mctrl = qcom_geni_serial_get_mctrl,
-	.pm = qcom_geni_serial_pm,
 };
 
 static int qcom_geni_serial_probe(struct platform_device *pdev)
@@ -1921,6 +1913,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	devm_pm_runtime_enable(port->se.dev);
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(uport->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0) {
+		dev_err(uport->dev, "Failed to resume and get %d\n", ret);
+		goto error;
+	}
+
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
 		goto error;

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260709-remove_uart_change_state-a1f7e783aeb0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


