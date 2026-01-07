Return-Path: <linux-arm-msm+bounces-87949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA6DCFF916
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA15337AB75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CC436165B;
	Wed,  7 Jan 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbCTIULR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaa/fKrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6D35EDDC
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809726; cv=none; b=hJGioTVdFXiBgsjBvYXSpvmv46g2WEkZ35dgDozUy1nKRrfTGJ80vBqOYOgJ/tNpxXTTnahzSO/ZHvIXRSUjDVpNm9C44Ckn79j0eKR2lfN5gIkZ0RHooVUwStofktllm5LnInO8V2hCZT2xEfnQJS75BiXsX9DNxAXTBz0Mq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809726; c=relaxed/simple;
	bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccWMzQpzCenWwRr7jOBIZQIVkn6oGH+cf796VJz8jG1g6WGY1lP+CYjvQ0/15XQvtH+d8qRixgD80bsWGhxvUEo2kCCq4eS0t6kw+zJHBCmYDMKfW6jj7bQqGdLsPpTC3ksAXnxc+4pn5Bj+bQxZiHszJFXGA38sPvhbm319iqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbCTIULR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaa/fKrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607HTVcD3751449
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=; b=KbCTIULR+UQD/OAh
	U1rI7/tfl1/ayoTyuMELUcglhFt/QcCGv9YR7isr79DbYNFS++Nm24Mu8T+F/ns5
	Nb46watlWR+VJAYBlUKos9mkuWeL6NeBUNVZUj98sMVDYn2GjcOiUdMMpXb5ieYU
	GiBSz7AdGoLuCVNMugOoQB39e48Zo0tN0w05xOS1T9zXpjBM7thGm9bfybGIuNeB
	xcjjgL2nWqLLasPKHDHVkvqInzjqR3T9K6aYC3POkBBlzly+8qYDAHlsSxywEQ+O
	taP/Fnm6reneRix/8aOooj18dqvaHgLUcSXdljAPsXO95mEpzCjvaJPHJ2mTKXoA
	UVL9rQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxcr5ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso917291585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809722; x=1768414522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=gaa/fKrhgUyqC/yId6kxwZjBq7/XSSsusWWriF++qCHwCDQClP2uCVj27RhEE2EXF3
         drlAwuHrlIpvCPsXW4SQ1n7J29nIJIoocKLCDJNWMPz4pPEZxoW3urPDr0fkvi+GyyN2
         AXT5ivE3B3EZBKiTPXj3s6h8nqPlCz/Qh1H3FV1U43+OYiYX/pUSKuxJ4+VBgrM9DG5O
         uYDlaQ+reY/1ghcAYRFdnAtR3w0POjyjNXjFvMULpdx8LSBo7uQiWNfaW1q0h835jE1j
         VUJxqRwTJjNQPs4icVzNt40ZlVPt5ya12qfxiTPXMYb7aS7Jjr7nOnIYVGMgWg/NMFir
         aotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809722; x=1768414522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rhn7f75cBzRSaSyNIXu2sGOU3jGwzD9Mh33JQAcGM6E=;
        b=NbrSONlx19kiNQim22gm/ZDZIPuAVZv3xXuR8ik4bIKe74gK0AUai30oysj04lKdn6
         zfBnyrKQhv6ib8v43g84lFjGffcp9ZSKLIsP0zdiQ7rLF/WFqwSM6WpUqw9aQzNZohyf
         FvlI/cqCFd9xPSEvbhACeqoLAoSJ7Qs3izXaEqkxsiq2hdJPikOetBvka2pqD9kjerZr
         BNZC88rsCdnszwhpJ6FCA+bnqGhOS5yB1bRo3Ocq3TYE0x7+0pZ6gDZiQPBK8srCL6V5
         ngBX/56+Sy9/Dj+hBrqFs2jSgWqPwDome3sTZ43f+L3v67ofVnwW9Xgto8R7artjcUzu
         060g==
X-Forwarded-Encrypted: i=1; AJvYcCVzmb+f5/5IjLjm2o1qgYk4lAWp3cplZ042VT4IzQECrV+ph5P1bSxBoxSB+4Uk7rzDQc3ADG5d9jjsDpXw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bVybNkiKybOf5Dg+jvv88YvOWcvXeThB39CmproHSj0EYpYP
	/ab5KmPlKw/qHf1zHNTfFA9kj7Xu0jkf8lUl+yjOMiEuHSnZsNc/VJtC6xicy+POZI60nW4CZoD
	DPWQDuvqM609OHl0UtiJkMKZZmx9mrK3vsR0VnJ2ylImslGN7ZmAX9yDbuIGjzW26PS1C
