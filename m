Return-Path: <linux-arm-msm+bounces-87940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21351CFF595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 19:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D31683004E25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 18:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514A6354AFE;
	Wed,  7 Jan 2026 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTI+JdNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4jM5agl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9E352FB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 18:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809711; cv=none; b=uo/qXg8tp29TUzEg21E9L2LNDZaH+yepaR3e0HTtehnJKJH4SB4G5m+qz29hGwkGrfGVQWE/cNi++tzQ9uobFCZzybWaQ1+ysLjJhEu4wZUKM8niiy9OV9qVPp5ogthbg/nXxXWwFXVmsLWrZBtbeFJRx9fWzYs5fsBDUU5ueS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809711; c=relaxed/simple;
	bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1R5BvMLJa4Cu4kbwXrEO/XEjDqYgTW1Cp+ddAmtwRTheKYrqGJR8GHlhboeFqmU/QJQkNU3xKzqs1L56gYpN38i2gBHUzYTjWrbPxRVdPlpRgJ37IMs19F/IGxvguKW4iroWIqwBX6ecOdJVQu3qe7e5l1+eUOrY5RjWcK1bYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTI+JdNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4jM5agl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3R602453883
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 18:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=VTI+JdNAvshkdlek
	Yfh5hok2VL+Ruv93fw7t3nX3JTZAOcnt9yVVeRWzxIrMrpZlkehYKArntaZh4Dhs
	py6Lp/1rh389bEb6TO0Y+qlxVSCg2M/0T8nIrcc9kP8/orpoqquwDZOkto1AWxb/
	cEICWw743ZtkcFMhW8qvlQ9DH1/Cd1MfDCaYRGvFcInihEn1//0v7/KskZESWGo3
	Y69JP2reux4mxVQZ3r0Lqk9ULcvavssUs4wagaNQHwAX5YaN1Dx+U04imhGQi0iP
	4UE/I2Koa/YNC1rzxkWL1UO7K1dW95kL0fNUN/pRltO3ShXQHw2WkytmT//QMryO
	taMxNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhmnbhpte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 18:15:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9ff555d2dso667847385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767809708; x=1768414508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=j4jM5aglQJ0ReL1JEzuvljRFK7eW6wJjhE/zm6Bz6oUxcFe5c/t5O5DDgTd0ZIXahh
         0hvBuaS3DqTWZ82rHCzVmYuOO7K9u3XnqcAhG8QKmnUi5jZJY6s+bJZaLcwY9HDFlJpJ
         jpFx7dXm6Ez4waNFxqA5p8+yZF7P/Ouhrsp88MRVwNZ85g/jRciBW/xhOa9MVt1NW8iE
         Nu8No1s7bY82oS4PUEIGQxBToixKpRjVDl1tdbWQb7cTpMJJkJrdVFIpU6G/TSa2pHDq
         GPxsgk2BDTtYjdqNXy+UvQOtA8Dl+sSQMXDzc4UX7Wbzm1gE56drTPxGMXQ1GMvocf8O
         2bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767809708; x=1768414508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
        b=aIepR0x7ocicmTZGIq4jhvsxqkLUrOAXmuEgbmXJekltrZGycz5xAVs0Lm2gcVCmvV
         lanJIZrfrXMYk6oodhYuedrsWDXnIh0VO1BatA4PY1FXMyvNxOXv1tSxfWfuKz01av8u
         UpXW0zjZhTbkIPTxS5H8CZwob5XIkvWR8A9xZ/dkeiL18yR5R8fVplzc3U8lJPyNRoMX
         bLQxtl3rS5mMNlE595GNNaPJSi/1HAOHDAsr8zXLKibRmqlosTOYkmPH01aFJhgjzwvy
         svVyGBYIFmsvtjEeInaqBv3k41NhyBYLP73eF7z82QUYkbwv1Z0yPnI6dxjAJgR6Td9/
         RFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZRcf5aV3pZogV2sQc8xDKlBV7b/y/qw6RAOhPRXxCYxZ/sVllGpyGTTYlNojZl7C6wF+jlmKKygcwdZ/7@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgQgNrMkFCUclqzJ1WIAZ3AA3lW9J84091EtGSHspKXtnDmNK
	R2IUVhA0qV67cqDigGO4t09ZwpLfcL2qN3sLVIv743fgzPH6fNLa1HbyKV5iqavXDKrzsV3bhcH
	do2zkAPBuGD2n3Gc+mhxueQno0dSBtQ6j/wmofPDrEaqP4QkuWJNQFxQg3tbzQsabM33X
