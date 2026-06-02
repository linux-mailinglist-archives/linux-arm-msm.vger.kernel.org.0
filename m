Return-Path: <linux-arm-msm+bounces-110789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK9SL3ChHmquDAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D762B6CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0568B30BD8D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756A23D1704;
	Tue,  2 Jun 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBhbMY4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQ7xDYtO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F73D6CCA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391554; cv=none; b=jkMXqMYph1Sf4zxuRYofpyx8i1J3+sEJH7dmSUPGfIlbhpQZKECrMtlABKH3mxVV3sESLu1sMrHWnkicDiHSEm1esz82peAZXnvfTRmg4ayRFO+Q3HqRK82rUpoL0Me4YYN2Vmgu9+oPThRexGu5nDH25jRQwZAxZe7muwxXo08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391554; c=relaxed/simple;
	bh=da4DiLmkH54vMKs4+UHrFXYyvX9aCG9OfWIw37ym+Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leDcSxsx61G7E5z/+bjQLpSg/utEqlRRQHHTNai8O8Q9W08XkqpBIpA3DfBdCGyrc8uJ+7xR1l+62P+2EfxC6b8lazxPB/+sluFHyGtjmvtVgzdjzHxzcQSuxsdsMZ9PlCffrvCh5hkLyLs5SARPeJfepBjyzq4u/r7+yA/gvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBhbMY4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQ7xDYtO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6527gZvO3302651
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=; b=eBhbMY4aeciroODC
	ciMEQgeG4o3hgcWsdrGbIzXENThOO9YJVvnDQqAo0ezoGf8S8Md1UWnacr/w4jWo
	JQTJG5So91z1K7YR3Vgp+J2wmP5KYffqRPQ9OYOoRJh8tkaFU7+O/TYNKA0ENib4
	h47hzLobhlqUw3xR0nKc3kxqKTaEubVPNhtXQifhskY/Pb2K/gI7kh9dDYZ35Bxe
	kCnIuaKO4xU0ItxsSVquH5ISRmr0s5yxht8bpVDsBxrKvNetcYiZqohwLECJaDpd
	+1XbNTeZMysXuCR9qCeoUdpVpbaH/YCgJCOuPYSzPWXG4dotl7znhhivOiMCtGQF
	sfEz1w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18gcjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:12:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8cebec24b12so19245336d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780391551; x=1780996351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=bQ7xDYtOu4e0DmdGrFc4XrABzx4QQ3E7+yJb1L7rN5QjaSBTF5PJuNZwzQtV6QSGdZ
         6LKx3/Vyj+RzepqaElNjLCskJzM57VNCHeGfCPpaLgGyH+XPMAzel05q0SuPzUraagIc
         XuK/Ii5aClvI/1uIKMRXgrEGd5mllAayyPRAxBTa1AvH1gWMaFdnY9+zxAdQd2l4BPQx
         6RDASSCnXFTJO+o8CLUfiD9GfVTC0p3aHsubcVoOHpTBNRi1gUPlfBNDHqYWFL+serBy
         nASDDkLM6PuMEQqRbq6UqenRF5Ge5pDOlukmPnwVsVuohgmeZVCM3YkCaemP8Y7Ya954
         Yquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780391551; x=1780996351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=IzSYRGJ4gikhIc5KVYMg9H+JE7vrVKjD2me6JCgnoLksW5g1637kbQnwuK+ewhA8nI
         Yp2vGKx2KivRpw0HJgVjptqIulchNJF5N8IRBzY61h6pemS+CdhBama5ZmCKy7j3xH8e
         4l+HsV9gvc2YxD7bdRDxQI22v6WcakoywqlKITMENxBnPEC/1YG0Nm9CtjJ5h9O9aTkh
         +XUC8BMDY4PfZUA4Pv2blmiwTkEIcH0kkiZGMLIOmPTelLvrFvYd7GQ9YjfvjdRHtS7T
         SEiYYcb48fLvXt4bHte3LH2rjg+TMvqcJ5o+0cfFLUd3mxd7NNHcvYeSkIvpc01p02Bm
         bVfQ==
X-Gm-Message-State: AOJu0YyJ8JF9mjSy/786ZuxWtdOsmIe/d3s3ffWn4bpDB2QLWYzaYaUg
	jgrcAQwJpiv95RgFnDLAy8tvYLdUIfwd1brKkfK5gvA+f6yHvc++SoSkX9/JT1Q5DtEYQLmy2KS
	EEoIN9jyhmGknlPnXQPK5q0+YvdUs8EbFKtLMEVsjFl3mKIU0OhddEgXXhzcItGC5NMAj
