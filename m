Return-Path: <linux-arm-msm+bounces-118663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C2DKIk6YVGohoAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E05748583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:48:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GKNpjax2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rs0cxEb0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19CF13056625
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131A39098E;
	Mon, 13 Jul 2026 07:43:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1A3914F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928585; cv=none; b=tRaYoBJrDQXIBVcrs1krWjJfIwK1VbsBr8jebOdEeQFJQhQrMG/NkIIua+oGyO+uiySEu9SrM7yX2i/mAai7Ub+35jrPYEffDNrTLv4FERXvjnMPZBgc3G0hEKsTW+K1WkMieKsba+nQ/BKi9yVu5ySNgfZqmsMz4OIw5Z2NgDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928585; c=relaxed/simple;
	bh=MYmlLT8ThQGLNwyV/BC1KUqTtU7yI19YSWTO28NshSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e3+tv+1jWnyBfudKarKdzWr5WVxXZbjbLWkt8Tdk2Z+xynlE5J0s7u7nXaW2c9uahwlELrZmyKQF19Qbp4TYEOulS0Irqp//n8Gnyl88cVefTxjbNrN3Gtq9kvEaf5aiMWXPsY2BInq9eKTvZaAHRXB7GiF7ICB8bbz0kghMCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKNpjax2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rs0cxEb0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Khci775116
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWJFgQziladGBTw3u8LccKLmksdh3iW/fQSBcWMufXg=; b=GKNpjax2+eMcCj6U
	zTU6e0ImgTSsAl4ulwMAGQQDKuf9m6bT/M+07Y9HPwtOOB+738DBrehrzI7N3XWI
	r1+fUGF9+e/aS8ROz6Gr1+kshQ3K3qPyTNnM3y+Mg1at7z3MlsV+bsp5P7wT+3PY
	xp4zmCPZdKvhfIGpSG6WehyqhZyHc7ntqlFRAXKoNyI3DrGOkTnH8cBncQrSGQ/2
	u/Ub+DDAAVdh86x7/QZEiq59FVlviZDhttbNm8TMN1tNLrY93eyjuIlXfXifoBSG
	utp3oYW4RYWqq+JYgLj2apmWKTbcXdjX5vaVmlbwnX3Nud9esE/trjI4khmb3bNL
	OSTkQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj002ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:43:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484739a9cbso3814940b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928581; x=1784533381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWJFgQziladGBTw3u8LccKLmksdh3iW/fQSBcWMufXg=;
        b=Rs0cxEb0sOPa64DtBo5r0lPjcEYsruma+aVbwuJd8Jx6VUEX1igMFWdiCQDEqcixMI
         gFJSV3dXqoDHbWKal79WfsUSw5QxlJK9mvid22VMqFFweim3i2i2z5fQ2/PwqYt1tCun
         95Es3h/K3hCSklOiAES3wq4SqXa+RtKvCY9WVg0PT9ynTW81xCUo/eVid3l874KCD7E8
         ZSaK2TkTxe4pZ+OpJURyqzo7HeZid7coHACZKxnSInsVC6IukaNDLMQz1Rjlvuop6g+V
         y5k6hPw2YJKLv8SdSu6QuoNslzNWJrnjQhR8PZhGTbCy1Menx3+XWZHKdnkpAL8pARo3
         U3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928581; x=1784533381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWJFgQziladGBTw3u8LccKLmksdh3iW/fQSBcWMufXg=;
        b=UssNXuQUH81D/pkBTwXNui7n4gt7kEyPNtDnSAR7V/T8QmbvRtTAYRQ0OUCEmmyM15
         YgVzX1leiSKfDCBRblgqaAu0g2BE7IhnDWcjAeK4MVk7aRSz86U19JNUaskaULuveSFq
         0n1efnLEKiCxoptgWHz94rf8BmsopA8/T3cC96DjQhW2fbKCjKgYxtBUrpLsLeY9tQuX
         Pdm6RvifHp4zYqtCHG98QPHomDkkjohViHMsHBGnFhN2cdwUeh+PbBfkAbB7VL1D7H5d
         MOz4wt1UtPiDSCALRLEh2TTA+Fadw/Q00TlsUEUIV23+VRSNaUhqRrXW9+9s18CR0tJ2
         3XBw==
X-Gm-Message-State: AOJu0YzcGle+h7Ddxd27PAmQ4TNbwwxzcav7BBi+X4K/2sl6aUrz1hZN
	hEtcu9olWc4Ci4/if23/o1S+kAY/MqelDSxzHDK+64lmWwqJwmOhGriNzdDODD/m3xg5gvOYvuQ
	zk4h1442K4QlnTV6C5BvRFWIxR5bnYp1ttLl6AGCWjfWKDY4NPDkC49NUPCaQ/idML7KymrwTNI
	haaLI=
