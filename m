Return-Path: <linux-arm-msm+bounces-103466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJSwDIa94Wl4xgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C382416F04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 06:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB4AC30CCBE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 04:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722E6347505;
	Fri, 17 Apr 2026 04:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfYPmCb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOurXzSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29932E62A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776401782; cv=none; b=dS5dmrnZFhnrmaeGyRB63lC6hgw/bU3kiyVVvK3NiUfBG/bXSKLzZctOUkhhDERGtQO7j5M0GOgjWMQ/g8C2NLlM4XYNZaWJ9sQsSjItp/hWRC8CK0zFt7mIqif1jUyQHzyfGTjNVdBXp7Qf/Uapf3/gXTbkl+gA5Hw2dntbIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776401782; c=relaxed/simple;
	bh=MiqNwpdUTpFI9j8de8EN6WUbCetEbxIgTdg62gd51m8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WolR4ePFtrRML8UBSFVL8Z7YfEkrrqvOfwuzVaav9qR2Ro81Pdah2znMezDWUtdH1+gUTDCsEdNYtkIPh9YfmEUfYNUmK1IgCrYHlu7ec6VvnKqMvDbc9hOBXCnxpSnJ+0pVc7laauugNpzts0NLfWFJo0zDbukkuUHW5PvrF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfYPmCb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOurXzSk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fSVL1092082
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fvI0EEPHps2diWkmNUsTUkelU9aTZHIpLB3
	2g+oyZ+g=; b=IfYPmCb9NDfUYVet58iCwKOjlOT3J8Ohs/vpm2tkLsFCFZFTrMR
	bZy6GeDKRO3btSDUOSqWkYRXAldTTMglJ/gra/FCciTwTL0ZAuiHQ8m3pE9C2LKU
	vyylI4Cv362F18zj4xCw6btj17f2R21i5Yc/rr1yoJU+VafDgqbI6d9nnEhfI6I6
	SFd42qaG+Rz3ByDWl66WjauKzm482l2VWpUrGTIIc4Tpts+t+M18+TqKft5lSKJC
	C458DHoHrn87i4jcBP09WISxBYwxI1XKcD/wqFPAC7UijRPWbROZ4V463MW33Y+j
	t+/LVi8fvCChQ8uCzJcPgTq7CMWU/OLwwLQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk227tftv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 04:56:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so2927365ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776401778; x=1777006578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvI0EEPHps2diWkmNUsTUkelU9aTZHIpLB32g+oyZ+g=;
        b=NOurXzSkHyI4F1HUPvNrS2NiL5p3wkN+hfuxcqpyF3l8oCu65rqDLNuX7dL7S37xTU
         0H/ZyJo579M15eKIYgHAIiVjGjPutr1qEQA25BM0A/+CIj0rpkQG/y3eJtR6nn30PVKS
         MUhB8HMstTHytdX7xsWWyJPHXnw3hm9ncYJP1L3JGHM/Y2n7buAqLEzKgFEpfY6rHYLT
         I4STz8U2mNVnqYJzz8aHsXU/yEO8ASPdGbOKLayTeaTQTaWZXZXRvl7EeoexukqgGzau
         CvHKyPD3raKqgIJcF7SWGdPOiQynEIaHIyc80CDD0RKjyt6trICh9HNHM4D0QuCq+pwB
         sTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776401778; x=1777006578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvI0EEPHps2diWkmNUsTUkelU9aTZHIpLB32g+oyZ+g=;
        b=smTSPSlMlNrsXDZBKfWnckGQ6k63tI+MhOyoEjRv7dICR4jFPhKJOyi6jJw8uMZtgw
         1QJAQ1yqTAo6KMRBj397YVYkMrpHtUPZrBid8s5B4kU9Hi5rwZBWOPDFnVN+hG4R8H+o
         7/7iLvx/FJFpS+5tyaRfnDagrp/iE+LbNJZZMQTb3IuJ6t8BiKDN76bDs21sntM2B24O
         4CL82SGDO/s33lzOqMz6UTdLiywZXag6F3cahaQnRz1CStmz38yLuFqnYWq/6BuJB8W2
         rf0wqVYVl6OZpLkwy1wll5vZ9/i+efc0R3Q32nhJ7xzO8aYanAN3UdaISLhCmda5OnmN
         hMsA==
