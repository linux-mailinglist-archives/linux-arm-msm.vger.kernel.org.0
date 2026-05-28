Return-Path: <linux-arm-msm+bounces-110099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDFfOtQdGGocdggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B65F0E17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B259307CFE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37BE3BFE2E;
	Thu, 28 May 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8UFai0+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2AbVBd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E8D3BAD95
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964897; cv=none; b=AmtWfZPGAlbYCcW5WNI/KrMjRs7ciGDFOCRTdiMIkxXd5Zxidjqmc4S2cwIWwLsfS+L73Ywna/u6Zd1s7z5hcGnOm3n8NQTRIrJc24sEvKkYMX4Qzu0xD3cuXQUnrKLOWwNsESVmMrwdSEg0oylmY/KxQS8vQ4ifMQGt5lI8gcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964897; c=relaxed/simple;
	bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbQmVN6hLJ61KjAaVivxRn3Psla5hBwf/NvgafcdhZ4CEAq5ZGkGd+5MH/KbzG8lUeupDuwBomsfFrLB0yRwk9oaqONbmAlOqBpUSE7V0q6qOW+FoXzVJbiSqQYht2J1+dqIvmsBEd1kQkbUuPFRDy8lYzpZ2wKpAXn2i4frvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8UFai0+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2AbVBd8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vOkM2793670
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=; b=X8UFai0+9MuaAWsB
	tIK2fdVnaHnbQQpyp+mCqUUUcwy/Eep/HgeLjKDkjtUmoEl62qAVxXgMqGMo4VXv
	GI3up3BaHEqibRKV/SPGf2IeBPSnN0oAcM91PIQmKUJ9HEvcvrIn3UMegeBqIfQ5
	xj9gMFb6aBIUf+DSsES2/0JaHBqS1ynM3d1ntqfACuulRvyFdO0cvjsjSeilEUs1
	crNCdfoaQfjpLtG0rCijSKpxZiGP7iTloDSYNfV6qnis3u3g0iTtrqEw9WVKggRw
	m6mGKPAJuv0ZewLwdjiTsdxJEKmhU73RLvYzQWTv2T5M11Y62bto4HPJ4KKQxgrD
	pga+nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1tekr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:41:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914b65e7644so979476885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779964894; x=1780569694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=P2AbVBd8M7uyCuQ+awAPvETrx1Ih4yqiSQ8lpVPR1HYw+FqyRFp2xk5RNPy92uB3R2
         1pgvaNE8TGhxyIOy3nqXgYnwdNgs9aYtTI2I0oUbq+tS4bdhWy1eTr6F55SseXNSm3T3
         1tFrkHMIyK21LYa+xgMa8Guj0xwInY79tqmdkHaXD33TTFNesOzfXLiS7Kq37P8a/WE5
         a+KRyEepBTP1vBvjVP9uhw+YyaRjWfEYRBFemdzHcdZZqrWlKC8b96cfpLNVvuJpLO/X
         AqjQm9aPjSDLgmN3wJQYC90aEtBUmWqjts8n5xJ91uEixWhhVlpuHy6qzZfcxsBU2g1g
         MrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964894; x=1780569694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sRjgMQtRt4M0KMMF63fnqZRXOOmmbwogwYrfMYQ8brA=;
        b=RSIhHfkTgtzGH63DLXGfjN3Er2zsi1c537E5NfWbOlFZF+DVFwdOJpqidFAO+Z4PyW
         nQyIDO5cxRwF7F1SIjB3s8eap5LFPuNHVfOdyjSS02+LHAuPvoBZ1tYBwUvlypFc+WwY
         B8SUCQaqfXUQKBmy6s3rLPvS1zC7IJ1uaO6iSqgt1xV/zytH5+nAQtti7vTGNPZz4T8k
         8dDkceYGETrnF7PotIL0BOJgMM9jEugtrAqsnNZjCodmSeriZDa/RLuHp/q+6rH5Qgan
         Buh0MrSlZ7jaFhpcD+jWAqzuIWkdLOrXRsfcXflKgHQS6KxCDW+xkKSuPHU4Xs4wVlsz
         CjkA==
X-Gm-Message-State: AOJu0YxBROXv05GHU2WxIZdZAbrOHPZfdQBNh2G7s0VlDPRbYu8H2W/Z
	ziOXjaDIPr/qTbOSvfCPcZz3HWSUZnXx1GhAkXVrwd3qMix8Yf7FBUDtJqIRx2rZI7VZ+y4iI3R
	5rN+ahNhXMmgmaIAi79hWX8V5kuGOdh8lX2jNugYPqKrDaVnwuidYWDNfStyZGGhYgJd2
