Return-Path: <linux-arm-msm+bounces-69444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B4B28DD8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 14:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA8A1CE1009
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A36C2EAB8A;
	Sat, 16 Aug 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgn1liOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A62E7F3A
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348083; cv=none; b=Wp/AkEi1TGeaGRJaKz5cKkWJ9S/6LRJaMCYmhY80fft5H3OWzNjdsCamsRJdHh+b2KO1Lj6NsKD7ekn95vNWLVp9RUb8ImLPy0qxzkn2w7Q6MhFruujMJ3QMxBud4uqjvRTfDPh521VLsLrd0x8xqtxsIywminGPYBhPtPMg6Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348083; c=relaxed/simple;
	bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwWlwQXFBVXlFty+JRJ+mVABHlSRZvDNntQ4WSEl7L0fYduSr0Rg41IrhBlm4JZc5VtLkIg6rYhFvgd61LdrekR5GcpLm3K25LQmAwNqEM22DhBfaurMn/k4naQGWmNnggzurYFTudGtXYobW1/L/bQfmLeVVYwLDVx0yWdtPhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgn1liOc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3BZZH025992
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=; b=pgn1liOc6Kjt3D+7
	tK3LPtR0cFhpN/7UXzrPO256Xo+Iq6k0LLE03rje0GKKYeZBZKTxh2VG8xNXmaTy
	Sn6XScwZs6acyk1pWW/4zVXFg7zdAtJ5dEU37hrpZzIafYiunQNvSjgXkrkVR0JO
	eZwv7UYpWnkTTjrduGBf/1Ojg88LzHiOMisKsjjgNZDDoFulaDUm7BdzaQYF+EU5
	CT5DOv56rPRULdo8RuNx4I+p7pXc3RGffS8h0vgC+Hzh0JrcStyjuaY6kR7JubDY
	ExBTRhgfDiseTsXlx8X8n11pc5+A8GTh0u01mvJr9/k6xSwdd4jjxruWWUk4gGWX
	2tbqeA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfbn8vj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a92827a70so60796736d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 05:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348079; x=1755952879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+KCHHTqRR+QvQr7TO6S5/RPZnrNqLEy6fhDbfe+NhQ=;
        b=CuUhHSKf2CdJNuO3+fmaF7eoOnye9u5fCvZ/Q4ZDMvklLw/fonqEtsBB6DBkNlFEek
         PIqi/aqm0xLngup8avRVfOL6CEooUNtxVOMVXSXT/a66rmIYwaeeDcGN2krUmZr1KuIO
         2lUtIiHZvvX4bGXqn+vupiMsJS9x4A2c/kxmHm0cIKktnyyx3uuhBuk5bTRp/Bl+a8Pe
         CeiBxVN80TuXtH21nA/J9fe1IvWVAmP2Iw2ScTtxP9vaDkZbEkYMM6Zt/2px0juPpphb
         fxQ7Si7yBeHQpz6yxN8SXryJU1eGG2AMEZqzdvH3t4OoZu476Zh+g/Bd0nwc1/I1BM5V
         ZZkg==
X-Forwarded-Encrypted: i=1; AJvYcCUPWmuCnQsw55bOjL88UdLOGR8UHmkzmVWaXifkXHLVoyDcHq6gRcYZU6viQUScnsolgTq6m/leR4LbaypV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf7IZxm4fzTPBaNR4jpobac6/MHEDqWyV5XF8BbyQ/OqJTAORb
	0piYfi5DeNAcbo72IDXVQyOIMW0nzZMvlM6s++6qO+i5/YXwemPKi4+oYJM5/w5yTu9JuKjHWR6
	KUeUMn2bI2S4Vjr0waY8yHlLxQMyc2YWinPG89Baa9RegY3IIFjWwwcsXxzsx269Q4Gv3
