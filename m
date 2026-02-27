Return-Path: <linux-arm-msm+bounces-94513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO26EIHkoWmUwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:37:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B32311BC16B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABAE530AF3E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0313399029;
	Fri, 27 Feb 2026 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dmjd9Nrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ley8v2Kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16570399009
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217425; cv=none; b=nQRdi2onabjA8BN1YopFE9shMHjV/Fwu1iak0JfC80f8CC6y2X65+65iddKTDPtuJ0D/pcOJcmaOIWsz4udXPgQydD7fMufE/sufYxqXhfpbCDxPfezupcSDJgVOctb8hbf4WzB8M2nrU3pMxYHlp/iPASKKNRcwyFxJeOBBMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217425; c=relaxed/simple;
	bh=VurcZtQ6s0/YP/v7Sm5xJziSsCDBKjb5TpLb/Bs7EUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoISn9/O8b7Thmw2/kJF4i4eXt97jc6UaTRCPRFF4b5O0358QuGtD4uSLzTLt/PypnBY8xcYbZUCTHR81u0zgtM1ANrf80LL+/+HZEEB+1Hgjpst9oWI/tWMTN+uXzeT1+PW6quDbOQqa1o276NRSiHqAhsWap845WFcLr8qFwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dmjd9Nrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ley8v2Kd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0Mbf065418
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=; b=Dmjd9NrmHF4Su2Ph
	v/3T3MfHPFOg0z7JIMI0qbgIaLTuwcgQ1kQE0T0UwK32lQBUgDe6m4/edXT8DDuE
	By4zbyV4TI91t5PfqfkO5ujcppSvxbxChTiysgubFUBbR+Rw4Fj/Sk4oMVEiYp7w
	2p3YwJRr5/KbYfuaVKHTxosjjThCcF1B2ullHJPh/2n7TphX1jTWF1oYlEC4SUW2
	mK7fiqPmF1Avztk/IlRU24x6Ob+WUU7jY1MJ/Vw6y/hAtbWzWYxug1SpyxV4IhqH
	PRJgrQPUi8pS7EePXmqXMATTQrbvFi1gwPL9fNKFPCwiaAF41kwuJP4VNJBCJPjQ
	bHSO8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cka2xhd5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so1661393685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217420; x=1772822220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=;
        b=Ley8v2Kd+LaIl32IupWV6gNPH/i8ap1nkQQkMilaVu+mXglkwkKBsmlwi+d3UfrZOM
         iXTdH7rS/evYI8nDhUM4vISZfNQp+3/4AA3OowYrfCchnD3MmUK3p1TBqNgx64x1L8qz
         h8jFrO199925Xmq1VNyrx35zPsyViQymGzXDUIAGvzWK0Yt7rtMWZNGSW268OwWcULQ+
         CWUmjeuTISRJkfnTxk/D3FIDZ6up+iHcsvac2f7iuw6xDd8iRlp6qMaoBtvOqMay2jlV
         I66+uc8J0i0V1aLdw4z0MdIyatm2Xwq+tCyDkI6qa1G1zRDR7JGgHccjAMkDNNfAZT69
         SObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217420; x=1772822220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bC4OwYK0WXchZ0n/YT8oYdnIO5WKpNPqkJXXEobBytw=;
        b=OTGZYhrxTt3SpnMC5bnBWJerWParCURTga8Z52gubmVQjoqulht5iUtJ0PPAGJjf+U
         qmwNkBZOuV07C62FW+nFYRp3VFD/zPT3+Buw9QQEZTFcPcYJCeOWfYklg09PhG7ksvny
         abyFVqCrRz+xc1D95E2GnAHs2DP4eTwaZjOWp1qjPzagelm3DsMuBtQlp3hpoekvlYOU
         rggedoSWN8KcHPLNGzpeVV8sdXS2mkHjarlgYE8shD1ybxo9ZR+pvecofqKzySsYgXuK
         GVK0HWT7IcQozJuCpvtmD4H6PFCtEfP/BBO8zQ4bCMIdeDzf+kYYdHVjxKl7jdeFRjbU
         T4kQ==
X-Gm-Message-State: AOJu0YyoyyxJ/34jgRVt0jXYiKqIppLwoxhQXB8DzBlosC/igk0+eBDQ
	ma6881+4Y+MHTL6quCeL5grtYe+/t6hWsjjNOwsrHfLcOrFBqdxCC9he5nWnq9jPQdF7v+dxodI
	zBpZTWhSU0iUYM8PDAd03VbTCR2CFrwqlS69UB2Qz5BgKSOdyquA8zV/gjvHFWiLY3toA
