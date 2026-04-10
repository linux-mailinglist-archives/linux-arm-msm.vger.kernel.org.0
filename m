Return-Path: <linux-arm-msm+bounces-102658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBm1ELTH2GlQiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:49:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1E3D5325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 407EC30EEF26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FAB3BD631;
	Fri, 10 Apr 2026 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQtOA5HC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZaYYmX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB633C8714
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813810; cv=none; b=ccjtRdWKUWVPkH5iFAiUaavl8pMc1BgCZWj1W84AYjKF2MvMAYnvqh76JBJEVJeIpKZipIDSKQMSJrR7+p0i7BM89Yvj1RckOpKTdT1wkL3EOH/hsqbKxfE2jFh/c6dGjArjRR5vc+rajmOrWMXwfQ5D9i0TQuW+SEVRyWK6PR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813810; c=relaxed/simple;
	bh=Zev8vjo6Ne+mGVU8pUaXaUCRweFkFvpilX34drpva4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCNc2GGLa05XUkaXvcSVgeRas/Dc1YufBymCj0DQz6BpPjA4nFywjGUf3hvFG/5hcRO9rbEkbFHBVbQZmL+y9P0pKXEKDZ1+TRhG9pLorgEVWD2GVO6pQ9eEOd+MApNKutSdccWZnhFemORTfmvJYHVaAYe0dAQukMBMl/iRd5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQtOA5HC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZaYYmX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qaZm2626826
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkuNQEV8XZqCGyzJul8RBDnuBqWH9JDDufCPPjSulj4=; b=JQtOA5HCSuYzAxzD
	BJlgTc2EI6T6368G+ZC/jT+3z8fhl6xtRKN66FU52cv0iVIZ8vhD0yNoTTld/G60
	8wZJrARXAz1sVqgfUJ249LHPhzVtl8bF18wCKS1DIWtAUkL7G+XDRrDxPHxjSWJc
	9vEw7qZIoHzzIu8RGc2vHJ57nvCtgTqN1L9oJYxejqyrlF6XTk6SmXTpgfJ+Sil2
	FPbWpHJOEERZ//gsCxTa+D0q96Q/MGBrn6xGn6ppDQqTmgIP4LR9VaS1nM0gRbMl
	aPW0Ep3us66vgHybjYYXSBGYhVBETfSuzCDvoc1xuzhbw+6hkEGKozWByjYH8XT4
	daKaSw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu3mdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cd03be011so41284456d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813808; x=1776418608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkuNQEV8XZqCGyzJul8RBDnuBqWH9JDDufCPPjSulj4=;
        b=DZaYYmX3MnuztRLHMeEXgX2qeum9RuG3ajeoFPY9jabRSq5W7gwCjQY6S1FmfWS0wD
         kP3pSw5IBpH8ym8rS3xUEvRmxnpfwOPZeFy5r6PGZYVcyT3cTEjgjdz3Q7yYb8wywnu3
         hl6vrg08gUqhvKjMmzZEv2SYu5oSMzelUCDyqIiLvhkAkHAwde03j9eGlvcSGeigWNzI
         AD4LarZ2mlmVs4zEpj3Uk4LBxXbJ/5mgSocHUi03BAGm+m5d/PYj3A/hpyHflJ6N/eFV
         qp57TP3Ky1D+5s6ym8a/zhz3y46SUQz1KIblp+y9lnXPxnZDX99G8kvEu6jv2gBVEMlf
         +d5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813808; x=1776418608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xkuNQEV8XZqCGyzJul8RBDnuBqWH9JDDufCPPjSulj4=;
        b=hcCNF43y8/1KVIzCbs0yBKcnKQHZLmdn1QJlrasV7KHUJDfi594iSxGOQ8XcQW9T8K
         s/tKYn3mxipGTk65YyqJIysGi3R5AN7sy3YDQCvPgw2+fYRPpNMiNFe/Y8uIOc22FXwV
         Zy3psy69b/23XqQXK++P53bMY6Sowu0HYrDfZAgTuU3RbujbyYMxnx0UR+dYtAEYCMIV
         uWZBXnWUkpdlkSbR910dX+x3/M35f4jPQBBD3AcMZCiP9veKtjMcqsdWU/w9yZobxh4s
         w/8v/6wBT/A+dMnXe7ymSq2FMXveZo1dPberI//dk5GwEmBVhfdIE7vk/OMv2BCIuyiN
         gxpQ==
