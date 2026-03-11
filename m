Return-Path: <linux-arm-msm+bounces-96874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNKcMRcHsWnhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:09:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65A25CAD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C77903019FF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 06:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19FF34753B;
	Wed, 11 Mar 2026 06:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBb/9NZM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+GiDj8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BB2F4A05
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209362; cv=none; b=Lx5fBfKcxAIPKo13OLaMeUYsLXRYvmB7Wb85lQiC0yiqBGoWNfE+VuNkKz0kQh9WqYcwYv5G9frBcdDeiq3WNd55vIJSVDUU7FyGluVWstyNrRDp4fx8+nbvZTFDLGx6ha8hFJglGMM6JzNEvSHvdMy2KJ8Z0dHGKVzkgjNEYtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209362; c=relaxed/simple;
	bh=WHXHafAynHKkHVvFrmMCyz5FDvbxOVRJIvIcU5nzCzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FT4TiKA/snbtnB/OPLcT5EDfZp+Ec10nzAXWKJySXTVpNp/bTUWaLb0ozXQ3954QNyBi/6oiWJbnNWjRXU4dQLHilFjJq0WkMjQzroMqBWJ8HmjAQx2XAXhf36Ka7AF3AxR5CpXiHdD22ORqhLXXN7AfjyjAuzjmx3tcyWTWPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBb/9NZM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+GiDj8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3onfa3760222
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/iY6DYMUe5OQ8UYnYJIGI8IsR1zVKVNzhI6
	znnStA9o=; b=bBb/9NZMr7b/hblHfreL0grBCwZILRn0RHnoxRz9qhIIWYuZ3mp
	ka72NxpOi5X6HAQi/j9R3wN4mmFYOMhEACYXv4TXGkG57Gfb8hmWDJSNOcHdfCsU
	WTUHZ/2DMbSFS9QyyyJpJqhBSKBNLUr/GIVeXscw6fL2k8Fp9qZV5bA0TOyl542g
	bHUFviJx+02WrybY4ZYpK2NsJvU4JepyRniEdcdh+uIPXdX2FKB9DsoZMkRQjORZ
	mUTPywQLaP3pBltEYEtEM6Wv9FbsJx4i4ffaf3+ZGbMeUqSfrnmzdu/1XnmiYcaD
	6l2/p4cLWCy1M7wNTybwQfDzS5qStZFK1BQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ukefq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:09:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae4e20a414so594358475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773209360; x=1773814160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iY6DYMUe5OQ8UYnYJIGI8IsR1zVKVNzhI6znnStA9o=;
        b=d+GiDj8F4keAl9a63p6BXvL/J0ARyrutgUNQq84+bpH/hcclWvVhMG3RIfxE1QtCi9
         V9p9B+U7wzEu91qaObq9NV7YGtCDoFsuoz+EgqFq14HlyW8X+e4I14Q3Fl/XRCiQkVE4
         ITlnMtej2gO12DixMQJp5npJ0CQihfqJUGSk196vuVw+t7GKeelVaOZ0v2KevtAMsZjN
         MSSlVYnoaL2s0IYlClzfKHzrawF41STev+7PACunrLtgCjwMu2YR89QjmHMOYakRfRvb
         VObsIDsuEHjuZbEHV7U/00geT0xA+VjyeDjJhIfDIwHsByJXnol2IHNB85eH+P6O5629
         RG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209360; x=1773814160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iY6DYMUe5OQ8UYnYJIGI8IsR1zVKVNzhI6znnStA9o=;
        b=iZeIlNFoXeePjzSbvtSSlcRC1LbuwnGDP82rcMa+cf7kpQHxhSijAowQ5dIofJ9a59
         vhT5Zw+EbGOt7kqHGvG9Wrun1dKlpgryETEFKpDCPqNhQRr/jZK65pzT0S3tzc5EX/9s
         9DgzDe4I8ee6+KBYfQtjSXEfEwMDQvikSCeF9kBOulckUrWmPcHW7XWiES5nYfa/MJP6
         5f95yEWgY+zA5mDhGN3y3PMnVKd+8t7sNIlpL5b4MLHL0zzfOtQBdYPb2oYnG59R/QCi
         iKU8CI58EUvbcRmeWe5+6yKjDYKCftlkF1dbHl5Wy7AFczErMGQVkeAjcS1CZhpOLafw
         m60A==
