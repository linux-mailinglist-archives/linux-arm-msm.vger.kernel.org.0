Return-Path: <linux-arm-msm+bounces-90119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGOaKmXXcWk+MgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:53:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EAD62AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 34E73501E95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D18A47AF5E;
	Thu, 22 Jan 2026 07:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuIpSdqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4U2opxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A62E8B97
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067935; cv=none; b=MLJlsCF2tLoY+CBeS0V1PM6afFevAuc8VPYh/0P5qVV3t19Xv71WOhnABYnXTY2yhLiY12jiLm6ttkvFgU/eu8a4d7267rEz/sdQo1PT5jBAukX6+mhQOybvd9L+KPxRWeWq9bKG0+B64FhL85njPDJCp6BwSKxbwvCV98t3X44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067935; c=relaxed/simple;
	bh=OnfAu/AW9rFZ1vLKruBd8Y9wj7Qrr1ILxPEU3yiKVY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4Ifr8c9vkAg+pTqJYTXlTcbI5z8MzZeoBKSEZFWQJBgvKBb5dJEA5cWJZG+Ceu1pCKPQeallVnuL6Q3eL97aWRu/SOLnYScuF/8UILbxmr5jxdrIDlbJkf86exeNHuYn8RSGnYUyt4VZySDVQN0UNW8plnGShFyJbaHlpMrnCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuIpSdqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4U2opxr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMHOmR2279967
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARswkDbA8yhSD/2cJfqadeY4khX9O1yiyy3zywvZkvE=; b=DuIpSdqjVU2byTXs
	5r0IZFXss3DXWyVz/9fBDkGrXL1paD7SCX55031gumeSIPA4CtxQejve1Yx2s4gR
	k1r//MClzRZqmdBtIT7/DNRG4KyW69nYGgIU00o2O2plRlJUUgqMXtN6IALhbEva
	d8LeC6odoWF9Gk7c99gVMj7r8goWMhKNAxw9eVl/fXwtcmRrXyiNoPTmnkaI61nz
	LlV1MSuTjLgYQ3ONx9uUacd8zIiitu2QSSbHcJRg1c56E/h/JFkCSb8OdYGAIbTE
	as/LOJBKMIC2dSfT+SuJeBTKsD2WpfA7kS9bwn00xYCCn/pE2rOuT4zRSE+95Np7
	htFCCQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fasd2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 07:45:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso1309001eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 23:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769067927; x=1769672727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARswkDbA8yhSD/2cJfqadeY4khX9O1yiyy3zywvZkvE=;
        b=D4U2opxrIeuotygx7wh/5RYm4G/aQbdyxCPsSoBbF/lklGTCEHhMJE77X+UkyIRaE4
         5++7Sndu4uisi1GPkqOqWYeLiVoBwuUa5RRp77EzP7SERrpccjiaOo4aUN/Ht6tATRsb
         CeqWVgVEAjX5PJHbFVmM63Tu4oIbS/tymQR4804IlBmzNuFYJrflyVZdiHQGgfZr4CPK
         Cojl6ShUy8Y6Q0I0egOPDy1zzH7HEyQ5L+s+nbnZb/6TOdhzpHU8CfXN4S/Nibt6S+ld
         ppffkbcsa1pEcHGJ8zUmTWHGhm865b55y/DhfeQHLT2VEG+MqG2Mv0Or2IB8OTdsxuXA
         xbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067927; x=1769672727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARswkDbA8yhSD/2cJfqadeY4khX9O1yiyy3zywvZkvE=;
        b=v7PD3dzBgYjtLLgldo/ZKtdlQC3X1/zg5qMVhSdFMKZLxnI6u9ZeDurvZ5QG/Cl0Rc
         ZhBoH2XpwR4AbJH6BZwX/mS9TNJXPwCd/Z65NIA/j1bfhrxwMqVBGU9KWoNrl5IIk7yQ
         /4c0B//Hwq5WK5DO4lVoAPmbiv2JwQUQMjdATJlzhLGuPKdSJj28TiV4GnlBAP6wHUqo
         rIUho5WWL1XUkf6T2aWE3B4ldxylVEMsgDF4q92/QSuiIC2BvB1872rBs3wEQMDS8wS4
         DctDM/569AXLLT7AxuJRg7vcd5lvs2y0+OiMhS7yMvHwFv4z6fQY0fDBd+A/62YEbYsD
         lFFA==
X-Forwarded-Encrypted: i=1; AJvYcCWcnT1vjb8VklKXjEIX9qeSSnIo90RkOrY9qZMJ/1yUEm7OG79AZkIFf8cecp/BrJHLBSVTtAOwFqB7elSd@vger.kernel.org
X-Gm-Message-State: AOJu0YxRulgR1BBGaw11FcjTrkOe6wFESqDFvwIR8EZfYF+5xKcOO08i
	AYDxj2qIrCfCLU9eUBMLR+0Gc5WeSdZ43ujq8I9Hoav8tOD9SYi327kLwhmopXUEfL6uhejAwQV
	166mUH05DB24vGZKf2UwtS33BbRlA+iM0jTx7x2NEbt9MVpg8TNmu3B7Mc6PFzVOgyytC
