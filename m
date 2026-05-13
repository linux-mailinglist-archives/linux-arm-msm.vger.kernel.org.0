Return-Path: <linux-arm-msm+bounces-107451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO+aD+bNBGqXPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:15:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E1539BDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D275E31D4EDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 18:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF98D3AEF43;
	Wed, 13 May 2026 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuWtquWU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYTNDXDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558193AD53B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698726; cv=none; b=hAw7+7J5r/4bv/HT1cS27ICu6iK7ZqOcbbVXYLukCFWb4ptJ4tiraB6TdrcNwJM7cMNzNf4vxhpDhfToddIKRWDlZRpOGgtc7M0lh2KHwDs9eulMVmj9W0A03gB4gR3GeFec88TexFHAhy7ywS7uK+ZXI1n6gO5xrhGtKBxhg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698726; c=relaxed/simple;
	bh=ZL5LwaZmRgLjebArRglsT7gNjf9xXln+dn2I6LdUPPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Net6+e1on8YyoklrWvJBV8TwZtx9SPklZGSLeSxHHzWJ1s1Ki81uNuuFyKs+t2p9bc5Oy/ygLhTBvsMGcFqwK+wres6hAcVWH5uhcCkIfPGXTLhJVmK58Mcvm/hAdH2JYSWogptjTRlwgniNfa129Y7IjFg5PkLEAFPBxBtoanQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuWtquWU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYTNDXDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEsGK24159972
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s+dgrCpaVeX2ilmkdipQ/6
	cTD3vMGO0dLuuAot7govc=; b=OuWtquWUX1wh1oNln69+gGFUqR0vnk6pSfp1c9
	vDdWAk8udmWIwIZRs8QX65/tSTsGulEiUlQK1YkJRQL83lDHFcOI6v0S6kirzu6T
	FS0T7mEeGpE6AfA6kGtJPWi6dNoF8xhjF3aPAbuFc4/w0pzDJEL9iBEhFJk0zl8+
	83lKP3OafxwKF7Pyitc88HklpuxiZ0d8ISvfMbYng8SGhI2grfMyOv3vVXEM2fKu
	3XqH8ga9rVy4BUXaxHOle+5YX29lVrN3qPjruiiKpI+X3ZCPQFU5l/JwT17PbQAR
	HRNVyTQimgjphi+98vZCTj1td3CWgvEbO3PKIQ2Wb5PdgOAw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91te9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 18:58:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa2165c3eso4911372b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778698720; x=1779303520; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+dgrCpaVeX2ilmkdipQ/6cTD3vMGO0dLuuAot7govc=;
        b=KYTNDXDYUugfp/+guQpujuP4iPxxYxiUm4/P/ZedudFen048PrDX16InYKAN4a9iS9
         XMqyJOrrlMZ+5FrL0Vb0i99YodNWYwy9jx9KSpVgHdzaLuzf+XlbcGdWZbDrkb+V8iYI
         O/snFmvVdeuYaSmvjDlrWw89wva1eMPUSDUy0Oqh1yStdHQrO1jtWQIyGeICJLscXHCZ
         8697WzYE9gmChm44nw1o2BYlWemUjSkfnfm7GZOnGNNiiZgLBwwLyC2LuFyxBGSjMFVS
         ZzOKNItf5HFVN8//1q9MzWXlgtKQB/lo6p3aTAj0zfKg2gh5qWqoSKI/2FwEMozWqELn
         itdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778698720; x=1779303520;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+dgrCpaVeX2ilmkdipQ/6cTD3vMGO0dLuuAot7govc=;
        b=BXqBrXS1uU5pT060donrjN4dUC4M9eLDsLl5KR/zgGkC+tjJQgKtr912p4ciE3rLQD
         kes713xQcvwoG5GDAaBk21IR+IeaU5gkI2WuuXzEsmWde8Kh11X2FE0Oyt+QHAxhc+pj
         OvxvZf1gR5VJJA1yJ+jmldiLFOKJIAB8ZsnjnrT9NEJGGy51+Rk1XCDOhVojCVpuvWi6
         n42sHPslp7J1C9vfNAqhz/bgdRFm7bifdp82b3p6sfcw1F71wDo6CngTSUNG+UPQIoSw
         nMxFaP3PKi7X2o2c+E3OcPd+v3a8YJgyE4SspysMoebb51cEUZhnDps4B++YaoYpdtUf
         voBg==
