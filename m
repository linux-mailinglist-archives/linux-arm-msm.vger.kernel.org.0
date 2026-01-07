Return-Path: <linux-arm-msm+bounces-87946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9D6CFF5E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D5123009290
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B3F35C1A0;
	Wed,  7 Jan 2026 18:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyrngcOK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4htH6FP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE308357A4E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809720; cv=none; b=u68xtym48Fq1ymftAHrRCwmVq8cw9wnJOvRaHr/O7ud3WLsLvZMp75XwJcgWDEG0+i3R1OmYepKbawUjxH62MC3lEdwPp9eo9GBExT45r6TGO0HQ8pz+fuZr99mb8JBUNsTqi3dSiOxA1/4y5pV6YZYP2g6iI+52iyGE3f9hQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809720; c=relaxed/simple;
	bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHcnyA+YamCiT4Y+jHLu1O5bUIMlTWdryiU1uGgeTWWtdIhmfmRul30y15/2HNwUw4751YcGodK8x4OhvNX4mkQF39fx+DR/uGRBUSCQuV23iBgydqADH6mAeXpKc6aHQLNx4FynNf97AEEdxtmjZy7l0vQhnZv8Q8VvPWEakyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyrngcOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4htH6FP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H7Gcb2988753
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=KyrngcOKBiSTWSSY
	izNCCazNvrE8uikK72XmK+Vv0T/Usx1TJnGEi7FoeFr+BCAWxFn5GM7sB7rkw2+R
	xnkxDU2giwWfYxFgRXZm77sSilAwW+XQfLEnbHeNL5YkgC2bF8pOS/2zY6D1p8zU
	ibMfQnY8buGFHBKi37HBa7fzog69JpxFX/4NuXpuhM5+I5jdzJdUKlQP3QuW94x3
	bA1Uys7tKjWqj4sgvnKSkAfyCHp53cZhkuDxbTa5PCwLUHtNBOuNyxLNwnzd34Ed
	j7PZBZxB2W5SxkdUVH/o8ptaf5HAjEgqZZJHE5EDaujMhMdI9SLzwqRb2mU52Aea
	CfoW6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn2nsmhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb9f029f31so632004385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809715; x=1768414515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=J4htH6FPx9qpc5sY+Xmej8/1lnYGHCgpuo9o4P0WF9jkmQrZ1Knnd/igmfpVyALr1t
         FkLYhCK0jX7QbnAbUMqiIzf5ZQ09UoNAWON0+2YfWa3BFjuNLr2tt5jXiNxlDqVkFEHr
         A6bK1eJuGoXmpx2+b9/qVoe5XWfClt6I2g0tcWnq23NMEhhyWjP5BjObSzWVmJBh6T1A
         MmS9ps/W3uX8Pnrw6j3tm711XAn2dwlTP8qQrlETabCvYShXEzym4UE/25C/hwR9YJM7
         MxY0RUOHfL4VWNI7k9+nL+Ek6brO7xyBHhaK21HpirmMlumkFUO5Ar6pOfZl8TtgkPKO
         OkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809715; x=1768414515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=cw4fRdZ1DZmR1ouaQYYIdyToKQ1OhW3vz8fRaAp5yH1dD5u7KlEhWYwGXb5W1MA0tQ
         NTHaw8FkgabbvbMXVyCJqZH9Gxd3qrKU7p/u4OhZ/EUDsW44Tt24C0jdgx9rN9EeTsAe
         1NkHe39VImD6hX6iw5QNEyVgbHCySLm6WTSy6qnrIjOxSH7vwf8H6en2nMKf62/hyHJR
         penMbpYzuhA/D3K5IEPfoFEOuie63OmqgkLoYjKtFAOir85Tn/KQt8HvAgWgkmXeq+be
         PuXpdgzJDTU5quIXOmzfOFtKJn/OHrvzHfBC9cW4ZW9bkcu9b0LlZI6crk30WeT2l3Za
         7D5g==
X-Forwarded-Encrypted: i=1; AJvYcCWCeVUmfNS+pSQ7JYqQZkaMmynId06fUS1tGq9IHHYPjD3eBCtwyYNuKodKqCMj4pmOxQ4O2LpUuaTVIU20@vger.kernel.org
X-Gm-Message-State: AOJu0YxsF/XC2Q20GcLPgBDiX6DsA2jRdrw+IHjn6yZ6+c3CBoBJcUxV
	0nx+8z0YTrrd6jKhfJy4IjkXv94pau1XU0k2+JrNPrEWV9d0sm3gKGwi0qrP10zv6nR3aFEXFL4
	yxrlDDLd2q9WmO6/I46ugZfZjHXEeLZc+NR5LVDQ2MD10Q3pDYZQjzO4TghyV04C7dXhs
