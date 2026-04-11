Return-Path: <linux-arm-msm+bounces-102793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ssfgClVj2mlN1ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:05:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EF3E085C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D9FD3034ECD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB72A38A2BE;
	Sat, 11 Apr 2026 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaD8qEr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MVGdn7fE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C9D39151A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919567; cv=none; b=ftoBS/oyXKE1U52Gn3UVwxD3m8eo87IjwpkoS+Aq9nbZI93rl549xmdiSiVDK/cAC6m3zwfiHmXTIeYRe83/AyVY3gr+SC1bH9VmIjuz7iy1Zof87Nd8dPtRlevpbY309xVW+gnnKhJ9FF6Jqy9WmKwWV9BdyhcZQjwearomJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919567; c=relaxed/simple;
	bh=kys2+nhf6Ed5y0sTw19sLDV+jvztfPs0R/fXNp6raQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hJzLbdo/XvbJvq2MHgJIDGUgJ2u96rfRrd1a1+/tBEyNS2h3MSG54uyhxkGgZEbhc8QZU7J7lb5/o7l9HtRzgKB359Qk1W/6q2mewKmZ4FfeurXrzs5jWEeGp907rmeFEnPLvJ+zFA/FNgq/RSkQ9PeHuxEIh7Y0zHG6YUixp34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaD8qEr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MVGdn7fE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7uhlk3336200
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7Nb/AjyriPfrtpiJurQyhh
	BOLNHKNPTN1zEcDyx9jfQ=; b=iaD8qEr7s6n89iZHreQI/MKz3+47pqtv9ssTIw
	ih29ff7tWOEMFhlQbFq8GsMg63sEdVLXhjq043gUtUlNkqqMGoIjtdH3vGV0bfO6
	rVjWepvu0WxH03GaRHmpkAvkQuG1cShkYV7BvqYlzEtkwchudP5LBbR7qXThAOsB
	jT03zTdW9coSidvaA3HQ8kVMCYP1/+eCKPtpNGGYkjFfPbAFjSO3Mvhwt1VWcuee
	q43JrL2PFuPiaUh6Aias7FJwq023uYMC1kxJYWpMmbyimQQbrIPW++I7E35t5KhX
	0UJPkcZ7lMKQwZmuIzL2dirwfHH/j4HCQi5L1AwYwzlzV7Ag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8jct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 14:59:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a0ef4a7021so49111166d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775919557; x=1776524357; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Nb/AjyriPfrtpiJurQyhhBOLNHKNPTN1zEcDyx9jfQ=;
        b=MVGdn7fEOsgwIPAXVBZrmBHXfPzBOyJB8Ilc4y/B2+o3bQxRMrgjhVrla5Bq8F8HGg
         oPJAFJ7/F0ORBE2sOI4Gx/Zc8yBOJ185YZAzGFf22YHoGx5IoECg2W/FcGM5JUP7VTdH
         4FYvJXX6/rmd/+nwKlqRFr8vVjeZwsX13Pt0+Eoj/pThixMZ/XVWhjdTZpbO8yPObN11
         msD2JljmMvzDjQVkCfHG10Mj9k2ZylbLDh+FctZ/An9J7gHRXVeeXwM9u3nofRRhD+fy
         PiI8GjQsyjBnDKVQ3e1y8FLtwV1yXQL0FI8HqTDyLFpTM838ZPgTPW8VsW9RTj12DY+Z
         DC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919557; x=1776524357;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Nb/AjyriPfrtpiJurQyhhBOLNHKNPTN1zEcDyx9jfQ=;
        b=qYMGuQDn3raom5iaODhwSuY23pzEyQRLeIQfdcjXtZlVvtbb/AQILAkbnXiQBUwfe1
         b1epgaxOGMgKO9VlR/Y6bG/UgjDyl3muQfWJpMomxf1K3SMpR11xcUM2k6sIFpZNSJvf
         dlz6BGE/WDqySVYma4lyVIC3jIvWNF5ZkzGDFEd3X6+HE4CYFLoJlhetgDaBy699kvWd
         YIRqAxfcJSfhZhJxQ+txt1ZxmbP10AlPvG9wridS1Qjxb8sIWR8FD3FkXHZ5NIWiXWmv
         IA4XSFVTIKmaVLaUTToRijD66fhw1g9lcSsuJ2kC3FB3LOtnWs0/cVWsfRZYLZLb+hq8
         zsWg==