X-Gm-Gg: ASbGncs/uCqGv5FHyEwRkzZqMedUJv2+ER8Q0JTT//sKuZ3E8fAhSPIOU7OLYy9v5fS
	GiitDI7nH4huRicF88vgbJilVN/K4aKQJ6507UUi3b/kx+jPDTzhbwEUDYav7GJwOWGZEKonqDj
	yQsRvNG9N7dV2dgWJX3OtY6zlJ2RkV64yeF/6aftqnAx1mB8Z0xJ2G3Hg/LfTEHR/ZUJDV7clkc
	GnkahKMPihUqVsV7pWhSt9f3ERecnZ9Li6daXhhd6DQ4Xiudw/gARhPRkFz4VdffRLwm4S+BU3m
	+p96ZDvGnMO5Hq7XEzfLzxJtCmBL4t3GCkzG+dhJqRa+JG+JyQ/ZVVg/05PmCBWZsVkB4etHJ+X
	E0Bl4Lhw77nCGvBoM6eqgT+zspEzChFu2IV8WJixV+WjKadjD9NZ5
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id 6a1803df08f44-70bb0618468mr24915046d6.32.1755348079215;
        Sat, 16 Aug 2025 05:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOQL6onlKjHcTQTSZYwcPj2qboHayn8rKRBdtJHr/kNyKMVVa+u6QH81eKHnsSjAYM+ZfZeA==
X-Received: by 2002:a05:6214:1d22:b0:709:3d8d:5c2c with SMTP id 6a1803df08f44-70bb0618468mr24914666d6.32.1755348078746;
        Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:07 +0300
Subject: [PATCH 7/7] drm/rockchip: rk3066: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-7-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7eaknZdIIVgkzyGpeqyWY92kXnNZwGkNmo13tFbwgVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxgMHi4qTkGU45yB+UntdRBVmKZr+x/UsM25
 LEGEgGfYbmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8YAAKCRCLPIo+Aiko
 1djgB/4wOmA1OtnxVdCPZ8Z4di39PIjrPkMG0uQmJI/t0Zc1l8LN6lav06X+zI2KDVDqJtxF2NO
 g8QqOU8UNZeo/kURELWxqyJZzOrWgG4qXXEA/4nBe57GtgK/uBOASm5cvxECJmXXrAsl4xFlcdr
 84IRMNS5lpy+y6HeswpNMDsppcEqals/0nvB0xhbIFKM0VHF2eqBD3sWZiaR0h84BPiU6vcvvbD
 lBsE0lzCSfEp0EC2XQvwDi2OJBLUdr6oBSvcad90o7e6CMWks5r49JFQ3pSoeHlLXx9875g9neu
 Me/+6Idd77ROmdlT+vKnBkOG3AAYvWoynfGMjwl6WnS6TzXc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX8PStj8+7Zty1
 FJVmkJVaIKO0mH9Atevs2vfz1kZYci4V33jExUGK6uf32eRoDlzZ8bC9RWrTtd2pTTBy3P6oceS
 7oUR/mOlAGeXLn/zyIFWm172CbHj+vYX6qlLg+c6Qcj5K+b4Gs3I51HpOfQGSXMzq9dCyzsnU67
 2MgtVEm5b+q/WWNkzkbIvkodgJ50AuncsZCHgqmaNk+X+3Yw8zMiUaiix+XEVhu6Hc5EAPg481U
 IphH2FQjmiQjNMrnTib52e/ZNEPkolOxqQIeYK3Rug8yHCULb/OZ6IomyEgr7V2Eag+6wiiCVjS
 tSz38HC4BuT1VW/AcVxn1zt1EqRnD/7JU95LoOvJUHWLzNheRPT2XGGw4qsUyvIo5gD48rmQm1d
 OE4oBjHM
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=68a07c70 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=iNCKscWTIkh_2y45CzQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: K9KbLt9eFvEWvcbsTUSgk9zdBaWEz891
X-Proofpoint-ORIG-GUID: K9KbLt9eFvEWvcbsTUSgk9zdBaWEz891
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160001

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..75bf9a13d8cde1471e8b7e8a8f5f4c0457dd0a14 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -696,6 +696,7 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Rockchip";
 	hdmi->bridge.product = "RK3066 HDMI";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	hdmi->bridge.ddc = rk3066_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2


