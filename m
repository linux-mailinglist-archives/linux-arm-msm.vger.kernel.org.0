Return-Path: <linux-arm-msm+bounces-99934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F7KEH8txGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:46:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714832ABDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B52DC303F06D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBCF33B974;
	Wed, 25 Mar 2026 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dB9/AK3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcgJ2TdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAF2DC765
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464074; cv=none; b=Qdfw5JWMCsBgg8EknEotNn5MI20l0D/OhGDNJ9HCzIigmWkcRWU2UXzTLfejOiUqX9XSmJ63NG7eSH1qUkbrtsz7N2eyIGcl05nHHn46Txg1xcBrHBuUMMi47RN6l5K8lQvDFm4e6rd3lDAsD/xzvSVOoSvU0fTCyYiEyMfiVq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464074; c=relaxed/simple;
	bh=gFnmEtSaaGbYj9iRaSU5VZiNuQMQSedmpXMQiJ3ru1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kiHfmVKaMXGFvEZz5kHfryJTE6cBqKo5iWnp+Prm7UpYd2mZ88KM6r4b/87uZznc/1gqDletrlkEHkkeGpT6BLGeIgJIQqLtdYrqwCHsIiUaeFqezB01QRI5CqZywP/0rdIIzlCkzHkOClyeyS+BdQmgC0RTVomCX5uRI/FQ4uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dB9/AK3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcgJ2TdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH6tx3628126
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yD3+fkKUCogV0OXXreNqk477OXDaZsvVesq
	RPlP5eQQ=; b=dB9/AK3z2AH3NkWebPapWT4Cq+vJ0PH6KcnxSm1EbUm9uq5JSdm
	exUPYNX5BFEpXrY8zk7+FBpvJppxgwmCjAyf0snicsqXEe1h1a5RECi30jqIiTJe
	MlfjDDRnTAHEux7QTFtfSkytMK40W4prplfcs7WfN7ABLxLLRVjti9hQn4ctgDfh
	GUZ77HamZbK7bciZvEicfS5nKUZvpf+XIzi/U2NSm+jbBpyy1Z484iH5C6Xwip0m
	r7+nfmDQ4MAicc+cLJrMLW1wqig7YcIlOKZfl5SxbbGLZ+LdCOTE7/5Pql/Q9Nw2
	C9B7IxbEiCFX+67EUAPwkNHjo3Zth5DglDg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpsxr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:41:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b04911610fso1491335ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774464071; x=1775068871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD3+fkKUCogV0OXXreNqk477OXDaZsvVesqRPlP5eQQ=;
        b=WcgJ2TdGV9ifeYev9GVDIgtTr34x7qmUhT4OHDTAUbvrRe5kYETsB/f6IA0DRj54JC
         dibNB6DhaIu3Zjag7p1m5bzHJA7/Bl3a9+gaZ3JZehpJtoP7tKFhxyNOdndZ45BIt1mF
         f5gTbMbKXplncoVxGOpzTPluLNhHSSFxT0bL/pUDa8lE2TvA6usFWUm6lvHnzO68x+jC
         8b9DqTDwx4LfGDCBSyDRlCbaTgBOYBQBm7hJI9VWCm0mlgPpB7DtClxXoZJ8J+0hkIO+
         K2onlmSftSlK4iFIbwd53X3/lDTiVQ76XMfAyLI8PYf7r9VTLRpz2G/d+ftbKGdhnike
         be5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464071; x=1775068871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD3+fkKUCogV0OXXreNqk477OXDaZsvVesqRPlP5eQQ=;
        b=Iym/MCzLw8zfEK8Okl1MuM1672TximdCWyxxWOMwNWoliBPP2vBHBcvDsKaRF+TB31
         8joGabvMDAWrLTAwyK0SbYtBatxbQq6lkeor81ocObmf+ijL94yJRg50zpj51/JzBRxS
         PfE1yZi3XV58zol7yWYqrvLu5lmWmN3p0bQL44t+Lfy1B2nKUf0hdrAQVoA2Ox4OnBS6
         AauD7t00SNvdhBP8v2Kjovd56352tD7DS+Bl6Z8t4k2lxYXMwXr2/2/NiNSXt5HlyB5s
         Urko4qOFdzMnl9drpKaeU0PYctJDiHWbo1BeFH4IR1zZrDJzamL7hMKnaXO9nNDJSV/c
         znYw==
