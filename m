Return-Path: <linux-arm-msm+bounces-109497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PexA53UEmqz4QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:36:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE875C1FA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 12:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2063302C92A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 10:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF143911C0;
	Sun, 24 May 2026 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJ/aG0dP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AD69QcvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC3039060B
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779618828; cv=none; b=hNSiv76leHfXScOClFubAi8AiJ4HFmpXVjn5leVd/q57lunIWfG0K9n7kPkoR4EJvOHrnixwcgaIoS4w/++oqmMXSD5KyA/8jmqIXVkagrHKbjsOBPFX2zy8p5V3ichZVa/owV7KfD9+25tD5ZGuYpM5058t5rVcp2s91MGCBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779618828; c=relaxed/simple;
	bh=T2TnNl5IXG3x/8HSEi/dmYszlfNUS/MS6JJyv3KPSVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL2UNhc82EzQbZNK0gNJHliBJqV6SUiQ3Tg3gRkz5w97vXBhIcdFi3bVUiSA4ZFUIVC8uKDNzRoCXTu6cXpO9PxtJyg+Ngca7o1S+KJ4+r+2xlZYjp1gQErQ5usZAUoTrkRYlNEMczE17zJRDDX8nCZA6VhCMXv0bbBxwuJilU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJ/aG0dP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AD69QcvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O2klUK3746003
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIovE62RVN0QdCt+WmtKx5cgzNYUayKB/BcGmgYe/jI=; b=fJ/aG0dPyN9+sj7z
	MtpM7c9O10QAoRoZ7Cn3mNYqauiDf2UFakFqaG9+VgsarR0E5ylYtd9oy/DCjOFx
	C8dA8RdQaAgGUHeKcmW4UWt1pmDxlMDz2qqck0qqCGx0bX7zPoG7EUi4A0IhR1IC
	aIKJhRLdxka8ctCVfgIx90m7ikY9hfvLNyxtHmqd61PiG31JYp7E0k7HXdpgzNI7
	5VpKLFtcFnZViAe40G2/hWF8EBncRt2rAFyXRnkoJK79UsWQtiwSqqUS1HVEjgxQ
	06W+XWQIDMjxnTciIAupYdM5MPI1XummovTNoGxjrvQa8rTov17oWLPrvS9l1X/X
	iCkoGQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0t68y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 10:33:46 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-57563cc7576so6866253e0c.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779618825; x=1780223625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIovE62RVN0QdCt+WmtKx5cgzNYUayKB/BcGmgYe/jI=;
        b=AD69QcvZY2R2wjoyG1i26lgeUTd8FHYqVSgbxWEkJ0FoJCKbbe8LZYpmoZNuy98J4v
         anXQsjNeVWFg57be/iBdG0JyFtO+u53KLvCp+GU2Tt4GH7pLkqx8k6P0CQFrT4Lb83j8
         fRQCowP6SEUpAd0l3sw5eh9pchnbMxIP7C2vbpez1yJxgs2MBOmVB7LptZn3rNaGoL5v
         8xG87oRrifcx1USrbIWw8quewzJTuRmnXdoGqNTa6TE7HdUSKM6Hg9PwbyBlmO1e7IXE
         ni7ryDDfYvOrBdUB5ALoneH0Rga5pEBxg2M0AxgCkzjnAzZgqb3znJFImvdw7+cb7OPO
         BrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779618825; x=1780223625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LIovE62RVN0QdCt+WmtKx5cgzNYUayKB/BcGmgYe/jI=;
        b=NBcS7ipmGrgX8NTlQhMIhgQgvn9ux7iNXOBxuDatV3tWxZgznCskEB8SpoipOnTDSz
         cIiwkmjpqwvqH+TjgDDnTEUgZOA3nZpmbpjJaVsXLSJjlVZkyvpLQlOb3cjcqhw257V+
         x2GTsbxUXzTV2D+eE8sGXRXTVAcgjpeJTVQ0WCMFXGCv62/V6DPViMKGTFEJhx3XAaW6
         E8rnBYHNZ1GeQh54tH9WX3ECzZuhDpyENEgjIwcB/toAR+fRaRmmLJq8av6JACmfyR1E
         I0hV75F8P9mxAzk4GuvxggQm6NBnZdUdgkTE91wI16XjEB/Spwqht6lYyYhTSkGYs31I
         xXKQ==
X-Gm-Message-State: AOJu0Yy9CiYnkdaqFpllttPgHMwX9+OutNin/X+Da/Onl01BE1guV9+j
	GB49XqJPN34Kx1Xyo8qw0qEz+Z/86r0rtIMYQzwrc742MS4YSPGPSL5GRdnlUS6xOT/QlH8nb1l
	BFQDiq6oHAOzqFD2Sw2nY83tkId+AJHGarbeXPRAYsgqYobACgYQfzyUpA2iVd4Vp/QFI
