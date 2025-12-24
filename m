Return-Path: <linux-arm-msm+bounces-86445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC4CDB07B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 961C030090BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBE926562D;
	Wed, 24 Dec 2025 01:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfH2Ljc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtlF54sS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF51DE4CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538239; cv=none; b=Kl2JAOZz9y7XfRmkWVhwPiiZdJUHlRvoLDRRTHF0zxx5+EinL3iWDJzcRRSXPzItUnTw/xyvMr37sussxoo3i5h2IQeypwiZMTch8s8RBwISoy5BENeHAqBK+J3j/J6dtp7vB4Dy1vj7vCtpMvcLLshYwDHG1DUYlHCo2Pz+sww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538239; c=relaxed/simple;
	bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsGZZ00RTIHUOcN3bzT4Non2pz4fj2RHhhHLC9br4jzeL/GXLdABZ9eK2si+eyIIUsgRdax/ooc13mqYAgvlTjhOvYc5VM2BRVRZILjLr2BojGx1A2wlw08s8AMnlG/+vLCfO+nFkAXSyD2+YcEjECbSccMmDSGqFv/o6Tb4BFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfH2Ljc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtlF54sS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNKXnqe1206932
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=; b=XfH2Ljc+dZzYTrzi
	pD5ysYGQfEwkhPa6D1pi8C2qbcfBhGuJdEE5Tm7axPuo9cDSGursj22LOxEqHeP5
	R9uBpaJ+4/sOsdjt2aULzxdHjQc0CHLodncP7N+ebgW+QzIgym8Fu/RIkEVIq0Jj
	jRDxvdSZXrLN5ge3caHHbALSV00mhM5U92CRhkAtigwUmz2f0w29lkiq9FqPE05j
	iEFxVpGxxc9A96yD8kdKzBFG2/urw5k637d0CrkxbijK0WRFw1tIvf767zHurFAJ
	1U1WFXX9uBnoE3GI5zyeTch4vmOF0P//3srIopPnVaZrtxW8W5okZ4R2ipkZ+bcV
	//Fs7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r0grj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a34f64f5eso171461866d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538236; x=1767143036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=BtlF54sShRMKu8txULfPk1wdGfnouKd/vlQeTam5tl+HEGP/CfIDNz3oIFA+21r7YR
         23vEHyNKiyY75UFLJ/4bFNeE7ooNRuyvU93QyuPvcFkM8NMxfdrTTYR2afrpftXOijwu
         b5xccMQiRpIm/JvHaIGH+5nH3ok17lJeB9dYMjxkpXZcwW9EVUIA9C3VO2z/mjSiZFvU
         uRv6LmMDC123snjYAAlCunkq/rBg8+NRnQBSjy7g4J3mm/sWHHneLbzgTWZOogJ43fND
         G7zEhsIV6x0Hi1KnTRZb6RQBwZl5JCHgPOBmXWM+EMT9LKKod07h1l4wjwuPCWCAus1y
         N62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538236; x=1767143036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ecVHGdcKUGcf1BVa43vSmPZjJ3ubI7MYeuQBBNyE8CA=;
        b=FVtcKYQ7u/g0r18TNmAZT8gGm4CJJRACE0aJpRcx6IOZyS+jHh/VeOWTwp6gWz8/BD
         YIvlCuXnQYjsM4XMBx+CVLTVUSdLagrSCAhEALhAtLcXdhf0Jz6uKbDo4+GtBXaGwyyA
         WIfs2pcKFOK3byWOq9KJ5ihoAomi4zgOKndRW7zpSOwC8F35/KnYfF7aO96TuFHDqnQy
         mqaRsFPlT0kJ7X9AbL5ppFZcJQlMIIHUAxRECEXu9uJPtC8UIwNjp1tawJB0x7P522e0
         c5Xu9yJMFP5B5do3v4My7Q4lVAF8rIy7WURN9AUF1UNP9DVMAgwnEv++imSSSLpEuE5P
         t0zw==
X-Forwarded-Encrypted: i=1; AJvYcCV+qplVUxk2ElqbXMkKkKk19DWRE4Ovp3taywFwZY9iCcdRP6w9nHeIogELViS+AifAyH/iJOAjHDXyI6a5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt+TQf9dmFH1+YJ4lpju2RXlQqKeeNTBYTq8ZwoWULa9gd9383
	mh96PlI9htd2d+Dfnub15SRkRm4DDbzCwMWaVAejbI+xHOiynE240T+olsuc/+U2tt5Cm855S8t
	C/N0re8OIb2jxnNjo/UE2ZD5bhVNz2/L2AIn6t1YQyZzumkiDRN3FiQyv+cSBSSgm6e0o
