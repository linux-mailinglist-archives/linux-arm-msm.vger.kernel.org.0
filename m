Return-Path: <linux-arm-msm+bounces-117970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mp94FQ6YT2rtkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:46:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C873127B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UO+G1N46;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NmrpZZal;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99F4D3082F94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA96423147;
	Thu,  9 Jul 2026 12:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A202F42849C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:36:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600593; cv=none; b=VfcB6g3/5eKRjf33RIjUjHAcL2GOjkJ3ER9DD2pDGpioMhZ8CAQYEGaB09iWct+ee8RgsPFrsnDhN/qOe2kF55G2QR2zo5Ic38OfisHf0UR9RcSqbHV5qbrDpFlv6KSfW9NAdlAZvwoUIeAQjWNFNlAbmpUnPtWnxkfnme2AbrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600593; c=relaxed/simple;
	bh=Tm7A6NvnCCqBibOVq/RXY9HEaznEwFuEPzjPy0tdtvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYVIE4Q1RVJ0XaGB6SJhi1Y2F4yKYHjTQX3DQMylAVABclOsDlMtLhd3KdvCyPX95wKZWAkXaPJtmBPBkCSstkt74TPi34+NBpwvYIkf7x8f1ORku/FYsE0ZA2pM8c8gvbe1EUK97q6Wdipi5sIbGhvAqsumvnn6E6Y1vvHVARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UO+G1N46; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmrpZZal; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN5Yj1525090
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=; b=UO+G1N46Vh5g1McS
	zaYY40ZYsMm+QoCuULJ96RVSXXnbNYPqaxfVybrkIMQEfpsIwhw3K5iYpB+WXvR0
	grS2JdQOIWOGhDAhh4JcAPQL3bBLVD0eLlHFdzDSAcOWJLFtnuko4nAJwug5KEse
	auyDS0it5hBm5D0lzgbCi33a5aMjRoQWHonhqw5x4erFpWwo+pk3PYQ55Ud5YaJ0
	ufSUyTarD8XsDdcb0mP00HwqC4R7lAi/EEyPbX4Lp7b0OLziyU3arPOwLA34+lwu
	soS3/A0gyF33YCQbk6htXXE6FRLRpyHvrg7LjzAxckKT8qQHzmYWQBhce3R7c4iJ
	iE5oTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u3vas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:36:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c892143db7fso1633450a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600590; x=1784205390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=;
        b=NmrpZZalOLZc97H+hPYn/qRYX9wd1N1COJ7R7m1gElCF7AC6eeEh5qdrN1Dj79xEkC
         zRnBZQoqPV196TLeHEv8cvvVHko1DElSDROM/d08UhatxkXbYXzI5grCP6O5IE+J8B14
         QY+WBl3CKrHBd2C/d0cvghu+LhXrVZfe9iaPzynl8Kebg8/YbYx68tbFJ6QapBORJ3Iz
         RHS4FORMsSCjbAJBVkLmqwwoCP3f+Q4L5zv4tt9k4G4yFJaxFarmZErBn9cL7Vt83wDc
         HFdyAMDwN8pcDLuM+aVcqW4q0f0vqV+RhMZrfHe+WSH3keUTKaLaD+Ajm1BZAvWmG2vR
         hh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600590; x=1784205390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSpjqSjM+b7BmSqEDHpKl292ZZ+i9qmZXnDU3Sgz5hQ=;
        b=K6Nw/KwIUxdI1MF6ak8ck2mGEM+773J2ffJRxn4RHXRQ97hAZ2vMvTAqtGHNHhuDAv
         Ig6qReMvMuJoP9l3RM0OaQOpiwlZEcwT/cOUZEHAZBQRoEi7LnS6SOk+pNkyEOii2RkG
         Xiaw4acs9f1CtuHdjInblHRAu1+rUrXv9lTngGaY5gd0OOsd601Io/K7e2rWKY+qqsYJ
         o6Kuca3Pe4KfDsR8Fx6q7hUqh7y7/zD1cwL6gOLJDXgFt0dqmJkDBlKIcNJVwiSB0+dr
         WYGlNPAdqerqBHZ6BbNLJ/5tAVp15Qbflq4IXeAkUQNLuV50xW0tyx3Pi5GiewYEFdzb
         V0tg==
