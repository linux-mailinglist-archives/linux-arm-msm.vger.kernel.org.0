Return-Path: <linux-arm-msm+bounces-94512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKEdBdjkoWmUwwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:39:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8281BC1AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 19:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9E79318460C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 18:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754FC39E6CB;
	Fri, 27 Feb 2026 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgYKNAC4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YjYyWDuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84787396D2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772217425; cv=none; b=eM0/GpXY2BD+9i04rrwrFOCja0Tg1J+qPWAaWub11H+VYnOHSiXmgJ/+P4mVKFQIYbfvtniewgtXr/PiiHZFJhAR9WUgGmnG0QdmlCM1SkHTBSbeHn4MuYWrXeRbtr0xHyUMCeda/U1aXaIySNRWKGgg2DDeOlVGGirlebLeGls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772217425; c=relaxed/simple;
	bh=dte0nYEc0ewgpu8HO4OB4g6OuUwdq1FY8Aaod4fPrG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAtyTr6cM1fAOVolYx/qgjQDdZPRq1mnxjtOdwH6PjXzn2Gixlc1+pivKh2khUeXu6B4SPeeWP7CFJeb+LNUNDdrhu0zPf0blz3lulF+yMHlVEctsqiG401M0ePn++B9kk7z/H9gi6Rqvf7fdhxL5gB8/04Lerdr4GlmatjXZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgYKNAC4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YjYyWDuO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0J4J151886
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=; b=DgYKNAC4Q9b7GUmK
	lBJXRyNs9TIM9MOq3UV4jSu7EF49ufXQZzjJ24826Q0vCxs4ArhtxSVplw5mmSIy
	1AfOW+dxv1RYDqPB141heq32tJZ031qw0t+10oFXMXk3IQpFZHy+v3R5/KPs8R7R
	OASIIHo09J6+V7RgNTcPIEtdbmNm4eXL/4pfMnEjSRymNAO89zZAs4gwBNmrlFpz
	0tlyfPaGp8v/BwVB/auo4HZdW5LMGFNCDq5L5/ByJ4uNC8d/hLML+TJbghG7IFR/
	AUdCeCpZErvUAgbtuEPZm4dUXsEPT98MwhF2XZyuJAm0W15XQI5hRzu4TLf5K35I
	jL5VDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r4k0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 18:37:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506ab115571so187592401cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772217422; x=1772822222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=;
        b=YjYyWDuON3RtlCeQprRHuOpCxQgcJagsNpbwk/x3D63f8fyH0bLJsRjNB13HmtttVu
         UG6kFjY5pMzQeH12uPT/wKcr14TPzEkBd5e2gMTT2/Vbt+802Le37RljNxKdrxuesY7a
         1qiJFRvaTYWT42kMuebdhPWKuL9g2/RSZyA5UCw/qj3B/pTc4qn+1JTPW5I1Z5n42E7o
         suLAPVXmRvgc1IaIGt1fEEfGId8K5+6GcjuoFqOtxgvZ5aqVRe2owkZo+ZtLJxoE2Jue
         ClcPB7zIqcsNZmtEzhQA0csJOFY34htk7hNLED9T4ky8yfHuyIY3DfOZpmeK3G2Bws/6
         46YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772217422; x=1772822222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n+4gYFk5re0nH67EqAjd5y6zdk0Xk7vxJi2bsbftFBk=;
        b=aWU4c/NSVPKdVgKmOwY+62Q4pjTa92my7WlZ8eb3EqhueJnSILp/7Jf0wFs/Typkad
         7+V71yIKyeOLSZNtBDPG/IPFTCXKj+llCpVc2Idf1DLP6g7mDTIrRd+q8t69AKmEfukC
         /dg3ZpzKxyPhnI1bob/IlTSReeKougd4C0LjufsL0B70U1ltNaH0I4DL+L9VJLDf5l6d
         dkalF5Y69/4WTTHlDhnZ/faI0SPVZTyxEmsWgpl184T77Tsbi3p3G1r0xnEnRZUijkun
         6NjrLdqxydx0yz8VjuL/jo5UhAitrpnIa0EnbLrx/c2w4ajcvnQZRcHeSIzZbAiECtFN
         wggw==
X-Gm-Message-State: AOJu0Yx+Mg01pwYtW4v0NCHYtNUhHDK3IRhostY/FMtDPEDsvu2j3t23
	17lh0tUwrjrZ/Ext098pbYoGNxLcMWWmcbiizHaJZRjhMog5NpU5viv/LF7hTlm8/dDWcm6yANs
	YTkcEMt37fp8JWqFq1nWtKMJHwHo4ipr7jesOF9KRdPLRpgmaqPPnzklD3QkZBAlEI8EZ
