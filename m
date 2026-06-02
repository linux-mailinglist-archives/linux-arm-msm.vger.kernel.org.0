Return-Path: <linux-arm-msm+bounces-110776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CPwLwOgHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:18:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AAC62B457
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C856D30EE9EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759B23CBE8F;
	Tue,  2 Jun 2026 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAa/bHTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHGXRfC/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE473CF04F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391489; cv=none; b=Un0RfBm8Oj5mwyvv6f4n/u/INduhmxezzeFkHsbQiMspFAbNx8yDR7Ix0nJukVk0q7YlBIlFi5i11MuPA8uTLJPMhhC2qPdsezOoEpfhw8+N0NHE9OhM6VfDc9U5VC1qFkieFG/Bj5af50jXQjU/NhSaodM0opZNK6fc+3gba/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391489; c=relaxed/simple;
	bh=Uq7SV6Ep5ActlglyrkOIZMDwSsOOyS7xf6CtI/ZDDWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQyKGGyJe0ekUqP8ThHscIJTHLKuvw9qOSokJ0aiWMpcNSO8UuMkv19y3AdS46e1yG9V1/6B0QOHKYKMtlrDfbJY6aTBLaaRghfoPYKvHEYOhJ7gD1Mu474Z9HxeKxRwN3BwlCJF/fiectpVRTW52z0ZvpwJ0A10vUsm54y2BV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAa/bHTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHGXRfC/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tna41855109
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wRMlDIbqB0uP0ea/ic+hhlybUOF+IemcZoAacOc4Yzg=; b=jAa/bHTxyqCQXBs1
	yQDG+SVE9IDIFm7FrpOJs//K7f/LJmAZSpJe42cBkeQFA/6kmimuKdh18Bei2Jbh
	9l4NaOt/lR4U8tHekAEtFrn1qHrxDs8CKiO50sUlPGsL9nYmIHyHc0UwDbGcCFnd
	2q/t0Qwell9fcCh+P6dYn6Uw+dI3TKBJ+rY4Lci5dCYwAiWpu3wiltqZFwfm0Vat
	zyZhOtD+Namg1MT3NtQD/0lg5VFJTRAcMXW7QYnYlH6pRN2/py694K1XEtKuvHAq
	5chqPFVCJ+XQGvikxB+wxlIeFlQssnUcsel3CIFzYNOQnMaYiEeKxt1vchoy/acJ
	06J17w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78stm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:11:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso216177921cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391486; x=1780996286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRMlDIbqB0uP0ea/ic+hhlybUOF+IemcZoAacOc4Yzg=;
        b=eHGXRfC/t5Zsc0BbTQrtwIm2JsMHSR36fGLMM2tmvO1/8P4SoAkjhW0+PHJG/vXmyk
         vlMsjqRcr2S9XHZ2JhQfJSR0c3vt4vvDds6WOk3Uv2d1W7Oqw2wBFYmuCtkFxuWZK3tk
         ySOhcvzxwXUow0982uhhBGoiNMY7qMEPYqFWgqpgdjRFv4KkPvlGgBWhBLE7/76ks3hg
         zmMEdVl5BM8Zw4JXOMOCjGzFEDfBOV5MfglceqagsApBJ0kyslSxA/ifnUSV64lsoJDB
         PiS+L2cN1Ah4Txbo6Vnyyif12LZE62fffAiFHn0BK3JurddrelKZG/JlD2ohMtDR3PJj
         W6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391486; x=1780996286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wRMlDIbqB0uP0ea/ic+hhlybUOF+IemcZoAacOc4Yzg=;
        b=D8upCeJt0++N6yP/BtxOyqdFDcS5WamWNhEUMGnEsNlUk2lArciLLkmdEH5CYEfzQ3
         rPJ1vhXVXKC5VmKX5EVBMkpOcLtvb+9KXwBs3NAeGyFBDg+7f2PBCfM1baikAvb5UNXy
         TH5/AVka2NjBfrdB6q9D/CkUa48R6XIi1Sjm+v7bKCoOKlL6NAo6YCyiSJKDA6nKt5zy
         R5SjT5lv+XmEOz/F3Z1rkna70CrOe+XS1vUsT3w7jQC0vOMo1KD3QHeiPg+/KrshADIg
         dJ488DjO6bjhEQLey7s6Faos0pNbGt5BW9omPufvDFakS+LbQ2ps+jelxc6UdDU1vcFY
         Beyg==
