Return-Path: <linux-arm-msm+bounces-102639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDb9LL7F2GkuiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:41:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 729973D5118
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BFE63052E92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E884E3BAD8F;
	Fri, 10 Apr 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4eWpjn+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVaa7tAp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624836EA98
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813717; cv=none; b=pGylVHytWUmksBx9E/DGgjyvFNTKaoZ/VGixWCC3EniaS/V5K870gvEP8xGedAMHtUupdSWqAcAOzILHUyGXznCq+OMuoVw2CAmuuMVQQMNkDOAh4YU+vwQc7m8bRREUj5+t4DcLGz2uO7B4OLX60dIOWqx2yV+8Mm0teG+XoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813717; c=relaxed/simple;
	bh=mIHdvV8c9zaaLyLMf7PTLynkPlf9CVqaJlXZOV2+cMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNColTzWkfQfENblYm9+ZEh+cZ99yCDOb6QW03z1GTgQbr9mbf2bm4hT+Ulun49BBld7ygsabvnwEAjqxfg2o/4cAmU7iIEafYz9ow3MY3fsivMvnzWzGA7tcbqUY3jkS2j14oE6iFnO3cFKdqTMQBvfhhvz08dJ1FU97mAs+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4eWpjn+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVaa7tAp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6p1o61433129
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXYktvLz45feM3ZV71iuD+raBjiA3ymkE8nCPmjwqXM=; b=m4eWpjn+ITTupZ6E
	+cZrfwg2uwugqXY4lkJWlUiYszYqSzHROtGw+gaS/FTRt30LV/GPGXJUogEToyC+
	5gANGtUeOnD+UORQdHngDnJbRCkD/nOQPt4k6zZoIffMp8upe4rGcLrI/oKR0qS1
	XZ8UYYyMDPcH7wWrhg76+FNLMMK1T2j8BLgckTDP9WcXl2c4WDburo44sYLQB9XI
	PqV24CKOMGuUdoPymjMnfkW8vvNoigbBCWJSQ6Z5eUNPWVBPrN45FEkEWLydnw8g
	+yr+lRXqkkiIJHN1221NAbDN/nrtNDY22oZa2ABY3/a7gX3Xpa3uk+dVfxIogb9g
	XnAfoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfbp54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a4f18b1b5aso43884556d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813714; x=1776418514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXYktvLz45feM3ZV71iuD+raBjiA3ymkE8nCPmjwqXM=;
        b=TVaa7tAppfv2vWhprNiMuSVRuapFwY0497FeMYnENPVGxTr6/UEVvpfehAQ8kN2sfm
         MgHewlqGrgJq3EnMxG65+tyvvMtb7PnoM4ZEjq1XUCsSFHGK4S8nLv03/CNPRJjOIg6O
         O9piOzlotTa47BF0Z0wdBUVR8ts7j/ErWP3w9fAB7ajt2UiuOzGBkv8hQuMc7r1dgbij
         kImQRL/AM2TdIbGCvBottsPHDUZ8BdEzCFofiqTkDmhgKU9nUM1h8fzd6qOmv81l0FWN
         f32In897RTzFDg2931oEZQ2aFTxPmLmGn06uq04lhyggaeyeuOqV7NrNU3DNPAy2r670
         XcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813714; x=1776418514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXYktvLz45feM3ZV71iuD+raBjiA3ymkE8nCPmjwqXM=;
        b=arOrJuD9AX6KORdAXsWTXhZdTLhMSRn1FiZtKKpo8YAZj0IEOqnX3fzmlV0VSdNn/4
         DLJMDpO8KeNUN8btadRyeeNd4Q4lgzYZHPDB9TnbnYz/RCcE0fRbCqeTFYQKm+tK4V/u
         wcM7mLQE0gZjg8CWwah0ZTW9GIk7zriMRWjHLbu7PTHLTN/uP2NQKkUyY3kCToe0o07x
         1qBieHUsPEq2Ha1Brzyreu0T8I0xHCsickOajI3M2f6Nqml4pZpiqepbQWxpRbf8XXCD
         zwn2FJhdYDuhmWjVivkGFJPt7/24AVhRKMuyKcYnKDfL7MYzLSEqFoZ15NjLZdiJlIYr
         yZrQ==
X-Gm-Message-State: AOJu0YwP3NH5F/cZblyUokWD99JQ+Uiogo1nHVAFiNirPdoTfdym+N+l
	TtV131iCiJ51kpE8Ebs+Y9VTU9OYI0N1KEl+2Yh/HXL+De2OFLmumUyEDLhKOpYQjrI18wLmtNk
	LsRDesgt/RA7uj5EP6IWZSP0lDU1ac1tqbiWgU2V+FSBtqn1/fAoDr4qBde6AjV2IdpoDgxe26U
	CdMhliEA==
X-Gm-Gg: AeBDieu4VWJv8To4150ORG1Epm3Debj5/Gd07vclPA5/auoa/To7Rp8tFA7Lvk9YI4L
	vgUUK7q2Qt+pUx0IiQM5cguKBSXb0fkLSca7AJ1zFMl+OBpu43X/J/WS4+0BTnV8VjL+reNQ4fY
	YYSgTb2XdrSLgZ4c7pLN3Non0/2mK3/iIadRNMxsRD4y1Bv70Tv2OSYFSGojarftolaiTm5+YSt
	MApKpQfvMaedICEEnvgjsSGD7qbsOAotBFGGc9lFvazpDynai/VzuqdxqQKku/4Iq17HE0RTDVU
	C4XBfLmDax9U4eWirGbkVcBU453A/zWUzRreBPn/q/MUv8NuXKXWuoO/aK3UXsKoN9PdqkOXHEg
	n7PWoL4yyMx9/FaGxfpYCpvkcSgymxGKdP0iDxKUJFG742bsWkY011T+TLhNK36rocHcJz1xcTH
	mS+wq1Khc=
