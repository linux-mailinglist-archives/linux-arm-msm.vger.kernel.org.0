Return-Path: <linux-arm-msm+bounces-110101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JkFIPIdGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:50:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3785F0E3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25EA231E038B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C293C3BF5;
	Thu, 28 May 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dc3ZTpNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hf64Rb7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548B3BCD17
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964907; cv=none; b=KSwoJwGGX+DKnWLa24RQFB+L/sS+ttJ9pU2lEQQ38vuR3kJZ+kKSLhxGYYP3ScYZF/6X8kWLCK4veYsct+bpxnt4eRFBK7om2pTguVxL/FwfjW6POOquv9IMje2h5Z8ooxMlVSVE5kiUH34vopeERIvXJUmvPZXt55X9FwyFhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964907; c=relaxed/simple;
	bh=da4DiLmkH54vMKs4+UHrFXYyvX9aCG9OfWIw37ym+Ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LeZX6/52ZkGVA0Dpu8v3gkbQ4u2asrWrQgBW9KItvrNyTkKa6hi5ivAVxNpvOGNT3wJPaQJEHWFIYxisvSwyOjRq9TfO4TGb5fBT870JvVgoD8Nv00W+u4dauc9rRpvNZuzIIws3UqIWans7a0Uwp1+0CchKq0rajoPiF+kZwn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dc3ZTpNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hf64Rb7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vVhe3203279
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=; b=dc3ZTpNgc1bGQzBj
	fBceIuLclGs2lQim5PFenS2kNss/UODOsqFCMgpUZ51ldg9nb6Sg5iz7MWeHY2DV
	F/TyC705LorPh6QKm5jkP4k5no7PTIq0H/ljtCd57Hu+ZkU9a7z2yo4MHO+eLpwa
	7J9a2FP6zNRKWk1OzwSmvpWuquhpvTOT1OU3kLWVG/yPuAPRooVbXMmvtCl2lbxB
	K9y7ZeNZYJlfGURFkC6LE9Gffbi/y3i7h5IoWIAkbUYVK3+161Raw/woUfUrsjyY
	HyQqw9ByxIQcycgW6vOTc0KO/GOg6aiBl5ynSH2zNQ5rkOo3ouydrPmJIe0RwFKE
	yuABCg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynje7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b5249bc1so999121685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964904; x=1780569704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=Hf64Rb7ss6UqbDSc5Rw1gegOIjcmvfoMZZVYBrw+zLup+VB98it8MWc++Ka13ESn4C
         gYgpDhB8HrntY6ZrN+YwloAlnQGA0nxMYCswDtJn7vh1kX0kJ0KP4J1X1bw861f5cUAt
         OhUTL08MUYeHoB9R/HCiN47d8JUhsQzATTlEeg9je19rMMGeh/Ywu2Oj7/odyPAksA4j
         yfvpGjpwHZQkUt1uOtFcRS5JMPvL3fjwwsvaXkvOqwh9fS579EbMdEPNz++PvRXrCYez
         wV2+MitJ9KH1/pD/Ax0CrFbZuIq55K1NL03BF/LHZ9mEVFOyGwz7RDVY3iVGF7AbbTbg
         d+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964904; x=1780569704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GLG60vKqqPhXSK9u7LFSK5eRlVCZiWpAvGD6R5I4zI=;
        b=nnEPPoPFjdpw7b8YdYCI99+CgTixZ89I+DkDtvNkKa97bNCTYUV9V0KM469gDqxm/4
         Of7yYdSJZ4z/9mvZ3HW2BCGm+jK5O43b/1/YPwYrMIzVxxyjaQSaohhY5SHq1cXW1uPs
         EpNr4i00SbDPY51x7IS6qOe+OU52IvOEpWAM4t2qprzQP1zlN14UuB7Qr0ZJBE+2sc15
         JwEdRTBD1RECsW1vy4NU3BpX/FWna67cHriGYc9ILQnF6RgGHbPjqBhxvPGRCyRu35lx
         7PIBLmbKswo8/KubDj97W8dq4lJGM/Uh/iymjiolE+EWpd6rGmKvgDNGul4sATnHbEYO
         3wVw==