X-Forwarded-Encrypted: i=1; AFNElJ8R14JWqr3J+EFs2hjaZ5o4q69a4zdi6AA7brdgrRz1LgVzlT1OnbeVTCmWq910dLXqt+IHPEz9kXBMIfwM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc44+dUJIgmMzceHtN2x6mRZpMy+zVcEwDUzutQtldU2BqwAfN
	duA1hl4EpeyyoW2RQ6++Rvi1ZS2e5OYrCoNBxShjRdHV6KKVRCIgq5pYFUfsvo8u/9I8uHfSvcX
	pat+GrSbJBWpvaoNFtVyUwbDiytHawR9wvVaID94trE4wrg1xtGLrL6SMGpD2D8dExPJc
X-Gm-Gg: Acq92OGMhZ3wVUZeV/uOlbVED9ji7vU9a0o5SVbMzf+K/wtX1ifMIrkyRO4TW6Hfncj
	5DjQkh5fIWXaoFH6tXkgCiHrXozg/Nrw1uk5Hgze94zKFLrCmunY8RTdHMgXvtaV2iXLUybVOZu
	Ovf8EohpVBP2NaJR7wFWsEZAbYgN5hIeDQ0kmmr57l36g6LMCKWrQ+8co5sVTWPTnRrqZlVZ039
	n7+qr2jzwetvbQs2E8zgoCKBbUIZPHstjSGzPP4SWL3QXXVvEoCAW/7rl61xo0sGXR5QYZ9DF7m
	WQKUUBpsUlPx73Cd7u61HtAO2domcvwVjUiud017Rm6COQNTPVA55kjKhJ0A6+Q2Bh8axn30aE7
	Q343OZndPuLiyieCAMdxgItsT58/kFZJ7/3EGI60cN5+R1sMKg8aOjeE=
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr4625956b3a.23.1778698720198;
        Wed, 13 May 2026 11:58:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:4509:b0:837:db9d:9606 with SMTP id d2e1a72fcca58-83f042903d4mr4625924b3a.23.1778698719544;
        Wed, 13 May 2026 11:58:39 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7c744sm237851b3a.48.2026.05.13.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:58:39 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 14 May 2026 00:28:22 +0530
Subject: [PATCH v4] media: iris: optimize COMV buffer allocation for VPU3x
 and VPU4x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-optimize_comv_buffer-v4-1-7da70b586aec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM3JBGoC/x3MSwqAIBRA0a3EGyeofQZtJSLKnvUGftCSSNp70
 vAM7s0QMRBGGKoMARNFcragrStQx2J3ZLQVg+Sy551omPMnGXpwVs6keb20xsDaTnMlpFgb3kN
 JfUBN978dp/f9AKw9M5lmAAAA
