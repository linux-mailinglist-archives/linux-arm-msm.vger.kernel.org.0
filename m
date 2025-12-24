Return-Path: <linux-arm-msm+bounces-86448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11766CDB0BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76DB30CFD95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12F827280A;
	Wed, 24 Dec 2025 01:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlqhWfoS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNYTqcNg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208C327057D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538249; cv=none; b=VIJrcdAolS/n1Y0GoYfI/LO00+8x/g6EQ81fE+pbRsbyTPnyFTLqiwqg1BLRjr8lcBmErKy3LHWJv1SuDg0SY+cFa4wvHNBNzOAE4Gp8D40/r8Jer6LCYX6J1FfEmj5YTeO7SqprSTLqq6G5i6/CieZOsXq1pLR0Z/af6qxUjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538249; c=relaxed/simple;
	bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekLrWzjXMcPIfRA31kFWk9pxFYzoy0LnjbT5txjoWTyXO5z7PGq15P5SNNCxpDFuaXnR4eb1zsW0pY3VbTXOgIlDSeK6spVZ3+2FFrkz4im1BhvDZ7kbM1eHrQfEW8d85bnQ6OUBmp9nYSoF9/BIP5jtV1uDjQ70o4Darnr3n1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlqhWfoS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNYTqcNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEs5xg461728
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=jlqhWfoSus3AvDYQ
	rNg9bNMgYw3zocQdvrdxXy5zd9+nVPnYik3umQeq7Mmy5TnJxJsd+oTkcbSg02YL
	tJRoDy8grzJPGgruw6Maxu+YfHm6coLBuXuwydQGMU91gsjihn+disnYvNpaiYxJ
	ykGhPxjB8pKv76xpOyCwQX9Jwr5wSrHlYaXtQRIGxIyXo3f7NLyRqyhx4oI+pjR+
	k7YNcJdVZdT/hUIB2ZMPZ0Tj1SbWVvQ677CmJNXRRGCrosb8XlOFzSxJs4jjCygl
	uLcRnnKQV0wPWFIkJtQoSnI3IhTy89qHQ5TuDEMuzVZsBV+ghOHxSGDhxLmU5Uk2
	wzPqvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fskjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2cc5b548so143849056d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538244; x=1767143044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=dNYTqcNgDsQzI/6GvL47zgSXvzrZdanEhs7YJBOKU7tlGOPK+HcsnLS+f8frdt3cov
         kRBRt26QNoFDIa6MTm8STervaP6/ZT9GG+Xv7QphZnnAkgNdrudkgKSiU8OQow3WjR6e
         Gqt/swNPaoIYSW7TfGYL4ogLFEpx3PoJju9oFfnOE4YJZBOlOOAMXqrsIv3fGCA5Ny7E
         aImM0erh73jYqfWhlfVUoi4VJ513NNNRWPvFJJM60g1gDBxCPrgjB3XjNS0oxhe5D+Ac
         PgwqOdgw5qOUeLc8mNBHywuilgGE5VcdWVuD0+FUsXlE9Pym1cv39dSFP+4P6JCvDYYe
         dx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538244; x=1767143044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
        b=HQsWAlwWk4vXO0E6CkWciSr6sBJIlDLFFhWmsGuthA1Ku0JSQUsGt8+xbxPOLRY0UQ
         lvO40l5n5SMSYugMMKdx9gnQ05HZiJO3674ELv3FeVg9/2d0m5L5IaQHYBm3tDs0QX/Z
         wwT0zmumhn8Ac39jVPCrMtvOVYUI7GKX4xOjEjXuibSuQnSvADxASE4cDt4GOjGz/RVn
         vnrs83724ziaaw7ErUXrSpZsGA3O0JBJ0+sqfn7A5+rcpzaN/XXHKvrRfVLeh2lWKDo+
         sr1eTWsj56zlt9R1dnrvfXBOUQtksbGbXCm33tAWHv42d+KQWYQrx2g0Qfotbxq5qHn4
         bRkw==
X-Forwarded-Encrypted: i=1; AJvYcCXnJHPozBuHr85F6imc/uwl5djXSiBjiJGqxTcg5NEcEj1U3B1qhE76/xz4rfXVDu6HLkki/7tVDcxezpRa@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUIPJIRtiRH8e+n2l3xhdBQkyMur7gdGFFHLRZ1ul6WKLM0IE
	+jNRpAFwH7VbCPaBXyuzXRGIdKc9Q2SsPgGrVNhrKJ6mrBBDdeowKjVCHwDOw8MxEDYgARIgwwB
	5GxgNnlivEkIhtDySuVDySDjd2Ygw/0zVtaJyCrxxmeea8h0HMk9V7xWJsR6RPTSj/52s
