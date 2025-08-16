Return-Path: <linux-arm-msm+bounces-69438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55482B28DD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 14:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF477BA350
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DDC2E370B;
	Sat, 16 Aug 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XmaFgEny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37F92E1C4C
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348077; cv=none; b=R2AlVnIwcZAN6A4HsLxZL442zF2UqllTRxDeY/9guB65WYMhEwFi851om2TGgyeeDhVy8J/dkn7phwaAKJTMWjnUwqi+DWOF1vQ5Xs8uvOoRzlejFe22d+OV7nhPFHp/z//74+eXJuaNCJn6xkzZ6d2f7emLYt+kSViDnOOnEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348077; c=relaxed/simple;
	bh=DmbRKJHk5oRAB/lPzIwmmFkOQ5dwAtGETzJHeLHHKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWcLbebd8q5G0FXsHrZn9dVlBOAfJ2qIRE8vstQiP5o85NvMxK8ghwMAFBFSFx8VLsk6draWFiEO+5lspVkfMvbMVuVxJQivfy7qmldkMzGUPNPn3tvdqs+hdYYRejtaTwvP3S7S8feONpagM7DIWVx2aJznFMqbPXDx53b1MtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XmaFgEny; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57GBg7Kv031661
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+DN1RQ5iWFy37PJYH5vMr1yt3EhNBuEfrKEgtBjJ44=; b=XmaFgEnygI3wpB6k
	X8YbBP1SJiQ/xkDQkntP14wZ+7biVKQCkNA8IH0We4vdv2/GfwwPzIpsz6fz6ETB
	+O03PMpJ1aMKPGxyCwCW0rd2V5VSoh0mwxrMU3Es4j/hVkSdmoA6JKzq5akntWR0
	OHQUWL6c6JJDrO0EpkdWcViUAgSfX8seGvV9ymg6B0IsCAPDZPMS8/HMkeIxX4zE
	B/LUL6hW/Axr6Dpc6aVb82/4eDVSEICbiyQYqXw6l1H357E/zV6Z4kX+sCeDg98i
	NNSLf1TCdsLsPVHC0lBmMHrHgpSt0GZFhsy7Ingh/1DSQ2zj/TkAHK5Cp6cwyhbU
	8sgcpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5m8hw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd0193so62128156d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 05:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348073; x=1755952873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+DN1RQ5iWFy37PJYH5vMr1yt3EhNBuEfrKEgtBjJ44=;
        b=Iossd9zA8B+xXWZtNOD2HQDS1WQ954fdcOQI1hfZcamNUkBJQCQYWC2eSCCLknUf4w
         VhbwwwSB3M1M2r7ObbVivgPifs5Ll8MVlWR0AaYv9Tx/3MR/rupluqqsqz+ktUMC+LQt
         VFpaq6+UXBqR2Iuk+a4cSc+ilP+A4Wvq7vuOhsPIIuKJohLn4Fr/+f8VnZC7SQbp1Kfh
         Bllz28JjDHFKwwf3YNdtYxra62Qoh9l5L4ceSvrTATo6+2xSlxpaePbU1SgKhvr28jAi
         z5c/PofGZ6XxCXHF0xyVXCcSAF3xlidsc7vU0Z8EyCUesHwqQEs0wmVPiIhD5aJN1bqg
         NaEg==
X-Forwarded-Encrypted: i=1; AJvYcCUPuV2TDwUULMJiiCsZ+KZyvkZJNXjH/4zl4NIwU+ikB53UAcbTVQ2ZZviGxqS+0MRRIsguqd46EBxvTgUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQk7dJglUJGRWzLmSMNl89zBMvy4n5brMUJDTtlpr20dn6OOoA
	OJd4bKv1BT6iA4KS6oiw/OwDXmzvypAQq4v97x+ZQngdEobTzQoBtCw4yfL2C1PCr7aYZbH9d05
	+VGZqKbg2qFvrQj3rrLrhZwi4US5bXVHuEt3bI/pScBX2RlOqTaiNhMQiLW0uroI8I3bh