X-Gm-Gg: ATEYQzzlp/oKALaw998OhS60aekoPp3+yIKmJsF1MSo+H47Y1W6rRlXUTmVFN37STuu
	+GResPejGSJI59V21JSzfgbEAcPygq0oUNmk2KDbor87A/M1MBzYKtVTJ1ZqGIFsj2VeEP2Nebj
	Ei/kSrzlLZz19v7ysL1G+2wJny3AsAyfJHC7wtCGLrye15FOkGkpWw3jJPVs+aczep8m9f8vonV
	LgFhSFLGJfJJJSIvE7GfTtwPg5oV2a0IjeDf7uVE1E3my7NJ9yprr12zXOSd94pv7x5RGv6o3Sk
	FM6AawucOM2Wiaz7T14Kr4n4PLmiw8aN0gcifepDdZJP+F6bE8e4DTNZ2B+Jh2F1YvLoWUvWqAC
	Yl7DuGAzvRMdiAAw1BEWU/uOsplFwkLPIGQg+supW58rxJuAH4Bk5t0EzkVDJRf+1uB9zw0PjIe
	2a3VIbFsJtTPCq8+2zVCPsmrQt1axOwqZG7PE=
X-Received: by 2002:a05:620a:4608:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8cbc8dfb5afmr473791685a.57.1772217421436;
        Fri, 27 Feb 2026 10:37:01 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8c9:f8e5:9f12 with SMTP id af79cd13be357-8cbc8dfb5afmr473787585a.57.1772217420934;
        Fri, 27 Feb 2026 10:37:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0e6sm117082e87.29.2026.02.27.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:37:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 20:36:46 +0200
Subject: [PATCH 7/7] drm/msm/dpu: drop VBIF index from the struct
 dpu_hw_vbif
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-drop-vbif-nrt-v1-7-2b97d0438182@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4106;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dte0nYEc0ewgpu8HO4OB4g6OuUwdq1FY8Aaod4fPrG4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpoeQ+dq1W256FoCKe9hdi2ebZ+9ZiAVPssnNZf
 XLXCG6HqBGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaHkPgAKCRCLPIo+Aiko
 1Qk4B/0RZT+xLbthmmGio2SIYM+9NC87C2Z601o3sEKm9T+cJqs/Jqeg1brX/+qJWpB6VjERwkQ
 LcRCQj563cJSuTxT4YcKSb6+4nSp7IuEOQ4X4NbBDw6P7e9M8s2B6Aq/nK7v7tRBkhZ0e3Tl8ZI
 ZvpOMT8Cl7HxG2dTtBAYIlMstpswFJfNWcVlO06frSwnydUd5M01ZlIuKyx6Fpc0SqV/i7cgZC8
 9Nf4WpYUAt36xK081daO3TLgf7+VLeBGSYziDWcelCOGL+k6v++TcKnPRoCse7xzfQ7jZOMAY8A
 jB4IS7ughAhRshQE7fhWKU0Y2R/SB+xWWhtbe1xQAPWg3B1c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE2NCBTYWx0ZWRfXwVQLlmeeKYKz
 o43gAJtjeGOI+bpRT7jTeUl+KB2kDDOx05l/wo1WZwFsrruzSqz3Wsh+NZf+gtfMKwQnvPgLRUn
 g4S1XmgQk25gVPfM/YYBsQbJKqGhVEUPDuDObeoOcSjsTdipl3qgs9TZMtuSQK3BPwRigsxw7Rk
 BOTXyxz+Nkgz5mmsDCwlHaLlCN7NbIPHNc+Z7qs8rB1DY4+D8gUMZan7S0B5bAHYWG8ss+S7fk3
 1LUC8K6XKTRS660JPa+01bmGX9sDKD7JpqCL7AaP1WXQHBG9m4P3ukm0LW4uupp0ECzmVXDl9Fv
 rVn2HlRP8I1AK0mBZk5gprWecIkZ0xkLgMpLrFrb76L5QlOahpvjvDOsz3jq1wAi28rUmQHcqYx
 PWMc8jVSneKIH6Z6WMybTOo+tlsF7RHiljaLlapRjY61o+QqOBNdSd8mL9TUjZwcwRONwdw8k4g
 uEkVFRUjI4g/mDcnW5g==
