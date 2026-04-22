Return-Path: <linux-arm-msm+bounces-104105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILm4I+O16GmgPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:49:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA42445910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E0CE30211C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9629D3D1CAA;
	Wed, 22 Apr 2026 11:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCkyuxSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gf5QhpIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCAA3A1A43
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858592; cv=none; b=ALc4aLey5neE4n/LvaisMABSsRsfNI2arvug/p7pw1Rg/2cd+U4nG/Lnnfqi2czSdM0dG7h5H16GUYl7emUUfCyuv7b6Yv5map9w2ynlYz+iQvH1K8tmxPJe0XMxsNNZkmhfWPao8xO+Npja8BaliltgoVu+/oDv1Yw8pGiBMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858592; c=relaxed/simple;
	bh=ZMaK0X40FEFlzwhWQ7WxGRU+7OKoGklGGBSI0TMpP2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Eq8bhW2bBSvBVM2vK6pYNmFreVlUdan1SPxQxISC7vLhTQ9U9kk7KqJMVCsCz0ZKGET4thRyE704BsRH/Gh/Ke0oKhgwkD1rVEx9BX6DACI7U14yrUJ+8GOLNvTAU6gV+O2i6M5e8QmQnhrRdNWOO+hFKJImsF3xlbhiA1KScjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCkyuxSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gf5QhpIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M983Qt2637672
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kjmyJu474LRd6KvQaKEAhntZ2nGNadIY1Ew
	xUoVlISs=; b=RCkyuxSNqLeYSuqhyOsdUYsbxVhh8M6Yvwh2eCS2EbdysAECvi5
	pE5rppjpEtNQ23btwNZ/S+bTjEpTJTaMukid1qvzVFSxf2BPFi1qu9sEpP3N/tHO
	d97HP7jfx5TOjpekAYGLOJ/f8YCkk9r5hqKQHj7+Jkl0KM/XuaSGBoqCGRYyZPca
	CteoROIoUqj3mkwWabNjZX/0315dAewB1I3B3q3gduwpnXXqw1Q0Y+J6Er1U5klu
	RMl7BvNrzW/YqR9enkuszGIn5wKylz1IL78FRpHQOqBRHyRtjMMVJCEBZCOtREtl
	Hcf+hNsNcDOR6Vrj1MhjoMsoLsITbTZjvWQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhb5vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:49:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b4678c6171so58481255ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776858588; x=1777463388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjmyJu474LRd6KvQaKEAhntZ2nGNadIY1EwxUoVlISs=;
        b=gf5QhpIoQLkmJ72QxqipLpmdMK3HjvMmLxWHCcNFqqDtOgtK/jbq7KfSZt41z8QM06
         yv8E5RciHWT5KeVl6FjuF6XY0g+jvtnk6uAlvbItvLzMCRcIxWcKWNq2F28ivoJKiXvn
         O+RO28l1DZHxtSU6q8d9ufbw/p+fnlj0ppDrGdPj2JMphMh/twj1M87Kmz3dMQAB6i95
         MfKtWyigt992KgEapRFnL8mhbc94MzVlbmQKrkxf8v52fC9QRl8blQOFyTqatwMfxHXK
         A7wnfDsBZt8bwDiKYCYGnyylY5QnIvCBIbH58BcJpRnlS+Nup649xWQ7Z7xX6WuCwh5Y
         RRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858588; x=1777463388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjmyJu474LRd6KvQaKEAhntZ2nGNadIY1EwxUoVlISs=;
        b=s/NwiT5c93wjTWA6YBOGgiq4pc4SutJyZiZ8BriDdhdRTqovo/Ut5GBn/BwnlPx7qa
         gbKukfYDLZpf74ANl/w9mRZCgTOIu+6GXD4piA87XxoQHm0KSgUF3FgBMnRNJq9pQvBp
         oF9+dOG/0NSrcw2M44n8y2bbnPhlSWOBOwCznpy9PkMaNaiV1VtyIJCNVjB1ipdnaW6b
         M79sbov7itXwlv4eVo6Wr4y4rBuAJXvOzIgb7I5ICKAMFviY2ktameas75QpRtxQhtyo
         u6Izoea73Q8m6AWdFFvDJXETEW8+Z35hIvz9iSpS7OGgvRZYPuXQjb7a6cDATZLx9DL9
         1anA==
