Return-Path: <linux-arm-msm+bounces-110097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM2nBMwdGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:49:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3505F0E0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128FE302C6DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9E737BE83;
	Thu, 28 May 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDEAQZQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwV/WUc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B5C3C3C0B
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964891; cv=none; b=fttOWjjQ6l3/cmXTIWu9P5KE3w9W3PvZ3waOVKHqm8Ymc1pw/95tRFF4PVAE+k/1GY2IpJrS+yKaZgnqlBQRjhjMCktkYAiyJl1/gZCQRQu8rgxJslgttQAJEWhEPGZLlqanv84VRK+Tm/se7n45ySQsFMqkMmxrYQWvWI7leWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964891; c=relaxed/simple;
	bh=k1TwNRlX0ot3Pbb7R6Ll7oupLvGIA4ETsOKcyMONxp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvmTLhrNQdoxsVY7cOp7xkjuWq9UJXVMVh4BepS3mL4grDjG8daDQthkXmVgl+iA8SzSx52nG36rO9Gmcp9ycpuTbzzi5Pnjg6RvpNW/f11SvIHBowiGW3yn1RkqEUu4qCDgDG7ftqFT5GILtsjq5yZanSTaMfk9/P5R85pR2Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDEAQZQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwV/WUc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vklN298205
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mI8JsvkCWbUtybIpN7KrpTpvNzXXdNs0urBy1XU4Yo=; b=EDEAQZQjg6z7fe+E
	pvQHo70NEtCy3aWZHHiAWUw7xEFOc33DbUKQinzNYdkgAmKDCVBpFphFbTqPr4rg
	0AjQTph4C2EsX72ck8ZD3Q/ndOw5TMI89ljRRdNDGTvz9U0YNBBeqtUq453MztnY
	4OEIhFRYpyTRNRo2YnkOGUqCy/JXVkhdkya/YLCmBa0Rssl1fmxWmjKyq2PedyZj
	fSxfm215nyGF/P22v0uufXtJmLBxzDahJdWylWS8RvEg4ZOLd0Ilz/WfEY/ZmgPz
	J4eRgsTlPR1eLB1vbq/W29bc+H/OVXPEAQSIaunJdQUYnw/Ub+fVKm2QiSU6b3ss
	P5wsCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajd4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914c5911be1so923846785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964885; x=1780569685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mI8JsvkCWbUtybIpN7KrpTpvNzXXdNs0urBy1XU4Yo=;
        b=KwV/WUc0KoxWqPRkKKcayJ+q8gwhwHO1YsvNYpaHdrEw6zQm+9ySS4NAXrUlqgRAwh
         N5nmkWu5B6nYSiq1NAKmddNOqb0EwtDC4D7XD6SbvGSW4nFQkAOY9Hr5/8StVrDqqpw3
         d8B4aC/ooG7fmjg7vHppfdjpCA4s7tHmWS1J2m/eehLESybraHsTZfKt6Jh05nbUHPwa
         fJLu150QNr2QsvHT5bM9KJ8/IQ+JTryGfxuEh+uJgF7EjrZTjPWNaG/2JxSwOGdYZ3z+
         hgR5QhIDvpH8JKF8cFzt18l0VzvxiMtHXtpBbQ3eNbk5pPBNvJINfXiXtEQHPx5FNRd8
         47Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964885; x=1780569685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6mI8JsvkCWbUtybIpN7KrpTpvNzXXdNs0urBy1XU4Yo=;
        b=hbrIy6P5XHg8vJFD88/dIXOAC184eCZ65FX2d9O/D/IaAl1Nns5ekROur7H2JgNVtj
         PVXFyujK3cbNpeXA20ZqG2q64fIxdyyWiiLUveTG6BTrdH9Pzgdd3Fsdmi4rtap9jjle
         bhVB3rozTVAypZnX44pvhuKwwH3vAZ77e+sj1HXGtbpBOl9xDI+BoysXHmKKN9xkRPmS
         aDdrhDRRbDRzdG1e5v6/Tf97vHCOKy9vNs4GqXAhEkW2Nq83BntLJDhTGY7wMa8E9CD6
         K5schEZ0mBqfQfU3jluwuLiOwD2/SfliBK8ZEGXa8FLpuRgNrhCCoHKNO56evWmCqmg0
         Eyww==
