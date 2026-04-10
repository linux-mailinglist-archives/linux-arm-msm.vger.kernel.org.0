Return-Path: <linux-arm-msm+bounces-102631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDKJMa/E2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:36:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F13D4FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E6403041D2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396203B2FF7;
	Fri, 10 Apr 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuCK2X4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZZIMnl9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4343AD50C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813677; cv=none; b=VBUXuVK3QJ9vZiFN+UPwHiHMFn8J1GJ7G0WwGyFt9b2JjGPXJ/zqsshAEGYXZtIvbn4OfpP69gii5w/HOZCnRAwY1q+a1pvd6fvRLPTQhxig4y4/WqHL+jIOv848LBqUyIDKMjT5VFUpDLahJN6cYjGQpksTmP2C/9243i59gcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813677; c=relaxed/simple;
	bh=JEHs627RYNAcA8lkZhsMU2AZPLqN5l4TgtCY+KLc3k8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aPN8Ip3tO1VN8v4RfXYbt+U7m8dO/l+DbSq3gqJH2SpGEHWHsYDTHyXG1CKT8vgsCaeoxlZQTdD7dz4eRCro59sY2D/7WAKENrRVVnDqGosNyLQIoHME/pTY2GpWQ+IE6V7KmBMlP3ASXl4YQgOF5Pgh8OJWd7nR6pU79iYLmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuCK2X4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZZIMnl9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A8F3vN3934572
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XH5OGuuCFVVaQxq2zBNoNsrh1MXRyUkvunIP+bf+M8E=; b=DuCK2X4dDgRx0TLP
	pZC/w+lxLRWC1exZaXODf/ciUVMITVO1NZkLB4d9yWKVubIxCidHhcNtwJNKxHYw
	/wDx6ULd6O439NXgxlwvIG63DbqRaa3xils1KYsfgtJUU2IMFvlqd8s5v8LP5AhU
	18FcaeJR2uTTHMYvh5eemAwHNu4B8b5aX31jNfobMjat65kC2IGTE5OU8OLQcSw/
	/4I/+vDVraK/w2TFlXc6N0C0DjI8JgKzRYLf3tUZRjrBJIAT+AqOwltDYveSMa2+
	JcehQo6Ck/XtzJakqd3fu6leFduVSdW9u4yuD3QrSAnNX2FgBNLxWWVDECd5oPXK
	wL+/Lw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbfm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a1f96bf221so62746336d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813673; x=1776418473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XH5OGuuCFVVaQxq2zBNoNsrh1MXRyUkvunIP+bf+M8E=;
        b=fZZIMnl9oJxFOEHfywsaDPBXqg7XMCNDIEFj0/aDpLH7CRuHitOo+GJ4hIqGfLsY77
         t6wTU6sXCWNBOTiM0inLD5D1FEz7ui7sLOllV0srXviQZG6YDgJFYExe3/mQRXKEZNMh
         PbOypHB0XZgONzmkz7NA9E8eRoWuD24oTvghnpFByqwGMZf4hundaGXiMzoRWDfNxSTW
         HnVUnf1fEykUnKDZ/Y5XKMIFHb4LGk+c9PNZgVsC00DdqoJsFXDwpURd4eZSUTFUL9+P
         xhfSD8xP/YHQBsF9x4ACXUSIwKmIU7l49yp/GbhqIOs39myouII6CPRWQH9uXfj1qga2
         Eoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813673; x=1776418473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XH5OGuuCFVVaQxq2zBNoNsrh1MXRyUkvunIP+bf+M8E=;
        b=lxbStE/6MPMRJ8eI5D30ic7lhYVmrIQHBCs51OjsWGRFxJHzrU0MwV7q1tikWeVUzD
         W8h5PduxJaKRgxn6g5E/xeO4kDWuluyR4xH5E14QKVfac7q5YjvQKIPGOqoz/fLG4mhh
         RDl5C3PbEXQpTo6CtXgpI9vPql+yQurGex9V+XQlnmxd1aLM9jFXqbDueKGOEVCl+8/U
         MKnvnt1S5nwxft4LIv23GhXt995GnScSQyYK+Jn7ie0+CdPWQHNNI0b9WXw3Kv+RYTuI
         T+NhTlSHdjBgumNaDeCbXKBnO1h9lMCRsMsGBVGDPwbzL+BJjD0taIvEvuDN41ts3nlD
         2ALw==
X-Gm-Message-State: AOJu0YwZ19LqWTVmiZSz92llk0NO1F2pWj/UrdBojnbVsYT+MwVUHBN6
	dl39SqXzu8T2BOhag7miV8OupYpvknQGmi177nufXVoRoieZdH0CNbEW7fIZoOXljnalNU7G6BD
	U+7f7SASSFeKbdhs20KvecFCQFxKIR3+V3ILBgn7/gw5xTUG9637UFsY2eESsCu3KEH8mandGHc
	GHkytj4A==
