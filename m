Return-Path: <linux-arm-msm+bounces-107969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPODAl59B2qO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:09:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4035574A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E47A4302F7D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5800C37AA81;
	Fri, 15 May 2026 20:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oeluWDBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhvgjMNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36373921DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875704; cv=none; b=CaIBa1OXdhM6nuX8VAoS0pU5/zpPWqovJpGl9NTTRW13pjiob4RGdq5xR3smBqQDHAORfm0LCluHMEGTDswUoOAoEOwDcoj+ReJv6PWT5R+ubQKbQ00QEqORBRn3dpuurs79JQ/iU/GJ0ee2TlE73snh4oBIGUlN1sgbrNlufm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875704; c=relaxed/simple;
	bh=wHx7sphxQ2G3JogFllYloGnDGRdPJph8jXQ/6CvvKKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keCnJqWt9yncjd8aBQmr6kFdPNYTdnmynZ6HG/v4bE83JUBCMlUq3RtQIT4WYqPkzWn480k4LCJd1Lignmhd0E5rmnvIqGvxLor1E6pWUQjG04M+6lg3iZZnbINnzJIl2GZKXWYSlcgf6vLeoQCSw3EDwpBI1PCXjTPVfesu1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oeluWDBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhvgjMNL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJeg3C2837979
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VA4LbLc1gRQK/iiTsw45jkz2snEolhw5UxPAmzMtPSk=; b=oeluWDBfHCnuQGFR
	8ClgEW7D4lx+OiZRVrTiBmG3RCojTEPPxBUgYWd938IJRclrwDnrmedDiWGAhbQO
	+lVlsguxhPbjYLMY8+XIlWcHii2UYlTBDwOB2mtlN27BiGsrFzUWMq6NWM1R1Rmc
	+CJ0ruATpgRqk5yAhj04cHmELWQuGqVLu+EgXUSLdT/oQJYdzttHmInenpxjGFC0
	q3K/JZyeRrYq8CAqzb4xLb5NjSTTT4NbLOtQnEEGWPE0GFkc1lBc05SsGTRzOla2
	RARofUgz8SQ47dpSAG5An8UwLxTw3UZl9OKqIvVEklYS+4J53+q/JZebzqCXctV8
	4fOyVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e694n07ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so190535a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778875701; x=1779480501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA4LbLc1gRQK/iiTsw45jkz2snEolhw5UxPAmzMtPSk=;
        b=XhvgjMNL7aQGIT2ntiFyDFJJ9G4Ua7s2aY1E31EGDCCA0IKRboaDy7kfpt2/SJ9P8d
         SOvKfKvAT6F+edkCZkIZLH7/xbzPG4Uru9Fdmye03xEhNYqmEZU/sNCC0kYmY2AhsI/Z
         Ej4NIHnBUNFB/LViEhhl6cZmUEuLE16bRxMo7FabY0s2yMPkd40GLAXy4PpM11kA5BZP
         PVlhm/tCDwkzPAdP5g4kJaZjmdTYTmk/o057/twNuUUDU9OyeCMAT2ibjmxTmtAgFODY
         h+fNQNp185yhweuImKMq1Lhxt7b6lS9k4/iQiB2MlsRdQXcuvFll21yb3XZLFNNcUfly
         53Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875701; x=1779480501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VA4LbLc1gRQK/iiTsw45jkz2snEolhw5UxPAmzMtPSk=;
        b=E0c0LlYLCRkgRQS9mLnkHCx33WdJt87QX2SOIWMu14GKajv+S99GZDvQuC9QAf8s62
         6u0+2a1Ur7uGL1qr02YsmQ2JrslONAYdZDe9Ih2vCBh5GYpX9v0HZaWbZVWSMikhC6cP
         tSicI+4OLb87hvW3tvNg99YTIrVqx3tE88BxFmLsDOSyFS13qCPJ3Iz4+Q+F6vpQ/X6z
         iafwiWod00lYeAz0ogeBFJPJujpxrDoP3HQBIpiW5Uq0Moqu1uRW6vPGFGqUdHJg+zRx
         ajcSHs10Hcc8VbRPe9WkUPNblqTs76RzKoVG2RZrC5B50vB4Vojnn4zeePLmvtwu7mV1
         gAvA==
