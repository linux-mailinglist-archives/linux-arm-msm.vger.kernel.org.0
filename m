Return-Path: <linux-arm-msm+bounces-108801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDuiIBnNDWrh3QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48509590697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70F0D3043F56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B413F54D3;
	Wed, 20 May 2026 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXmUISEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCXk+LPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67243F54B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288714; cv=none; b=VAg7DhIoNz483M5lMCrefovE7ESVbRti5py60Udw6OV7HXO78Q5MiiC0xhH90Ko5endCZ/baxNGJLFdmXB5Em9+Y8fZBJruMpC3W+OEIQ7PvOHQqRMjS+6OfgPPnLUUFj5MVYIsXHh+5X7/o5eDwv7W8SYcbqDYAHk71sDo2nOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288714; c=relaxed/simple;
	bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EX0SlG41t/gV1ttzyB5Kxj5hxZJauctKE3D/HMyqHHsrzX8RHu8OSe3EkbCwmQpC/iJebKj5a1B7FWVsJd7tQPjPFJs0eddn7ipWFMETr5kr60sDTy5T0Bs88IawOYlnFDpRMXfrqqu4nWXqi/g64Hrgwnq45OO3GHiC8RJd4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXmUISEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCXk+LPO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2KjW826519
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=pXmUISEdXO3OhvLw
	Y5hMss7UgyhFvve4cwXHa4F2jlhBJfB+3LqRC82Jlqi0+loEHGPGqvFPjExMhKqk
	1UAjIEVm0aPwgqFNlbVUBu9yTa7Nwnq5jptpK6Ba69hvwcp0p8ELnL6UZZ75IZrT
	M5ayS9l7KHEnmyE6sMaxXkO9XxK6uHO7E35U3TQGAGoKsF78GdkiZOJjVzDQQ1Gf
	jkoZotsTXjbsdCsS4IjG57Hmioogq9BPFUzAyUkUHsL0UarEaDS00DnBlzk8RQXG
	i/TZ4opJ/BBt0AkkwdntUcJKEGdvwrT4HVRxz94EusMwlGTp1UYFmmsku+7xiElm
	0q5N4Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-57525c1ed46so3942937e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288711; x=1779893511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=SCXk+LPORF1iauEUbnN0X4Ia6a8dOdEyeVlRaSzp7IlYw4LmnVNlK5uN0y0qqQndqA
         zCRscPhYbtK0iJ++xXAiakdJDwTuvmEsvTVAXQy2ae62IlqgIE6ykuext+Eut/OIv4ni
         4D4x3qlVDzVY26ZHKMzMtCd1NqincY1Qi7+aa7t/IZdoOGdeJwM4hso5cK+ACi5pv4CI
         dCcH48BGOP7rKVfAuQR4T1tW2gJBmUF5iC25wApjB5siFGM9inwRFLX8mub0Z6XCD8F2
         C6DWyBEZdUkjNingZtAyIHogyTyZF/Pn/27OCWBdXtsLYW48YH32uR7XMd4+EWUrvJ2Q
         LRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288711; x=1779893511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=jo3xZrLmvDPq50N1yjZgI6iJAvLNhOzVHGIJ5f77GVWKk0P0Zv7BfNuCd+PcaGcOPQ
         Ayi2hXUZKujBlB5cDofwSuIsxeRXm+Cr4LgGZB144lhIVgYStkmIe14e+xxcryvfGSDu
         k+A+JIyuKv8tU1AELw1AF30Uw/dn7D7E6nYNATxPALm6GwYkTFK1Ps95eawRYrtA+RTB
         7UV9OHKYwcPir6nVKQqrUkzZIsc1SAWHK3Vbz3jreepald5PNC3wudtnV1kQcXDgT3xa
         /6XmxnuoJksrE4htvCKA7Z6br/OcnKCmGcbyh7kjDTzvCOpKXm+CLnUn3/Z0cF1a3WJw
         tobQ==
X-Gm-Message-State: AOJu0Ywgm/+VukBOmuh9ahgPyTL5zM69LG0QPPfWLGOkvSZfb0YMbT3B
	yLmnIe4qUaJeKOYwyDMiRoGChbRDgrc/onRU2xeP6jv/jakyj+p+pBeSpf44yPnaKbjw3rythkO
	svaVG2ZUGqzJ7qeS6v3n5TuynoX38LtrZO4bSm88R9J5vKAwMek4Fk2x64K9C6Sr1G2uh
