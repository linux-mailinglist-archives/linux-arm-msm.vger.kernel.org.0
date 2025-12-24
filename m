Return-Path: <linux-arm-msm+bounces-86446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2112CDB0B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1BC530B3141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 01:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9195926C39E;
	Wed, 24 Dec 2025 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5FzLQH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kvs9sRoQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75E11DE4CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538243; cv=none; b=jfnIWY/SakzbNGmAVqcNv7Pt+c03ab6SFnoVwN1UFLNUYEX05iyU7SeDZt0pm6ETSi/ptDJzLtoPOM6PnxpWELMtFdouRepHo+cD1fstOdxYaTMLtb4GJ/JD66OEb1QbcbeoFVaTwy3fiStjlDxPewq3BUhXcOnMkCKrHt0f810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538243; c=relaxed/simple;
	bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I2h0kLw7g3y4vVBUfAO6Ctl2GTQgs5boLNsf0BCQlMn1kuuewNKV9Eur/tTPWigTojQrYZoerXJOz6SCKa8BM0a21Ay/waMn5BMsYnKMZqbVOvvPESNKPKl1ZJ4CC3Ahaa46WpalK667tBFRY7dSo2z29I77tDSa/XOSlfLWtVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5FzLQH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kvs9sRoQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFr3ov4134142
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=; b=B5FzLQH/4hdXvpfe
	zRFH90K8m6qtrg/XEWhQfEiFLYj2sJlborOxSU6Ve5K1V7hKJG6ddM5f5hLHr9O4
	G5FXrg+x2+sZ9U/OXiaNp/wHJ9rRB0Js17h6g8QCgkkdYEEOM682EJmWdkRJSwhK
	kQePbxHNlL6j+a/BpNbMONLysUtobbr5nGvrJmzoA9yB0sF9cVMuIU6eE0kaGPiH
	9zYXOPs5JQjKabNmUxd4fZ+aeTJlgQvTv72a/GeIgJrwdHaN0Dd/bJzy1t13hpI4
	C6ekVf2ER33wY8q3E2wG5W5TveJk+urBH5JoBUQQ2/ZGy/5+7CIj2iJgKbR7pbjn
	GsKuwg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46sebd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:04:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3822c06bso148684236d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766538239; x=1767143039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=Kvs9sRoQ9P08HzdC4DJMn2MO4YzQTDPyhtkOOQvcYlFVWQ3NUWQed41qngyEhq/BV3
         aOjs83fOBgSU41UearGI25roEgB+O39N9lEs6/uMctinY71149U0FNr7aAHbMGdBKLKb
         8+EN7zF9fIiQl3agBVrE8RU5tQJZfPxXUPEzmy20HSQh3h46HoZrWDcf2CFyNtdyno3C
         FpjR6f7iuW2QI0lXhF9dtUMYQDLNBAc6KGprKt9hfuyHusa6gfLKIykrBIZEAjq4wbv5
         faIOyE05O+jnvaCaTg+KDfuPmi1xOybnKVPh93ziCxfzKpKee4Qn82fl+g4dWlM0tWH0
         lRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766538239; x=1767143039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O0WcJstQEewLBWylyM1yaF1uo6Aq9IevUZuM4w9v8/c=;
        b=ohdtErglQ1qwAW8ZGyBbPfJRwmVv1WT50TqPbAB2K4PexMVs8xiwhMkCILW0iVij11
         BNCheUtfFZjk+fffGs/mLfDj1y73O2XCkq9cNmTbm4gXbTqRe68m5jCljYivLEaTqLMg
         7OmfMinYddRfcf0s9tVSIBHvUghQCtgtk0oUe//TXs3wnYwcE4SnOzF/o1cYo7RrdTwV
         CZeuVEz7io3V1Y/LTyFvMI86O/PXCBSYrsesF4f4DaESKtzZ3Zz9U0Xnblhthm2/G/Wj
         hFrkb6C82ll8iu9nGrf0u71+25wxx7v5RG2z9P73M1spe9XwDEvQUBLni4IhK/f+aQCY
         xr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBeh5mT5slYlJKYArL4nbJ9JHakRj+IK0VEN2GBMmADnnjvY6ijiWwLmI+IoWJ4DqqQbWfwz4RsFdpFueA@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrzjES4u93ftF+Nlieu0ZBuuok/msDOIdfPO7XGWLZklO8tUJ
	00NE+btfFxR85In3+xaQlrS2HBBEnv9CzMzQYRbQqbKaIGHt4fcWD1ZBAMLnu6T8tYPTjqw9ZGw
	9/29/NAEz06bANVhkR1ZQ9zbUMEQ/PwZw7f6qHI76Gb7ojOJ2d+KbKKWGPZPr7CwFKMXDKnfyl7
	3Q
