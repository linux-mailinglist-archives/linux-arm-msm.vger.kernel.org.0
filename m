Return-Path: <linux-arm-msm+bounces-75360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2459BA575D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 03:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 752D43BC575
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 01:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F93C216E23;
	Sat, 27 Sep 2025 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AlMqdStS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE121B9D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935100; cv=none; b=eWNBQvjaDY454sNFWjiGMJchDfmMu4LBHoTlDYAx/iXpziHde8OhVB5hP3usZ6OLEw8n0zCX9iqzPl1XbOcowDIKpvqFg6QnL/ONjF4j8M+3VyXI+Fu5Kl7izZ/7CCg1DRTXUBPtnS+J1nM/4PHyEk2c6oJ8EgOekv8qszUhgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935100; c=relaxed/simple;
	bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eyz38uLIwNt5Hq63DSh1Ax3Yq3VsB48BT/a/r7wdBAUuvqNp5jb1LOQDEUEydxD5y5miBE0aKzGXVzJByOEzNlg44jCXYI/wc8Y6tpS87XF1WqggceDZD4exs/g5nK+vHLKqW+r065brYkkFdJkbwWLoRIBH1y4cxT2RJU5mpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AlMqdStS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R0gS5P011617
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=; b=AlMqdStSStQQHIYJ
	UOpVCKX4Xrkd7ZUAxVWtGuAANsXFaMCmBCuEedLARqiO43lX5qBNa88asiWxc8ak
	54clqShnHMdCMZLkGgov4+miLwsejZDIYBP+eAA+PbpvuBzW6Wlud+VXxbcg9XVY
	b681QUXzeLvVOGaIQlw+JqnnfPXD3JjjGvRPup1qKo23Ro+jjkPJT9HVTDgvy5DD
	kIeQSyRUi62iBEVRj2j9/wZxXiDep39scjlPD4Izhotle2BaQ7ugyI7EcOlJI1P4
	pLM2dS/kt2H+p1nIZu8Q1LLFAokWZ8ykyLLrlx2i59XB2l8WjfVFvex+430ssR9k
	x5mgkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mcg0th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 01:04:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4de2c597a6eso35834061cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 18:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935096; x=1759539896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNLPzEmk5Y/+u5lMsfcmn579j/z4LwU9YC3n7o4pksg=;
        b=ZS7Y/rkJZG6y9PHncESvldAT24AGuxEzZJ8+jAszaKVtnTDMTtEBKk+yWB3DwC7Ih1
         EriIkXGIAd1OkuxNbIgx7imxOMUFnWxUmNrxEbiuXM6SU5bOLMatDBCJFO+Bd4tB5s0m
         xmxtrvicpYAaURJdMYajiIUn5wbJI8W2w4KCl1PC1Hb2fdNA8nRLmEFxfwthjZ9IdA4a
         s954mOtmosJFglMW6b93lYkJqOwo03T1t6I4I541kZH2BdWkBRUckVMhOSP9CegGHe1j
         iRKCOMfsWlLM+L06ZAn7hVq9UT6My86QVrfP8tEnTvCaGRHV0pizl7w8nyUAl2u0+tuM
         vyMA==
X-Forwarded-Encrypted: i=1; AJvYcCX8QgTty9fRYFUAXTGb5sM2G9EfgbGLgWNROK3QYIMcVDwbbHdYnRKE+RhJshU5ArYthniHBwHbWxG0v8Df@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8ZXsO6jzfDOTmD0A2K6u2FnCujd6DT+gud8OZndqZB12/lit
	e0cc1PnZgN863n/gGSg8vf4KnfaLr6ONQy/j0PIPhH+78aEWVlbgVJGxEEcwWyNC6l/w3aNLRA1
	NfAGUG0N6E2FsYww0wuz58WPR2IVnP2fHw0QX8ru9rGiUI0Z8D+j5XrqBappS+lfHpiB4
