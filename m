Return-Path: <linux-arm-msm+bounces-108639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cd1KjZsDWrgxAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:09:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C95896E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D3E73097D73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62253A381C;
	Wed, 20 May 2026 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luM+++5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJ3epMvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB43A256C
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264236; cv=none; b=pVktK5e3cYx6WDUzlzfFHGKRoCUHTMo7FFUZ/mMT2/ahxFBOWwPLuytKelEpxKbBIgDZhfG55SBRHeHT65aXjEHLtYtc3frroUZkP1JJuROhLA4Nq++aflF7Et9td/vgiLrdx5M6jQ7f3ABLZN0y4JeU5H+aEUuADac0LR2CWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264236; c=relaxed/simple;
	bh=05WQlFCqkNTf3GyTitJ0XJCe2vv1RfwvLI1D5eOFLT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f81hB0zfeZJ8dzupaTP0i+SuVZsQ9xxjRZQrrA6taDJ6pMML3aRmrKCa55G/5NiprmRdK83NphfkMKNYHwt1bSyjtJtYJmAayE0vAc2XPrTa9ye+SYJVbNFN2VMfJ4wJ8/2bD+VMEalz58PFe5VujV40+TgyqCXSpGkn2Tb329I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luM+++5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJ3epMvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7EOHd341538
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=; b=luM+++5cgw90nkNo
	5Zd0jhfTVMw5CDRRadpgCFomLuNTbxIHLp3U6lTjTQCcWznOS5C4xB0FQmcY1ljZ
	OgL3dXMNPmNOcMbfrRnPZQwnHm3KbTosZ6tHrH0IQT6poxwkexxlBTId/cDR/cem
	GEE6UBFCLGcQ5j7zMioKhjmkXcTp0g5D4wwrp9NEsW0wCJKxy5x1584PDOmMjFu9
	johrHH0PgwKI6aix2qxpesOck+IjR/gDowjJUKKXsdtxR/QfKcrc2Pdp8UsfBg8/
	6ZPI0f/UGDNUP2WXxfwRCQMxP4m7AvLTxSblN9cQABYRxslL4HvBKx0xad/ZihTf
	S2ed7g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vbnrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:03:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662990c03fso4060816a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264231; x=1779869031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=WJ3epMvjhxbapCyeStBvzPNKiN0odCa7qb66qkGuh3ACvvuDikAwO6VZiddlcX3ypA
         RS5XhOVjX6whkBZjt9b1tIXyM0W74QaXn0rPEPzf2pus5QLXrdCvmrRy1nU8hyMcx4Lr
         bOXeKcoojMzMRsOQamoaMj7RD6cmnY2q44wsM3YsogvgqukcNNFe/2Zo+kZjsW53bAjP
         hVCFRUTI3Dzef1mGq+M8ovfUpbCeBbb2vIqRo3hMnbLquZWPeBAggk7bRr/78hZMQzwS
         Zksuf/tDeBlv2UXR4dGoMGHXCvi1bZpvjuBg9NymrQcFAlvMuwPKLiUAGK/42pkUvrN5
         980g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264231; x=1779869031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=UbHLsdfzkY6P60d8zsmPdsz+HSY//tJ64/6tLUp5TkX+mAD+im0GXKnuA9KvIdL54v
         C7924livFwM5AdEGdrawwB0jJeamraLHOs9IGze+aF6y4ZS3tc65gHv4ZZVy/w+g/xpu
         YfcT+YlpTbxQr52ZQcPMVCFoU3eKDFV7/f+uk+8Uu6i70mQj4nrqbA3UJBkC7EN2IzQr
         hcaYRv4D2w+IbQNnJiKNHjYYxHLZqz3PMrEtI00v5J2hmo1Q1H1bfzKe/LJzrZBv/Gs4
         x+r108FUY2lGuc32G+jKP2MW2jKMT8ZvLuSGdO8tlV37Ppl5CWMVLNyFiDSCdwGqXgJo
         KPBw==
