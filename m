Return-Path: <linux-arm-msm+bounces-102644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PipLTXG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 758CC3D51A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0986530687CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27033BED77;
	Fri, 10 Apr 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhbpRpR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbGmpIm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20414371067
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813742; cv=none; b=aLn5bUEdb8hahPVLv6JllFM3zInVx99yZDnEiWMp7LRHFDUWaLNQDo+h8IAmxJRLbt7SK7cYuonYmfoh7I0gyiqhKKvHyyfAgkNauCj6N35LZass6TVV7N5piiO63nxsxinYsYYcG6B9tHhPFJ4m5kaSiTOmc13xm3uszFNfeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813742; c=relaxed/simple;
	bh=bmpMa8dQy/nyCx1fSHsG2qqboUDccNWb/A4Va7tVy5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcjL1Uj9lpIBS2hiUlvrXUWY/7EaBPVId3h1A7UbAMGrO+z9fP0kLaUrrKdL+QR7zXseJiduUmZnzM+YRdPWYWIPvKBgSZ3WR/pCjMLBjdnlfv9yogSwDcNTfoO+dqJvfoB3ri+aENakOK3NR5obFCFMJW8jAMjAoeO+Xmx9t7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhbpRpR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbGmpIm5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oT3V709170
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wW9pw4EHk/rqq+kM3aj5tUUokw0Hw5+xL7tYpkkCILg=; b=HhbpRpR7RAZpyzPu
	rO//6GWiEPIFV+cP3BK5c8UMehJIjFTayVpZ8JPO9NRyRgiVH8Kqemk+vuBiE2mh
	5j0oRKaCMg7V0nxXcw7ojabgDR9pIeACTWDQke3FpHbp7cxgu5RZwdgqj5t796+A
	lyLKfroLlA84ltDq14D5TiNjSObJrVSfsmVcvZmqWQNh/q9uLA3cBLzvLq3sRufO
	QLPRJiA1IWonC2mmLac92W4z1Rlph8h1glICJvt3P4Cdm+JlEwwJwWetTW1AMink
	0+9SuRsqPFpj5EjkV2mwBz+eDlL9BDXYVJIH927TrOUsefMPVn4QA/zLLb3JkOAg
	3h4K9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a1accb970fso45520096d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813739; x=1776418539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wW9pw4EHk/rqq+kM3aj5tUUokw0Hw5+xL7tYpkkCILg=;
        b=dbGmpIm5aLKS1uja3Ye/1U3dv+b6j17QpBpNsqpBUY3JYjTXWLKp8JyubNmcSPaTJU
         idvP5qmbDIlHoUYGfX96g8GCJck5CQ38S6cKrcuT77nx4v/C2aebUzf0oJCUSw6FoDda
         fEPL5lSJrBWoIPlEhBlC33JDXxJ5KFAAt0ntKEnRdQDCPyj/z3GeC+uBQtIae7t6YEOE
         lxOicvJGNv6DFniBgpPKzuvRlAXabpE8HyzI1wTm4GpE9qKcP6uMZ1MT038bmu4VgkSj
         aQZ+V4FRk5TRk631AG4tg6+eIigy2/N8V+oDWeVpcLPXweRd9pO7KlzaeawLPgojjw9P
         YXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813739; x=1776418539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wW9pw4EHk/rqq+kM3aj5tUUokw0Hw5+xL7tYpkkCILg=;
        b=T8ANQc+3EHOcbmuYCyiLP91g91o6U8SxksGwjJpSy3pn7ia1uTL/k9h8pg8VC9IlWI
         65N/6eDrDy4lPyYUzIoBRLoQL324FqGUSVkTjxEe9hIYqcgBXuFLAx168w6dbFC2GK3y
         8gsWkH/xqK+6PsIQrUpOws/u8Kf4ZlRASHbHFGiVE5mXpUEZ6IadhEYVpP6TeEEmn5qC
         YEOHJ8WzEJrLZF3ooFo9DNI1OwTo5G1TuxaNu3IbNDXF/RtApTOCbtBbIFWybJ52BQpq
         24JDSndsOOmqDA2RjY1iTfbWYHCHClV1FBiNrjk+39O0gYfQw3gYQRSVz4z/9G2H1R7k
         e0hQ==
X-Gm-Message-State: AOJu0Yxhm60jxZGRc82r8H2VvnKqPd9u9iumtNdNSGWJC68mfCsGxuMi
	kzDSDsh2LefZj+hidwC9TFQTd7341q5iWd9vg3aaZTLwHGYG9jFSQk2i9mSfN3f+fSH2leyyQ17
	hcSfASFLHEGJyNXQTDMNh4zq459dJK+z8GllT5gYOR9Volz9Mv22AOUVEFsYmBJPUHYNIYdm28c
	TQ
