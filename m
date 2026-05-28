Return-Path: <linux-arm-msm+bounces-110096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ey3D1ccGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9F35F0CED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2F2F3093526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC373BE15D;
	Thu, 28 May 2026 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzSF8HuN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggB4A7lB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DB3BE623
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964883; cv=none; b=NhC19oMCzHfZuWZPQfBnDqISMRcID6uzHoxkb7Z0PspH77Cn2+Qa81p3ey8eYiGMlkMuNEIC89O98iJbPrIxmr6Gbv7CoKPGfpVR1P/KU3uEGdYbTFL0BgtwmpO0hxVKCgoOkV6rG/UOPCmOEqSJ86UJ7XPHf1erS5nwVTD8UVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964883; c=relaxed/simple;
	bh=kqMysOhRIN6JiSma34nTkzWoYUmxkKT0/ASFE6VqJ64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCD61LFCXtN2xL2AsewXuiSSF51j4rBPn6IvAFraJNPrIBwPeK11b92V8PribyAM9hRy7kTu75Tdp+fcGPpMA5/N95vua1+l+NcUzTgKX5/UihfaR0vSxUL8gL/4fxNBalqYb5cd9XTks/gETyCN6zII9BUb0KW4dBdY7FHASsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzSF8HuN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggB4A7lB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vaT14016473
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toiQ8+ElWmOZI++E+BWr1iSCUEgENnEGEvNlwdrGuBY=; b=VzSF8HuN32O5gLPg
	bvn75tUrx+BeVRFuR+eOgBmhStHy3CHaruxwyOEHXD+03JLOXCz2AJDz8npLHWO+
	AzRgQ/FWm9ksou8NLhMM9YfL2o3upUCVk6pyeoKYCc7nuIo+VQcuh2A7NPOrv40S
	AFSSGQ1YtO8AEz9bElhctWZzkkb2QHJLM5NEAHW713o9k78WlKDtwnMEmA0CMi1B
	zKesx678rmFzTfyCFVK1QnTTPB9ZdJE796sn2cUxkHtiNe7nNetPiQuQMC0kfsKA
	X/xpT6GoSS0hM9SciwbAm3jQ2m5okkC6pK/HeGi0WqZepOA/KDjI5AoGGm6ASEW1
	UY4fpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y5adg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914d0204c67so993598885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964880; x=1780569680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toiQ8+ElWmOZI++E+BWr1iSCUEgENnEGEvNlwdrGuBY=;
        b=ggB4A7lBRa3v3jh69lm6JhnoNFfRsoWmbGUqtxobhAB/wzjsDrjUKeow8NRMRbuq/g
         aum1wkKZ7TU7K7/UQtxDweiYfo+qNyap5JnIIxQ+WhvvYconbye91kjwVrg0LKKvjaMW
         pu1jACb/0vrxuuSeEFEAmGJYscJphpRPLl5eoe+Esja5ui7WhruKYv0KSX433mj90IWS
         YVQM008rMUwJ38EDORZEJQmy2Eb7DVioOviJJxruialZh9kdoZE7Zldk1J72Eu64Pe+R
         P+0/ZyooGKEhcRfqLhWHy1jx+RPY+eiv2hDTFAsbuSbyqt7/+foN3eLKsyVT9/au+4hS
         PDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964880; x=1780569680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toiQ8+ElWmOZI++E+BWr1iSCUEgENnEGEvNlwdrGuBY=;
        b=R1+LD2f9EeSRvnHvlrOhvhn8UV1JWUYsiaSwuPp3SNkw5Zj7B8/YZyCyfs4l2mvUWm
         LLlcGxQWIBbb3D/7R7mo+tAAqDrDi7gwkGAq93HjgjTrYEjsrOIC74hAP6HUYjSPXoyh
         ZUxkm+uyKhWM3tjxT5fb7dpgAQeNFljf41O4o6Y6GDdmIjsZ77v+xH0NRfkBGcMhKWst
         7wVkMwBtT7mZvXWna5ZKuYHb4pAbo7X5CaE4VqR8KWzRj58DByTOtonwAhRkmFSpnSq4
         xYJ+VuQ4If9OUNynAhVXvcRSuIeU/g9JCtJpiBvkn0wVS9f4SLbXfSFmKJHsKfWme6eh
         zNjw==
