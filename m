Return-Path: <linux-arm-msm+bounces-96581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHX5Mcztr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:09:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E806249223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315A931BB2DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA3A36897E;
	Tue, 10 Mar 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eZ5MAP7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bgho/XHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C744E044
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137045; cv=none; b=WIg08IprLLHkAaYuT1/LUW59vQs+ICtwy3RkOLQtFb1KGF3Cl90fP7ziHf9T/2BqACzJYJQOpCxHSAo6bVdWek9hEix9+1r94iq9Bm2M4k4SPdT5K2LoTqtZDhftcMrEJhVkrNJAZHOXao9TkUSlWTBMBs66al7UJtj3rY4e87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137045; c=relaxed/simple;
	bh=t9eMrUtXNmy/fY4ijryz8rWuZqpKMZesRaQNHKoo6RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUE4ejT107PDi6kdu+s48OyfGJX903Fc51sw+DVvRmzts+GSmkmZsoQqd0WiN06ds+UKpNpuYwdL9HJEWwn1yUHezczHnhwa5OL0e4hI2lpiJ/PkOPOk4AZW8r1bmF+6C1TNnZne44gN95Nq5eNFyCfsrZgWdGBhnV4pH6uRbjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eZ5MAP7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bgho/XHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VLln2021379
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUBswidzoqbPNal7luIOGx1YD2irRnbNMuEgZlRAQyM=; b=eZ5MAP7jFuMP6DxZ
	xecT2sROpo/e0f4tLdNHSIC0T/EcJ9A4dOPxeRspoFxtuvkvJktuBt9ybW3G9WKi
	fnEuY6AZ9GFi3lvZ7HCwIFfhOw1NS3Aveu5OonofV8RyMPYyGGZLJr2VtkGL1e3b
	oKbEMrOTEY1Lyhj9SWn0z3JWA3hQdsU2X8R4vvZu4DVkJgcunkgcXjIHfON5dfet
	Ga1edBb1vr+dWA9ShdBZIvmNsK0M4SsxLY5W1ryMDHZ2RdEnxCClakvXsdjFnWcT
	05ie/UZZHOKdeMjzyFTOzRVV546kB0WUy/y4sccKiWCPaiReAxZew7MJLlFOBz0r
	j6KJFA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w8rvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:04:01 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d753cb3174so10511450a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137041; x=1773741841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUBswidzoqbPNal7luIOGx1YD2irRnbNMuEgZlRAQyM=;
        b=Bgho/XHau8lY+PcjL4gJ7HVvKaJFyZqG9T4Qm43JEgHYnPYlHdim3q3HsVnZ8kW/0Z
         yTVU3SLQRfwrLDKMFgVt5Muz7irRz0lVaMLXgTo/jVqyKlFsktBUwS8F7ighWtUEHelW
         F8PQKjWb4/vIEART4e17WZVSpEjKwM7N+gjcUc29xTiOtjFyH6vgumxkr3c5uXNkydfp
         kdStiJtOxuKaxjM9WpFYHeb39HKJ+pC3CGmgomMrtD71Was05dtl6IEmKngYpJnW/D6b
         QLdT0CWTG1t6OQ/TVx/EDmwRkpp4nTCZDcZcag8wt3PsbscCVmDzyKC+9Y3tTYKXfvYw
         EmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137041; x=1773741841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wUBswidzoqbPNal7luIOGx1YD2irRnbNMuEgZlRAQyM=;
        b=En73M2ClkFzJ8Wa7yVFfMtZaEI+rNwdpWps+LPVX0eTL6qYYL3bdbniLV88LSFQ4Bt
         5XdPMv3tsMZ898Jo856h8fZzR0JotXphNRsg+hUXd6sctKox9qOYl7vVhfY7G5g5LxWP
         nroj/yhDPRt4z2YiPdz9rOZPKA3B9ddDxUU7JLim0uRfw1HyripJ/dkcG7zIg34hQP2A
         c+YZ7xKhlEUPCjLH5XBICEQKj/3I9ozrer8K2TEeZBpZqVqd9U38ESm/qVhaBIJywgB7
         GcUtSrZxeai5evPxSqqfzIdZSiDJgLY0NEWW5xeTDBgD4AykcKUAR5kqW3tU+wxKjB42
         A7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWNvCwLzpRBN98kfxhCScTJy2gjL6CRfZV6fbgQ0mjH0SJ67S71dNLBHyiaWDB6w5UBXJQaTVBAy5Pefzcg@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsVXD4eru/pPvu4AMQA4wxTzPIRXPQWNxGBauuZVLFT1govhi
	t4Cau5O+E/ZdrG0QkaIEQ/8ZbdZiHdSMfuT0L1g6xNSyXQxUrqegQzFQg+w8XiqhqAfWZJDHYp4
	IBurBZI+nipUsTSZacBwaE/w0MNUp5e+8Te7TY13m8Z/0HDHjc9/Zcacx3l82MMpWk5Kc
