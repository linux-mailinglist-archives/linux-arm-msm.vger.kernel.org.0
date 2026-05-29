Return-Path: <linux-arm-msm+bounces-110229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FoYEnNKGWrzuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:12:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B45FF061
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C71230037F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA893368A7;
	Fri, 29 May 2026 08:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q81xpEDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBWZQ/Jx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955C26C3BD
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042159; cv=none; b=KMrdzFAlh7W1jRXLsvjkqIJQi2Nodzo+UUDBTalgdcN5KCiudcWcsTfSLkeGX941MpAaHMnikov4ndUmqsCyRNREzlFK1YuGUjn/liQ+1KUiSJgAExuySdZ9CLDEeSaiWH3GL2lLgiNInI/+2VDF0ANDywYU1CEuQo5fLWkC8rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042159; c=relaxed/simple;
	bh=N8hfsxpSiKl22KeegE3vYAhGOHOFOR0ac/DSaLY3BoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iqSVHQBPqlel4H//PLEXlmhnRfddy2z1+7zf+QzOwmYh3N96Hk59dayow0+9CfF0ERiywF8ooSOR2hb0n4W+qH7pgZosIWTUCpgSMiWlpP1qVQYO3PNr9pAQ0Ww2nxDoNaxPUpbplTV0OESJxQCd861Y4Uj/qD2TZV82tFfuSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q81xpEDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBWZQ/Jx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6NdNU1540487
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C1Jxgj5bloGFbb+wxjgm56
	VvWTxc0wnItMHSSsAedd4=; b=Q81xpEDKH1LulZJnw9B9wvFS3aK55ts7DlIakj
	cIHISARP8ZYj7jaI3fwhc2OpSrJsIZhFYR8It370KHtFHNsbiwWDByRDgHQtkP2Z
	WPedeXykxYR7fAvJqOROo8ldcwUmtoGajKI05PgaJYDA4+yjKzdTJv/jujLcE8vl
	lx9Wa23jhHW7nQeYsdUmf2nbLdL/Ss3TJ2IxS1aiXP9kwun62z/R7TnwnxvP/6Rt
	OefXYLhqRifUD7MfV95x02DVMU+rE4xER5sO4bCyLKKej2oFwYbQ7fO/ZV2/k15F
	JU+Qw6NFS0Tay7L3B51zUu/jyMcU5WtzpGy6woNRTXalQIjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4u1ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 08:09:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36b982ec338so1435067a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780042156; x=1780646956; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Jxgj5bloGFbb+wxjgm56VvWTxc0wnItMHSSsAedd4=;
        b=ZBWZQ/Jx/YaD+7QezjmWHvBkiNQBigL/EIk1il4hvAYfxMLQTrqtsXqWryMPQKyrz5
         q7xVb0+8qrY0g509NM/oJkU4pPXZPxYJO2iG5+VCchWcsEReMlzvWi+z7t1niI9HeUAS
         j/G+94APWofW4y+Tylo8fEjS3EXu3PZlikEHiUVRu+VQqg1MFpESeW+fgpWRZNPPYYUA
         P3GzFN2Nf+6+v2hl2nT5shXfWcaGapcPi6nmyE1W3njDQshoqW2ikrvqJ7uPAxvVnMme
         qh72HQ5Xj/iHFbJKCZIqjgHi3Yd2Ltqg6Bg0aRAOCqWadgSPDCrmg7L1YcIf50M+aiZ6
         5aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780042156; x=1780646956;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1Jxgj5bloGFbb+wxjgm56VvWTxc0wnItMHSSsAedd4=;
        b=ZRUwxawSm20icN23K1jp8OjgP1jnxTPke8rK0pXsecSTh8R5ikLcF+uFNW78nyKCXs
         r7BSZaOMvXvuBOFaL2HVNF9UpMQPZLojvEZ++qzvnrVq2EbUoylaLEQaTfKpSGq0oNX2
         bm0T0oFSRFZsDfTKziQxSms1WPsrL9IylXXZ54Ce6YkBiMQVT8+Tie2lL1Xps0ggkc31
         O0enRg4W8wqs4+6dnZtt1zMEgsr0Y4x6GFEI1miHnMvmU1FHNyiF1KV+W8yaS6gLE8GE
         u6V5QoHZm70qJFtCGPEuWzXLL/iVySrJZOYs3Jffk1Vi6FzTC9iWWrxzC+mZEuU8qdAt
         5lmw==
X-Gm-Message-State: AOJu0YwxJW3rg5vifqILKwBBzZyQ4E2WN6nnj/xlYogT6jDlCsf5Q1Lq
	v+HjLUbaUAqJjSm9SZpODldbTiikatPfyirL8qq6ZMyIjsKSJvKA0XixLpuVgFj/zU9zRdPSQ7p
	d/BNh3O68jeI8OWLv7NKv0NFsVFdMbTMv8WqZMoHI/27IbaRnRajUMvUfdyxnVq73T/Up
