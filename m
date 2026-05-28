Return-Path: <linux-arm-msm+bounces-110090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aA6VNckbGGq+dQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:41:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BE5F0C07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01D56306C525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD433BCD11;
	Thu, 28 May 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdfp1AQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erRBMDHy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629D3BCD27
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964857; cv=none; b=IULeZ4h8CzaRKedLohMoHzIwjUGfvaur/6nv8iA876IIyOA6fGN0/OSbb4maoWsmpZ9VPgBrPfcbP1oy00NaYF5b4u79cK7lvku/vI4XnVLN02Pw+4ziRxKyoyga3rR2+3vqm3ubdlU3A82rbCJeJzqOi2npEen+ZUHDvYQTgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964857; c=relaxed/simple;
	bh=Jwkj7158czrheThyT3gvtKTcpFQnoZihewC5ZY+b9zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+0ge8QLvUrygeLqbDEbckjEuETddBYGwJmE+OlQGBzUS1kOyxn1VIfg4IoT8PF0YQj83dHokYTGc8BYRQ7quQjzZqod99BxnMvhTAozp90AakdT9aDPv2KXmTeNnh6YwLJrKT4fHJJ2bEdD7WA9dc64yYv6x7FVOWChvKzyBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdfp1AQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erRBMDHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vcFb566556
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoPyR1h87JFTyIOs+EVznBYVFvi1bbJRD7VDh6vzS7U=; b=Vdfp1AQ7dby9FMsw
	3b4QURfYyaZgBden7CCAd4G4LgUoKv65MIDAtXwszE/JTvJKXCoEqh6vU8Jt37pb
	P6+i+/UmaO5OCxvCIg9THmOhRYcrvCzCuTISIkKRzbYRNC1jEeInOiY976XU4VqX
	FhBThB9qnLUeXL9/9ajbDOcYrd+EpKioSpvnmPUZykmpC3aTVan7DKE3h2cqjYAx
	05O2Ga5NsvtMkygAG0oqz1OK1MsDiI7FtVVag3Phx8VAN8u3cp6D3U1ZThOZw9vm
	bqCRL56hsNlXDtL40sllxy41VC14hl733z/ePjafnh6Kh9vCcOuPwrkbRbKP2grU
	AnEWlg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjd7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:40:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ccd7878566so5935206d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964851; x=1780569651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoPyR1h87JFTyIOs+EVznBYVFvi1bbJRD7VDh6vzS7U=;
        b=erRBMDHy9VKdlFvwk35LIy7XBjQTQbNHzru3fIDXuWodgVCLExm7byj9Mtt9iJdis4
         1e233DkWI2+knGRQXQnZuKT+HJiDT4Aht8vVeCP1edf1aGbT4MkSyXq7zthWh6R2PmG2
         ey0utampotD/iA+0ZQyT2GjLygVOzbY7hXJbeL584WbtfuYAjLx15tIn+lUP2fdxbmC9
         qYSWmjVzR+QJJqL5A62fjSttPbzLGiVWCSgylDs5Y4WD+rGrG3R3WSgoMqajR4Wr/GYP
         Nv2umhr4oTSzEDRpj42IOHVgCkPb2E42AZR4XqHl7DEjF+Eif8EZEmTajx6JOoqQl/R6
         Tt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964851; x=1780569651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoPyR1h87JFTyIOs+EVznBYVFvi1bbJRD7VDh6vzS7U=;
        b=M2XoSRRmSO3BXYN5zFMmcMuBfZg8aozxWSJLrO/RdICA0Imp8YJ+rC5VsONb1lweKJ
         FTTYxvOE/S8niRIKHJXcOsKMY7Wrr9jewe2chy4L9MwpyAsRiIf9RbCNmgVEGL8WnJQb
         cR1TWfIcJhZpjXYgJqkHeg7EMS++7kZ+shax2F5qqVzlN4FcGafsfO2PTLP8/NHjsvp4
         WnB6XYb54VhAe2wmK1yRCe7pVr+ad+9teZBjBDsrMV5XYGwcEueCzUcvym1Rt4Jc/JIW
         PddEB7EBMZVpHPnCigHCjPw0Ersx25I9O8l6lJHvR7F6mKScl/b0aFKLlgzTxGoHJmuA
         jlVw==
X-Gm-Message-State: AOJu0YyKu2MbLGpvlUArj1JblCmoIxsqUHZmj2UZ9K/e9dTKb+3ifEmo
	I5jery8sJMjKBKOpHrFTRiPBYaUOFIXDVxadBn1MRjPEHsgOa6jPjDu6BYB5Fev9WtPqV4bqI+M
	fhGVBiVmcDsSGSPmAWNb3n/NEw+Om5wEtFvjHcaA0ArjKCoRQ5pvjlq+yPLlThpRrYTyR
