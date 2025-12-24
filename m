Return-Path: <linux-arm-msm+bounces-86441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15CCDB09A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD6C730581F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9507726ED3E;
	Wed, 24 Dec 2025 01:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl0jOJV2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmBoYiul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3E264619
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538224; cv=none; b=DOnS+JRowvheCuPYhmq2P6XuEHPJCTS5ruivrIPfO7gaY2b1ptH33YKgmoXf2t6+SnzlhwLZ8AF3+F4OqQj22Fxbp2VGq5GENEpFM0RLqh6qOlAlr99/yt/M7DmmPrv8i01ttoRQqVF7D3n+kY0zLJ/TPcvQJg6HzVHDZ2a8iYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538224; c=relaxed/simple;
	bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KBp3NHHMHW9BjLWpAQRFMZylm9ildiirtFNjLK4KKWEQ8YdLrU8mHKvbDAXTdrENk6sJX2UB/Ds1QQvu1/BDZWy+u/Eud9UrPOXJdl3KsIM4qPp5r0Epfy6PNMkKTHGZYGjzgzesdA03h9/A9x4BNd203Hd8lR75tSJVlf9iAy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bl0jOJV2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmBoYiul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOEAa1018224
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=Bl0jOJV24JiFPMET
	xHzSY4DSukQHLXYvaS+j8AC2V1B7oTwCX/V4HE3eWFTq5cS6OcPRyrAqVDY+qCpe
	qrFYm27AFt8KkxgawPYL/Fe0FaD7KkT9u3yDdi2AmiHPp++bl3E8ECzsLRIu88Jo
	PvaOMF1dSP4/LJTXL81dgO0Pa9pdcH+1O6q1pRDc4tlgrNHbr87ywG+rGaofvEBZ
	XzUlymhYYoz5ryyo4G9IluagRkMxMBkjTodNRJQv/iSAW66J69otOk5hjpFyATm+
	s9XUpm9Lf9XcyKMP9SFUa7aIWGdeBNgNefrwznwxC+Mhh+cGxaMqYAk14PEYEr89
	IcsumQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8804b991a54so191765896d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538220; x=1767143020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=DmBoYiulv7rB58NSTJ5GbarrXxR6uPNW9vWBQUjb2jwW+Uy/tRghFKIm73oUaKpj/Y
         WNi0fEOsfU6XgDdzdLcUvCL4fnrinG0bJbaMGVIlBDyFMNDVkRkGHpOm2iGgqxD59qVh
         JrXBXkPYguUUaBU8sUWxWTMcogP+NK4bkDCRCOPZm1f6EzkOgy1mIAnws0gWyiISWmmw
         Y3HuzPPiT0TU44R6tRSzgGPifY3j3tie+18/w6sCRy/89lIgalMkpM/jjUzLF9xK8q5q
         eD1THGaSEY6BTqAR1+T0wknRJgGh2/hLM3zvJilU3eqGn9f3U/8/7BqFYbEaQHoSF8zs
         D7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538220; x=1767143020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=BJERlTn3/S5OpZL4zZv/IHGDZOUanLC+eY/iMvQx63LWeZ6SCkpC6pocaQjzoue16J
         H51HaP1x82bri0FMAuUMYHEQd2kKY9isKDsOMfXVdTirPOyxsHYP6/gOlXbNzTKYLnJ0
         sorqKDhEtASz1W3IJsc7Zbz+phHfZpX3ytQTU2NB1LrqEYKPyelQ+SZuUZm+p7Oknovn
         0Xg1DW8BZnpUS0QcRamLQxs+nMktIcdNlH1Dtx+wX5nkS6dU2ZtoyIw38gHYpUye1811
         btERVw5BOeYFfxEndODlZrUWO94jjlhpWxVm9YMfpP08Hy2lSLyEdr0uH6fWEi8jDh97
         CQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXlAMzwV18H85RQ52Cl6YBejRjrppdRj6RTAGJQYVLrdSz3u+AudJZ8Q81+MfAvlmQqcynR8flJ1dbg7j5t@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXGlqNzwJsY6ImPfEN/UDNB04nJ/USGYoZzUNLniK+yd4HNgg
	GjUkm+GCqBYNcZ+eUdaDM41Uf4jqJB3+Qr3U2pY7aOkagSUj5lVVeCUlgKP5mGrJaLBrFd7TEuh
	Q6MDHoeS88GJVtNcFTv2nxI0UdJ+fNK0L/XqnN4qu5HH2si8TtRKMedPKasIxyO/ISHOr
