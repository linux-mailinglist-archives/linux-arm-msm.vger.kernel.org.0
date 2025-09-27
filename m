Return-Path: <linux-arm-msm+bounces-75364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D5BA5778
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FBF916DCEE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5515A224AEF;
	Sat, 27 Sep 2025 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJXreUEW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65131223DC6
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935123; cv=none; b=fVAVUnzkRGCcI0mTL66YbVev+smDmfTyQ2lya4lqqrxiSGey+YtZUI71/QMbXAFOGxUHAxBjcfg6yo6L4RsvnxQ5/qSpIqeSzawOyExGSrKeqBP/ggbb8tgvn3ohSvezH1ylFUH0uhazrXczzVRvUBmhhUt1rLbq9mpuAeqicIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935123; c=relaxed/simple;
	bh=9CNqOjlTFRCCeiBZ+szAQcQNElv7Yqy1Tew0H4Yo4CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvzQnWWlHB8xiMdRRU8erymXu3utSThEAiDOBaaVnhzjqAji7fWvFc+T68SEz+3TX5hYsBxAFB0F+xQahuePE1OPhDMDbYHFlnR3Z+7QkAMZFYDEAi7BP3PAMcl7NaiF+B2oSoGc1mjPi7jlW63sxcHwOxRaUVfAXD9/zPU8r7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJXreUEW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWs2o031550
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAp39OMtIUlg6ggEgbLTpX/2Uyxk5maUiBvPyhN2y14=; b=VJXreUEWNkUkbxEW
	gNTa3rc5Q7CTeCx3Aq8DCW61iUOKIqsBNZXCpS3MEpp1dGi/zwBqdBb5dQUximaz
	5JpKszi88v1jx9KJBibAug28ySUsa5uh0HhsW9mtfM6C/cxb3Oyg4CEzgEZ93Son
	lTi3wg/p3NCm7X60k3jBrMpnZ7Yg7+R9pCl4ssp4RvrIFTzt89vHr+NzOuL6Gtfe
	dAXqM/3K44sOKHDsEM9z8vEMSoCiExr0dXPzTg3tnChU+zoik/bL3Wce4FO5ZNQK
	xjcRGmXO2fpRAJy6HFEcRIdOAd0uTo+F/reFoWHLPlo/vyQh+zh3TA5n1pYXQJsu
	0jSE1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tchff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:05:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de4fb840abso25084431cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935112; x=1759539912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAp39OMtIUlg6ggEgbLTpX/2Uyxk5maUiBvPyhN2y14=;
        b=GOEM5Sf9Qy1dTNTcX/ILhZLkGrPZmpB3iGj3LEzizrziE4FnouNBRUd+NVqAu0GAH1
         kdq5AbyUXCO7rrSxsRrkqheJ1SKY5k8skw0UfFlfONTqmnArn5Nsg/WR6pUC7lHAJP2i
         mGmosXxEOCNUzZds7rZYrmBSj1FqWZ1Kp6oiJdTPCeR/Fmk31gWJSxsMOX7SqFV1dYt4
         Zhs3Bntyl88QRfaWbHo1gUkMThYOOfSKKnXp2sutTtaOVM0jpDS8QFjeFBCN+nrqrOfP
         yYAfLe570L18NWAxCccsSPp+KQVEZQjGb3kIkWQzCrzsi0cJ6qmUNv0JjdIwhNBuFcTM
         Ucog==
X-Forwarded-Encrypted: i=1; AJvYcCV6dmkwyI8jujD2WwaEv6zDoiB3tcVx0LqklfdUUcoHlGQOG5WmEvk+9u7SxVBuqggSGuWoD3gtl4cwLAKB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7JO4oV/GhVzwcMgtGSUq4XGPg9U7roFwDBlDl6dRfHptjFGO
	7gXqsDETsspywqxVmqreO4peAVSnHRhec+9yWK5WbPUWKe89CDoB3UEAns/dz56L1AqJ40GJR+Z
	9QAZ2+4IGvWa7tTZXszax4MIvOk9NK66REW+Kb6wDky1OyxJ8++a683c3ujYO37X4rqA+
