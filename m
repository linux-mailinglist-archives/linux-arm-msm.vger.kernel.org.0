Return-Path: <linux-arm-msm+bounces-119290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WumFG0GWV2oZXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:16:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CEF75F40C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IB7RsLkO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dvqzu680;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119290-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119290-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 024BF3056D31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1B93CE0A0;
	Wed, 15 Jul 2026 14:11:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693173E5A1D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124674; cv=none; b=dkksOyQYVGVzSs3JT4PzlkHFiuPLDsctsDALjytB9GOw9A7/rfQquRAxQzms3OrhfxhGivobRDTzIW8UUGrVE6pZJMLR9IOYFRH5n9xwYXJupJkFkkF4rPEc7vDIqIpcBlF+Dd+H5sEUFAzrdlrSAJEedFx3uxhQvc2+OAi6bfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124674; c=relaxed/simple;
	bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8DGRP+PCsM0EnSE9jco7fQ/fJRIRZIVolbwweqR4q8VdW7X0WfrQB1kWX6vSg3v6ctPSq2Zo0oqiKQUifWobbTRWkANQlGYKpmB7zkMJJpiPko4i8EesTjhXFVDR3g5Di4VyBL6HJtiQkI1kSMA3exgEP6CTX88c2DGT613R9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IB7RsLkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dvqzu680; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3TMT3775597
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=; b=IB7RsLkOApXfakX7
	llDBN0EwmrSki+Wf35W0sQDebM+75eLCHnq9hXswlZOXiUce9QEkjzrqUDQnCQol
	whhnIPzpHSAqkzBexWsmYas6bhKwzGCaypI43EFvM0arv8PO15LfUj1MpEXfY1Kg
	Th39A6ogHDiwiKzJdUN9qcsFVkaLN5fZUJpkNYraP9iSx3Ut/ymNDlMpb7OU38x1
	Lw/ok9aJWUs+fUnccuCBdVUm+jW/bpLlwFXGNlVsxpuST2MDiAgAejSvkPp2sg4o
	KJ4tARVqf6XfmqHdXCWduBpY1J6phLJjc+B4Cju2e7bEwnbLfP0+JnpiuTJhcu2T
	nyfYZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka9467-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce870a060so101623335ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124671; x=1784729471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=Dvqzu680CrQNkgJzQArP4T/L8mJ+WXFoHe5zGaakOR5eb4k8vnNs5+fMMVYd4WyIEL
         AFvz4CHwYWU3QSwLfSz2KsiLfPIGV0FHkqfpFTOXsoVIsVeKIeoLo9dDYAmZHXy9s31l
         k29m+PNdhyGfpGdcDn6DPfVYbtPSr1nhCIlbV5EbXa1u9B0HCKKHU7N0/vg4hAlzk1DX
         ZPpoc1w3gaCuCVDvOtTmNmAZ9TtgFCA9htZEia+JVi9K7sITn89iNuvztqUz/mTvevoL
         aygopdF94ktbpVJUuyCcDSi6khxEhmc4qYbjyeD4SOmhBPDVtOvnzIr1Mjzy8GtbmD/g
         hltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124671; x=1784729471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUXkx4Ku/EFI2n6r1fYOWCM/WqhVpiu7V2violHeIes=;
        b=DZJW0/6XIztdmDQnc5niFJxQpdenLZH233+ouRmCvkqd8wQ6BOD9VJsKoL/a03RjER
         PEfW+1lEeXwVfVwVa81JBT6MjnMHwhamDbSbwjqhjIyc7mNF2tVZC03Be6S6nQJQsX9C
         kNoTAwAprgVBHy1h68QiSXmL0WRoaxWGyKmkuoe/AXIYsts9UorOC/oDo0/SA1RwOQkV
         RiA9EhxOew1jFmcA/Hrn865D5N0dRDNLcaHov4uj20d/U8hRGG8dpKBph8CeD3iXg5E2
         9SQMD9RkqCJlSBl2yhbTnDAG74qc3dfeUP9LL65JfgyJMdAbsgXu/GW6bOmzkgYGXVX1
         qFGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdv8Bt/b9fMTzu9Ek4PDdJOs9VRI58Lsqtcz7lT1Mqy2yylEYf9JTYjhUE86H9EdRpcP9TZiXDXlIcTrS2@vger.kernel.org
X-Gm-Message-State: AOJu0YxRk+yPle4jcIaw4JmoRq5wB5K3gb48GY9GFzFTvHIYTwgi26m5
	CWgVq7zJGM3QIp2fZmqCMJkTJkqscEIeUrZ3jqls7jytIgwbn8kQfXCA1hmPnrW1OcLoNhxcNLy
	F+gxJXx/FfR/lpccZF4gTIe32hObg8lyxl9tgdpIXTvhYeaZ7bTj29m62U0Napq6eVcaz
