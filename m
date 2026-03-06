Return-Path: <linux-arm-msm+bounces-95889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KcwBhoGq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEE32257B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF8AA315261F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371A1426D1B;
	Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cW81b1BY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="InMPEqcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0EF421A07
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815662; cv=none; b=mP1tbxb8JDTsWLcehm7nLXR+f/EwH+bvx2dKXkozrrBP/l5cidb6H0Q4BKU3InwD1MW9ZvodZR75vvqY4pq0dVTy/mcfDpVHBy7qUzi9gprAbjT0UJ/s5AwHh+xO1reli8XhAdAEItSrFrGMy9iKZsFQH0NKym8L8PW9r47i91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815662; c=relaxed/simple;
	bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKhnNR2nuc+9ZhlrNuxQX8TTFq4zdASPYDRQp1Aif5A/jtEG7aq6yRCk1xydVA5THdN33H385KPcuEleSUo3e1MQzyxyPTt+O8WsR3DU/oOT8uKl+pNyuH9GQaIrK1a4R157nff1/8p2/dq4iJIH9vwv+L0HW1zK9tvw9CbUUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cW81b1BY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InMPEqcI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FqwFj082499
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=; b=cW81b1BYiUy2ELXh
	BzCE03Hei4NK6Qkx+HQeA9DKgLOTIUxtVkBxK7kZfJta+IAfpVXG8JGltlc2wtrr
	LRdLoM0Xqq5Xl+89uqD3tOQuB1usfHWpVkfb6Npam0mkeJhkD2mJRmvoQab5jn0X
	VHlf0mYp62MCWcynvhLtQ/iYv8AHaeaaYBDBzIXWhvxS/DMj6YTtvCA4HsGuy8VH
	9ENQIckaf1N5O0169V+6olSGSlT0DiJOIYLmwjqGmlSk4PvJWh7YgAj+jQ3ioQX0
	XYeBkrhQ69FNtay535XQNpTqOU+gLBHwt8DnhEa02eRkZAb79/7mRzyfTzdT50MQ
	GD0GSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98hc0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso1228059585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815653; x=1773420453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=InMPEqcI1qnsAxcpdv+zzmes3wvlAoJVNcQRA1vsD3exVfu/whEhYpO4ZNhnzMKGKn
         Km507mHT9pC2Vzn9g87LMnAVVOvq3/a2HX1dK8y699QW+6mxFtpCkrBTkkiNlVGoSwsy
         JJKNxgDoBpJWnXXX+iwUiziADgf+ds86uTQB5yl0qOza2SJ3iMEiodqKAuMgi0wu5mK+
         P+wDh5b8zpOQoAuxk6OnCHyLK9m5oO+3mUr7YWBCjCgv1LFspe9TYm/rGzPo0U29BFlu
         nv0LYas//OhCjCWNi9X0uipnQBk/jc1lj1fSv9y1NWMIR6RfAjfS9A3GkgCCAm2aFNgh
         2W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815653; x=1773420453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=bWSXUPz9JP1q7c3aHGkSvbkr0QpD8hieW4wwGY9UDcaAP6PKTAbkva9g7oQIYLm+Ek
         Gh5aEcG0q0T2VAVn/NnBYbt1Wd1yQj4mWXhdJ5Z1VBvc3/m7JxfRYBto2Y9slzrepRuy
         CJjp6/hgiYYojH9Sm9aw/oh+X03DqFSsPrNALyWuWy9LmDDY9D8CZarGOf+QX+eL2rTl
         M9i2dqGROV69UOaAn/LgKfSSOlmg+hfHTRP1dUOmutyMUbU8AlqII3vBjqu0gB89oU58
         9DTprfEcz/T9vvdSTNuJLxL0MCn+CRzRxCbMgZY5DgdCfhtHArkGM+s4h04/wTLaVEN0
         O4iQ==
X-Gm-Message-State: AOJu0YykVvTpLX4r/1AEzOVwTXuXg72xc6GOLXCz+ZLvFDbEZVHZxV/n
	aEykIF1/7Hxo8M9gJGjnY1aj4AQK0W7o7kx6EaCmj5E8znwtqzEo0GkZc6QIgBsEQ8EBSqOH6RB
	+hMfWXpdQy1hyECVGIzCh1uOCkB3qod/ownDfV+vJK69f1IKnSH2wRsCTgzSfFB63Hxid