X-Gm-Gg: Acq92OH+wnvu7Q9fkuwApHsGrDWYi/wCEMitduLWV/bueax06gwbeeRUY5kDrB1U5l0
	A1KUW8AJZEz8CTbJDbkQu9ux1wRvu6gRbq9aqb47dh56VjqdAvHBtaApLH2qtMXRGkXtDoY4dLo
	Ff9YT5HsdxoSNwjiVF7WdxpGra4OyjEMV7/WuT6kNATwpL+tdZI5kTvlIjoe2IXjvgffr3Q06dO
	SbV4fhySuMS0BlT+G1P2ZO3dALtAbC2QZBRxwFtmomEqcG1wGcEIiVxk7d0ilyibZAlh+VDAdpK
	dN/Ptsid3bk7jiyWTS9Gl5TZAAMn11SQlayBnF1+A54mrLzPPbf/ChmJ5TZoCNR1GwhO5VHAq6o
	GeEyewWlaUIZ80d/ixACvmBG53MbGiE0uK6HcaiklsZWGpsvb61LJdxmiAC9+fuG5Ia4vIXXWjj
	Misi6Ora17HFAgUWWDKg==
X-Received: by 2002:a05:622a:a6d5:b0:516:de98:b670 with SMTP id d75a77b69052e-5173a935333mr173922351cf.39.1780391551276;
        Tue, 02 Jun 2026 02:12:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a6d5:b0:516:de98:b670 with SMTP id d75a77b69052e-5173a935333mr173922081cf.39.1780391550806;
        Tue, 02 Jun 2026 02:12:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51768c76e53sm12480851cf.4.2026.06.02.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:12:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 17:11:26 +0800
Subject: [PATCH v6 14/15] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-dp_mstclean-v6-14-2c17ff40a9b2@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780391476; l=3743;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PejPis5lPUmTa0t10X2rGcGnHfGkWszn1oUEuwhLLv0=;
 b=I+18ZOiJ7T4ONemocEPsWLpHYt0H8WenXnbhVc6cN2xPFnXd5W9vUP4XU5Q4tlH8EdE14UKkY
 WrAY17QYSsIBRzi2C83dmPZfd1OI9JGrW1Z8NpFjKazrt8mnysyNXsD
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1e9e7f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NiBTYWx0ZWRfXwIr0/QJ8UTK+
 u8GukGtOojoC1ULID12PKYhG901SS7gZ0YS/a7elF8ePeatTLKvzy7PJy7NtwMq6dV+cwIk4odZ
 rypzBV45tEgb4eB25tLoJRoRKpg0EFRo7HrY7upENKLuch5uszPLNHHAgLMvlCSF6Z4dhF2hv1f
 GuylwgMP/KcJUT7G0ErzW7vDJHJz+fXbzOUGuMTMbBosYqIu2aozPUzySJ3Zao2eeKjLnDaKl9z
 pW6BMkZTNlU1t9w4HTKpxkiQv3HiGnyTSyQPn1XG1yyz47MJrAfXN7AsbLS8pu9et6yxKEGH7Vp
 Ck/bj5nlsXWjcC812KAnJ77wBXrFdF+an0lmiSGdrggcSM+bixl7yNtpRlvHHUvYz+wde2Ju9ka
 T02jz8hnptq0z4HMuHrAWWfkkVGSaTPF7+gmxjSuMaJN7mxzaTcp2Op13J9deF1CwXqkQR9pcIy
 AxLdcAwI2GQgsfFjCaw==
X-Proofpoint-GUID: fzXCjZlb17VAe7l0sM-pkqkxzWQ-oN_o
X-Proofpoint-ORIG-GUID: fzXCjZlb17VAe7l0sM-pkqkxzWQ-oN_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020086
X-Rspamd-Queue-Id: 341D762B6CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110789-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For MST, the link setup should only be done once when multiple sinks are
enabled, while stream setup may run multiple times for each sink. Split
the link-related preparation out of msm_dp_display_atomic_enable() so it
can be called separately before the per-stream enable path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 ++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2d5ef087648c..cd1f2899b733 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1403,8 +1403,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_commit *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1426,10 +1426,16 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 	}
 
 	rc = msm_dp_display_prepare_link(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	rc = msm_dp_display_enable(dp);
 	if (rc)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 5116f7bbbd02..43ed79093e24 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -35,8 +35,9 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
-void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
-				  struct drm_atomic_commit *state);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display,
+				   struct drm_atomic_commit *state);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6b8923d9dff4..4bf1a5b7c3f9 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -55,7 +55,8 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -152,7 +153,8 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_display_atomic_enable(dp, state);
+	msm_dp_display_atomic_prepare(dp, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.43.0