X-Gm-Gg: AfdE7cmqH4ImYhcPZ4EL30crmracwf9vzn/ANrVNtQd2Y4v5InY1DT1r3CI0mC4o3th
	HrLyFVuHPeTASpseN1IKPeIvbz8nwQQWOWDijv73S52Czb2BcRKgE3bEpGlnQb6Kbv6WXP67GHl
	ZDGgx/8os9doBXzk1Lb3uHM7ZlN6ze74DZAi1pmXyLqmnA4HZ6qPnT4jqGvV28WIWZlUnfvjadT
	anVTAmda7I5RUZdVMsVgK5qWNo4ce85s7ta1/uS9jBIe8f2Q8I6l3NgHd2TLTcAiHJ71OIvmJdn
	VzLHK/5jcol9QJFrgG/qql7Nbgxh2Tvb3TCjR5nXQwpFbY45zU04GwSa8ysnRA7kbVInZAMlYXD
	zzmktlrihT/fXjKOYEyKl2BSn4eHalclhCC6YP5A5mXQ3
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72569225ad.13.1784124670933;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
X-Received: by 2002:a17:903:3585:b0:2c9:abe1:c352 with SMTP id d9443c01a7336-2cef1327a72mr72568685ad.13.1784124670343;
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:10 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:03 +0530
Subject: [PATCH v9 09/14] media: iris: Handle CPU_CS_SCIACMDARG3 register
 write via program bootup registers hook
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-9-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=3528;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=j2F1BecakdsVQPJVT1OChM6/odBNNP5n+m7cYa+S3EM=;
 b=2qipjg45gfc/Q86MUudP2IYVC2Qlg3JxMTxLLbpVLRgnMcPjCSalBAsP470+oXsfKJSpB4oGA
 RffdrC+4IIACk3ajQumdtL9pzPGYvWKLGbtd+rxWPoyoXo/jzMRA7bZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a5794ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_-2Oxswyk2Zu2Y7AJ8cA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZjQDqUz0qc9ZbxlzDCfIeiBlbZOL3SlD
X-Proofpoint-ORIG-GUID: ZjQDqUz0qc9ZbxlzDCfIeiBlbZOL3SlD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXxbCYYDQ+sKyB
 9BFRHaHi4WBuQXPLzgclSTm2NqYkU4WCLP3phZFFbaVJylz5d65uv+QzkATeld+uwX4D7uu11Br
 TiTfPdLmOV1huPeZWtaUrM/PSVF4pwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX7F/Uy9T3WrE+
 sodSE9yCPrW7gUEIeFG7Nt3vQ7bjLqmo2sjQDvk8NOiBc3ity2JRH5w4ipS0PykoRmT39q3VjUj
 0qoffHdxt3eT7maTwVuTskOA0y3VMc6LcNasek4gyvAbL2qY07gHd+N0NiEXWU76BoG3DAuvMar
 1X6UNPiDDv5qYf68nEOe+efUOfnSC5/rXDdPv1SL5byH/Z7UpVCHjdGhKKeeRmAHh005x9Bbagr
 47ZLtFrBXsA2yZ7IVgBrLAuSVgXczT3Vu9cH/ZL53qdaA2a+3C4LW1WFq/e7uMNMWXkgYEfT/cw
 YmWtU8XR5QAMC2fRzfx0ZQ+fpg8QKyH/UfrEnI64jMJ6VztawWINMnUPtdipuWZ8Fi/X+6B8O+Y
 Q9AazhC9pWa921Fj4RIMLyYKt6rbdA8vUbCNJeh6LqJHTyT5ge8+f7IxAIi67eheW5Pb7e+eHgV
 2G1pzZK48qcYO1n/AwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119290-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32CEF75F40C
X-Rspamd-Action: no action

On the Glymur platform, the firmware reads CPU_CS_SCIACMDARG3 during boot
to determine the VM count and increments it by 1. Writing the default 0x1
causes the firmware to treat the VM count as 2. To avoid that write 0x0 to
CPU_CS_SCIACMDARG3 as a Glymur platform specific.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c                | 6 ++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 4894cba62677..7d5007abaded 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -333,6 +333,11 @@ static int iris_vpu36_set_hwmode(struct iris_core *core)
 	return ret;
 }
 
+static void iris_vpu36_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + CPU_CS_SCIACMDARG3);
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -366,6 +371,7 @@ const struct vpu_ops iris_vpu36_ops = {
 	.power_on_hw = iris_vpu36_power_on_hw,
 	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu36_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu36_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e690c566c875..72eb8f6240b7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -26,7 +26,6 @@
 #define QTBL_ENABLE				BIT(0)
 
 #define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
-#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
@@ -67,6 +66,8 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
 		writel(value, core->reg_base + SFR_ADDR);
 	}
 
+	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
+
 	if (vpu_ops->program_bootup_registers)
 		vpu_ops->program_bootup_registers(core);
 }
@@ -78,7 +79,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	iris_vpu_setup_ucregion_memory_map(core);
 
 	writel(ctrl_init, core->reg_base + CTRL_INIT);
-	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
 
 	while (!ctrl_status && count < max_tries) {
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index c44c85eac3b5..3782454b7d06 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -29,6 +29,7 @@
 #define CPU_CS_A2HSOFTINTCLR			(CPU_CS_BASE_OFFS + 0x1C)
 #define CLEAR_XTENSA2HOST_INTR			BIT(0)
 
+#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
 #define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
 #define HOST2XTENSA_INTR_ENABLE			BIT(0)
 

-- 
2.34.1