X-Change-ID: 20260513-optimize_comv_buffer-45f0c121b306
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778698716; l=8936;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZL5LwaZmRgLjebArRglsT7gNjf9xXln+dn2I6LdUPPg=;
 b=GYw7vgW95FQUp1Mmkb6lt7Z5cm+1dJzBBBefF1uivRupUv05Uiuu5l86Ekv1GQjo8jFxNLA8a
 eMzDEba2Qt/CShC6awO9gbsP9sEt8b0peXkR/3dfHbXPtb0yjSSwMnR
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: HY8ov1aGgpVQ19KgRAoleiIlrud8vdvl
X-Proofpoint-GUID: HY8ov1aGgpVQ19KgRAoleiIlrud8vdvl
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04c9e1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fn0TX9dFmwJMbSZE66wA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE4NyBTYWx0ZWRfX4iezMHpHJqHv
 vvjRytWVyEmRF284EY/ADhQZRZ1TUX1qsHIV71fJZ1lEkuvie7iwlKb/WQhDjiITdeTdIxHtwYJ
 lAG4dhq9Vzmxz/mXcdTTDpsDB43urRGsUASqm2tkNcT2SiyEB6f2UtM7cZ9lCf2MH2gR7oNctkR
 M6vkhY8ZcUnk5ByLfJccWSCp6+0e56vv3A5lzjVPyLU9F0OB0ycAxV9h4P480zyV09Ll8uAjE2O
 nhmr1Z4QehAYLZJK6fWjfjoE8dcOVIlIgjNpf/PeBF9ipPpFqHvUOquJmfo4wOVw9b62/j24VJp
 xq0WorXMg03Lx1rZyCTVpgVrzfD1rWQWQd+QXOn5y8UlmHmZ3/jvbs3vXxsOsCZSg6T4XE/Cn+Z
 81FuadmxcgyXm9FsSRsH8vcrUEsA+mBt0Zo1qDygOTp0hEdrDVdGjSiTP2R5nnRMSi6ZZQMvqSy
 vEPGYh8FXxIA3zmbmLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130187
X-Rspamd-Queue-Id: 900E1539BDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107451-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The existing iris_vpu_dec_comv_size() used VIDEO_MAX_FRAME (32) as
num_comv count unconditionally when calculating the co-located motion
vector (COMV) buffer size. This resulted in an oversized COMV buffer
allocation throughout decode session, wasting memory regardless of
actual number of buffers required.

For VPU3x and VPU4x platforms, introduce iris_vpu3x_4x_dec_comv_size() to
replace iris_vpu_dec_comv_size(). These derive num_comv dynamically, it
uses inst->fw_min_count once the firmware has reported its buffer
requirements, and fallback to output count during initialization before
firmware has communicated its requirements. This aligns the COMV buffer
size to the actual count needed rather than always allocating with fixed
VIDEO_MAX_FRAME value.

Additionally, during iris_vdec_inst_init(), fw_min_count was initialized
to MIN_BUFFERS instead of 0. This masked the fallback logic and caused the
COMV size calculation to use MIN_BUFFERS even before firmware had reported
its actual requirements. Fix this by initializing fw_min_count to 0.

During testing of 1080p AVC, it reduces the COMV buffer size from 32.89MB
to 6.16MB per decode session, significantly reducing memory consumption.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v4:
- Rebase on linux-media/users/bodonoghue next+fixes
- Resolve merge conflicts due to merged patch "media: qcom: iris: don't
  use function indirection in gen2-specific code"
- Link to v3: https://lore.kernel.org/all/20260506-optimize_comv_buffer-v3-1-c1b4a44e4300@oss.qualcomm.com/

Changes in v3:
- Update num_comv from instance data instead of using caps num_comv
  in set_num_comv function to avoid wrong value update during concurrency.
- Link to v2: https://lore.kernel.org/r/20260504-optimize_comv_buffer-v2-1-69379a59e17d@oss.qualcomm.com

Changes in v2:
- Update commit description (Bryan)
- Update hfi comv buffer count value to use actual num_comv count which
  used for buffer calculation to avoid any overhead or fixed values (Vikash)
- Link to v1: https://lore.kernel.org/r/20260421-optimize_comv_buffer-v1-1-7c9a24da3ad3@oss.qualcomm.com
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 15 +++------------
 .../platform/qcom/iris/iris_platform_common.h      |  1 -
 .../platform/qcom/iris/iris_platform_qcs8300.h     |  1 -
 .../platform/qcom/iris/iris_platform_sm8550.h      |  1 -
 drivers/media/platform/qcom/iris/iris_vdec.c       |  3 ++-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 22 ++++++++++++++++++++--
 6 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c90b22a75bc5..7ac69af63ead 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -10,7 +10,6 @@
 
 #define UNSPECIFIED_COLOR_FORMAT 5
 #define NUM_SYS_INIT_PACKETS 8
-#define NUM_COMV_AV1 18
 
 #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
