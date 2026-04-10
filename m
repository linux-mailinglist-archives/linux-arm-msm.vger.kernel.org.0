Return-Path: <linux-arm-msm+bounces-102628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ILeB9XE2GnxhwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:37:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF923D5037
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32E1E3069BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B1A329365;
	Fri, 10 Apr 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Stg8oHdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeS9R3g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4873B4EAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813662; cv=none; b=AQ1fFqHnQCK6RfbKUOetGUomUo/f37XDEFULC/iYSPTIJXX5YKT7f32tT3ke5yIus3ZzLMOMpSE7zUAsR2ZCazHIaj+Az3Qka8Llskyib4wjacFpNlzzBEWLm8aaRzADDZa9lEV3JCnDo5SbXltOROhtwu+uCNimdoO2XjITUDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813662; c=relaxed/simple;
	bh=DmfXjCm5CMc9QUMbnkHNM0IxZcwbFs2CBGArGw/Idno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bZkQq+RtfxavbmKfciniCmXSZWpE5HbPTa/crVU17BD/MT8+DjJpdlBOLpY1QDc/RkYrxA9Mt/Kchz/FpDLlYeLn0XoXO0svr/QEyD5kr2zQ/fwfeVuT/hFtf8axbfSpt69fY6DeijJaw6hOV6lki+Z4L4tS/fN8tJLlnbi5sX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Stg8oHdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeS9R3g5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A88pTR115320
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2gVsfBAP/XpmUtHNNyA77JIrx7z8UN1Bp+hGLyI0/U=; b=Stg8oHdjET5MPOkU
	4gWNncsfQLtc1OrCvgJKfKLEo5Gwf+HIrJgDrhIgi9aY1bHbYYUfexGSKr4+zS64
	KZ+GRPJG9fXTptpOEhaNtLvH4ruy02MouSziu02NRmZsfGmhYvQPvgwcU0//PWzW
	/SvQJAps5u+jhZToWzCIrQr1JT2CxPt/KCg5ahsXN2BqiSRsZ6Sj1TMmcbiNtTH9
	m3uJeHyE5j4kuJDNSbNjl6NcsnotftraUVfl9uDnEWUbyUp+W5z0xYAiQswfgmLN
	QrtQOvouN25rYUXQ8lLJ3AlNb5GDCnf/KIAunsM4L8mO33fvigOXEeLT04zV6fnJ
	vOx7Gw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8xb8tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89fa878662bso42915476d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813658; x=1776418458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2gVsfBAP/XpmUtHNNyA77JIrx7z8UN1Bp+hGLyI0/U=;
        b=CeS9R3g57On6/ZjdelMXJmRA80nry1z1v3Ws8ManEmNZtIUosuAd2f+o2qYRDbHR9Y
         74mUAP9H+ILEV4SseiyVArK1KyBsHXqqaNDevQ4gqmGIcEvanSIEaDvJQZXham43Auc4
         XiQNMeBM6FlssLQh/bP64s1Iavt6wboVvyr4g6jSp/Nsj9hmpKVh9o9Al0Xj7d9v3CJJ
         zBYu6ejCSwuAAc613B9bCqZG5il1helSChU0h9QSjQM1BNMsYaEJKok5xfh7INRlnhr/
         WYNYH1+niGFuNR9XLjGgMDUyemrGfNbxDGU9Dq65/9DyIaujme1mDf3CTbQo7t6+4nSY
         tt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813658; x=1776418458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2gVsfBAP/XpmUtHNNyA77JIrx7z8UN1Bp+hGLyI0/U=;
        b=Xm5I2uSVOpkMF3G3oAGIn7QjbuTQBAUh22Xjhz0r2QtcMeFA5pk6C639uj5ryaewd2
         6UtYNMls1CT19IjxkTI/JS8IK2MOtWcWHGERi3baNdUDAqEsVYAEfUGHt+rdLPE8sU/c
         xBmj1x9/WRcsSNRL59xnBYsz/bErwS1Tusc9YBny32X6aZaXk82xm4ONojkinXtSN4CG
         F8LxrxtubKg7oW8Ybnz9wL45zSjZUZ3fOjGmPnRrR2zZ4AUALCYAmecImPKmtF2+Hzrp
         kcK8Ozh1t8tJqtNMtFxRKzJhqdmUUpfdrCCxE+LCCW91uW8LSjo1SyNS7qYqIY6F74A5
         3jww==