X-Gm-Gg: AfdE7cnMdetCtbEeIH2VybufZNmxT5pzHzMu6yrW3PQ9j/xaIep/1XmFN0nly3Okr3h
	+uF1WXZ0sBEAnt1R4c4JeLxkA51GdWfNZbhK8dqLkghiJolp5K606jACyH7XxXkacLHHIhvVTjq
	pPmft1jeN5CtXuU1UD+fe6GFPmyxUcCIQmPksThbVMo3drF/e14TxoxxSdxrLTAn4PVrpgsOXmw
	kiSEbpMQFo5rpr7yFip+gSUqY3cGOYAhj0c3Ueoy9Sg/Ov/JeYINf8N1BmEGoF9qB4B/DrYCZUU
	sUn0OHn93X+GepByP3aj4VE8IWGHRu3EfDUck5iQQgADKImIevIFQ50Oi02OqTEMz4r+cyug4s+
	9duSFgy/Fexj1FA5QSsZCYslzxWx4iBPh8hGA0j9aku6E+Llp8waY/LZWpA==
X-Received: by 2002:a05:6a21:50c:b0:3c0:9acb:3fc with SMTP id adf61e73a8af0-3c112e077b1mr6962665637.33.1783928581573;
        Mon, 13 Jul 2026 00:43:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:50c:b0:3c0:9acb:3fc with SMTP id adf61e73a8af0-3c112e077b1mr6962653637.33.1783928581158;
        Mon, 13 Jul 2026 00:43:01 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm61329797c88.13.2026.07.13.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:43:00 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 00:42:51 -0700
Subject: [PATCH v2 2/2] PCI: qcom: Clear Attention Button Present in Slot
 Capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-clear_abp_0713-v2-2-4f0333a98d4e@oss.qualcomm.com>
References: <20260713-b4-clear_abp_0713-v2-0-4f0333a98d4e@oss.qualcomm.com>
In-Reply-To: <20260713-b4-clear_abp_0713-v2-0-4f0333a98d4e@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783928578; l=1446;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MYmlLT8ThQGLNwyV/BC1KUqTtU7yI19YSWTO28NshSc=;
 b=z3ZkILMCnLB7e6E16R7obZNqsIMcdw37AAYKgycR9RUPbAY4yKc9xY9dlF37aojRYiO6oErzQ
 E41YQhmcLrZCDT/SsTyc8qXzZZWVYYJPdJpQzQEalN5Wl2GkSyUubyO
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfX0BS9Vwgj61Hp
 zh6AurkvOQT8M5z9NUcV7hjqJW2F5IMdwGPRlCjZvyjsZbZmHUMilRJ/HAdXdacFSAHlL0I9lIi
 BCSZVUG37oEP14HV1fqx/rWCXqRTbng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3OSBTYWx0ZWRfXw5gT1WK5Zuhd
 vhkQMT+/szTUF//0WoVBqNG7xgrWavf5dPsJlMxv6+7zx5RxyvbfY6w8HIDypVLMJ8PxvuGvRB3
 m0xD3Gu9pZpMhA/TpITHqwfUN8hPpfiVSyzuGqrtop6cPlqHb7RNKph7B5KEYzcEK7CfRYuqPgy
 xZJ+eQCz9GF/kp+wnMgdgMI6ntZD+FfqOWgmBRqpbQeRx5afs7VXH11rbsdGj6wCIjK3RMEfGOG
 HHJ4hv4iAH4CDVUlukHAq+b74SOM9tx+fVpOMuCNcxMdj4gO8DEKU02K4xlNBkI8TebjjduUOBB
 VM3XBs7QubQqp/VU6/ncB/HHGazlzoomG0zpEZTHV9diT6OhdXCAacfj65TMV/BvsMYWjrakIKU
 MDf+WTyNSTYG9XxZ7NLXpQAj656qZ7zfp1b9pD/GwtoOcIje/NZJe/q5YggpRIg7bv7aw49X79F
 9P44flNib+FJH5fCLnA==
X-Proofpoint-ORIG-GUID: LPig6n6dHGmOHFEmE_xdDWekopdG7EHA
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a549706 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OhjUHQ0J9wk2a2_2EIIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: LPig6n6dHGmOHFEmE_xdDWekopdG7EHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130079
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
	TAGGED_FROM(0.00)[bounces-118663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24E05748583

Qcom PCIe Root Ports advertise the Attention Button Present (ABP) bit in
the Slot Capabilities register, but the slots have no attention button.

When ABP is set, pcie_enable_notification() in the pciehp driver enables
the Attention Button Pressed interrupt (ABPE) and leaves the Presence
Detect Changed interrupt (PDCE) disabled. As a result, presence detect
changes are never reported and surprise hot-plug detection that relies on
Presence Detect Changed events does not work.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E80100 CRD
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 465c940109a7..0a826ba63277 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -372,6 +372,12 @@ static void qcom_pcie_set_slot_cap(struct dw_pcie *pci)
 	 */
 	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
 	val |= PCI_EXP_SLTCAP_NCCS;
+
+	/*
+	 * Qcom PCIe Root Ports do not support Attention Button, so clear
+	 * Attention Button Present in Slot Capabilities.
+	 */
+	val &= ~PCI_EXP_SLTCAP_ABP;
 	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
 	dw_pcie_dbi_ro_wr_dis(pci);

-- 
2.34.1