X-Gm-Message-State: AOJu0YyAZanSAbKcvDcX22RA7CDx5WVdrZ241nbk0QBrm26sH51YDwbA
	GuqR/5LkdDpv1eice1tJyX0m/6+6yfSoBrx8WeCZ++UXxfvRLirzlNQtDmIPJ+x3VttcUWdgRcI
	kfAkNd6tEUo9xfCiSrU05KgIXjq1mLBJnDb4hAOsuHg+hAvNn/JeLsffDWb6LP0p7UoBc
X-Gm-Gg: Acq92OGcpdnlW1hgEjUNNdp+Ot8ABonKhgft2/Dg6lJX6vv73y/q21Lv6fcDP8hniSo
	gKltbiHQHh83SBcNx595siOXCOtTDZDfF7EtdDFTfA0mkc7z7lEJFwfc3baICuHSteFDes3Woie
	lfCOji8hNW15lvZnPOv5Oqf61EJaYZeiifqeHqF104vXCKfP5ccIgK+MwyqWUgkHXVj/QV52msZ
	ka3pkLUsSJPxCxr1L543vuSwOk9uN36t8DkPosCfU6nRvZq2rWESfdzBI7bhe5TppGXGvHscPDj
	VSpGZVUHl0ewWFq4X+FTbV5Rp5/a5LQYDIr+p0c6yxSFY6y5/w6q1niXwq8I3otalZCjE5x+Cwh
	/+SAzghStlLf9BK6dnekSbPUsZQ6wvOo9ssG2gtnvyLwn9rrR1508OJsZcuAXlN2szHDekBhGiU
	yLKeYk+m0PdbYymsJCtQ==
X-Received: by 2002:a05:620a:28c7:b0:910:5637:4bec with SMTP id af79cd13be357-914b4934cf2mr3847195185a.18.1779964884992;
        Thu, 28 May 2026 03:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:910:5637:4bec with SMTP id af79cd13be357-914b4934cf2mr3847190685a.18.1779964884317;
        Thu, 28 May 2026 03:41:24 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:31 +0800
Subject: [PATCH v5 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use any
 panel passed to it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-10-a9221c1f1f3b@oss.qualcomm.com>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
In-Reply-To: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=33892;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=8/8LooZwWgPPghT2mI3S9zzc0GNWDnUD38pfvxW4quI=;
 b=f11dU29d7L3bYNh+w0pastx0ip19bdJA4R94g6FFK6JIesoXtq71jKbf4eHwTjNA6dH58HsiT
 D7L/RdYXu4yAF+i1/7rNxCA2KpyC9Ip9jJtAdfyA6ngbLaextzWyRzy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: mMvzpmyCbG4rnnHyGPxWRlxx-CTcWivs
X-Proofpoint-ORIG-GUID: mMvzpmyCbG4rnnHyGPxWRlxx-CTcWivs
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a181bd5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=w4GrZRm1diViJbqs1voA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfXxIutQsIU2t2q
 7WevX34ekpym5jbBySsfQYWOsLpzGjcVUv/OOzzEqBJFtVUJfSB6ZRd1AJP2Ft2U73vJ/d4LbAu
 IpVeTpAxFVGkaayA3bku+jT/8t449CTPCUL/vdmvb48AQ0MZ212tHvIFfXrpQ3q1x6kK910iOJN
 0Qhr342gRdn0MeEd+tNf4HtiuxydTLPRU1delpEqWLA05sDB5bNbD1P8iJ1/oK44Q6x8ZTWw/Ll
 f11qJHLO7fK6NWDHDoeY38S79BpuYD5W54620jK0LCsFMKHKamx/qNOL235kX//g4LldZCr4kRA
 dKD/vPokwMseNiAeOntQ+HUsdMH5zfsKz5EJ5PZ9sZ5SJa++OWBp2JtEpYBy0WeMRpJWmBf0Fm0
 0Jm645tL9bGyv+PTfZtSFuQFwGhh/eth6hw5hoMvniYBoOk9LjLr+QcHDwXoDKuPDAmJ/zIhF96
 BLnp2/X/gQ5MkPAFnxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F3505F0E0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

With MST, multiple sinks share a single DP controller, so a cached
panel in msm_dp_ctrl_private can no longer represent the per-stream
sink. Drop the cache and pass panel explicitly to all stream-related
dp_ctrl APIs.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 208 ++++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 +++--
 drivers/gpu/drm/msm/dp/dp_display.c |  24 ++---
 3 files changed, 146 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index fcce67df4660..88b6f4b8a598 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -114,7 +114,6 @@ struct msm_dp_ctrl_private {
 	struct drm_device *drm_dev;
 	struct device *dev;
 	struct drm_dp_aux *aux;
-	struct msm_dp_panel *panel;
 	struct msm_dp_link *link;
 	void __iomem *ahb_base;
 	void __iomem *link_base;
@@ -202,7 +201,8 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -219,7 +219,7 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (!ctrl->hw_revision) {
 		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
-		ctrl->panel->hw_revision = ctrl->hw_revision;
+		panel->hw_revision = ctrl->hw_revision;
 	}
 }
 
@@ -389,7 +389,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 }
 
 static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