X-Gm-Gg: AY/fxX66k97MfHlAi+81d+3znvYAIXrT1M3OOj7RfHAc+siwOOz9C1OASSi2MrUCmou
	U6/y6bGtKttuMpM8HHbQ7FeMzIPL10ziboPyMGFjzyMSUy8ErcC00GJ0o0vVa79fZeFbAT+DmBq
	3seXyuhvgFqbDoU0MIsYfyy6Yl//mPVHT1FgKXZXjYCBut0yONan/5+pdmMdQyolW6fkHNvkDPv
	hzdq5nOB9wrVUycBvKC00n32t2gHvQhQTBSeHhA7fKcC9I5mE8VndYZAhmVLtGZxYp0/2hzW1xv
	SgPnyo6kR/elnpqYsOg7pCd/oGfwTax3JP/jMissaV8o1AUILXuxmXASQU25KwD+CZn5Z/WXPZ+
	xdk5yhswVGcBmpPFwKnCU72fH7XK/HhWtBSzzneIwNXKXsTmB2y/GwB5snXSywQqjGuubGqJxQd
	4FcjWIJ2dO2zS9HquuhM6qyqk=
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392516d6.25.1766538235592;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaK542l9xmzYYsxqdNmih3a3J+cADi7DGuEWQ94lgYPMK9IxHSj3e3msfodcDCfxK5YjzPVA==
X-Received: by 2002:a05:6214:4686:b0:880:4cfb:ab57 with SMTP id 6a1803df08f44-88d83c64e72mr214392216d6.25.1766538235179;
        Tue, 23 Dec 2025 17:03:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:56 +0200
Subject: [PATCH v3 07/10] drm/display: hdmi_state_helper: reject Audio IF
 updates if it's not supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-7-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oV58YVZ6PqGUocr9XjdKTVXla4jnp1WcJhUj/fGMzJo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZGVPsohAMKCXOdz12kIPkrJMlkOnHo6hb3
 HWobYyhg7WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1QKNCACqcQqgJBRBcg7CRb0dfX/GGsMyAFAip0dgaqJtDLf7ApFonc0Vo0fA+NhcV5j0Nx8Ti9U
 I3ZV4TYzf23eOcnZCdm7rXhqmyxWKpftkt+8hIkJizIcSP+w7WDLeC2a6QEPQiGVuMei4kWHGnm
 o85bmygfh11FQZkX2pCCQNJlyfTByGtP4Y8JpLUrRBIvBMTYNUGhePLY9wL2DAFLPPW6ccgE1wi
 X82GoCEVaLpslRdu4Y6qY0DXtzUr9H7AOhKf8Hucv3GM83Xm/DL5TfDXh/a3uK8yiLTMpc8RB1r
 OJlOJIJ4Pu0i+HpaBnRzjUWikC+VvVcYf/m/QP/ndRhcoX39
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UMcE7o-NnjbLUBZ5VxO9SqE_EPQAKMeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXycBCM8P8Gpc/
 ONZZwpSfGHNr6h+NeCBZHCf2wPPvGCe74ZoFGGUnRHY3luNAJg9AfEFOyKktl76tFQIPXAdsbrd
 3JxaMWZYErVVJryV7P0/tfezXHW3GczqEOZZVDBaRLL5Oeypj0KXjGRCxg47WDRi3vzxbNnvcbT
 kIkRlVTzSG2BK8fhxvKU9oYL98J91rJcvmLudpXOXqNnGVlgTwPXHsRO5lFT/AKMMSSlyvD3iMi
 j8xt2Bt5pMryOClwV+9YhwXadXu6pax2Jc1NYRhKJ6fo/JnRSjVw6TUT1KId3BMl7Eb2f8cU/aL
 WqMw/N3GF3PHi3IB3fEbX9wVMErPVCG241Lzs3TmaJFC1rZ+b1TKIEQKds+S9rc7KVfUL7l0qgC
 Ux3HBfmNleXuwn9mdyrsLwsEjDMKV8XsHK4iUgSF+V4GWjFVIvbvy6luHVa+8VvIFBFSjcvRfY3
 ojnebfjs1/AnJPvjE+Q==
X-Proofpoint-GUID: UMcE7o-NnjbLUBZ5VxO9SqE_EPQAKMeJ
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694b3bfc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FWtRXCEnrA9oX9MUO7wA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

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


