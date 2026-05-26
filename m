Return-Path: <linux-arm-msm+bounces-109776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPiEFjp8FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8829D5D4760
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73AC6300CF34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746313DE45F;
	Tue, 26 May 2026 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n90L1ha7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE2qierw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5293DDDA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792917; cv=none; b=ay8UosSYjp9j5SSdUiQCC5DGQQG9lfTBrXvi2XioIk4CxL3tvIPy52Y13m9kIwA7qBeigjbUULHwGHzVSThJpu7T68oh1jJG6VSkLity1VICZSZZDTd6ivTLIaCwSXsQzQc0BRwk3+PkLmozRJz4Ao6c6aFb89hH+MKb1/hhMCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792917; c=relaxed/simple;
	bh=oPVVerd8VwkRL0dCsp2to4ylu4kTf3679RMzqtne6Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwhFun73/1uRh4CDw4x0rSWkBQRrtn7CiWmxOJstB7I9xmPPd+oTBTSPgke2PHkIzweQZMPjp0KGB05qQM9/YEHnDBbgNezclgFGE12EN1LEHTszEBJ2/pJ16KWBvR/KvhYChEC2HePytfGPCPCBY41/Q4hO0nAvP01enHLmZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n90L1ha7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE2qierw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5e6V61802339
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=; b=n90L1ha7YGe6UtDL
	BnOhO90eLVl77DhUz+tsk2gArTDxqA/WKM4xXAjbRMtBMNZ5ENBeuvLRPLQVzgIA
	/DDV2Oz20jIvipth6gZo+0Ewua+hN8XPSdc45krkNXGFAeQNNhAiBkcnxjnpTRP0
	pRMOrEt4yJl1O+ZUWRZW7GNiJxICm3aJ4sN5VoSx2WPKpMKi50Y24zZTihadL1z0
	7rIeBw9ZCCwu+jr2sJ3RpTbEckxzU0hgTHZOe8Sq1lWx6scHOKjfpOwoygnRztNk
	J3bHUdF64jAApnsOTuNEKFLTwjcYcyPftHIVOWrS7tmdWDvOu4APa7Kw5FdGW1TR
	yrhU+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqmc74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b99eb06178so235900475ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792913; x=1780397713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=;
        b=LE2qierw2FN6i1xaL2uI5ryKi+N/RtMe1x7aVD59p3Oj/cK8tWaSG26CkmIFNHCH3y
         9TU2c04I4lk/+aeloGvVR+r+OAslIxp2me7kigjmkezIyqwhCzQwrlQ45rgcznqajCgG
         5NWqEqPsJUlp4Hjb8DQj74amm3/CZcfBUmm4ShOPKwNpGXLDdob8iM+qQBQ1w10h9ah1
         1RaWW2ZYkJ3gUoD66dYBuw7mLJCptxaIksXeeDqHJAuTZlqs7gs91B4+16mUwbp5DaWr
         Ja3jy1+f5QoQB0NUZ12k2lPn37VbVT0nasETR2maLaK8qsp4jGLS9FsQxLG0EvZqtKQs
         bbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792913; x=1780397713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NMDjZhVwWUDdO7pyrj0PM44BL0c/yKjHT0Nw2YFXwXE=;
        b=FYJuAhax3iIYo8HtkFsN5+HgLu4/AK60nymsyI5rotNXDcp6Ai+d3oWCnrwovphOjz
         QP/WFKywB7FBabAp2dwU5ZluZu1dwhOIAh0oKmSIhPe7CnQI6g9U+zPMLAlbHes7+gMy
         2ok1Fsp95iWmeYFAGeo1yN9ezHrCstBXke35elPVEMjP+LrEa1LV03+01I+8tm5rOVix
         hFqHnidzsSrFVS4Ad/bswcl7lMB+GgaszTb+7PnKVeukbD9fcKjH7xLFAjGcup/V66a5
         5glnNQxX+egdQuDWaOwdmNAr1ZgmX+CKKQxZiApDCo2CeaHitagLS/aLDCb/88djuyul
         YD3w==
X-Gm-Message-State: AOJu0YwRuBShXs9YJo/rxatww052as3cE20WB4z2KYgJX5g3tGuH3YcO
	C+ptmn0rl1h3EuUT0wpUGOo6KFS26x7Lvl/J3CsOQkIrwzDlRfum94KVIuZKJoVx4cbF1trWX+h
	03g1W8wRYEr3BO4TCL4vwxIBKJXKaTPsvy38hyiqIlbaXrpRcchQMRgz5tZ5nbiCxNIAZ