X-Gm-Gg: Acq92OFqAkevagYXujowBjvQLW62kPqlPvvJG3XKz61aqvXmEiF6brSSevt/5nMcsN0
	jvGQvTExP0kQYwvjxxAhp8CAm0dKRpMFOaUFEKc88k3NmZmi9EtGka5oUyOz5t2mHCIb3VgMa9c
	QdhHna8sIbBIH6jWd4EcphzSlav1Ek3rN3mllwVDBS4nciau7dgQUPvxAbSTtXNF8PtWl+wgwSt
	S37lOCaNURfBfoi4w120VXyxxSjzHISJw4zbhMu04KeXN+dVQqP0OBRum/UKnSRfe2yx31Bs+Vm
	PsHiEONoJZFe5R4WhPdwK6LUec7vyppJAD2jkns+BquwM91oat0GmLmxjWdEsm48cXk4mADxdFh
	s+D973SCcijyW37SZKHVxhXmi1s9/evlbTbabAIfpJbbbVM188Q+0R3ZJAtyE
X-Received: by 2002:a17:90b:3d50:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-36bbcc14a21mr2439422a91.6.1780042155721;
        Fri, 29 May 2026 01:09:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3d50:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-36bbcc14a21mr2439390a91.6.1780042155207;
        Fri, 29 May 2026 01:09:15 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcf7a0fsm702794a91.2.2026.05.29.01.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 01:09:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Fri, 29 May 2026 13:39:11 +0530
Subject: [PATCH v2] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-pinctrl_msm_irq_eoi-v2-1-7edd050a46f6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKZJGWoC/32NwQ6CMBBEf4X0bAlbAdGT/2EIgbLIGkqhC0RD+
 HcL3r1M8pKZeatgdIQsbsEqHC7EZHsP6hQI3Zb9EyXVnoWKVBolEMuBej25rjBsCnJjgZZkWV3
 OKUJaxwDCLweHDb2P10f+Y56rF+ppv9obLfFk3efQLrD3/hsWkCBVDYlqsvSaNNndMofjXHbaG
 hP6EPm2bV+eUUotzwAAAA==
X-Change-ID: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780042152; l=2146;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=N8hfsxpSiKl22KeegE3vYAhGOHOFOR0ac/DSaLY3BoM=;
 b=8mWeXKQtk8VYyR7BWMLoMFizRryJGjE6TcFCCreDzd8GP9T1huW3i/K5hgm9lNix7QYr68DY2
 iBJAKNmDvHjCIortxszWbRJp3lxPQ4ua0ks3Tvy7XhvQ7/csg3IX7yR
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: FxJd2Ri8obQ7Fqjpd0qY_0YZ91Z02-1h
X-Proofpoint-GUID: FxJd2Ri8obQ7Fqjpd0qY_0YZ91Z02-1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3OCBTYWx0ZWRfX69x03yLIPcLe
 fpFdsoT0n6AWrrKLkrxDLdYO71H3qttHljT0FpM/4Qa6awKUrtUHpoeP0XoEX+x+YXfHYPNj1I8
 OZ5hMTQMwBwXkKgVkQsh520UgO0wCVOGqfVIrT3AOYq13A/8dQNNEAnPXpdpOa3woc2bNuqi9hz
 PVqu2jbDxolqvKsJdmWe/+HD0MNzHOHTqf6fmr7gcMCxIkEZwC0UGaKdmY1aLL2G/1gyZ8FRf2K
 r8qxbSWLryLEHI49maXiXasykTnZgjjO84mpUSo0xftM5bYJE6LHZWMXW2IfON1pCftWrcj3njx
 kjUO2YovUydKwsFZPFJEhzmf5lcQjcy88EW0rIB6nxd3aMzfOCpKO1taPsBL2L1/0cZRI4+Mnkr
 84XGtE9jJGFyTW8awpxU7P6ICLM3coXqHWD9FGU/7Wsaw5p679OmvrNhO4gqfsfgyMdetG1fuFR
 2c9OUSeu2IhiAICTw+A==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a1949ac cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-nbtqxR-dX0XXlXkv4YA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290078
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-110229-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A06B45FF061
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before commit 14dbe186b9d4 ("pinctrl: msmgpio: Make the irqchip immutable")
msm gpio irqchip conditionally initialized pctrl->irq_chip.irq_eoi to
irq_chip_eoi_parent() only for the GPIO irqs having a wakeup capable irq.

In order to make gpio irqchip immutable pctrl->irq_chip.irq_eoi is
initialized to msm_gpio_irq_eoi() which now gets invoked for both wake up
and non-wakeup capable GPIO IRQs.

Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().

Since the irq_chip_*_parent() APIs internally do not check the valid parent
data is present to ensure irq_chip_eoi_parent() is only invoked for wakeup
capable GPIOs validate d->parent_data within msm_gpio_irq_eoi().

For non wakeup capable GPIOs d->parent_data will be NULL since parent
irqchip diconnects hierarchy using irq_domain_disconnect_hierarchy() and
later irq framework trims hierarchy using irq_domain_trim_hierarchy() which
makes d->parent_data as NULL.

No functional impact.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v2:
- Update commit log with the reasoning
- With the reasoning added keep reviewed by tag from Bjorn
- Link to v1: https://patch.msgid.link/20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..6771f5eb29e4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 static void msm_gpio_irq_eoi(struct irq_data *d)
 {
-	d = d->parent_data;
-
-	if (d)
-		d->chip->irq_eoi(d);
+	if (d->parent_data)
+		irq_chip_eoi_parent(d);
 }
 
 static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>