X-Gm-Gg: ATEYQzz+xPH5RqqqpU9XFqFq54v7Ebg1qZOFK8D7ieL8H9rENe5WbVcBc5t+zV1YjmG
	g0hZ9fmrNfq/Kv/78K5ySO1XREZefNwdm/hwYgEq5cWOPTTj3+BDtBsPE4E750aY8MbRzPDNLP0
	xSl6j5irGjy8lNG/7Tc/O2h8tUyLkg3ZHV4EnVdFrl9ykGU4Z8BhuLynxQK96JmcGnfy5FFA/g9
	TcmpEBCHxfCKJJpNeFpj88AvmByZakef+feLGfjCZ35Bzes/4lZZzb38v/CSuDQ1UhWPRpvpTic
	R4nvt/wfjfdY+QG+UMKhzXvSR+AD+qYr6yvzSPsSg34mU2dxiS1Y0b+nlxVzHAWTGxH3+AWKSP/
	QYCh4sVPtgnpxXGIfOQc6dccn3uLuo8k1ZlToGxlKsF6v3zyGZZHKAb8Chu3IO7zG5wHrHEfu
X-Received: by 2002:a05:6830:6b09:b0:7d7:4f9d:54a7 with SMTP id 46e09a7af769-7d74f9d639cmr3967060a34.28.1773137040636;
        Tue, 10 Mar 2026 03:04:00 -0700 (PDT)
X-Received: by 2002:a05:6830:6b09:b0:7d7:4f9d:54a7 with SMTP id 46e09a7af769-7d74f9d639cmr3967043a34.28.1773137040197;
        Tue, 10 Mar 2026 03:04:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:59 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:22 -0700