-					    struct msm_dp_panel *msm_dp_panel)
+					    struct msm_dp_panel *panel)
 {
 	u32 config = 0, tbd;
 
@@ -399,15 +399,15 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	 */
 	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
 
-	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
 
 	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-					      msm_dp_panel->msm_dp_mode.bpp);
+					      panel->msm_dp_mode.bpp);
 
 	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
 
-	if (msm_dp_panel->psr_cap.version)
+	if (panel->psr_cap.version)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
@@ -415,10 +415,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
 
-static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl,
+					 struct msm_dp_panel *panel)
 {
 	u32 config = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
@@ -460,12 +461,12 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
-					   struct msm_dp_panel *msm_dp_panel)
+					   struct msm_dp_panel *panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
-							  msm_dp_panel->msm_dp_mode.bpp);
+							  panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -481,13 +482,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, panel);
 
-	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
+	msm_dp_ctrl_config_misc1_misc0(ctrl, panel);
 
-	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
+	msm_dp_panel_timing_cfg(panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -1257,20 +1259,21 @@ static void _dp_ctrl_calc_tu(struct msm_dp_ctrl_private *ctrl,
 }
 
 static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
+		struct msm_dp_panel *panel,
 		struct msm_dp_vc_tu_mapping_table *tu_table)
 {
 	struct msm_dp_tu_calc_input in;
-	struct drm_display_mode *drm_mode;
+	const struct drm_display_mode *drm_mode;
 
-	drm_mode = &ctrl->panel->msm_dp_mode.drm_mode;
+	drm_mode = &panel->msm_dp_mode.drm_mode;
 
 	in.lclk = ctrl->link->link_params.rate / 1000;
 	in.pclk_khz = drm_mode->clock;
 	in.hactive = drm_mode->hdisplay;
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
-	in.bpp = ctrl->panel->msm_dp_mode.bpp;
-	in.pixel_enc = ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
+	in.bpp = panel->msm_dp_mode.bpp;
+	in.pixel_enc = panel->msm_dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -1280,14 +1283,15 @@ static void msm_dp_ctrl_calc_tu_parameters(struct msm_dp_ctrl_private *ctrl,
 	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
 }
 
-static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel)
 {
 	u32 msm_dp_tu = 0x0;
 	u32 valid_boundary = 0x0;
 	u32 valid_boundary2 = 0x0;
 	struct msm_dp_vc_tu_mapping_table tu_calc_table;
 
-	msm_dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
+	msm_dp_ctrl_calc_tu_parameters(ctrl, panel, &tu_calc_table);
 
 	msm_dp_tu |= tu_calc_table.tu_size_minus1;
 	valid_boundary |= tu_calc_table.valid_boundary_link;
@@ -1439,6 +1443,7 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1447,7 +1452,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	int const maximum_retries = 4;
 
 	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
-						    ctrl->panel->dpcd, dp_phy, false);
+						    panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
@@ -1533,14 +1538,15 @@ static int msm_dp_ctrl_link_rate_down_shift(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *panel)
 {
 
 	if (ctrl->link->link_params.num_lanes == 1)
 		return -1;
 
 	ctrl->link->link_params.num_lanes /= 2;
-	ctrl->link->link_params.rate = ctrl->panel->link_info.rate;
+	ctrl->link->link_params.rate = panel->link_info.rate;
 
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
@@ -1549,6 +1555,7 @@ static int msm_dp_ctrl_link_lane_down_shift(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
+					       struct msm_dp_panel *panel,
 					       enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1556,11 +1563,12 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE, dp_phy);
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 	fsleep(delay_us);
 }
 
 static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step, enum drm_dp_phy dp_phy)
 {
 	int delay_us;
@@ -1571,16 +1579,16 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
-						ctrl->panel->dpcd, dp_phy, false);
+						panel->dpcd, dp_phy, false);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
-	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
+	if (drm_dp_tps4_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_4;
 		state_ctrl_bit = 4;
-	} else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
+	} else if (drm_dp_tps3_supported(panel->dpcd)) {
 		pattern = DP_TRAINING_PATTERN_3;
 		state_ctrl_bit = 3;
 	} else {
@@ -1617,18 +1625,19 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
+				      struct msm_dp_panel *panel,
 				      int *training_step, enum drm_dp_phy dp_phy)
 {
 	int ret;
 
-	ret = msm_dp_ctrl_link_train_1(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_1(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #1 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
 	}
 	drm_dbg_dp(ctrl->drm_dev, "link training #1 on phy %d successful\n", dp_phy);
 
-	ret = msm_dp_ctrl_link_train_2(ctrl, training_step, dp_phy);
+	ret = msm_dp_ctrl_link_train_2(ctrl, panel, training_step, dp_phy);
 	if (ret) {
 		DRM_ERROR("link training #2 on phy %d failed. ret=%d\n", dp_phy, ret);
 		return ret;
@@ -1639,16 +1648,17 @@ static int msm_dp_ctrl_link_train_1_2(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int i;
 	int ret = 0;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 	u8 encoding[] = { 0, DP_SET_ANSI_8B10B };
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -1671,8 +1681,8 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	for (i = ctrl->link->lttpr_count - 1; i >= 0; i--) {
 		enum drm_dp_phy dp_phy = DP_PHY_LTTPR(i);
 
-		ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, dp_phy);
-		msm_dp_ctrl_clear_training_pattern(ctrl, dp_phy);
+		ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, dp_phy);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, dp_phy);
 
 		if (ret)
 			break;
@@ -1683,7 +1693,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 		goto end;
 	}
 
-	ret = msm_dp_ctrl_link_train_1_2(ctrl, training_step, DP_PHY_DPRX);
+	ret = msm_dp_ctrl_link_train_1_2(ctrl, panel, training_step, DP_PHY_DPRX);
 	if (ret) {
 		DRM_ERROR("link training on sink failed. ret=%d\n", ret);
 		goto end;
@@ -1696,6 +1706,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 }
 
 static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
+			struct msm_dp_panel *panel,
 			int *training_step)
 {
 	int ret = 0;
@@ -1711,7 +1722,7 @@ static int msm_dp_ctrl_setup_main_link(struct msm_dp_ctrl_private *ctrl,
 	 * a link training pattern, we have to first do soft reset.
 	 */
 
-	ret = msm_dp_ctrl_link_train(ctrl, training_step);
+	ret = msm_dp_ctrl_link_train(ctrl, panel, training_step);
 
 	return ret;
 }
@@ -1810,11 +1821,12 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 		   str_on_off(ctrl->core_clks_on));
 }
 