X-Gm-Message-State: AOJu0YxEApywGk7BgJolEEaesRVa6LxzHbucz/KZyaL8GeZZFBKWxDC0
	0J8+PwRuBEYF88Gt5KLU6hCdssdVcLA8MQ0wDSgSZcrtBJ4ZnBd//IZbEj3O9ShCKmWND3gHE/A
	SC/2GZd7mbaf1Y8x/jYDDxM/XnM9vb6ZnA4K9xIq/CVimeyGaG4SbCxJUifF+6SRvoY4S
X-Gm-Gg: AeBDieuTL5gaAtlEhcW72ERHUg6ZB8wFYavM21IhuY/+6v99JO7T09oi6GCIfXUGWvB
	84V6EttUrdHT2MibjJ8p6JoNjK4avQ6x5+dB1mthjBpcKa+2pV+LtNpwOCz2Ysmh02FgzWUwyy9
	1jCYGAVTzzDKUCdBghh+9h+SV/DlfXqiROH+0dfYNlE4COYoj+LmwpPjeT+15ZDzC8w97P8lSK3
	i4XoXDmAG55LC0dUvQy74Jq2KN2wcx5qlfL3ptdCjkqwoya/qeHjetWumgw3yPBgw5+nLq0ptJD
	e8EUktLrkbhv38jA3/CVIGqoamrKQbYuHbgEA5bytMiTqy6HvWP6lwMyoHqsuoX9dgI/sVd4G8+
	endWpikERgS4lwNoDOxNXKbTyfE8R9BeYS+VOtaWMRmTVrAgQmpWGi+MkSKSFcu60ZGbzNkI3o1
	RV/YXP8ze54S4lUp37GgTp8+n9t/qeLGQ0eJM=
X-Received: by 2002:a05:622a:8a0b:b0:50d:8c22:47f2 with SMTP id d75a77b69052e-50dd5bdb454mr85336911cf.44.1775919557162;
        Sat, 11 Apr 2026 07:59:17 -0700 (PDT)
X-Received: by 2002:a05:622a:8a0b:b0:50d:8c22:47f2 with SMTP id d75a77b69052e-50dd5bdb454mr85336631cf.44.1775919556623;
        Sat, 11 Apr 2026 07:59:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee12fesm1448241e87.40.2026.04.11.07.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:59:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 17:59:15 +0300
Subject: [PATCH v3] drm/msm/adreno: fix userspace-triggered crash on
 a2xx-a4xx
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-adreno-fix-ubwc-v3-1-4983156f3f80@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMJh2mkC/4WNQQ7CIBBFr9KwlgYoBXXlPYwLoFOLsUWhRU3Tu
 wt1q3Ezycv8//6MAngLAe2LGXmINlg3JKg2BTKdGs6AbZMYMcIE4URi1XgYHG7tE0/6YbBQrBZ
 cUgKMotS6eUi/1Xg8fThM+gJmzJqc6GwYnX+tk5Hm3G97pJhirZkmO14TvZUHF0J5n9TVuL4v0
 0F5JLI/GpY0sm1lJRgXVQ1fNMuyvAHmcLM7DgEAAA==