X-Gm-Gg: Acq92OGxXDbLj1NWs+ZanZhWIJxq/+jSHvD7LF6eT5R/h6NdrGea02yPz1YgNjKbtub
	DlTqzD1Sxm73Le3T6F1xWD54+qqNNXxGt9n6WEFpinQecbYyoEvYDgimcDRpWXBADPNFB70Ij2j
	+t9++d2CAnG673jShSyXa9xoYN0SNY5sqACYDPD+A5NaostxvFQD4AxDWcZSkqlJaxrpU3XMUG2
	znlDYoLJBlvxfN37hgRJV+L8htzSXUWVEGKwT3Y8+Sw4VTOopxWOnjonUJQfoL1LMdHPjLUKnJT
	CrCOq9QZrxH2Gc/Xb/ALeu7GioqGf6i3pnZIYBChOUhJDw4/V6ZisTbXk0dA8/X4zP0yLg6jxQJ
	ylXZiPwNoZ9WYzdIp1eOJq14wKt/QVLwa+q+Uqkt1u21MYyBxeaSnZNF9j9wG1CAPfbRYgiS4iM
	piSaBAJf6m2jun2/PVNQ==
X-Received: by 2002:a05:620a:4608:b0:8ef:3953:7ab with SMTP id af79cd13be357-914b4974690mr3816770985a.40.1779964894486;
        Thu, 28 May 2026 03:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:8ef:3953:7ab with SMTP id af79cd13be357-914b4974690mr3816766885a.40.1779964894022;
        Thu, 28 May 2026 03:41:34 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f86fffddsm755148485a.12.2026.05.28.03.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:41:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:40:33 +0800
Subject: [PATCH v5 12/15] drm/msm/dp: simplify link and clock disable
 sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-dp_mstclean-v5-12-a9221c1f1f3b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779964831; l=1745;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4TJKG8RTz4R+dv3UNXgRl/mjeEf45SUuZJzked/IkbU=;
 b=O2vDyy28Q7m7hkeaHk95FcqK8jDLNnDpdGRxSppdMbe8o4dOhJ9Tlri//9/rgsR4+pALPGcry
 hGSxUNPZVS4BGE82XwS86BiSvY//xdZxMeVXzMHqTznPpXMmplATIXV
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a181bdf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=W1j8KJVysGQzs9t885kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: TcJJilHQFFran3_6Ujg6ZzOCiykKtoq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwOCBTYWx0ZWRfX2UBHeFefGPRv
 nZDUQ4+5no7Ef26t/+X+KDYNCcGkWyp3XMAYEpItEh6w8OR/mgpVofUY1BjxFFVV7Yr/tgtAqni
 MRWg3l7tLoGyCZjjlPL7K+xdLZWaPRBgcgojqUtZIlTDDURv5v/BNhNSFlGflTjhN54xmg1Cvou
 L4SS3nQDemZs9tg2PxSRUx8QEtpyDdSLmrvK+L/qVpF5vUH2bxIWyexeM+zwUKAf4oBjV4Dy9oF
 lBcCAO/kjYYu6wv8ck2+hmpYho9JjUtfLQ0h7vM2sOca6bkow2KxZ19Z7Ybsg4BkgIqA3w+N0Vo
 9mF07kI5yDmzfNNppopn2g0mFQtECLKFFrfQGn8O2tGTiZA82BFPa5UX8h2c2xI4AdoKmtUEs8/
 HoV+icwyd669ZLOvq+X/TttZ0uAVWwHfNxOQkhpfKxYo3KyjiMeFSQxp7Jq5oFDbNaEI+9mhP3S
 DQeSUCVNgLukunMJrAQ==
X-Proofpoint-GUID: TcJJilHQFFran3_6Ujg6ZzOCiykKtoq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280108
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110099-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 457B65F0E17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the common disable steps out of the sink_count check to make the
flow easier to follow.

No functional change intended.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8f472633da82..63e5b191f95c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -716,27 +716,19 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 	msm_dp_panel_disable_vsc_sdp(dp->panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		/*
-		 * irq_hpd with sink_count = 0
-		 * hdmi unplugged out of dongle
-		 */
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
 
-		/* set dongle to D3 (power off) mode */
+	/* dongle is still connected but sinks are disconnected */
+	if (dp->link->sink_count == 0)
 		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+
+	if (dp->link->sink_count == 0)
+		/* re-init the PHY so that we can listen to Dongle disconnect */
 		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		/*
-		 * unplugged interrupt
-		 * dongle unplugged out of DUT
-		 */
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl);
-		msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
+	else
 		msm_dp_display_host_phy_exit(dp);
-	}
 
 	msm_dp_display->power_on = false;
 

-- 
2.43.0


