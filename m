Return-Path: <linux-arm-msm+bounces-64669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48781B028B3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 03:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17622A60BFC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A15A1F4CB1;
	Sat, 12 Jul 2025 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHY3mW2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E61F1301
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281926; cv=none; b=hclaJWWVvu39aMquPIAn4PBF7GzOfTpD3vGuXv9if25dk57kkpElZLp7tuHlLU0ohkIfsNgor4hU6orUqmNRXOg2QVgm83LV4wdgQDBhCqsGDD0Oyh1ZWSzYwUSIwUYT2MnxGbYh6awHv9xdqQW99FiZmGOVFCDm3nXx1eGZ7Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281926; c=relaxed/simple;
	bh=188J8HQVdkSWJL5yLh9gG8Tf0d3WxXMDhANnFNnA2Fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICwwhfFoA5RlSZ7vfkAtDh2oqyx9fc88vGg4beTOokhQSUiJE4dEBFs9iLKqfjYENdOutgXqmy4njN2gxZY0YQVafRU2JpNiiyaWjtNhHy0NG1jML75uTiL5Syl4hLFGyN5VYvR4jrW7DxHlv4uspSkVMNxc8STBonPdRNmj87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHY3mW2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C0gwPm001286
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fl8z648VrhMIvou4b1DZumHvgXBVOysJzC66Tq4IjrU=; b=VHY3mW2FmUlRIfZ4
	ZOxSfsfARs3eWhNoskrb4v9kz2lzNUfUooKYRY9CHx+aEqadXRGbHX+6SN2P/egR
	YsfW6f/WRF+ZJZXJlgy+nf1TKdO3qC0f35olOsNDQnV0pQR9RvLi7BMauF2PKaSP
	faZCAtTP8Lo8q4WXmfKdOofTE8jLGpA3iQ79EqC9PXdvWNo8sE+JNa0kYKKQ4Mrt
	Hq7OUkPZIgsaE1hBPcwM6GZT98+A3HnLrkrBLge+0FzNWSz1nYYEuTqHlKC/6rix
	/BKwnGXe3YxiDkVO7MRgeRz35KoeEwVp67H3t7215rXlRztnGSjtRi22w9Sot+TC
	4NQTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uddjr0nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Jul 2025 00:58:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311d670ad35so2612753a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 17:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752281923; x=1752886723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fl8z648VrhMIvou4b1DZumHvgXBVOysJzC66Tq4IjrU=;
        b=v1BYH1CU5/DXX7+rReN5mKSaYei/aLM+GgYWKuyAGA+g/gZI5E1mRIIe4mUsGBq0W7
         l8H/GQWiuRg8zE1YHQUjyNJWQLBkgHS1/6gwJpzsN5LzzGEQ2kPkPJ8hW68lK2o9OJHQ
         DLqJyPt6bkStiIKQ+QNDwMlKwcIDoSclasaWntQ8/FO0Ii9dsi8SVrDkcrDReI2ELpF2
         H3EdouW4ydR8rKqT4sFceyAWhYmLbOsWA1BAjLekTqUbevkWHPErbH5xdOKuT7VyeFMx
         rr5MXGkDZiBwhLCMRxXV9qfvQv8h4r28qvRC478WHEhNMPJzJKLOb2sgGdikf9LwE+dM
         HSOQ==
X-Gm-Message-State: AOJu0Ywn3DgnKX9XJWrLWS3H5/TcVvKGIa0lS2y+8mM3onQsRXyBqAgL
	WAc2p9gxkkzxsQyUrpRdj20kKfln5DG8Zx330qSXcMpYWoLpcMnyGczxVtWRwLLGUeRh4LLzM5c
	cTgTjb9KMU4BmJH0ytQvu5dlyx7xBKhtp8acNP58OsEYtjOVag3zLacIwONEE24k6LlM1jfM35z
	Wa
