Return-Path: <linux-arm-msm+bounces-115105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZCQEAp0Qmo47gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:32:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5AB6DB3F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:32:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EfDN4d4p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NVvROwrL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58EBE31BFEBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC856406812;
	Mon, 29 Jun 2026 13:18:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69914406826
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739107; cv=none; b=X6jAG+j7n2ptMhAIDMFRPBaSjErSZyip5t1Usj8ank+xbUvQXaQW0QXjIoXiu3ngJgGCL9CWz9aB9SdZFgnWD0efCcg5poxco8zPTJVo8vemUJUOcgftwoCOICa4+Q3lGOUWsba5qUN3HM6LeyEMI4bvS1A8P70nQePV9WU6ylI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739107; c=relaxed/simple;
	bh=b2i238VUI/AdKzoSuCKAbFa1dbTjNQRwjyN6xCNz0mo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rh7yierBaN/mKO9poImxGRjj43ZxZTWibN0R3RzR4GmaBbhnUjoP4tm2EEKWw4S0Z7DgJb40t3m5EQf5CsanjON5SowOq4G7U7mEY8eDi538WUX48IIHkwMgjs1N76FukLv8J+ZI5o1b2fWIZGZjAVnYfqb5DpprHb8uiv11BoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfDN4d4p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NVvROwrL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATOhb2619318
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=; b=EfDN4d4pjXGiApYi
	nFnUPTb4WtSWyLwOOWqUq79kRJSR3cwtC4646d6UjN2folbe3f5qAL74/WfoDZ+r
	96CCYcv8pYWwPsV7L3RkiDa7a8+nnau8q3euZ6EKW8sRsrcfQWG5xuJYRUFXs1ic
	p3NwW+4+Gx7QFFdqkWEn9NNzmP7mxsS8PKiKgYdXl6JHFOYIAmO04DI+VGqGh3br
	0tsNPbLOjCeLZSXuXfRIiJpYebzzJSOnTpBa53c3C7RQyxOUjB+VjKDfbDPP/PYi
	QB68rQWBOfxrEFobyclM7wTCrEp0zxM6jaTwPWZKWS8FwAq0v70FrDOP4SmSBIes
	AY1ypQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkrrt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:18:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f05dd0dda9so36428296d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739105; x=1783343905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=;
        b=NVvROwrLM9vvUXPuPXP1yZGrcGIn+bJdBYp8vx2buvL90/3jCF8PEGKU22SiD3lgZy
         tyi8i6xWcj4WLion1zYlIN2aTSRhCkiiW32W9bcbUJA/VjsMlPY98PqFgl3d4WVJ0cC/
         EJEsYD5ogOy4WhOVwRlhYYne1W1xPTlQ2oW+AxQP2yHx3oaqC+94XnqCcqLjjvTqzV9Q
         QiOgIZeCCZpv+Y1uehJRnkqaKAn48sp1k7i0km6jD1KCoR579q4rWl8QPajpUIG4TXAp
         ye2sUYEagPU7KHBOn9ijj8pRdUoCYyVdY3GdXzENxVWDLoXZ0jWmJOOc1/QnCzALX/px
         jmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739105; x=1783343905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3VwBumwCqEjd1GYUzP46GInRqb8UClCfWsUQZYOShE=;
        b=T/9qRCihpJBaI3dS7eUiGiXwM6Z3Snz75fcYutAjViMXI6oplB8CCCKvUk1QPZtOZe
         f8ZWcEQLfylHrfe5ds4k3Mz2tvDyPaDSZ+dh6oROEISZ2tVZnlRWAt2QmrNAlndyU9EH
         H+zEr5SulawTJyFBSvnzie8M14EXHv8fxw0HT98SjsXfmN8AfXgvaWd3fGVVIbqomYfN
         mF1uP9qMbxvQwtQAKzzOXGRkFCmRm7C5lCKORTFFfYbdQJpdLLPWHmweIFrOgnAhXuIA
         KuhFC+S5a2/UHRk9pnoDptZPM/lWrUbyN8LpLs2byEVbrdzRctgsG79Qx62E+2O6iVw6
         bwbQ==
X-Gm-Message-State: AOJu0YySJJ6HmdhXWhrGT0E9Ta+qCzAn+rbyJsJZQRVaZsesOPgJZQLm
	aDHQj9PFHr7qLTD8TQxm79FVWWKBCLndYWW3srDMFpvYGNFKOpfigD7mXHXVQkZ/k6MOj18U2M4
	A9BTM6D4o7t1ickDnAsldyN6of/vT1wKL8Nn3LJEK8/EZMg8/bsdN0jFe1KmccswSNd5g