X-Gm-Gg: AY/fxX4zq+INlXUtmvJWLWSQ+fAirPpAAdXngzhljtG4fWeQvHM/wF0KDPwv8OAwsYB
	wXOloV8DxanVM78vXDuY4+4qUiJT+bulqVKMpBBLFeYVkY0EtjP1v31rbb4ciBQ6zCV280nOTh5
	RhCoUJ2c0/Ma+Wc4ZS+YNhTBP4IhEKg2n/tMtCr8gMBGS1HNWJhUNj99XrIksLFD6CYnISAwbfm
	hxO+xokoIsFV0d4UwX6+9H5z5mG7sF9MqGY+KVWRpid3C34LoQG/HIh9ZNehTuSYwwB97k4dXOD
	GuznBTBH3sYZtPjWG+1N6QIjpMoa7yfFrCe1SwotwJizzpOgYei2v9TpANw43ilUA9TWa33cCZn
	puH5qh7tz6SD7pSx/GZDCNq4dS6QvYTJdHDRJZt6XXglrGhKnvt+Qo7Y68Cru92aIpDYqZzC7mD
	HpLgUXlhYiQeI0nP84jIxAHSE=
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456873685a.83.1767809714612;
        Wed, 07 Jan 2026 10:15:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+D5mrG5EJMb00tLGXnGg/5a3iMwygbvY5+APGv4MWQpPpWnlnvrx9Hf8phdL6F9vP8GwsHw==
X-Received: by 2002:a05:620a:3941:b0:8b2:ed01:b65b with SMTP id af79cd13be357-8c38940dd0dmr456865885a.83.1767809713987;
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:04 +0200
Subject: [PATCH v4 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-7-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoqVOypf3nnz7ysbV1SEu2HFL4awvN5mTrKSPbj51+
 +HNQtvQTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZFMHB8MEnRhDz5j7S+s7
 33/wuCq3e4f0x0ZX/s8/n15gMap103T9tH1VXsdtoTyjK0HrN38MWXF5zjXm73UHjVK8GY/M2v3
 SSqTuxuMI+9iXSq+6WG7sOSCfWmNi1tjVpBC7Sa7Atcb1jx7rMa1jP9dN6+f1uO6p0F7NLHKs7X
 vYqkff23seqZc1hh1t9rINOs58UiHnRuAviVCTrfz7b1QtiT5vyfh3Et+uU3On8c8PKMyJ6V1Wl
 Mzvy3zdzdrznXCNGIfM95Jm3xs73nrUaDuLFp77wabg8FSVhyN77+u9LzM4bD6zrSxoyyi2in6V
 c7dLMv/d453GTG+Kbj738GAInXdKPufnrbyYBYbuh6TUAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX5lSnXw/LaNVM
 EmkCD+ZNKQUVgcUBGSViCusd5KGsWyljXuG1AyWFs+zAS9KDLcyTTnchhxwriTQJOcxzyiInflF
 v7SuH8AiUNDsT+v5bGo8hlaKAIVxoNOcA6st+VVvKHe+JK3MlgYDSOfXTUm2qJbzwax9aIEeqnN
 xPLANN1YX68qQqVouFz2nHuh/wbhgIiDixMzwnuY631oGtU3y4EemvY+rCDk5zAjSQzvrVaiYXG
 eBqoTaKkR8JTx8YOuWWh1bl6DJmkSeMGsIHzgnblsUqXkpMkQRTvDlvu9FzRnoxME8QaDSUpHuR
 I6q/Odx1RbYq4SXrnSs/xSIdzvz2dlhFmDPBbXLCTkFWls58M7k6Ng7CeUAzrEDwHPsnrAm2Z6j
 FW6mgcc8a8Z+sStnqraXOxhXV1Y8pEsqDOkL8RdmlbDytmvH4m9pPFGVJFPzBCPm5Ad+jnalI4s
 U7q1XPyQTC/e4fUSm4g==
X-Authority-Analysis: v=2.4 cv=CYEFJbrl c=1 sm=1 tr=0 ts=695ea2b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BlcUND4nO-7AUzOND8F60Dmk2pjv2nk6
X-Proofpoint-ORIG-GUID: BlcUND4nO-7AUzOND8F60Dmk2pjv2nk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070144

Updating the InfoFrame if it can not be sent over the wire makes no
sense. Change drm_atomic_helper_connector_hdmi_update_audio_infoframe()
and drm_atomic_helper_connector_hdmi_clear_audio_infoframe() to return
an error if Audio InfoFrame callbacks are not implemented.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 5a3817271d91..e8556bf9e1da 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1061,7 +1061,7 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}
@@ -1102,7 +1102,7 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	if (!info->is_hdmi)
 		return 0;
 
-	if (!funcs) {
+	if (!funcs || !funcs->audio.write_infoframe) {
 		drm_dbg_kms(connector->dev, "Function not implemented, bailing.\n");
 		return -EINVAL;
 	}

-- 
2.47.3


