Return-Path: <linux-arm-msm+bounces-86440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0503CDB097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9A98303A8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1A921C175;
	Wed, 24 Dec 2025 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWR5Ojqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXVviLlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E52561AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538218; cv=none; b=kvgBxhsSc66FTAn+Uo7FFci9QRfsgrTpKd+T3v5xFyiDwev924KjnIG46afpSsqDDz8U4vGyFSE8c+ewyQZDWvCbEk2L4HcraIIj+2p4JqGu7S5CMN+ZVt020MGD+BT9e98JVguAvyTW+mjKCH/WyNM4hEBmknX7GxRwoM/wRdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538218; c=relaxed/simple;
	bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/MKd6X3SWlEsU4CoUsE0vuyHKr1ETgelXPhnND64CcB0loINPloPeEWpbRxAoHhCfp6Eu7xjBUsH2l0vYsUR7VSoIruDBHmM6HbwzM5wEfqiLkWTwAesKyV7Ht9hGnYFEmrAEU4hzxcigyevQVEQRQ6v2OhsOUaS1RplVRvGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWR5Ojqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXVviLlH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNENBhb913517
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=; b=hWR5OjqmTENGCgZk
	I4zXeoe0FG7+9/6SD3mCvvxs8H3pccL8dmb/4n93hTOrhvZH9t3GbcV7sRBlbwqh
	j3vMtO15GjZ43NDH5xDBw1xydalP3nQJoi/cquWmGbTFSO0HIAKy7YEvhLkXqIlb
	dQJ62hwBdIBtDRmwviqI78iNNVhEH7JVIqEWs3P+GhpXvYZbEb2mskJsWiOFpo+9
	0w9HVSCBA6DhMLa9kwIXPMA7/MAnPT6hxcp69upX2RXhvAhyWGDr02JZGhZE7hrC
	/ZRv6AGGoy+yRGIjDtc/ZYrlLleHwBbYd2TR/74vUAOumKhok4evGO2QVUh5wiVI
	wbOeAw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2hn0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:03:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8887c0d3074so144736336d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538215; x=1767143015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=dXVviLlHjfWQexM9lzcUguCAZuM0Fj/U9BXfBNFEmJzNWL9rK9bsu6SBx9HXmr+DZG
         rXcFHAZAii7cTnGB5h1ypNTqQa2en3J0MEk++zNJY2+DabfPYxUwHmOjl0Mrs3yPuTst
         NEJcnHtLqy8o8Dr0lY7dyjOCjfR5nxf/JzR3x5sqphIPFN33qgNSPRBmp0pLNatv8rBs
         EUSxmPRt+w0lj9FhUdUcMDfrMJVjxHoGXap0iSmHozCzWqpXgv5seDjr8sd4HtExciKY
         +3ys7rAx5swec5trxxQehzQ5p2RQY7R1dK+q2tjgsxwlDEwUdsbq9FLXfffO2mTla9u9
         3zCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538215; x=1767143015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xhyidPKELK4mgPty7R89IfFpAnaFS+xQI4oanQexDkI=;
        b=X8SDRfSNyO7912QntYBIrHWhS/b6TLChmdc/huCP74R4kknwH4NKsxTt9YCl6FWB8N
         xAOu1n/Uje+qWQho7w//CcJCBBM92XStQMqVGAP+KHgXwjtvIPNIdLIIpoGANqgM4sEL
         vQ0vYsp03rDa4S2bm2blLGAE9/WTO4VBCG4iBAF+Qoz0ZMQisvPkhz4w5zoEgg/2Ih6s
         X0kGboOuWAqWZMuc55jkqmgITrmzYYBeY9coZfkqW/xVdg4142UDyGH31HWCZF0YTsOf
         ebEWfj7m0xxYmMM8YK9UgmBUvB/MuYqN7GFHwaZYlZnH2jL4DBefXgNV0ncDKN+4+7Ih
         aSug==
X-Forwarded-Encrypted: i=1; AJvYcCWuJou6AwytpA6bzZQZFCJZVF94/fjSRjaLuTQtWFcFdxcEhjz55S2z92ur8Z4kNchJB0b9owRtvTRnniIW@vger.kernel.org
X-Gm-Message-State: AOJu0YxWMpMKvN2+EyiwXZyoDQzmP7TNnnAQxDvOnqaIa2vSfhrnzx0a
	4HhdmahK1v2IVH2MJR0ns6yBpc0J2oKTejuuJd+p80VUovGykFwVNMQrR2cyi50aLAYr1PU7rlK
	3GysWnk97GECnLXq6b5JCpWqNJ0EKrWHTERTR/ACEmSVYOFAtr4N5arh3n8z/K2hiZMLq
