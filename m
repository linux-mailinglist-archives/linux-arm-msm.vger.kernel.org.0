Return-Path: <linux-arm-msm+bounces-100550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WaXVOPUMyGlIggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 18:16:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC3134F444
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 18:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F8E73011F19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 17:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A7226AC3;
	Sat, 28 Mar 2026 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahtFXnkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNUqntar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5230F526
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774718194; cv=none; b=Jl4BZDBI+uRHiwAlA3NlEWUPiDsBot6kqT8P5nRY36/APkIHOOzds/xi9te4MOQPKi1d8qL4l9edG6quI5DrrC4wiqKGFtJv7Tkb5IqN384LklAKnIYUxAw2J3mIMi2C2q133ip2/o1usG0NRPGBvyU5xaTpz9MCHK7UPjxVQBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774718194; c=relaxed/simple;
	bh=t/2lnWeiTJVLgm11rWwGyHISGzd1lCGdDHW3CjscREM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=spOGyLmONl1dxotisVBqYrVfHJhT0szkvbksyi/eueA4mLWy7pV4Ro3BdxGOlc2+FEtlWl3EhaCqtUDqwgB8LiQCf6bcKNtvCbpbiSmioviSS07ZwDoBG6Ck6/pQ6JeM41ryDOjG8xzDmkmh5t+UjdS3hnyl7vZdZ8ZwY04cSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahtFXnkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNUqntar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62SAwie52215444
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mZD3x0HJuSCzzPyCaSHhq1
	IV7sA2Rf1lOufYvYO5ZeI=; b=ahtFXnkOofa3Tasm2DSOUi7CkJwXbrLqsQZ/u4
	bcHa+JhZx8rR4dQ7d67QZGIooZEMa2E4SShuzuk8dUFdJVuCVMhEdcG5PpRpbo6Q
	yfG74xrYl+wHnKOnrQptKyNZnioqBGlidfpH/L6uwBO2G3LBJB0PvSuW5cGbVxYd
	J0bN/9o92ExLCFMh/CjcTN7eFwNsdX5fJgQlJBUINm7a3Ut1BpRwnKTGhjng8471
	VGdqEFM0ttdZWGfYTnIGXLwUI6EKgPsfjVKGUja4O7TS82pN2vcSkJvcadzB3fcn
	Rb1PSTLIRCKTxnHqwBJsGmO0CPhT1Sn5DRkVgmzkrqu3fWAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685h93t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 17:16:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c2e5c8a0fso839507a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774718191; x=1775322991; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZD3x0HJuSCzzPyCaSHhq1IV7sA2Rf1lOufYvYO5ZeI=;
        b=eNUqntarUqhp1NZQjyruZCsz9+ax9I+y9Q8OnhPfK9re/QxJtGTmQRQp4Lf8a3rfaU
         cnMgElHh3NyZX+pbnzEpUrA/lvE68Qb8PB8xUIsu4gphot8r/UlIJffmrZTA6J/5NRqp
         PWEogowVKduGQeX3v2g3iYdX0qr4VaHrgSO/b/4HkzBfSYASlN/lYy/bXVDJvBUPLfIO
         8Jyqq0TjMfhiV/ZC4FaedgZWKKgyt07nHJ8wFNHQcU8/6w+L10OYFa8iVKjs1c/2gyy1
         iuu+WVfWD0b2GRClSeFMzzB8LNSiDaZ+fW6TJiEygr5yxGtH7sU8om7WPphsP2pT2XLd
         y8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774718191; x=1775322991;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZD3x0HJuSCzzPyCaSHhq1IV7sA2Rf1lOufYvYO5ZeI=;
        b=CO2lz07ThWqjTm6mCBwCj63N9ilt0rphgkNGHyrNd7zfhSTTFihPwEJttXx3fHYL5g
         OhdheJ3iJNKxfC/UpWzbhazKswgZJ+Dpk59HC1NqTaWTGBNdQv9oIY4CP5CCAQK5nOVF
         zb387OoBN6RDiZgBiEAhEg7mzFZKyUW9aXo5IIjN3Kkh7noyQ9e13ple3PRF4sQ9fKJt
         EYFOCnhpVR1eyRNoRStEELyuD6r1+hYtZLRUtUUgCqEOWPrqfHOfWTKcSn8RVOdHMIm0
         XFFiOYkPYIme4tArlK29YKjVQnejPAVsCWtFgNW9qjOQaCjORp2rzbOQlL2vi33CvAMy
         7HkQ==
X-Gm-Message-State: AOJu0YyclJYqoVuO8PM+R+Q3/GpUnXCRb9hFObK2OGFqyvzTbMm237AA
	7OrEt6V5s0qCBLyAY7/Iy0f9aqlbZG42IvjrVMH4B3HnULUXKir56/3pSmcVoS0tcr9u4rm9zpe
	DIhWDZ+kPn+2vhCdQt4vrxEaDpk75JqkzelHYBuzY796Cj7VpYClymVTTyZL3xg0Wtt2x697Qzu
	HT