X-Gm-Message-State: AOJu0YyangIwapA4xPmTSJvS8wNxsfgBmJt9Tw7DLnq55tUabNgijcBa
	aZWCwz/JUdxN3bSnHlXHSiDKlmVrXmZlr6Vf4dF2RFo+3Ffm08fZgqff0fEtOsTqIC4cFBkF39V
	rwjxDs1c17pX8tC7Rh8m06aUUnRSorJAvSx5fqdNTFcpl/YCK+hM5obHwoou/i7U9r1MS
X-Gm-Gg: Acq92OFBr8759upfmvKBNXMxKURF4J4+cTRin+gui9NAkAXijiFGZYNnjBGiNds/p4t
	+WkQII6iJLXdRvXFkrQLyQsfe4fA+a7xEC1Y/z826xuAMj3vPd3MDJmlA8PYt+5V5zZx0ycbxxH
	ggAl1p6e5y4p4ZReuVop1Px66aFj8Ionot2ERyQZzqmBakN+q9jIj9VaVo7T/vjD/W7tGqhQqNB
	siYBvUH+ybu/UCmflUNh9UqJWXR5VRj8Wap2wA8H+nx0ZhDWrDfbYOV+TP+gDCXhv0AhrO3AOZq
	h+XJ4hjFd0fcsqq5KhPEzAJs2ewlDH8O/Jj32+mM2baSUitE4iOfg3ZIHr3QaycbSac9/72tc5t
	iqbc+BBCTLRQ9b+deIoDTPQj+f3uYdJd3VKqZ5lK0Yc5GPQ==
X-Received: by 2002:a17:90b:2e0b:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36951a6ce4emr5501300a91.14.1778875700802;
        Fri, 15 May 2026 13:08:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36951a6ce4emr5501275a91.14.1778875700295;
        Fri, 15 May 2026 13:08:20 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a820fsm3518309a91.10.2026.05.15.13.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:08:20 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:37:50 +0530
Subject: [PATCH 2/3] drm/msm/a6xx: Enable CLX feature on A840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-a8xx-clx-support-v1-2-62508bf651ac@oss.qualcomm.com>
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
In-Reply-To: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875686; l=2687;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wHx7sphxQ2G3JogFllYloGnDGRdPJph8jXQ/6CvvKKo=;
 b=G3Ivq08TbSQqYvhvie7EaREILmo2Z2YVDDneKJIA6TpI3C5YP8FMzLtex71VuZqvWq3jWJFg5
 dLCfGEWIp5gAtxe5uLuqRJzJ20yNY8yd11JQjSW9fjtChvNx/qyO1Hi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Ba3oFLt2 c=1 sm=1 tr=0 ts=6a077d35 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=euEflnDZojKr1heemAgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwMyBTYWx0ZWRfX6e+NrmYex/Ou
 MNyPXzPj8DFy2rDvBvY1jh2tM9EqfJfo5Ba+32NYkAPv3vsu/sagljKRG0ZHYJb+XVMDzFcG0y1
 i6H2Du+T1RCP+zVrLxrLzg7LuwKOZB487aFkUxh/VbwUNL5Y+BSm7YZTwuWWyVQrsxXSv+wSh35
 20t0pWcmmUB+NJTZu+XeuIaxBkoVSQa1dDi8BgNu5MuKoWBcoklHaErFc1RFK+3/dbtuVwmBcXk
 JzVtA0cabHajgdKQXob7GSjLHdi+YiVajOT1fNqmovfKF5LzQ9WxXh2NGdtWmi4osCzSTx5RnXD
 bUZeyrdg+ttAvDIsmZ0CgHtCPcOSpbnX3895PnfkrEPSZx4XQCTPDpkJio1hR8D/J8NqPA/isKx
 qfkzaiTlBRA+dipsq70dliNGv1aTRxD4J8dy8Hc1qsHmXSqPZVOfwTXdmLRN+FSMFu7XayR6ZY7
 qWggmvYYc1LlHyyApOQ==
