Return-Path: <linux-arm-msm+bounces-119294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fUdfJHiYV2qkXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:26:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E443F75F59B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 16:25:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lqlTzEc8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KBSERJR4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119294-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119294-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932B432DA6FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4A64534A5;
	Wed, 15 Jul 2026 14:11:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE614611C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124700; cv=none; b=c6a6b1jmN5+nPvXOGCOUYI+qY1sWM4P9fncXJTMeQEWqSRaY5goqncPuZRoiBEI92A/jJ6iODLNfBDd0krOz4AIlDRlNZs3qMEdF8zvA6aVAs/T3W1gntmc8DwdrZcfMZhoBOzv3iQGkHcrJOB7EcCZUvZAybcfVfjhK21w6j24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124700; c=relaxed/simple;
	bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSBxBroR3LT/e88n3bLDC0ZutRVy9CORElD8m546rkdCR4Zj3OXiksGSXXtxH6/NKJ7Z+kJPVYaE0EZvvFsGYp8yH+04FZwVPAaal8rRAQC+cEb3s5stWGKXjArBCRpXposNnpcsiUoU/1rPh9HYiYQe9OhAUMayomRnJ2UKLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqlTzEc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBSERJR4; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE3c5q3806295
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=; b=lqlTzEc8uu+6lhsR
	p0PT64rERBqTMNOoaJ29a6OamYGcs15P0W1NSl5jmBE+oHGAuy8whoMotkIcVCLc
	sSLOiGyW7XYvwbNFsQ3G/Sf79WQivb4xRCMEdVHKzVdBfIRJDiRxX2m4LMBPXptr
	cYDuSJj8QUQ7N69uGtcVMQ+PjjdmFqg51rjRsf3CiE5X3mWY02BxVbsPtMf1Ce1/
	hkOXNPCtxk8eOPhqDbG6ChlI+02IUqWdO0ytswLBGtEFWYIkPOw0F3bD/ZLTFH0T
	8tGN8QEdcfwEm+N7ucXDUu5sOq/wAogG2UTBylrv8Zd2d+gYlByf4I4Ohbq0aaB6
	NB0bxA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h9py9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 14:11:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caf4173b1cso40039705ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124698; x=1784729498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=KBSERJR4EibAhG5nqLAnNzfc8GZ/luHnRWfrz7dZH++ftYHBw2FU08Epx2jOT9ENa4
         Cpw3R7CBrgI9u5P1Lc5S8tFEn9gbK9vVfYLGG9Y/9fNTkVCdfmO9v+L7RZ9aNBi67Fy8
         nyM20QHGuxcknKmpp7slied6ET+SYFz11Q3lZhWaJwpaD4T0Kt3Jcjje47tVfa4AuMIk
         u5D74Z4DkZqWjWx1YzChJzwYTjvU6dHBPCX/AxG0eHGMOzzI0ENF/hWk6daAZzMxRd47
         Schef8Qd91F8nfXLFcP6BFWSsYb6yq/XA3DQhZ4DQpbNymm9le+123HKbh/X0d8MCrAP
         n/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124698; x=1784729498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvV4pvswORAcEQzKnup026bCMWgfqp/zeG31LYavPqE=;
        b=mTG03DqtLciY/sKF2laBl7I8fejSnU9/26c4DoI9ZHs+eB/5qO5RF7KCPOWaqwHXRd
         b8rDkd/OfjP9GGglwebI5c4a2SOEeEsoIoIA6h/uK7Vqoq5ScAYQq8kjjuZ9igIyBOlL
         rEcMuUqyQHSD+bB9nA+l9/IhMPOLXIChUrcz4/yAUEmH1xDNmPePoSh77tCnVKyMWY1P
         oX7xeXTNRlDHDCiOZOpEcUnNCCKcfoLLk2s8G/7ikOtRY6KypYsJb9hM3em4LB43V7KG
         f9Dr8Ttkbvftn+OspH/4srKXZe+13VTtKDyVBjgOuRTskoSJ4conIBj/n9WDvg1MSxhd
         B1sQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF6eePfs5kMrpVNUvL1in2VezxVV0ZutIc4Bl68QXslIrqhGi3jik0UZ3F/aWP2S4U0FH1vHzaOZI4IidK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywig94iTjnR5Sv9kyAzdFK/tv8InzmR8gqv1bgY/DJv+4IB97GS
	0GjmgW1tQ34j7+kWsfiLACii5uOaqsabosD7+x67iOTTiak8WoPcZbeKtWKMTw0KhxCtFIFgiUM
	K2FJYD2USY1WGEeaIapAMIYbteYuCzxhhKkh28WEOENdAE6XiHSCRtAmgt8gwcUCrCEvd