X-Gm-Gg: AZuq6aKaN99e179OcvZUUUgAqcedWe5VgWzD9Tkr0Zo1IbfJ1uVqF2Y9c7Vz3/Fw/0I
	BvkSTWi3iRKAKhOJB5vB80AJc8Dnao2igKPwqIwcc7Los3ewMB35LBxeolnb55l3tnfDZ4r91ZU
	DQ+nCRz12emtVvDVv2TJzsweaoUyJLK4EcMuXJD2SBL5Pdz9uSNb0pgu/ViS6xojqG8VCz11vwy
	yXrbqAoIv29Ra5TWRfh0cJfvYsqPAY/SLm2fHM9/b4GRuxu8SRySNmei6m3e7Cjvc7x7pZBCL6E
	SD3tvaDJMLGLzfCHZGKso2+2C8ItpdSPo11+IjfdYjFDSJ/VM4KqG3fC7oee/xsgLNYGdTmuRGE
	rp6mqjbrH01XHAIrO2ydywaw4BPJ39te64lp7DLGgh2lG0LBT6Vn/n0BU
X-Received: by 2002:a05:7300:8c14:b0:2a4:3593:c7d9 with SMTP id 5a478bee46e88-2b6b4e8b390mr16756450eec.25.1769067926827;
        Wed, 21 Jan 2026 23:45:26 -0800 (PST)
X-Received: by 2002:a05:7300:8c14:b0:2a4:3593:c7d9 with SMTP id 5a478bee46e88-2b6b4e8b390mr16756440eec.25.1769067926309;
        Wed, 21 Jan 2026 23:45:26 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36550dfsm24875278eec.25.2026.01.21.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:45:25 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 23:45:18 -0800
Subject: [PATCH 1/2] PCI: dwc: Fix grammar and formatting in
 dw_pcie_remove_ext_capability()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-remove_cap_clean_up-v1-1-e78115e5d467@oss.qualcomm.com>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
In-Reply-To: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769067924; l=1054;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=OnfAu/AW9rFZ1vLKruBd8Y9wj7Qrr1ILxPEU3yiKVY4=;
 b=0nnXFTMwwb1y/kpr9YhIAJCE29sACTdjKWTFgqjAFquvlCS39T2fxlPSl30koTv/vmjenIIPL
 AYK+cFs+eRpApnkgviugDQJ1dpL84lPlutCWGk2lGQbMyMbPRF2IOeA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6971d597 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=m7LhmkQuZJo2DZ2u2bkA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA1MCBTYWx0ZWRfX29ID2R1W/xXD
 0d6rdmS6Uw6PP5kSFtCJk+Hn2FGOHSz3u45KgwZQrZLPpd0WWB/U308mfozbRbaM35SPXJ4lWOl
 ThU65umwUHGOTaL2pVk4Y44JJFO313nSVrAuowbvBl8+082gbhamVAmMpOUP3+9S1JhT20XYo2z
 O66JQX80Vj+XJjRuwkbJpoEfn9OaQ2GA439SREzh/Oq63GsZnU3z08LowPxx2oVuE51JbQ0cg8Q
 Adn5oCEod7XJA6Pq60bn6w0yICCl7CrYWNAw5iwQhuVUOPr9YNFnwZVlaX03Fp8Dbxxwm8nI9FT
 0Ba3yNgEq7XoZVlh058u2mES8aGkXdT6JhZzTrOjVjCE5qyRtqEfpQ5qJEz2fwjwMUlppPeRD8g
 B69rPlXzUSZ7/u4awA6ZZ5w2DY2HBP9AzRVoGrXvcFxS1qhPNqK+POYi8xbv9Qep92SCe9BcT38
 d3NtPJIoZYVMJHyYBGg==
X-Proofpoint-ORIG-GUID: vwvLBBcClgMo_OjkVJDWvHTXCf3nnltg
X-Proofpoint-GUID: vwvLBBcClgMo_OjkVJDWvHTXCf3nnltg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220050
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
	TAGGED_FROM(0.00)[bounces-90119-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 78EAD62AE2
X-Rspamd-Action: no action

Fix a grammatical error in the comment by changing "it's" to "its". Also
add a blank line after the variable declaration for better code
formatting.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 2fa9f6ee149ed76ee84e8129a47f4bde2fa4d513..18331d9e85be30462277532afa71b5850438f32e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -268,9 +268,10 @@ void dw_pcie_remove_ext_capability(struct dw_pcie *pci, u8 cap)
 		return;
 
 	header = dw_pcie_readl_dbi(pci, cap_pos);
+
 	/*
 	 * If the first cap at offset PCI_CFG_SPACE_SIZE is removed,
-	 * only set it's capid to zero as it cannot be skipped.
+	 * only set its capid to zero as it cannot be skipped.
 	 */
 	if (cap_pos == PCI_CFG_SPACE_SIZE) {
 		dw_pcie_dbi_ro_wr_en(pci);

-- 
2.34.1


