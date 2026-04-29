Return-Path: <linux-arm-msm+bounces-105197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GrzGQX28WmElwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:13:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F4493EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 14:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C39D53096314
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 12:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD9E39A079;
	Wed, 29 Apr 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJuwTs3R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBXAHSnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C777C3F7864
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464615; cv=none; b=U8X2AsD3dKBbDXbLSFd0VW5ZSodDHYrZf3O1FxuZEQcwy87DaVEQ94FXskmGIjnpOitLj9Ep1cKd62UyU6DEZ6f7OFFM1QU65N6cE/+hKSNkVj7J+I+wA27xqu+x4U5AIFTohdPGZX09ahYINhvy9T8BJJIBHDgf8f9KBJO1qIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464615; c=relaxed/simple;
	bh=e1mNfJVMrQvFN+132sOoDtdxsQf+liabKFNyhMRf7K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/yuzYwLk4HwHEXOnAv+zQZYkwKis+Xspkb7SewBdvuL7Fe69seHkGS6ly069zzJEpiXjKDIPGju82m7M2eDAHoTPVm4HXfNpK7fiaGQ9qEv7u9a4CXFKUswX8Fiksuz1bILAKDk2wFEDI4IMkYJxgG3KP2xN0wq9OpZNHP8MLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJuwTs3R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBXAHSnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvJ12094252
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 12:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5VYqWyL8EBcZs4JPz7OexZZaBJ3OqjvR0j4KdfUB0M=; b=jJuwTs3R29ccbMvq
	YZW7O6+ITHkdEIR+5gJFrgeos1WOGIgcB4ZGymmXW9c1AJ7TKqT74XoMDJtzbpX4
	gCtltNBbn+KNv8PkMhEdaiAUvEOxhWbv+SB0C67YLC9leTew8tzp58uWL2cy8hLa
	KP4WLDlYaB8qDRje+5EYvN/w1+GO3MUEVXL6B59B234QmeXWNR0RnQAJQbBCPlgb
	mKUzYZpZgJSsTrR4aTnUAdmVIh2GOTyNJwtlb+FrjfyAdbUN9gjDDmFDEuM7XGOk
	52ptUnvsx3GQmW2E7o8r3QLQADiMS9fSreh9mqsjh8oSr64Xq0fIvfsojixAElS7
	iu7yuQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3s79m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 12:10:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b461b36990so133137435ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 05:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777464612; x=1778069412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5VYqWyL8EBcZs4JPz7OexZZaBJ3OqjvR0j4KdfUB0M=;
        b=NBXAHSnu8++Hshz363IQa5llpOgR08Se+IbnmXTP6zdDwu/4Qmc27wwT0/ZNgfcvtf
         lPUzrPJGa22c43CNKuD2mCQSmDVVCJiTz1KLKp36OprzdIGQmTUQyUzq0XNo100RrueU
         3r3dyQpJ8ZbF1RsjP1F+HwW9ITyBtZ51hqOaUFUI0OinkBNQnOD4li5jWqIhgk0B7SE+
         tw/BOGVFdi5ZLZ9GyBieMjXiVob3SOPv7sW3jQOOfyOe0q3et1UwUUW6E745GVWaWF4C
         O0yUoxNbT1wFqznKMV9JXCdUoDON+TFV1b/6s6T/nrOkB4p2c1dpvRc8RWriZLhEPo7e
         Wo4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464612; x=1778069412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5VYqWyL8EBcZs4JPz7OexZZaBJ3OqjvR0j4KdfUB0M=;
        b=RILnGntwukLFa3SDCNGnPzxeUDq0TNuE9s8R7DyQAGOA+76aj5GBQR+h6fh9TyoY0M
         bfZ4Lig78Xt/3rfhQMSHc1HJifThzqBhMbt9HwSH8jsoh5VASUdzcq3GtgxtjtYyH8mA
         Z0U6cBKn6tipXAjZsiRziAEJHRqRUzWK7Mw93gWLphDBK4SMrJBogA6qjlZjnM5CICzS
         OTSybEY/DKPfh83Ywnvr1xspDTe3q1xU05228Mboe4EeTbnwbpEHmrTgyPkmF2xmvcTL
         6I6JLU94NgzYSxzRWYSDiU2IeU01H5f5mBbVdQA49krsgjprtTQcZAySNzcUhtLJCpCm
         HFPA==