X-Gm-Gg: ASbGncsJ3nKkqgtUpBHiRxNksYKsw813Pd8BvSVxWgxQgx3Adf4HUBSARTD2MT9iS78
	RDXsfJlHli3w8a24xzNjX7u9ANHMeVWyKIfX7lCjvMLAwuGyuz/wEG7I+Sl9SNCZDJTp6QtJN0A
	qp3bNw26QiSXCZhWeImGC0qQeSD2LzImkwpSoaH9FPRpjS5n+a91kOJvzfGCHtcz0dZCpZeHMe2
	Xfgb9V8FjlwtTwlRycfon/YBkvGLpyJPzS7il0ApFDFR89Bmo4c+QtkIekmyacWDfqJnQn7baAu
	3irLTyiEShUzDhROB8b7UVmXL17DWgiWLPNCloh7RvW+fCpVkODAaMa7rsr8fRjOPgTojJ1E/4N
	lx3C65AWpvHpMI+76TMVnJLLmfAeyQxFuEO7JWKAl1N6kgruCL9cb
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id d75a77b69052e-4da4b808863mr135723381cf.44.1758935096605;
        Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/5/R3KCR4cljnetr7e3q1AUT92B8s6CxvnRXv0hsqXuU0evXlfVfuak/45jJZf6PNML+aA==
X-Received: by 2002:ac8:5f0a:0:b0:4d8:afdb:1261 with SMTP id d75a77b69052e-4da4b808863mr135723001cf.44.1758935096130;
        Fri, 26 Sep 2025 18:04:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:34 +0300
Subject: [PATCH 5/9] drm/bridge: synopsys/dw-hdmi-qp: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-5-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iR5U12JmTHXUQwMeh7Ktc2ZVP6MtOB7VE/y4QxY7Pgo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zggNIldS9JOxwBNJBBO53Nrz/u36O69dPF6H
 H6nvUzECrSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4IAAKCRCLPIo+Aiko
 1dFOB/0VjmmhzCSGfqQ5k/1+FNgEfQHtI2+JI8ViQlZDdUs2D5H5dWvZyr4BGllpLHJX5AvRyc8
 3oVTrlbiHcWYARBX/z+3/LIvB49bl1V9nqbKa2iiLLm7jeEoEFUkRHY3LX6W6TG3yGCsyBDYthI
 KoZRck75s9gIhMaMIl6Q8cLtyUWEjpJK/bIDENll22GGKe2wR2d98eXe4IV5jD5I0QwGfGXdgx3
 T4wl1EDAw1ICP8YbOs0svPI0MPiwirFHCpfjHz9PfDMJHqq8jDrD6Ogu5qvue8cly4O2XqTbcMS
 qVqd5LNwIHYUyhVax1WQnC+vkvKnnHSsD8F2nZejU51/auL3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68d7383a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w15x51AS-uJJn6dZ_iAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Met9JSD0h34xbCd1YWc7R2Z4z-JgWjpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX7HjEQ0kvVmd3
 6R29cduBiDzli6Orznx3CV2Wy0NwdiHcS1HAdTak4nl3/cHicDs5EindpWgrFgipzaoPb9yghKl
 DsZbQMuXIYUMsCLYylj8092iqsAbOJdT3lNWSA+yzj3rVAOtvWcD4GvjTOhO9L/PT4+X3/ej7R3
 PNYjS+72L0aCwiXHyMwOItjU/d0dbuLjvy8c5JJO6zPslwOOY9S09VXgdtewC4oAVRRzisDgu7T
 F8geHAY7bsJ+JoQ1I/mMRBB+i12gO0fzScC3/h8OyOa8Uxn0TuTv1SwLl2T79ekqn8cNOw2G8hl
 usLukSpK5qsG/UokrdXx+2dyxfwdeBJr3LG2Yiux8ks45ahQ6TNI0wmCLTZ+/USGDl+19vEdkMZ
 V9EL9soeo7TUuoaYnu1u5zWG0+OIPA==
X-Proofpoint-GUID: Met9JSD0h34xbCd1YWc7R2Z4z-JgWjpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..9a77e880b7f58403691338ee8c22d24af570acbf 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -935,7 +935,7 @@ static int dw_hdmi_qp_bridge_clear_infoframe(struct drm_bridge *bridge,
 			       PKTSCHED_PKT_EN);
 		break;
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -960,12 +960,26 @@ static int dw_hdmi_qp_bridge_write_infoframe(struct drm_bridge *bridge,
 		return dw_hdmi_qp_config_audio_infoframe(hdmi, buffer, len);
 
 	default:
-		dev_dbg(hdmi->dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
+static int dw_hdmi_qp_bridge_atomic_check(struct drm_bridge *bridge,
+					  struct drm_bridge_state *bridge_state,
+					  struct drm_crtc_state *crtc_state,
+					  struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_check = dw_hdmi_qp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3