X-Gm-Gg: AfdE7cmjH+M4DApVII2Kb+M2ufx6hJlClpdfIP/NVhh64FyHa5da+tKDHox5iqZxw9K
	okPDpAJCzC2Znug2G4l3duxHH3HiFPM8gKYCgktjHVVD8JPlSK+KJdfwP7B0470QxgHv/dYTBKU
	wZvClosYNO2IyvrehkIz95y6aAZ1gPZHsbEoDQOWZNWweraBwOOK1O+8/XiZsieb8WzBolwaWkB
	VyzJsuzEJISok6uAu8odjYTZrkSDAI84Tk70f1GIARWc+o2rovjFCFBBHEniRFVHHFR1YfcVP1v
	KMz2SB07UiYYHZXFdm56xNmH8ZT64p63dfd0nWgYUgZq8ns9RGIlVBgLdDsLi42Paw/DNB0/YFK
	RpEga/jFwfVWx9+MLlXICnZ721ATvb8GlJ0PGRd6OMcOB
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957615ad.27.1784124697704;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
X-Received: by 2002:a17:903:2347:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2ce9ec0f113mr171957285ad.27.1784124697088;
        Wed, 15 Jul 2026 07:11:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:11:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:40:07 +0530
Subject: [PATCH v9 13/14] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-13-8cf2cbe12a07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=4709;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ThEpJZbAgvG9pFpNsommlTVzoWTwpScz9NRkCoa7E7A=;
 b=9ujYTpL9Bpg/XiFkL/oBYJbhhOvFR9zlKPdFHI1S6pIGQONr89kga4PtLHFj0EE4yrzDsfSGf
 vZClSs2ZlvwB4pDrCWWJ2drTRWol8wh8HdgdZllJG6oDbuMKh9gvFac
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX/Bt/O+3Rpa/r
 Dj7CAPGus/G7HiBUfOsffdIar8GWNE5RAdxFB4AQxnVepD7SIVc9ACovHR7elUcGowsRLaIK17R
 Az0gTQaTwYY7nvVPSBeFMH5H+bzOlIk=
X-Proofpoint-ORIG-GUID: fVy3r3ieq0HIA5lYWQsDxLJOcu_sCKRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfX4oTLlfNalieG
 caU6Xb94JNEAVaexjewgm6rHRKefGok/obOxl83m2vVm8OQwSOpdqU0X9cE6C5lh/hYixK8m3eJ
 NUG0A3dtz6bF/1FBmPoRGNUT8im6IZYiHkUob4fWybO6/bb5FFgN75T7IUOJssZG3w/IttxhBH4
 gxYDLDmguNHO6IL+g5dalNuVY8eVYpUSSkM6CEtjoNiXdp8Q0MXVWeom5BWp09EDN0GogdGq0iQ
 i5CgLhtDvf0xgrTY6xWXGVS5Rm5taT2bThbYBs5upQeBsun73mLGU23juHn5ByYAqvhrKCKFd86
 dTJe1CaUVCabxWmQJe9u9OqXJl3UndXsz7/OhDg5rXbLvRFWAgOw7TOBP79LbeqgC+TPX4WpEgX
 jJykTz/7s1wCYp6/aVky6OgWqNmz5qdLzDpRF2rZpg9Tus88pwbRC6mgaQq3Giop7N9JOFdLhAn
 svVMgFyHmy7il99Rjog==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a57951a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6gKgyGQvtKUNEtbwe4YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fVy3r3ieq0HIA5lYWQsDxLJOcu_sCKRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119294-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: E443F75F59B
X-Rspamd-Action: no action

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 128 +++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..0c09e700f6b5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -695,6 +695,10 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5321,6 +5325,130 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable on boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				memory-region = <&iris_resv>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1