X-Gm-Gg: AY/fxX7VomEdLk+IIp/IG8tCmNF/FycPRmL41Fj+apYHAF7Gq6wdA6SwWthKVnJ7kkp
	vl15dYxN//1qjf36bAVZx3uBlUAZClTs4j3MgU5qfof6fqSIdeYpzkk3HEtzILq9XGfkTdu02+9
	sFSBJenoMt0s71VkwERK7yHCV1giHyOj668vv6baj7jAbdzwhM+ianlRydDkBS4T/0SPjGPK0+t
	Igh3UDcXyFR5Nv/dDrdZruNlR+27G19ZVDePoF/I/3FGNdN4U/AiodlybeU5Gvf/thxI+CgGqic
	qFQVvvf77cVK7Bwy9PDb+C+u905uAfBudJVJcgs29vBaSuZxgjGpW+/UTIACEVnAiEwxJyvbIw9
	mVAyt2e5Lje6sR9TmRHo+OX9eIEfb5tyEQ+vL0cjCWVoec955PEMXpLTfZ59GDRzl8TRwCzIL/c
	A9pvqALhXhS/llEyIpJEzvhxs=
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453746485a.61.1767809707642;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQiBI0nmEwHGDiwmCMtLl/jayFaEU1m0Axo7cKoiE+2HfeOqOTLbx0TrveKVWGZFW8ipORjw==
X-Received: by 2002:a05:620a:bcd:b0:8a9:be12:75cf with SMTP id af79cd13be357-8c3893f7d8cmr453739285a.61.1767809707118;
        Wed, 07 Jan 2026 10:15:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6988asm1436884e87.80.2026.01.07.10.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 10:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 07 Jan 2026 20:15:00 +0200
Subject: [PATCH v4 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe
 stub
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-limit-infoframes-2-v4-3-213d0d3bd490@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bcoiW5J9/tWb3J4tHugrKAs3JeyiZt4rWpsWICpksuC
 jCtyXnbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJiH5k/1/oclnK/Zz/ja8L
 v6t7HOL18cg1yeBbaeqq8pOvrnf+XBOj/s8szY+lzvBERUkLGakuejhjjs20u3oewa9eNacmbZf
 ZErVva/T+iCPe/yKqIoU+z/jzp+2KV28zo9cVjnoraUd13pIVM4oiTrkH6U3OTdOSsJwVt8L5h/
 /T3zkX1/bOvsVXv8vj+1+jxyrXD8c0ec7+2mYVenlOTuTBvsSSQqvGuY38Xj3Tv9TeX6BzUVOlc
 4rNlrpcI3a1MhGFq3s68l8oMFjf+RBpdHu3yN9MrYxg6YlHexbMklnWv1mXiTVGP2Lax/1P8qs4
 j9ptzHJSW9Jgcn/7ST4zM4W/whffsC+fsnRj8rbPKZ+zAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE0NCBTYWx0ZWRfX/+23tCKJcXZu
 Kd+3NUyBSH9884uohIWMpdolu0fTzEdkWHYrxqWfrAzViNapgObPzyaGirjUnDv9UeNeRzPmvhr
 pnH0Y23CbuJpUGGvcECSI587M9qaHiqn3EhzZDx32WJW5ZiRxa2W/5vFZsyeS0SPYGylVoSlZ3U
 q9C/G5g7kvFfud9mHL7c99Q2dTKz+aS6QVaAlA890wt+41fUVKBkFTqBaCoCg2qvy22s5E4TVMD
 qxHcTM8lNyMCDdI+T9Ql9O1z/Igo9nUVrlwGlvnY4gdtg9tlsBHWLlUzXezNyzCnq9ufZIJJFl3
 eDN8KmlOaRWJ+sPtGTbwKmVRy8gbi4tiLh7dqbQcU0wnHJlPemq/tDGEiZ/Nhee7Rc5XJDYu5Wz
 3NDM1L0L7WVMtWr2fH3RBNQotO4bXUd4lXxmRRjdd/QYXIdH+8y9oAISW/vAdYAQ/zCyl1+pcJk
 xf9LYEhvmTQ95KwHyiw==
X-Proofpoint-GUID: oCNxuIaD_4dwuc2dI_7hy270UqGdgPhC
X-Authority-Analysis: v=2.4 cv=eIkeTXp1 c=1 sm=1 tr=0 ts=695ea2ac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: oCNxuIaD_4dwuc2dI_7hy270UqGdgPhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070144

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