X-Forwarded-Encrypted: i=1; AHgh+RrdMnb3qAyu/JfHq8jNt1pEakTMJyQr7Nk03X7mH7LlSpg5d4s0yjVBL5MRsxMcyUeEy+Liyr88AbTp5S5J@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp9Y3Mg/Kbpl/YRGd4zyKWGVXKtEUeC7STSZ6MqHYFC6s4SNwH
	14H5623imjATOEVbzDWrMHPv0e+BwVgawrBh/3uFufNxWOroWxq3eVsxoh+GO6HqXDp+M9mbjJi
	7BPknr1dfx3Z5828YO7wKgC0ivsfJhSsZIETZWT6PdeQNd5RBSp4RYFDI1O249op3HYeq
X-Gm-Gg: AfdE7cmqeHjdF2o+Zld9AguWWJ+TQVnQ1/z8alNja8n9ugPUzSb4pSnnkXTbZWkKaFl
	37fdEPFGSrTb6mCYFpZraiH7Nwh/+FBcnmT10bNqfOJRoPLUptmvELSDHwqdJoPCUC6aIWILDUg
	Ip3o+M+RSZ+kngxpqizqjb4GlcBN+qQkPLbeKpLW/rOVHBNj6RnMBW5tV+sBbs3vxv5oQhnIjS3
	90OOCgqignKdiahoulNq0V+9BcKnPZjXDyTSdAIqRGxrCh3eIZi0GYx571flR2o6QR+PBenwoJI
	x+RMpjBA3f9clRtJGm+uKjU7ppB8+Ah6Ef/H2Pnogva96HtwCRUkGlEFHprxvwOd3GpELISXI4t
	z41SGWNwDhp3N+3PqVDvui1fQ+Xr20Tf+QJCZt1kegzSTKw==
X-Received: by 2002:a05:6a21:329e:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c0bd223269mr8640669637.58.1783600589964;
        Thu, 09 Jul 2026 05:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:329e:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c0bd223269mr8640638637.58.1783600589500;
        Thu, 09 Jul 2026 05:36:29 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:49 +0530
Subject: [RFC PATCH 03/11] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-3-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=2477;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Tm7A6NvnCCqBibOVq/RXY9HEaznEwFuEPzjPy0tdtvw=;
 b=LYawI7Ra/lbR2eBFf6G7jHbubydW5b21BgH0BpO/q1y1V6Dld3LYNkV06a6ueb9CWGEYOHMhm
 l0IoiCfERJrBY0kS05Fphunx9jFWEEYLsil2E/4y3RjKO9+dnENhG/O
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX0/BPf+n4QGGz
 ZRXCyN0pmyjcYVGPU+47a4jarnZd7f953u3QjWRgm4C+KHcr43vWVyXP5PCLjab7fsfZoU2IEtS
 4w96FOPRKcIc+3qYAbcipH7u4bAcvb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfXwXdksLiutkvS
 eAweHxX2Oqr6UMX16BtK6ooTcE8wiu1EY1e9+UcJhE5xzkSE8DnfgkIXH/j5ZyLLmYoOoADM5pm
 53/v/Lb3kTk/MKblvWFbTT7So4aQhg8rZdFRBN7nDEAsPAv4+TpZLgXflIYoB1+S8Ji6gEntGb9
 ItWZNMzzu+qsclSHBIqIvCC8vmaUUtQv0iom6g/W7VwizmYlYyj0lYHx6LpD/ucSOjUHtdcYhUY
 fQdMhShgiJVnR2k9qNWK8MXaHqfRgkwq39lTnIDpESD32tJoBJcneVseON6sabnZzqZLqA3hVIa
 IBUTJ8/WwHTq0Blz9f7pTY3XH/bJDREguNu5CWDmfR0oI6WwspNNNEeAorpQwG4QoYgrVxxM1Ve
 CKNypTgsvQCv+FmTEDNKTULyP5eqajbHKhTJWKeRlbGt6wp/8NbLcfD+EG49SJxa7MB2Wj2My+6
 xLRsdgLG0QVBh8MpY5Q==
X-Proofpoint-GUID: BouBNf2BCkHcl7Meb2opb8pDeKrOCXVI
X-Proofpoint-ORIG-GUID: BouBNf2BCkHcl7Meb2opb8pDeKrOCXVI
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f95ce cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=OuQ8cFzMgRPpZ_G5cMkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117970-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,plat_dev_info.name:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 474C873127B

The subnode in the device tree is registered as a separate device so
that it gets its own IOMMU context. Pixel/non-pixel buffers are mapped
into these iommu domain, to ensure they are within the addressable range.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 23 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a257b8ae7332242544266cbbd61a9..f550d194edf58abf0687a4f5df6d06b2af35147d 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -141,3 +141,26 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	return &pdev->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..ca53c01f60aef2040002f526b8f1b6a9094d1518 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
 
 #endif

-- 
2.34.1


