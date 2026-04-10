Return-Path: <linux-arm-msm+bounces-102637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJGgOMTG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FC13D5240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5BA03002741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405223783C1;
	Fri, 10 Apr 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MfCONS6+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoH5qVbg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA6377EC6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813707; cv=none; b=Y/ZLjpuh1oypOdCMazR+uBJfnN5hqJHY6osnIc8gkrHQW32FPCtW87mMetScMZrXt/JmTDrp3sJmcoecqtl5gfRrvEuyeZ1JRakhMMGevDK0hMrHz8D1b3OJKUbG0EVqwDm/EDIPoPSdE/noTDRPDb8JByRhdoRQRQZAUAZ31iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813707; c=relaxed/simple;
	bh=6AtwChk28ox4kGSeL/JNpZPRR+qKsN1Cwh6WEe+iUDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1MB6SW7YA2eDIxaE17ryrs9KYiRKaH7++VlHvRvdrnq0gbThD781DAZzQaudelKylNqQNU1s1gXDcdNZ5+n1W1sN8TBaJfNkBzouA/WJ+kRYbQDfubusajvvUiNPP7XozUYqbza/FuTFVW0tuQh9WnEuGpZUPqvrJDiyxDVs6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MfCONS6+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoH5qVbg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oMRK709084
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOIx/TATXEJZQ6DVuX7THLXDyKxWQ+AzVj0oZiDVfpA=; b=MfCONS6+S6UgPFTV
	5Z2cK5Ge7e+jsV9mjZy4IDSK8NWQ/f2Tm17KDEXYqxb7uoIbYlII9yMnKkwFQ/nG
	VfAvrG0OttuG9RcC+kZdjHqwCazbH8PMXropBECfv4yTRjik1b1BxawqS0fAGAkX
	JwgRKYBoYEy7Ixy/wXEb17+DHKr/TVO2teC331uIPhPL+GRqO68oNaGW4gcUrhLS
	xLb2/0neuu+x9QTtOk88Qh74BAFGqKqFtJkyBB/qZwRabs6CZAcpiePMzW6H3VBm
	HFh5nVxpBiQD2Ke5/6EyX1nkO7km/w1wcWH4GxQ8z/RgTtC9omxVcODo2XLHCC+a
	ujE5pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0tk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:35:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a22dbeeb96so41415896d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813703; x=1776418503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOIx/TATXEJZQ6DVuX7THLXDyKxWQ+AzVj0oZiDVfpA=;
        b=PoH5qVbgdufiLr6HTH9BTZB7u+207AuTZp26sAeh8d7ZGCJpP93ltBCkE2IkE2KC5+
         LqRitZMH7Eu8g0SOFrbFmGO29ztODPMxjznHm4rzKf3+116w2V70tXrtP4xq27ryaAiz
         eGBkFXfBxDQimLew366Z2s6yoXU7ciyPbDHWGq7MrZmSolXvDiiH9uZHbdy6BNeyc0FA
         lIhP4vM2/kOpHGJopE1ec47Wo4Ypv34vq3+jftgiCLJWqa277tHu0wxYf3BLKDc8NNbB
         NAZQXa+uoUZh/1+BvT5iqXv+d5zC3o7mqKVKfhoBdrLmbMxASou0PO6CdnfjKAEwpMJS
         NJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813703; x=1776418503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LOIx/TATXEJZQ6DVuX7THLXDyKxWQ+AzVj0oZiDVfpA=;
        b=hBJPBBWsAodWdPdj8Nj5J/1xv18oGrsI+d6Hj+xa4V/TjOz4MZ/tVUjQt4iv0ofotJ
         qHltcBq6H6sGS+w2jpL9160bYq6gzIBlBjvVqH7GaOdVS+uAH0bLiF7ZxFTBjFtVszVh
         8wiR5xhETsvxxqHHfemlqDnMo+6p2NMRBJ6iK7GOnqLr9iulVi35UAh/OIJLRfnfqXOK
         rAOD6vGB3ujYEpSAJeDjj61g7UOvjB1axMzGvSQ+GL/ncSHUluehgYN6PbAOh22ROXZZ
         qxkBsxDWjFjPs7qR8SAtmEZekZgetuj6fUHtg23hq+J8o8sSZjJvkQay+WgaXy4q9aFi
         84Kg==