X-Gm-Gg: AY/fxX50efLQYoGdH9UPffK3Wt2Sq7n8JhGXKwqpU7qCnjaLdPBcByo/8sXFBGDlMgn
	wb2NayAa0HaqWZ93K9JZdoDdLxmUiaajDHPdFITGJWbbxrmSoLf7zUFASLsoyBCPI9y7DB1VJ59
	zLxzDlWKZeGhcCJcjT4Aamq+7knYeciA6E10q9NmPrxmZPyDBVRq9GWkEVehv0jVRDd3O0H6qNF
	gtK1W9GKTvenlSb5P0Dvodl/5S39HdW7nZsetpazwcVDUeQwFi1YyFc7wiX20dWbGP58GD/4+hF
	ZeUegNwVGlFg+80dKP3jFNOFXzRyHKjtbzN30UjsWn7xhdNBYbAOwAMOCk00E6E2xf2kcTNPLiE
	0+Fs/rx4DsxCuEakXIEaVS+SvXGunOi3fd9KB+EnY+en7/ZxkwLkU2amA5CP9Z5HGB6+irQVFuV
	K9GcsCWxwVqSgVuM1yj7TVvuk=
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229406101cf.81.1766538219493;
        Tue, 23 Dec 2025 17:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvXGbOT6oW55CWvGFCaGI9Z8vq9+dFl2bwrw/ngJaHdkAtC4PTePtFImzvZoy9oibBhKF7A==
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id d75a77b69052e-4f4abdca79fmr229405351cf.81.1766538218943;
        Tue, 23 Dec 2025 17:03:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:52 +0200
Subject: [PATCH v3 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-3-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY+d+DN6B8oFFIbxWN6Mv+qvpFGNgFj0Zg9
 429cFCSW4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1U0DB/9O5L3yXk2jLLqOmN8V6q8wWbokThIMSYo9wxIHSgy0M5PT1YvNv+IkCrajuHc7rLm0/Wy
 cAHvtRKaeF+QVunb5Ui4hiZx4SEbTrbizizbDcBXrW4jWiZ1w4OIEFSo9Ca2FBA/eLbTNfYILzi
 HQCpFhDfzos5m2svcelBiHZqryy14l9P2FF1hFVv73xKqoG79GEfcN56cxOyCxeLVVkSb5izUXV
 /Qi7gDaaGNrZhhP1D1d2VscJWoEi/L1VJ1MTZPr1mxGEaDugo8tx8aKiQtr2Q++hnZkOcfFfbZ7
 adTRg5h65Vh9hNP2Kvva0EBQb2XULPOZjxhcE0hxDNYLkX4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfXzGlOm2c7oBC3
 ycpM1bxB0vJknSKykI0Ku3HObsxp+UxmQhsh/RzXIQ9WfRlWpRElbedvAAA4IkRbCvcwkImr4T/
 /3dFpN7zSU9Z0blZQS9V/KY8nVHKYD0708P/MJ19gV0vKFQtxxTSp3ccrMhQhVPyohpeeYQnZTq
 sEwHKaForMzpMvbal1FyGpwuPxBIYDOHHuN9ItblXzmAihKg3O7666/d5xp+BYVgWpgeWcpsnIW
 pWaUoboz1n6thk8TRWXFTQldKMoAz0Rg5KFmw52V6abftSey5lvOmtegIMkPcRXpU/+yya7T7w7
 i2snBgLfchK855qarzouA4p1JrGdtwn89JjKUXXV2S5FU59BI6gEpPR4rk+8hK1XAhX1sxIRyC+
 ndyQBlOtBd8iq9u+2y4JrRXyEKasIkco7tJ834xnwtf3htX/QVrs50kbhiSLVuIRZ1hodqZ/qL6
 9Xv4kHhoLJaZ82PzKXA==
X-Proofpoint-ORIG-GUID: i6J1anB26B7THeF9MIeQIDFXgcz2WjZD
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: i6J1anB26B7THeF9MIeQIDFXgcz2WjZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3