X-Gm-Gg: Acq92OGR8RoblyMlrgGOZ3rr70y8dFbZkh2VRhBzEfkc7i46CaIieIAWxO1RVMHhFGb
	TbwKcZGYaOgTJ/HIfK/M9SxE+9NRPjxdRIoYZyJnFcGEKslzH5UwWa4K6jdFgD+VyKYXoZqAqDi
	EYsUzZEQqEXq2FwM53HiKxwFfBYOIfXNHF2oLmllBMXh0qvpDgeh/WL/hN5APTEuu66GwPSe686
	pwB4XZ8xFigadvJr7vHT3Av77K0s2IvDsNK9UIQLMGPzWCiQqFRkblweviUjKjCxEsIb1Gn90N2
	lCrv8Y7+GzqwLZu7avxyFTFur2IrjhbImQjhQpEpwhKpKin2myF5J0nBM0ZjGBJ6V3h2EnQX0mD
	hMd9ec0mfk+Gu8bHF4tH6/pXFP65BAFixT62aqgYTF+UXSZySrGRu2dqduy5MpgYycoeIMIWpeD
	OEiKExLdMXpu55aWb0Bg==
X-Received: by 2002:a05:620a:3199:b0:909:fbf2:52bf with SMTP id af79cd13be357-914b499f6d9mr3689904985a.36.1779964850755;
        Thu, 28 May 2026 03:40:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3199:b0:909:fbf2:52bf with SMTP id af79cd13be357-914b499f6d9mr3689901385a.36.1779964850302;
        Thu, 28 May 2026 03:40:50 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:40:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:24 +0800
Subject: [PATCH v5 03/15] drm/msm/dp: move mode setup into
 msm_dp_panel_init_panel_info()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-3-a9221c1f1f3b@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=4019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Jwkj7158czrheThyT3gvtKTcpFQnoZihewC5ZY+b9zQ=;
 b=hVBOWnwS4GPtlOV/sdh48SQ5BJbvkZZ1sI8HBcpte896kE6d+6eRaQMnTN3v6XJeR8WBsPIQ/
 i79/qiTxDY8B5YE9VmuGgkLwZAJ9RaZJju1bNhPdGT4UAU8N+QEZFUW
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: TnSStxmwVPzOGRMRJCKqQ_eLPuTEYguW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwNiBTYWx0ZWRfXzqyjFvmKVYNp
 +/T6rNpCqQB1k1yKKQO/XTUYr6BA+RGZuOT3Z769UknGfcEK+XjKToZ0kgH7Ndsx0SILNU18se3
 pGIP01PXUqmvpo46qANhLcKxv1B6FxL4fNjngYlwNKhoiegfTyVQ8hs0DPpkoRITT3E1pe5Iib/
 Zu4ufRbqxJZ4MPW/wGG97DaLDFf84buYftdwOAkckCebWM+tmzW3KcqwmsuCA0wCC4vw2hZrTTW
 QwJy3mzVW3SIG0oY6UrHdhOaMjr+ZI7nx5WKqx1K9xdBVccxA8nSTSXjjpAxe7EIXOyos0yWsVT
 XhUBAymRCCSWaW+tfPKvOW11tQsl0Q/bGEotRwjwN3G1r1VOd+XydLKPIwgLFUVjBLbO50vo/Kq
 fqoY2W5r5MResDdyFI6j6o6pGmSmY4Jq503no10lF22PWqUDhp/e6JajoqAYvBZ1AI65loum0Ud
 rlmRRJvYcib44C+o88Q==
X-Proofpoint-ORIG-GUID: TnSStxmwVPzOGRMRJCKqQ_eLPuTEYguW
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a181bb3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RRF978PcF5p4qF5CYGQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110090-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9D2BE5F0C07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The display layer directly assigns msm_dp_panel mode fields (bpp,
sync polarity, yuv420 flag) instead of letting the panel manage its
own state. Pass adjusted_mode and bpp as parameters to
msm_dp_panel_init_panel_info() and move the assignments inside it.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +----------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 18 +++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  4 +++-
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 181d238addfc..f33c754b83c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -604,21 +604,12 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
 	if (msm_dp_display_check_video_test(msm_dp_display))
 		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
 	else
 		bpp = msm_dp_panel->connector->display_info.bpc * 3;
 
-	msm_dp_panel->msm_dp_mode.bpp = bpp ? bpp : 24; /* Default bpp */
-	msm_dp_panel->msm_dp_mode.v_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
-	msm_dp_panel->msm_dp_mode.h_active_low =
-		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
-	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
-		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
-		msm_dp_panel->vsc_sdp_supported;
-	msm_dp_panel_init_panel_info(msm_dp_panel);
+	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
 
 	/* populate wide_bus_support to different layers */
 	dp->ctrl->wide_bus_en =
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index bde4a772d22c..e76dad0f6663 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -647,15 +647,27 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp)
 {
 	struct drm_display_mode *drm_mode;
 	struct msm_dp_panel_private *panel;
 
-	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
-
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
+	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
+	msm_dp_panel->msm_dp_mode.bpp = bpp;
+	msm_dp_panel->msm_dp_mode.v_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_panel->msm_dp_mode.h_active_low =
+		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
+		msm_dp_panel->vsc_sdp_supported;
+
+	drm_mode = &msm_dp_panel->msm_dp_mode.drm_mode;
+
 	/*
 	 * print resolution info as this is a result
 	 * of user initiated action of cable connection
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 53b7b4463551..4519ac374220 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -43,7 +43,9 @@ struct msm_dp_panel {
 	u32 max_bw_code;
 };
 
-int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel,
+				 const struct drm_display_mode *adjusted_mode,
+				 u32 bpp);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,

-- 
2.43.0