X-Gm-Gg: AY/fxX5oom2NC+pZZi9hhTkBesmSmUndSG1nHtRvePAL6EXizHZwf4YC1D8MS/OLjjJ
	bZnh+y0sgqziIjHufWE/4YJRE0J6aLUoHB37mqTgITIYxMegNQ0nJa5sXrcEao1zxvs6BQME11/
	dRnEf4iyEUWNR8fazjaTWHszlBWXVbDehb/D8trFiSw389yLIwUfKSWbqKGkKdZ9UWH33Z/Kez6
	t7x+JUHgjLuSMnAWaC8+ciDAmwCIkmfKYjmKlCG4yUwb6aRk7SGAH5KTAqs2i0Ac26xGLoFm3v8
	Rqnn04DuppMyuO8t6mOyHH89zCz9zek3ZmJzALbxdY5sLpTGnr8lGnpAE9qROwDML9hhOakRQZj
	/uBXRmmwIYY+NY7WpOnNoM5HisHOsNKpnFc3uSsmJQOmIAenAPdNLjN/YJex76RWI/UF1rsOX4N
	QNA7w7HKgrzM+z5+SGehCrCZk=
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738976d6.29.1766538215193;
        Tue, 23 Dec 2025 17:03:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpKbGgnmym2Mtt5yWxfAHv9iuZOADyKontrek89W07BD34phYJfGyZ7WWcGGMKQLxabxO7ZQ==
X-Received: by 2002:a05:6214:4e07:b0:888:6ea5:a8f2 with SMTP id 6a1803df08f44-88d82234a02mr251738596d6.29.1766538214801;
        Tue, 23 Dec 2025 17:03:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:51 +0200
Subject: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mr8qXjnvYFOwO7KQ17AFNeqHgYNZnWBLYdH41Q2tDUw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6a39fX0APvL2yu8D9Rc3hNQrCmR/DDaffohjZWMNm3TW
 qUDX0zvZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEyqI4GNYH291ht/25OWpN
 +Vnmr+nWTHOc+k9sTsiarlmVcz3+bZnyG76iwxndrZ6Wj9f3RuYEOJzb6B3/blvX/q0ezEeTEnX
 Dnpb5/F56eOYGp4ml9wQ/ivtYRbm8EOP/EM/JY+69MHef7kne9Z5Zt1QKdvxjyT8+5acQa+C//A
 uiTqvfV1f8C7nQJzN7xfT91yIKVmyPb1rrFqV84Zy75YP+wD/rjPT4rZawrlHT9uq6uOhGaxCje
 WWdfpCJ7w9Z9vbZN8tfzJffEHu3lltStTXUXUTlbfaz0MQpGWsbFNULpWVswpb3nP91WtD11Kq4
 VOMQR0brUk6/yjc2PJFtDgf1l07Zor3rOPuy2bdnid8FAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX9GR6bXv8R0Bi
 2Q3P/qtrOdCjeGg5M1qKRyr5uGwg5dLDwzPQiJ0xbvhO5gmualZphhrPBPvtkNkSxFtQqbtjuws
 suGH1j59Atjscoaj8Nxo5MZcD1Z1Bg5RYBhX/PW15EeWURk+6FR//OZ47BxMAxNrKoiVnBYwlPz
 gakHHLTzRdQKmsdhcVeXysNjwjODHyO41Z+PC8k6vSK6yyvcM0x37w1ZBe4osySBGPpbXYAOlgw
 mq5ciPDTevK9cMvIgP8QpkoLvRo9yKQzs4FdqYA+9oub5HqKKxERP4t/YZgGrmAN9S6dMR4+fbY
 niriW+QMkLZFumycr/wyHHureIl8jOEV+FWJgEXa3umvC1TOmVVp8M26S/IqpwwEfBjfKZr33M1
 UuqPNEkDbx3lH4/yGBzL6YRtSfHxnFllqtvUfHkJCJcTWQEYU/ss5s5dpKBec1xUE/7+pqqRO+n
 ZjDP5ykK/kePJCs0fTA==
X-Proofpoint-GUID: Yee-de8F3H30xh0HTcpzpLQsTJ9BTKvx
X-Proofpoint-ORIG-GUID: Yee-de8F3H30xh0HTcpzpLQsTJ9BTKvx
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694b3be7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gsP-wGJUQ9tQerkYUh8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007

Implement the clear_infoframe callback, disabling corresponding
InfoFrame type.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1798d1156d10..4cfb7ebc0c81 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -624,6 +624,30 @@ static int vc4_hdmi_stop_packet(struct vc4_hdmi *vc4_hdmi,
 	return ret;
 }
 
+static int vc4_hdmi_clear_infoframe(struct drm_connector *connector,
+				    enum hdmi_infoframe_type type)
+{
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm = connector->dev;
+	int ret;
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return 0;
+
+	WARN_ONCE(!(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
+		    VC4_HDMI_RAM_PACKET_ENABLE),
+		  "Packet RAM has to be on to store the packet.");
+
+	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
+	if (ret)
+		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
+
+	drm_dev_exit(idx);
+
+	return ret;
+}
+
 static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
 				    enum hdmi_infoframe_type type,
 				    const u8 *infoframe, size_t len)
@@ -1660,6 +1684,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
+	.clear_infoframe	= vc4_hdmi_clear_infoframe,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
 };
 

-- 
2.47.3