X-Gm-Gg: ATEYQzwg1O9b1JhmXBvlFrFwoN2D3pZdk78DiqYCN6KELDNjb6RvKY/ZyKUoGD68gKl
	8rmjtN2Z72ZbpnfsTJmXY2e9g5tMr1c7dymTc9bgVnDtXZ2TWV6whQElCRM0hCJGk10apOwIFHI
	aaUVnEZNcaYTHKnRFDqg0Pv7qM7xqxkwbK9/so+mi7jJe+XwvnVlRH8zlf0hODqvFGICCuRB2sM
	W7uZmbsCGYhHH4TezXjO52mL+kgxS4S1Gn4zv4zl2Igdy4d7yF8TfqrJL2n3ctpPLdqi4u26A4r
	F0JLgUuqiyLpF3WamUZKAJ6aN51WHGfOtUnkG4jGT3+b7CMMIDSDnrjxxzYfJPQmvCDUg7PiWf2
	ZeVqnQCNFLA1ojO6SQVL0G5Lwx6d3Aji8Dhy56DohbpT6IjV0uBbA5XkPhTt76DS3CiUO8Axbt4
	AhU+1Czon3bYSlMY81Iz7XYtj0ZSkCAhXRc2U=
X-Received: by 2002:a05:620a:4626:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8cbc8e3750cmr509208785a.75.1772217420302;
        Fri, 27 Feb 2026 10:37:00 -0800 (PST)
X-Received: by 2002:a05:620a:4626:b0:8b2:e1d7:ca6a with SMTP id af79cd13be357-8cbc8e3750cmr509204385a.75.1772217419726;
        Fri, 27 Feb 2026 10:36:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:36:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:45 +0200
Subject: [PATCH 6/7] drm/msm/dpu: drop VBIF index from the VBIF params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-6-2b97d0438182@oss.qualcomm.com>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VurcZtQ6s0/YP/v7Sm5xJziSsCDBKjb5TpLb/Bs7EUQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bCJ3ZvdkmemeFRdvPf09c/u144RWwvKTyVoy7urrxAl
 bU1R/NAJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsngd+/8MJo7CvJ873Xad
 d/7mUZ+vxrCSM+OkQpHv9fJpnMtvVc0Pbq+909l6/sSZ6DmLXWJUmD/WTko8c439sg9Xacr1y/t
 CTF4EJR516VStiL1jzdm69pKjl2VqqSr/iwl1n8r0wuZZP5PM0fkQKrTsiXP0rNsFG6deuqVvPX
 G5pHNSWJsO71q1VLbZ6+bc1mu+xfywL5Rv6X2GDL2kql4xQ78FKhslLu5VvrN2dh6D+wwRJifJ3
 g1vu2RWeZ8VzWx6/M+udtm6ww2cQs+/ak8Wdn1++cw9fn22BOfmP+VvXhSuDfuSG9NY1u0sXDnZ
 7HASQ0PZI4vIuKyC3d9WnojqE/9XmnK8nee8nP9Fkd7bAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=BOC+bVQG c=1 sm=1 tr=0 ts=69a1e44c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kWJvl8zPePrAsXnfLXgA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: oUXmnIerJ-JeFvzNqaoiqhiQHXQIHyhj
X-Proofpoint-ORIG-GUID: oUXmnIerJ-JeFvzNqaoiqhiQHXQIHyhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfX/ZL4fy2/kFLl
 snZOhfYfS+Lo2r0+4Y/cPcT3IaojX0fuoYt2SVPhILf+S1ydJA0G+kZ+IO3hBZItMfu8uVV0W8m
 pvpcCaQsm8LE9b4/a+ILF6ug/I7Z10RoiPRHpQpCF6s1/G9kIvG+lOXA/QutmlMTzFoZxSPY16l
 0qz6yebMEz+n0noajJZHbIfrNHM+eyIklFP7JC/NMI54GSTenCGOHj6sjXEvyOZYyshzgcsOFJP
 Qkt12o19+iVe08Q2GXh+ZGR3k8Aqpma1Utw3WnveWjx8DtsSjjIS3p3n2UH03wbEk2DWRNWYeYr
 x9eFD+zMWbwH62/aDsgQLhVDwSg4v/IeS4gWtBIDZy64cYy7SIry/Dp+IHiqGgz6YVEC7KwDcHa
 sPqpGkzJyH5tC9UxQFRTFeSQKR1niUl34PM3nz1jmthwu6au6hIwoxGvimNT0F42fOlVzqAbFBQ
 zcIOKlNWhd290+MMYkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94513-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B32311BC16B
X-Rspamd-Action: no action

Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
parameter structures.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c           |  5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h           | 19 +++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c            | 11 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h            |  4 ----
 5 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 73021aaa8d3f..22433bfbea1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -71,7 +71,6 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.is_wfd = !dpu_encoder_helper_get_cwb_mask(phys_enc);
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	/* XXX: WB on MSM8996 should use VBIF_NRT */
-	ot_params.vbif_idx = VBIF_RT;
 	ot_params.rd = false;
 
 	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
@@ -110,14 +109,12 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	/* XXX: WB on MSM8996 should use VBIF_NRT */
-	qos_params.vbif_idx = VBIF_RT;
 	qos_params.xin_id = hw_wb->caps->xin_id;
 	qos_params.num = hw_wb->idx - WB_0;
 	qos_params.is_rt = dpu_encoder_helper_get_cwb_mask(phys_enc);
 