Subject: [PATCH v4 6/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-6-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=14277;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=9ih3y25HTDZ5f154MkriFpwHfDjyiSzVp5js9La0Zo0=;
 b=yoj8wg2JjGdYR0r/OEEut4aFo2A8ewCCtrzuQHglbvp+3ANX4deqhQpxNfBvIlP8pqJ1z83hY
 qEeY+rO5748B5is0AFqTZa1F/qsIprOaKzUbr0xajaWFF5ZR6FkvI7W
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX6NI3bwxQ5+5A
 rZL9+Go7olY62T+/nZ5UQhMnoX3OUPzJAC2UImZ1yvRXCz78vJY7j+grYqFwNNdb7MBNUPwnbCe
 LUZhSnFm9hYR6Jg0r58nvsYxfCoaKAUpojlGv09k5hztEWwkx3gnn622LpfAqOGpu5x/zj1dN59
 NNcf2fte+0gabWNk7yE/NTKjlFsufMZXv9nCgTA67EjXDyPHes16BbmsLRGFPK/4ZNn/anacvrD
 mhc4Leuq3YZvdcIwGFu+vuO7vrMKlnC6OEBnMD0rkudGR8boaHIV0DDFZwlltq+GJ4QHtcjpFEe
 uurxp5tH8gegh/gtHrXJ/sSYuJRTT+I8DCHUNDG8rtQ4spB/CQtmdZpGSFsi9BbYxW8oJODSE9C
 7yv+IgHEqsNOhN2YvjX/SU193zQTRqOn9e5Ml+jyxUkNsVmnVyV3pP4fBS/ehlqkJnkvDyIZRhO
 siQMwjTneYIZ7xv4+6A==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afec91 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=x8meLMyhUKYFESlZP2wA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: YP7KDmnPqECzR9AFnBR4ykKcNlw3_ukf
X-Proofpoint-GUID: YP7KDmnPqECzR9AFnBR4ykKcNlw3_ukf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: 5E806249223
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96581-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

Subsystems can be brought out of reset by entities such as bootloaders.
As the irq enablement could be later than subsystem bring up, the state
of subsystem should be checked by reading SMP2P bits and performing ping
test.

A new qcom_pas_attach() function is introduced. if a crash state is
detected for the subsystem, rproc_report_crash() is called. If the
subsystem is ready either at the first check or within a 5-second timeout
and the ping is successful, it will be marked as "attached". The ready
state could be set by either ready interrupt or handover interrupt.

If "early_boot" is set by kernel but "subsys_booted" is not completed
within the timeout, It could be the early boot feature is not supported
by other entities. In this case, the state will be marked as RPROC_OFFLINE
so that the PAS driver can load the firmware and start the remoteproc. As
the running state is set once attach function is called, the watchdog or
fatal interrupt received can be handled correctly.

Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c      |  88 +++++++++++++++++++++++++++++-
 drivers/remoteproc/qcom_q6v5.h      |  17 +++++-
 drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  | 103 ++++++++++++++++++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
 6 files changed, 204 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..abfe3aa71042 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -20,6 +20,7 @@
 
 #define Q6V5_LOAD_STATE_MSG_LEN	64
 #define Q6V5_PANIC_DELAY_MS	200
+#define Q6V5_PING_TIMEOUT_MS	500
 
 static int q6v5_load_state_toggle(struct qcom_q6v5 *q6v5, bool enable)
 {
@@ -94,6 +95,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
 	if (!q6v5->running) {
 		complete(&q6v5->stop_done);
@@ -118,6 +122,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
 	size_t len;
 	char *msg;
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	if (!q6v5->running)
 		return IRQ_HANDLED;
 
@@ -139,6 +146,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
 
 	complete(&q6v5->start_done);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	return IRQ_HANDLED;
 }
 
@@ -172,6 +182,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
 	if (q6v5->handover)
 		q6v5->handover(q6v5);
 
+	if (q6v5->early_boot)
+		complete(&q6v5->subsys_booted);
+
 	icc_set_bw(q6v5->path, 0, 0);
 
 	q6v5->handover_issued = true;
@@ -234,6 +247,74 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
 
+static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
+{
+	struct qcom_q6v5 *q6v5 = data;
+
+	complete(&q6v5->ping_done);
+
+	return IRQ_HANDLED;
+}
+
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
+{
+	int ret;
+	int ping_failed = 0;
+
+	reinit_completion(&q6v5->ping_done);
+
+	/* Set master kernel Ping bit */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state,
+					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to update ping bits\n");
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(Q6V5_PING_TIMEOUT_MS));
+	if (!ret) {
+		ping_failed = -ETIMEDOUT;
+		dev_err(q6v5->dev, "Failed to get back pong\n");
+	}
+
+	/* Clear ping bit master kernel */
+	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
+	if (ret) {
+		dev_err(q6v5->dev, "Failed to clear master kernel bits\n");
+		return ret;
+	}
+
+	return ping_failed;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
+
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
+{
+	int ret = -ENODEV;
+
+	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
+	if (IS_ERR(q6v5->ping_state)) {
+		dev_err(&pdev->dev, "Failed to acquire smem state %ld\n",
+			PTR_ERR(q6v5->ping_state));
+		return PTR_ERR(q6v5->ping_state);
+	}
+
+	init_completion(&q6v5->ping_done);
+
+	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
+	if (q6v5->pong_irq < 0)
+		return q6v5->pong_irq;
+
+	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
+					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					"q6v5 pong", q6v5);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to acquire pong IRQ\n");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
@@ -242,12 +323,13 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
  * @crash_reason: SMEM id for crash reason string, or 0 if none
  * @load_state: load state resource string
  * @handover:	function to be called when proxy resources should be released
+ * @early_boot:	true if the subsystem should be brought up by the bootloader
  *
  * Return: 0 on success, negative errno on failure
  */
 int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 		   struct rproc *rproc, int crash_reason, const char *load_state,
-		   void (*handover)(struct qcom_q6v5 *q6v5))
+		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
 {
 	int ret;
 
@@ -255,10 +337,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	q6v5->dev = &pdev->dev;
 	q6v5->crash_reason = crash_reason;
 	q6v5->handover = handover;
+	q6v5->early_boot = early_boot;
 
 	init_completion(&q6v5->start_done);
 	init_completion(&q6v5->stop_done);
 
+	if (early_boot)
+		init_completion(&q6v5->subsys_booted);
+
 	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
 	if (q6v5->wdog_irq < 0)
 		return q6v5->wdog_irq;
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 5a859c41896e..69574a211710 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -17,22 +17,27 @@ struct qcom_q6v5 {
 	struct rproc *rproc;
 
 	struct qcom_smem_state *state;
+	struct qcom_smem_state *ping_state;
 	struct qmp *qmp;
 
 	struct icc_path *path;
 
 	unsigned stop_bit;
+	unsigned int ping_bit;
 
 	int wdog_irq;
 	int fatal_irq;
 	int ready_irq;
 	int handover_irq;
 	int stop_irq;
+	int pong_irq;
 
 	bool handover_issued;
 
 	struct completion start_done;
 	struct completion stop_done;
+	struct completion subsys_booted;
+	struct completion ping_done;
 
 	int crash_reason;
 
@@ -40,10 +45,16 @@ struct qcom_q6v5 {
 
 	const char *load_state;
 	void (*handover)(struct qcom_q6v5 *q6v5);
+
+	bool early_boot;
 };
 
-int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
-		   struct rproc *rproc, int crash_reason, const char *load_state,
+int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
+		   struct platform_device *pdev,
+		   struct rproc *rproc,
+		   int crash_reason,
+		   const char *load_state,
+		   bool early_boot,
 		   void (*handover)(struct qcom_q6v5 *q6v5));
 void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
 
@@ -52,5 +63,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
 unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
+int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
 
 #endif
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..15b3cdf8c157 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -712,7 +712,7 @@ static int adsp_probe(struct platform_device *pdev)
 		goto disable_pm;
 
 	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_adsp_pil_handover);
+			     desc->load_state, false, qcom_adsp_pil_handover);
 	if (ret)
 		goto disable_pm;
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 4e9eb5bd11fa..99d48d48c37f 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2181,7 +2181,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
-			     qcom_msa_handover);
+			     false, qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..4700d111e058 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -36,6 +36,8 @@
 
 #define MAX_ASSIGN_COUNT 3
 
