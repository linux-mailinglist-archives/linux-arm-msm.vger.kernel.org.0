Return-Path: <linux-arm-msm+bounces-118723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9cCLLq69VGrHqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D39749CFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pTWJDTsX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="XFcW/mmU";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118723-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118723-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 134C3302A7C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DB33EBF11;
	Mon, 13 Jul 2026 10:26:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBD3E92BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938387; cv=none; b=N8u0QtBPUPmGQvb3i6w124jah1Bu1/oTw0Z9ySxUphoDOsZmuOqeMf5tn8qGFKlFCwixX8cbUxjXvK3GzSnD2zWuKyPY3J2NfNnPoHElVx8e6jPXIDwI1YjDUVWOs5QVyPJOMwG7rAF37U+98QLGtGxM0QegOGH8h8Pf5RYC3aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938387; c=relaxed/simple;
	bh=uLoH9ML4xoEyk+JlPNhBQ9mrs8NyNN/05IZjbXRWkjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jMV1kDEeUhxh8O//VmjH88D1J5iTmjzTHN0E7PH73RxDhADHMDZw5/HJ7M7GfYPoTOqCiOsYEpi8CKv398jzU0TEO8O2IwU41Bt6MJ60ai7hNuEaQsIb3GPpRAeKBG3FEum/6WCFyCybBLeVt/dKOg0lDgu1KI606lHT0xJ8Qwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pTWJDTsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XFcW/mmU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Neh6731611
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=; b=pTWJDTsXBaUmBHKP
	nO7qmhwSy76xQYBI2PQjJtKLfvnmHUbfQoJf6RWeBPw3Pt9yWUNjzd2BInOmSBFg
	CIxYG4bUoz7PnASysY+WUqaRDcQICSnWF3fA+OH+KDhhGkc3z9Vz2XoxHne12O6a
	GzvwHz158stXceZIBz7OXk91cUfx4me8ugJY/dAQ88ARpMoC4sgz7GKHuASOErif
	YEGl8s41Rqcac2nHjkvdQmBEvbSvGmGz8UXxUld/xYngiOq7yaDLEad92oW9ShgO
	i0TymRDwXxNGITyD0YLA//STeUCBHVem7txa8yqShJv1vdOwTwcSG7gw2cg2LYCY
	l6+/Lg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a27u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso5123455a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938381; x=1784543181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=;
        b=XFcW/mmUYr1R2B7R55CH2gsbcoRFWr2lfYvzOJ3J/k7Bdapb249zzWYkOB4gWWWVf6
         VfCcAZe4ZamzWIgrHHlUqRzlJpzmHTYEHBDfmrR53f7MGGd5z0B9lHVTptkm5wWE3kEu
         D4baeVa4MoaqoLZ2TSLXkALnH7zrR5Q6j+w2cJ7K0loLqELsSCFIVbhP3/ZV0U9VWd6z
         xf9bnzzCoHkn6PtPHjIkBh072F4f9dpHnxfRWFPkSO6FrELj1yJn7ZFCyJDxXJbR/pzH
         2W0g2Za03j+hrUkHyufh4GaMGtyfswrOjz7O4kJlmXf+Vbipm7tkITvm2R/Jy4hTDteI
         R5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938381; x=1784543181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLsaqQqcvPq68co61oGckxg0SVVesE3Nua0OxWCKCZ4=;
        b=J5S3xqqBqtyr98qSHQTTJ01/kbP2leBSyHTJ5RnskxY1dJg9hIR4Jea6srUQAArjto
         a4TwswWUoR8GKGfXzCw5mWzpKQCo1FZCEP8Ck6LubLy2Lfga0UtSZh4ZD+cLQz6mbPcr
         4CRLFyKHIel2X8BqXKtej8e9Vcc71fKi+NHGnIVPpwz/JVa+4yRBJL10ztm5DD0NRCBE
         70v4t2zFSx6ZF4eH6HyWnFn1sJ2HIy6Ycon7gSxuAucfovVVjX529Oh5Sl0n/n5h03Rz
         An9YCtVTQw1WMkR/8Vwa8r8DNDFK7z/Zxyp4vt8PjDXLSf23v4Kb95k8dWfHMoTCSfd1
         /RZw==