@@ -1207,18 +1206,10 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 
 static int iris_hfi_gen2_set_num_comv(struct iris_inst *inst)
 {
-	struct platform_inst_caps *caps;
-	struct iris_core *core = inst->core;
-	u32 num_comv;
-
-	caps = core->iris_platform_data->inst_caps;
+	u32 num_comv = inst->buffers[BUF_OUTPUT].min_count;
 
-	/*
-	 * AV1 needs more comv buffers than other codecs.
-	 * Update accordingly.
-	 */
-	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
-				NUM_COMV_AV1 : caps->num_comv;
+	if (inst->fw_min_count)
+		num_comv = inst->fw_min_count;
 
 	return iris_hfi_gen2_session_set_property(inst,
 						  HFI_PROP_COMV_BUFFER_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be35..9ae7f9f7103e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -87,7 +87,6 @@ struct platform_inst_caps {
 	u32 mb_cycles_vpp;
 	u32 mb_cycles_fw;
 	u32 mb_cycles_fw_vpp;
-	u32 num_comv;
 	u32 max_frame_rate;
 	u32 max_operating_rate;
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 61025f1e965b..3cfecae80d1e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -15,7 +15,6 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.mb_cycles_vpp = 200,
 	.mb_cycles_fw = 326389,
 	.mb_cycles_fw_vpp = 44156,
-	.num_comv = 0,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
index a9d9709c2e35..3c9dae995bb2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
@@ -23,7 +23,6 @@ static struct platform_inst_caps platform_inst_cap_sm8550 = {
 	.mb_cycles_vpp = 200,
 	.mb_cycles_fw = 489583,
 	.mb_cycles_fw_vpp = 66234,
-	.num_comv = 0,
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index dfccfb274492..752198c54514 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -24,7 +24,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 	inst->fmt_src = kzalloc_obj(*inst->fmt_src);
 	inst->fmt_dst = kzalloc_obj(*inst->fmt_dst);
 
-	inst->fw_min_count = MIN_BUFFERS;
+	inst->fw_min_count = 0;
 
 	f = inst->fmt_src;
 	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -252,6 +252,7 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
 		/* Update capture format based on new ip w/h */
 		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
 		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
+		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
 
 		inst->crop.left = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 9270422c1601..7ac6d9e49584 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -731,6 +731,24 @@ static u32 iris_vpu_dec_comv_size(struct iris_inst *inst)
 	u32 height = f->fmt.pix_mp.height;
 	u32 width = f->fmt.pix_mp.width;
 
+	if (inst->codec == V4L2_PIX_FMT_H264)
+		return hfi_buffer_comv_h264d(width, height, num_comv);
+	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+		return hfi_buffer_comv_h265d(width, height, num_comv);
+
+	return 0;
+}
+
+static u32 iris_vpu3x_4x_dec_comv_size(struct iris_inst *inst)
+{
+	u32 num_comv = inst->buffers[BUF_OUTPUT].min_count;
+	struct v4l2_format *f = inst->fmt_src;
+	u32 height = f->fmt.pix_mp.height;
+	u32 width = f->fmt.pix_mp.width;
+
+	if (inst->fw_min_count)
+		num_comv = inst->fw_min_count;
+
 	if (inst->codec == V4L2_PIX_FMT_H264)
 		return hfi_buffer_comv_h264d(width, height, num_comv);
 	else if (inst->codec == V4L2_PIX_FMT_HEVC)
@@ -2025,7 +2043,7 @@ u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size             },
-		{BUF_COMV,        iris_vpu_dec_comv_size            },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size       },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size        },
 		{BUF_LINE,        iris_vpu_dec_line_size            },
 		{BUF_PERSIST,     iris_vpu_dec_persist_size         },
@@ -2098,7 +2116,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 
 	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
 		{BUF_BIN,         iris_vpu_dec_bin_size         },
-		{BUF_COMV,        iris_vpu_dec_comv_size        },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
 		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
 		{BUF_LINE,        iris_vpu4x_dec_line_size      },
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },

---
base-commit: 82e452f73dc86f42a2df8bb1f5f18908c6144d6c
change-id: 20260513-optimize_comv_buffer-45f0c121b306

Best regards,
-- 
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