+#define EARLY_ATTACH_TIMEOUT_MS 5000
+
 struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
@@ -60,6 +62,7 @@ struct qcom_pas_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+	bool early_boot;
 };
 
 struct qcom_pas {
@@ -423,13 +426,21 @@ static int qcom_pas_stop(struct rproc *rproc)
 
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 
-	handover = qcom_q6v5_unprepare(&pas->q6v5);
-	if (handover)
-		qcom_pas_handover(&pas->q6v5);
+	/*
+	 * qcom_q6v5_prepare is not called in qcom_pas_attach, skip unprepare to
+	 * avoid mismatch.
+	 */
+	if (pas->rproc->state != RPROC_ATTACHED) {
+		handover = qcom_q6v5_unprepare(&pas->q6v5);
+		if (handover)
+			qcom_pas_handover(&pas->q6v5);
+	}
 
 	if (pas->smem_host_id)
 		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
 
+	pas->q6v5.early_boot = false;
+
 	return ret;
 }
 
@@ -510,6 +521,80 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static int qcom_pas_attach(struct rproc *rproc)
+{
+	int ret;
+	struct qcom_pas *pas = rproc->priv;
+	bool ready_state;
+	bool crash_state;
+
+	pas->q6v5.running = true;
+	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
+				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
+
+	if (!ret && crash_state) {
+		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		ret = -EINVAL;
+		goto disable_running;
+	}
+
+	if (!ret)
+		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+	/*
+	 * smp2p allocate irq entry can be delayed, irq_get_irqchip_state will get -ENODEV,
+	 * the 5 seconds timeout is set to wait for this, after the entry is allocated, smp2p
+	 * will call the qcom_smp2p_intr and complete the timeout in the ISR.
+	 */
+	if (unlikely(ret == -ENODEV) || unlikely(!ready_state)) {
+		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
+						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
+
+		/*
+		 * The bootloader may not support early boot, mark the state as
+		 * RPROC_OFFLINE so that the PAS driver can load the firmware and
+		 * start the remoteproc.
+		 */
+		if (!ret) {
+			dev_err(pas->dev, "Timeout on waiting for subsystem interrupt\n");
+			pas->rproc->state = RPROC_OFFLINE;
+			ret = -ETIMEDOUT;
+			goto disable_running;
+		}
+
+		/* Only ping the subsystem if ready_state is set */
+		ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
+					    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
+
+		if (ret)
+			goto disable_running;
+
+		if (!ready_state) {
+			ret = -EINVAL;
+			goto disable_running;
+		}
+	}
+
+	ret = qcom_q6v5_ping_subsystem(&pas->q6v5);
+
+	if (ret) {
+		dev_err(pas->dev, "Failed to ping subsystem, assuming device crashed\n");
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
+		goto disable_running;
+	}
+
+	pas->q6v5.handover_issued = true;
+
+	return 0;
+
+disable_running:
+	pas->q6v5.running = false;
+
+	return ret;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -518,6 +603,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.attach = qcom_pas_attach,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -823,7 +909,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->proxy_pd_count = ret;
 
 	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
-			     desc->load_state, qcom_pas_handover);
+			     desc->load_state, desc->early_boot, qcom_pas_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
@@ -855,6 +941,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+
+	if (pas->q6v5.early_boot) {
+		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
+		if (ret)
+			dev_warn(&pdev->dev, "Falling back to firmware load\n");
+		else
+			pas->rproc->state = RPROC_DETACHED;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index c27200159a88..859141589ed7 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -1011,7 +1011,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem, NULL, false, NULL);
 	if (ret)
 		return ret;
 

-- 
2.25.1


