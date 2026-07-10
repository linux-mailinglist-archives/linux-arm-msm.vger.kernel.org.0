Return-Path: <linux-arm-msm+bounces-118294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hoM3J8jxUGqF8wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:21:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8173B2F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E+Vrvcpi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fXovBui6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118294-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118294-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 934C1300104C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710D1426D18;
	Fri, 10 Jul 2026 13:21:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B93B42D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:21:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689666; cv=none; b=HLD8F8oLYV7ll+UvuaMu5/mt6Oat3S1dyKOYWViw0hf7RcuZ6Nfy/QmbsCiXaXLcn7SUPYrd4N2IB0DKMYTMyIb/3hAD5IafcKnWYxBcyDRnLeunvpQJrgZICWJCrFlK9NOcAZTovkOaK+DO47AZpmQApwxQldyoheMMofbMhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689666; c=relaxed/simple;
	bh=AmbrJkzC68B4rRpQK84/FFjOkbtbYYveaYqL5MXvDao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rlCHpybU9mStUJlYZ9NNx3I5sYAcVPXLhq2H9yicTu3YMWOhbT8tmphtICmnkxl+49KcctoklTdjvhn0/h+8ELYLgmFrMUot2jnvllWywlhMQ5SpKGLb86MXqHGloLRXyHCyoMlcvCREY+6P6t29+JiRmjC4/kfYQqAPZxxEozQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+Vrvcpi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXovBui6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6xKx731379
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M5bj16MZd7TUPcv+0Gm35I
	17dcBKZEcTVxrkTONYomE=; b=E+VrvcpiNo4O05NoG7Eo1rgY/g2cyCZVAvXOEj
	/eYpP9G5/+AT6xbV713qmRE444Q3DErh85tf9YPArM/J8OMI0EifNQkfotvFWkTU
	skkudu9Lm2YRJu80N1BSuCW1X9ltpITTElxIrN1uM7JN6pRN+4sFklk6sgcZCDgV
	h/wc5I9is+oDhMr8Jcr//1TOvEJiXgT3ocTet4NGJnri0Icmz9z8cHZ4rKVkS/Dp
	3OJ0ZOIzux+eQm+i5KyADw+nuEZDJBnwXodcSB1UKedfsxuLmG/s5uLj5YkSzNRY
	v/Q9/mlDyFRATmEHnx9IMjCrFf0p7tMg1j6oxG9DXVQHR8ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vcy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:21:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811ae55313so957544a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689663; x=1784294463; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M5bj16MZd7TUPcv+0Gm35I17dcBKZEcTVxrkTONYomE=;
        b=fXovBui6FCZCSDB1wyofcTZLDcfHJcV295ok7BTxm6FEVnplDk5U5vAroDCZjzaUo3
         M9XwEs/fUyA1mzBJoXyj+tqbzmruHcPcPh8qDXAmFIO0383hRJITnd//UlSq9MYULgq+
         IxSv3az5eRyQmzZJT79HRARLdnrKMS99L8Dot6sDGZrRPjH3IbcCP3y4XEppfxop0GYC
         9wdmnLz4C5X/MSjHsqvIRzuBnhMB4n7vynx+acp5YgsRuW64La28G8xWjUVUqG7vzmJh
         DMqr47UqC/gAkJRhksa0bMluAACD3sax6EC827FIwHc3CNVGqLUepp1lhfgf77M8Wqgn
         i5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689663; x=1784294463;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M5bj16MZd7TUPcv+0Gm35I17dcBKZEcTVxrkTONYomE=;
        b=BTp1Co+5zHbrUBZp1bp6Q42VclbzN/rSQUWNH5eVdWPzwy0yLmPsDIbkG/X4gF9M1e
         /KMsY05HxJPMJldAMrX3/V2leckjS1wkFhLHON0MV4Ajvum3zymz5qbrDggwmLViUeO/
         pcCS/gwXBzhm+Nc7IZsD8vdXb9mjDtg163LTuVqVF9UMp/sfarP7iTdFueP3AQFWMgnv
         j4kAYrO97UmGnrkoE7biVJXlFGCBRV7b6kpe2Vh37TQ2q9LHFLEL39kD4Lyj1tJYtcq4
         PZHRgKjyTynRcgFIPyrvCqxe2pOhxOKVeeToN/dNyzZ/kCzX3aAkRyhg2KEUEvKdwU/M
         bwMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRdH4CW2M2aLuC/8oYNy6xMA50KLwRXExE0BADCQjiEcpVOMTUK4Y2XPmXqUL++wORxzd0Mv/bFs1GshK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwGOS8Pau8r5ru8eqUTgB2e0RD7r+xTWVJlmx78/SR4Z8CkFQL2
	iEvPt2z8MckS0LlwsztNJK82rLCZaJ4CgPZxSi26JL439xsFl8T/5BUXDMh74HC3Iq+n1CJCIG9
	8ec1mNFGANl264rzz885hmf49fsZbLsRch8KXLe8TVUse3yhzMpMLdAbfKmL9fXBubfZb
X-Gm-Gg: AfdE7ckGvnukbY9a0yoziHa/yseAjHf1UmkLjwv6MbOlrVyKO3/0wD0CcYOf3dJl35R
	fzyS9+gkgQw4YVg1iV71ZcvXPma4Q80vo+JS5RUzO+lsvLuHiA73SLFUlxKFnlDCyJyD+/3IcrX
	YtL2bHbw6kLAlB9vjv+9Xe/OZgLE6aAwfqf5622Tqu2Ou8msHe/PAoWYyDlBl4GE3mrccBRK+Zw
	BURbUORo10ucgQrv3Rd96qiZ6dOZUijf7JSvswPhUrwG2ld2nVzaZ8nYBOBUH+ZDbRPAfc6YZov
	GTws7Hbo/xGTJ7FZDEcp+fzooJTodhIU9C4mhMwIiwHCQnn0qpcdGyK3dKY7eq+oyqjQ85FjoeA
	DvUqtiTb45I9SgKyQ94rd8kya4J58LXgtT9FCIXg6DQTJfhLSoHxZycuRrA==