X-Proofpoint-GUID: Ild_M1svoXaHlwVnTE18L_sJXNaA30Nm
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1e44e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Rro-Jn1WIAMZ-BlAJUcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Ild_M1svoXaHlwVnTE18L_sJXNaA30Nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270164
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94512-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E8281BC1AD
X-Rspamd-Action: no action

Since we don't support and don't use VBIF_NRT, VBIF_RT is the only
possible VBIF type. To simplify the driver, drop vbif_idx from the VBIF
instance structure. As the last users of VBIF_RT and enum dpu_vbif are
gone, drop them too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 30 ++++++++---------------------
 4 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index a169628eb512..0e65bf5ddc4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -284,10 +284,6 @@ enum dpu_wd_timer {
 	WD_TIMER_MAX
 };
 
-enum dpu_vbif {
-	VBIF_RT,
-};
-
 /**
  * enum dpu_3d_blend_mode
  * Desribes how the 3d data is blended
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index de70d6b00972..112df3f31e2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -236,7 +236,6 @@ struct dpu_hw_vbif *dpu_hw_vbif_init(struct drm_device *dev,
 	/*
 	 * Assign ops
 	 */
-	c->idx = VBIF_RT;
 	c->cap = cfg;
 	_setup_vbif_ops(&c->ops, c->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 9ac49448e432..96ec4e35e549 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -98,7 +98,6 @@ struct dpu_hw_vbif {
 	struct dpu_hw_blk_reg_map hw;
 
 	/* vbif */
-	enum dpu_vbif idx;
 	const struct dpu_vbif_cfg *cap;
 
 	/* ops */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index d33231f1d50b..0c6fa9bb0cb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -11,16 +11,6 @@
 #include "dpu_hw_vbif.h"
 #include "dpu_trace.h"
 
-static const char *dpu_vbif_name(enum dpu_vbif idx)
-{
-	switch (idx) {
-	case VBIF_RT:
-		return "VBIF_RT";
-	default:
-		return "??";
-	}
-}
-
 /**
  * _dpu_vbif_wait_for_xin_halt - wait for the xin to halt
  * @vbif:	Pointer to hardware vbif driver
@@ -52,12 +42,10 @@ static int _dpu_vbif_wait_for_xin_halt(struct dpu_hw_vbif *vbif, u32 xin_id)
 
 	if (!status) {
 		rc = -ETIMEDOUT;
-		DPU_ERROR("%s client %d not halting. TIMEDOUT.\n",
-				dpu_vbif_name(vbif->idx), xin_id);
+		DPU_ERROR("VBIF client %d not halting. TIMEDOUT.\n", xin_id);
 	} else {
 		rc = 0;
-		DRM_DEBUG_ATOMIC("%s client %d is halted\n",
-				dpu_vbif_name(vbif->idx), xin_id);
+		DRM_DEBUG_ATOMIC("VBIF client %d is halted\n", xin_id);
 	}
 
 	return rc;
@@ -97,10 +85,10 @@ static void _dpu_vbif_apply_dynamic_ot_limit(struct dpu_hw_vbif *vbif,
 		}
 	}
 
-	DRM_DEBUG_ATOMIC("%s xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
-			dpu_vbif_name(vbif->idx), params->xin_id,
-			params->width, params->height, params->frame_rate,
-			pps, *ot_lim);
+	DRM_DEBUG_ATOMIC("VBIF xin:%d w:%d h:%d fps:%d pps:%llu ot:%u\n",
+			 params->xin_id,
+			 params->width, params->height, params->frame_rate,
+			 pps, *ot_lim);
 }
 
 /**
@@ -143,8 +131,7 @@ static u32 _dpu_vbif_get_ot_limit(struct dpu_hw_vbif *vbif,
 	}
 
 exit:
-	DRM_DEBUG_ATOMIC("%s xin:%d ot_lim:%d\n",
-			dpu_vbif_name(vbif->idx), params->xin_id, ot_lim);
+	DRM_DEBUG_ATOMIC("VBIF xin:%d ot_lim:%d\n", params->xin_id, ot_lim);
 	return ot_lim;
 }
 
@@ -252,8 +239,7 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 	if (vbif && vbif->ops.clear_errors) {
 		vbif->ops.clear_errors(vbif, &pnd, &src);
 		if (pnd || src) {
-			DRM_DEBUG_KMS("%s: pnd 0x%X, src 0x%X\n",
-				      dpu_vbif_name(vbif->idx), pnd, src);
+			DRM_DEBUG_KMS("VBIF: pnd 0x%X, src 0x%X\n", pnd, src);
 		}
 	}
 }

-- 
2.47.3