X-Change-ID: 20260407-adreno-fix-ubwc-6a2564710e21
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2141;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=kys2+nhf6Ed5y0sTw19sLDV+jvztfPs0R/fXNp6raQM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2mHChdpc2ZTtjwLHakNI5nxuTlXVhd8s17y1Q
 iiisyu6/wGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadphwgAKCRCLPIo+Aiko
 1XxlB/9SbltxguzGNBXkgiFsdlDDC6QEegF2crxUCwPsq+z8hKBz8QsLVNoiLsfl+odFIc998fH
 KNqR9iHctqylW7Fvqu4K9+yoPegTZvOpdn4xMDJwCNhUvTS/Ye3TtNWMqtWAYZTU3YCykmdG3eW
 ZS0JXU0MApA5zVnZUewCGb0YWPOniQgP3FZdD12rf166eJWt9HY0uLH69zCgHVte9z/BPjsa3Hj
 0j9OZIWoPyITef1DnHVN83eJrp/ZSYj4UMqJismGlPXdNWfFpEwO3Bm0rPFcBSA5bUzB742t8/a
 zlM3aMhF/qQj6OtZ6UHRA6QokKIV8HmCsJg3CZ/pNam1tWZS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da61c6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=uq7AuM9elF0DF7tEa_4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 7oApY9af-RKkK1uOiazp0yWVh5ChPBX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEyOSBTYWx0ZWRfXxgiwAFWvgfn8
 yJp/+y/M/PzEcGAdrlujs2zH4lL49dtQRjX731SvG3X2zJnNrTPVliBfl88qMTdF8GROekPXYIY
 42TVmG3uf6hs+A+Ovr446bpV/3nz2tfDnLWBHR+XxYb5m5o/60EhXC/TG4XqY4udbiGJDPiOc2E
 CVRcm4RPQVjNkd731KaHimXFmBJhbU9NJZ1j233WSIekjChc6pJqZo57cV2BW4yh2DoXXeAuUTE
 yZOZS1Ob85VIkMZG4v+dFZsw00xmfGyfot0GOHSLzDHY7vAbYai2o9pJ18KhOaTYPZkNvYmvCca
 uDxjzIO5U7sHuAmhFdKSSvMpRkgSXv59DoI7LnlqJ48Pk/17mIS4Sc6AhBXxsPI58t3jtzAtYv9
 74snmu6VoeKwOzGw51GGPmqhKwEXC5kN5MfqPK2azSkUVlgZrMRtSEGnsQ31cMgH37ZP7ewqpZO
 22l/L75u20JYrfb+cJQ==
X-Proofpoint-GUID: 7oApY9af-RKkK1uOiazp0yWVh5ChPBX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102793-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A2EF3E085C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before a5xx Adreno driver will not try fetching UBWC params (because
those generations didn't support UBWC anyway), however it's still
possible to query UBWC-related params from the userspace, triggering
possible NULL pointer dereference. Check for UBWC config in
adreno_get_param() and return sane defaults if there is none.

Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config struct")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Switched to UERR (Rob)
- Link to v2: https://patch.msgid.link/20260407-adreno-fix-ubwc-v2-1-7ff73624635e@oss.qualcomm.com

Changes in v2:
- Changed adreno_get_param() return -ENOENT for affected params (Rob)
- Link to v1: https://patch.msgid.link/20260407-adreno-fix-ubwc-v1-1-bb2b09450b87@oss.qualcomm.com
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..02f60b33ea1d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -424,15 +424,21 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = vm->mm_range;
 		return 0;
 	case MSM_PARAM_HIGHEST_BANK_BIT:
+		if (!adreno_gpu->ubwc_config)
+			return UERR(ENOENT, drm, "no UBWC on this platform");
 		*value = adreno_gpu->ubwc_config->highest_bank_bit;
 		return 0;
 	case MSM_PARAM_RAYTRACING:
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
+		if (!adreno_gpu->ubwc_config)
+			return UERR(ENOENT, drm, "no UBWC on this platform");
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
+		if (!adreno_gpu->ubwc_config)
+			return UERR(ENOENT, drm, "no UBWC on this platform");
 		*value = adreno_gpu->ubwc_config->macrotile_mode;
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260407-adreno-fix-ubwc-6a2564710e21

Best regards,
--  
With best wishes
Dmitry