X-Gm-Gg: AeBDieuJkpSmIJ8rZNahLC9I5wZduMduQBzV41u3JWCW9Py4iHwi8tgja308iKYZWVO
	r+icf1sQ/JjtAjwGmfINx+tLCAKH1YOyVKwWgga97RcFo2sPeB8b3p11EoLvYfY4cbI1k4gBvPs
	wz/ROhCLQlFKZmfPsVM0z5O+RYYaG6e+sptq8/DSjVCPZ8R0GZAVKDKTzRaJ9z3l9xg2IuJv28T
	1bXscLuu68mgQd32W3/M/fMHOEbLMU4JjQ9tdvv5skh18LkPY9bW5lCO8GEP2HoRlFaS9Wt8pOz
	9JYq4UqfGPfpBfeZtRF3n4tCAR+CIJYu/BDdS7C4WBmqcByuO02iDWDyDUG3HTq7snJeT8ZCvr2
	Ok+d9yA7svzVbNAik2hh7b8hFyYlKCJ+3OyV145MRmaaPnrdWbG79X4W/ZOp1X19KR6r6Z37Hux
	inNOoPNws=
X-Received: by 2002:a05:6214:4018:b0:8ac:5631:7bd9 with SMTP id 6a1803df08f44-8ac862d36f7mr29420486d6.48.1775813738985;
        Fri, 10 Apr 2026 02:35:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4018:b0:8ac:5631:7bd9 with SMTP id 6a1803df08f44-8ac862d36f7mr29420086d6.48.1775813738443;
        Fri, 10 Apr 2026 02:35:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:37 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:56 +0800
Subject: [PATCH v4 21/39] drm/msm/dp: Add support for MST channel slot
 allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-21-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=15414;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=/Z1eXht6ut+VWY+LRmTgoTtTXhFrx17GU4z2meq4QT4=;
 b=tuF+XMDWsjo0yeGWLXL06E+qmDQvMWzsjqw/j6zHmviK5A4zxBqpOfue+mgp7jDEx281ss2xa
 H8CNLHQ9pBaDq2Kln3/ctHljP/1M5Hm6OJrre0piWq9FwNQtGQUTC2s
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: nWsVT_wZrHdHGbScemWv4hiEe8aoOoLr
X-Proofpoint-GUID: nWsVT_wZrHdHGbScemWv4hiEe8aoOoLr
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c46c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=dHIZ7lCY0nX3Y9ypm_0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX+smlkca3cDUx
 j0kgjOaI1GP8YmFon7DuAEnDw7tcz6LlMlyqnbrXotEfZy7Fw+AuZ3V4p9Uyg9hSigusMhjJuQ+
 RhEnRxVAWvJlwbeT+koxyZTNmh/rl/G4d370zdG4AM0cojWSLdviFUA+7Q7g2BGWd2o3LKFFBt0
 XcE7SyeLFN3u/cNfRzeH/KH/1qxwc8FGPDXjkUeY7QAc5U3TqpvGmXPvRfCMkeIwZ1/3sl3puf1
 VdaiWnF8JWr1Sf+Rifa04munFsHqztfpze5TZIGUAyVyYLlL0bqA+I4YxBbZUkzl2sb1MYQv4Vo
 QU5cgC5chMhaFn473gTGJneK30SYO7zD+WhKKtmOCODJhve5eM/lB2IL8qB+4H0j21sFJ3e1S5d
 SjSpMys4goWFAU5DFwq9RXKaTWLHUJ8IG86jmBbRjrlD+tGHBzU4b+5cr4BDB/LYd/bilWNEzk2
 etnN4RwGBJS3V0X0c/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102644-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 758CC3D51A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP MST streams share 64 MTP slots in a time-multiplexed manner. This patch
adds support for calculating the rate governor, slot allocation, and slot
reservation in the DP controller.

Each MST stream can reserve its slots by calling
dp_display_set_stream_info() from its bridge callbacks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 207 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   7 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  28 +++--
 drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |  10 ++
 6 files changed, 247 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 98316892eccd..e64f81bc8c36 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -73,6 +73,7 @@
 #define MR_LINK_PRBS7 0x100
 #define MR_LINK_CUSTOM80 0x200
 #define MR_LINK_TRAINING4  0x40
