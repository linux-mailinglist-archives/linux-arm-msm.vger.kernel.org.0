Return-Path: <linux-arm-msm+bounces-110995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lu8MN2A9IGpNzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:42:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E869638B60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:42:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YeVMENjn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Lyv/mfFr";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110995-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110995-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6833108F48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 14:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E53047D92D;
	Wed,  3 Jun 2026 14:20:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7690847D93C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 14:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780496446; cv=none; b=DWt3oImucJGD1fQgZF2qodYKSpCIOkyfU1JO1jvn6ZQO2Ynbc5y1pyYCx/hx0u7xkFEv5fFhh6CsVg0jsBAUrl/EsAhQRxkimQ6D1d3RyWJqjXsp29paoLIFLWAvwhO1740gFgbPklVd+AmbNI/lA6cpzsZPBLGt9XYiQKqMtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780496446; c=relaxed/simple;
	bh=PuMrtg0kXudsgBTKAPN0KLjJcY60dOingG5L6cBwKzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXkxEFyWyfd0svX2Qvput9Jvob/mEV/jc0n3GScSXgmivxFpXYgFZs+fkx54QdSIL9eFX9E8KAJdh0F3wSprP1qlViSCHP+YNu505NzRbwwNHNUxJJ9QlT/8N6egD6OwmQnZNGrjT60Db4/aCvDQUkyrTVTFxdURmd4Q0zDrx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeVMENjn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lyv/mfFr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CeEVk1946464
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 14:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=; b=YeVMENjnBWQmrFyP
	+1uuS7BWiskrHzBkPXIuJPW1kOKQxFQ7WjoqN8LPviGbpOhcu/8ztJppoE+2Aid7
	QNxszLXYtKLQ7v//ZwEV3IxUFZeOH0fPuHfaJ1dIVk2FQoGlYBYpLu9vTZWLCb65
	YspUIqzqI4/EyGDbesz81yFtpH/tsC/IjZ85WHsSbCov6hqp4epQrEZExJKGXfxF
	XX0NU0NdpK6QKKq//HJ7nI94b1gyk5COUF8lWx26SNFoAcH/2VqEnXyBSHbNiXUa
	2+/QowN6dpnC8wmMBZHEasRcSzx2t3f0hHVwi1b1qPSrKGjsAbrZ1PExDVvu4/ZM
	lzg11A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabgjvfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 14:20:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2beff6b6e74so81524195ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780496443; x=1781101243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=;
        b=Lyv/mfFrfuOWZQUfxKk746N5LbNuXzw8PKwrkLueAOJi97kLyJzWFa6wx6SHSjKEFg
         KTYcvX3xf3iuagY2nMe32BLa+rFSOkPC4moku+aQAJrRu5Bo5z63jdZYXL+VvUoNDSQ6
         Rh1eAMy7eFpvWDVgag/L+zHdOrZCj8GwoIWokczp/8Zq/+GaF6RKGXZmnDc8WMXqUI5L
         IsE7hdORhqL1y8IUwoRH5dLCSFzyJEADKXons70X9Kikbzt5rUxmzgSkb4Coaz39RUFo
         cB7hBKlVqu7iMkh0hii79aFYKiKPqkMGap12b78nxtwnMPdfOSYr2kXLxdQ5KyokY2j3
         i5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780496443; x=1781101243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f3qz5dCqPWjHtxCe7c5xxtbgRMST42WBTL9nTD2Ij+s=;
        b=mLMY0rHZF03d3TVLW9LDMMmSbzxPKuH1gFl2li/nZOWYLKAF0YwqJ3xor+ECW6kBZY
         cHmKw9Z2S+eDKyTNV27Ggknd3/B8l1+YLeP22aeAWUl9Wf1W6tJ7zU5KPDO0ZCHd5lo+
         NRZn74qjnM52aZz8Ps2KW9k0Eat5GrWM6U2HVnZjvp8qpNgU0XBeiFjyrhQKXTYybmZ3
         0nKfvIMcIr+EeB3lW9kpqQKKxaqkXwrHm01m9clzc5wmVoSdId9gYuSLpSW+XIOnAzmu
         5jadCCHxgGIc0v1koUZNcLzM7xow8BayuKJvEcpNQGsDrqDx7Wkkkm4KWKAkco0KL7OE
         KTmg==
X-Forwarded-Encrypted: i=1; AFNElJ9ug2hbeuZTDRpLaUHtZNpS24WzTUnbIzF8dvivlBJWxOM9Q+y6hDXMalD07ORuXJ455vigRA6wXaE4wsFT@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeSI60wHMmi458hRjNgQ5ydm5otBztowSYdh+XEcCWPK2zWvI
	vvWYqB9fixAEpcP7ux7HRTZ4uGexPfbSJNNIkpMJzKrjRr7mrdXKAnZvTpST0yb23T3b04IYSi5
	AKw2OW5xvGUP6IDPJFpXI2sz4htPBvYp9CD7dU9pVCzf/3mDHIWRyaMUsxq1skLf67MC+