X-Gm-Gg: Acq92OF/sKNBt5QSGFlQcaA3WO0apXTGL4WXDzm9/b5fi0EVS67S0s1zbFOVZtbMo6L
	EjaMRSnI+HyqCmX/nJPmVHDIx9KJZ6CLkAjutpZmDQkynY7aEBJenPQfIXSvgSnTopsiGAzdtvo
	q6KohS4cesEgfwleFKyIP3sKc01t/saIMikXFZKIeyeDzq/2jyUC4j4GMkF7umoNgSnwViLCBlT
	NWNOiBRndTH6OQWZV+RvphPv5VFwl8qXw5fmMZ70WflId2zQ9u8Xoi6TODcWsxQPT+hpdhyF1of
	vzDD/HU4fbIfjCemMqBdv0DK/5jBWES4m7nxAUYrb/z2Kk2KOZd3s5n7jFWaWuM2dLOlVjr6Oaf
	Yz5y4KUmylVxEN0j4xohV0E9103f+1YVQe58CFsN8K3QW6LghwYBVxBQYGmC5Ns5cFMakZiEJR3
	AvLbhmvL5c1y0efFZpFx18Ojn8KOVCcVydNr3JFUNPmATmUw==
X-Received: by 2002:a05:6122:887:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-5760be3bf61mr15069045e0c.2.1779288705881;
        Wed, 20 May 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:6122:887:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-5760be3bf61mr15068786e0c.2.1779288704472;
        Wed, 20 May 2026 07:51:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:20 +0300
Subject: [PATCH v5 13/28] drm/msm/dpu: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-13-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbvqfQKmaPnD4tcPvQi/baX73UhO9vQWK+86Wc7b6lcC
 b39c+u6TkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMpPwL+//62KwDRyZ7MDC9
 elu1cm20Y9Ck9SXx1xaZOd5WX7686XvmN+cG5a811sEqLR5b7FUKXjee4Jactidcj+9oREy7+Y6
 voX/UHGpkVUSnqW6MVkpY2/hG1WiRGaOKusUE2f76zby8cjdC/vrxqDJquHOo74q6UWw0R+tIjG
 X/k3WM5t32mYfMsqR0Qq+eULBMeGl6zdVUmON5/hILVt0PM8/avYho91QJyVmz+oVLf8zfLas/P
 +sX898ueuzWF1m5BZp169J7L0185zDlzYE/C16vi5ujMeP0JyfeuC9+AnonLgk8W9cc5LNjR4+Q
 yKLGpXvybzGcqZ9cUyvuldHNtOBaSZluQMYKxu7c2tdlAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BSBRBzut2EmIN9YpNrrBc6OhQT-Sgbnq
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca88 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX+g4fLD2OBnbI
 tYAmEdZiqPvRB+RI4N1rN513PLoQHiBEVmnpmHCecU668P/xpdwQB5gznswcSYZh/YVTrqqdb+Z
 h9DFS3W5zO8rvhPzxDQAsl9UVpGWj4I8x1Tn0QOX4yPIJ20B6jnb/rOMP6cMn33FRSNaNW5KoIJ
 TkC2w4UniZEftwLr3I9NejeE7Tmi0ABsAxOkeGmaNef8XTH/yS/R2vh8nd+BW7GPaX+9Ak1F3C1
 KvEJlFVBoX76oR+P3sfHZA/Er2Iql3KBES9yZfty9LXfZIS/8J5Qz9ZdZFmQ95jgYSyONkx8NvF
 9OQvEtkHN2q9uodGamoRyzwiuYNu8wI4tVVo6pvHaDwMcwOdO3XLZW5bemm7JyUpzd9Y6H78Rc4
 6O3P4sLNeR91CRkkV8TeIhq7xwzziMSmdaJB/mv9aGaEakE0OQ4/PC9Zd/JLfkdgP+4StQObW+x
 i69neiIonCdZQitFyUA==
X-Proofpoint-ORIG-GUID: BSBRBzut2EmIN9YpNrrBc6OhQT-Sgbnq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48509590697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d3da70009234..6089a58074ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -318,13 +318,14 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+			ctrl_val = fast_clear |
+				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
 		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {

-- 
2.47.3