X-Gm-Gg: AfdE7cmi9Y9RN8//v2WMrU4cAjCBqDe5LPnqCBZRsDcj2IJF85alYLTrp9A/i2/0HFZ
	2kA6FYi/BydLyFRKMEUiATTNzMNfu27a6GuZeJUgaHWBHCyBd9274IAtFY8+oAxe4o427ilHgdc
	+6GVqJF99ahWOYPBA6q967nR681oh1fBUb2jHOQ5dQGyZtKoRagjC7i3Gugz45SEpyWvFvZG0NS
	vKEeiAn5X7lAhO31/QNn7VW3Ang3S44wOtdhp55CfCaBM1aRffyUk9rA7JQ50mxbADrxa6EK0Hn
	vhzDhbG8oQOoEOGOfYT69IwkffCXOV2x7P2NoICLpol4W/DAXouB1KSpn9jAOs25OzdOGCReeT8
	RV9qjCyhcjoNmniljpsXtnh2QO+MF+zESc+hPXakB+2I24B5T5M2MN3+cL6V+uaT4zf5Dh6YVJg
	==
X-Received: by 2002:a05:6214:2a8b:b0:8ef:e7db:1a91 with SMTP id 6a1803df08f44-8efe7db1c83mr58424826d6.4.1782739104689;
        Mon, 29 Jun 2026 06:18:24 -0700 (PDT)
X-Received: by 2002:a05:6214:2a8b:b0:8ef:e7db:1a91 with SMTP id 6a1803df08f44-8efe7db1c83mr58420756d6.4.1782739100211;
        Mon, 29 Jun 2026 06:18:20 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:18:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:40 +0800
Subject: [PATCH v5 22/25] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-22-1d882d9012f4@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
In-Reply-To: <20260629-msm-dp-mst-v5-0-1d882d9012f4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=3337;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=b2i238VUI/AdKzoSuCKAbFa1dbTjNQRwjyN6xCNz0mo=;
 b=9cT3aQekbGmcWb8Knq3maYHywYSVMhy9Dvz2ZE/x0ybyzlMp6YTz3bw9ad4bbocaX+Qq+ZnPR
 W2dD0oUOgJ7Amc4a8Tgn5zU5WBCoNWwC3VL8+Q1/hVZxobHPiEza9m/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a4270a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g1aXiAJAPjuLNC7gjMNh5zMML-MMqLJq
X-Proofpoint-ORIG-GUID: g1aXiAJAPjuLNC7gjMNh5zMML-MMqLJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfXyVH1vHJgZPrT
 6KnosxNFHXkMpTYf2HsZmlymYV12+SonMFcvtuEFiTrnSeJo50ABRuyBAzb20s6ikDFi+BvoECN
 UqcDWZHuSj9Cmkh660ragbbcVWLKhuSdMQpQuxdkm1bKCcoRTgzlI6yonagRgJUbcCM3z9iZSQp
 FQIw2bpB0oU/5ANwIeOmxCAuQHAGhxKm6NkvafiVFhqgGAJHSdi+ufkPwK1hqqMpnep4tQRgSdt
 lnVzhLadoR60w7dltAfqhusSSWsnI8eyfoohn2Whu6QQC1yiZVXwRzq1uJdirX50KqgsfD0dFmt
 IP+fp3qzUL0fyHEjrnevgg5xm1IWgddJp4UUB0ExtS3dPpM2r1oLnrAAJtGbk/40GXICv5bVCab
 5t654m6hzKBOEMmwUSU46d62+dQrfB26pce7DvHpRjX+YuPE+JTK/6XRYEXFFMVtsupiOcM23yS
 HzoDuc/B6HH8XfdqSKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwOSBTYWx0ZWRfX02G31wFYwRP/
 ZokJ1cjXpY+yPAFFYuwdcDy0gJ42yRwIaff0eAwHL1ACpgP1vTlmMhbi/7ou371PSRJLLjjcveL
 RFbpTwUUaQZjAGK+0/M3UYQSmz76hcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115105-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 7B5AB6DB3F5

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d..e70e5088cfe5 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 963303079220..f71200a790f3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -213,6 +213,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..33ab30300e16 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0


