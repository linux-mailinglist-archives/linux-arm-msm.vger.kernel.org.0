Return-Path: <linux-arm-msm+bounces-109981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P+TLaC/FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:55:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1384F5E23A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DD47302EEA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4663CF689;
	Wed, 27 May 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0rSf2ng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeJkPh3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C8364949
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875677; cv=none; b=nPjwy8ivcUa8jC2haycMbuZDsikfTp44RG+7fnk5mKhQQ8sP4D7HXCr2ghpa7zUp7FsF6wy5E2BiP3yxOplsNnn9ht2QTY2TyeifIaYA6d3gF7aTnuuPcRRUKmxOixTpISEwc4H1g3a21BiTHAXofj9UdepCoYIPgAny/ay7oaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875677; c=relaxed/simple;
	bh=tb5/H0LslZnS3HRhQoqQPR3vejzh4YM7LvQ//N+Fuhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fx2UhZc65trPH/j1doWM+MNvvogcSsNmNXuJT+7IYKh52KyMPZGWizPA62tIeF9NcAG8uwk4Lyt11pbuVodbuzY2G4CuVeyckWWfAYZ1DtckRhH9B5I332QScznHrhA1LmhdkwQ8exvEqXwAbMH0nugLmE6WAm8SvsiXbZwufgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0rSf2ng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeJkPh3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mS342282530
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IOit2QjvF8h
	uG7nkbzqEGas/yNmRSHLHcIvv89HxKwI=; b=B0rSf2ngsp+RV6UI1sX5YIWltOC
	O3RB0SSRPBHRNLSTEbDjuQsXbBOPPCzaI9VLrgs2FSbisA8dVEueCWaDPeDG6BEY
	N8lSSuhV6mrENje3BlGOeQX5nnsJA1szrHSif30KADZs9b30JPY9HG9gcnvhpKPZ
	ovSFVzSbLMVIP5KfyLTtAnlNDUhVE2Q/mjpXCwZna5E23zyqMJ1jquMN2z5wNjpM
	7z5aoTAHWZtgBEQmFr+BCPV6QLT94cgaizSe8SpG13CDmHJHzU35DbPIOH7TkwzN
	wIeqModkhVxHSZXLNsuYesULC/fOLEXIZNGsSiR229V9Kc0PVscmyqXGZIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcrwc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so16695785b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875674; x=1780480474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOit2QjvF8huG7nkbzqEGas/yNmRSHLHcIvv89HxKwI=;
        b=MeJkPh3Da0VboL7jdEPgudPVSgZ7+gC9hHyxJka/xU00fEcw+hApfyorORRbR74ufs
         cbl3xbmrqT+Nzyr05x0m9DO+k7porDaL1eGOvq5O8V6NNwUFcrnyJ5p8GZWcJ1Uqsu00
         ck8O1ElfguUv1s+WvWVRsWL3T8r9R0OpTsUehCtCaxx+q/a88r0IjhK6W839XICEKV0u
         Y+g+SpMDaS0KFWLCMeG1PFTarE+qbf9SXE5GOktfeawFEOzsfZNOgSsjY8l9Snf9/iyN
         gPqGFieltMsBTjiJaPGA13Ics7KyGyPUYQ5l1WhWRDnqkmWmn0U3jzi1N9zlJtiD8/ag
         /jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875674; x=1780480474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOit2QjvF8huG7nkbzqEGas/yNmRSHLHcIvv89HxKwI=;
        b=eFVRUaEahjhb02jz1GJ6+I23EC7DcTWOWsQfabBnGdK/d0JHgK+1oxqGuad1J/aKk7
         NCzpJO0JZehNuudEohi2kgIpo/KeH9Z1Yud0mJZHIOGXpKi4eok18bpIZsq0OsH4dLMQ
         j4TUYuEKiMG4v6wLVxkX3/1UnDF+bkhFxXeu6xH+CD1rlOT6caDYq3nqdLj1LvZEuEZZ
         EODpYPeEWu1C+/fX2BXVlPP3n6VASZemGkPlMeNadPAItVICjVpU93wrCIGetBAjFfKI
         rH/hBjJh0m+op0IxwYUmP67tTb0Lb26LdlZ6gVAGlq2agsuS61BPkcc+NgG4/h4BQLgm
         pSVg==
X-Gm-Message-State: AOJu0YxYnYTgLATcFWOzoHXRzKHo7zgZ1g9KySquBIG5O4hUyEWTFZUf
	0S9Vf7qP0DaGf9zCjhWmlVljU3/TYe0zV5ArqXKNp8A/MfCc6G0/WbdxWpObu9u5SOUeGab1PBR
	ZxnTZrAi/1CNhNiC5KDEDJbdyvvE3QGf3ayf2ilQQoEa9gu1kNsh6zG2Ha8GelL2uuOLrerxGAb
	u7