X-Proofpoint-ORIG-GUID: vpt86eA_ZMY6ieo5lgoF7vNBKjx_T0nZ
X-Proofpoint-GUID: vpt86eA_ZMY6ieo5lgoF7vNBKjx_T0nZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150203
X-Rspamd-Queue-Id: 7E4035574A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107969-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the A840 CLX domain table and the IFF/PCLX limits table to the
catalog. With the HFI plumbing in place, this enables the Current Limit
Extension (CLX) feature on Adreno 840.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 86 +++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 550ff3a9b82e..c503912a61c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -2108,6 +2108,90 @@ static const struct adreno_reglist_pipe a840_dyn_pwrup_reglist_regs[] = {
 };
 DECLARE_ADRENO_REGLIST_PIPE_LIST(a840_dyn_pwrup_reglist);
 
+static const struct a6xx_hfi_clx_table_v2_cmd a840_clx_tbl = {
+	.version = (2 << 16) | 1,
+	.domain = {
+		/* GX DOMAIN */
+		{
+			.data = CLX_DATA(60, 5, 1, 1),
+			.clxt = 0,
+			.clxh = 0,
+			.urg_mode = 1,
+			.lkg_en = 0,
+			.curr_budget = 100,
+		},
+		/* MXG DOMAIN */
+		{
+			.data = CLX_DATA(60, 1, 1, 1),
+			.clxt = 0,
+			.clxh = 0,
+			.urg_mode = 1,
+			.lkg_en = 0,
+			.curr_budget = 50,
+		},
+	},
+};
+
+struct a6xx_hfi_limits_tbl a840_limits_tbl[] = {
+	{
+		.feature_id = GMU_MIT_IFF,
+		.domain = GMU_GX_DOMAIN,
+		.feature_rev = 0,
+		.cfg = {
+			.enable = 1,
+			.msg_path = 0,
+			.lkg_en = 0,
+			.mode = 0,
+			.sid = 12,
+			.mit_time = 5,
+			.curr_limit = 6000,
+		},
+	},
+	{
+		.feature_id = GMU_MIT_IFF,
+		.domain = GMU_MX_DOMAIN,
+		.feature_rev = 0,
+		.cfg = {
+			.enable = 1,
+			.msg_path = 0,
+			.lkg_en = 0,
+			.mode = 0,
+			.sid = 9,
+			.mit_time = 2000,
+			.curr_limit = 6000,
+		},
+	},
+	{
+		.feature_id = GMU_MIT_PCLX,
+		.domain = GMU_GX_DOMAIN,
+		.feature_rev = 0,
+		.cfg = {
+			.enable = 1,
+			.msg_path = 0,
+			.lkg_en = 0,
+			.mode = 0,
+			.sid = 7,
+			.mit_time = 3,
+			.curr_limit = 30000,
+		},
+	},
+	{
+		.feature_id = GMU_MIT_PCLX,
+		.domain = GMU_MX_DOMAIN,
+		.feature_rev = 0,
+		.cfg = {
+			.enable = 0,
+			.msg_path = 0,
+			.lkg_en = 0,
+			.mode = 0,
+			.sid = 7,
+			.mit_time = 3,
+			.curr_limit = 6000,
+		},
+	},
+};
+DECLARE_ADRENO_LIMITS_TABLE(a840_limits);
+
 static const struct adreno_info a8xx_gpus[] = {
 	{
 		.chip_ids = ADRENO_CHIP_IDS(0x44070001),
@@ -2185,6 +2269,8 @@ static const struct adreno_info a8xx_gpus[] = {
 				},
 				{ /* sentinel */ },
 			},
+			.clx_tbl = &a840_clx_tbl,
+			.limits_tbl = &a840_limits,
 		},
 		.preempt_record_size = 19708 * SZ_1K,
 		.speedbins = ADRENO_SPEEDBINS(

-- 
2.51.0


