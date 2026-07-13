Return-Path: <linux-arm-msm+bounces-118662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RtsOA+XVGrZnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:43:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A87037484CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:43:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GMwKisLO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ynp4KWEi;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118662-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118662-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 456863004D0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695013911CE;
	Mon, 13 Jul 2026 07:43:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0E238E11A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928584; cv=none; b=LrakX97b9gPXsvUgZs4ODcsvz/DlOGPM4up1Xs4cJiW8Dhxmcg04HKTzEnx82+bLlyfraVpvIhofUpnGAqgHSobw1ps15fH/PbCj3mGqa1WyzAasgi0YSiELDDzVXWalDP3dSzpQS0hhi9SpdeiV3QOyG+VU0Nef/zJeMJLsKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928584; c=relaxed/simple;
	bh=w0/1CPAj9OEmpYXqh1rya4kF5yYb0G3adRXi+35w65w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JJDllNEf2AYki+bAMFI3Kdb/DLPr1+uFaopkwGpfuOoRbEXObkJbjwYLHGIeG2PUtqns08WBV9IHCyKDsqLlT9lseMbzKx5FYQ5cLdX+qFsDlOtHGEIXjAzfe61rkl51Jl5QgUzrjhIR4inHTKemw1FFArHgiZOooVixF8JUu/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMwKisLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ynp4KWEi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nmpm507318
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=50PhvAGrAdZr+Emnp4Nz9+
	Kfj+hnrAtMN8ZqiEDpg4g=; b=GMwKisLOSyAdclz/N6eHyd4QShVw8CJDYwa1ai
	yyznPt7YKHIn1vChkWfg/LKu5j4tosoqSZCkC3nWmDLjSAJCF9AzsbnSQRrAs2bC
	mu8O9m1Dcar8XjJgghY9HyeSiaaMMBH0ijptWW3IcSyAB4j7xIo3ZT1Nk+6SMyQz
	0ObIOdFfiKRbthmUeh3sKwX1OPImjam7UG1cw4Oboe7SG1wP9QJj0P1ounVtF6Dd
	zH3m0HN21xqBYlKKizqdjkYlJRh4no9J7/gDRJzl/scc2vOcYq43UKSbxpT1xW24
	L+LfUO2FcB8P5AtbZ/H0QAmnKT+t7dIJyC1ZYRXcwr3CFgaA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8geb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2596929a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928579; x=1784533379; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50PhvAGrAdZr+Emnp4Nz9+Kfj+hnrAtMN8ZqiEDpg4g=;
        b=Ynp4KWEiqcCiQp+2+39bSVyOPCr6zSkM8jhrrVGqikoMH/APT/c3ylbLl+hSL9x2tB
         WbPFMWOBnmNAE5660/XMIxNCygYiT6J6A0dricV4EWK224XtcznV5kz9UVyLRL4+Feii
         acciwCGbqP3mF/jJuzeKs2lmObLKWjXbfwvELQdyaTPy/ZUSVW0yH7Tj82EDSEYtC2d1
         vfRvbTtZzduVZDIyCieg0WQArTKrhF6OY8+w3HcsYDdDSYblLlCP75c5Jn3nl7HBiYAb
         3NOKkmnP4Roll7Xn/ThM0xxCMdVVe6e2sSPqg3KxrSUkMN38o8YVjU9VPYCR6OTY3PJ+
         gWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928579; x=1784533379;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=50PhvAGrAdZr+Emnp4Nz9+Kfj+hnrAtMN8ZqiEDpg4g=;
        b=XEmW6k3WcavuCYfBgIVxkBmSJpRTKnC3g2a+qTwV6T/MTxa61Ys/GdEk+4Sm1d1jdz
         sdi0EpMv9Tp0TmfaEvd6jrB3acju0dsr7UAYPvzEhMZDQuMSSBT/Ak6BUewfsnFRnXN1
         POiFxXfxueHxZghS4Nq4MUrcdGYkkHusi/qUAtyGTaCnHGZdBcny+IlKSPuG8Lu3Aw07
         p2IumArN4HDieR7TS209vCRnc6GqfqJbZja86EHRx9k/nce5+9zAIg+4bNb2/VuUC/8L
         YAFn7e4gG2ar52pOgp1iU8Uxl6TUOgGrreqPstYEeUZtbiyF39bjoGYZBCql6kylzd3Z
         0FbQ==
X-Gm-Message-State: AOJu0YzFRUzcgOJAC8ZpyrdRurO1Cnrt6o2cz6X0YES5e8rlk1Q82uP6
	0SjnIpch3guCZbY4CG1WrRlth16qg0bfwoTEJ5JzM84FNfUX62nPAvj3fJiRBhDECHqkWvUf//p
	EHjYIVcBLtaSMSVwbTHPTGQMfbm5jNx7PZKHUOEsmv/XeNXK1CM0C/Fwey/X8r60M/39x
