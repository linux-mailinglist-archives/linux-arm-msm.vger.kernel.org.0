Return-Path: <linux-arm-msm+bounces-89145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F246D22DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19D0F3046591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A190B3396E5;
	Thu, 15 Jan 2026 07:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XbrCK9ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hI67oZSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15757337B91
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462163; cv=none; b=s9shUNONng/aNAnmDhXYdRDt2+HnDhMxq7mT+XGAlc+xbgomeTTHBxIXRmxVcbedx0jDpmbDoy0q/9tngiPXtJT/xwcqFPxV7XLqVo84lz4+H8O86NPKOndtVefPcJyElpCJ/e38YKHyxwajitz/ik+GqA3Oaj7DPqV+cehZnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462163; c=relaxed/simple;
	bh=ZjWLusAXQPJ7v9+v28KuLZZCzaVCbS6UYjQtn7uXpog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6x3qy1As8yTfgW1aaawWgXaLAx4bn9V23XVQjySkxGl09Ccdc+ZXgnnrZJrYK0xlaI4qGoju0juCwjHz78V/5RkmNBKNqi4M+ZlnxdvRdv0xfSd+/RuJCcpThKLXKff3z3+0az6UqwiO7pjYlpAzvxAyVEsKlFA0qKiU2/WzJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XbrCK9ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hI67oZSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g1YY1055246
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=; b=XbrCK9ZVG6sPso6b
	podLlHPXhlYsskfIWbGb88R2vd5i34c+U13kYGtKjECK1NXj5+Tidg8CyyIW+k16
	yJLdnpYpoo+r+Bo+gfLagCIV/7GTjh3Ul0PBl4VICbbTUpOB7dDXHL4ONu2sMQzn
	NSt0KZNQZ+usczQ682TQf4C7+NOrJI2ucwou221+mVDRWxBJxp5AEb+sTDQo81zP
	x3yaWndkWenG9DMA0XDGFMHttnwxHYbUJgi/JPwArzZ0hf2O1uCH9HssdWO/OoVn
	aKeQ8ppktB+Ja+gnQzvTr4s0DxTM+UcwigqSxm5+Bq65BzmiWUX65ww9lL0NRSja
	YO1PAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d33rf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2bcf21a58so206905085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462160; x=1769066960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=;
        b=hI67oZSSqarM7OtFsL33NSRuxeMom+046+zx2LTUsARjzSEobcPR1iTPtYtgXVezrn
         0ZsoDiUtDrBkunRxmRnNytTsY66OnivvRq6C+lZDO/jVvyhorS4ycxdc7+7KWmUohCkD
         4cKTTXwOA8PGKWveGlZ8pvAU+5URSchiCrwM2DU6VEJPjnS63isoRZ1Isi8cX4UUCvJU
         so394nMpFb1qVp2+7XLlvNrsCABpP46nXAichYizdkiAptublCwdORsu8GaMhV9erhRm
         yuDBUfBakEZ13i00AD/qmqs9xq3qpmVNRu8BUg4R+q3DeP3vo2bqxOd44O6VjgYtMTRT
         BJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462160; x=1769066960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=siUNwN2ezIf7yDdSsNDGD6Hi+7u+fzy7u1ZpsJKkyqI=;
        b=euXNGdmdtgtr0eXBII18YRiJ4a7wWCZ90dLDur7ug18uD+8l2I3ee0U5+V/2nJUv95
         VKkzZAAlIaIzroDwqLb7W2K7Jh34xIqWusz4CanovvHtBXxuRz/65EOs2XJVAnz2bsDn
         aYw1oOTv5ph76y/5aSRa/NPQHe6f/UyLDVHri9P/TQ1sunMsxGlAeY6QCeCb5ZdHx85q
         ibPBbyWCpmjzghN4DvUlULgxRR2CnExv0oMsVURq5LixuQ1JSPzd0YYqLEw3TTiZ2FYR
         psS0u4YP68qUXqBplQVVk1E36CYwwIO8k9Qr70GQ9P/8kVJ7JCc5Co2uxPVAZCIrr5bz
         1Kqg==
X-Gm-Message-State: AOJu0Yyi57xljmx/6IovQm9L4flviOM1m37vbe8uasWVt9Wt8gy/hqvL
	tJkBe5XZeDgWB+UgQBnP6qbZ+pPsLOppxIxKKyR02e0R3TeoG6qqnoZE0AYFrwrN0PJoq6Uvqpj
	dXdyqjzbnYEpMrqWPoMjLRfYrslp8wfjPTVLueOoEzuUqCoHoCUxN/J9sqrF1d2sJwfVn
