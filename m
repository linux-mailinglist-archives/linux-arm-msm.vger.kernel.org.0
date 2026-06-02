Return-Path: <linux-arm-msm+bounces-110779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FgUOvegHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:23:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BCA62B608
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE25313FE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD733CF692;
	Tue,  2 Jun 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzxHiug/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQ/sKWcM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DC3CBE69
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391503; cv=none; b=qVJU6/DywQzUQLV4aVLlP7LTOqkhVsillkksw4veeEFkMtWsJuz+lEVZhGhQwdBmBnJB8vA/XSPolluk2EfKX2GeU1gmUldJbXIf8TmX1wXkepa8FKsaXApNqvKkfvvYDsEzfsFERTcCp3+CP1Mz+BXa8BqwQmxzxjDl70CHwdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391503; c=relaxed/simple;
	bh=z27Brjfd33j73HBw/hhLe9oIAiCr/9OyTLQ9EZGX168=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUIzBjCcZYW6oNFkpDyEO1CJeCftQTfswtDD8dA4rdmXSJk3sH3xo/8lQoP+acK6pRId4QcAFE85cFFtjABG+/EKJQktG1i1kwrgpLN8GWH4Lm6vT+HLpM0TzgIOoj990y2zggJ5xnYvA12jpYEaevIcCoRCdEvH+cdkO8pUtjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzxHiug/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQ/sKWcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525ioR51316228
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUh1BC9Oa2lMbBLcFslL+DmIKNezCTsWlDxQwL1V7Js=; b=EzxHiug/T2yqpblh
	T6Nik2VYn7E+V6F3Ea9nIb7z/K0HRPuf6J2A53ZgNESkuwh+LQ9DAcE6TqyIFlxR
	vmp5ySgaT+eAzo3Sw2u2fSlX4j3lwnPhYs4cWmYPw+6S7Tz8fu+j7HaD/SIfQrvp
	pzIxUJGkrL9a8U18fRV2qKW5FGjNoOngjNdq1Wi2NmG9mx2KmGqgP6JTYLgCMrgh
	/kFNuR8f9NL9N18LCoUwXBc30Q3l7UxTfJ+LVHWPjERDB/TXPNweFKDjmKQ5Hkc/
	Ng9z0YEY+S3C9d8LAlYmssp466uVxzn509T/CnzqAQeVaPzkLkhi1CTiH7VvbFDX
	0D/WIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vrucu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d4b3f3a1so222120441cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391500; x=1780996300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUh1BC9Oa2lMbBLcFslL+DmIKNezCTsWlDxQwL1V7Js=;
        b=CQ/sKWcMhoiBD2ZxeofF9vzQeDkLb9rz7xDf0k2JN2yCjKkKV2+dZwueuGt7l0cdLR
         T7kAvJkprGgazZA9iP0plZWaAK3JSU9DdYpJ9M58jL3Io/to3uj3Mmnes59X8Eqot0Qv
         Ul2AmsN0RcYruNXm/TgjdzsgYPk3YW4vEMsrclBXq68noYqXC1U2+KvvzLkaHJ8BXwGg
         eRydt6ofDUBA8HwBaT9bRqMASRI+TV3D1bTKjNivATod7I/F6dwJjsG9Nhvaxrv7CuQ5
         5GEMjMKdogZPbqGiW7LICrh2Ym4XGWoZ5MQwYSAYOBcDw8ZM6vCx/PZHfhwKQfbn10z4
         eY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391500; x=1780996300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TUh1BC9Oa2lMbBLcFslL+DmIKNezCTsWlDxQwL1V7Js=;
        b=cVNTGTBt5r4o1A4QiY2LYmba9EVilV7O0jjr5nSyXxf6hRGa6Trnw4zF01wLRb5R39
         st+sFD3NE7s9z8MmiFrZSqgJGamCpCVlQLdqps/xslD12QUb0FxzglUo0m+jSTMsSqLa
         nchtsJnR0QnpwrlGKfHY/pvBZuFPZemE7lSI9uaOP1Irbda88pShWhMo3VSJZFegIzTU
         gYtfec9tK6GiC5IEM/PCtT7gXasRWFj3LeItY7BVU95S6WfOUOaCUdIehj2yJxWvSLOh
         TDaFvrTrxO3THvSAcC0nhIMcp3jSV1yb00mhuKegxoex1QTdmVtlB3ZQ5zRyASpDWJxY
         Zhhg==