X-Gm-Gg: Acq92OHkiY5VnVigby1h5rHeV3942iEEeEga6F4NxKFx50oA9FNMqD3V2RmuSBA6z6l
	qCCcP6NCLl1gEG4azHwNOGzHa16QxnJ2yGAWmSLSV0XqxJYQDvljSMtfTqmtinRrnMRf/oZ8JH+
	OgadaKST1rTbab5w6sWDJ+NSP4RjnvkF25L6cgnVTsvwI6u7SHa2MDVgDzvFn5gBWP6D14kzX3W
	zbEl9H7lFE4dcTFy9gvI2Pun/wq9vRWL47j/8LANWSDAbQ4+TVIEspRdSbutwJaJ9ANyemLNdBu
	b67m5bqVJAL9PrwDH/3itxdh3MINObClfi+quClm3ENVcQz/8ND54vnOZeQtA5ojhw6rJHuW8H1
	5Q2OzZoVILdPMu/zXShFaSagRHgvBnDMjfrmZ1FQahv2nBk4O6R8uJfebZAo=
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr20120615b3a.13.1779875674310;
        Wed, 27 May 2026 02:54:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:298f:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-8415f3fcafdmr20120586b3a.13.1779875673796;
        Wed, 27 May 2026 02:54:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm1809325b3a.45.2026.05.27.02.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:54:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/4] irqchip/qcom-pdc: Split __pdc_enable_intr() into per-version helpers
Date: Wed, 27 May 2026 15:24:23 +0530
Message-ID: <20260527095426.2324504-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: X4BMGuazFVoeYZGm9US_Wmt5DVHWAseg
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a16bf5b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eikPim43zSuFQStimlMA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfX7euZqB+d9fFU
 /aD6C3ly0Mkate4wf235Eu0Dncv/hDzBoS1WW/QIjDu6xAknufxAHT29iL1m5Je9Z68mDStF3+o
 dfIfkq9k9gYiwVoBVKhclyz32yr4dXQKKAWvIy+8CUrlmfPeO/9CCd1CpRjebCWfQ7dSza7kpCc
 mIAF8+Vc3wEY7eWnBnkbHeheOTSz8h9oNT9g4bM0GziGiHAsEm0PKoV650j6rglqW01dbQ01hmp
 +QLtlz8fbXnPMnjPuf4KnDEWpXxuejft79cYHNfPKURMzH+m2lwT+p1ao2IS0TDBsObi5gG72mD
 Aeybll5FV+uAvn6/P9+WBYy+f5S7X5g2YfO1ESPaCC7x4D9I7Xdu5x6lQleLacdWGX+c/81E70l
 U+jP43i2wnPWylotcj5p/gzgrIvEviPLHbBIxzhuO20If4PKjPYXlqcfervPK0QunUEVkZ/C9DD
 Og3+Lk6Fn8Afg3/ZaDg==
X-Proofpoint-ORIG-GUID: X4BMGuazFVoeYZGm9US_Wmt5DVHWAseg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270095
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109981-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1384F5E23A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The __pdc_enable_intr() function contains a version branch that selects
between two distinct enable mechanisms: a bank-based IRQ_ENABLE_BANK
register for HW < 3.2, and a per-pin enable bit in IRQ_i_CFG for
HW >= 3.2. These two paths share no code and serve different hardware.

Split them into two focused static functions: pdc_enable_intr_bank()
for HW < 3.2 and pdc_enable_intr_cfg() for HW >= 3.2. No functional
change.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 42 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32b77fa93f73..a72e32896e64 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -97,28 +97,38 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
+static void pdc_enable_intr_bank(int pin_out, bool on)
 {
 	unsigned long enable;
+	u32 index, mask;
 
-	if (pdc_version < PDC_VERSION_3_2) {
-		u32 index, mask;
+	index = pin_out / 32;
+	mask = pin_out % 32;
 
-		index = pin_out / 32;
-		mask = pin_out % 32;
+	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
+	__assign_bit(mask, &enable, on);
 
-		enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
-		__assign_bit(mask, &enable, on);
+	if (pdc_x1e_quirk)
+		pdc_x1e_irq_enable_write(index, enable);
+	else
+		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+}
 
-		if (pdc_x1e_quirk)
-			pdc_x1e_irq_enable_write(index, enable);
-		else
-			pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
-	} else {
-		enable = pdc_reg_read(IRQ_i_CFG, pin_out);
-		__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
-		pdc_reg_write(IRQ_i_CFG, pin_out, enable);
-	}
+static void pdc_enable_intr_cfg(int pin_out, bool on)
+{
+	unsigned long enable;
+
+	enable = pdc_reg_read(IRQ_i_CFG, pin_out);
+	__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
+	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
+}
+
+static void __pdc_enable_intr(int pin_out, bool on)
+{
+	if (pdc_version < PDC_VERSION_3_2)
+		pdc_enable_intr_bank(pin_out, on);
+	else
+		pdc_enable_intr_cfg(pin_out, on);
 }
 
 static void pdc_enable_intr(struct irq_data *d, bool on)
-- 
2.53.0