X-Gm-Gg: Acq92OGGlaF0+uFK+u4RTrkxTbYZW15s3Y7EwDOgd+wI0yVleHfEFo0vR8B+1Qp7Djb
	tnydZYzEluvj2l3FkE1uiXOCfAYksMoFCZLgKhyEWbR/s62znQWxGXCYEbKXZvBoDFdobKzJiz6
	4+0kSBE3+dcGVsP6hJRrkD58QYAghrMXERZHWDQbw49WxXlwMM6tFZmqJm6K3vFSTGpzO45z5p7
	zimH3spTWth/qCSEqRReWGajYJ6n6abbQCY73IzGjT/OGaS5DQ/AxX2aoTft4GOKQNvnP2COWeP
	B+k4415mFK6Qgg5S/vpDXS3oClkUZ39/+gzyDFQQ2ZFYsHXZYqKBchvR3VwLTgNu4C2HMWQc1Mm
	xeTfmnyTvNMoMBRPrZU8TdZHNvyhnBol81p3XIEiIClO5FR7+pp4S2Vk8hc+eSIc3Dw==
X-Received: by 2002:a17:902:d48d:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c163c527c5mr36692635ad.15.1780496442742;
        Wed, 03 Jun 2026 07:20:42 -0700 (PDT)
X-Received: by 2002:a17:902:d48d:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c163c527c5mr36692235ad.15.1780496442248;
        Wed, 03 Jun 2026 07:20:42 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm41514955ad.9.2026.06.03.07.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:20:41 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 19:48:42 +0530
Subject: [PATCH v7 04/12] media: iris: Add context bank hooks for platform
 specific initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
References: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
In-Reply-To: <20260603-glymur-v7-0-afaa55d11fe0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780496410; l=3955;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=PuMrtg0kXudsgBTKAPN0KLjJcY60dOingG5L6cBwKzg=;
 b=7JmGH5FUMoJdANbTLdv601LbY01dHrrguK95asQPYHBDW39sAXKNEk96RLOS9UnFMalL4vuw6
 Gb1VFN/2sagDYKgssxyssKQskUmJYaDOHEcwtf+LfXwXiSk115DSfu7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=R6sz39RX c=1 sm=1 tr=0 ts=6a20383b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZwZBACt1qYONU4SPBGcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6AEqqQQ3ux9CzKQtXed6uMRkYJllP_dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNyBTYWx0ZWRfXzNAwi2XnaPtI
 ex/xNwhfOZBZJpEMGRFx81WEpMs3KBpmD7tlxq1/p/l73XjVaC5mNyvfAcWn2j9Uf3Q2oD41V0W
 DLkgGVVhLZG2YWh72GBMNiqqsifba2vualfijjsU18r1lW58SbPufLad7L0tqff6i5Rlf9EkPmt
 v66gS5xqciL9W9f2pplm5xzLjCL8RyVysybUjQWB8Itf6qm5PiFTtgzI4XLP7GWztxOn1KYOXMD
 aeXseAy/KmlNbdDSIcE0iXCcSL9gxzufvVt5AWS0ApdTu4Z7TuKQFK4MKQYvgvH1Vfj+gNutxZJ
 rbBRs2W8UMfht3YFErnl5M24gU5DkEYPYtrUB2+GH++JgTIW6FWyIFKS8P1RI8o/C/8yYbdD2P3
 xL4YdChDMBX11inlkOGTHpyvB9sAM8BglXhk51ucRJgC83pIAengUduBl+8XNU8a9oINVIkNFSK
 ynkTL4AOryzjw4RrPIA==
X-Proofpoint-ORIG-GUID: 6AEqqQQ3ux9CzKQtXed6uMRkYJllP_dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110995-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 6E869638B60

The glymur platform requires a dedicated firmware context bank device to
boot firmware where linux runs as the hypervisor and driver needs to
manually manage the firmware IOMMU mapping.

Add init and deinit hooks in the vpu ops for context bank setup. These
hooks allow platform specific code to initialize and tear down context
banks.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  9 ++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 14 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  4 ++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 52bf56e517f9..89dbe9bbf6b0 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -19,6 +19,7 @@ void iris_core_deinit(struct iris_core *core)
 		iris_fw_unload(core);
 		iris_vpu_power_off(core);
 		iris_hfi_queues_deinit(core);
+		iris_deinit_cb_devs(core);
 		core->state = IRIS_CORE_DEINIT;
 	}
 	mutex_unlock(&core->lock);
@@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
 
 	core->state = IRIS_CORE_INIT;
 
-	ret = iris_hfi_queues_init(core);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		goto error;
 
+	ret = iris_hfi_queues_init(core);
+	if (ret)
+		goto error_deinit_cb_devs;
+
 	ret = iris_vpu_power_on(core);
 	if (ret)
 		goto error_queue_deinit;
@@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
 	iris_vpu_power_off(core);
 error_queue_deinit:
 	iris_hfi_queues_deinit(core);
+error_deinit_cb_devs:
+	iris_deinit_cb_devs(core);
 error:
 	core->state = IRIS_CORE_DEINIT;
 exit:
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index b6acab5a8978..23a7ce3ecb2d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -319,6 +319,20 @@ int iris_vpu_switch_to_hwmode(struct iris_core *core)
 	return core->iris_platform_data->vpu_ops->set_hwmode(core);
 }
 
+int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..e0dc109bbe6a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -33,6 +35,8 @@ int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
 int iris_vpu_set_hwmode(struct iris_core *core);
 int iris_vpu_switch_to_hwmode(struct iris_core *core);
+int iris_init_cb_devs(struct iris_core *core);
+void iris_deinit_cb_devs(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