-static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
+					      struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	struct phy *phy = ctrl->phy;
-	const u8 *dpcd = ctrl->panel->dpcd;
+	const u8 *dpcd = panel->dpcd;
 
 	ctrl->phy_opts.dp.lanes = ctrl->link->link_params.num_lanes;
 	ctrl->phy_opts.dp.link_rate = ctrl->link->link_params.rate / 100;
@@ -1866,13 +1878,14 @@ static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 	u32 cfg;
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/* enable PSR1 function */
@@ -1887,12 +1900,13 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enter)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (!ctrl->panel->psr_cap.version)
+	if (!panel->psr_cap.version)
 		return;
 
 	/*
@@ -1962,7 +1976,8 @@ void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_exit(phy);
 }
 
-static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy = ctrl->phy;
 	int ret = 0;
@@ -1983,7 +1998,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
-	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (ret) {
 		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
 		return ret;
@@ -1992,7 +2007,8 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
+					     struct msm_dp_panel *panel)
 {
 	struct phy *phy;
 
@@ -2000,7 +2016,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2014,7 +2030,8 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 	return 0;
 }
 
-static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl,
+					struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	int training_step = DP_TRAINING_NONE;
@@ -2024,11 +2041,11 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 	ctrl->link->phy_params.p_level = 0;
 	ctrl->link->phy_params.v_level = 0;
 
-	ret = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	ret = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 	if (ret)
 		goto end;
 
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2208,7 +2225,8 @@ static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
 	}
 }
 
-static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
+						struct msm_dp_panel *panel)
 {
 	int ret;
 	unsigned long pixel_rate;
@@ -2224,15 +2242,15 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	 * running. Add the global reset just before disabling the
 	 * link clocks and core clocks.
 	 */
