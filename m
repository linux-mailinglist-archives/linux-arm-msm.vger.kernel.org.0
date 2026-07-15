Return-Path: <linux-arm-msm+bounces-119141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2PduEPoLV2pkEgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21B75A74B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Xfd603fs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fP7g4ybW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54D483064F44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4F9392828;
	Wed, 15 Jul 2026 04:25:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41D3803C3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784089532; cv=none; b=uQUrALIgvvdKRNa7dw3VkvRnNABJIAySCM8mR1rb/I46U01lwnyYxh6XQgxPRwlRa52NRgfJ+By+dFfzVuiC+L8JV2TBMkfj0O65Q2hvl2CnEAnzi/J+q8O5pnJLTwTxlXVM1/07KQ5a5Hy0a5cznpbQG3Lz+aXKt8NG87iD4wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784089532; c=relaxed/simple;
	bh=M/jaYR7j9UthLpJUySZjlR5s6kZp/Ge02rMFeHjDwBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTipcnqs4xSDrwxJByYsXI5A+CZ0XtFXRQyu6TvIAojLyMdk0UyeFe+PO7k8MGT99+dVLqg9MSoefLlHQWZP7f2/jiNtfx/P5tHTjxydWrbRQ/+DthDFMTFmqbSMIP5aLpKml5dA7lV52/qWAtMgpWSMhADdnbarGfTiXdgwSds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xfd603fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fP7g4ybW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l4Nv2269540
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1P/fLkE6F8tcPrtF1OrZRY/cE4+HmmdGOkOOsEvtPs=; b=Xfd603fsO5J+2RZF
	/+XK3fa6ZkeNXhM7fcS0oMpoOconTk+Yh9CpO4HlcryUK6hoqjzr+63WXw3uXEVF
	kQ4qUXY3lcXrz6EYgq00MJHudFuk0Jpk0LzhRY2AXDi6il68KYMqfDlpPKtt01KN
	K9iitYVveutRP45pMNKws/j4ovg8jgQJXqoBreGVtYlMYtq0Xye5EiEhTZ5m9/zd
	dfWZaNzydcrcdqTrmoPpeQ4ZdchbQVn27chIwry0m4nc4PdrDSebDPoZrqCdUgwl
	xPay2eiZ6tpv3g7TjWBuH8/xqofyiWGGbcl82ZeFEsYUN6lKpAVNoQC+URJKNnWO
	Awu+WA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mhvdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:25:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc77a6943eso39710285ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784089530; x=1784694330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v1P/fLkE6F8tcPrtF1OrZRY/cE4+HmmdGOkOOsEvtPs=;
        b=fP7g4ybWEQhxIowIN7bmISSMJUnUlZlymvx1M04umeMuKL9+Tm1OfVGebW4HzTewEy
         DOmGkB1PDW9ljQr6BY/9xWHkrELiTXZcISd1YKgqDN7AKExJoHrhIq+ajNH+ewfoYujS
         fy4vt1LjufqjOqrU/ZrivR4WoNy4JO3DA8CG38FA8RJvLRa60qh3FssYaXO6CZbqHqSv
         gdmX+aXtzMJxUzFC2m0FgFKGLFcwHSN0dypVlX8NJ3lX2k1X4mzBbEtS7onZCMVj9srg
         OMOXNwKkHzTQVNPVlsqoR8JidUPKt/eY1KcPOclYnWEg2/LNVvfrschNjqFGl3Or4rqP
         tqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784089530; x=1784694330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1P/fLkE6F8tcPrtF1OrZRY/cE4+HmmdGOkOOsEvtPs=;
        b=oeRFIP3fWE//SvT3hsOTperTMhUj2yH7LLKyjak8Sf1yGqn4MfqrMQBjzhBXsxSJK4
         gj6gx7jWiRvG+mSKeeBA+x7Gu2uneJJeq8ZRzRiIYGinD/omfx0Mo0lJgK3Oq4aX5Pnb
         IwfyxjpkmZ53Rzbve8AI4ebdSPhSr57hZjLBodrVQAIpXlDlnP8ws5vPcsTr41+wmRNn
         J/9ENfN22k/RmiIji1ZJT+MqWqURDLw+9dK8vt2HMZl9sjjsatCZe1sdn15MUQGL47XK
         NAFWnvts5fEbZ7Vs9UIelEgA8C1P0cvUw6O7UwihI9C3m4qbvgylLqK8rHxdcmOnEscC
         oQoA==
X-Gm-Message-State: AOJu0YzcyRMWf/EUpg+8wwZITirMCJOBYKsFAG/FOrN2WHOSSFXKRolU
	/lTgawOuGbIzVk/3wROiSQt20UG/HVZ1leG+bwoQKVOtIVIOj/MVHGRYTeyll5JQO6K2Zly0edL
	B+d9hkmSdVi0S6GOzqpqDCDLRmvIjhXKtAqSQP1edd+bTusovmewzwyKcrCkbNRxQarOH
X-Gm-Gg: AfdE7clDM4Q4szudnZZeHXRHZ2V20zhCWEcF2aLjsC+rhv7e5Hd3C7P7PbITZI1kEyO
	DHzr3aTuS5qT84aNVRYkUVzLWQC/II71A+ue2Coh/cZJ5UzHSAztz+aj56LMsu47yV3sibt/G95
	JBKfQvEmx1oY8YI1ytx68KQuyg7aLyO9LNzBICx61IwPGgRRwku8w8/CUf9TRNlGFZ+ZaofSscd
	fFfqvDL22g3M5hr32bmiipULlv8+JYMhxAk1stfTp8Hcqr17+PFNThBrJtyiLF52RxJ3wgz/q67
	gQsVH3pN/rFhVZmXrHjn+ZDRa43JNz7AE8IDU6N8pq9fvVi6Q62YiHua57Cw2ra0zJ68j3uhBwl
	v7lYwb0rCoKHOqh2Pjx/MRJ4iiznX6Ig17bYHfbuaU4R5
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr18619319637.73.1784089529866;
        Tue, 14 Jul 2026 21:25:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr18619289637.73.1784089529346;
        Tue, 14 Jul 2026 21:25:29 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm62395491eec.24.2026.07.14.21.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 21:25:29 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:55:15 +0530