X-Gm-Gg: ASbGncvCkVF9pYydKSxKB/V0hDquVzm5SHdWMI0FRJ0aP8tyOCM47LNtagyDUnibYF7
	4b+3jtnNbS+KV2UlKiY0+o90WKYSyBl3vYI3gbBXcRP02jxGUJRdNOdo1jNtiF6lVpLazSQkGlX
	CgMJxV01qhyHhRU2p4ie43zbSdSaPyK8OQhxawKYWyAXKDZtMgN/BhOfNg0kDD12TCth24G4oPs
	Ig90Ev5eeWFBuHEkVn5hGg8Nhl11Ft0cifF+0YlQ2JjsfCgKxsYBb3I757r867btTlLBEOaeJ+1
	jToFt0KCL3xyGZEb/cXXq39MtbSKklqBXv7ocKtESOMjz8g63GDI3I9Nc+ua6PTl2IY4gjTaJUT
	t59A+39WV50Hf338wSEnXmIn9YFYMyVbZQaXnzNiTw7xrDiVuXylR
X-Received: by 2002:a05:622a:164f:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4ded642c212mr20148101cf.42.1758935112255;
        Fri, 26 Sep 2025 18:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDCP6BId/iczHUn0V/ClnhswRFso/twuHTYrKNlDcNcH1xOXlUNtsKYlqWIiCEk6/tz5NBGQ==
X-Received: by 2002:a05:622a:164f:b0:4b4:95ec:c830 with SMTP id d75a77b69052e-4ded642c212mr20147801cf.42.1758935111756;
        Fri, 26 Sep 2025 18:05:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:38 +0300
Subject: [PATCH 9/9] drm/sun4i: hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-9-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9CNqOjlTFRCCeiBZ+szAQcQNElv7Yqy1Tew0H4Yo4CU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C0UxHct0YeW9rVGvqo/s5dsq/C+fqclwuc3P1ASLR
 tOG+g+djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhIUCIHQ89JLquMpq2R5rUP
 pSeJawi84tGYrTyvZ/16fZaXs4/rxs3Qe+qwzlvwotEPe+erErdqpzDGi/UqxwjNvt6jw7320ot
 J19Vy1KUSzG82FL3+Knwkv/CF8hKm3c3m2UyOsmHxGs/3VyeubNmkyBwadXC9rsXpbXGVFsz887
 qPXm0zy67jOr5rd3LmroviXxdoNJTmzf/9e8N/D43VmjxM+RPmrfi07pAZU6C0uJWZ9jM9lTsPd
 LN7Mr/+cZGf+S7h9b+MDyV+eZsvsW/zWOKx987W6XsVWN0eHO2OC0hoPh75xGv675dHf0bIKDAo
 X1nLZLx9U53A7//+S7zuirZX5R/tUH27u8293XN1meluAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IcXHTBm1t3IPob6nCBRJ4ddT3XI2flUQ
X-Proofpoint-GUID: IcXHTBm1t3IPob6nCBRJ4ddT3XI2flUQ
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d73850 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/dDUoh+roCEr
 jIG1NUaYzG750/rbnd/8ksNVpUIG5gCdMkYsGE5thgHWeiBVXArwyxYEc5D444D5eWRRACYzsjS
 wrJdU/Gz96DLOR1xnjzvYjyDsh/ry2Pqo2jyAsF8udmS95VcSoq6EeNNMK/xQ7Ve8d1PHss5Fra
 4xxyUOKBNdwKNla1z1tmmM34OVsBxDr/cJRwY6jWmdR202wsDSzPhHmumSXmpBKrqbot9dIThY3
 PPt+GoQtia7U9QeD5vMZSZ6fYFtustBdwTAN4g0EZaKqo7fWD7Nb9RufWgTIPNkokCz47ZnW1T7
 useh6juuWDYr4B6sQbbMNLAVYVkwyMFPevcRY+VE8HZP2cn9Y7EibgNcELE2y7bNzma/cyUZXnj
 Us5okATHrRiy9eOfdIduOi3jIVP6Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 49 +++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..219d826d535eb82328260c631e8b41f33a2f4c2f 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -47,11 +47,8 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
@@ -60,6 +57,45 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int sun4i_hdmi_atomic_check(struct drm_connector *connector,
+				   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -237,10 +273,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.atomic_check	= sun4i_hdmi_atomic_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.47.3