X-Received: by 2002:a17:90a:c2cb:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-389420ac578mr12741981a91.34.1783689662987;
        Fri, 10 Jul 2026 06:21:02 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cb:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-389420ac578mr12741936a91.34.1783689662405;
        Fri, 10 Jul 2026 06:21:02 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm36496290eec.21.2026.07.10.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:21:02 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 06:20:57 -0700
Subject: [PATCH] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALjxUGoC/yXMTQqAIBBA4avErAtUor+rRIjaWBNRoRVBePesl
 t/ivRs8OkIPTXKDw5M8rUsETxMwo1oGzKiPBsFEwUrOMjOjclLpTX4UtuJYC133KocYbQ4tXd+
 w7X77Q09o9vcCITyncNhGcgAAAA==
X-Change-ID: 20260710-clear_abp_0710-2f81e92b9da4
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783689661; l=2992;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=AmbrJkzC68B4rRpQK84/FFjOkbtbYYveaYqL5MXvDao=;
 b=E4pzDzd8NMsd8khB8GflJNpFbnVr4eGdKgjnZj7qBSStgpXXw4uWnq0wcOThRntFfr5TYBW8Q
 aFeYwv8n9s5BDLRRnyiCMjhFPdT1Qm7cnEUTAm/vo47djVgZgZePNCW
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: u--yL-Qc5BnDLXkzfDVIEYyBA8MhIXWB
X-Proofpoint-ORIG-GUID: u--yL-Qc5BnDLXkzfDVIEYyBA8MhIXWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfX2Wnm1lMqOBoD
 9ayJfWe3C8Ti3HYYH0vwWeGPLOBQzjAdLSgPcwVbvxs6YrMZs/i5MhFj8/De7xFZsNAFmNBBInE
 ukZhtcMKnEWOo+kXlW446DmVtfXl4Jc=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50f1bf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=864Vm389qZSSETCWT5kA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfX54Nmv5sAvSzy
 3M1uqbpAGr0D7MKYpGe1qAk7OpmL5DlVBYWJ720m/lth6fN23ZDyNA9kEZQ9Ce1OI+vmI5yRZUI
 44WTQi89tRzdouOhQGR3aVaDgcrHWR+QPmChM/DhqZBdJ+gGbeLrMZO1amFPBUTqkkuv0p/kWRr
 BWDmQX5qD9GuiU/HwJUqvP5l+GNE88Odd5P1ceD2OrcbtK2AcetMBhtdLn2TLLkV19sVF/l6bht
 4ImHlB/nO1qhZuMNBNQHMQb3GP8dtrZ6h9vHqvHuXA5ze9gDcLSfrGYMsmi01nSn0LDJUaYrvm+
 o8+UHg4+MwZMDTkN+9p3mGrlOUmhDgbJ/IXZL/CiUo9sh4QC7+dOOX3p62gsS5pRrnCs+IQ3eSf
 etxs+9n7cOwVJwrSO3JvK/lp2PpbvW9m/XSgmqZgMIO4kGM9ScROgLpO4seNbgQaIHkK6CURsg+
 DUQYIIkcJhqMsViHqyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118294-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-pci@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84D8173B2F6

Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
the Slot Capabilities register, but the slots have no attention button.

When ABP is set, pcie_enable_notification() in the pciehp driver enables
the Attention Button Pressed interrupt (ABPE) and leaves the Presence
Detect Changed interrupt (PDCE) disabled. As a result, presence detect
changes are never reported and surprise hot-plug detection that relies on
Presence Detect Changed events does not work.

While at it, rename qcom_pcie_set_slot_nccs() to qcom_pcie_set_slot_cap()
since it now programs more than just the NCCS field.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b193c989b2b8..89c2d4cb1fbe 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -358,7 +358,7 @@ static void qcom_pcie_clear_aspm_l0s(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
-static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
+static void qcom_pcie_set_slot_cap(struct dw_pcie *pci)
 {
 	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
@@ -372,6 +372,11 @@ static void qcom_pcie_set_slot_nccs(struct dw_pcie *pci)
 	 */
 	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
 	val |= PCI_EXP_SLTCAP_NCCS;
+	/*
+	 * Qcom PCIe Root Ports do not support Attention Button, so clear
+	 * Attention Button Present in Slot Capabilities.
+	 */
+	val &= ~PCI_EXP_SLTCAP_ABP;
 	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
@@ -580,7 +585,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	writel(CFG_BRIDGE_SB_INIT,
 	       pci->dbi_base + AXI_MSTR_RESP_COMP_CTRL1);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -660,7 +665,7 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
 		writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT);
 	}
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -759,7 +764,7 @@ static int qcom_pcie_post_init_2_3_2(struct qcom_pcie *pcie)
 	val |= EN;
 	writel(val, pcie->parf + PARF_AXI_MSTR_WR_ADDR_HALT_V2);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }
@@ -1078,7 +1083,7 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 		writel(WR_NO_SNOOP_OVERRIDE_EN | RD_NO_SNOOP_OVERRIDE_EN,
 				pcie->parf + PARF_NO_SNOOP_OVERRIDE);
 
-	qcom_pcie_set_slot_nccs(pcie->pci);
+	qcom_pcie_set_slot_cap(pcie->pci);
 
 	return 0;
 }

---
base-commit: 3edb3a038d423480efeb204dbc6ddc9a292f8ecb
change-id: 20260710-clear_abp_0710-2f81e92b9da4

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