X-Gm-Gg: ATEYQzwKk2NzziNN/X2BpjxHKAktuOOtZKAVYcgdG5STxH8jBzhpW0orfZW2g58xJ3o
	sVJ0Jdj0lQg56GRKGp19RkGZ8jxsggKQcLwEX3DuG2eaLxeS1GYpG8Kcq5CKkE5HMRQXJmybrgH
	QaDB2EvEEO+ZcdJFjSACIGdcGxKhN7kW5fF86aKmaRALbUsEgmYjSApWZaEkS4Dvqd8o3GPga8i
	Cr0ZeQI/PVPyILcZyCDeimaLTM2LXnL3+zVaw+Gfd71nyWRi67pIHRw+mx9sDXBSU1miUeQ7FAK
	zo2ymcU7LhbfEZzNkVAWnikaAVnF7z5cSvAxY0/Bj1EI3yXqrPS3rzr/pwGmbSZQZj1kPC+7+ml
	2xi/SrxTZ5KDVgxiq9b+CsgY6K2ymNvc2iAqg9eAnFBdI6XW2ojxf7uMp72pr5FFq21RIXRd+WN
	0Cp6o2PT748iPyOdjmiWgI02uQH17TPG6shtV/r/C5fg==
X-Received: by 2002:a17:903:3d07:b0:2ae:8073:a4ee with SMTP id d9443c01a7336-2b0cdcb02f3mr43446425ad.4.1774718191360;
        Sat, 28 Mar 2026 10:16:31 -0700 (PDT)
X-Received: by 2002:a17:903:3d07:b0:2ae:8073:a4ee with SMTP id d9443c01a7336-2b0cdcb02f3mr43446295ad.4.1774718190885;
        Sat, 28 Mar 2026 10:16:30 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642b59sm28773755ad.16.2026.03.28.10.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:16:30 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 22:45:35 +0530
Subject: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALYMyGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyML3dziXN281IoSXXOD1CQLS7O0NDOTFCWg8oKi1LTMCrBR0bG1tQA
 OeY+IWgAAAA==
X-Change-ID: 20260328-msm-next-70eb896ff64d
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774718185; l=1740;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=t/2lnWeiTJVLgm11rWwGyHISGzd1lCGdDHW3CjscREM=;
 b=LEiraT7HPFgf31Dv/7Ky3m3a95LyPrjVgKPhAY4+TNIg+1B6G5g3TlirCT4ijQ1PKkJrYbslX
 E0wrI5HhFmgABpSsHgy+Wu6g/tJSaLGqhRbz8D+5msDsbGEVwlmftUD
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69c80cf0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Z6NFRpVzsh1R41ZnZt0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDEyNyBTYWx0ZWRfX6wextuSwFvKL
 SLPUuyCOqmCa+DB2yxAvktUX8X5GcTjnPCkHHzr1pvMLvTxlgBSzaUQFxgti2Jx9EKKCeRAKvjn
 jPbZsjDILvgRl26NRiq6dNBLqw5qiZhFs+Tn1lFlONU2Ds65fSJPmbbUTIto1bsq553muVdvtOs
 vgCQcBzb/nd6+lZ2LeeiFQ4QIDXM06BE9wVdMNIMu4AQK5kC9EsZ9RLdPzhVKqU1nUnULbHuSuw
 tuFokKCxpMhD0hfaFzN89vIRmadePhKQYNuV1x0J+hMLi3rW4VeqYAw65UNVuXChzrijLmPKDBo
 hQpYTTGB/ImNYbOrJkgV/K3RHEq5sF8GoXydXw+Mxn7OHlE3YW7m9EHbgk3D+XvSwYIl8HzoV2p
 y5GciVW9dDkD/QbrQCYMUY758RTmWIKHJsw99HsIiChB/Aq4Qe44Zwo7UzAh9adtoN2bjLZmz7R
 eJAbVqwCurgfnhsBeeQ==
X-Proofpoint-ORIG-GUID: WHFNAXZitWbtgdH_P9AjUE1uPDvTf0EB
X-Proofpoint-GUID: WHFNAXZitWbtgdH_P9AjUE1uPDvTf0EB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-28_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280127
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CC3134F444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Few targets have lesser SSPP line width compared to mixer width,
SSPP line width also needs to be considered during mode valid
to avoid failures during atomic_check.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6bf7c46379ae..af245c44959d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1591,6 +1591,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	u64 adjusted_mode_clk;
+	u32 max_width;
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
@@ -1613,11 +1614,14 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 		return MODE_CLOCK_HIGH;
 
 	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
+	 * max crtc width is equal to the min of max mixer width * 2 and max sspp line width * 2
+	 * max height is 4K
 	 */
-	return drm_mode_validate_size(mode,
-				      2 * dpu_kms->catalog->caps->max_mixer_width,
-				      4096);
+	max_width = 2 * min_t(u32,
+			      dpu_kms->catalog->caps->max_mixer_width,
+			      dpu_kms->catalog->caps->max_linewidth);
+
+	return drm_mode_validate_size(mode, max_width, 4096);
 }
 
 /**

---
base-commit: 6efced27f5df9d7a57e4847fe2898cdd19f72311
change-id: 20260328-msm-next-70eb896ff64d

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