-	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_off(&ctrl->msm_dp_ctrl, panel);
 
-	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
+	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
 	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
 		return ret;
 	}
 
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
@@ -2240,7 +2258,8 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	return 0;
 }
 
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 sink_request = 0x0;
@@ -2255,14 +2274,14 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
 		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
-		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
+		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel)) {
 			DRM_ERROR("process phy_test_req failed\n");
 			return;
 		}
 	}
 
 	if (sink_request & DP_LINK_STATUS_UPDATED) {
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2270,7 +2289,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	if (sink_request & DP_TEST_LINK_TRAINING) {
 		msm_dp_link_send_test_response(ctrl->link);
-		if (msm_dp_ctrl_link_maintenance(ctrl)) {
+		if (msm_dp_ctrl_link_maintenance(ctrl, panel)) {
 			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
 			return;
 		}
@@ -2306,7 +2325,8 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel)
 {
 	int rc = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2322,8 +2342,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	rate = ctrl->panel->link_info.rate;
-	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	rate = panel->link_info.rate;
+	pixel_rate = panel->msm_dp_mode.drm_mode.clock;
 
 	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
 
@@ -2335,8 +2355,8 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	} else {
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
-			ctrl->panel->link_info.num_lanes;
-		if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+			panel->link_info.num_lanes;
+		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
 			pixel_rate >>= 1;
 	}
 
@@ -2344,13 +2364,13 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		ctrl->link->link_params.rate, ctrl->link->link_params.num_lanes,
 		pixel_rate);
 
-	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+	rc = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 	if (rc)
 		return rc;
 
 	while (--link_train_max_retries) {
 		training_step = DP_TRAINING_NONE;
-		rc = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+		rc = msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 		if (rc == 0) {
 			/* training completed successfully */
 			break;
@@ -2369,7 +2389,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					 * some lanes are ready,
 					 * reduce lane number
 					 */
-					rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+					rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 					if (rc < 0) { /* lane == 1 already */
 						/* end with failure */
 						break;
@@ -2390,7 +2410,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 					ctrl->link->link_params.num_lanes))
 				rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			else
-				rc = msm_dp_ctrl_link_lane_down_shift(ctrl);
+				rc = msm_dp_ctrl_link_lane_down_shift(ctrl, panel);
 
 			if (rc < 0) {
 				/* end with failure */
@@ -2398,10 +2418,10 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 
 			/* stop link training before start re training  */
-			msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+			msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 		}
 
-		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl);
+		rc = msm_dp_ctrl_reinitialize_mainlink(ctrl, panel);
 		if (rc) {
 			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n", rc);
 			break;
@@ -2422,20 +2442,21 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 		 * link training failed
 		 * end txing train pattern here
 		 */
-		msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+		msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
-		msm_dp_ctrl_deinitialize_mainlink(ctrl);
+		msm_dp_ctrl_deinitialize_mainlink(ctrl, panel);
 		rc = -ECONNRESET;
 	}
 
 	return rc;
 }
 
-static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
+static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl,
+				    struct msm_dp_panel *panel)
 {
 	int training_step = DP_TRAINING_NONE;
 
-	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
+	return msm_dp_ctrl_setup_main_link(ctrl, panel, &training_step);
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
@@ -2506,7 +2527,9 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train)
 {
 	int ret = 0;
 	struct msm_dp_ctrl_private *ctrl;
@@ -2525,7 +2548,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
 
 	if (!ctrl->link_clks_on) { /* link clk is off */
-		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
+		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl, panel);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
 			return ret;
@@ -2533,15 +2556,15 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
 	}
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
-		msm_dp_ctrl_link_retrain(ctrl);
+		msm_dp_ctrl_link_retrain(ctrl, panel);
 
 	/* stop txing train pattern to end link training */