+#define DP_MAX_TIME_SLOTS 64
 
 enum {
 	DP_TRAINING_NONE,
@@ -109,6 +110,11 @@ struct msm_dp_vc_tu_mapping_table {
 	u8 tu_size_minus1;
 };
 
+struct msm_dp_mst_ch_slot_info {
+	u32 start_slot;
+	u32 tot_slots;
+};
+
 struct msm_dp_ctrl_private {
 	struct msm_dp_ctrl msm_dp_ctrl;
 	struct drm_device *drm_dev;
@@ -144,6 +150,8 @@ struct msm_dp_ctrl_private {
 	bool link_clks_on;
 	bool stream_clks_on[DP_STREAM_MAX];
 	bool mst_active;
+
+	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
 };
 
 static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
@@ -268,6 +276,73 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
 	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
+static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
+					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
+					  u32 tot_slot_cnt)
+{
+	u32 i, slot;
+	u32  slot_reg_1, slot_reg_2;
+	u32 reg_off = 0;
+	int const num_slots_per_reg = 32;
+
+	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
+	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
+		DRM_ERROR("invalid slots start %d, tot %d\n",
+			  ch_start_slot, tot_slot_cnt);
+		return;
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
+		   stream_id, ch_start_slot, tot_slot_cnt);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_TIMESLOT_1_32 - REG_DP_DP0_TIMESLOT_1_32;
+
+	slot_reg_1 = 0;
+	slot_reg_2 = 0;
+
+	if (ch_start_slot && tot_slot_cnt) {
+		ch_start_slot--;
+		for (i = 0; i < tot_slot_cnt; i++) {
+			if (ch_start_slot < num_slots_per_reg) {
+				slot_reg_1 |= BIT(ch_start_slot);
+			} else {
+				slot = ch_start_slot - num_slots_per_reg;
+				slot_reg_2 |= BIT(slot);
+			}
+			ch_start_slot++;
+		}
+	}
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id:%d slot_reg_1:%d, slot_reg_2:%d\n", stream_id,
+		   slot_reg_1, slot_reg_2);
+
+	msm_dp_write_link(ctrl, stream_id, stream_id > DP_STREAM_1 ?
+			  REG_DP_MSTLINK_TIMESLOT_1_32 : REG_DP_DP0_TIMESLOT_1_32 + reg_off,
+			  slot_reg_1);
+	msm_dp_write_link(ctrl, stream_id, stream_id > DP_STREAM_1 ?
+			  REG_DP_MSTLINK_TIMESLOT_33_63 : REG_DP_DP0_TIMESLOT_33_63 + reg_off,
+			  slot_reg_2);
+}
+
+static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
+				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
+{
+	u32 rg, reg_off = 0;
+
+	rg = y_frac_enum;
+	rg |= (x_int << 16);
+
+	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
+		   stream_id, x_int, y_frac_enum, rg);
+
+	if (stream_id == DP_STREAM_1)
+		reg_off = REG_DP_DP1_RG - REG_DP_DP0_RG;
+
+	msm_dp_write_link(ctrl, stream_id, stream_id > 1 ?
+			     REG_DP_MSTLINK_DP_RG : REG_DP_DP0_RG + reg_off, rg);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2615,6 +2690,103 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 			  nvid);
 }
 
+/* TODO: comments here. */
+static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel,
+					 u32 *p_x_int, u32 *p_y_frac_enum)
+{
+	u64 min_slot_cnt, max_slot_cnt;
+	u64 raw_target_sc, target_sc_fixp;
+	u64 ts_denom, ts_enum, ts_int;
+	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
+	u64 lclk = 0;
+	u64 lanes = ctrl->link->link_params.num_lanes;
+	u64 bpp = panel->msm_dp_mode.bpp;
+	u64 pbn = panel->pbn;
+	u64 numerator, denominator, temp, temp1, temp2;
+	u32 x_int = 0, y_frac_enum = 0;
+	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
+
+	lclk = ctrl->link->link_params.rate;
+
+	/* min_slot_cnt */
+	numerator = pclk * bpp * 64 * 1000;
+	denominator = lclk * lanes * 8 * 1000;
+	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* max_slot_cnt */
+	numerator = pbn * 54 * 1000;
+	denominator = lclk * lanes;
+	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
+
+	/* raw_target_sc */
+	numerator = max_slot_cnt + min_slot_cnt;
+	denominator = drm_fixp_from_fraction(2, 1);
+	raw_target_sc = drm_fixp_div(numerator, denominator);
+
+	/* target_sc */
+	temp = drm_fixp_from_fraction(256 * lanes, 1);
+	numerator = drm_fixp_mul(raw_target_sc, temp);
+	denominator = drm_fixp_from_fraction(256 * lanes, 1);
+	target_sc_fixp = drm_fixp_div(numerator, denominator);
+
+	ts_enum = 256 * lanes;
+	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
+	ts_int = drm_fixp2int(target_sc_fixp);
+
+	temp = drm_fixp2int_ceil(raw_target_sc);
+	if (temp != ts_int) {
+		temp = drm_fixp_from_fraction(ts_int, 1);
+		temp1 = raw_target_sc - temp;
+		temp2 = drm_fixp_mul(temp1, ts_denom);
+		ts_enum = drm_fixp2int(temp2);
+	}
+
+	/* target_strm_sym */
+	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
+	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
+	temp = ts_int_fixp + ts_frac_fixp;
+	temp1 = drm_fixp_from_fraction(lanes, 1);
+	target_strm_sym = drm_fixp_mul(temp, temp1);
+
+	/* x_int */
+	x_int = drm_fixp2int(target_strm_sym);
+
+	/* y_enum_frac */
+	temp = drm_fixp_from_fraction(x_int, 1);
+	temp1 = target_strm_sym - temp;
+	temp2 = drm_fixp_from_fraction(256, 1);
+	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
+
+	temp1 = drm_fixp2int(y_frac_enum_fixp);
+	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
+
+	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
+
+	*p_x_int = x_int;
+	*p_y_frac_enum = y_frac_enum;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
+		   lanes, lclk, x_int, y_frac_enum);
+}
+
+static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel)
+{
+	u32 x_int, y_frac_enum;
+
+	if (!ctrl->mst_active)
+		return;
+
+	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
+
+	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl);
+
+	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
+
+	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
+}
+
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
@@ -2701,6 +2873,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	if (!ctrl->mst_active)
 		msm_dp_ctrl_setup_tr_unit(ctrl);
 
