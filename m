Return-Path: <linux-arm-msm+bounces-110091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEWiMB0dGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DC65F0D81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A691311B271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D533BCD28;
	Thu, 28 May 2026 10:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkl7es++";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxgZVZj0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA93BC685
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964859; cv=none; b=Dz/il81RmNqXrayxcApPjZj5ZCOSK70pOTQDClfcKUlB/cxOnKhNmkEm2KKJoCqHHQIcLYQywGScrXTy4MdRg65nMlsM16sabT2MpVK7ZA/Uenk8Zx0LtLsqWMUjMkzJHxWRD5CudsVZCKHVtCqqqpReO6rgfc5Wzsi7KluScx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964859; c=relaxed/simple;
	bh=VluQ+GSUC9CfNFLNLvLHc58jEW6kFKOO2mES+jvgQeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5KUpwgcKrqlV/Jep/QM3dAM1Axtly8sv0PpZAzdeb61oFZ/EUYi6ZyAcV3brJIi2QrJyf9OQfAFEmzyJCJPe1Kl/A6TJ+6OrQajj97QbmxPw+P3QCERtHC6PmRX1uDK4eKCWNrMWRezg60XyQ5psdhiTnX5833c+2dLTOf9SJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkl7es++; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxgZVZj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vulp3203841
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Gr2EDNFY0bB/CkE5VFTvCv3redMXxtxC722xjDFOpI=; b=fkl7es++ceLPClkI
	kuIGujljJ5DgQ0jRRS1KCHlZcCksXYce8u9nSPrnuKEOsXtD7zCTxEkLn0wWJo+s
	dgC/mZ8Gh3HtZxXno8Scj8T6Tcv1afih7bNzEvF2uRDEldYZfMdtFTvstMQEO0j/
	G5SsHeJLcmB3o2TkCa/bHfbTxYie6HRM1cUwLD02uxdJO2zgAL9D3qtaDm+j2L2E
	nJRElhWD0HVhyjIjAuSaoe74kKWcj475qr7Hr4MwA548zh7Qo8gtmZLoBZDMXdkV
	1wrZ2s6TYhjwv57Tza1jXA7Dy/KIts6mIxiYEEJ5KcV8Jz2uYWhcesFlhCQ0cmtK
	oEIxMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynje3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b56ea791so155689285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964855; x=1780569655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Gr2EDNFY0bB/CkE5VFTvCv3redMXxtxC722xjDFOpI=;
        b=WxgZVZj0oXFAckgpOiTc4v6sZ+SeTY4q9W6GKYEwbMxB6H+VH0SyZ2iRjh9ChWrakd
         zx+/GPhlPwl+mRV3ifgfu+02MXSgER36dYnB+LNwvLxvEpNQ/JEFSDR9ANfC9MDQpazv
         VlBuyue6Uy28wml8f0/pGg0kkUL4KZdCfqF+FDeX11DIHFN90Fu4cbmAnVB38xm4oZdp
         qjiLR30NGS1Nfe53UT/qzZpTzb5XZ4CuzzC3HUkBbJ7D3ziPGroUCs59wJwWs7GHb1e2
         Qhol/szaBB1XeNC1STLQbNoFMhZEWrxbCeHwk7k/vL/BWcd157wQqpzCqWQ/eobWXoK1
         Jf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964855; x=1780569655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Gr2EDNFY0bB/CkE5VFTvCv3redMXxtxC722xjDFOpI=;
        b=CU8pdFxmJdRB9TPhIQdDy1whjTIgoCGU5I2s/tVt4CDU2sg/NLu9G3TjIOXhSwKX3k
         /c7/KKmYitqLcap+hUi1sg1LR2MFwhnr4l2gT2wgUmTFLil1JI1IGYOCvClGEnRE0ifW
         N4Ug9Hn8FzSyPIGYS0VPjTDNqEjfaOp0t6mbow+GFgFXn+uso+tjAwwaeHFvYN+iPrdq
         HWDsyOclwRbV6gXqR/Q1p116OTac/CbMQBowcImeyKXo/sK3dQ/NCR82zojGxG4kA1E4
         1NCHbO/PkzMyUlHGZXRXZ4KwgoR/tWflM7kfPiwRceBdA8I6eCUtYSEtuk5BKOW85ytb
         CsJQ==