-	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
+	msm_dp_ctrl_clear_training_pattern(ctrl, panel, DP_PHY_DPRX);
 
 	return ret;
 }
 
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel)
 {
 	int ret = 0;
 	bool mainlink_ready = false;
@@ -2554,10 +2577,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
+	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
 	pixel_rate = pixel_rate_orig;
 
-	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
+	if (msm_dp_ctrl->wide_bus_en || panel->msm_dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
@@ -2574,18 +2597,18 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
-	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl, panel);
 
-	msm_dp_ctrl_configure_source_params(ctrl);
+	msm_dp_ctrl_configure_source_params(ctrl, panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
-		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
+		panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_panel_clear_dsc_dto(ctrl->panel);
+	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl);
+	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
@@ -2613,7 +2636,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_init(phy);
 }
 
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2621,11 +2645,11 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
+	msm_dp_panel_disable_vsc_sdp(panel);
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl, panel);
 
 	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
@@ -2634,7 +2658,8 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy_power_off(phy);
 }
 
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	u32 isr;
@@ -2645,7 +2670,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
-	if (ctrl->panel->psr_cap.version) {
+	if (panel->psr_cap.version) {
 		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
@@ -2734,7 +2759,7 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 }
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
-			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
+			struct drm_dp_aux *aux,
 			struct phy *phy,
 			void __iomem *ahb_base,
 			void __iomem *link_base)
@@ -2742,7 +2767,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
-	if (!dev || !panel || !aux || !link) {
+	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -2770,7 +2795,6 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	init_completion(&ctrl->video_comp);
 
 	/* in parameters */
-	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
 	ctrl->dev      = dev;
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5d615f50d13b..00b430392a52 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -16,28 +16,36 @@ struct msm_dp_ctrl {
 
 struct phy;
 
-int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
-int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
+int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
+			struct msm_dp_panel *panel);
+int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
+int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
+				  struct msm_dp_panel *panel,
+				  bool force_link_train);
+void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl,
+		     struct msm_dp_panel *panel);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
-irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
-void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
+irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
+void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
+				     struct msm_dp_panel *panel);
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
 				    struct msm_dp_link *link,
-				    struct msm_dp_panel *panel,
 				    struct drm_dp_aux *aux,
 				    struct phy *phy,
 				    void __iomem *ahb_base,
 				    void __iomem *link_base);
 
-void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl,
+		       struct msm_dp_panel *panel);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 
-void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
-void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			 struct msm_dp_panel *panel, bool enable);
+void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
+			    struct msm_dp_panel *panel);
 
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b8dab3f8a7c2..230e14615a23 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -359,7 +359,7 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
@@ -371,7 +371,7 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_reset(dp->ctrl, dp->panel);
 	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
@@ -392,7 +392,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
 
-	msm_dp_ctrl_handle_sink_request(dp->ctrl);
+	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
 
 	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
 		msm_dp_display_handle_video_request(dp);
@@ -570,7 +570,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
+	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->aux,
 			       phy, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
@@ -642,12 +642,12 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 		force_link_train = true;
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
+	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
 	if (rc)
 		DRM_ERROR("Failed link training (rc=%d)\n", rc);
 	// TODO: schedule drm_connector_set_link_status_property()
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp)
@@ -661,7 +661,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -686,7 +686,7 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
 	if (msm_dp_display->psr_supported)
-		msm_dp_ctrl_config_psr(dp->ctrl);
+		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel);
 
 	return 0;
 }
@@ -725,7 +725,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 		/* set dongle to D3 (power off) mode */
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
@@ -733,7 +733,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 		 * unplugged interrupt
 		 * dongle unplugged out of DUT
 		 */
-		msm_dp_ctrl_off(dp->ctrl);
+		msm_dp_ctrl_off(dp->ctrl, dp->panel);
 		msm_dp_display_host_phy_exit(dp);
 	}
 
@@ -869,7 +869,7 @@ void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
 	}
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_ctrl_set_psr(dp->ctrl, enter);
+	msm_dp_ctrl_set_psr(dp->ctrl, dp->panel, enter);
 }
 
 /**
@@ -979,7 +979,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	}
 
 	/* DP controller isr */
-	ret |= msm_dp_ctrl_isr(dp->ctrl);
+	ret |= msm_dp_ctrl_isr(dp->ctrl, dp->panel);
 
 	return ret;
 }

-- 
2.43.0