X-Gm-Message-State: AOJu0Yw5Giwupsh9XZGcL2bdY7VXJhj+01xokkJmNEnvuip7RVhX0Jwe
	I2MHc6B4yrEJ7gxhzpTkppica2uGHbv1vkDz13hB2AftckuHFp/rZgwJd/diaM34xHvICmVb00/
	klnx+zLpdJCdTC7gZhbfETf5mntXtXXiD87wrEamJm7Ay5R5H4zP9zqJtbNbGgRatNAFY
X-Gm-Gg: Acq92OGSgJQ5W0dQJWOLFNWZN4sEy2MCmfoGZ4B0mzZnL3vS9pW6KEcbAnh6rk/KVwt
	vr2+EI5yzQlNQhe7l93vs54S1AYINa4pcDRCq6rBQpn/3P0A8en+C9BdMAwmc2udnoTb05cZrA1
	DxUN92OaC6sP0u3Ue1vQWLlDEyjHMS00133Ofv95XutCbIBeJ8ZtEP9QXMk3Z2t1DifvM/onPEP
	tb3j/4KlYW1juryLn81l67eN9A2/M1c3855+6GZYp8iZEijOjpwpZj9oMd3y2FR5z/N5SE7V2Lw
	Re8m2Cg+Vrssqar7lkCuAkaoZZoQHEPyPBIZgFZmPPFuQjCpE/J3cWV/y79iZlBlSnboVTxXigM
	7ZqOGmzCN80gNaQ6WdgePG4TvyQGkE7Z/sWH1FIZr7++k+XW3PcicQrJjNwkkXyy4FPstrthGVo
	dAiQGvU2eLFJZb5PO8yA==
X-Received: by 2002:a05:622a:248e:b0:517:146d:185b with SMTP id d75a77b69052e-5173a7eefe3mr214883291cf.30.1780391486269;
        Tue, 02 Jun 2026 02:11:26 -0700 (PDT)
X-Received: by 2002:a05:622a:248e:b0:517:146d:185b with SMTP id d75a77b69052e-5173a7eefe3mr214882921cf.30.1780391485816;
        Tue, 02 Jun 2026 02:11:25 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:11:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:13 +0800
Subject: [PATCH v6 01/15] drm/msm/dp: remove cached drm_edid from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-1-2c17ff40a9b2@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=9216;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Uq7SV6Ep5ActlglyrkOIZMDwSsOOyS7xf6CtI/ZDDWI=;
 b=fUnbdJv/ZWAzCaS1RzEOOyudGpMeIUlUFolnSLteOUGHSpMdp0AP9VtJtyEkw3pinEG4pZv6F
 jkqx0LVYcHsBqMVYMcIg1ckbF1bAusrET2Po1lGS7y/es7yqvfVPs8i
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e9e3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yBxTOPed86Cp7mhl67IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: OjO4jsnyL5UacZtSSn9pk1GUe3FI80Q_
X-Proofpoint-ORIG-GUID: OjO4jsnyL5UacZtSSn9pk1GUe3FI80Q_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NSBTYWx0ZWRfX21LciN8FnhGk
 NQr8I1nJ238G1awWjftOC/Svoda5Bvii14iaXFl0tbFAF5Yf06r1EysYGqFIMUAqgmkqlHd+APg
 lDASK7/+4XK+wtw5qOp/ZhUVcNxMn8BdvWniDdywv9DFOaIWEAFZdlRab7/6pmK2QmZKuAxOXYD
 rhDXsed6aHQJlpP85z/dLXsdi3O3ydDfVahnmFyjODGho2atfacv3TxBGQtPqgkXq5Or4teyqjr
 AZB0D5C/fHmXtePrMzkOfkLz/TqkaTj8n46skb8J5IS5/+8a03FRQlaE/x0BniffxSrRG+I8Men
 x8MAKRe5+hG2l1It2WDhnzcs6nkzRVAmePKIeWB9XaddFmwyox5thm79ry12Kc3I2GT8KcmUVHZ
 IWOeK/ZfGFibgTyGcp2Qh24JKAYTIJ9srDHXfyXMb7KRn/ADVJNzwhHnC9/GS+8vzxvpqBcrEXu
 qbSFz8mYp3taWKYWqFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020085
