Return-Path: <linux-arm-msm+bounces-102654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGXtIGfG2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:44:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A3F3D51E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D4433053A95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252743C5DA6;
	Fri, 10 Apr 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLwneB/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYGruW61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA5C3B3C08
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813791; cv=none; b=jKu7B9ZBBEth4e2r9xw4/81uVNeN5OWcfoxCE4irLAwP4mGXiusyN3CTcQHtiwNEUtbw3nME/G7Aa3ArrlGOUgTPz1XyANk3hiwNTTzKkFosuQTPc39slqCyKBVwmvYfZwdskIM7KT7xMixJHcJjIeIFqs421cI9JlewzT2GFXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813791; c=relaxed/simple;
	bh=0SRrv+FxL8qkWFHKN4JQjVFRw38qXcyyamUUeTeLiXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EARgE8wicq89pQTBU3rpmWWAootXOn/+TMD/xYF+TIxmWAQgC5xjFKQl6IRaMoLMa+DSwh11M2kIEtcExEjBc3uJGZvS36NGZiQot3RR5TbD+Gfv2H+RcDQhrpGJRtNlHQVRpeO52r9zRgZgqdzlcke+v5LFU1fu7JT+pARpEXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLwneB/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYGruW61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5tmfm2866413
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	suciv5ycZtwqHNXye/yopkUYEmvYPaNYsbC0MiFy4JQ=; b=LLwneB/FbMUtauz7
	lRXdIGUXqW8fjtOIs5JXdIt1j0e4jhc7YELBTfnwdHnfilyeqD3EjFwdDBUW+/HV
	JvsuGZpvgNaymW+C7j4U8Ts13rFniYP1UVXlUJMmVBNHTWQaiAyNrm0HV3zE5+pO
	vKO6b+1olcwJV3Vv2+Nr9ykrRyqopUW/l9sjgewq85CsmqUjPbe4gEbctdyPAVcB
	MmcabUKY/gXIKjkvcAJi/hV5G6xlIxCAm6GOhFPgeqGnFICiiMyOQIiZjsBhziCP
	mzX/skWy6KLCvo6LycsKuQ8ZBfkNQ4OdXUeLTby3hjFsE2Nz+P+4mXB223YPwkKK
	gfW8nQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykt6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ac566014e0so51993556d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813788; x=1776418588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suciv5ycZtwqHNXye/yopkUYEmvYPaNYsbC0MiFy4JQ=;
        b=YYGruW61/JJL4Man2XWhwGLo+d1a/hqrcxQ60jrgHxy0qHTz2+Eju6OQC8dFWoaxmo
         MtKd4rWClJZMPdlVXhTuZZVxIOm4et9x3ZZBd/+IDn3gt1ClOY3SzIJoEodpMwyKX2ox
         8iQy+U76bf7GgN2Y1BgOLamWVh8ys02l1KFLKYyhpuvzng0buGVdWzLB0Y6BSb+oip+f
         2T5rWgfXEBXz4ZDPguerSRZpxUAIUgrmFM5icc7bAlsBSIPKg/u49yYd9JeCy+WNiZwi
         /Qo4NsY1f83PqGZ24VLxgGGCoNvPgEAsLEwgAlLjR2AXeXgbAOutQ1WU1QUPfFnSPot6
         GzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813788; x=1776418588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suciv5ycZtwqHNXye/yopkUYEmvYPaNYsbC0MiFy4JQ=;
        b=Fb+w0j+KWjtKzAfVKpCdByit2pmZmLFPdODOExZ/K8jzGfRsL+3XWrhMc/wQVxfn39
         RFVYNEzZ840UpKD2Sg8JbnRjfYrVrRVbZIRirSr0gScuYYjqDAnhy+mHsXEWjOnSnYgF
         tS+vZQZ1t4e+gidh7jqippdWHjxRWZwbWPzQLhcE9jxXi91kIC/KlXy0nXlMYyS4SQdz
         ZfLb9NhlA3YjL2YAkci3cGsAoPWdA/7USjZ7aMMdVTlqSqJiJ/kdvbhXa2vaNV8eKNV8
         OYlWy8eyomggzIFVXEufsSb85Ij0T+ieu1Sg1jb/Lc4tsgy9mBWBNuQHyj3dj6RkS+gy
         1uSg==
X-Gm-Message-State: AOJu0YxSG2MAmrXerGXxyXXMzeJs6LKv1KGXpEkuGNTkJJSIy/Yk17vv
	M/NGmQp/L/dIfYcMj32hoV8io/bpSuu6MnFNP6fYH+XqFFymTeiIzcdDA1YuFCuQbiDc9ww0xZG
	B9Xcsh3DWN9sJuohX/TRK2EHnmGDEdU3G4VT6m7fpXHD3On966oT14eXMDdef+S+G3bmXHketmS
	R3jqgVxA==
