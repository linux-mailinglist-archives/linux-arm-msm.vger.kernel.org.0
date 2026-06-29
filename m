Return-Path: <linux-arm-msm+bounces-115100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GjcdOUt4Qmr/7wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4700A6DB8D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DZRTMjL1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=erxoHQqC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D022A330D4AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CAF41C307;
	Mon, 29 Jun 2026 13:18:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7524408632
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739080; cv=none; b=BKvmnIg8fxbRi3o8vNR/EI/ivp5nJzRNPAr01vuklSxiy+XP1GJLXb5V1oUvNDJPY1R/HGO7lZy5gvxJgjwin1d4yPB0yYJwywInKX0DzGg/q6FaqWQ5nxzn6TgOoiwDlB0LBo1tYhoQ+AoY0W6AS6ejPOpKq4uPpY1Y6HFz3BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739080; c=relaxed/simple;
	bh=RzJquXKOi3YyeF66FrBYDSkGWZjxoRxULVA0FumTtYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VKok9yXf0XJjXaHMRzL++a06ML0ggmVkbzhOrbqwppiRWfftX1g+r96oUHXxD4KfuPjcPIm/DzCFHSb8NWblFSGlCOHS4i5Xch9JRcsytIBReP0O9nIp8btOPBBszwGFubSJOOCG0A8wT2nzKE4zn2sEVDyZPwnS1OqBTs8HlGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZRTMjL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erxoHQqC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAStt12640788
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=; b=DZRTMjL1UvgFaKHq
	LF/eQzkKQWrP2L9R7iVF135oQnJkNS/J26MHWupyBG0NCo8vIZOAtKNRh0RBtBws
	n4yf0fUc/RLObJRCnpF/Cj58BWNJzB5QalWbgelAiQ4UEo+pgSOmXhmg4i9AGVUj
	uqH/srMO7l4m2Q/csYdjGoN/BpGDCItr0JvOihJZuPV9/FJgWVEp5WBIflh0P9Ao
	0ZNnPLyRS8U+QUCbq5/X7ZqYCchwSwLNlZhZQZGYZJ+cTzeBwpX4EESdk7UYG3AF
	41WuMgt4GjaotJQgD21RlRXEdCSjNOT15lJZizGtNYzvbS5cPQ2BoMetHaCcGAOs
	/Hr0vQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s14qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 13:17:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so58225296d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782739077; x=1783343877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=;
        b=erxoHQqChI5O8O103FD4wigLXM5ZrLQGae3KuEeEnvWvoym49EEm8W3JUYjVlVBg+d
         mSsXYdKEFjtpFUgja2Q68C8yntWJpmjZZGF7Jw6lNJYKSarb09RHnAkHjxfQ19Mke5H3
         XauRD0Id5uQAxieuemdclR17yRxSDPEJpP7HN7QU9+vv2VH3D1l92XDUxqFt9xwtE5or
         YR/oFqgHKjLvBLNJdTHJYw3nfE2zMr+D6ixo4Zifw5TJq+5e8F+5vj45yqN++CMuba0G
         6yEwK+ADFfe2PZiHZk4xnRjifqPvbl5xdt9AQT5Wr+L/YRk1VLkOVoH8hoMUOP97FkWg
         lSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739077; x=1783343877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg3KQF7o+VLEpzr4rtd7xV5y0tUXL2CgXc+z/83VRd0=;
        b=EkQcONsCPTfYPajv6VT5kLFk9QHY+hl9583FMIV1fYve18LlKR8srnRvCH1th/GVV9
         hiQd34YYHPTekjiLdQFDw/Nu4Dx+w0jJRp2BTYbRE8hnD5V0zUlPdET5aEfO44IVizF5
         LXVj/HDy3XR0sqLgcRLtC1HsVKtZwJECYOf5r5iWnVLv1KmvZuGipUlI2OZZw6KJotX6
         ww4mgodDcz3U0IcWX7OazxI305iKt343MByaK0geK9pQPbhQ9w9W+PlcChpROSrnsjOS
         nHXvE3zCNtGx1nKkBk5kZpi0lZUo+ZES2cliDpkIkV6r18Jsua0x368AIJO/quY5Fm/6
         thig==