X-Gm-Message-State: AOJu0Yz19MoeYf4Fune9In8j3GNTtcOnxmfoCs/SSbZfiH1PWfpgkf/N
	f/LZbwhG3Af8QrVT0wM0UNwPA+6zL0hBH2JDoT5pNWrlisnSBUSNhSUgVXQiaSCHL6LhWe+R5i+
	bA08s5wNQUX2v7WH/NqPwVv113qPIwEfvm1+0b2dg75UaOz26J2sf3eosEtnz/P2L0BE/
X-Gm-Gg: AeBDievt4PDDFqX7qFW8+z6yZnkoWNvbqaielv9uwvMfruEbRAtqQOMi9cHqwii5cGR
	tU5ZDXA54qqV8a3cEbwbsrG3csw0Rm02hxVaVzL30tUXuRETrFIrkDn8cWjAsQx3C+H3EwxJaAs
	CUlbOLRmITzwmMW+6x2rovs0SBpdjCj8Ch9xiNeWktl7pZ7LalqBYvyR4Iz07ZmxgEZzFB5cdGQ
	kcm8Edf+QYt/xgv/Mqw7MP9Pi2B9ulMstKUw2t8S8rGF9/wbkdusWL3BMCHyHtndjCZkF7t18c4
	n9aYrHXfT3WsrRlygbpzWVTKQw0nCqYzbtZKdZWAIBnK1VEIFuSms94jeM5kWGS7uAyi0T9Iw58
	GH0kvKByJJpjtCV7B4Ik3Myw3ebvY66DxS5fJWQJrWCkZFN2UFkzOH80hTvp5uaLf
X-Received: by 2002:a17:903:1aae:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b5f9f51fffmr12591045ad.21.1776401777822;
        Thu, 16 Apr 2026 21:56:17 -0700 (PDT)
X-Received: by 2002:a17:903:1aae:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b5f9f51fffmr12590825ad.21.1776401777305;
        Thu, 16 Apr 2026 21:56:17 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3a8sm5702115ad.12.2026.04.16.21.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:56:16 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add post change sequence for link start notify
Date: Fri, 17 Apr 2026 10:26:00 +0530
Message-Id: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA0NiBTYWx0ZWRfX7IL8M9tsVmrb
 DK0ii/Jv6CfkL5++RaDTbkQTn42I2iTtu8brNp+LOCQoB/DAcTlHz5VHUvqbt58RfcTTv6XFDXn
 5QETvf+fqyUGcy8w3SpW7xGIQgJatGkRRAqHGJpJJpWMgK4Tir4R48wVqAAB4IKc1k7joIsfEsB
 Y1YlQeTVFemXMdqy/oTWHRqwtHXUpYZFWgjVUs1zwuXIlEJihnPcRwGRzvgkZePshyUl50IYoO0
 RSB9YKS8+h5tlRJjKo/jJGWbvvZsqYVqe5GEK4yfyBMqjqA3dlel1Q6mrDhB6IL5M8QazpyRqEa
 iqWvEh80GnKSKCmz8vEll6wTNePVpSV+fDWGVbwgZs/nCj02VsQxYw9TDGjVznFIzvIBSIbV+KE
 NVr/y9ct/OcY8uFCq09eRQ9NjtZw2aOwFuZQmU5j7zdjCSKhfHE9NLTEluHGwqqcWOJrp0zIT+O
 ShpnoMKETuDrWbEn0Mg==
X-Proofpoint-ORIG-GUID: NlBIM9VY2veA5ZtwhqM9sK-ZN7sGznFc
X-Proofpoint-GUID: NlBIM9VY2veA5ZtwhqM9sK-ZN7sGznFc
X-Authority-Analysis: v=2.4 cv=Iuoutr/g c=1 sm=1 tr=0 ts=69e1bd72 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rbNoiXgGD7Sd92Kb1yEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170046
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103466-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C382416F04
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
1) Addressed Manivannan's comments remove extra comment and return
   logic.

Palash Kambar (2):
  ufs: core: Configure only active lanes during link
  ufs: ufs-qcom: Enable Auto Hibern8 clock request support

 drivers/ufs/core/ufshcd.c   | 38 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
 drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
 3 files changed, 59 insertions(+)

-- 
2.34.1