X-Gm-Message-State: AOJu0YwETMqKII7520EXkFmxDj7Vi9ry9uKzIKgCgoGkTGv/aTD17GNs
	PUiXynQzhLcan7hVgXMQJk9tPah6emBay8itbDSlQdEWqskMU1sQIkPHsn37IlU5g2XQJCcONF1
	7M/4JZvZaWrOQBBuvLiAB99TDkFDEAOGNRJfe5CnbJbLX3s3F2+WYf8nFekx2eEnHp88aDCtpYU
	K+
X-Gm-Gg: AeBDiettMT62l2DO63qlM0JU0ULXD+o41WoelWnwOHkmcQsBOiVzgkBRD38gpkaoA7M
	Ldje9bBfkt2C1B4VqGtutB5mghlq9J2zygyekY7ie9lUCwfcWA1eGOkU51T9BxY7+iOy2pgMZjv
	MoN+vtOdcIyAt9ELBTUA6ICwkOF/aMY8EVfNpIAKvuRLQrZa6D4azUGW6nfIM0WhwIntnIBYr2Q
	63LnFaATopdAXwkzUrIcOmH5vWV3BtSxoVt+te0vDbxmyO2//LCuxxcSa6AdQ1KpxaYbzYEr29m
	nynVIjcayHJR7HTmJH/zuqS2HrlYgTAvaD69P4VhpAJb1amlaAnb65GuhcfvqxXRj9Gj8GroZwb
	yt8YJdVbC5ckt06O1f5Bh/mRDiMSdYbJgoFOQB9uhdiVOcYOa8IAPoF0ECSA68AD9F8ng1JmCIl
	0JCMBsVA4=
X-Received: by 2002:a05:6214:808f:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ac860ba87emr32731966d6.9.1775813703008;
        Fri, 10 Apr 2026 02:35:03 -0700 (PDT)
X-Received: by 2002:a05:6214:808f:b0:8ac:801d:c3dc with SMTP id 6a1803df08f44-8ac860ba87emr32731656d6.9.1775813702475;
        Fri, 10 Apr 2026 02:35:02 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:35:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:49 +0800
Subject: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=6181;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=plU7Urx0kW/l+Yq+gBI/qNvhT/6gNugtooXNAjfVfZs=;
 b=Gg3H2ELuh9AzuIzDB66IMGb489kZ2605TppVgxDeuy1g4Nr7k69mz7TAQtt6Txer8Heq7mYbL
 JOMF3iXz7ZtARwpnkcRp9CU6AfOFZv30ENs4bgHHiI/mqSikvRkfLPY
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: YyM5T37fojiFbBSq-I3FuUd2YZnTWK4N
X-Proofpoint-GUID: YyM5T37fojiFbBSq-I3FuUd2YZnTWK4N
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8c449 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Zlm8kRnIXfIeTuhDwTwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfXybSfTsLHajWV
 AhGqY1VYDeA5vhlpL84SWw9E0KJUHBetVnyI54SU3y+GDa7GEDC8jKzyQBYo3i2vuIowtRTbrOp
 VsDpY9oeqvA/vT41+Wt6EGXr6qhRkqQGE0M915r3n34IRACtLnSyBrDp7sunMSZJLBSzlAD41RY
 ZOS5ujraqlmkZV6yoQC6EfFHS+9VngwlgezSHW4LHoZwsy+tBBmfaJ48Ig5J3DLXQjLWBTGoipQ
 tyGooZYYuXpyBckohu/duSpn017PsXxQq6Va0jT4ay951+WElbl6wk5O2iBUufDH/jZgqOvMx7p
 MMpU63JRgjRSt2HSOSvrGFS0bSvoHet+psi0Dzb2vTtjRnDaL5FdFcclh0Ah/i0uB01RG8OJuYG
 SF8V/M8F15vwZwOxGw8PPvLfs0Vrz9MdE/D/OhmCI93rvMCSd5D7jdriMfaDwGA5IA8vwoNj/sv
 VRrBxFq4+VJfhJVOqHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102637-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 44FC13D5240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce the `mst_streams` field in each DP controller descriptor to