X-Gm-Message-State: AOJu0YyVHOBK74cTz4zeB3SAq554XpUnOX9+LM6IS+RbS9fAiSLoHT0X
	i27CbNfh3vK/LqIpNFjeCEn3bc/D9Ik9aoKvicGGgiwFdVVI37VF3kaPvFhUjH1jZisxDpU3Ck+
	NGLiZzq1tyowTmu1w82MQfGbKd+A7xrYYpp/IbmJnHqJVo5j39aIl8M0Vp57To+0isjpc
X-Gm-Gg: Acq92OGGSpUZSq59uGekJoJR0Y4vkgvkmMKotJVjMuGAAgIsyTavfGTM01V/c5Mfedg
	3yTgyv8/u5VLmBFGZaWYM7R9MReZoS+IHkD5hZcs3N7v82ZAEZep7x5kzmZXap5c/9hsNwuKi5O
	JJH7PjSTjpsweZZBpLZoQkjHwebVtGkqOTLJ7l7uX5K9drSbZ/Iu7hWeWwlz8LEjGcQwA7ixOct
	zqIP0HlqgstuEUbKWaagePFiDZx4nuUiAAgZJmt7EjRpK2mplPIjVR+QSIA7W19xHGgYRixwhE4
	vsha6rWb57A7qUYy6DZRR1+JVFt7YWhAJmVPDHvkRBi6Xz3CmnzMjw9nt2w3FOAB6fpWPNvwUUC
	F/Vs1rN//fEs1gMDkUaBnu0fYtz9X17Jn5UE5lzhIZYIqT8eJi3VmzNsq0HPZ/REp26lgzbkiXo
	onAP/nmh35L+6tzUdbPA==
X-Received: by 2002:a05:620a:40c6:b0:914:e3ff:e89a with SMTP id af79cd13be357-914e3ffec5emr2014203185a.44.1779964879794;
        Thu, 28 May 2026 03:41:19 -0700 (PDT)
X-Received: by 2002:a05:620a:40c6:b0:914:e3ff:e89a with SMTP id af79cd13be357-914e3ffec5emr2014200685a.44.1779964879329;
        Thu, 28 May 2026 03:41:19 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:30 +0800
Subject: [PATCH v5 09/15] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-9-a9221c1f1f3b@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3890;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Gg4tv21+td583ahpOswrb0tuTDaAio5HpF6DslP1vNA=;
 b=sx9y/gqDawpFRVhXuuTJ/PCPoqxJ9NvxKy22y7ghmDb6hM7tJFuIopZfqoq8Ktkk4XNad3s3C
 QKubjTq3H1JDrVvOXWm9gaJO0XEnWKdgU+mpv43JolLNXIEXzCqpkuy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a181bd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7LH33tsxRIP6uNRhSrAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: v4GbVwu8v5BGTn4aznIJru7HlWb60rB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfX5/JZpsM6jl3k
 BAhjE5KY/8ZRZhtPrY0MiXynw+8Od9acjNdMolTLMnt6nQsv3jmQMFjBIC4ZFKHuwonMMFD2p/o
 bX60LwFNvuqRhQMokDpq0zNfntvkHegUVsSOBcWbZ6/BEZ3xSTszjjxgmkqt3qaIBVhQaHz/Gb+
 C87awjkj4hdr2eLhRCQkRFkw/qz2495jcENf9QZTx7a2UGbN8Jv2FLfVsklnG3dcIMCwMrZhLSe
 //N6kuxKUcL4CeOM1xNcFHAS2uftKYhy8TnbxXWfK1p08VAXr+qb2vEV/uaTCb5lBQEHtjgVQ3Z
 XF/ZYkFNyAM6j4Wysdul2JSZxc6kzG7UagbJD/pARBCrpgBXQPaA7RitguLy9Aw4KOi5e64IPI9
 DeuhPjEdsDqVwF8YNu1dPCbxIKh9fWa9Mg0ngq0sz4EJuH5lP85wITN/2OAUuanDRY25KbaDWgY
 nR6v3ga0y7V9Na8usVA==
X-Proofpoint-GUID: v4GbVwu8v5BGTn4aznIJru7HlWb60rB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110096-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB9F35F0CED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d8297ebf7d56..fcce67df4660 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2600,7 +2600,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2608,23 +2608,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f..5d615f50d13b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,5 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cf859f880943..b8dab3f8a7c2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -714,12 +714,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.43.0