X-Gm-Message-State: AOJu0Yzx21Mv0bvr+N3e3VB30U9/+ZOVTvU/E8oEEXaA1jm/3cYJPvWM
	K13TogDX0FN/I1FBo0eAHkibaPyVLFL9udGkNkxcNt4Iu0GVneAsbZ8iCn9h4tVetPdONo4brGL
	+02zU3bYPUbxATaEyPT9DVXUkn7jr3Zap149Sq/x0X9kgfqpyv+W62bUbVzfxeqXFByyU
X-Gm-Gg: AfdE7cmbf/2iurIrNbJ39S22UweCqm02CMxEcleQJ77FC7IyQkp3erTFKJG4xuHVHq8
	HhzlBcb0moXeZx7+e21i4xCKVV+Q7pw3lcI2l90jkRrfToYFuht7YFWTgJY5QWkgCcXO50y0Ec1
	KPLMZCKnM4P3I2LyI/oUzfyCkP9dPl1l/AVGGj2KwZdH8jXofj1U9QHXIO+iqHHLiueNQjfAThu
	Ggi1zJHQIDJi6iqE19DmDnWnG7B/CGZ2Fh2fFDvauSCOmV10lai+owxVPVY1BQPg5JN7ZcIn6wK
	uSbIhbEukmibPz4TfLnNTTCAFLkE5gP0QkIgGOVN24XyyfldfHtEPFbb1XFkrSEaBlZimh5G5F9
	Ree/OdQr57rMxRrOKrYl/AWGIjgTAYixB8hRHYHUF
X-Received: by 2002:a05:6a20:4322:b0:398:9379:d04d with SMTP id adf61e73a8af0-3c110a6e39fmr8192408637.24.1783938381337;
        Mon, 13 Jul 2026 03:26:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:398:9379:d04d with SMTP id adf61e73a8af0-3c110a6e39fmr8192384637.24.1783938380883;
        Mon, 13 Jul 2026 03:26:20 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:20 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:44 +0530
Subject: [PATCH 4/7] irqchip/irq-qcom-mpm: Program wakeup timer when CPU
 cluster goes to LPM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-4-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=3481;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=uLoH9ML4xoEyk+JlPNhBQ9mrs8NyNN/05IZjbXRWkjc=;
 b=sMuO9mLhY6GWDBg0jOsCEGp4lJzp0Gt2hYLVHKK8o8qkVXXyHhzXns+RDLbWWjMxgEqgBHo+1
 qLDerscoz30CvPE7o930ilYxc/14C6UDYRDRpCencsnuWAdVQZiShkq
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXwQly6QZ5hhAZ
 YzxI+fWRuucL64J5HKEr2UPPxp3aw0+IgPxB4xlWmnYZyQ8UOps9pY7g8ez1PvK6tydGhz2/j1R
 5norKZ5jy1NMReWhv3pM3TZDJmYL3KzgVby+wW259ZTta9sjSkjkjxHJeU6ymlmI2M5repSQ7J8
 1tuti+QLrkd2ig84/8mLUXISHrr+kjJ5H5axmGfRonqk7TAM/MEq4rdAen8pVjawZHeAm/N5Bt+
 TBS3pIbMF4QryJg75H0pcUwbW410BmmuuU86Qj5ndCOKLTaUGk2PQq5bkHUIyHqN2AfHJmXHrm/
 wCUx8aciPeK1yOhTc5LNNz2Vo0451GMn3RBOVdSgLP3oSMRPPUPWkRDYunvDuc5Vs3afbaTaOmK
 9E5UMjBblVm5PAXhMhY5JOwoFOLHiEqcqsmpcaxGibJQl5aaQtUjC1h2IQmfKFOXd04VX1HukUE
 nuBnwGcedRslKq3w3uw==