X-Gm-Gg: AY/fxX5oioL4wpEI9nd/lc8Lf9NaFLtvqjuRsVl43bYgui6SsoYNF6iECdG+02nLldp
	axXqxLchZhWu+BJyUgWcMXV2uNT9TSxVvrDxqqjyTmB9eIbNa9AGrHzIOzN3SEmuBJApZ5zQZgz
	36IQfuHyz7oJHLo28GcvytglrMVFUmwq9t1SQ02ae8JS5IvDzMgbHk9grAjLE8XH3mJ3yx2hvC3
	6CFx66g3g8P50hAX/O4jf3Mq3znDOOWpc5obP4KAdYRNx9V57SwFk1G4yqLUyYtjGQ+nfnxEFhA
	jtTQSPPTPjv9tVAmR7++5Pv/Cnrf0HpylcUH8Z5eYk//kj4kEKzZlXyAPA48XiCtOiIRKjJ9f7V
	S05ORFarY0TWdUiVQlRV/HP5Xy1sawgl3kGfgtowbw+/9uyDpUrVuPbzaAlsXRedRI4qOjMob6y
	esSNpXFoNY1o5ENQIgmbrwR/s=
X-Received: by 2002:a05:620a:2801:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c53168e2e2mr697694785a.17.1768462160368;
        Wed, 14 Jan 2026 23:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:2801:b0:8b2:e6b1:a9a6 with SMTP id af79cd13be357-8c53168e2e2mr697691685a.17.1768462159882;
        Wed, 14 Jan 2026 23:29:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:09 +0200
Subject: [PATCH v3 4/8] drm/msm/dp: Move link training to atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-4-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A24Zcv2uqnzPLcAnjjMP6FyreuR3QcbbpXIfNz7XoM0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdOfGXwslW28onuq5O5NRjC09bGp2/i5G1zm7wjUb5
 fwPS1h2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiO8LY/3uaGXYzfmLf0nws
 K5VnybzAL9LMTSuvd9rpvD0p+MWzYHLlut85e67kh9SbzumxLDv8IDVPQzl7/mkLXqt/tpWrczX
 S1V/+/hmhVn5uUojZXP3sn2uZGB9I6qz3a+gxOm2xcV5wpnxo5scXiqdqrasLeHzTsxz2LnvVOf
 nC23MBO5d05SpyXJBX7DvPvy5+i5t7zIv8a8fMmXOnX7WYK9v6uuqFxzv/TM9fc2rC7k6szmi7z
 CCe8vnUydSa05LtbnnfzqfYTytbHKPx4754d9OBBfvk8v5zZld/3SwmZfP8QOnfsvBZZvxVTbGB
 M+Jvn+yL5jzqmmvfJhZ9oXnW+edcTc/zjn0/G/0ll70RAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EufEXiVIlfM4NiyeuB0BOUAawoQVqZKu
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=69689751 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EufEXiVIlfM4NiyeuB0BOUAawoQVqZKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXyTfsmuFXTFX8
 jitXgY0UpgL0QkocGfzagBDcULCWcn5Q2V4gP+4Fy/A7nTv+W5A9zOlO7SL6u778h9DqUlFgqm5
 d6h65VeoUbvhql8IZRnhsgzrumf4owNfFzIRqir1PQVjcaPFy0uzfhmJ42DwqXVB4WXchtbBqIE
 UP/28FNk8bnkh8bvOQ+Uau2cSwj28RNGTOmf58d52O25Ee2MMlvijNDCO9A0BwBQQsHuVGg/LSu
 kf4J3DvtjAQhyphT5W6+USsAU0Cj6U6p8lClABN8foUHrSPrFg0+KXodODiPGbxzbr3ob9yvoZL
 CIEemmasoDXPQRzy1MqyE0ixOeQIUN4KnbsZujLUOV4/8Y1n2sw9wCa2xdUse/8F2QqDDtj76gG
 GigcVBoHPI+jN+CSUEtvvkwPdKi/T7XBJyR1HV8ha9sUwn4Wc/leddF6qGIT7O6A/fgWbJqO9K2
 VlbxNAejgoxYQJYXv3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..3184066adb15 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc) {
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		drm_connector_set_link_status_property(dp->connector, DRM_LINK_STATUS_BAD);
+	}
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3