X-Gm-Message-State: AOJu0YwNVhF62JBoDrfwSucMG21NdJ+cdqUtYFly6MJEC+KM/SAOkk/A
	pwvI+RZEjAGKzwkRSILqgEjV0VlA1nnA8LnbbPHtq0geda/YcE93s/24aRk4+QROamtMCXDWp2A
	SCExXcvbMETltFgYnab6f+ZcOqnkszI0ckWv/NmfQOQTw/X/5KVmEKD5qkiY48aV/161h
X-Gm-Gg: AfdE7ckr+gpcbDkLmAnENH+qJaZGwkxLQJli8MrEnmY4eBJi2QGlMrQ5O8HNk6tJxHX
	20ISfSuP2kE6pmYVALqH1C8ecX8nn05/abok8gCAduL1P9dEOZ2gIWWj8Uag+VB/kovxStPFzTD
	cxI/uJ79qErx7YP3Hrl6M74VEav2obx7b9GW3tD4qN99Xvh+IMRXvOdrU0tW0fuUbZPEV7BacH4
	Sd8SQLZA3B1HDhtc8ZUCg7kf6+sSIbDLy+LwgprT2zSijbxUUHWrMtgXAIExPLkCWcjim+mWi7Y
	8bzf/TkVFW/CfvhDeGxukrO5tW+1naHsCNir1N2sN8cypdvu8BCqTmIuT2zew3hqkD3Q1eMqU61
	Yh56oo0+w6HUu36uDhqiDqp3c2CCKI+9hTwn1O3mhevTZsaNohbrmgwglYhRNXsTdA2TOQpfkdw
	==
X-Received: by 2002:a05:6214:45a1:b0:8f1:8349:59ee with SMTP id 6a1803df08f44-8f183495b58mr1994186d6.35.1782739077025;
        Mon, 29 Jun 2026 06:17:57 -0700 (PDT)
X-Received: by 2002:a05:6214:45a1:b0:8f1:8349:59ee with SMTP id 6a1803df08f44-8f183495b58mr1993626d6.35.1782739076518;
        Mon, 29 Jun 2026 06:17:56 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ef0f2b9df0sm56744616d6.13.2026.06.29.06.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:17:56 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 21:16:35 +0800
Subject: [PATCH v5 17/25] drm/msm/dp: add link_ready to manage link-level
 operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-msm-dp-mst-v5-17-1d882d9012f4@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782738985; l=4047;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=RzJquXKOi3YyeF66FrBYDSkGWZjxoRxULVA0FumTtYk=;
 b=uDvZBeCjHj64vJzwwVSx51y1oYqt3Q1Phfzltonav6DnFiFlPGSlBBBPbFKIxLzgaiB6UVYQ4
 8ks5xhS1uBWC+VK+q9JuJF7LioWKSqX15JHjALQjbQUQHc2bYDlw+7G
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX/tEvELNCuXzC
 +7ICmr5xH9gUxw1MEwmoU+Vqsd+91YBVyPRZ03HZumnTw56srcsvYxSTTmc0XCw7rA3eqamfhgC
 nNWzyggp8pcIsCpY7souorVLbodQ+w4=