Subject: [PATCH 2/2] serial: qcom_geni: Add panic notifier to stop UART on
 panic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-add_shutdown_and_panic_notifier_serial-v1-2-23e3787c7109@oss.qualcomm.com>
References: <20260715-add_shutdown_and_panic_notifier_serial-v1-0-23e3787c7109@oss.qualcomm.com>
In-Reply-To: <20260715-add_shutdown_and_panic_notifier_serial-v1-0-23e3787c7109@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784089517; l=3135;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=M/jaYR7j9UthLpJUySZjlR5s6kZp/Ge02rMFeHjDwBA=;
 b=8/v4ddZSDsW1zK8ciIQ+OIndpi/sjAtfuGbO67QzviH8xwds6jf24ioUxJYxzAYiMatidSBfD
 Y79SMB9RDwDC9smhj5MUPklSlNiiAx7ITDz7gTbTg01pbpDkSxCpUOc
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAzNyBTYWx0ZWRfX8gPlUToEZwad
 aqIpzlVVMEBzsKdAQqVQftGMwO9fDuW7j6w5WFiATGHc258tSCPEWph9BP7LjRNAAKIvHp3iUn7
 5Db9bkO5vWOYCH0JFRpW6yX/enI/AYbUuKE/hMW/Zk29NASNLu7ywS1o0uYkLGl9gGEOwC0oEih
 Gmx3YVkx03BIH0KIQyD7HztdBhE7gPajgOrL5CWDXM7WVPD25XqBmnYUh9OiHaMtfgXF1Nkb+kJ
 j49te0xMuHNmhp7ZQ4+LxgJcsfonz35kVBlXCrKPIeUKjCxB3uWmHr87Y34/i9M24M/1K+QTcx7
 XXfi/dr0/Pkk2BSXiDonqntwixm7T6byf8aHUvkUuY/fHM0ipGp+u3ZBINWSfZvpE/0XLhoGBWz
 xukW4a87ABrEYbleDaEPx8BIVuEX8RC9LaEN5+IqmmruQLGS4Orl/JK4Bdt+ON9jldke+3WHXpf
 m/qoJF9VyBle8RDXi+w==
X-Proofpoint-ORIG-GUID: 1vwB60rj-rQmz2jUeT6O1H2Y9IoTOkht
X-Proofpoint-GUID: 1vwB60rj-rQmz2jUeT6O1H2Y9IoTOkht
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a570bba cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UOgn0oEsbzYv5hq0nPQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAzNyBTYWx0ZWRfX+WIKlWeXZn+J
 vQ17UKllilr/zavfb/Bl6uLYH2IENtUuXAVlDOEVJTQTs1K6rmw+j9Kkl3ivn0YRBCL++n0Hbsi
 uJ25JSUkufM1MkbrNaLLN5asL1dmgTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119141-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD21B75A74B

When a VM crashes with an active UART DMA transfer in progress, the
SMMU raises context faults as the DMA engine continues to access IOVAs
that are invalidated when the VM's memory context is torn down. These
faults can affect other VMs sharing the same SMMU instance and obscure
the root cause of the crash. Additionally, a stuck TX transfer on the
panic console UART can cause the panic handler to stall, dropping the
panic output.

Register a panic notifier to stop TX and RX. The notifier does not take
the port lock, since panic can be entered with the lock already held by
the interrupted context, and there is no safe way to detect that here;
instead, the device's runtime PM status is checked first so that TX/RX
are only stopped while the hardware is still clocked and accessible,
and the register accesses are skipped entirely once the device is
runtime suspended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 21ac2e3bad81..c4caea0aa6d1 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,6 +14,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/panic_notifier.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
@@ -151,6 +152,7 @@ struct qcom_geni_serial_port {
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
 	struct dev_pm_domain_list *pd_list;
+	struct notifier_block panic_nb;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1798,6 +1800,22 @@ static const struct uart_ops qcom_geni_uart_pops = {
 	.pm = qcom_geni_serial_pm,
 };
 
+static int qcom_geni_serial_panic_notifier(struct notifier_block *nb,
+					   unsigned long action, void *data)
+{
+	struct qcom_geni_serial_port *port =
+		container_of(nb, struct qcom_geni_serial_port, panic_nb);
+	struct uart_port *uport = &port->uport;
+
+	if (pm_runtime_status_suspended(uport->dev))
+		return NOTIFY_OK;
+
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
+
+	return NOTIFY_OK;
+}
+
 static int qcom_geni_serial_probe(struct platform_device *pdev)
 {
 	int ret = 0;
@@ -1925,6 +1943,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
+	port->panic_nb.notifier_call = qcom_geni_serial_panic_notifier;
+	atomic_notifier_chain_register(&panic_notifier_list, &port->panic_nb);
+
 	return 0;
 
 error:
@@ -1938,6 +1959,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	struct uart_port *uport = &port->uport;
 	struct uart_driver *drv = port->private_data.drv;
 
+	atomic_notifier_chain_unregister(&panic_notifier_list, &port->panic_nb);
+
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);

-- 
2.34.1