-	DPU_DEBUG("[qos_remap] wb:%d vbif:%d xin:%d is_rt:%d\n",
+	DPU_DEBUG("[qos_remap] wb:%d xin:%d is_rt:%d\n",
 			qos_params.num,
-			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
 	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 547d084f2944..6d23e10b493b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -374,7 +374,6 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = frame_rate;
-	ot_params.vbif_idx = VBIF_RT;
 	ot_params.rd = true;
 
 	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
@@ -402,14 +401,12 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	bool forced_on = false;
 
 	memset(&qos_params, 0, sizeof(qos_params));
-	qos_params.vbif_idx = VBIF_RT;
 	qos_params.xin_id = pipe->sspp->cap->xin_id;
 	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
-	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pipe:%d xin:%d rt:%d\n",
 			qos_params.num,
-			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
 	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index cb24ad2a6d8d..805d117493da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -72,23 +72,20 @@ TRACE_EVENT(dpu_perf_set_danger_luts,
 );
 
 TRACE_EVENT(dpu_perf_set_ot,
-	TP_PROTO(u32 pnum, u32 xin_id, u32 rd_lim, u32 vbif_idx),
-	TP_ARGS(pnum, xin_id, rd_lim, vbif_idx),
+	TP_PROTO(u32 pnum, u32 xin_id, u32 rd_lim),
+	TP_ARGS(pnum, xin_id, rd_lim),
 	TP_STRUCT__entry(
 			__field(u32, pnum)
 			__field(u32, xin_id)
 			__field(u32, rd_lim)
-			__field(u32, vbif_idx)
 	),
 	TP_fast_assign(
 			__entry->pnum = pnum;
 			__entry->xin_id = xin_id;
 			__entry->rd_lim = rd_lim;
-			__entry->vbif_idx = vbif_idx;
 	),
-	TP_printk("pnum:%d xin_id:%d ot:%d vbif:%d",
-			__entry->pnum, __entry->xin_id, __entry->rd_lim,
-			__entry->vbif_idx)
+	TP_printk("pnum:%d xin_id:%d ot:%d",
+			__entry->pnum, __entry->xin_id, __entry->rd_lim)
 )
 
 TRACE_EVENT(dpu_cmd_release_bw,
@@ -861,17 +858,15 @@ TRACE_EVENT(dpu_rm_reserve_lms,
 );
 
 TRACE_EVENT(dpu_vbif_wait_xin_halt_fail,
-	TP_PROTO(enum dpu_vbif index, u32 xin_id),
-	TP_ARGS(index, xin_id),
+	TP_PROTO(u32 xin_id),
+	TP_ARGS(xin_id),
 	TP_STRUCT__entry(
-		__field(	enum dpu_vbif,	index	)
 		__field(	u32,		xin_id	)
 	),
 	TP_fast_assign(
-		__entry->index = index;
 		__entry->xin_id = xin_id;
 	),
-	TP_printk("index:%d xin_id:%u", __entry->index, __entry->xin_id)
+	TP_printk("xin_id:%u", __entry->xin_id)
 );
 
 TRACE_EVENT(dpu_pp_connect_ext_te,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index a4c5ca13179b..d33231f1d50b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -180,8 +180,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	if (ot_lim == 0)
 		return;
 
-	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
-		params->vbif_idx);
+	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim);
 
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
@@ -189,7 +188,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 
 	ret = _dpu_vbif_wait_for_xin_halt(vbif, params->xin_id);
 	if (ret)
-		trace_dpu_vbif_wait_xin_halt_fail(vbif->idx, params->xin_id);
+		trace_dpu_vbif_wait_xin_halt_fail(params->xin_id);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
 }
@@ -214,7 +213,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	vbif = dpu_kms->hw_vbif;
 
 	if (!vbif || !vbif->cap) {
-		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
+		DPU_ERROR("invalid vbif\n");
 		return;
 	}
 
@@ -232,8 +231,8 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
-		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
-				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
+		DRM_DEBUG_ATOMIC("VBIF xin:%d lvl:%d/%d\n",
+				params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
index 62e47ae1e3ee..f47a89cb34ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
@@ -15,24 +15,20 @@ struct dpu_vbif_set_ot_params {
 	u32 frame_rate;
 	bool rd;
 	bool is_wfd;
-	u32 vbif_idx;
 };
 
 struct dpu_vbif_set_memtype_params {
 	u32 xin_id;
-	u32 vbif_idx;
 	bool is_cacheable;
 };
 
 /**
  * struct dpu_vbif_set_qos_params - QoS remapper parameter
- * @vbif_idx: vbif identifier
  * @xin_id: client interface identifier
  * @num: pipe identifier (debug only)
  * @is_rt: true if pipe is used in real-time use case
  */
 struct dpu_vbif_set_qos_params {
-	u32 vbif_idx;
 	u32 xin_id;
 	u32 num;
 	bool is_rt;

-- 
2.47.3