X-Gm-Message-State: AOJu0Yyqk92k2nSpDyLfj5B58ubk1c6G/ybDQJR0/kqEi5gcUstNfsJ4
	NDBSg2rl9U9qSWzIh2gcsSF2sZpHDWA1yOkinPxXjx+zp25Gh9tyDXSvWjklk3lu0kHBMVmV6yQ
	imKiHWOI/jxxLf9mL5om8RDRimHcAxjXXtyQ8zoitJfYtl5pnrxDx4/xuWZUIVIIWLDs0
X-Gm-Gg: AeBDieuxYKu+lxcKPwaEjwaCbb48yxA6ZdQuAGSdh/5zDdLcss+ulEBNu1Q9R3HxqVM
	n2ZY4NGaaaJXVjGK5IdTVVj5xN3RNt7oeytgRqhM/wWxvm2c3Vo+cpMnv0mIksEmppM9AMT8OJ9
	LI1JWKDS8Vv6IMAGB1Jnrr3M0fC1jRRoYyM3EQ3bYJ/dGZf+xKyWW/nec07Uwn5qw2AAEb79Hy+
	nhzDHKgHxlGZZn1rmaw/44buavcaOGXjG1joV34H9Fj9OF5iiv10mOE1lZnxSlgJEkCqN9j+nmo
	qS9CtdQaa+vT2KWMZk9pu6TWn7DHXSGaOsW5varhi2dZ6SE3yNbDXTvjPJdTF/AnesjGaRsIYGW
	Lnj1mgQ1SCD0Ifz/dM6ArFh8EG3O7ydO6kX50bpnbLjQCg69S7hZ0gCCwDg13UTOd
X-Received: by 2002:a17:902:868a:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b5f9fe1e73mr163777355ad.38.1776858587736;
        Wed, 22 Apr 2026 04:49:47 -0700 (PDT)
X-Received: by 2002:a17:902:868a:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b5f9fe1e73mr163777185ad.38.1776858587278;
        Wed, 22 Apr 2026 04:49:47 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm163047125ad.34.2026.04.22.04.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 04:49:46 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com,
        bvanassche@acm.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V5 0/2] Add post change sequence for link start notify
Date: Wed, 22 Apr 2026 17:19:37 +0530
Message-Id: <20260422114939.2901925-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HdUkiCE8 c=1 sm=1 tr=0 ts=69e8b5dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExMyBTYWx0ZWRfXwjFMU+OSYaUZ
 ZWxZvAy7EGUHAyDMZKrWZst5u+ySi2V9J19AzcbEk7WU891W1lBhbXdFSV7CHXvhC2SnccghjpJ
 CVDhnQKpYNpQSEgYIZgNPkIV/g1+XpYjY6q0eNhVd8x3cxdmjrkUFFGMVyEUAru+72mWyH22UJZ
 vEl9tbvaTsVBB8YaQsppBAbZJqEtbizugVeCRCTBAgR2xcZDO2x1rHg61D+J2z9gi7FpuX6wbeM
 cglU+LCsqEk9CPu5Fn0AHunEBJlp0xfkGSo/fW06Fas96NlrMg7FnVKzV0AtaYD19c2pvyy/jcU
 zaH8FPf5/qP43mp3WzEh75zS/wiYO96hUcBFa3bqyIOfrbFUrbRupPp1ATz6tOvGem2C3AVwNxp
 yLpPdW55pnFQSEAKN7BA2ioXAOEnbjNjnIhd6QB7LRZ2gceonl02qPmsAKBuRyusjfK4sU6pHYa
 jeii/YOitsks7aolCvQ==
X-Proofpoint-ORIG-GUID: ucMKeQsSqDHDZM4lG-fJr2fdr-4kd85T
X-Proofpoint-GUID: ucMKeQsSqDHDZM4lG-fJr2fdr-4kd85T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220113
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104105-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FA42445910
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

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 56 insertions(+)

-- 
2.34.1