+	msm_dp_ctrl_mst_stream_setup(ctrl, msm_dp_panel);
+
 	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
@@ -2757,6 +2931,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			phy, phy->init_count, phy->power_count);
 }
 
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
+	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
+}
+
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+	int i;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->mst_active)
+		return;
+
+	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
+		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
+					      ctrl->mst_ch_info[i].tot_slots);
+	}
+}
+
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index f82fd96e412a..c59338199399 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,8 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
+			  struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stream_id stream_id);
@@ -52,4 +53,8 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
+				      enum msm_dp_stream_id stream_id,
+				      u32 start_slot, u32 tot_slots);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 80bb5fc4003f..e0bf4dffa6af 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -763,11 +763,13 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	return 0;
 }
 
-int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
-				   struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id)
+int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id, u32 start_slot,
+				   u32 num_slots, u32 pbn)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
+	const int max_slots = 64;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
@@ -776,7 +778,16 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
 		return -EINVAL;
 	}
 
+	if (start_slot + num_slots > max_slots) {
+		DRM_ERROR("invalid channel info received. start:%d, slots:%d\n",
+			  start_slot, num_slots);
+		return -EINVAL;
+	}
+
+	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, stream_id, start_slot, num_slots);
+
 	panel->stream_id = stream_id;
+	panel->pbn = pbn;
 	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
 
 	return rc;
@@ -1525,7 +1536,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0);
+	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
 
 	rc = msm_dp_display_enable(dp);
 	if (rc)
@@ -1540,14 +1551,15 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp_display_private *msm_dp_display;
+	struct msm_dp_display_private *dp;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
-	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
+	msm_dp_ctrl_push_idle(dp->ctrl);
+	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl);
+	msm_dp_ctrl_mst_send_act(dp->ctrl);
 }
 
 static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index fdbe6e4871d9..0ccdddb223c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -43,7 +43,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
-int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
-				   struct msm_dp_panel *panel, enum msm_dp_stream_id stream_id);
+int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
+				   enum msm_dp_stream_id stream_id,
+				   u32 start_slot, u32 num_slots, u32 pbn);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4873c55bd693..8e7374de90eb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -50,6 +50,7 @@ struct msm_dp_panel {
 	u32 hw_revision;
 
 	enum msm_dp_stream_id stream_id;
+	u32 pbn;
 
 	u32 max_bw_code;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 87eaaefa014d..835a55446868 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -338,7 +338,13 @@
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
 /* DP MST registers */
+
+#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
 #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
+#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
+#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
+#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
 #define REG_DP1_SOFTWARE_MVID			(0x00000414)
 #define REG_DP1_SOFTWARE_NVID			(0x00000418)
 #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
@@ -347,8 +353,12 @@
 #define MMSS_DP1_SDP_CFG			(0x000004E0)
 #define MMSS_DP1_SDP_CFG2			(0x000004E4)
 #define MMSS_DP1_SDP_CFG3			(0x000004E8)
+#define REG_DP_DP0_RG				(0x000004F8)
+#define REG_DP_DP1_RG				(0x000004FC)
 
 #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
+#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
+#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
 #define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
 #define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
 #define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)

-- 
2.43.0


