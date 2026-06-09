Return-Path: <linux-arm-msm+bounces-112109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Is4ZBpbjJ2p84AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:57:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7747865EA04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:57:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NJqMtT75;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VjvdivEz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 435F7313A2E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433613F6C33;
	Tue,  9 Jun 2026 09:47:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13A3EFFC9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998467; cv=none; b=ra+R09ls/znUa0y3/4GSKSiygvfywb+t/r55Doa9wYiPbW26sIFM7Px7yM5dap3/+kO9Ctw85o3xuCeGoEGoud6KZRrqvNMu7aIspdNI+fQyawSy4GkQNh7TViBlueNEiWlrzdApxshinvFZEAt77jFPqrtZPdTl2HwnbISAGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998467; c=relaxed/simple;
	bh=rHOJ/Tfly+p+zzltozyn9wJCqcj0lLLdlbTm8fgeIJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jWhyY2IF7OW4fP438P0U+vPmxYk4I96m0q2xD8qNmgQFfUDYFFKiAcgvKjcnU9fKvX1O27bCPDDIVkcxEsn/HBF3O3/dZtdDOHe0iteNYQ5r7Nz8UW951fMjM82mpb81WNNnZVASFR7LVywN2smn0Vqng0NhSVcqF9ZnqHW6nzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJqMtT75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjvdivEz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599J9qJ1815818
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=; b=NJqMtT75CfewzpSe
	GkjST2Uo2e8JFg7Fwk5bQoiokdkHsYD+Zstszo9xSSn0TvUaxUcENsOnq5VsylnV
	Yk4M48j+4j/ygs0wAXDTIfz+Cg6UX8lNacnpk3AVkVy4BW40Anl45D7npsmfdacg
	NIZRcYcM31nIhT8FovxqnKgOgQzP2KwTrxQkt4OULjoulgvZIp/wi8syEK5faY1Y
	N+zZTbWOTlTXnZpzhIefdru6OINjMI4jZQxDNeGZk6gs0hTi1e7SIwJwVRN1z4bc
	xnDaGnlVYaTn7+geknw8q8QkdHMVph2/QHJsqD6enidNYc8d6bb1VHGXcQXHieos
	vbGA6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr4uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157d38ab37so618556785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998464; x=1781603264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=;
        b=VjvdivEzK/5JioI6rPoTqjoQ4KrLMzwWXoeTqcELRfn8aVYgzw1+r0qBJCPLWlYL8h
         zVJLfuthTz6uJMYCmam6i7N7tSzDGZogPdUq4tqx7UVCDOnLiVRmzJ9g01QJQG/u0eD7
         s/mJvTJOOaB5JAkoTvEYj/7QqowOdvQU8BADHDIxXDh6DPlYRxo1vV/hPTO4s7fNeSG4
         H4gOwsO8NvWpG+wXt+IKbEzEkhDk0zKRCdmFX+9tmPDMFDDUFudToZQbxD5N7sD3U7BE
         pX+0LuSU5SVOYobEI6reTd17RzGN2ulvgKCuTbrVUFwKzHydqaIdPiE1JRytfnruNA/X
         Sz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998464; x=1781603264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PrpKel4Av768jUzNR25shjZmFALdbmxo17UJsOuCq8E=;
        b=AxV/ANuQp/s4uUUekbEOBvml0m42Cip74l1bJEo6tz4sHgI5/fZpo2wJ5yV9e8+eVQ
         gLA+hg2j9rU0GTDIKaiu+E9b1vYawGm7QWbPWGJ1GrzEftnf3NjzTnMkaNfpbsLPDKnf
         B3b8k1TCGklmo/shK1ih0dcvPmfU49TGl1QPzitBG3BDESEnwuBoMDjOEMwyu1cGRBt8
         fgCtgIClyBZyQa7LzrTjgXn0oR5Rchg7hd4+U6kSckcSCpVAp6oYoFW6ePxggmLhg3Nh
         19U1BH52wAQeP6GtNJr1KvRYd5pNR3jJ1TOSS+Mewix43HcWFa3Iq284s05zCp4vlwzH
         kDFQ==
X-Gm-Message-State: AOJu0YzCSsOA3EAx5T3Nbvwh08PbXcZOM4uyXkEToXDA3VdyrCrZ1Zs0
	q7yYEajs/kuwUhrof9cWBm7dbLGjutzB6bTbVPbCzMxmOr2w1ssm+0w0+DTdJzSk9iE3df3hqZq
	bHmOzqmG1KfEAfRyXPPCiO+wdsIaEj7mLvkM0D0K2tBbSfnYTVpgo+CVT/ZeE1PX8YsDJ
