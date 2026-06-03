Return-Path: <linux-arm-msm+bounces-110911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nxVVDFHVH2qwqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:18:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 112D26351DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:18:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nqgLSJgq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Dzn+2/UE";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71634308E791
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 07:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5863FC5CC;
	Wed,  3 Jun 2026 07:14:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D193FBEC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 07:14:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470866; cv=none; b=R6cBQ05j4HSDPe8MpHQWz1ISdDYrFROMpoGBVEFiLYeUTLKZxS2ou5vzea3gwvLR2BsIwfaIHBFMadkV7shnW4/SkEA4CPiuqvrodteWvmWSONxvINTgtaiNzqUWR4KcYPmjMQ6xLs/4+KkbQTypmvpU3iaQlJaPT6tMgwRDapg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470866; c=relaxed/simple;
	bh=kTw/EORGVplVOncPwo4esjkmCv0e8ML0rVKdAiB2k5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMe4wTs9HDfO2X+hDxShhc+UBPIasG3abqPPjVz4LRrINtaTAN1x8PmA+wd8VG6tctS441ZsDvOiVk6lMZripvKhSqaWObwHfvuTP4lQjbbZeuhjOfLTDZCI7/ERJtcHZtDa2jgcbC81Cv7mDjh2v79c7pESWtbhu0bmvi/u6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqgLSJgq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dzn+2/UE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RIH11200016
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 07:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NESXEAUnIJZlgHkQhSkW2BBr8htvCi9q/3exWK1858=; b=nqgLSJgqZuxMg4dj
	TkTyKMYGew2vpzd0IHJcj+bRfWM+33dnwHxuTNAamr6pDsRV2FvzsmV5zd1bwJhI
	tAOlM6O+ek6AdbS9PhZlK4v6jzh/DdFOpiIIbdhJ9W+1xpM/yavnl1x+qVdjteh8
	2Vt1lYUMAQDpy2wPnUbTtipX3TPGAstlE0RZL6EXNhq4AbNzumGBA8zePWvUjomR
	npOr5NyxqpfbiZMznELtlvnUdLvke48QBTmmcAvP56uIHzPNKxvolFaolqh1xpkY
	J/H2O5PQeVGrF1elJ8yYuaW1JboWVsyqNMMgYbj9dn6pKgk3jXC88udBDXXOqC6e
	vmlIZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw0qa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:14:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c3315d31so36411495ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 00:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780470861; x=1781075661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NESXEAUnIJZlgHkQhSkW2BBr8htvCi9q/3exWK1858=;
        b=Dzn+2/UEZgq4KjcNDG0f4Tk4OZ3FT5METS7OgXmjQrOlZcoPNaH9HdB1Z/wFQTt6kV
         8LdNmaPDVuRrJybptL1mMWn9a7TDSo+Qx9Am4oqleQy//lNjon5JqXbDNRtdel8R9g5K
         GJhLhmGGzwE6uD9TWhlKapHN8X3CX/W7/YaiobBy8xrhRCvNuYe/k2GYfvfWd+6npvbT
         Xt8cOrMZnTNfG0fZq6JCTqda6CNSrfzmpA3llY1dzhh/5CZFBoB6eGw/eGL7zdOj6e7y
         HxSIowFbTqiHshfBuYQAJ6yeWbtlM0YRjW3tF7MklQIl9tnblzKsjOpx9z+IL9wgq9up
         XSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780470861; x=1781075661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0NESXEAUnIJZlgHkQhSkW2BBr8htvCi9q/3exWK1858=;
        b=dfI7iXEr/ovrVx+3fczrLd0ZdtfuYJQQ+2BME1CZCh8OZF4R+9dB2lcHn44w9f4zt/
         3XONT/TILblMm0XJIWKQeGJJh1RGG6lE5PHATwkYTnVhgEPf7GFR6X/y2hhn1neddw9N
         9bXXhvYTJ6BwfFEqWMLSxou5rEhnetDNqJBmULFUVZ6xFC2Osl7KkSWsRadkHtsBLY6f
         h3D8F9Ax9PoLY0LByAMbsJttKbiyjMSVdoU5a/cvjOpcuSxsHP/ucGIWGR9QTnCZ9Q1S
         53L8fiVid5izhoSYBCC5hnn7Rt5rBDOCBmiDj+7GZONoQMnxMUSG4bUA+wLYOqEFhTG/
         AIDQ==
X-Gm-Message-State: AOJu0Yy1g/LohIvERAB2ulFFCFq3MPs+hUqIzFkN8F2u3zkbkLfkU2K8
	pbycFKKHMQVy93lnI00Kma7aF2fS1I7gVXaGS15fLqCyAc2k6k8tnD7EO8KzNiEG9QzZMVU6Pg+
	+L0oOPMAyDEXjxfXVBC36nNMxmNLJztEs6Mw/wnQEhob2bO96Jeimx51sAQsiQLnmd97K