X-Gm-Message-State: AOJu0YxrKAOES3wZzbgA1QOKAwq6chn1f1W4n54s7xJkQZKkAooIYC4+
	blgKorZLDRJ6fDeKCTWNFRKDHMsSfTU8p7X4P2VK/nfp3bmQL55KChBp8VuNlm0At+BWGdRJYAC
	AGwvrunY3WBZi4gjW9jM2pUnwb4stVWMmBEsVgTpuqt3Y40JpvjJqBhtpDj02MR88hcEoqfUPyz
	Q1e2YtZQ==
X-Gm-Gg: AeBDiesB7ofZKQWUmdHvZObyaPpqwdqllgC1cQQwQeXQu8gcwCwyn9Ou0Vdkc2ffNM6
	6VrzCHxdY8iisHXsEGblZFFqYhriIJjoHA2QIO0DVHObmcARszfmmwCrKs191SEVfhr9oVmiFXx
	GLkJ2Ughh/Wo8lAiduAaLBGw+hJJU2xKs7BmK/WY30Cza1QQOOmHELI28T6BTREik1yl7UbANnK
	oBcdWK2/SiEWIx4borBQOXNqY432wROuSPkn3uXrz7Vn0Nv2rEgAlupAUDgBykmN9T61h5GaM6s
	5B+jcGbNYSLLh+IChr1WsOx5RdeVO0g7wKSS6oguJ+KZBXHuDQ3WlhnRXmCru9D/X2VLiIdT7wz
	ovisJWV6/8lqwABglyFl1jHLhjTKvi/LXXvttw5DbjuQVKKWbBtN8R9F2qfQSm/0ZNbHiUp4RzF
	QlQBQJcEE=
X-Received: by 2002:a05:6214:4018:b0:8a2:3f80:2a22 with SMTP id 6a1803df08f44-8ac862d6535mr30241206d6.46.1775813807803;
        Fri, 10 Apr 2026 02:36:47 -0700 (PDT)
X-Received: by 2002:a05:6214:4018:b0:8a2:3f80:2a22 with SMTP id 6a1803df08f44-8ac862d6535mr30240856d6.46.1775813807410;
        Fri, 10 Apr 2026 02:36:47 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:10 +0800
Subject: [PATCH v4 35/39] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-35-b20518dea8de@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2569;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=Zev8vjo6Ne+mGVU8pUaXaUCRweFkFvpilX34drpva4I=;
 b=oLVHjWdNRLabsfryin9mu2VygyEHy0KlEZWGjsfAvWgGqw0Wu2XMJSnTxRBbak8JM3wfZvw02
 aqKHwYSOV/cB9Sy9m//i7f15vjCw1pzFgImBYhkgNwQglUOSW/UkaAa
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: E6D9N1fcUbIgm2BuBFbAdmF0CHMBYa00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfXxRax0RHoN0gA
 UpEJ8pWl8ehwR1Fe3LkEM5cHibCGPEWRnErxC73LYfTU29Tzcnq/bXxvz8IrjbhVh5j43zU+KI7
 YNRqCdwWRrAdSeLKhxIPbWaeKl8RvY5WhzBd41scQ0XzWzI6+DNf+Rr3DMREh+3Qqw+Dx4RR0KX
 6Q5XWCSCukKfeg3eWZ0fOKa51v/rJZ6K4g7QWFwv2s2TgNb5bU3/Ecbvn+h2fkNvbrIqoQibedz
 Bw68J6GSFLgCCRjG/f5KY81xRFJJDhSwhXc9a29GU5yWdxVxpzvR3I1lR3G//UE710r6gvJp527
 7/hJMzWuByG4UNi8tmi51McgBNWZoZNVOcpyaSdB8rLxEqfaSVBm9K+o1LczfP/4WPxvG2Z0WeT
 H74GRcKz3PremYN0JNucNiqbrYX/pBj0IozI/CW5WpT+EXbGRuK6ewqVpQtA3mxc7uXN4ET2FN3
 tnd7SecKybtAwG/ag5Q==
X-Proofpoint-ORIG-GUID: E6D9N1fcUbIgm2BuBFbAdmF0CHMBYa00
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8c4b0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WDpXsREKN9l9u-HpV_IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102658-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AA1E3D5325
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/gpu/drm/msm/msm_atomic.c | 9 ++++++++-
 drivers/gpu/drm/msm/msm_kms.c    | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 87a91148a731..ea064aa6d8fc 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..a8f5fbb3239d 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -10,6 +10,7 @@
 #include <linux/sched/mm.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
@@ -29,6 +30,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0