specify the number of supported MST streams. Most platforms support 2 or
4 MST streams, while platforms without MST support default to a single
stream (`DEFAULT_STREAM_COUNT = 1`).

Also accounts for platforms with asymmetric stream support, e.g., DP0
supporting 4 streams and DP1 supporting 2.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index fb6396727628..1e80d6fc7bda 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -128,6 +128,7 @@ struct msm_dp_ctrl_private {
 	struct clk_bulk_data *link_clks;
 
 	struct clk *pixel_clk[DP_STREAM_MAX];
+	unsigned int num_pixel_clks;
 
 	union phy_configure_opts phy_opts;
 
@@ -2707,7 +2708,7 @@ static const char * const pixel_clks[] = {
 	"stream_3_pixel",
 };
 
-static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
+static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl, int max_stream)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct device *dev;
@@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 	if (rc)
 		return rc;
 
-	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
+	ctrl->num_pixel_clks = 0;
+	for (i = DP_STREAM_0; i < max_stream; i++) {
 		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
 
 		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))
@@ -2750,14 +2752,26 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 			DRM_DEBUG_DP("stream %d pixel clock not exist", i);
 			break;
 		}
+
+		ctrl->num_pixel_clks++;
 	}
 
 	return 0;
 }
 
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	return ctrl->num_pixel_clks;
+}
+
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
 			struct phy *phy,
+			int max_stream,
 			void __iomem *ahb_base,
 			void __iomem *link_base)
 {
@@ -2800,7 +2814,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->ahb_base = ahb_base;
 	ctrl->link_base = link_base;
 
-	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
 	if (ret) {
 		dev_err(dev, "failed to init clocks\n");
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b9f0705b03ba..6fed3ff3a72d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -29,6 +29,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct msm_dp_panel *panel,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
+				    int max_stream,
 				    void __iomem *ahb_base,
 				    void __iomem *link_base);
 
@@ -47,4 +48,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
 void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 736b621c0531..7984a0f9e938 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -87,12 +87,15 @@ struct msm_dp_display_private {
 
 	void __iomem *p0_base;
 	size_t p0_len;
+
+	int max_stream;
 };
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
 	unsigned int id;
 	bool wide_bus_supported;
+	int mst_streams;
 };
 
 static const struct msm_dp_desc msm_dp_desc_glymur[] = {
@@ -567,13 +570,15 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       phy, dp->ahb_base, dp->link_base);
+			       phy, dp->max_stream, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
 		goto error_link;
 	}
+	if (dp->max_stream != msm_dp_ctrl_get_stream_cnt(dp->ctrl))
+		dp->max_stream = 1;
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
 	if (IS_ERR(dp->audio)) {
@@ -1208,6 +1213,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 	return 0;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp->max_stream;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1234,6 +1248,10 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 	dp->hpd_isr_status = 0;
+	dp->max_stream = 1;
+
+	if (desc->mst_streams > 1)
+		dp->max_stream = desc->mst_streams;
 
 	mutex_init(&dp->plugged_lock);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index a5c6ed5b18e4..b0cfdf215970 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -26,6 +26,7 @@ struct msm_dp {
 	bool psr_supported;
 };
 
+int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
 bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
 int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);

-- 
2.43.0