X-Received: by 2002:a05:6214:2f8c:b0:8ac:7d70:f0da with SMTP id 6a1803df08f44-8ac861ad7d4mr30933756d6.14.1775813713701;
        Fri, 10 Apr 2026 02:35:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2f8c:b0:8ac:7d70:f0da with SMTP id 6a1803df08f44-8ac861ad7d4mr30933326d6.14.1775813713240;
        Fri, 10 Apr 2026 02:35:13 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:51 +0800
Subject: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=11854;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RmyApAS16nAKg7FynU6vvc1dd58m8FHl8K8wSNA5Awc=;
 b=nupSmMJNPFtVtVy/xV6JjxUaXtOLJp9BRmud0r0f5Wiozpiy2x+KOi8Q3x0Fj7MdXLLaOl2DI
 2CoA2kAfd9hCY38dAMxH0a/Vuyfteut3lM2tOj7kmLfabbgXndARusw
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8c452 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ABzDXVyGmhTa0PgmjJQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX8jt4JUElGAbS
 PZdu0MrlKwkx6lNnnYYE1KXYOWcDt3IdwMSP2QWfIBAr3nFRnn+c4+tA09n4MFZmkKWYiPrvhSz
 bhi7wR4Os12F97hCySdNhdPffWj9vWkcxqQh5OiJl+3L6qBy7zg0MTw6jrwgLys0aFflXp7my7/
 hs1KboYtZU/N4TB5EMUfb0mHxsojdOFD2DvUPQMMmSvfrRip/xxLJ3HR+c8BXCw15Vt47dSp7aH
 xqWREfJT+Nw43yubHw8R2MpKiLYAfmUI8JD/M2z2KEItCNY1Ms7b0u7ufnUrGXmGuTUzMfIDhzD
 vyUHYSLjIQa6hAJm82BzPny8ULLdWNVvFhxlVQXjpNLgqkTNcNpHJAcYCZDjlj46gxlBNPmQGFe
 r4GEYXisK/3V+IasfB4xmiSkSBlUycQElJa7s4VCoezfvZKbTkDhYhZ9QzeTSb2jym5eVsal54x
 JEWP0oZkeU+OSfd7POw==
X-Proofpoint-ORIG-GUID: o_aEomBOymW5wE5gXKCt_VWDneZDMipg
X-Proofpoint-GUID: o_aEomBOymW5wE5gXKCt_VWDneZDMipg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-102639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 729973D5118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
be used for MST in the dp_catalog. Stream 1 share the same link clk with
stream 0 with different reg offset. Also add additional register defines
for stream 1.

Streams 2 and 3 are not covered here, as they use separate link clocks and
require separate handling.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
 3 files changed, 81 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 1e80d6fc7bda..a52bcd9ea2a3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -393,6 +393,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+	u32 reg_offset = 0;
 
 	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
 
@@ -409,7 +410,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
@@ -460,12 +462,16 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
+	u32 reg_offset = 0;
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
 							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+
+	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -475,7 +481,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2446,6 +2452,7 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+			       struct msm_dp_panel *msm_dp_panel,
 			       u32 rate, u32 stream_rate_khz,
 			       bool is_ycbcr_420)
 {
@@ -2455,6 +2462,12 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
+	u32 mvid_reg_off = 0, nvid_reg_off = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
+		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
+	}
 
 	switch (rate) {
 	case link_rate_hbr3:
@@ -2509,8 +2522,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2585,6 +2598,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
+		msm_dp_panel,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
 		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index c17b87353d1a..6c88cc7e3037 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -447,27 +447,35 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
 	u32 header[2];
 	u32 val;
 	int i;
+	u32 offset = 0;
+
+	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
+		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
 	}
 }
 
 static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 {
 	u32 hw_revision = panel->msm_dp_panel.hw_revision;
+	u32 offset = 0;
+
+	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
+		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
 	}
 }
 
@@ -476,16 +484,25 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	u32 cfg, cfg2, misc;
+	u32 misc_reg_offset = 0;
+	u32 sdp_cfg_offset = 0;
+	u32 sdp_cfg2_offset = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
+		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
+	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
 
@@ -495,7 +512,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -505,16 +522,25 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	u32 cfg, cfg2, misc;
+	u32 misc_reg_offset = 0;
+	u32 sdp_cfg_offset = 0;
+	u32 sdp_cfg2_offset = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
+		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
+	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -522,7 +548,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -580,6 +606,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	u32 msm_dp_active;
 	u32 total;
 	u32 reg;
+	u32 offset = 0;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
@@ -594,6 +621,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 		drm_mode->vsync_start - drm_mode->vdisplay,
 		drm_mode->vsync_end - drm_mode->vsync_start);
 
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
+
 	total_hor = drm_mode->htotal;
 
 	total_ver = drm_mode->vtotal;
@@ -624,10 +654,10 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	msm_dp_active = data;
 
-	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
+	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
+	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
+	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
 
 	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3689642b7fc0..295c1161e6b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -332,6 +332,17 @@
 #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
 #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
 
+/* DP MST registers */
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
+#define REG_DP1_MISC1_MISC0			(0x0000042C)
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP1_SDP_CFG			(0x000004E0)
+#define MMSS_DP1_SDP_CFG2			(0x000004E4)
+#define MMSS_DP1_SDP_CFG3			(0x000004E8)
+
 #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
 
 #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)

-- 
2.43.0