X-Forwarded-Encrypted: i=1; AFNElJ+pS0qSE+HryL8jG3asf/j3fTv1Ys9Wif1SNQFaYD9ZKMy9ARx70edVORkIPLSMGhRG3WylVT5pYFkbsKss@vger.kernel.org
X-Gm-Message-State: AOJu0YyHn2W3GOcsRW0CeHI+L4RrSc6A8fl56dcccsYPNdu15boK87NB
	8eTk3zzMpN0JcPd3A0O3TSvUsiRdeFX22rM22iAIKg3qzIlje7ucvpeH6n/tm6z3bzpDlueMM5M
	9W514M6xZ6Sa8Rzw0XDtegCNQxcb9GOoAw2OvnGr6bpHEr3v0KbERpTqwotBpFQmF5ICz
X-Gm-Gg: AeBDiesTzJfTkplIMB5sPkWsJtWfKtLTbEDHEBg0mL9c1J6JUvpepr62azwu6f7Jb96
	JUmzh+TYsvUXLeA57uBUVazTMZ5pOkoN+MlL7H4nltxN+s33hOhRgWEjESj6GkRwGcaXV5lYSbF
	HszKk11rwdz/+kDWyj8H2IXMrn86Dt6KqGbEeeBzFlVq5vIuVUfbc5REvVjB95GlAIkzM4Q1Nux
	9456bG7e7v8Lh61p3HiB5z6YZRaxDRAXtqhqUTneRfoYpLiyUwvhNCKGDylfdQX7uBDjxMOoLNh
	lTfXbKQu+Jib6IqzNRCtYIUGAmQSf23oRleePrRIBlPJSUvR7+xPNusq/kK0pBB3b0XI8Tz2bZR
	sIrYCv1OiyyhfP/5eeNgEwcW3i1d7GixFZp43fvi1jSmk/FbvV2Efp4onHTZ+I6Ky2DU0sw==
X-Received: by 2002:a17:903:2ac3:b0:2b0:6e4a:32d0 with SMTP id d9443c01a7336-2b97c4998d6mr75872755ad.35.1777464611517;
        Wed, 29 Apr 2026 05:10:11 -0700 (PDT)
X-Received: by 2002:a17:903:2ac3:b0:2b0:6e4a:32d0 with SMTP id d9443c01a7336-2b97c4998d6mr75872395ad.35.1777464610980;
        Wed, 29 Apr 2026 05:10:10 -0700 (PDT)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887ad80bsm21482765ad.37.2026.04.29.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:10:10 -0700 (PDT)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:39:47 +0530
Subject: [PATCH v4 1/3] media: iris: Switch to hardware mode after firmware
 boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak-gen2-support-v4-v4-1-1b607d13f9b8@oss.qualcomm.com>
References: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak-gen2-support-v4-v4-0-1b607d13f9b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777464602; l=9744;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=JnRla0VsUZ/m4SMTAiNGlJE2/J9PWBAkwn4jEyoUzLM=;
 b=bvFmLnl+bYtJzYLm0cAoIeItSW0BSNujxrUWukBcSI5J4M/l/xaF7KlLfuZpJv9iySHDDWhgO
 xdcbuseg9hCCs/wfplam0o2X0IJYW3Yfl9p9yHR+ivp4VnUcNAkaO2E
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: f7ZaLkBfNnk9skqfdSU3lXwTgYkrLz51
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1f524 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8QxTX33zP25rWUhdfb4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: f7ZaLkBfNnk9skqfdSU3lXwTgYkrLz51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEyMyBTYWx0ZWRfX6CD8VyflumpL
 Vsx0BlAlzM5pEKyHDvB2Ri7yZrrFWAsSom25dyXSNCRg/AS6rqwME41WC1/Ldl+aLQWioxDBSxJ
 hdrisoKVNeSBjulCBMhmvP1eHekmtlB7bqQwwSaFnGmYBwXXcDESPs1wyAqByGjo0r0963OWPze
 0DYIrwOcchuFrZ2SBDIU33XG87MEI3n8W+qkcC/1yHrblY/tOhimXxqkGo8iBadZjjNuyWfr8zB
 jWZiyXO+iy+VQ+yaslIfw4BChKN2sL12tqx8IUMD6ex6G5/wEKDoVzga66aFwg6dy4HDwoSmsmG
 KGM361BQ15WK0KT2ZgFTxWz0tNVQlDJJcfYY52X9aR8gLl8k8zdudtPkF4eyKWMDlrofosw4+qC
 hI9EchukCReitthLqGmVyYfy7fT4OEtHTo0kyxi+V0N0S4isyjbaRwPmLTu3orCSWlNPazN3noo
 +f2UTgdI0FR2m3hVNkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290123