X-Gm-Message-State: AOJu0Yw8yNO+nQLKel/bB+l2vtwms3iaPwnOlRQJHTr7hiG0zfkWU8bL
	5WRsAC0UxjwG9raOKCFyAWeNJTrjXITBNsQBweCQUYQ1XTS47vTN95c9rL2HxvpEWLmSsHqdFsP
	CH6jMfVPfMVu2OkOy0hfyqCiCcghdLfV9Ks1yne7Sjk9+8oUC1M5YsgLnywc4IM6drDiE
X-Gm-Gg: Acq92OHIP3m4xiM2BMNwFBof6cdBGdLXVpVpmEhhAR0QQ4Yfm9Y+B5VKM6kvkePzAKu
	dxNzhCT8M2VNFcPLH2YtegdevtF/bxn5tC4m0fis08s8+Zc2NK5i3ZsmucGPr+ex1NpjHdKv6Bs
	ig8eDhnlVDmQ+OyHcehdvjpELQaIXf3EUYgeXS0WmrQc+UNzWcQAxlxRkqH1wuIgcxms31B3K4U
	U5nLq3XxeMXQHx9XilLDBX027ztWUA/Dsk9BcaE3943cACsODmjC1mzb8AoIp1ikDJ2Iz8/QnwD
	mFDh8oB2FWXbefnWNq3lJbwB9TKcA5YrXwAax6uSCmxwbS/0iiFTH0IA/xMmIjc9z/8ItFWPv5O
	9y+91ciLUEM3crEXaKKq4Yo2j+cfYrLtr1Ff/oImkxEO2DAYcwFOdHolHzDwBlcgEjlaxTMsePo
	Mr29XbQZXk6j5QlSVpOw==
X-Received: by 2002:a05:622a:5c16:b0:516:d955:ea6 with SMTP id d75a77b69052e-5173a67b6d9mr228727271cf.14.1780391500539;
        Tue, 02 Jun 2026 02:11:40 -0700 (PDT)
X-Received: by 2002:a05:622a:5c16:b0:516:d955:ea6 with SMTP id d75a77b69052e-5173a67b6d9mr228726891cf.14.1780391500074;
        Tue, 02 Jun 2026 02:11:40 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:39 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:16 +0800
Subject: [PATCH v6 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-4-2c17ff40a9b2@oss.qualcomm.com>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
In-Reply-To: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3766;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=z27Brjfd33j73HBw/hhLe9oIAiCr/9OyTLQ9EZGX168=;
 b=uh/2vuvwZi4NPWvxpb0HLAMWnkDC3My/HP9tdgGNJh4egce6glFrjfSqF6g0pTqElE5gtP5J4
 iyXlaYzrJ2UAeVeEOMv+hP2Hf/EGB2wils/8eUs9M1JQyfosEXeYeqG
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: uiz8ZKF_RqWHfhBZWJozGpoMKy-FsA-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfX7S5DrjqcqBc6
 Wnbg194OZ144yvWMdbp362atRDf4TpL+JQeXK5tY8b2LkU7iSeLFEzG3+lpWf7yf+Kz4Sn+Slg/
 E+DGwul3Q2M5mXsYgyp6wvH7JB5HOalOeZWY6GAqy8ykaD84imnKNaLFVzWepkP4q+me6Ufe+83
 j1DSczLF+HjagDtTGPEE0f19vXk9Ev5sHLhwUet5cegp6gwh1W9kk0xU3wBQ0oyqoeAEsRfOu47
 jOlSok1qWq8ufFgBiC0HhRW00YIxf6pvEL/arK4PXmeVY504AAL0ukgDCIR6wznDYMZTa8FXWlA
 3dQAQOyTkuvHbc1mopAtnyEQerm4/jgQHCOfGXWtC4vmzEFLdKzag4bPhSYz/A3C30sIYMoB/G/
 WCllu08noxs3oRsnHsgRD9jjeQeVGZfrrz0M2245Wgpb81Dpz2g4WDU//Onc0+J3jpNkTF/mZRr
 iLvaoZvX7U+hQv+pasA==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1e9e4d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N4WGanfLxQUAwF0MUGsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: uiz8ZKF_RqWHfhBZWJozGpoMKy-FsA-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: D9BCA62B608
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separate the configuration into link parts and
stream parts to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 46 +++++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..ed2ba47881fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,44 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	/*
+	 * RMW: Called from atomic_enable(). Serialized by the DRM atomic framework.
+	 */
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+					      msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -421,10 +439,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +465,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1644,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;

-- 
2.43.0