X-Gm-Gg: AfdE7ck/Hs3eP/w4J50ygkRDpyMA8OA6NSg/Ps//Frr4M4srkNIjG9mTZMiIbVZSSfQ
	Mt9kwaTOOFyjyY0ojwOc++TLQb4o7o9sYp+pnCC0f8fCbiT9g44PEmTT5P/vaWkKl4aAW7tdJa2
	SWEJ9anRwviMojO4s7JATQdH8mB93u7fvlJMvp9Tp0ZYw1Qf2U8i2W0YGVgQwNRVekosh2TGnJD
	NX8gIUcvWqi1Rdol8wx42ppcuq/o/jg85e1XgSYEacNbPqSqvFTPgm8rwCGMwUnlYglI6c/9xPY
	iNi0iObyR2QCc1FReu7RkEv5zS/bOnsqti+Ev1koHrJF9AwAIzWP/GGnAIYx3XKeQzJWEDbTdF5
	yIWrjrcb7aCuC6YwiT4hbu47zgmJDC7b69wZn3mIAbOLb9zjLmj4d/edEQg==
X-Received: by 2002:a05:6a20:1455:b0:3bf:6c07:b2f6 with SMTP id adf61e73a8af0-3c110adf3e1mr8816669637.57.1783928579475;
        Mon, 13 Jul 2026 00:42:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:1455:b0:3bf:6c07:b2f6 with SMTP id adf61e73a8af0-3c110adf3e1mr8816645637.57.1783928579031;
        Mon, 13 Jul 2026 00:42:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm61329797c88.13.2026.07.13.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:42:58 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
Date: Mon, 13 Jul 2026 00:42:49 -0700
Message-Id: <20260713-b4-clear_abp_0713-v2-0-4f0333a98d4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPmWVGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mj3SQT3eSc1MSi+MSkgnigiLFuiomRSUoiEKUYJysB9RUUpaZlVoD
 NjI6F8ItLk7JSk0tABinV1gIAZlejTHUAAAA=
X-Change-ID: 20260712-b4-clear_abp_0713-d424da4dad3c
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783928578; l=1734;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=w0/1CPAj9OEmpYXqh1rya4kF5yYb0G3adRXi+35w65w=;
 b=Anjm05j+qaCVr2AxpQcVJDrKMxuQK4k/b/+IC1/o2/D1TRet7lr2yLnpD8/iqL5obpOixAARK
 +jx2UpiY6NeA2PrIT52eZdDwNI51PUZA+tXYRjuC4CkEwtaQZtrFiWF
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: eLcsXZRQfCdMoahzRO3E2nPGdokj9htN
X-Proofpoint-ORIG-GUID: eLcsXZRQfCdMoahzRO3E2nPGdokj9htN
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a549704 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=pNDaM0vVNsJultrfONsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfXwxM0px8yezpH
 fNXVzJXbVxLvDL6xISavIoPoIGW4HS+jHv9egcolRa766QjQNhkPWIgj/z1U3CJ9kL2nesm8ZSm
 CFIdSCDxLG9K2hLq47Vhwua32IoCciM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX7QEMOQTrF08G
 IcxtmvejvFrKTc2zbLWslESrmTv71N8+I/nKvi2Rrq6R4uh9RzHCV2xiIyB44/4CVzI65HSF3kJ
 dttUOvGfMDKSPNtJEHKwmAPO5v7eQ3/LmKygteG84L06btrNc93eLw9cV0GcEIYF6aNLgbKpeke
 +lWtsykq6pEDsKg35fQRRzX/it7Q3hxgVubzi/TsAtNTG/0+bSlejv7A8ewaRZcGSQZfPHivjyV
 xoiFU8+hkdKMMZfZQAJ6j4S0qraSXVBhwyOFNdcEIZjSptrqsSju+GL8hbipQAl9aqHw+UR6dkJ
 bhVJPysC0Z3tlnfiSz+D3yHNOy4+6ioWbJ23o902Q3O3vlnL20sHa5ebxLNZSWhpW90Kz/pdIFu
 JknIxczWwSZk/EyVVsxEuvIabitpGtnqekRFJmCOMzoyVelj2Tu8bfT+F3bZ3SUmOX5nipEqiE9
 2oPCrHqXD0XvdDjo/vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118662-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A87037484CC

Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
the Slot Capabilities register, but the slots have no attention button.
This causes pciehp's pcie_enable_notification() to enable the Attention
Button Pressed interrupt instead of the Presence Detect Changed
interrupt, so presence detect changes are never reported and surprise
hot-plug detection does not work.

Patch 1 renames qcom_pcie_set_slot_nccs() to qcom_pcie_set_slot_cap() as
a preparatory, no-functional-change step, split out per Bjorn's review
comment. Patch 2 clears the ABP bit.

---
Changes in v2:
- Split into two patches (rename as prep patch, ABP clear as the fix)
- Added a blank line before the new comment block
- Kept Konrad's Reviewed-by/Tested-by only on the functional (ABP) patch
- Link to v1: https://lore.kernel.org/all/20260710-clear_abp_0710-v1-1-efd63ebdaa09@oss.qualcomm.com/

To: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

---
Qiang Yu (2):
      PCI: qcom: Rename qcom_pcie_set_slot_nccs() to qcom_pcie_set_slot_cap()
      PCI: qcom: Clear Attention Button Present in Slot Capabilities

 drivers/pci/controller/dwc/pcie-qcom.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)
---
base-commit: 3edb3a038d423480efeb204dbc6ddc9a292f8ecb
change-id: 20260712-b4-clear_abp_0713-d424da4dad3c

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