X-Rspamd-Queue-Id: D91F4493EE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105197-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Currently the driver switches the vcodec GDSC to hardware (HW) mode
before firmware load and boot sequence. GDSC can be powered off,
keeping in hw mode, thereby the vcodec registers programmed in TrustZone
(TZ) carry default (reset) values.
Move the transition to HW mode after firmware load and boot sequence.

The bug was exposed with driver configuring different stream ids to
different devices via iommu-map. With registers carrying reset values,
VPU would not generate desired stream-id, thereby leading to SMMU fault.

The efuse tells us which hardware blocks are actually present. If efuse
status is disabled for a block, the driver will skip powering it on or
resetting it. otherwise the driver will perform the necessary resets and
then switch that block into hardware mode. This makes sure we only touch
hardware that really exists and is enabled on the silicon.

Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 ++++++++++++----------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index e6141012cd3dda7e029a5659dcb3048a23cdc150..1f326f696d08014f5ebfeb0b99cfed70665fd6ab 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -74,6 +74,10 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto error_unload_fw;
+
 	ret = iris_hfi_core_init(core);
 	if (ret)
 		goto error_unload_fw;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index ad8e4ecb86052d0c4ec9338b2874293494471bc2..8769ec61f11769e004945063381d9baddb302b06 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	ret = iris_vpu_switch_to_hwmode(core);
+	if (ret)
+		goto err_suspend_hw;
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct iris_core *core)
 	if (ret)
 		goto err_disable_hw_free_clk;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_clk;
-
 	return 0;
 
-err_disable_hw_clk:
-	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_hw_free_clk:
 	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
 err_disable_axi_clk:
@@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		ret = iris_vpu4x_power_on_apv(core);
 		if (ret)
 			goto disable_hw_clocks;
-
-		iris_vpu4x_ahb_sync_reset_apv(core);
 	}
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
-
-	ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
-	if (ret)
-		goto disable_apv_power_domain;
-
 	return 0;
 
-disable_apv_power_domain:
-	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
 disable_hw_clocks:
 	iris_vpu4x_disable_hardware_clocks(core, efuse_value);
 disable_vpp1_power_domain:
@@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
+static int iris_vpu4x_set_hwmode(struct iris_core *core)
+{
+	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
+
+	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
+		iris_vpu4x_ahb_sync_reset_apv(core);
+
+	iris_vpu4x_ahb_sync_reset_hardware(core);
+
+	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
+}
+
 const struct vpu_ops iris_vpu4x_ops = {
 	.power_off_hw = iris_vpu4x_power_off_hardware,
 	.power_on_hw = iris_vpu4x_power_on_hardware,
@@ -366,4 +367,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
+	.set_hwmode = iris_vpu4x_set_hwmode,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index c6cfc1d9fd9ec5a8f69462188a03aa5cb4e1cee9..7bba3b6209c2061dce72facab7c2b58d6b3bb9b9 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -292,14 +292,8 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	if (ret && ret != -ENOENT)
 		goto err_disable_hw_clock;
 
-	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
-	if (ret)
-		goto err_disable_hw_ahb_clock;
-
 	return 0;
 
-err_disable_hw_ahb_clock:
-	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 err_disable_hw_clock:
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
 err_disable_power:
@@ -308,6 +302,16 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu_set_hwmode(struct iris_core *core)
+{
+	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
+}
+
+int iris_vpu_switch_to_hwmode(struct iris_core *core)
+{
+	return core->iris_platform_data->vpu_ops->set_hwmode(core);
+}
+
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
 {
 	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 07728c4c72b64bd15f4e4fdfdce90a5d4d6e9d3e..09799a375c1426d808ab5ea4fdfcac3a203e15b3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -21,6 +21,7 @@ struct vpu_ops {
 	int (*power_on_controller)(struct iris_core *core);
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
+	int (*set_hwmode)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -30,6 +31,8 @@ int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
 int iris_vpu_prepare_pc(struct iris_core *core);
 int iris_vpu_power_on_controller(struct iris_core *core);
 int iris_vpu_power_on_hw(struct iris_core *core);
+int iris_vpu_set_hwmode(struct iris_core *core);
+int iris_vpu_switch_to_hwmode(struct iris_core *core);
 int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);

-- 
2.34.1