X-Proofpoint-ORIG-GUID: mtGTmxJWx9XDnRodLVkg9_WujFuZrtnc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX7cLZB+mjO7cR
 CI6f+yXbOY86SMR6/BKcVtSHVu5vjJD2cugkCMzNvd+Qgs+3FUMQmHMm9r8fWuGutZIuZeFwfdp
 pD8LFvhKTRN80zq/H+cn7LBsVd1PJc4=
X-Proofpoint-GUID: mtGTmxJWx9XDnRodLVkg9_WujFuZrtnc
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54bd4e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LbuWhw6SlANFRBx-Z0gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73D39749CFE

The next wakeup timer value needs to be set in MPM timer as the arch timer
interrupt can not wakeup the SoC if after the deepest CPUidle states the
SoC also enters deepest low power state.

To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
timer and the Resource Power Manager (RPM processor) takes care of setting
the timer in HW.

Add MPM timer programming when CPU cluster enters power collapse.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/irqchip/irq-qcom-mpm.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/irqchip/irq-qcom-mpm.c b/drivers/irqchip/irq-qcom-mpm.c
index 763eddee99dc4cdd5edab22ce54808528f9ef165..f43c4a1c35f78b6cdae194dc7ae88c5c307ada94 100644
--- a/drivers/irqchip/irq-qcom-mpm.c
+++ b/drivers/irqchip/irq-qcom-mpm.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
+#include <linux/ktime.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,6 +26,8 @@
 #include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
 
+#include <clocksource/arm_arch_timer.h>
+
 /*
  * This is the driver for Qualcomm MPM (MSM Power Manager) interrupt controller,
  * which is commonly found on Qualcomm SoCs built on the RPM architecture.
@@ -77,6 +80,13 @@ enum qcom_mpm_reg {
 	MPM_REG_STATUS,
 };
 
+#define USECS_TO_CYCLES(time_usecs)	xloops_to_cycles((time_usecs) * 0x10C7UL)
+
+static inline unsigned long xloops_to_cycles(u64 xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
 /* MPM pin map to GIC hwirq */
 struct mpm_gic_map {
 	int pin;
@@ -84,6 +94,7 @@ struct mpm_gic_map {
 };
 
 struct qcom_mpm_priv {
+	struct device *dev;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	struct mbox_client mbox_client;
@@ -320,6 +331,36 @@ static irqreturn_t qcom_mpm_handler(int irq, void *dev_id)
 	return ret;
 }
 
+static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
+{
+	ktime_t now, wakeup = KTIME_MAX;
+	u64 wakeup_us, wakeup_cycles = ~0;
+	u32 lo, hi;
+
+	/* Set highest time when system (timekeeping) is suspended */
+	if (system_state == SYSTEM_SUSPEND)
+		goto exit;
+
+	/* Find the relative wakeup in kernel time scale */
+	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);
+
+	/* Find the relative wakeup in kernel time scale */
+	now = ktime_get();
+	wakeup = ktime_sub(wakeup, now);
+	wakeup_us = ktime_to_us(wakeup);
+
+	/* Convert the wakeup to arch timer scale */
+	wakeup_cycles = USECS_TO_CYCLES(wakeup_us);
+	wakeup_cycles += arch_timer_read_counter();
+
+exit:
+	lo = wakeup_cycles;
+	hi = wakeup_cycles >> 32;
+
+	qcom_mpm_write(priv, MPM_REG_TIMER, 0, lo);
+	qcom_mpm_write(priv, MPM_REG_TIMER, 1, hi);
+}
+
 static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 {
 	int i, ret;
@@ -332,6 +373,7 @@ static int handle_rpm_notification(struct qcom_mpm_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	mpm_write_next_wakeup(priv);
 	mbox_client_txdone(priv->mbox_chan, 0);
 	return 0;
 }
@@ -412,6 +454,8 @@ static int qcom_mpm_probe(struct platform_device *pdev, struct device_node *pare
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
+
 	ret = of_property_read_u32(np, "qcom,mpm-pin-count", &pin_cnt);
 	if (ret) {
 		dev_err(dev, "failed to read qcom,mpm-pin-count: %d\n", ret);

-- 
2.34.1