X-Gm-Message-State: AOJu0YxcTDjvU3vZ/uOzz81zLn4P29ATnJHQLF1LGLko1FpPLix/i1tu
	vcSR1m50fZ/kOMxhoyE1Qya+PgP1M/g3LvKNWNDzp25CbWu0IGiG8M5aC8bclyvV2iN4Nd+9Pod
	eXfehRdtreS/QJa1feBDBbm7GQoh1CzF3vFp3whHjHYIsCKXOaLAjbAyi2yDHzlzcbuU4
X-Gm-Gg: Acq92OFyrYJGo/LSDHQ3ilArLnVxneto8bSF4Bvn5S9J3VZ6injhX5kJWnwL6hD3mBP
	tmZeudbNyS8hYwVRgaePYeXW+WROf9l9oE0RE+GzeKZ9wCQYEkhC4efqtfPXOc5yruvmTa7tsB4
	64EJbMbuDlaEEjIgJ9W/O4UYhYx73x5UgSmE2f+UK3fAK+0z1TDwFoeCS2lTul0cos1dm1afSrI
	ZVvrhnISaXKFez0W2quqlIf0C68G8wQqB4Z1UVjcT1CoUWb6LozbxjEN95yOd2uRCMQqjC+3N7j
	C0S+zPxJxwmTNOhhJpnn9bD0elU7XWyt84z+jLZnVuhKEEL9oyi3M+BKuzOXOBGSuMoSXhCLT4N
	IIDQpwD6Hn+zY9MDjR1MQcEOtKiDevfzu86fOOAYE9YOx7V3dDI3XvXII4uPqCZeFZ1DI+p+Rfm
	cO3fe0paF55MfugXTudA==
X-Received: by 2002:a05:620a:2989:b0:8ed:11b9:1edc with SMTP id af79cd13be357-914b48d1d5fmr3948318785a.14.1779964904425;
        Thu, 28 May 2026 03:41:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:8ed:11b9:1edc with SMTP id af79cd13be357-914b48d1d5fmr3948314785a.14.1779964903987;
        Thu, 28 May 2026 03:41:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:35 +0800
Subject: [PATCH v5 14/15] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-14-a9221c1f1f3b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=3743;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=PejPis5lPUmTa0t10X2rGcGnHfGkWszn1oUEuwhLLv0=;
 b=XAghNErOj5Q8+qQKxC2vyn/619TeztHoHxIqNc9crazWw1iU4EdyZh0ib+n4zg356QVgcl4GW
 KX+FfcvqeHTCfqvEMi1mP5ezwrB/wPUykqMuc8XD7kHLA6Wl5Q2FScK
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfX6GuCzkXZTiAd
 nLoRb5j/vvVPdMA/x0Blj+Qaq1giJRZIX58+2CF/kz/oA9a8sEiwBRGSQstzHnG++DYr+5WyDw2
 HgHZsLcOYky38qEzyOoM9r6FNCci2srNS3fk5hGIcR2zMtY4R/BH88njhV7ZKL3VbMjrdMYZMR7
 /PvuyyK/xJ3kHbzUPuwB2b+FawxGag73kRSDsGLt8TSMP8YMv8Fl1JCNiwb0+ywa5P6uOi+0Ub/
 Aa9c3dJOlSeUuhb0OG0QnEMLlzDBbNdBQ3H/LqjHal0F1ttIhm5Ir7AorHeE/AqjGqigNzsQoeb
 EKoycyLwcTO+pujhB2buTlnV6rhJqxUVfaa8IKzbL/5t2lHnTFB2pxuBpXNzV4DQhrPaEfhvyL8
 +Y8LlxTCm0AXW3qZn4+bvg2uTvTL6yZbyMAMIZOswHeb10YP1+irFWZT8KwU79Scg2TmMYgFrSO
 SDgjt+Zgej16jtYcivg==
X-Proofpoint-ORIG-GUID: iJhU2fW5egw0lErYc6nAAbBzsLEo_uDA
X-Proofpoint-GUID: iJhU2fW5egw0lErYc6nAAbBzsLEo_uDA
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a181be9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
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
	TAGGED_FROM(0.00)[bounces-110101-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 0A3785F0E3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


