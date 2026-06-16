Return-Path: <linux-arm-msm+bounces-113314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QRUqAXi0MGrCWQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 04:27:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8868B755
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 04:27:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=ka1vVPCT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BB34302DE3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38683C1090;
	Tue, 16 Jun 2026 02:26:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3423BFE5B;
	Tue, 16 Jun 2026 02:26:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781576796; cv=none; b=Ud0lV2esv6A2U3QleMYt3gPStievmKZ3zQn2gsLnHfJXxRZdajgCqUjZ7M5mBFE6qxnSsz8ogsZA6y81pN5M0WHZVWU7t0i3UAzcomeGaA/+iZPy/mCQ7KdaEYp4k0rtIxYGtJWF2WJXrrKevdwwUpThmRgQ7rYXtyOm5X97bKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781576796; c=relaxed/simple;
	bh=ATo86HR1stCHsr3n7RinhHnOzmXNCQLcpelYiZzE5hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tGOsnCac4+TyBDShE5RxJf56h2KtrDm7dqngVTa1UXdGaaK2pcXCmPh3cNf9W9sLyrpWUSzjJtuf3DZk6MxTrYmBe4BmZifbUSrggZOqyJsHXrZIuNPhV6JsTGYZkniKkUYLGMcB34MsCPuSu/pXqXELwzkC+9Yp0t5ZvkodPTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ka1vVPCT; arc=none smtp.client-ip=205.220.165.32
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJrWLg1304448;
	Tue, 16 Jun 2026 02:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=DCIToSqAAuUxIjig/P634q/DCSLKGB/gFfwbWdPS+6w=; b=
	ka1vVPCTeEbWQ5K73cczjxsN64J0fvZL7l0NKJ/cU+0Nm0Lq44ozeVTjjxTdhddV
	kBftqaFx7P8lioOmrCpAlbGNXPOmAu1EqxoHIZn2Dhr/qBm+6V/g9HrHHw1k7bx0
	tzRG9P7ZFHtb8Qw/p7gBzf3ctgpOvio8C8m87WK+J0u6wc/wNEPRUKiJJHEWMM4b
	TcNPp72jxXtj+5nLr1Dzv8n1tWhQHKDE3uTx/1fREnU2DNBxGfTxedH7qvgruNw2
	OlbTz5Ygs22Bt/6eA0v6wn603fYQoYbNzES7lvfMfkE95GfyeCyIG7GCQ9SzQY//
	VhZNTFN8CiGMB3+3w2F9Zw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1q7kn8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 02:26:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65G2NZtA016521;
	Tue, 16 Jun 2026 02:26:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4erwnpnym2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 02:26:16 +0000 (GMT)
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65G2QE2H023822;
	Tue, 16 Jun 2026 02:26:16 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4erwnpnyjt-4;
	Tue, 16 Jun 2026 02:26:16 +0000 (GMT)
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com, palash.kambar@oss.qualcomm.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
Subject: Re: (subset) [PATCH v3 0/3] Add Hawi UFS PHY and Controller support
Date: Mon, 15 Jun 2026 22:26:08 -0400
Message-ID: <178157184615.1899010.4839070160759447766.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
References: <20260526090956.2340262-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=934 malwarescore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606160021
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAyMSBTYWx0ZWRfX60L7k1Q6QzuS
 aKbskshzOiKcHLrQdm/6Fkt9t1GYhd2iHDTsntTsiFpYqz0DCoJuY2f463dTIEEkIaWQgfUQDyY
 f8NRlH/hf5IGudFl3OvfN6ErNW6Qd1bnQEGYnc9gHPTJV+RyTi5s
X-Authority-Analysis: v=2.4 cv=e+A2j6p/ c=1 sm=1 tr=0 ts=6a30b44a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3cHhxUsnBYRNvqWN0XQA:9 a=QEXdDO2ut3YA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13723
X-Proofpoint-ORIG-GUID: rQ2UVnJdIHqp6t8-CSMC5uIiauQd4Dai
X-Proofpoint-GUID: rQ2UVnJdIHqp6t8-CSMC5uIiauQd4Dai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAyMSBTYWx0ZWRfX3jZYsiqQcEL+
 UOM+W3lW+fKfYsp4wiBCXIyHjP4doLef3uiu7jfE5/vK/FDdSq1stVcUjC1hIfPnvqAGNNIzWLq
 6Byu3qgqBGvh3WYdpmd/Z7KCuR+G15D1pt4eQj0qDSjnWBuin7D8PPpno7Tdxq/l/fOpEuoF4+h
 c9TJJzB7oG1KvEreXFercvqFAqba8N4w6+N2PEvOGAOVC2YWK/iQUhzy6Ob+/oppp72uaXI1t7k
 /dXuOuIUVQ530wVY8A+vyLLtSO5+nnmyt1yzB2vBz7reRNX32fmOSlBfqH15oT5J+Ce52dzQ+iY
 EcYn+MZast46BsN4mDIbt9I8uoQX879L1sQHHgXJc1UYyWeKUjjHm8xfoJNT/v5EMDdeGQpduj+
 JGfLJLMsVk5NeTXQTuadi7pe1RF+w2ME38cFMG41BR4sbxcUU0De6AfuWsqwmdu5n98mcUgCCHi
 4TKowiQIlRxBoQAEocbl6GA70dRvpjpxP2qWY9eY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[oracle.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-113314-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:palash.kambar@oss.qualcomm.com,m:martin.petersen@oracle.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FB8868B755

On Tue, 26 May 2026 14:39:53 +0530, palash.kambar@oss.qualcomm.com wrote:

> This series introduces devicetree binding documentation and PHY
> initialization support required to enable UFS on this platform.
> 
> 1. Devicetree binding documentation for the QMP UFS PHY
>      used on Qualcomm Hawi.
>   2. Devicetree binding documentation for the UFS controller
>      instance present on the Hawi platform.
>   3. Initialization sequence tables and configuration required
>      for the QMP UFS PHY on Hawi SoC.
> 
> [...]

Applied to 7.2/scsi-queue, thanks!

[2/3] scsi: ufs: qcom: dt-bindings: Document the Hawi UFS controller
      https://git.kernel.org/mkp/scsi/c/63977ab3c6a0

-- 
Martin K. Petersen