X-Proofpoint-ORIG-GUID: KuTrs6SfjZ605spZsniZ0mPlPt-GYBKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExMCBTYWx0ZWRfX6HP1S1ik+gie
 7k6/utsnzoxCzzAun7N64NBHynPncEkJ3T5FsVTTYJtcaIYfpAYNfJtu9yR7R9EFTSqM/wiM32c
 9x89LyjKU+g16AjeI5kFbf24QpE1VWC7uB0eUa8NPZWG7gKZVy/yIklJ2YqbsE+7yVoLlfYNtSH
 bWEb5Vimoy8hXly1IAiZcPOuDmo9KwSwi/9GmOnYQJd1y8S5WMJYm+XdVj8CZ2ipHd0PsS3IcO9
 TuyIr5XWIEewGuRf6xlTUAZ2DmmAxSVHXvn05Aw6Uk+2BpXSaZnuWEhJtiH6QhfioZSRv6L1Keh
 yGOUFg1iFqm144gkT2fsBGuamsJg+eW4fHZlaNWLt22fgG7pq/4JfuEk9px1ZqEapF4iKrgcKqy
 7eBjM8BE7jyekaSch59mus3QqU5QbThuw+/Ca6lyeX2jEg9HRFoIk9d5IzXt2K5cBSiZcDnSv3T
 IfoLW8v3pHPDDZLMf1Q==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427086 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=r0U9Mmpn2XdHegFmGjAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KuTrs6SfjZ605spZsniZ0mPlPt-GYBKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290110
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
	TAGGED_FROM(0.00)[bounces-115100-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 4700A6DB8D9

In MST mode, multiple streams share the same DP link. Track a link_ready
state so msm_dp_display_prepare_link() runs only once per link and
repeated calls are skipped.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2a74302bcb7c..d56ee10ee065 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -702,6 +702,9 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (msm_dp_display->is_edp)
 		msm_dp_hpd_plug_handle(dp);
 
+	if (msm_dp_display->link_ready)
+		return 0;
+
 	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
 	if (rc) {
 		DRM_ERROR("failed to pm_runtime_resume\n");
@@ -714,14 +717,18 @@ int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display)
 	if (!msm_dp_display->active_stream_cnt) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
+
+		rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
+		if (rc)
+			DRM_ERROR("Failed link training (rc=%d)\n", rc);
+		// TODO: schedule drm_connector_set_link_status_property()
 	}
 
-	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
-	if (rc)
-		DRM_ERROR("Failed link training (rc=%d)\n", rc);
-	// TODO: schedule drm_connector_set_link_status_property()
+	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	if (!rc)
+		msm_dp_display->link_ready = true;
 
-	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, dp->panel, force_link_train);
+	return rc;
 }
 
 static int msm_dp_display_enable(struct msm_dp_display_private *dp,
@@ -1566,16 +1573,16 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	msm_dp_display_set_stream_info(msm_dp_display, msm_dp_panel, 0, 0, 0);
-
-	rc = msm_dp_display_enable(dp, msm_dp_panel);
-	if (rc)
-		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+	if (msm_dp_display->link_ready) {
+		rc = msm_dp_display_enable(dp, msm_dp_panel);
+		if (rc)
+			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 
-	rc = msm_dp_display_post_enable(msm_dp_display);
-	if (rc) {
-		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		msm_dp_display_disable(dp, msm_dp_panel);
+		rc = msm_dp_display_post_enable(msm_dp_display);
+		if (rc) {
+			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+			msm_dp_display_disable(dp, msm_dp_panel);
+		}
 	}
 
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
@@ -1624,6 +1631,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
+	if (!msm_dp_display->link_ready) {
+		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+		return;
+	}
+
 	if (msm_dp_display->active_stream_cnt) {
 		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
 		return;
@@ -1642,6 +1654,8 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
 		msm_dp_display_host_phy_exit(dp);
 
 	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+
+	msm_dp_display->link_ready = false;
 }
 
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 676213a48089..0464f8941e8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -22,6 +22,7 @@ struct msm_dp {
 	bool mst_active;
 	unsigned int connector_type;
 	bool is_edp;
+	bool link_ready;
 
 	struct msm_dp_audio *msm_dp_audio;
 	bool psr_supported;

-- 
2.43.0