X-Gm-Gg: Acq92OHormEmH+hXYRVxZfCM3IiOs7lL36X+rvNE6HB35g9R50uV0AOXe9I6v22Pu4/
	Zkt+ob3m3FlxXYOjdak0mJ8E9/HgMc4LyHKfi3V+LlbTEo2hnyUut6xXSMhZcZvz2irFOrn9IMD
	w3tYkzAU4TXJrRB1I2fa3Y0BMQyZh5ty5tiYKFnh8r+ar8sIVO/c265xOOFPzIc1ntvM7sP7ji3
	XUFUMdirbHPmQrYVjLTgroVExUBOHvB05cb9c30J9ha87M7wTECxW7mFx6Tff+sfCjPZtMcQC1r
	ew9QNJamMnT5juKolEQQtmytUoFOsPyVjCFk1UKeO0hWrAHgnXiIZwZgmbjzScBJV5AuAZOyBB3
	GoArQEKdUC5X7rsH2cGvp4vyx4T1J0AZNb0Vyaed5yw8eYNbmw6Tlk9/SuZOGzt111DFy9lEfA+
	FqHwU3dXu5QquvJhM0e0zMeIOnNVq+45mhZTY=
X-Received: by 2002:a05:6102:3f86:b0:602:8c16:b24c with SMTP id ada2fe7eead31-67c7c0765aemr4824002137.19.1779618825596;
        Sun, 24 May 2026 03:33:45 -0700 (PDT)
X-Received: by 2002:a05:6102:3f86:b0:602:8c16:b24c with SMTP id ada2fe7eead31-67c7c0765aemr4823988137.19.1779618825197;
        Sun, 24 May 2026 03:33:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cba880sm1816148e87.32.2026.05.24.03.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 03:33:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 24 May 2026 13:33:32 +0300
Subject: [PATCH v6 04/10] drm/msm/dp: Move link training to atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-hpd-refactor-v6-4-cf3ab488dd7b@oss.qualcomm.com>
References: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
In-Reply-To: <20260524-hpd-refactor-v6-0-cf3ab488dd7b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kIfgr1TXlKJmMBrqjAe8XvEofIv6a7FFbjhSIdx8oFo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqEtP8rFYr9RxFhNyHvTDkeW6A4+2lNu04yxSnK
 yFxC1+HFiuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCahLT/AAKCRCLPIo+Aiko
 1VN3B/sGoDcfMNPTG+CrZBca9Zt21qM3tfIB8ERORfHAdmuNpv4jUPqDFKCf51fceatoNyPbKyk
 ArSJAGtbi5d0L70U4B0BtowxEBvvVIQkPtXt9woUQO5hJwVYgXHMx1talX4TuH3rND658Ka7bq+
 nAOcohmah1maXkO2khjmDP5F/SPgpeJ1j1k/tbSmWUT/ZERZ59VjMNzYj66CqiJp7i06V/tTI5V
 WAQCXYkfVxm8EGYIG40O711YRQXopeF/coJuzKnvAQ2kMqHBw4MrkjcD1Z1SjX/bTrlv9s14drI
 PweRo0priJUp1oXHmv30xxbeVNIErtwp5p8rQaSMYaAb1gCE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WErl3OMjA7-8EUjB05nzjqWWYPX3pj3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEwNyBTYWx0ZWRfX3A3iWMZEcAIO
 SnutOkiQauX6jShv/E0ZzrunyatO+luh1Mvcw4g96v5ucwXrPHelMk3IEzylZHixSOqxlZ8KKNi
 El00w0+krqgl1+u7iGmvxsznyrwZC5Bpf6zLiXOkExYo2BUiBHMQSF7xAGFHcBpaG5x14seQ6nv
 Hz4zLDQBPMOJARoYbTa+xtpY3VNQoCa17GFZc20TMMQ5m2DTIIcU5ZKaO54rFa6TgMQLPJMKR0z
 LC1OGXpfWrVq3y2UaFuwbgHK5FNQs/kgy3ffWqBjsku8O7sIH+YhrWl/KaZK72xp/mM8L6iLPgt
 MeSRa6WODNlkMmv5HHkfFSUqchnbG2qNlvXexLbpMOMrrgUgXBODihXsa64XPTZK9KHt4RcujEQ
 CWKprNJEkczYjjuZpQOXjthrQsgjzXV0WmsGaoEjxU8lNHpb0Qs5zIWsyUTQJgSpxF7JBbYKPZO
 sv8UDGbjBcGBmICu6/w==
X-Proofpoint-GUID: WErl3OMjA7-8EUjB05nzjqWWYPX3pj3q
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a12d40a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109497-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,packett.cool:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACE875C1FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Tested-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com> # Hamoa IOT EVK, QCS8300 Ride
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 97c4752005c0..036b4a5cece5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -437,11 +437,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1699,6 +1694,13 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
+		return;
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3


