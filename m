Return-Path: <linux-arm-msm+bounces-107970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHvNI2V9B2qQ5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:09:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B05574B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 22:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6947F300F611
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 20:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2CE390C9E;
	Fri, 15 May 2026 20:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjLHYoFN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFYtB/Pm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979923932C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875708; cv=none; b=jv0QZRioH6uy2CkibCBFnW1xY6oPNlGPFPliiB6drJSwaKFUqfxT0IhCOQYfK2Ij3DAcHKxT/cOtJkxf1OdgCQC1tBxy+jC+v96NM4+rd388SWoG26jv+0lFBuASZ1ILIAG/BVyI+WUNCUKKnlg5wCgcjB5P8bvIWN0Pd1Op2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875708; c=relaxed/simple;
	bh=31IdYVd1Gff0fxdHBLohNr7vJBxGvvWroZqIO5O9rUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1y+Fbmr28OVfxjHbfrlFT6vuyscfPnhQeXyfbzqCwTeoBR/8L4T0eKBsoMu6v4IdAKkXLQjjn0l99pog4eEb8I/EPbn6RXAvW3uTWc/l9AjVE7zEbiRgFxuvr5eRwYCFu/oI4XiBYY7Ky3vXwWx5q8RR4UqTh+aKS6F5BCZbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjLHYoFN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFYtB/Pm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FJehx02838082
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZITHqhZFxZjfKPaS9OhfJTadzsMGDsCFdEuZ6sFvCs=; b=OjLHYoFN4D7BnvyA
	3HWPlUl2PHxuafhc4hKhMwoiSDg8dW1FuYMTWdnPn5ZjwTUTkQQxErg6zRqpezNS
	NbMkX97ipHDwF3pLmNnQjOCnt7zMScoNlTMCBM/xQEPQpyZkzYMRjCqWFnmsDniA
	3IVXuBxrQHAcbD24ZLghIIUsxsoUObX+oGcQIdIFHbnStjnFmD5LwBLvRWKH4awc
	0SazFktPRU0e2kqi5TXYS6HCWepDSPieksuOgcKYNrjrTjwAVd90PXpuTl/z2zjG
	O0ZuQ11S314lz2uHa1/G32punFNlYcWftjK1zkXYRUHCyN2u2rE5wvKHVpO2pb2Z
	KaKNaA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e694n07uu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 20:08:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so107416a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778875705; x=1779480505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZITHqhZFxZjfKPaS9OhfJTadzsMGDsCFdEuZ6sFvCs=;
        b=jFYtB/Pm7jtVNa3wMB2XuC1mObn/XjR+QeUVAeVf4qC6ZeHua/s6amFWJj8z46J/IY
         B96+NzkfsClLO+8wsKoBxHHIzUryWC6Bl7k5HS6WCDPYJFMU4H1S5+DEIvb7yWKbyzVh
         LeBoLbQK0WY7n3MtpM4Zks9TNpaSMsuiBQnXWLHRScG3eU8Mj0hhjLq55OupRaGQaaMF
         Z0jZpYjlXyoLpCYk0rnsZoJAjJJDjbxddn8Q1ura4bvLXANNxY27t04t7l38Loole3Gp
         l7VdKSvnSFbLKxmVw52lNwBGcXrfuWUTtwHq+7HG1MXlEkT8LiVLPlQ3qYMR4lWSJZgi
         HAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875705; x=1779480505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ZITHqhZFxZjfKPaS9OhfJTadzsMGDsCFdEuZ6sFvCs=;
        b=WZlHngomENo0Ib07zmdCmI1tkxAhLY7LCQvByUOXDTsd+1oZ2pPYku3HzxIjxGu5qO
         CnlGWHC5ubI6VU0iXDMxkpecnzjQXZ8Gexmiio43rlnaF+S0SZOcqrUDTFGMgjaewDiC
         7rNuNLuIJAuMCV8qC6fqq/F1aQe/swT9xFKxMdW36zHUKWhougHRp7/IBydDELSqV5lp
         c3cdhh9jeLfmpE60lGiAerz8E0cyfSrP0ue3LNQTGVmrYlPLAi+yhsyojQQMH0pkWEN3
         YwIlGfddQ1CVE/AMQPJf/Fw39yADFIDMmQXFE5ZYp7OzlnHXxqvT2V3fGGoOz5g7HFt0
         cGNA==
X-Gm-Message-State: AOJu0YzC3bSAdvwn36s/Un8SrWwqh2RYN2TIPjmBeQEqyNi40/U1tMEE
	hto8nHb6IdDA4s9vtUyoVwsqxoD03W5IVYEPWIlD2+rx3/GHpambV4TB1cEwZelXABIDAfMsFqS
	Tevg9Yv9O8UYAsfGUU0A5q0qkQHhi67Cp9naOuoAvlLX+2FdmMuM/vblbZqu0zPewS6jt