X-Rspamd-Queue-Id: 47AAC62B457
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 57 ++++---------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 13 +++------
 3 files changed, 27 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6800c628adb4..e3682c4d6077 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -269,6 +269,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	const struct drm_edid *drm_edid = NULL;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -276,10 +277,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
 	if (rc)
 		goto end;
 
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!msm_dp_aux_is_link_connected(dp->aux))
+			return -ETIMEDOUT;
+	}
+
 	msm_dp_link_process_request(dp->link);
 
 	if (!dp->msm_dp_display.is_edp)
@@ -291,7 +302,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -302,6 +313,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
 end:
+	drm_edid_free(drm_edid);
 	return rc;
 }
 
@@ -453,7 +465,7 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	/* Don't forget modes for eDP */
 	if (!dp->msm_dp_display.is_edp)
-		msm_dp_panel_unplugged(dp->panel, dp->msm_dp_display.connector);
+		drm_edid_connector_update(dp->msm_dp_display.connector, NULL);
 
 	/* triggered by irq_hdp with sink_count = 0 */
 	if (dp->link->sink_count == 0)
@@ -515,7 +527,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
-	msm_dp_panel_put(dp->panel);
 	msm_dp_aux_put(dp->aux);
 }
 
@@ -566,7 +577,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
@@ -574,13 +585,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	return rc;
 
-error_ctrl:
-	msm_dp_panel_put(dp->panel);
 error_link:
 	msm_dp_aux_put(dp->aux);
 error:
@@ -744,8 +753,7 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_panel_get_modes(msm_dp_display->panel,
-		dp->connector);
+	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 6bb021820d7c..bde4a772d22c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -232,8 +232,8 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector)
 {
 	int rc, bw_code;
 	int count;
@@ -271,36 +271,9 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-
-	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
-
-	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-
-	if (!msm_dp_panel->drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(panel->aux)) {
-			rc = -ETIMEDOUT;
-			goto end;
-		}
-	}
-
-end:
 	return rc;
 }
 
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector)
-{
-	drm_edid_connector_update(connector, NULL);
-	drm_edid_free(msm_dp_panel->drm_edid);
-	msm_dp_panel->drm_edid = NULL;
-}
-
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
@@ -324,20 +297,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 	return bpp;
 }
 
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
-{
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	if (msm_dp_panel->drm_edid)
-		return drm_edid_connector_add_modes(connector);
-
-	return 0;
-}
-
 static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
@@ -345,7 +304,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 	return edid->checksum;
 }
 
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -358,7 +318,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		u8 checksum;
 
 		if (edid)
@@ -755,10 +715,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	return msm_dp_panel;
 }
 
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
-{
-	if (!msm_dp_panel)
-		return;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9173e90a5053..53b7b4463551 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
@@ -47,15 +46,12 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_unplugged(struct msm_dp_panel *msm_dp_panel,
-			    struct drm_connector *connector);
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
+				struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
@@ -94,5 +90,4 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
 			      void __iomem *p0_base);
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.43.0