X-Gm-Message-State: AOJu0Yz9fZXIVtzoOjBW2Q9cGCORAC3Z4PLLxwKfM2roXk3Vs3koFG/n
	SFsDQOdZKTuEz82VcbDnvetvb05jhNrqX0IoBTGV39VIXFfwhmZJ4SkJtoqRwYhkL87/N9t+LNi
	kWdO0cyBVI5VXLHcB2Xbx949qZKB9JVuqIaQuBJcE1QLEWjMucVgfI/OVdnweQUhUkald
X-Gm-Gg: Acq92OGjbQ1lNVOSEZyTv+OWHv0U1MjlC4mNjSXn1CXfmq9shMu9IAV7+CeB/GRxaYM
	XDKavq3tU+3bTsPtvG+ASp/Wq87hMXOl2z4JSIP/+Zjb87cojFkWHxPGxxETfXhoe4HVYdu3rn5
	g0r95+AeGjl7ph+9tI2XB9+nYtwM1myaHoyvS6bmP85px3hRRJqvOl4CwcaVHHDheUoSLEn4TQC
	5fH8BV2DFIr7JkNRT8WAP7sVgBj44M3hLb8PTuQ8PXzlp1/QjEeBUhVxMx/ILBnXixrnuwzKIhu
	qScETQweLdFwOhdcVNwBSAYpMtS89s9iaYW6jSML0wvg2WdXIQI0BgbQ8UxSQrTRirGVHagkbb7
	RZ2nRU78Aa1A5LvDnRKmutt5CaW29arXeCNzIXPQ4nbO1DuQwWOKTCXLU/wH5Ly8b8cK9dYeP/W
	IYe/wMWIq2KI6B6z/GmQ==
X-Received: by 2002:a05:620a:2b45:b0:910:3078:5cf6 with SMTP id af79cd13be357-914b497bdfdmr3946452385a.44.1779964855197;
        Thu, 28 May 2026 03:40:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:910:3078:5cf6 with SMTP id af79cd13be357-914b497bdfdmr3946448985a.44.1779964854789;
        Thu, 28 May 2026 03:40:54 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:40:54 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:25 +0800
Subject: [PATCH v5 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-4-a9221c1f1f3b@oss.qualcomm.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
In-Reply-To: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3827;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=VluQ+GSUC9CfNFLNLvLHc58jEW6kFKOO2mES+jvgQeg=;
 b=psov3Sj3O7eYFrJBIUaTQxDLdd/VTAk5+SUcq8dNSTo6AIN9r86zWmEEgcrnxXRhrXWkLCVBQ
 lPET6FJ7PCRDK4E5sPuK4gWzA9PZNsaocJZ+Stf+rZNCag/61aohQuH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNiBTYWx0ZWRfXxl4+7ZV612Ki
 4TIAE8oUky6BVJXlRN2nlrzjsUZzugTLLFzI0+axDJodW6mmuKAZg+N8a/AJuRXT1aOz7gUciW1
 wbmrUcbnzHWswarim29lnmlH0+GKO57wWd/+U8CRexogwya+n7gFDytmMAsifJ72BzgT498MPQv
 qYbVJISLe7rKXbo0zWdlXeDJSFLVFi6S5cgAF5bkxPhEj0LEtgE1DYptHl0ZL3O5FqxpKZAZEhm
 uknPa6oRROadY4BSMIF8aRIiEuycon973w1wFJOY5uLIRE9ObuQlfvbX8smahrQRYWqDpFxW7yO
 q1O6mju1+spxF9s64Mgsslk8r9HK0OJ1rzd0rEqDPRMc4U5O5PdNx2Sb1ZYywIifE1UsuXPm46k
 IiiCbkXrDC5HAv3shmaeeRazIe4LoXZHT5Ju61le6B0Y8Av1MceuO573miFML1NR5Lx9hIrrkbQ
 xKjR1XuGtiW9W6z3YNw==
X-Proofpoint-ORIG-GUID: tU00YkX2vZNSDkEudc7vqoWgeM6uPYHl
X-Proofpoint-GUID: tU00YkX2vZNSDkEudc7vqoWgeM6uPYHl
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a181bb8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N4WGanfLxQUAwF0MUGsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110091-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28DC65F0D81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separate the configuration into link parts and
stream parts to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 47 +++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 86ef8c89ad44..cc00e8d2d6c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,45 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	/*
+	 * RMW: in SST, config_ctrl_link and config_ctrl_streams are called
+	 * sequentially on the same thread. In MST, caller holds mst_lock.
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
@@ -421,10 +440,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +466,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1645,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;

-- 
2.43.0