X-Gm-Gg: AeBDietkqKsRI0mg6pvO3jQ/7uyS+uEj7mL9gRFy8CvLoeLSCRdnRDqOsu/m2Ik/Xjw
	MyBieJ4IJlque8uJ6d3U/FDf3AU+3OCFp9oSBGA1boyMyas6isYqnYplMKRH1JuyqQqKdkwynr/
	EVWc8AjNFT8inNBUpC9X7iJDsZaFcnUxjEGWYk7WOHA2wig2wJflVx/avk5hd+FYq1d2taqktfJ
	TvsyzScRKphSh14a5OH79hUE9gTLkbUcZLhYNZ2mtUWeaLKEcA2upxiw7uqXIDruVylyCEdNbZB
	v2Pu44V3QqNKhICJqigGa8/PpqxPPLy+n7HhOjfjbT9V7MKogCf3hpImV/8pNug8uT1aLj/IXVA
	BD+y0pR0kvblB36NRBHzX7WkdKbztu5q3L7MD2XZedH4t74oUZMPKLpNmbnfTIlpaieA7V7lT3D
	FqyO1mrdk=
X-Received: by 2002:a05:6214:c2b:b0:8ac:8337:ca08 with SMTP id 6a1803df08f44-8ac86245532mr35195706d6.51.1775813788071;
        Fri, 10 Apr 2026 02:36:28 -0700 (PDT)
X-Received: by 2002:a05:6214:c2b:b0:8ac:8337:ca08 with SMTP id 6a1803df08f44-8ac86245532mr35195316d6.51.1775813787576;
        Fri, 10 Apr 2026 02:36:27 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:06 +0800
Subject: [PATCH v4 31/39] drm/msm/dp: add prepared to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-31-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3575;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0SRrv+FxL8qkWFHKN4JQjVFRw38qXcyyamUUeTeLiXQ=;
 b=6d5c41YJLaWP774PXbiRUaSi6hpDLZVBF9fp3dCvVjbBoHJ6jCxZ05GuXV7ZHazoEe4vypBTO
 Z0Xo2DMhypUA+vdt+2phn6uLryBin0XvB5YMh0bhYXzseoaHpiy4STj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8c49d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qXKybx3EirU-fK6T7NYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX2Y1bFPqQcNGL
 MtO0FuGHsUVOR9QubpQdF+SHxdpuiWEi4Y9QTNihZLvzxeCEBT159GBOKe5d//opkcs8sE1zSH3
 6pzPs9HadgzypfBUm5kTDTWCvENxXXDpdZbg+ejn7F/7aOSEjIN7dJnDURU6BHv2oUEW1EuqJyV
 LnG3gVaF8HwIq+2jfPo0wfJK6odIt56qeInKbfJJB0mJr53jBMGX1EeMwF17X3sSeSq1VlzVO++
 UMsprwu0Q8pifViXbflGT7G8s/ks+JJZ7jHfpggAnWoleyb6cQF2t1XbBfs75q0h4ysWRBDajno
 UFRN9RUb4/IPGQkJcf3k0CMNXqwo25HILE0A1CDppS0fHpFiLAJ1g/rL6e3T+DkfG1q3iXDQmMW
 FeXwVT+8aAoFaQLE4X61cCDgqEqeHuQwI52GtggGs0MtYZ2Xma4hIg5KU6FD0Ep4yRM2BJ+rLIt
 r3+ZAzYbZvHySsayOGg==
X-Proofpoint-GUID: vu3L87hhy4V8aqJnfN6vxyF-tllgylEz
X-Proofpoint-ORIG-GUID: vu3L87hhy4V8aqJnfN6vxyF-tllgylEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102654-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 30A3F3D51E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In MST mode, multiple streams share the same DP link. Track a prepared
state so msm_dp_display_prepare() runs only once per link and repeated
calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1f26283b2dee..9eaf6994a350 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -715,6 +715,11 @@ int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	if (msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return 0;
+	}
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -734,7 +739,11 @@ int msm_dp_display_prepare(struct msm_dp *msm_dp_display)
 		// TODO: schedule drm_connector_set_link_status_property()
 	}
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
+	if (!rc)
+		msm_dp_display->prepared = true;
+
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1590,14 +1599,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->prepared) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1646,6 +1657,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->prepared) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1664,6 +1680,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->prepared = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5f3ef295d710..bda76319c459 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -22,6 +22,7 @@ struct msm_dp {
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
+	bool prepared;
 
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;

-- 
2.43.0