X-Gm-Gg: Acq92OGvw35QpYUZp+01EdKcWRVEt+ADTEM5Gcg4KlYYbljDMJBH+ZwMk3YRv/g/ydc
	ev1CpLpO14i2QJPC5tu2Q9/0AfbmUwge7usDrBcfrisAL7jz/9ioLB2Cm/0/RvkSXCkkvUFPnF/
	TCYcartQPlRAucscvPTgrXbJ5Kep8iNKATyGekot3/LcktYAsJkQidCC8Ikn37Vz+E3SggrD3C8
	ZhcmOZd7/bdgwioLH1ninD18TblNMySPSB7q2YXSTBIQeCVQGu/hBjK+XEHvbqvAHslAvifquBD
	fbKzOE2AbT1B8ucGolfXS7QXol2qYxlkCdA0owPfAm7nX6tBzwlqK0B8adBizf1KzcYRBQ9NpY8
	FD967pzKDPuE0JR1NW14na5E4onY6LyYMzc+4m35W9E2qpg==
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr5359112a91.23.1778875705370;
        Fri, 15 May 2026 13:08:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr5359078a91.23.1778875704877;
        Fri, 15 May 2026 13:08:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a820fsm3518309a91.10.2026.05.15.13.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 13:08:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 16 May 2026 01:37:51 +0530
Subject: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875686; l=2751;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=31IdYVd1Gff0fxdHBLohNr7vJBxGvvWroZqIO5O9rUU=;
 b=AJnEXF/U995HyUYgMJS19nV4lnFMVTz9ihR5V6NcllhBeZgoZfu+zPLWzUg24n8QNsuMFzuuU
 41x2G6QUkGwBcEbCHWBrlYP2bxd+t9pwwdPfRosK02g9OS9ITnwquWp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Ba3oFLt2 c=1 sm=1 tr=0 ts=6a077d3a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IqWTuNIaVRhLIjk9fdwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDIwMyBTYWx0ZWRfX58NOQziwTDVS
 A5Kc40nvPreQgM4mdUr6NFXsF9KlzJrrtTyM+nmnZTDn9K33eL0sIZ5bxYIx3IHKDLKhQVli/Vg
 U+jOVo/Z7pOqO5tTDzmncL+HVNToqdY10MKE1Pr3amyoRwCS7VUMp+WlqZz5cYpt1RfHNP+O8+K
 PvdaEwr8pxs/h86gAaFOWSy038SM2QkdTP6AgEHGF6Kj/r03gBHFM3gZqPCG+e0/NL5FZbIpJZA
 5RXuW5EkLq+h+as4Z7lJPfgpBzumJzGdX8Z/eB30HrlJsqvUhinFYT9Zrvnm+7wE4qjii7fBrBP
 RgPSK6QpJer3AGtGPwaz0J+8HolJ7DMA2KRex0HcFsCl+KXlaOXGv4sF4U1HeuzR3H28lTArB80
 H3DeZdHrY555sOXNbz01D06YFIt178Hc33v3+0hY/p/WbMHoxPIHsFNCcZAkcoEBmNDZE5laemq
 KfnRpdZ81Jl0OHMuEKQ==
X-Proofpoint-ORIG-GUID: 1R2AnkqWTePD68l8YZ_tNvpO4bAx6No_
X-Proofpoint-GUID: 1R2AnkqWTePD68l8YZ_tNvpO4bAx6No_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_05,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150203
X-Rspamd-Queue-Id: B19B05574B0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
enable CLX feature support on Adreno X2-85 GPU present in the Glymur
chipset.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 86 +++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index c503912a61c7..9ad13eb173de 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1799,6 +1799,90 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 };
 DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
 
+static const struct a6xx_hfi_clx_table_v2_cmd x285_clx_tbl = {
+	.version = (2 << 16) | 1,
+	.domain = {
+		/* GX DOMAIN */
+		{
+			.data = CLX_DATA(60, 11, 0, 1),
+			.clxt = 0,
+			.clxh = 0,
+			.urg_mode = 1,
+			.lkg_en = 0,
+			.curr_budget = 100,
+		},
+		/* MXG DOMAIN */
+		{
+			.data = CLX_DATA(60, 3, 1, 1),
+			.clxt = 0,
+			.clxh = 0,
+			.urg_mode = 1,
+			.lkg_en = 0,
+			.curr_budget = 100,
+		},
+	},
+};
+
+struct a6xx_hfi_limits_tbl x285_limits_tbl[] = {
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
+			.curr_limit = 18000,
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
+			.sid = 18,
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
+			.sid = 6,
+			.mit_time = 3,
+			.curr_limit = 66000,
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
+			.sid = 6,
+			.mit_time = 3,
+			.curr_limit = 18000,
+		},
+	},
+};
+DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -2227,6 +2311,8 @@ static const struct adreno_info a8xx_gpus[] = {
 				},
 				{ /* sentinel */ },
 			},
+			.clx_tbl = &x285_clx_tbl,
+			.limits_tbl = &x285_limits,
 		},
 		.speedbins = ADRENO_SPEEDBINS(
 			{ 0,   0 },

-- 
2.51.0


