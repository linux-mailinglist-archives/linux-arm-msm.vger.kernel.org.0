Return-Path: <linux-arm-msm+bounces-102635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM4JD23F2GkuiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BC3D50CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66190308CDA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CA3377553;
	Fri, 10 Apr 2026 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VoCuc0cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnrrad5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92453B47FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813697; cv=none; b=m7RXVDbTLJH1IObuZjLr4b7zPyoCzQoId8+fsWr+KGp3dhdFkSzOtgMV5Y5lOolYe4IkebBzzCd93C8Bu2pQsaw5f3PKV/cDualcYFrPeFVdBMXDcHwFL5wUzB9XMoZYHJM9aoqhIgjX7b8nWOhtSpD+KyW7V+h65qF4bavbgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813697; c=relaxed/simple;
	bh=JNIUFKBZSN04dJuRppY93THtPJzi2gAdHsVCbV9Yi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3o6y9cNKxrcXpHFAunp8n3uCAtrzzCu+e3e1+yGQnCDMqlGmC7yZqQYClrAbjWMC5jmtbTPaXBfqb7gulbO+GQ89ZaO53+1lmhr2hTWWobCZJkhkvCH8RHsBMOdWXJzZUK1auKpGDB3CvLf86UzOKyDhC9HZAPjep+knXt3coE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VoCuc0cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnrrad5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oLa01925369
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIVCULP6f3HK/Zo4P8FgktdYCIL1UYcA7HDOut07rlw=; b=VoCuc0cmmAoDgzIQ
	hOY+RdxocBZih2ODnLxXUZMezH2C+qMLKWnj1mLY3qPYzp44NgI2RcJdFe1hdjpu
	wOguQJgdPag8EAqZQv4KFJ8i/I2cuTS4/vM2qRwxUIgI6eqX8cg8YqQLoP8Dyifo
	tQtQ1KYPRP2GJtaqQxO8atSl60O6Ogp7Rdper0BdtSuh0KFEcRMF35yaYpwiJJRX
	L5poJXb0uGw0Uv7yiSJajuioID8uG5fYi60XE3COuCIHc+EtXWgmxc8w3NjESmrJ
	533t926kzc6nx+AU+C6n5dfeGC1c4B0R8bsYgCiHne3boHOrFMakB4JkanJYB3q9
	sFTm9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjrt4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a3bc7f5d43so54878456d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813693; x=1776418493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIVCULP6f3HK/Zo4P8FgktdYCIL1UYcA7HDOut07rlw=;
        b=gnrrad5Wx/HtGgC8UEhco1bWVyrNQFwsPmCQTCv11HAFGwO3kuESmD8urvQ5640a2P
         A+HJ9SlLZTYi/8fvQU57bJWNsHxiPiOiZGmmMJSQrYgiHcsdYwc/oQZcnKYPXqnRm/SN
         t0gFfInTzHKo7orBd69fX0KGJahZdoFLydKuPvifiXSEEPLT9Q/crrF0BERywajgWTTx
         KRfQ9n2o24JIyFEeQzOl26QT3+Vu8f/OZWUFJt4T8zQAKKm5Q/Bi+G+0xduC/6o17Elv
         22WjpgYdmbaiT7474jwVQudlJMd72U5CVav7OSZzD4Fjn8R2ZJWXNr4p4dqQVgNtT/hA
         2R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813693; x=1776418493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIVCULP6f3HK/Zo4P8FgktdYCIL1UYcA7HDOut07rlw=;
        b=VeL0mEOB1qKZCmF46Y2t9bs1JDzfrDOXtnwPALJS+FM6m0fUrAfEoAHvguvu8tYtCT
         MGlPn8ugC/utDDWZJsCVyp/Jr8xgpz7lIerisXkstWdpIAx9WhbvckPHnpKMTP0/IcJP
         p5wzU2KSKLsNjGpssa/vOh6xvslBn7cHEYoGDIkCaRqUwNeOMQwmO3SBd7osLCI4koll
         6XSvnFEw7FSIFMiayhy9ahaKm8o+WUmYW/ewUrHcSUlZbD4OQHy2nqGSmgFUHeXOK6VI
         WbBpW40jW7JyFitAB+f+g+Tt8R6ApJfYPPeLxZfVp1pDF/pvBodVGyFSwZtBYsas7PJI
         E1rw==
X-Gm-Message-State: AOJu0YycHlPQzDLLiXvbcSS2UVfmSZ4GGTU8Hu3N+6Ad8KZV/utp/Qr3
	DT7uSwGFQaz6Ckpp8viAO0+YAZFRj4dUIyAUej7oPCykyG1yt9fqiJ+3WDgfE5A3FJQ3o+rTJ63
	Nvinp+nPHQwJ8/F222vQIXNC3vq+OurecbXxQypK5YNjjb9QC+5SG407vcrCHotj4kpYLz2nObL
	ycFsxjcw==