X-Gm-Gg: AeBDieuIQTw4OLfoOn1AVT9JiGoSEJxG1LrIsnStCKx1yvIt5W16TnpkBRxLFuQp+6b
	GSH4z+KSq9TAZ1yztjzsXiVbGZ0a/t14DFYKK7/nZaqD3H22xXvrW9hqfcjHJDrl30CSCF9Zil0
	DUZBl8/pzo8eXOEvzy/AX+nJ8XnnrmY9RIkBVQ0RISMLFRJF3PwaQU9cS9n7fXRhyabdvLqlZXD
	Pyt/YtCwv2VL7j1TFFiINKjHovA7+lxPS3v953GQqf47aapf1aIPKB1CrhZGUhk6rdpkkWMuRHU
	mx6ImXJEMN5a+X7Zqhoew7wKWm5UWWWu4HgzGW3WYaK/oVIzERjSaR2FA5boZnXUhZ9waHPojcU
	JpJBNk1fiY+m8tOzog4wR9IF1Z1ts9yI+4ViuG3CLyg0kSLrKdA9W9jT/62YXUHeyGMFM91tdLU
	5f4QKpUlo=
X-Received: by 2002:a05:6214:4e84:b0:8a7:32c8:7075 with SMTP id 6a1803df08f44-8ac861aa864mr28916426d6.19.1775813672686;
        Fri, 10 Apr 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:6214:4e84:b0:8a7:32c8:7075 with SMTP id 6a1803df08f44-8ac861aa864mr28916026d6.19.1775813672207;
        Fri, 10 Apr 2026 02:34:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:31 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:43 +0800
Subject: [PATCH v4 08/39] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=4382;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=BkXona5TbnmF2de1k2yc2BT4vzk4O5UWrXuvAHrPtBc=;
 b=p8UCmpq5XBfAtP50t/F6FDt0RigWiXxicBr6UCmW8ZWVkMnfjZJQawhqlnqHAx9w1xHwzUAg9
 BnhX3u/uhRsBZpIBYOrbH170cbtzxIjAqzA4NdvcERnaV5l/G1uySGm
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: cvJmf-nSId-8O3ydnPgRUQ-jaShnoPDo
X-Proofpoint-GUID: cvJmf-nSId-8O3ydnPgRUQ-jaShnoPDo
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8c429 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=x41-kvR0HCwjNSFKcS0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX6hz6z5cowqaM
 573dbQPLS/CRgl4cCUqy+rdWDtZwvs6Hw30mkl6FWsIyenCmnIvmVWZU7HtIsbg51Tfme5DCSHL
 iw3osbV1cCshYx06G6DsCgNnsivgEbRP9gxs2Ji42wK+oHda5Vqvyn0TfBEVLKfwVe4Fv4yYJJT
 W3uEqIvduq76K4xvkop15GqlOORtLb9u6hfrdyXo0sR2XvXZFX8GHTAnAi2Z91iZDnUWjl1lOMF
 KEHq8rTHiDYZkUeOu8tyfaB6TrJO0PnMW9C7aGHoDhksjWp5P1hsb/EJACJzKugKuysgaxxPA6u
 SNMlt7R2zdOQzlRaEouOeQpQz9m4gpGQKc+ezw16QE63uDi7emBe20Dp73fTpnj5PjQLZT7pR8E
 H+0OenltqMvxnH2PM7PrAucFnDLKCJ8jjIEnMbqMRPfIf/nGEUSqceQ0AfH1rmTJguOcTdIavE2
 8xAIiknvjz9d6PITCVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102631-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A46F13D4FB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Currently, the dp_ctrl stream APIs operate on their own dp_panel
which is stored inside the dp_ctrl's private struct. However with MST,
the stored panel represents the fixed link and not the sinks which
are hotplugged. Allow the stream related APIs to work on the panel
which is passed to them rather than the stored one. For SST cases,
this shall continue to use the stored dp_panel.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cd58968d4e14..d0eed8c7df45 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -477,13 +477,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *msm_dp_panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, msm_dp_panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -2523,7 +2524,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2536,10 +2537,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
 	pixel_rate = pixel_rate_orig;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2571,14 +2572,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	msm_dp_setup_peripheral_flush(ctrl);
 	msm_dp_ctrl_config_ctrl_link(ctrl);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5d615f50d13b..32196e97cbe9 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -17,7 +17,7 @@ struct msm_dp_ctrl {
 struct phy;
 
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 58c46d5ab4d8..1bf1335712bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -666,7 +666,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 

-- 
2.43.0


