Return-Path: <linux-arm-msm+bounces-105309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N2+Itoe82kvxQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:20:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2227E49FC64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D4AB3004923
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EDA39FCD8;
	Thu, 30 Apr 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+VnZ4oz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAp1kCLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1ED39F19E
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540824; cv=none; b=Uu69KwoDfDw4gbDHi0JtdxB6WTlGpDB4tEoU5Ze9145pY2pgjgGPYpU7QSdThi/gDT7BD2BWLDDg3EwCrcSN15n8z0LqY6+bw9H/20jEOSxXI6mIcF9yy7KEzdJENbWnE/9PzK2p67B6BtUeBfkHaA6i5RztQrZVt4j4kdvzCqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540824; c=relaxed/simple;
	bh=XwmKwV05/7a1r/S2gniOB8WhpFrj9SJSwlH+8tfTslA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MmFPpLj82Oe9nJwk7e4c5tparT+Xx6qIzL7qKalHi8JbpY1NhsTWRV/1bs6A38Vdx8aiN2Fv6JsDFTXBMdM72teYc6JKfVxn5/9LVEbLg7/f/gGYVIrnK8sL9ZFySLH87EpuT3WDL8LTi3PUBVqvZjLjuFrPOvySKybJEl+19BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+VnZ4oz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAp1kCLd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U62XI83993224
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mIi3R6o1NfGbkbBGdhQvAo
	g6QMEwWJyHFwmk2yv/pDs=; b=E+VnZ4oztc2BiECqLy7qsPIF0XZKSoCn8Ly3Xw
	o6aghIRy7pwwr5Dt8shcgogMGPFJrLefsB00wspxpjyFHSigqPeCErM9Yca4YM2t
	hSUAMTvecGrS6bcKbIb5TepcLCo27BGbRvTdE4Ju4+sWl5ANaKkUqDLM72PD2nBV
	Vl+YxVCPmbVJsbtNxEwnYqFO/knCW5LX08/7DiqioWW/G5rSmXHCPKSix9f1U9zi
	+wHTbEO7BuLDq0vMJ1MCSLqJjiyKbfy27oqu1UtsMkuFyiCyhZGnx5HmL19mtswv
	wsud1b/nLOSa8cY9OIigM0k8SFsdvWsIP0lgGa/EU/s8YOTg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx945jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 09:20:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so447190a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777540822; x=1778145622; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mIi3R6o1NfGbkbBGdhQvAog6QMEwWJyHFwmk2yv/pDs=;
        b=cAp1kCLdJVHHTEcvrr7dHYSuFcM0INhA1qQg8A2+9xlPozEjALJZ+5V1GCe3D85VXz
         PYNv+28wmnex0TIvGKrH3KxXOpZsIR0VIa7rIXxJAArSp/V/fHMQtt7F9TA75RaNdTu4
         nw8XpXoUFzhWkgl78aKXEulEiluGjxTth2D3frJ1lEwRk7ibuWfh/0FwZrAMLv2+KxwC
         lp4jPeX/xQcWEpA7onbZUMQFpt9p4Xs9iHjpTzKwzXFDpu96WCwpCdfNGeTqW3/7YSc6
         gqhu3+ZCGDE+WKOjtQ/Yq6AwvbGDcc8HsT8GBFSLMV+9tMU8eLCSV0PZg7QZC85zdjY8
         DQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540822; x=1778145622;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIi3R6o1NfGbkbBGdhQvAog6QMEwWJyHFwmk2yv/pDs=;
        b=fsVAUyae3bzO5slzYEFVEa4fO/EyRYydlZcuPzg6flYUdZH33u8Yo9rsuTvF5CjagO
         eDUSm+/5atMb0i7OaeYnbTcdWYlpjUM/b6CzrYW9J2CRvrYpz/DwsMVxuq4nCUquepur
         aC9HoR7lfgLLKXampsaiAlwmgxEwoDoqOQwZvVzVOVbcp8+ebu3PmSzW/zqMjbXzQt5x
         BcGdRRRk8sOyKYChDhmutlmoi8LyZbqKx5A8/S8nE8IpLjvlzR4eAa6TdqlRsnhIK+Cu
         HVoMclHfBrSCm+fAKan4swcrf0d0oo7r23ICUAWYCRQnmawVr3JbcTpUe6xpkd3SBOHU
         d3fw==
X-Gm-Message-State: AOJu0YwvHEPfe8GRVBOi8pYgaTEoBab74yjl3O1EAUUXHjRFpMksWYWV
	T990n4Fv6fxPellHyM09no8HwEiRAOcETI0iBJgNkL1n4L4FDx5zWwCg1SHJsWC77zMW1phv71p
	lpHvufJefFuKZE7KWBVRQGFoGpvvPTmcWlpduAPijQ2oyVk2eZbIe8nTaxy6Lr1AyGiE8