X-Gm-Gg: AY/fxX6sTU+pfCnmvFM79MZcUv6Z+v4fYlbiv7hEPiSA8Re2/ZRKQdjBzdxNzzN4z4S
	RC2w7EthD9Fklf/9eIPg5Zwa2l/hfg+r6o51CL+cIfyqUZsD95UNP6b5mtLAo1KX+7gA6tMdDzS
	1JtrJBUTTPUIhMy582KotagYtq72cXkZXvlZubHd+IOtJZTmv06Ph6igb6Mz6IaYJkAxvY4yaHu
	dWKIBu4c/pcwlHFG1k92++eI8UgEjnvHttP0aWnwojAuYjj7c2o/l6b4Sd7bsTi4fXUWsb017aJ
	vz3krmcnlYwT7I9EVehxb7ka6dlUQ9BAcJDnhYqe4LY1KlMXZhpxOIz4MQfOPrOwVJEl4Xhx26R
	4rKhoEEn7vOsI1A0yH8Dsl8X6Kcfw5lTCEqK6KDzHpoNy9kE4Pt9VRZvnPQlvAa+MGlQWAUo4x2
	wkZHaTKQNmf+tM0ulGVUVNlm0=
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846526d6.11.1766538244299;
        Tue, 23 Dec 2025 17:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu7+HH145K//WnhennzRUAZ/qC4YMZkCHH5OOgkflOfdjzzhnjIk8vQXkFQam/FvXO84smjQ==
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id 6a1803df08f44-88d81d47b5fmr175846286d6.11.1766538243819;
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:04:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:59 +0200
Subject: [PATCH v3 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaPmw40jATyUWTrYBTNEusZxIc+obHstv5S
 b4iElplUN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1di3B/95raEOH5VDkaGoqgK45/yZh46TpjSkI0p4xAQ5QWmsMaaCn7Newqpeo25B8E3VpDS52aa
 up3rolkowr24CN+AOTFNP4qaLU+wQ5ufsLePmUId4/Sf7f/3uLCmTjU2bAAc7WkBJDBOUgESVoE
 VPOds3GCRBLX3X0qEONZ6Q6pJmz9433H5cMK5o5GZz3dTS0dZZqphPcLWyxJSLEmmZrEn2G8Wyx
 MZQXEWNaui7oT4aHMyYoZX0z2RTqrLwJAAmkkLQISa4jHnSF5bBJb4YQauizaBu+BJqV1TOmbVf
 WZtZHkfsakdCoN6Xjk8QGpdcOMYzMgS1IQv2DEwSOdtfE7Y8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4JrAwEW6te9NVf6Z2dpKikVbcO4bl2zo
X-Proofpoint-ORIG-GUID: 4JrAwEW6te9NVf6Z2dpKikVbcO4bl2zo
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694b3c05 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX5V+vAaS4ehpz
 6BIA3sqQVYDpVU3kpzsYMd8XenOe7Krt/mEEVFD+i9ZuK50Ss7h7875q3l+gKUrbwUABfFQ9Zp1
 xTQGNTVsnH4na+B0b+pv8Ns5s2CuPj8VgPjxEXnjad8HzasYGXr4Pff6+L6YJr3Tgxfx685hKkZ
 AbvNrQ5hENGx2DbeAGpjD2M3o8e70J5h6/C+FhkZNFEcF6Fl2eQANeVsuH0hoBFUEMeiFVaDCcf
 L4pKvl+tM+wvPeCet81mWfL5ClFvW4TezgjgYdkDk8cCPqks0ZgsuBYNO2+rSxurpYOuCt2LIrz
 znhwLgYms5EwzXlV56h/2JLSJLcWyPMVuLhO4fkxIXVUUacfD4SN2AmGQvjtfvWYbwu4jV/MBSU
 T5yadFguvVhIG1whablbeHulFArkkeC5uDzqIqzxCYiSNsjhLsFSW7CXSASS/veXnOq1/waVfqJ
 RqSufM0OQZvVpPTmIkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3