X-Gm-Gg: AeBDieumpEdmPTQ1hyEk33mhJKbeuMxB/DpIvhZThaB0p2evkG4vyAyv1e31QEpekGZ
	Q97cmnssw0qcoTItlVMPWdOJkh2BmRqv+om0l0Val6fG4LGV6Jund2i9K1s0NL8DhsA+Un2fy10
	y8ePWjUCmZ+mbblHYt40jNcwTBNCi2T4mZ0QK0nzeP7wWAaap/4Pzl9QOy1JTmso/Kybu6xlNGE
	plSOL2ZOBxlD50k8+2YOn3GmjB2OXV1ATd6PBuq8pgqF1gG8BBswizntFBCUX3bxAPY/gjWH0PL
	s8zUNyHL6uAoqi7R7nZ2wQRguOZd65HdalCWrRdIVoMRVbWj1siE2G9QCgB5qaF8fXsmPJ2jhE/
	Ui/Oi1mGt+6CY9h5GdPrS5IhlzM7bBesVyUKZ7kq5H/oLsL/f9W1XKPWp1OWCKYDCZA3mESBiP1
	cYIbemvzQ=
X-Received: by 2002:a05:6214:3285:b0:89a:622e:d32c with SMTP id 6a1803df08f44-8ac8629b69dmr35344356d6.36.1775813692961;
        Fri, 10 Apr 2026 02:34:52 -0700 (PDT)
X-Received: by 2002:a05:6214:3285:b0:89a:622e:d32c with SMTP id 6a1803df08f44-8ac8629b69dmr35343926d6.36.1775813692507;
        Fri, 10 Apr 2026 02:34:52 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:52 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:47 +0800
Subject: [PATCH v4 12/39] drm/msm/dp: separate dp_display_prepare() into
 its own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-12-b20518dea8de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=3667;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=pkwt26S0f/FIReOg+I0P7xE0FOpdJns1n/b9bgzHXMI=;
 b=PJluU1DTZxt5z8FFbdPGJBxUuq3FcsxLc9wLsJPSWazZ2Jtrz1t7Z4BcwcAgE2nRWp4ABaJXi
 QoJh4NbQkuIDt7fOEupyYlaG/B7Hzn1L6d+9ZlRx7J1ujyz78Plz3l9
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8c43e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yPrqq3r3NLRD5Mb3fRrxdFYZsBCfeanf
X-Proofpoint-ORIG-GUID: yPrqq3r3NLRD5Mb3fRrxdFYZsBCfeanf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfXzKVPSPkuBb5P
 96PiKS6GmMV1h5hZH0D0EcPa3Zxbmn8Cx59gLblWC4jIeED2phKFDk3ozHLQQzg1zBAbmUScPlH
 E5Nu11U3sibwWIumZX4zpvtFJAXpSkcErrf2lMZGL7SjDqdlAidhLZHCfRf6VqqE764CT/JEh4R
 Nk5veWC4K3a0rRCBRzEoqZoJkmZWEIoJ3mSkiwJmqKM32rOCyO7dKI/ZVPh/epbUfWflvrLiQwp
 DDtTP7eMS/NaOsTMBC4IyibS1RPd5dK44E/fC5Dn5IBqs48phFYl4X8c7KQ0ZjAv1iU49lgiZbD
 J2pyOEQf+T19tVuX9CB0322xIV+jq6q+nWZYz4zR1oCVIev+BhpG9M/hF4rp5f4fEUgIZ0mI1VW
 V0EPa0UxTbNvJnoe7JQZrl5PFV+igq4Rkn0Hu+prbmH3f72ifBpBLDlgQf19JBTHfrOpYOuHJpR
 Onm9dLZ+d2vTQro/qDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102635-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CA7BC3D50CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For MST, the link setup should only be done once when multiple sinks are
enabled, while stream setup may run multiple times for each sink. Split
the link-related preparation out of msm_dp_display_atomic_enable() so it
can be called separately before the per-stream enable path.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c     |  6 ++++--
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c7dc861301de..32ad00e326ba 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1417,8 +1417,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
-				  struct drm_atomic_state *state)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display,
+				   struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
@@ -1440,10 +1440,16 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
 	}
 
 	rc = msm_dp_display_prepare(dp);
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
index 1a697fb305a7..295da7ae0047 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -35,8 +35,9 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
-void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
-				  struct drm_atomic_state *state);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display,
+				   struct drm_atomic_state *state);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 					       const struct drm_display_info *info,
 					       const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index cb54d7e71f8e..0feb757e2db9 100644
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


