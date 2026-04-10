Return-Path: <linux-arm-msm+bounces-102642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMnGNATH2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:46:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475E3D5272
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9F113024505
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264C93BD633;
	Fri, 10 Apr 2026 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofcCEtIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H84g0CJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE923B3C18
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813732; cv=none; b=NjF+FS04jt3QsU3eouO9RdTc+ADywJ0ANMM4gkQVq9s0nxdA2W3mAVXEDokYrJY7pSMQJovprmlTLBLpL/XYr0SXIelKnO1s/wQCoVgz7whSesUywSC6yCmegOjaMMVc7j3X6iSCUYE+xpBaQhNTBk582NOiWyrVI5/IPVE8etc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813732; c=relaxed/simple;
	bh=F4yeZpfu9Y1dvnQkXn61krf2K89q4vJ1whbtPEnsNoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYjR9bkUd7z1jdoERLnxXFi8vnXsFh1DloVlJIPLM1x3eJStrjADpRphlROghjxwmaoeSXPhbjX/2hxhmOaEGN/HfsHvJAyN05pUgql1cRaL/gfdPVCXedlDNJuDr6g2nb6dqEPJuH022nt8G2vvD+3WrEekxF4OoZQiWoR9yWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofcCEtIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H84g0CJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oKj7708994
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNG/v6dVL5jML4JAEeiW236k13VW8/n1TXxW/iqzj/U=; b=ofcCEtIXB9teZ3dc
	btOhT7qF9HU8FcD4WQQFq7AtTDfXoXM2GypCrvk1bDdv1k6JmBhY77eEtr9sICEq
	QenfmR64HmXkpGtFwRzO17+So8PGPSGIPxcDgeFvzwmMwNfQ5dtll0XL1IqeS9Tf
	L0OygAfb2VJVmNAeeb8kNvxMsEfEIW9Kwii4bQDOmqBgT8AHstSfVfZpW4eLGphu
	hC9eOd9xECiz+zEf+ko70fTDE28Tqqkve6RsJBJn6v0qu8nh3/fpUvfKyCEkdDFy
	+Gu30fzlb6oQ6lmA3gm1G74KggA3er4X19ZhrC8tajgYsBHrZiVcM0Wb1nYjkRsl
	YJ356A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd03be011so41271356d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813729; x=1776418529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNG/v6dVL5jML4JAEeiW236k13VW8/n1TXxW/iqzj/U=;
        b=H84g0CJELvXJ1NUSEmxQLw9rqY/CL96F0Wj+kOKVWfY25bIQAebpZNaAqaUVtam+77
         ob5CE7rE+XvsNuTPRrxbTfq6ij3vllXjCnXawrgVy0v/OIUkZJK9K1rRUwiIw+5JFXZw
         Kew5f+UkUR1kcmITGEOKb49azCvNee/jS2DxFhnoAz/YSmf6io0EpmxGrqnpvVFMj2Ft
         +43MDhBLLTMGL/bUAbuWGwpM8H2s7U/146OYztSx4kUMwn3oRVfE6Q5RwTkvvROC36VK
         umFARc6EOIm1uyfZEvjpaep1vPgxoSk2r5UwuScfCm5EEIso0wpIBmrJQE08uxM9jrc4
         vLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813729; x=1776418529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNG/v6dVL5jML4JAEeiW236k13VW8/n1TXxW/iqzj/U=;
        b=BE0A7mF+6ZNy3IDYoH73WcKGlGQhExd1mHckSEgdX0Qc4pAOc7Id7li9Yo8tvPW+HK
         XdgeXKyR3DsT10s4NiM7va6VshauxkS4oPSil/miuREhkHwgzLQ9yd88BpkgFfFCWAie
         h5w0wKr6TLvOE51EA6hkSaNZOpQCng1TvMmxRDRm96vfkjjmgLuSDRu0BbPY5zJ/VnGA
         owXp8x6FXJiyTpK87rHiOHhugGLVDY4lVogF9lh/lEvwFxjtkOKPL1IGVV6Uh87jcg16
         DnPRGajaM5cG57fS2M/fhSlqKha79ddAoYkxfwJsy2aIPA7nms2tldiZB0VkeRU1/9NN
         YK6A==