X-Gm-Gg: AY/fxX6pW7rx6pGGGGUsmp6Se2OIjF72yUPKEGnyOlgV6cLjEcPmvYQ+Jhe7lUniqFb
	YVKLd3Tgnke+tw2I0u6cwl4A2uxbBFFG/du925d3EjZrwkLsxVn4D+GCU+VK+nERaWIqsQ1Q4zm
	GyUsxBoq4jUvIszsGJGruA8k9mAgCw6/3yNWo1deNm4XllEwntY90GbDPyoHTF8ppaEvih+e8KC
	CmDNSTEajtN8zH7uj4tv1vXlBTO4fibaHE3NhIFNPr29stS5XMlyv+XNb1lN6oRAIU7zeMHF5nC
	TXTOABMjj7Ie5xice0hHpmwvBiWt3k0MlQC1Cd3z+j4O1TURFY8CAiE+Vrp/6X0PZN6n0U9O2ux
	qTXL4JxYCUjbBkEt3fpAE+VNXhMcIRtSS2w9SMmfRGsyTUhCFxnNCZTJkxe/La3tw50ZlCCrZ8Q
	7wXghkPWkulvjyg1KtXyC3FmY=
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456797485a.67.1767809721962;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDhZprVBsv7NrDl4r7/stHLp9ske0/9w25bokRbHgFqXeEm1zUot0CQkb+02Aes2IA+aZv+g==
X-Received: by 2002:a05:620a:19a5:b0:892:10cb:b427 with SMTP id af79cd13be357-8c38940bc70mr456790785a.67.1767809721391;
        Wed, 07 Jan 2026 10:15:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:07 +0200
Subject: [PATCH v4 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-10-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fqja7nqMdmSMtGtKfnnZaHovKcc+8jCwgpdYFW7dJBE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXqKldBKXXeIUEl9VKknThFajiJ4bv/Z+Y6zlU
 AwqJpH32O6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaV6ipQAKCRCLPIo+Aiko
 1SajB/4k5q4SEw24CrrWC3HEsLlY/uKXgpKUIWzeXnMMyXHDWo7v5tevjX/ai/KZzmbo1NC5fGU
 jhVIocLd7kwuiCUjpW/yVaQGBTAKyovOJsTbYp+V9wBPDqh8cp3VXyONhN+s/zhRGG9gAF2YEzG
 cgchTc/+0JVBdAMG16Sxc4mMOkZGU+Lxks7qJlyhN6XsUcj8iRQG+d9hUkNlBAgdTcMJpMEn0kd
 dkJOKbe+FFOrO2OOH4BNawMbMIU0982lxSIPgb5Q/RKX8LhTdWcg7s3XNn8GfdQLMft8fGlKdXt
 B1XWOTyoPib7k0/IiAyVFTJ9DpbDTMyzhznF9TrmGgOPszSr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX9EpY5QTmZjFT
 NdJXYASvAGgBoUVASE8Ocyvjc1A7IYXdL+S9tdYKDVkhMWdPqjQeN1ZD+r4YKo+D1j+QQKGeC+g
 qolGRZrxTmwSRJLq0e00YhwOk8XN47VdpGEM+pEoIHvyN19tTGbrHZQcXxfuQfAMVwTnfTVkL+S
 7jAiU5AW2622zStJCEmHxpRZJdc3BdfxwhoTUgfhjfmCedOJVivUcpxAXuOusxmLOyBDIBZbp9C
 P8Eyronh3MOu7lKlbH6p7YudYDR0y7/eMX5WReXJOfC57HtX+5SjbCXwZ7pD2eBkW7lBd2TWJhR
 8rGEg+/FVgPxHo5gsGlsbFC0fomEKAkCORGQ1/zv2lU5PrYfNyE4x+vPme/ZRpAS2apTJ1kojAi
 lLpDajQ3ds5eCHeM6laoActttixOrCD/tOYQb49vC7l0KL5CL30fJLl+q9L9vtRwtIhKVCn71QC
 a1zhySlq/8k0hT36/yw==
X-Proofpoint-ORIG-GUID: oamyIH9vsK4OeB6YqWPODSQVTVoGWkjl
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695ea2bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: oamyIH9vsK4OeB6YqWPODSQVTVoGWkjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Acked-by: Maxime Ripard <mripard@kernel.org>
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