X-Gm-Gg: Acq92OHJXXSI5PUyD6liG711Hc4MApXtJgbqkgu4sa3Y8L//bP4ZuCl281BYKdr1vaF
	vj93A75fSHZlgkx2slXK8Uo9MJW5jxEhmT41hZpTSGlh4gWgaC2or7cqcsVZFXPqnwAqkkG3+o5
	391tqa62285bp6mIMtWu2Py+B0S54sM/2eE9Pu5XWUjPhJovnnbuULJYyJ7LW/DYj3RY/Q7N8Ef
	QkIyIsizBizF/X3UVdJ4PpxeE/e/iBqHHU3Q10kb7XjESLU/P1aq2RJbyvJRJlh/jWurS8j3t77
	IyUOhxvYmbr2lGfr//PyTheT4UlBb4rMx1pi5sd4k6L7mAHdPiTvOr6Uyp8nhHpJVhyFo3rZSok
	9ijQM2ibYOvbPGs7f8q/aekJZUxALKl/VqWVmeQR47mqiFNBTeQ==
X-Received: by 2002:a17:903:2f4f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2beb05d9d8emr205687215ad.25.1779792913363;
        Tue, 26 May 2026 03:55:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f4f:b0:2b4:5f69:715d with SMTP id d9443c01a7336-2beb05d9d8emr205686735ad.25.1779792912781;
        Tue, 26 May 2026 03:55:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:12 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:39 +0530
Subject: [PATCH v2 3/8] irqchip/qcom-pdc: Remove pdc_enable_intr() wrapper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-3-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=2309;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=oPVVerd8VwkRL0dCsp2to4ylu4kTf3679RMzqtne6Qw=;
 b=qbSAKqDqjMJ0a6D9aC5+ljyMg6nu5adn5PXk+hld7ZUJg+IDRj4FhKZumzXP1ByhnP5AaHSTU
 Kd0M6IBlU8CDzDlBrZQcawNhozyWbC0spHHefeiLQ0pQuk/Hu+77mZB
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a157c12 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Xxqy2RvYwch7BrGjxoAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: qEKvLOOCMnJngS8DAqNaMe818rzTE7yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX5SCq7lSPRUPE
 iXompSi/hYZxhy/iXssqEECh/YbRvoqsOqtGm+R0aAwqSkslVwAIGDL7nUFcMHD4YE9woVxVmzi
 cHjbHKkwk5Y4HCQ7YUGvg0B5LVJ4cn4LtDLKXX6J6948p/6rpf+FTs8NVfR4wg5PjmaI2KCZUOj
 4KOLcFHU/sipN55u2wynhGUdFEaaCfm1Sq0zwAjSqw81rImWcaBpRAGSKx6Z+HA7yD1wBCqSv5j
 BTPPF04cDA2wHwk8mkZ3fDOFsRLDrRW7NGHuAF5CJoee5o6V/GVj+i9Lu9CLwlN3MKA3VqwstV2
 LcWfBwJuROb2Ei7Lh4n4upYYzXfy+qh24BvzMW3hogTzCYjO7hx+ZTJkbzVqMUiNfVbHGxYpcye
 KYIjGrMHNuK51+hOexLUT921DhYC0WYzUj2JI4H9tFmmgI6alD33BsEiWcKPeSDgVis00R4RtMl
 eJR5sebKFntw/YourDQ==
X-Proofpoint-GUID: qEKvLOOCMnJngS8DAqNaMe818rzTE7yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109776-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8829D5D4760
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pdc->enable_intr() function already points to respective version
specific enable function. pdc_enable_intr() now only kept as wrapper.
Remove the wrapper and invoke pdc->enable_intr() from caller.

Locking in pdc_enable_intr() applies lock to all pdc->enable_intr()
however its only required for pdc_enable_intr_bank() which uses
a shared bank across all interrupts. pdc_enable_intr_cfg() do not
required locking as IRQ_CFG registers are one per interrupt. Move
locking accordingly.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 8f7802139e4e..db76737646e1 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -201,11 +201,14 @@ static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
 static void pdc_enable_intr_bank(int pin_out, bool on)
 {
 	unsigned long enable;
+	unsigned long flags;
 	u32 index, mask;
 
 	index = FIELD_GET(GENMASK(31, 5), pin_out);
 	mask = FIELD_GET(GENMASK(4, 0), pin_out);
 
+	raw_spin_lock_irqsave(&pdc->lock, flags);
+
 	enable = pdc_reg_read(pdc->regs->irq_en_reg, index);
 	__assign_bit(mask, &enable, on);
 
@@ -213,6 +216,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 		pdc_x1e_irq_enable_write(index, enable);
 	else
 		pdc_reg_write(pdc->regs->irq_en_reg, index, enable);
+
+	raw_spin_unlock_irqrestore(&pdc->lock, flags);
 }
 
 static void pdc_enable_intr_cfg(int pin_out, bool on)
@@ -227,24 +232,15 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(pdc->regs->irq_cfg_reg, pin_out, enable);
 }
 
-static void pdc_enable_intr(struct irq_data *d, bool on)
-{
-	unsigned long flags;
-
-	raw_spin_lock_irqsave(&pdc->lock, flags);
-	pdc->enable_intr(d->hwirq, on);
-	raw_spin_unlock_irqrestore(&pdc->lock, flags);
-}
-
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	pdc_enable_intr(d, false);
+	pdc->enable_intr(d->hwirq, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
+	pdc->enable_intr(d->hwirq, true);
 	irq_chip_enable_parent(d);
 }
 

-- 
2.43.0