X-Gm-Gg: AeBDiescoWBVwox3cXylIWVV5cmpP/6tO+P5hDeZ0XnM1vtx20a9T5Ek49IShzpJfEH
	fumDpEDC8VtagYgMswyC8XpTz9AAM+Sugr8+w96MPn0ZwByCnJR/G4mr4GsY8wJzX6kSX08Till
	0MEDpLbrSaQPPY5gBOfcLlQBUvXgC6kuW3hhQSqNG8h7HIFwKzmUsVDSFCVAUM5oR6srvN6Be8i
	Y3LcOUrjBUBbDfiq6SPePPcJ31cgPCNjGAlPXS/hzvLN61yi9wFBj1cnXdSkzyyJB+tbkuj3xK1
	Q+sDQhasnDe73i3qYD6FnR1YmqX192POU7dtQtpO4zU7dbXSYFQa/oRFsR4XJ+9gkJ/ditv8UIV
	LEq6SiZ6MHdyv2AkoKMDx89CSFvMBleTx7ACYeW69KVf5IsmrfH1yZ5sRjU0SAA==
X-Received: by 2002:a05:6300:218d:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3a3d1d55597mr1785712637.9.1777540821926;
        Thu, 30 Apr 2026 02:20:21 -0700 (PDT)
X-Received: by 2002:a05:6300:218d:b0:3a0:babd:b959 with SMTP id adf61e73a8af0-3a3d1d55597mr1785680637.9.1777540821432;
        Thu, 30 Apr 2026 02:20:21 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd5e6cf20sm4614782a12.3.2026.04.30.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:20:21 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:50:07 +0530
Subject: [PATCH v2] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-enable_wakeup_capable_gpios-v2-1-8c26ac795318@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMYe82kC/43NQQ6CMBCF4auQri0pBcGy8h6GkFIGmAi0dgQ1h
 LtbOYGbSb5Z/G9jBB6BWBltzMOKhHYOkKeImUHPPXBsg5kUMhdZKjjMuhmhfuk7LK422h3sHVr
 iplFZqjRcikKyUHAeOnwf9VsVPCA9rf8cY2vy+/7XXROe8HMLqWo6kQuVXS1R/Fj0aOw0xeGwa
 t/3L937jynNAAAA
X-Change-ID: 20260430-enable_wakeup_capable_gpios-cb9439ae8772
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777540818; l=2594;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=XwmKwV05/7a1r/S2gniOB8WhpFrj9SJSwlH+8tfTslA=;
 b=WVX7FhxPrdhNLQHigmRZMUFbQiF1TQw/jD3pKP3p01r/x9Ru+OtECwdzaF6TXT+Ty4WM6xUsy
 EKCmeBoEanoAAUW3MFheWslbkKB/PeXyt9YxiFl+04c8i28uwmCT0U4
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA5MiBTYWx0ZWRfX9YTBC5zuaDGq
 t3lBN6C2b7UvcEIFEBlsWI4cs+fOUGcjvuaUMczJHcTHf3d7GzmFlfneKzPri40/nP+W5Kmf6Rz
 6ISjEW7YuutyMLMOI2N3zZpAmwK+LCebubhvO1XCTm2vQicki79+HKYFNYP2DiX1yHzcKs8J0Dn
 E5t7SUiEUSXxJO2Mknc9QcYbLRS2BfZCVWXc03NCXdG3TylNqZImeLCvu9yxPCoIqJ/KxEbJiBp
 XlquSwXkJ0mQccjVt5igUj9K5h7/Mq4+5EeZNDLal9XWtrmWfUNm8TdxIWX9zZL+3P8aJ8CZJlN
 pizqkRUV3HprzN1BLkwy7mBiJMH0pTzIf4rj+cBQH7zfR8BgeRWHLR3CFTL1wvU4N++Mf2wyAOc
 1p6WJmFYW4u3grAc2TfAm7T3dXSEkD2FeK5lq1eCHERB+TNf6ApLSuK79cYqs/6bQzR/rTYdnc3
 vXBGLfWHSiTASO79YXQ==
X-Proofpoint-ORIG-GUID: PWZ-V6A0_sVB4xqarNAn5QKcdU97KFJ-
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f31ed6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=03pxqqae4PZ9oJ3FxUgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: PWZ-V6A0_sVB4xqarNAn5QKcdU97KFJ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300092
X-Rspamd-Queue-Id: 2227E49FC64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105309-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

The wakeup enable bit needs to be set irrespective of the SoC using PDC or
MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
to parent irqchip.

This is set only for PDC irqchip using additional check skip_wake_irqs
making it impossible for MPM irqchip to detect the GPIO interrupt during
SoC low power mode since for MPM irqchip the skip_wake_irqs is always
false.

Remove skip_wake_irqs condition when setting wakeup enable bit to allow
forwarding GPIO interrupts for SoCs using MPM irqchip too.

Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Modified comment to specify MPM HW as well.
- Spelling correction.
- Link to v1: https://lore.kernel.org/r/20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..6a24f9b5e4a979528ba6b5b87fd297c2783ec765 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1242,12 +1242,12 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 	/*
 	 * If the wakeup_enable bit is present and marked as available for the
 	 * requested GPIO, it should be enabled when the GPIO is marked as
-	 * wake irq in order to allow the interrupt event to be transfered to
-	 * the PDC HW.
+	 * wake irq in order to allow the interrupt event to be transferred to
+	 * the PDC/MPM HW.
 	 * While the name implies only the wakeup event, it's also required for
 	 * the interrupt event.
 	 */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -1275,7 +1275,7 @@ static void msm_gpio_irq_relres(struct irq_data *d)
 	unsigned long flags;
 
 	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
-	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
+	if (g->intr_wakeup_present_bit) {
 		u32 intr_cfg;
 
 		raw_spin_lock_irqsave(&pctrl->lock, flags);

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260430-enable_wakeup_capable_gpios-cb9439ae8772

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