X-Gm-Gg: ASbGncttfmM+GXaRfwxApSuRisFXnXuW1DXhBxejaWHN1oF2NJxGWuNbVVCmxOB1VQe
	lbmVveG38f5vmjVbsgOXLo4jCA6/aP5xWayPhnUxrcyRCh+j3m83o9HG1aYjFsAEK4mq0aHnC8N
	cLBojc7al+cd/3Zl1NGOLNqOJZfSM4tMEexpgRzMoa193gItICIbUsooisqYqQ1BA/oflCjfNYI
	xU7rpL2YiZGU5kk8+IalLBq8lHsvuV5v5oyS+VqwwHNK/lxi6kW2FsWngY8QXfok3gKsCRQq7Xy
	426263EVweQKvnhiEg5UNMQxkUIJZw4ntHQF8RauEG1fZ0msSO+4G0j1zyikdRbkCOmatjSB8ct
	eJHS6uID8Tf9xXiO4X6ujkdXBWk4ka5ZbvFJpvaWJ5i7dIUjiDVWY
X-Received: by 2002:ad4:5945:0:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70ba7cae369mr76312346d6.51.1755348072699;
        Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAdZSpkUqvcLouYBz/hMv6ITX2aCNjDHlkgL/LzL/FzF+yIDQWC2R9yzAGQtiDF+Yu7M/Svg==
X-Received: by 2002:ad4:5945:0:b0:707:77be:fc76 with SMTP id 6a1803df08f44-70ba7cae369mr76311876d6.51.1755348072153;
        Sat, 16 Aug 2025 05:41:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:03 +0300
Subject: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=830;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DmbRKJHk5oRAB/lPzIwmmFkOQ5dwAtGETzJHeLHHKjI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxfulVQQEIFrGQv7TVF5i0bGwohs7DjMO5Bi
 27ClR21i3OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1XCZB/4qvtEP/SQNDva3+3vq4krCw9kSzxLGdjGdVw/tgMeW5/3T6SWI0ZXg5Kzt/5ni4P7yvSm
 EDPaT/urG5eS2xX8/WOivyKKxBeSYQv3VWhHqlDBqoOQJW5OkQLPfMBQbHZtIgKoQ7aJCHwTn9d
 HWLCGARgFjYGvtmShrBjydeV4yWinl2EO2WNM0jpELO52mnDHDl/KzegdqSjmhF3DRoNQy600wy
 5K0K6W6ZUvgE865jSkXskg/ayPbsbVVzkYfiqktz3u+K+JXAD4Xf46u7sWS0OI7QNuwI3m5tySd
 nDDSA+Hy4cpHKnNMgVm/ZTHa+IeV4jqqUxQWFvasdgj3YQju
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a07c6a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=0nAs0j3DZZh6uBALfPUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: jQ2MA2YKzMmmRWHELapBAnMeZw6SS_Cf
X-Proofpoint-GUID: jQ2MA2YKzMmmRWHELapBAnMeZw6SS_Cf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX+AsZdXHLs0gR
 1ugaEqOMBD4n2aLbeFmE+ZWBfdsZ9gZZ1lMWSFox8Ba3kyfsXLB5grYJ4w9y+OzP4s1/OaF6WLx
 IHqf6PqQPeMBkRh0M5ZdknWb1zFpAxGN3QzyUoHcks+lz7Jyk0gjasrRW6nwpemftMsphP2aQKN
 fWC81DzFAt7EeJ3NwJvcFEpPOaNSfJesgpkmtrYsGH+wR3OIVsKzpI12t7E7bf+9gC2TwT4mN+e
 lWpUoM0q0TzZLIgEus3DIEMb+kki/aEjQD10WOQMvtqijMk1muPPvAdDvXdCfcWtTE2AwBbKNpI
 Ek0UO3/kueYvEEeS7LjYSwNG+bjYsBTRXJ7oWGHAvUAJ05c4D3jDGxVxhKvinOaj3GlkBZRzaBR
 GbmSMXL/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.2