X-Gm-Gg: Acq92OHhgnpE/ja/5cfZIGY0Y+eVHpTlvNb0Cbv7JntM5CpFWY2f38OKn5Mg/lFd6du
	X1eapIvh2ykc687SKlaYNLvF7WflX1WDMUQKy+Yu8T58X61SOwEQs1lKKAteTUhHpxDocK3ulAn
	VXseVJrBkRvi9hL7Nn2iSDtQEfZrq7abcr6AjY7fuK7KGSCJUbspv4yVLK7M2gZV/9ADt5Pe67u
	MyX38qYebPgwLFw4I5Ax/6UKZvXyQm/5gS++Nydzco+MVKTGrAHlrbXQXMKL6+bGQX3F47W2Vlo
	YERkcDlRvWisgya2wiHwSK7ohV+c4+0gtbbxkxAlB3RflI8FggmlZhOJCccR72qx0uGqT1WxSQA
	SoSYL2i7Wz3uBMKmDSYvtOVKiuL5ZOYCBC/r0vTnjj0OmV/zOuqcMiIKW0jKu5Yja7dhksYb0Gj
	4qDWrVPZ6Fl0ZVGZIxyQ==
X-Received: by 2002:a05:620a:27c6:b0:915:e1db:7ab0 with SMTP id af79cd13be357-915e1db7b3dmr665714285a.45.1780998463814;
        Tue, 09 Jun 2026 02:47:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27c6:b0:915:e1db:7ab0 with SMTP id af79cd13be357-915e1db7b3dmr665710985a.45.1780998463358;
        Tue, 09 Jun 2026 02:47:43 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:42 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:35 +0800
Subject: [PATCH v7 13/15] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-13-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998393; l=8509;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=js7Ds0kDP3MA2PA3qJwTal/QoxqVBRyKdoKt/vuLT7c=;
 b=Q4czln2aTELSd+w2rD8AgSyWb3LyrU78Eghjd2ofwZFeJbLLneUz2atRy4Cjm9oWvrO1Wj6b2
 GrlLOwEH2UhDazeOvuVqmvAYJY88S1AscjmkCpv0fopNm5eM2j617YA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 8FFBFgw8LPjCHQUBacnUNyAUlqN2HKAK
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27e140 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=LmD7BKvqrCyCckpIDn8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfXzRbExjfjpKXD
 39148ePZmBfLatMBVjFC+zj1zClR5+2RAU1nxIHJBPESJZxFUJaF+ziOnSgcRk7xKOGUnafhqZD
 9c/19MkHHWQU7JsCICk98RPtxD8lVmwtJ8fIKTDv0aZxCmRpM7CVjzchhINEue9vw9w+XFVynai
 AnpZvZBJDjx3ZEIlxbOAw6v0DApmKfRrjj0RPeqA9ViCRAtfpSpZV9O2qbp7r50MqK78n5NjcC/
 KjbfKHkh5qzGj/a/Mf8vO/zNZVWsba4tU2dLTGIdeFdQUrsz6qYqPn5bRDC9ZHzLvJhwA/w5GY2
 PM/UsRliHdrq9RdP9dMT5BprrsChEi8zcCYQmAuUK1cvs/tWgS4fHgIPU9Htyq3nrhGh7otZ4Rn
 fHZ+FlCUJlS58J92hNP/o9IhvrMZWPy9awBOvB2nMOcl5QYc/6lfrt1WBY009rlnOxnbFta8e3k
 KKW9sN9wibyQ1ZGofoA==
X-Proofpoint-ORIG-GUID: 8FFBFgw8LPjCHQUBacnUNyAUlqN2HKAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112109-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7747865EA04

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 39 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  9 ---------
 4 files changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 63e5b191f95c..2d5ef087648c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -738,24 +738,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1406,11 +1403,9 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display,
+				  struct drm_atomic_commit *state)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 	int rc = 0;
@@ -1419,7 +1414,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(state,
-						   drm_bridge->encoder);
+						   msm_dp_display->bridge->encoder);
 	if (!crtc)
 		return;
 	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
@@ -1449,11 +1444,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1470,11 +1462,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 0b65e16c790d..5116f7bbbd02 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,5 +33,12 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display,
+				  struct drm_atomic_commit *state);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6ac5bac903d9..6b8923d9dff4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -49,6 +49,43 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp, state);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_commit *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -115,7 +152,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp, state);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 4bd788ea05d5..da412c788503 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -27,15 +27,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 					       struct drm_connector *connector);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_commit *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_commit *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.43.0