X-Forwarded-Encrypted: i=1; AFNElJ/hSQGX2oEgrJ/AXlOJsAudmu3CI16kXHzqpz65iA7xXZw6t8QKpAM+9Tx2mM/4852T6gs4/aQTHSFdW5yN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2muc4OgFS8QFaEXyxrhh1BN8pcxb7viQBZJSGRp4GdNsOxo6W
	o8ySx6mMby4pmDFCQR6vcbCsX5A8Bh8teKTRLdxZ3o74joOsKOSo00zirgt+sVL3Rd2g2lhd8Nk
	7Y/EWUK2f/r/fWV5Y+eNPNJJYkWEoHjTcS9HgNqRa2yzdBf0El+1JE77xiHk+XjSh145U
X-Gm-Gg: Acq92OFqkkgbGmi1y14O+t2Y6xu0bWQtdxNl2+6ebZ9u2IKXsFmwbryBPdkQLOM83rR
	Pb9xdkWrOndPe5Ai2PEhYe+TMCoKtE7e2X3FI8sFakpGnDC6GwXsGP24UoJnrCuDmikdaX7+/GU
	OZsHgrVaxsIR9IGZ96LjsqUBH84jjE1UaGlOxYSHtauCdMjsQYQg0OjSGrnvUsflnviScEDNKJc
	jtAA3+cc6CqmcRu2yMIoyaPTcuoLy/pnIDgEa0+dpoYmPAT6P4U87jlxMwjA66pGAUAgxAianth
	RT2ZeyV7H47HuiOAdnS25hJYyB+h9c+sS6q9n+2gHaRnH8Qdv9MxerMa1tlP5r6JDQGVXaa0l6G
	bq4i7rTyH1U+V+u9CEIOPKiTgu51o80/FifAEIBk5yiXHyJcbxfAXXWhJ
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587696a91.1.1779264231293;
        Wed, 20 May 2026 01:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587664a91.1.1779264230586;
        Wed, 20 May 2026 01:03:50 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517aa6f8sm20889290a91.11.2026.05.20.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:03:49 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:32:42 +0530
Subject: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
In-Reply-To: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779264185; l=12523;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=xwYkAEs+q6jRw+I3dHPltl1MmPPWsBwiOXNPNgKt/0c=;
 b=wcATq9lX5Bq1e8erTyBpni5Dih/s1c6wO9/NnG4qxR1ffvxl+OPEk6rtMC5rr4W4VoKcAWrsQ
 FdmlXhXN/pYDkytoi0wtNZgLMf9D1M6bGdq1x4YOiNvy+TxTUK7PV8y
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: bMrn7v0QdBlODEJB0Hh-s6BUbkGH7Wxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX/FtNHNRJB+B7
 gCntuI7gqicGo9MY2OFIG63XyNiIsFmGt5mtIJgSWHIK/ajE2hX12yW2ZjsvyMtd9Bm271D1ip+
 EMBn92V/qPEgTY9FOqwKEMcSApvF4SSTEi1hUap+VP7dJ9hvpZUjqhQOD1816/ejpvVMOXTxTPm
 lCraerdjxlDz3lIwH+n69oZe1WgDVL4Vm+Db4NMaFJ18TuYK8M4vSMUDbngE/cWoJbAtKfIJdf9
 Taz9aUPcJFqFAIDBxZ1JEChLKcC9tPCO/LeTp0MXa84CqVVHfeQdWsYYYklKd2HflOyoklyiYhn
 CTm9Cxen2f12IxaDCPN+U6atWLY4DpLOjks66wTs7EdQ6GSZzWgHdyf8gLc2z3eYOOSrsvBJGHJ
 sCBuECANDXXEcI4wLQzQkFEu08YyCqTfic+mDIlOM2ksDeuWbifGcybna6aC5DtvFdfGzLICqFp
 /S3/ozzcxLK4chjJ0Pw==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d6ae8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=9707C7GnR82a18xSEiYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: bMrn7v0QdBlODEJB0Hh-s6BUbkGH7Wxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108639-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijayanand.jitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E9C95896E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/of/base.c  | 166 +++++++++++++++++++++++++++++++++++++++++------------
 include/linux/of.h |   6 +-
 2 files changed, 134 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d658c2620135..f436e2676381 100644
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
@@ -2137,11 +2167,13 @@ int of_find_last_cache_level(unsigned int cpu)
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
 
 	if (!np || !map_name || !arg)
@@ -2149,7 +2181,7 @@ int of_map_id(const struct device_node *np, u32 id,
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
 
+		if (bad_map) {
+			cells = 1;
+		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
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