X-Gm-Gg: ATEYQzxef3xn8n4KE4MGCrM+E6J86ejgxEpJ+60cgmTL14tnilngaf1SSsKuvlRWq5z
	70S05KZ4Z/rB9naZRQEYiBlSo3KQzx8ZPOLz/lJ6fnqNqNdGP9KRIL00juONMy+JlP9TFsQ+Dgc
	XkNaLiBxzS/yfyZuLnOLXYy7Zq+WSJvzdyMkvED2taa6f9YiW6AYn9cLHlASWw4aWqNnvwpDoTR
	ev49CgdfwEwTqgGGOTDjSRQCWeMaaC0Xk2zE462Whqs7UXag/oWPBQXLEUSpHFZUrn8wALN1bwY
	Lm7b7iyI842xrkAdsrhavvPHO2S3n3Z+iyB/YSXaf/j1oaczmg1BEFj0IeYCD7UrmSYd1J3iTei
	5fL/36Gc6g6TU0ycA6x+jDliQRurvBXMov0W/tV1HjqMJzoq+VnSVvZk3nhG3SOljiJq6aVUYjt
	SIoIsEF9X/i7z8EtdDPpag19k1HoKn6qIvGJM=
X-Received: by 2002:a05:620a:4607:b0:8b1:1585:225d with SMTP id af79cd13be357-8cd6d4a6d76mr316673085a.82.1772815653077;
        Fri, 06 Mar 2026 08:47:33 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:8b1:1585:225d with SMTP id af79cd13be357-8cd6d4a6d76mr316667885a.82.1772815652532;
        Fri, 06 Mar 2026 08:47:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:17 +0200
Subject: [PATCH 11/24] drm/msm/adreno: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-11-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUO+cW8IttvRxZ7kZaN6gVeCBanRcrfHvEmx
 kmoALrut5GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDgAKCRCLPIo+Aiko
 1YJ4B/9qW5rJ1SwBReASY5/KyLYyVFXtnjWwxBXVf4i7cC5e28xYc9gm8NT7GoRPB20/E0y2ou6
 0GNyzRYWdMTmAECPm6+7kmuGlYLCc5pGOZCdyhIFOKESeIfanckIhENp8b+6Tq/yZivgUKeVs40
 XTV7DyLtlZ7TRwDGcnSwwwtQtF1hBVIF6+mxyJdVnpor3bs6u7FY949gj6rzXaKozsCRfcbaPWf
 n6uccbmnA3zHYVmh0W/CDobRy2tS7xp8HGf4NdA4ewB8t7dM6q/tkP3cSuqulcoU5fSRIszdYaJ
 HctLR77k44CBc/zt3DPSj6H+8Oz22e73q0GvlOKyDpLXo1WK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9sZtR751KMKIDgq_RwQQhm-kP3IH9lzd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX+myT68cjlWCT
 4q3q9zb/uDDBYiIvanM1W985nSFe7r84Bp5e+L8qA73W3M03u+g81ot4ILFgM1Qt2W/WMygnCL3
 aygtGSKFKDr5lbUx0tgoe+3fUzq/yUVsDPzTGpamtHO6CIlgjrlWJjUrmRCqs6+tKeleN9P1X35
 0n8ZCZoQ1Z2ZMrktED8Wtzuh1gLjX6s/jE/zD7slkdyex78j5pfnIhrUU9ETaEcwW0XpTXAsnXB
 1DgKErEMCj5FHxoChsC3yIxgxF7mM9ny9ETb558lj695hx8WD/+K7MMsiGrpE6Ys8vh15evfoEG
 UhngaKON77fViNMcv1kUWXVZ21XNPNU5gXARlEa98hiAnZgGJOsyxW3zDI9Bxe2EIY+00dXt3Q6
 xHsvg1MYwTfiwHSKXxMo9PbFXMCfVuPTzA95pYjNdwLvF2/P2sHTjyq/9moU859TdFyCaCw7crs
 +MVDVCIzzKAb7LlNkpA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab0526 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=0JjmiBfSQHijSEXDZO0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9sZtR751KMKIDgq_RwQQhm-kP3IH9lzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: ABEE32257B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.921];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56a820ffa613..7be31de3b525 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -741,7 +741,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6dc1d81fcaeb..680f0b1803a1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
-	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
 	bool rgb565_predicator = false, amsbc = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4814233d8dba..cc21b41cae26 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -432,7 +432,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);

-- 
2.47.3