X-Gm-Gg: AY/fxX5ixWStv0fIIzj2NhiP5OqTd0ConDgrop1X1zRkfCu+UDy9UNbx3RnJLWjGoLk
	sd5s0zQ8HC4zcinPkF8UZhEa9fzqF85/x3MlcK9AkAqMhezJuJnAgGgjyShwuahtceaaqy2+Ew1
	3C7DC6hHq60ZUbiPxuvkBUr1Gbt3LHkiIf7kRaO9LBtRaq9QafABVf7jsZ2kKIUJvQ+eRXZGrXu
	G0v9voZ3wnWV48WGy1m4emnbE8GVEd8Cl5eIDTU4UnX/dzyWb60SBxLEhSZXCnc3Xyard6KJMYo
	ZbQiIY0Zx2QbdwryK5RFvWBYMN6tpBEF2e0XPTyYCDcDVYH7Wv0PM33DVUHEM6gszH4u6UK15pO
	2k4nfJSEgVIJoiYGjwn6NNBouPA0nPXkxWSftUuzSdOJJFNEJhHnUy9J0MUkx/BeRh17X/I4nP1
	ooYB8yZtbnZ1w4irCYnIITaro=
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225831cf.52.1766538239464;
        Tue, 23 Dec 2025 17:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQGuGT0UI/67dXu411P/e6eStajQsFB8+nCzwFqQBAvO4esgI+rdZ+y7jVSLNcipwTefBy2w==
X-Received: by 2002:a05:622a:4d0f:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4f4abd98192mr256225241cf.52.1766538238937;
        Tue, 23 Dec 2025 17:03:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 17:03:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:57 +0200
Subject: [PATCH v3 08/10] drm/display: hdmi_state_helper: don't generate
 unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-8-7fd3cacfefed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sxrbcfgP+1lHt6WjBr3iluImnNCx0aJDmiljrTHbhwQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvZLWWWNHwhc00YhsGGHeZN4blSTiSB4fsQ2
 dICD4LJEyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72QAKCRCLPIo+Aiko
 1TXpB/9MY/IAmp3a91kMBGdYigbcoUHZMxaQmuYtcY1pIt9hLZ/xDG0HyDeKfdb4ZXPmrbxM+Lr
 sZHIZRai5kkZBYBHRbs1UvhqFPaEKWCBVQ2Okq4Z1fFonAOh7dEtqQxrre3ELHCo/ljQz4N4wif
 r83ry1FetVmArWVlTeM2HjwKHkCtccISoiLzXtBF/vjY/mM4/GPwg3Vgf2yuvlfOviragLloVE3
 bKNPzT63BmazQ/jQ/THvNVxTXxfLg7YxC6jPXiOFdD16vj7gkXrw6SeuFK7IBzesw8H/JFK5eGM
 6letmWY47KyLynSka/FTDRJs5TQaxz+pxi/8ZGoJLndSd0+D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3wQ2siOVUI7mQZk1z52UWEcPTQzUsJUY
X-Proofpoint-GUID: 3wQ2siOVUI7mQZk1z52UWEcPTQzUsJUY
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694b3c00 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dmsjDmb_ix4f0IDqKoUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX04YQIxnYyd5T
 wmpVbiwzcOqkwPU+nQfx2dNrnJo6foCw+8o4+JI2qLEfT3348Z9hkx07gzi8tAwMfWGcmChNXkZ
 GSVFEgUeW4ITFnLqG7p9ZoWEeKflkHZm2yP4VVySPcT0NqyAtQ0dhK9e10TMCZoKYkQE355oID+
 VjB2bUViB6L7780Xv+R+Z1FxlYxzJZGsSIRrqlC3E2PmpWez9FhaRJhHO0n61FCUcqUHYBvBBsi
 ZJRXb7Hlh7by1krttjwak5AoeV8KkaIZBWSt36u4xrHW/vwGPTuL+5K5H/kvjtlhpcwY7aMhJ3Q
 H5NMAu1SSECEwWIasweXI1FQtUfGOLiVJAMKboE5Vh/2mlyT/ppi8YAXAvrm/ooS44FL9Qmsvav
 7JLNVMmFPHnQS4rbyAUEuW+J6HQtF8PRpmk4U4pFHxMEEyuxapMT/FvIu+gK1MEjjR+BcfI7Flk
 ZFfO9w1rWqtaRoRJaWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007

There is little point in generating InfoFrames which are not supported
by the driver. Skip generating the unsupported InfoFrames, making sure
that the kernel never tries to write the unsupported frame. As there are
no remaining usecases, change write_infoframe / clear_infoframe helpers
return an error if the corresponding callback is NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index e8556bf9e1da..a1d16762ac7a 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -718,6 +718,9 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->spd.write_infoframe)
+		return 0;
+
 	ret = hdmi_spd_infoframe_init(frame,
 				      connector->hdmi.vendor,
 				      connector->hdmi.product);
@@ -742,6 +745,9 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
 
 	infoframe->set = false;
 
+	if (!connector->hdmi.funcs->hdr_drm.write_infoframe)
+		return 0;
+
 	if (connector->max_bpc < 10)
 		return 0;
 
@@ -902,7 +908,7 @@ static int clear_infoframe(struct drm_connector *connector,
 
 	if (!funcs->clear_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0;
+		return -EOPNOTSUPP;
 	}
 
 	ret = funcs->clear_infoframe(connector);
@@ -928,7 +934,7 @@ static int write_infoframe(struct drm_connector *connector,
 
 	if (!funcs->write_infoframe) {
 		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
-		return 0; /* XXX: temporal until we stop generating unsupported frames */
+		return -EOPNOTSUPP;
 	}
 
 	len = hdmi_infoframe_pack(&new_frame->data, buffer, sizeof(buffer));

-- 
2.47.3


