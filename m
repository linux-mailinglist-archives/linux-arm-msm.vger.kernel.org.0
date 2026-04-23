Return-Path: <linux-arm-msm+bounces-104203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBEFCVm16WkJiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:59:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA99B44D61A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 07:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 392DC3015E1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 05:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B473CD8CA;
	Thu, 23 Apr 2026 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhkdHGLR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BvzQ4llM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562D3CE498
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776923981; cv=none; b=fdri8B3Snpm8LwAwWSk0NlrIDbvbJioWgu8vejsSqCYjA06VMgFlXAS913kIPTD1VJ1ILfT5I5D1ygiVdWzuihnlRmXlXF7yaQi8ASKVG5vUehzbNeNugXdjTpfTHoEx3xL0bscN//sEa/bWOe7PHaEuMhLr2RS5HeNhVnGeHJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776923981; c=relaxed/simple;
	bh=CVgarFTME8J/zzzPOxQ1NifiNbNg5Ee45XPRFBAkSjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UfnQBct5cdcwFn8K5mvnRHOKHVcRSYVN0+VzuEXUE4y2dbRSJVcCcMdPGKeqtGNU1b951o68IHar8ChpQ8DIqbjTkZfw2naDAfHtYl3U23IVJ29NumbLPL700ZWo9p3zKGAZKfFeTbbYqKJXmKh97iv5Wne+/gB9lYpIe8hm4UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhkdHGLR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BvzQ4llM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N37xaY2012001
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UafmC+M/+1YBMEy2f4UXF/XXX6hVc3RZaSW
	5mWq85tk=; b=WhkdHGLRmviSZWs+0dU1S4sDg+Bj8PP6qFkAA4RAdIkCFntGGGC
	FDLXwo/VzaaG3syy6BudkR7Tn5wjzzpvKfK/E8vJy1/pocbFAPY9AsbCiWiUZwda
	Hb/6oyweQeU0c9lvT/72041B+FtKd3U7LtQLVqo6A9JjhJg2xOElOgWjlBQFQFkD
	GT92D76AfOXKnc9eH4XXi4nt/ve/emG0fO28n+o1h/JcNINAoQP9xdyUOc/Psuab
	LkP5uM058J0I7dPKHVhIYTGjaOu24P3LwStcjM5Hf8G93e5azKkztiWAkxXgPEpL
	EmClOUDH4Ao4PHDLCT+Vkv/HwFxXewa+IpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7adp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:59:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so6856234a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 22:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776923977; x=1777528777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UafmC+M/+1YBMEy2f4UXF/XXX6hVc3RZaSW5mWq85tk=;
        b=BvzQ4llMKrzNw9axnn3CPS7E5/uk9AZMs85fglrWD+3IpjjzTgV2Vks4y8kSc3KoK1
         3OsQ27URc6xrF8d6PHl3eynEsuXyFlkXR+uP3ZJJSy/D0c0fgx5vYhp1aixntAplVy53
         /FEORIQwTeSAG0crz888NJwWPnixOOUH0+rHso/94J36y78lXDU3C8sj7xru2mPv8y+R
         KqGsZnt7OHWO7X66SZ0uRFOPJwDrX74dfOh31isW6GsjLtXHuWnOYdRlgdlPZ3kJ/3Ki
         MgfRaQziPy5dRhUpKlpoL+7ZtBqlC0k0aNtmeLlAGRPTKntrYRg3W7736764a9QvK0Yb
         Fhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776923977; x=1777528777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UafmC+M/+1YBMEy2f4UXF/XXX6hVc3RZaSW5mWq85tk=;
        b=Z/ucPy5MLfhYkP90oHWeIqtq4i/n7OWhs1UROeWY3erAzhAcvRJ+r4MPgJAnwM41Kd
         WShzIMh5rCqrG3B/XmvkeEd9DWDQPQbopuMPoe3d6BslNnARQ87rTKxe2VX6TVLnN80T
         tIsmxIT8UPaG218Lb1Rse/2Sqx9hoG1MZgSzMXb0wfjqmv+VtThF9q6YZpMgeJrv+Io5
         G4Jn4G2L2K/wrgg3JqSPBEqAreyKYPJHTjOlf5lPI633Dt+EsEwTm44HEkSO95Wp4MLH
         AOp+ihzBxpN1OwZJGQwhH0TRkiyuMtpEe9GbnjfJRn95pTfpTUauNDMJDuWgtdO97hyb
         ma/Q==
X-Gm-Message-State: AOJu0Yy1nO8/bX5EH9uzIpGnKfCzWQKjQ++RgqdH3fBB+jAzXEJoxcD4
	CbD0YGggMUHa1ZyhpFCl2jcbESrfRo35qXsZRlEzVkzPABpQTX6SuEq8giuwiogm1jysF8H9qW4
	erGJi6m1lLz+v00YTcJCu6yFlzoiKflEcQPgAcLKUpnmjElmE0xgKP5PmsBTJ8kaniMAU