X-Gm-Gg: ASbGncvRiYxa1hFNpDpt12GlECJ/4CUmQZ4yr8x6Fshw1T81s9Ctymgb+J6MJG4vMhA
	SKDJjR/DA9UL9XAh50/p2OQNxRn9SC8mebU5tixG8ZNnR4fZ8m8wyAH6Bn9Bn7zTCkrNG77EqjB
	gx/CNQt0hRRRoENz6dVyMF1yTdvSCRS9FXr2FuD71IQn9kRcwA68ZOZyKRON5HGhwgBViyOVwBL
	CyehVyGlIEQW5Nc35VKxyHOt9ffkl8X95GfbvC2MIb2WjIQqYa9EbuwXeTJ5MhgMYHaXDMJa3Cn
	ncVzs/cBUme4cW4AGmifbjp1BuJXSkp2MS5ViYx0sy8SyMS/i393UtQkwn8tsgs5Ksw7ksnrMVE
	w2DeLmf7pFWtF63/IGG4zhUDQ
X-Received: by 2002:a17:90b:4c0b:b0:311:b3e7:fb31 with SMTP id 98e67ed59e1d1-31c4f38f296mr6562764a91.0.1752281922862;
        Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzKmykxcOi7eiVHkBQUvfbqe7W8TpJLzKZDJVQgtqH3XstptXMGJj6vS+CfJ5H1ALRn0iosg==
X-Received: by 2002:a17:90b:4c0b:b0:311:b3e7:fb31 with SMTP id 98e67ed59e1d1-31c4f38f296mr6562722a91.0.1752281922296;
        Fri, 11 Jul 2025 17:58:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:58:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:15 -0700
Subject: [PATCH 10/19] drm/msm/dp: Check if DP is disconnected in atomic
 post_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-10-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1047;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=188J8HQVdkSWJL5yLh9gG8Tf0d3WxXMDhANnFNnA2Fk=;
 b=FqvQDl31EdqzSOt4Hvfj+exBkiXqDCV3n0dR0LgZUSZS8s7Kirwh9cM81Kk0rDfMx3wCd/r9L
 5vrMnhBRtN0BLDkpuichaWN+O2kslCCRaf2b2pp1tEdByp9TD+phAmK
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: shslbTbXDWlLxtE9FpXXGtsrc4dHJ7Uc
X-Proofpoint-GUID: shslbTbXDWlLxtE9FpXXGtsrc4dHJ7Uc
X-Authority-Analysis: v=2.4 cv=ZPrXmW7b c=1 sm=1 tr=0 ts=6871b344 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ict5BleZVNFJU3CK3-QA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX72AnUbPBZOv6
 Y1KOE+jq+DzN8biX+eLw9zo10BMr5RXKlh7zG54MY4vHGfNYTgNGFX5dGRyLtKAONTPuvNTeS5p
 4k97EiyehvV9vOOwcSPidoTMvDpF88WaUFFzqJ650X1A+V0mEBqGecQxwoWHqIb9VjB3UWQiLwU
 7F1KBPeGyumTJvhTwT05CQGtNo/JmadV4kPow9czXM4cVHj43DcWlVYp7tritNYrN2bqh84lhpF
 7Jy5Wd920gPUIvIeF/LOJHBaGfh16kd6nbdSiYffmLmUatO0Ai/oVXYmaJiqhY4ybbK66JP4t6z
 Jc62MME6AtlPH+ms81lTv+/L7lwjYI492jR+tid+904AKy4JFnP5UvM4iUlN/7sHDKzxbcLkcnm
 tSk+AxT+h6522cHHdgNddOn74he5ia+Xh+qr7/QNthbRzdXjXXpWVCh8rlPo7J6x0uGJ63RQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120004

Since the hpd_state is unused, change the "wrong hpd_state" debug log in
atomic post_disable() to log if the DP cable is disconnected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6535c1cccf84..4c9a515648bc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1643,10 +1643,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	hpd_state = msm_dp_display->hpd_state;
-	if (hpd_state != ST_DISCONNECT_PENDING && hpd_state != ST_CONNECTED)
-		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
-			   dp->connector_type, hpd_state);
+	if (!dp->connected)
+		drm_dbg_dp(dp->drm_dev, "type=%d is disconnected\n", dp->connector_type);
 
 	msm_dp_display_disable(msm_dp_display);
 

-- 
2.50.1