X-Gm-Gg: Acq92OEAYVR2Y96TY5eRkuqNErbzPwqAqyXehQn7dqn4dvbAFkZlbHzpfakTSkW1ScE
	cljHy0/Csuv/bDa14BOQSRRwFxi6CfwuETnWNr0B4bOFb4XmtB/zIj1sqvq+lhPdiOSdCBWwfJL
	p7CJvqBRofqfUuwfHRicllzQBHv+kX4/z/GVqvu7u7azbkSqbrZWXgOY8guVNm2uZZySNrsqroi
	NmFoppj0e+gKCAf3zDxKNYZVxNStoOBg95SCu7qElznoaq7barGzwwjSGXfVzwZbp6n0eZ3/wnh
	XZ1cVLnSIOvkxzADwIDt5kbeagyx5MV9d5iWv+wVnIACzTdKukZDw0StrVh+yMO35pR4myu7zZh
	Znb/IfqDyqgcHp7Id54uXMP29Nmv/DqowLJHScMAdRZ0SVdmQX9fFnEkbwvcIRl2VEq0=
X-Received: by 2002:a17:903:2409:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c1644aae32mr24391835ad.32.1780470861077;
        Wed, 03 Jun 2026 00:14:21 -0700 (PDT)
X-Received: by 2002:a17:903:2409:b0:2bf:e5c:d90b with SMTP id d9443c01a7336-2c1644aae32mr24391335ad.32.1780470860486;
        Wed, 03 Jun 2026 00:14:20 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm17249725ad.18.2026.06.03.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:14:20 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 12:43:14 +0530
Subject: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
In-Reply-To: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780470825; l=12579;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=LPtm8WRL1ePgVwpjpfKGmM3BfFB+wBr62xMWuFSMIXc=;
 b=akSqVr4B15pnrlPKudtM7LDFqnlZY755iH00YvUmRmRXT010tIliyd5qbMUXYUsNrA1CeFZLr
 x5IZ2Ex1fT9Afpi39siNTFcy0lhQVnAIK8REPd8mwI7kfwda3ocWUcq
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-ORIG-GUID: u1yD96xoCixS0xbnG6Y7H6Zzuf2mcp3t
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1fd44e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=9707C7GnR82a18xSEiYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA2NyBTYWx0ZWRfX5SEsjaT3Ou6X
 WO4jqKQPwAgZZqt9Z7uNLfrWlI4Goc2atBXSyI/2eTKQ5coJ11ZfUrnFiIdbAY4d0s4s2EfVCMj
 ZH8DB6sKTIAaIYnCIi9ZPsfNoC/EscVWmO+Jd+WKn2TzVtmfcbJcR68v7XivCbuITiVoD1H9uw4
 gnQFePytRlE6qtA7vSKZS4NMVhD/ov7zhN+UnA9YEqU3UkXcM0GxO0nH5CAaKWchE0latafYPx0
 adq3QOj0BeKtfXipO/eEKfrOcA5xUPgEpSndKN7eQQx0zZXM0eBtYTrPRJ0ZIpIYfh2IaZrzPrf
 3GwHlLrPX0zW8VSnC63jZRDICknwxPJ/PhNs/J/TFq1X8emkBAfsFXyrMhNrAmePnyAlua1O8FK
 0L5lmggp5TtVuEgP+/bIXNbVABk1RWSMvvF9PdZhlKWY9gS4KL9LXx8L8Q7G7Soxl3O1UWLl93V
 J+gGGVPary+dYW7119g==
X-Proofpoint-GUID: u1yD96xoCixS0xbnG6Y7H6Zzuf2mcp3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110911-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:lpieralisi@kernel.org,m:maz@kernel.org,m:tglx@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:vijayanand.jitta@oss.qualcomm.com,m:charan.kalla@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 112D26351DF

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Update of_map_id() to set args_count in the output to reflect the actual
number of output specifier cells.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
 include/linux/of.h |   6 +-
 2 files changed, 135 insertions(+), 39 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d658c2620135..ac7961cbab94 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] will contain the translated ID. If a map entry was
- *	matched, @arg->np will be set to the target node with a reference
- *	held that the caller must release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	as defined by @cells_name in the target node, and
+ *	@arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np will be set
+ *	to the target node with a reference held that the caller must release
+ *	with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2137,19 +2167,21 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
-	if (!np || !map_name || !arg)
+	if (!np || !map_name || !cells_name || !arg)
 		return -EINVAL;
 	/* Ensure bypass/no-match success never returns a stale target node. */
 	arg->np = NULL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2159,11 +2191,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		/*
+		 * Assume 1-cell output specifier if the target node lacks the
+		 * #cells property, for backward compatibility with controllers
+		 * that predate the property (e.g. arm,gic-v2m-frame).
+		 */
+		if (bad_map || of_property_read_u32(phandle_node, cells_name, &cells))
+			cells = 1;
+
+		if (cells > MAX_PHANDLE_ARGS) {
+			pr_err("%pOF: %s cell count %d exceeds maximum\n",
+			       phandle_node, cells_name, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s has 1-cell entries targeting 2-cell %s, treating as 1-cell output\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
 		if (filter_np && *filter_np && *filter_np != phandle_node) {
 			of_node_put(phandle_node);
 			continue;
 		}
 
 		arg->np = phandle_node;
-		arg->args[0] = masked_id - id_base + out_base;
-		arg->args_count = 1;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base,
+			cells ? be32_to_cpup(out_base) : 0,
+			id_len, id,
+			cells ? id_off + be32_to_cpup(out_base) : id_off);
 		return 0;
 	}
 
@@ -2219,6 +2303,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2228,18 +2316,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
+ * and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2252,17 +2343,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
+ * and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index ea50b45d9ff7..374b249766a2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -465,7 +465,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np,
 	       struct of_phandle_args *arg);
 
@@ -950,7 +951,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     struct device_node * const *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1