X-Gm-Message-State: AOJu0Yx8JY2JwEjO18w+Tomx0ZPm/fGtc3e7F2ZLjgE0E0hW8tBVvq5j
	k1kb77sdS5N4BAn9SBzF5FQccokRTnVKC5RqPZpEGcXWbBszIkFWKYc4SKY+OiuGGY8EHlha0nR
	1mqlIq/ubEzEDxB5Hu8j7n2GwxMM+YKnripi0eC3fl9T4o1e6+t0U1BrOnoNKTzTvNxZR
X-Gm-Gg: ATEYQzyh3R+/22lRVOAmVR4aCXloLHjqchnze1CQBsYpUlveUd3w8S8asP4YMjAH2T8
	fa5yjJlQvlCJd0nD9Lc1Pzf8iMwVNL2f7FbGmFHEDgZ3azso2sbmiPXBJ8qHoSA+wNYW1SrroT7
	MOtKgYIk8WZyBSuY9EI0JKecmzFW4IcYy/xvdi8YwcI4olAuhlIvM3+9gtKxmpUEypdLFD7S/oK
	we9BZ9lYxxZBJ+0bIVWgtYn4ECZPO0FmL+zRLU/wYJH3w1HuldP0mlrkeLjtqr9KHMmFtqEb7DR
	Z85MB8F1aGEzXF0gI5QstOjTUE9Uzq3nQGU2i0Rmub76DK6mVZM68BVxo01LvU8SxUOxN6VBRSp
	Rp9zEJaFXVHaEk3QwtKS4tMSee1jkYswyjaqQ2YKOIXG6C1+5hLQ09g==
X-Received: by 2002:a17:903:189:b0:2ae:5223:59ac with SMTP id d9443c01a7336-2aeae7953dfmr15618545ad.13.1773209360186;
        Tue, 10 Mar 2026 23:09:20 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2ae:5223:59ac with SMTP id d9443c01a7336-2aeae7953dfmr15618375ad.13.1773209359775;
        Tue, 10 Mar 2026 23:09:19 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246fe5sm12433265ad.28.2026.03.10.23.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:09:19 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v1 0/2] Add post change sequence for link start notify
Date: Wed, 11 Mar 2026 11:39:10 +0530
Message-Id: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nuEJIkaNyRmEV5TFzs60u-fiXLonklcd
X-Proofpoint-GUID: nuEJIkaNyRmEV5TFzs60u-fiXLonklcd
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b10710 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA1MCBTYWx0ZWRfXw8UblhJSIsZa
 hySy7eM/xTPpzDcMY05UgZhNga6IvudIY31cvcaulrs8r2DhgaksmT5W6vgxh5erCVxO4ZlcpZg
 8ANAUesJOgzqgb+6Mop3fYQJxR2tMcq4cJBTOEBAx0Ydb+NUoM3H4Cd5Xez2nelmM6aB1t8hkXs
 M2PTDckMG4a+er/EQH8VROR2j5wNKpe7NWElyu6Z4Yawax5UfG4cFjepjNX3s5cyabn29+SbqKH
 2Gi8QqHrZaQRWrOTyKTCRqFB8Vmt4R7EOsL/aqr0YgvFTIFKXgRCzpgNn9JJwf0pQi6GjwC3T07
 3AO1xI3Booj+6CpkAufkvqIbzyvXtv6xqodjjGXFlzkCtwCh9ohYNL3x4tzEPpwUlRb8USGRUlY
 8PPoX/lqv1rmeZyAtZ5v7bvYYbcufSzRPrKLg4HmlC5/VimzQ3q2BuZ1abmLmqqMu1s1YR6R02b
 xffSoZ629ImyA95HO2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110050
X-Rspamd-Queue-Id: AB65A25CAD1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96874-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This patch series introduces two updates to the UFS subsystem aimed at
improving link stability and power efficiency on platforms using the
Qualcomm UFS host controller.

During link startup, the number of active TX/RX lanes discovered may be
fewer than the lanes specified in the device tree. The current UFS core
driver configures all DT-defined lanes unconditionally, which can lead to
mismatches during power mode changes. Patch 1/2 ensures to warn on this.

Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
the UFS controller autonomously de-asserts clk_req signals to the GCC
during Hibern8 state. Enabling this mechanism allows the clock controller
to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
support for enabling this feature as recommended by the Hardware
Programming Guidelines.

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 39 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 11 +++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 61 insertions(+)

-- 
2.34.1


