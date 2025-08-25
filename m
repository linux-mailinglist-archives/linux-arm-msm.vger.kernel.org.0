Return-Path: <linux-arm-msm+bounces-70708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A05B3439C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B3BB4820B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DE02FD1DD;
	Mon, 25 Aug 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn7sQ+IW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED12EDD6D
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131547; cv=none; b=qiKbX/c/rmRyvcRabvY7eIekgRvTZTP349YIUmUjQuZaFHFLTKb0aYWSBHDtzGOghf0ASDJ+SjHap6YJM9Llp88zst6tP/B+I8p8DTkETorzIJpaP94ofiU+boqqA9dPcHu18FlQSgOV1uQ+cGgABNaBV6aw1mPqsYZ9cqiqOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131547; c=relaxed/simple;
	bh=pTkO5lrOCRU2az1iDakadNH2filyq5+0cOxmM1NYfG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sRlJNqtrfZe+3n3zbUZr+QxU/6AkCBl/rPWMngYvp0EBfL9XdGMx2V4D6VeEG7ZF2pRzaPgGnPenCJNXM69wA5X9wRMFRMt0BT8VbavR1QVE1T/RRZDu5FA2rdhDVx2s9TYByn6gk4yT7mT9IpKCqsDnacMqSpzxuYJ5W+hW2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn7sQ+IW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P82IEH021128
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=; b=hn7sQ+IWfBj2jg8E
	HMgZxSbjSW88vsHP6pfIWCVgFSP6ELlszyyLF6DAzUxZNXSLxIoxSu/X7QHEd9cj
	S6Xedbwbe3aMAKRqBBcM7gGTnb2fvNul/w4iDGd+/icl/7TA+bf1ZOFfJ426B6xz
	D3IbU0jwHyneq+sgJyF6GHUAnCEo2WQzRonngsZTSEeG9rbUbW0/31d4MmH9y+uF
	aWkoVuT3X58zGlOm85m0GCeK+OQN05aiDj/6oy3w2wqfnTx+SnAy2O3/ugQr3DaC
	Uv7rbphZshuRd87s88YVgwRzQ0HzauZQwLrjB6inOhivHZbQHjSRu2WsrztkxgAd
	lhUdzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5ehn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77053dd5eecso2902798b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131542; x=1756736342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAhM4RTVeSeD/Y6Dbpn0SMNYvVqhAEKxN2xxqLLpF3U=;
        b=kyaJ54809WIK9D7FnZZYPRmBkAn5DZRcMiR9TtqHiPzUDNKas1tGHmF+3lr3ZUGfVO
         SFm49D4FR/zsthDa3NPs5Eu9UQs78eLpdUlrnvVJpt/Vbv/YGlOYNGXjcDSHbR8dq64k
         W3XikYKKXJyfPp4XqNuQDfUGsRaKFxomzUKZeEOkUaQRKFg2XI5W/Wfyfu2XeWgb80mV
         sH9sF8al03QRsvLszkLtcHIbq4Hhk8+lTLK23SaXZ1uE9TRLADTXJK9vKrqi4ajVLdaA
         ZcEI8StjBEjPrKttQJf5eQFq5XnJv1NVebJTR0CZaHubB7t11bKKZG3GvgW2cibnI/+q
         fvug==
X-Gm-Message-State: AOJu0Yxes2xAqFnZhAvI0X0DBp1L1zy271hp0CUqX3a7O4uaeg+0ZOHP
	IkHvQtJC9/2tH7T/gdHI4219dK1QSDO5ij0SoCoue1DV65fKvEieZUDjRoRWXhX7eefHXQvav3O
	CasJSHEhnif10Iy4E0mVBb+mn1A2wjCiST8QMBrRjRklQygQpDx62rrskigEZ+4LL6bLj
X-Gm-Gg: ASbGnctoI3vl1BhesBXdBnAFe1iJstqSsdTW8DLwPvGSfaDg8m2L5aZrKm4JZiv+UBf
	BoMD5nhKiyEjNd87reEb2o08yxGleXf6mTTe9We8NqgvwlVQdNDztIGHCttPN2Ad6gVZlvej5rT
	RBGD5oFHC5IAiy/jUbm8tUB9Arvs+SoEFyQh+baxqU6ZIHW36yPZR+OeFskJz2m/oD6oDZHAYyK
	jL8ZFxj8aE1dotMqUmHigSuRgprPMBDpOFlASwmDR+beBVNmdcT/Vr9Q6kfyR68ZXCDhb3LPHIu
	ssnL/pZ3Msdo91xi5v8MhbqCZ618CfmqbkzfUZsFAvjGBh8JPNBtuMsJmQyEsBmZWUInS34=
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-7702f9df069mr13576466b3a.1.1756131542176;
        Mon, 25 Aug 2025 07:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSPY1HtSJ8tKKojzOATDlJlkBa+IcBpDR1Y1au0tLWU6lqQsO/HxxDw/4m60LXZ6fiBBdK9A==
X-Received: by 2002:a05:6a00:a94:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-7702f9df069mr13576414b3a.1.1756131541613;
        Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:01 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:13 +0800
Subject: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=2282;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=TSQ0bYxvwSdSGTKkoBYhDKBWe3uInELiHmXnk72zRV4=;
 b=duMBgo0ElFERIwAsvUqi6eTSil8TrCpytGdMUtwvdCYzvbKFkhAt8aEGrEl9QJIdII6AXu1ut
 3dsERUkZHWDCiDyny5YNcGzsI0szfwwtzR8XmZ/2ISS4ozrDZKG7WH4
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70d7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX62liJj90LVW2
 vIJYI3OK9KdCu4s/Gsj7RNLicm2WevQMFjhcRqoCUTPGZcGTma0Z9HRXT/u5YqJcmMAGStZTIYs
 80KvJc4PnorUSmKRCmgjtu/yPUQ1nvoZfIQpsEc7cbEnpSu8GaQNEoAXLigc1RuAD4VyzAKbLgX
 g/R1hPS1ogHvNYNWWV+4AhhJHRcrdsdSERJ4+jzIk0RkT28U+rcev3gYDED8YpbZzsoETKUn3V2
 FZXcwq49F4RjqWsRaLJkx/G/uMet/QsIuNVZi8x26qgSpw4aRfNj+GM9nlZMBqEwCNq95100bK/
 zv6Ab84LJ4i0Y9XcfD1GkAnqkZIaKzesme879xJz+SHQneXJKq8Ug98Npv+Uz124JznfW+O1A1M
 w1WBh/r4
X-Proofpoint-GUID: L8Fbx8VE2i0CoXqctV-1A449JsUSvYZN
X-Proofpoint-ORIG-GUID: L8Fbx8VE2i0CoXqctV-1A449JsUSvYZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
+			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
+			       dp->pixel_base);
+
+	if (IS_ERR(dp->panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
+	memcpy(&dp_panel->link_info, &dp->panel->link_info,
+	       sizeof(dp->panel->link_info));
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
 
 int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1