X-Gm-Message-State: AOJu0YwBUlQT+oV4g+HdBbdDdzf6DCI9kfmLVKO4yC8PsMp4XOVMvK8S
	ZlmcQPbg0Xzzyo4fYxfJYPGzXky7g/MOvAXMu5eRnfq/QFt44dFdcz+znN791CfczTQRhTa+PFY
	+y/qASLe2bDILswr6lZ6ALZdTh8x8GetizSbOsoERRH91tZDn1l3m0IFNSYYnSSSwLrAFiE9wU+
	9Z
X-Gm-Gg: AeBDiesJrgU106IzeWGQCZOs7xRBBzcjRpYY8svwTQjwYr3L30M4T5u3R/nhuR8flGD
	+O1B7RBH8fhOI928a+7VOdUzeI7zJY432P+LnYnQD/xVyg7bpFrhT0ufaeA9jv5VkWl7mWJKhPQ
	o3+Mo96lKsV3jXkv74af6CJdxT12+xudMH0gRSFNYIyxzC8X2JvR7q9ymust97OK0YOwNXWuy7I
	U0XM5SAP6TN07CueC2LzcvxK9ig0i3y0h6W6uEb3CXQnPu7sR8Ekf2vGSgQWpFEEM25BFp3xOR6
	jFy7EIHtocwAOqhTzmMOFJ5YqRxK6IFtP86noDooAPeSD3qQOkGm7y3kcbLmWWQHD5b8yuTK1El
	4pfzK7p2gPr/MM/dd6a97q4eTSYELYLIlCU2eJ/igruMEJl/auu1JwxmM+WoNuLueV+1UOahH6V
	IPMCS0n8c=
X-Received: by 2002:a05:6214:524a:b0:89f:c414:8d1e with SMTP id 6a1803df08f44-8ac8630980fmr34280226d6.52.1775813658393;
        Fri, 10 Apr 2026 02:34:18 -0700 (PDT)
X-Received: by 2002:a05:6214:524a:b0:89f:c414:8d1e with SMTP id 6a1803df08f44-8ac8630980fmr34279876d6.52.1775813657980;
        Fri, 10 Apr 2026 02:34:17 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:17 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:40 +0800
Subject: [PATCH v4 05/39] drm/msm/dp: splite msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-5-b20518dea8de@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3675;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=DmfXjCm5CMc9QUMbnkHNM0IxZcwbFs2CBGArGw/Idno=;
 b=7G5maolJyW03eOOrJe143+E2cKWyrZ1ycbAl/ZXheE5fZZAsi3OHRYzrm1PHPPDxJTT+h0RKX
 uFRXrK3cxSYADbg4RG8qLETRnSktXeuwyLymw6DeUzJft5BtRV/zQ90
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX4/psD/wcX+eR
 9J4c8HSSvl930YqxXBzGddwjzwpsNd92BlX0uKICMve6PEoxbPOCL/TnO0q6Foa2Ngh1be9wdon
 YDnf+w9FUwx2ewu9D32zhZVeK6lyqNvSHhUvSrCzRUuHkkjO4soDniNAiA+YUSX8MNuqpcUAkrg
 hDOSx7n8ztLtJ+T3tWAs0Un6eDCvrIYbV3EBu1Xb3gtBrkQyaqIFHVftUf50ADPMfe1S+qYoS6m
 yPl9EB3UNVe/c8VnNZIgRDauFXCYNZ8B3ct0F0a/reuanHPcCf40ZoUaOKU22U8o9V5AiDcrb37
 SD0rac17/DCLedxI9XNVDx2SJsEdO1FhuC02lybMqZ30rDD4zV7OafLkv8jLZ8wX9DQ7UUVtzO9
 dnXhwl0yXlq9ekOmZ4Gt/HIDkI8jtkorVGq6zlikQLMNBZfwrt8ya65FYUvzDgano6SF/B1gH7E
 FecMKL9uuRCdtu3kkCA==
X-Proofpoint-GUID: dD3l7CFnqvlhC-qJ3D-8MaJU_yK25Nwq
X-Proofpoint-ORIG-GUID: dD3l7CFnqvlhC-qJ3D-8MaJU_yK25Nwq
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8c41b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=N4WGanfLxQUAwF0MUGsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102628-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FF923D5037
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together. Separates the configuration into link parts and
streams part for support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 43 ++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 476346e3ac19..85315467b5d0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -388,26 +388,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
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
@@ -421,10 +436,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -450,7 +462,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1628,7 +1641,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;

-- 
2.43.0