X-Gm-Message-State: AOJu0YzNm9J3gzDWK8tii1WDi41N48c034QZAUmk3OxhsWFW2tByxlis
	kzVBYmZOF5axyGbkwaiWOBPrcqZ645lWA5IHgOZ9JbGbMjSQBKld3++LWj/Yxz1jvsiWbHOJzE6
	t41pbsKIKegVGa4nBT+y9PnhyVwCeSoPavrX2l7L6ODbr8pcokyEkSpHWrKa/j0jswdTU1oG6Vl
	0LJSUKiw==
X-Gm-Gg: AeBDiesZlhmU+LNJsbCIf/zWdiPqH3CI8hhBNVEmEj3eeYtV7KP/5Le3lJlJcihP0dz
	veKMZZRHayEUtJT1P1OvFMegS2mZSss7UQm0TdUnEoNW7FL7RNCg2y8AfvMO2EWLt1K4pfgT9s1
	2SrnHCQ5UPpFGJxwf3n3PFkev15HdSv/uN5lYR3BlTRQNdzv5Kw7BtEounuHhCOeR3L4rvH+SBw
	JCSsxQ6ZQqnwRHOjZrE99CM4vsXHB5nWs7Ca6HImZO28rB2UltSNyiut2WPy4tosJMeTupH1Mwn
	z5Wh0hfDMjmsVIRdJ6dXOqg0CFVzTKoqSsfU8JQPB0Ns38Lai+VbYDLtuV9fUsHJth/Vr+FfZUp
	wlDW5MFRsyC8T09/l36O/4ulI8zmWMk8TosjEY/PLLejKZXIsM6paEV8mM0TNBRUPNfjfuBS4yM
	Oz0K7m6+0=
X-Received: by 2002:a05:6214:3a89:b0:899:ea4f:12f6 with SMTP id 6a1803df08f44-8ac86285cfdmr31534266d6.35.1775813728703;
        Fri, 10 Apr 2026 02:35:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3a89:b0:899:ea4f:12f6 with SMTP id 6a1803df08f44-8ac86285cfdmr31533936d6.35.1775813728267;
        Fri, 10 Apr 2026 02:35:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:54 +0800
Subject: [PATCH v4 19/39] drm/msm/dp: Add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-19-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2524;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=K5vgfTfdCI4P5kMd92t6oN5BdOo9qMx4WD+42FN4rPU=;
 b=xE4kYondk9JUlsE03aUn3L62AYCt/ATKX+EV9mZLBM27CYYnwrk0Lz+9gycIw3ZKS57a1vCiB
 gLO/pK1Aci0C6N/rTE00I9+m1K0+R+25JzjUUbpF7eGq5Yua5Gw8bKq
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: ve70YeC-bGcpXtnnQOBNv-9mo9R4W_p8
X-Proofpoint-GUID: ve70YeC-bGcpXtnnQOBNv-9mo9R4W_p8
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c461 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX9aOp30852r+B
 HSxiyKtvdwLOz/gakJmSrr8ATQgdLQcUQ/B26JmMNguLYL6Zx9AmXbJbo/NGL3ozEsPd0I/IEBT
 2/PAW8dtceijNHx0Ypg3BQrd8Lzujp1/LE4Md10RSgQKmCivu71xDGsCMjurRa9vfmDy7b297Sz
 vzTt9Ggg5fVbKTvjDf9TbKGuJTQJ3MEejybzf70nDIsukqjrzooEkCei3vGzQ9Ojvf5jkq1wNuJ
 soAVL6UusMDvuQQ3YVmQyf7XiDVdQw/Qc9hyU5yZpFGUzq0IMBcJ18bAEUJ1FW4Jdxf1OWYEJIQ
 AkuBbLxAM5NnVyYj9bAgN9CdD9V7wEAmO+89+Spf0sckdvdlL663j7cY/BRETzfiqKrf54eHigU
 2VF0NaxqMIfSVOReTKa8mJy775EUjo3Le4otVqJQTG8Sb4zQ3B4yyy9uyz2fdwxFE4n94fi/okL
 fvqYGzvcHdo5b9tJ58w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102642-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3475E3D5272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6f25145ef214..9513de81abc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -255,6 +255,19 @@ int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
 	return 0;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2669,6 +2682,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (msm_dp_panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl);
 
@@ -2726,6 +2742,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 237325d52dbd..87eaaefa014d 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,10 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_ECF_MODE		BIT(26)
+#define DP_MAINLINK_CTRL_MST_ACTIVE		BIT(8)
+#define DP_MAINLINK_CTRL_MST_EN			(DP_MAINLINK_CTRL_ECF_MODE | \
+						DP_MAINLINK_CTRL_MST_ACTIVE)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.43.0