X-Gm-Message-State: AOJu0YzWXBbTHXpXi67pTHTOGFeAMaFtdqzgJahE3lnvlGX6RSL6VfE2
	BTQHeY2bQ1pf1UOWyE3XrkudYP6biv+OFSFqZCIsbKGDkqGJzz2kCXkstXDWK7wo7nU16H/gaoV
	73A43q9hjA/GTWOOvYqYMXY4OhJqXMwP7voEMm3dBB+eMAq+SBU0re80Ukv+bRB8ed/lQ
X-Gm-Gg: ATEYQzzE5TcpKOK8nyRJrDHfbKOHfMP8V7foY4Wbz43e/MhwbvsaN5Wk/GyT0PBGPGj
	H6irVVrql/Y5AjHzSwoWl2Zp6dsufs5TY6mkITpiF92z9DEmwBK1kfT2n88w4YwnbzPRG1QfZvX
	Kx6Pgga4OifdaVDSf1Ddh9mApWFOaGMUpsA62gRu+I97ZTZy9vUdkI+FroH486VAu28E6mON74z
	v/RrAhmrk8J85w40zTcMdU5a0eqWmKdfTUWWwuvqZkB0KrZDOV2wE3h63F9oEot38BoR6GP0kz+
	UjiXcuRYBA932zeqR3BInRBHjWpd/BH6JbeMmzHQF74SdgB16NgBDDranbfuTtZAl1PIEqy/eTL
	k//YaNsS5FrODX5p7OgM9a/EaiTgRRYSd
X-Received: by 2002:a17:903:228c:b0:2b0:6e8f:8e79 with SMTP id d9443c01a7336-2b0b0adf54bmr50362085ad.42.1774464071022;
        Wed, 25 Mar 2026 11:41:11 -0700 (PDT)
X-Received: by 2002:a17:903:228c:b0:2b0:6e8f:8e79 with SMTP id d9443c01a7336-2b0b0adf54bmr50361775ad.42.1774464070497;
        Wed, 25 Mar 2026 11:41:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc79c471sm5980785ad.22.2026.03.25.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:41:10 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/shrinker: Fix can_block() logic
Date: Wed, 25 Mar 2026 11:41:05 -0700
Message-ID: <20260325184106.1259528-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzNiBTYWx0ZWRfX0JIQ2/refaLy
 yLbTolqNROEiuxR/vTOOQlCNpSdQd7oDmbNMp6c/1DQAFVioZWgmRHzKZZVlmGO2piLFIoax+eT
 9SyF8ucQ1KCKgbR3Q5xYXYWI3TEBEjH3qod/7JZ2GOR8eU7HTlyu3c04n5HCxnC65xhHPyH6kn3
 3Uqq7fP/d8NPdttORJbSi9f2whRWzrIMUBwLWw2Lhiajh0E36qK68+jbkmVmeWv0R6HzXzuaHNx
 LQS069fHD9detB0Rd9r7gMdpKzDdBQp0rY0iotBnfhtDDb1q33qSSo+5cDKmI1IVoXHYEm49O7j
 qNtCBPIjdOWA3glwIIkDTdWtFACGqA3B+nrVOVgQ6swUXfRSZ+pQCnXNcOlZgOl/0N9RxXcYgJb
 l4+OlvnmYOHuLIcQQNXwi/+wEhfaM61OuPlxH+tnskVfT+i5lIbKePlSxssLx2YjZWOXV9wnnUj
 vlWfbYn9j0fEogagmQA==
X-Proofpoint-GUID: dd6fJJPY4Yzo7qkw9jUnE8C5b8aBPAwL
X-Proofpoint-ORIG-GUID: dd6fJJPY4Yzo7qkw9jUnE8C5b8aBPAwL
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c42c47 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3XT13xyzjVv8HZeWGjUA:9 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250136
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,collabora.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99934-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9714832ABDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The intention here was to allow blocking if DIRECT_RECLAIM or if called
from kswapd and KSWAPD_RECLAIM is set.

Reported by Claude code review: https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-patch9-20260309151119.290217-10-boris.brezillon@collabora.com/ on a panthor patch which had copied similar logic.

Reported-by: Boris Brezillon <boris.brezillon@collabora.com>
Fixes: 7860d720a84c ("drm/msm: Fix build break with recent mm tree")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 1039e3c0a47b..31fa51a44f86 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -26,9 +26,8 @@ static bool can_swap(void)
 
 static bool can_block(struct shrink_control *sc)
 {
-	if (!(sc->gfp_mask & __GFP_DIRECT_RECLAIM))
-		return false;
-	return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
+	return (sc->gfp_mask & __GFP_DIRECT_RECLAIM) ||
+	       (current_is_kswapd() && (sc->gfp_mask & __GFP_KSWAPD_RECLAIM));
 }
 
 static unsigned long
-- 
2.53.0