X-Gm-Gg: AeBDies5FVes1hwYd710tgUmyQVLCP2c0X6g0/9yIaFcjr2ps/Erkl3L6pF4GwUwUpD
	1zi2AokxXuSoqiKrDBCIIHF1L8j+Unn4v+I7DHfnQcUM/m0RXzqLIAGPISa0Roir+p4eoG65PEw
	rtzGd42baMbDzpv9hJsaAYYU/y+4laWlT3N+bKV7e8hn964NvlNUtpRNYlW6GGxex0pS0pXKb35
	xiDHVQ2urM6reEGTkSF2h5qw1dENAvEq1wInKB5m7RL/VTO87iG/cRBcUlcVhwIzsxCHIHLzT4Y
	PVgQKR2opZSqo3j4hIpX1EB3vE5UmvLCY3ortfwXnOCF59tBld1Pmy13ezkL5/nRaG6SIjysRJD
	r+pBxPqLhvI7rdycU/dh/15R3yVDoKvSTQlCjnKWvJ2ZbVkCru/sp7owdv4/HehxX
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24223618a91.14.1776923977111;
        Wed, 22 Apr 2026 22:59:37 -0700 (PDT)
X-Received: by 2002:a17:90b:17c5:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-361402fd6bcmr24223577a91.14.1776923976642;
        Wed, 22 Apr 2026 22:59:36 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361418c3944sm23461841a91.8.2026.04.22.22.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 22:59:36 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        shawn.lin@rock-chips.com, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V6 0/2] Add post change sequence for link start notify
Date: Thu, 23 Apr 2026 11:29:12 +0530
Message-Id: <20260423055914.3566684-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YBDQPSPB5SNRJTqkMommg0dnm0skWx7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA1MyBTYWx0ZWRfX3J37Wz8a9NuQ
 YNwh+lhTRx3GjEPb/jkfadRTjb7ziofLU1l4+4G+Dn2zJjE92uEdNHLcsX9p0Gzae1DUaKMc+e7
 VXaYkOASnGToeDWt22Km0nsO67zkn3J+8dWtEfMeE2c81yZieGF0vxRiPAC3XoAUmVTukRRUwJ8
 Ge5Er4ZLqt9iNHzS6c5aRzTzTi7P94J0O6+ypmu8VZrd7OurAaTXSu0y+6nQnwFGMe/eW508ljD
 duAAWaVEQQCPfrsx7InArWYyLx2ryTI5BNUak8FH0UPVmsZrRsNITdUk7b6zyxd4gyqb3z21Qmy
 9HjLYP/hRsg+st4RAnayiszqU1Skzzmi55+9b16VGZ3vYK0vcP9L5BFJRcst7ChWp5BE2WahYwo
 HVA/pC67DRgjidPp3rtidas6DT7MrR1tLagy02YDuRJBklEKuWL1mt20FjZv5Ahdib2PBd8EsHL
 Zw3iZeQdbAjlWxo3kPw==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9b54a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YBDQPSPB5SNRJTqkMommg0dnm0skWx7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230053
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104203-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA99B44D61A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This patch series introduces two updates to the UFS subsystem aimed at
improving link stability and power efficiency on platforms using the
Qualcomm UFS host controller.

During link startup, the number of connected TX/RX lanes discovered may be
fewer than the lanes specified in the device tree. The current UFS core
driver configures all DT-defined lanes unconditionally, which can lead to
mismatches during power mode changes. Patch 1/2 ensures to fail on this.

Additionally, certain Qualcomm platforms support Auto Hibern8 (AH8), where
the UFS controller autonomously de-asserts clk_req signals to the GCC
during Hibern8 state. Enabling this mechanism allows the clock controller
to gate unused clocks, providing meaningful power savings. Patch 2/2 adds
support for enabling this feature as recommended by the Hardware
Programming Guidelines.

---
changes from V1
1) Addressed Shawn Lin's comments to fix comment to connected lanes.
2) Addressed Bart's comments to remove warning and trigger failure
   incase of lane mismatch.

changes from V2:
1) Addressed Shawn's comments to fix commit text.
2) Addressed Bart's comments to remove variable initializations and
   indentation fix.

changes from V3:
1) Addressed Manivannan's comments to remove extra comment and return
   logic.

changes from V4:
1) Addressed Manivannan's comments to fix indentation and return
   handling.

changes from V5:
1) Addressed Manivannan's comment and added back the missed tags from 
   V3.

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 56 insertions(+)

-- 
2.34.1


