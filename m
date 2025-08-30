Return-Path: <linux-arm-msm+bounces-71270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 483D9B3C644
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A353A27449
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE8B1E3DDE;
	Sat, 30 Aug 2025 00:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IXnoLFe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA34C1DB92A
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756513402; cv=none; b=hYHledUrFVy/+Ah0pqHFPiLJ2E1qt9jHgpyrMmnX6FY9jDuiBKM8r8nMeyH9M0oKKgPcETQztz613Y6Aspr2JAeZkuoCfbPSLC01/hBM5x9bpZshy+jErklQQWvlwxaa7e813CuIttVXFoKJoY15xb6OuLzSr7vb7Awu92Rj2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756513402; c=relaxed/simple;
	bh=cd27TNKmPZcfQJ3UKiBSlNuQpycc1+LIV7BQ0LEWwY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgdl3jUdxmw9+zIn+z1EwU38A/I7yY9xzfZmo5hJiC2JnB0mM2zy/abjaxukZlQS498EQZ7vsZMbWIPPxvJSLDTNXjBRLlniGRZUAc0C8K1hYyUWwUmcGmgy2vvJpAJYPg0Wp6fAQHnoD+2X7/hgRN/Co5JQyyYlJyC5HYiTETE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IXnoLFe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TN0Oov009092
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=; b=IXnoLFe3Mnw7FJ/3
	m28CaZTdvpwEbp6SY8hiWZu3PDM2KVfemXtqbZ9pWZ0QONyNOwQP7Pq8C9wXiQZ8
	9KIhHSY8UONnU8T2SV4IkXofTvDtgFwha/05lBNGensz56A4oTPBbThlXO61ZH36
	zQmiYcnMRsY6j2IdQPwmkTkiL8r6bV8SxKvm3ekrYrf/ic+4iIC/CSx4EzraZnq2
	oKpthEJcp8PA96vmPm4bg6c7H0nhhXoU08WUzfoFmzJOPDRlc4FFHhCcN5Iz8X55
	wpXXNiNNnB4P6lR8vn+bFUWx/k06lQaC7KuFDqtCT8Gtza4GSlMDew2tXRjX2R3t
	FkB7Ew==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wecth3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:23:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b109ab2cbaso50259311cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756513399; x=1757118199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AqNK0JvpkzUHYLdcGKR1RHF7N4CzTcthmQAulAujD0=;
        b=BhqEI1n0dT8EEKi5nVzFhsUtq6NwpZWVVPCigKe0G0nhfl3ArAsf+7PrVU/SAHc34r
         CdmbzxRlJs6JL+iW+lVvUQlAK6OydvWTnH5fgqeFzucXofDWq3KnCa2GqeGH5t8KlWMy
         7y21ZZIKX3maD2Y+T/H9N/990fHoyWh5pVqSSSiYGiDNRpAR2s4xqV60GhMvx8xhB940
         2zqDkDsRRGvT8AC7OTVAwBoEkyEb8FAGtMoDE5oxV5uPMDr59x1YgBICrcj/3J6AwlyA
         Wbxzk5kCfo3xBfDWyspqXahyzmEPIHcUmAdKLQmXQzVkNNgBtUNZBEln80Vwikx8Ku14
         Mmjg==
X-Forwarded-Encrypted: i=1; AJvYcCUjALZ2b8UbOb494E/sJz2h9PJcT7G0g9Idj0c33DxaLYwvEby1Dug28tD4j4oYGoqV3e+Keu3EE2HflcUG@vger.kernel.org
X-Gm-Message-State: AOJu0YwMrB0tIf+CQMFfh6ieQmnddJKIeKFo317wZ4cx529C+C5fb/8L
	Tlo/ImtizKjBqKC1YWUsQnYjpMFvwav6MopQWqIAz6dB+D9rsEdKPuYSVk5x/vewBQn7MOI65/y
	i3AWBgClJOeHHmJAS4vXnA7akYQW0PmvwIIV9FU4M9g2LtFjA0M7WZkeVxncmzYN5HyxN
X-Gm-Gg: ASbGncvZsaB0iPOtzjLyVVrN1GghbxSX+a4NKaaEwSbworJ27kvS7LITZ33cAwxCel6
	5vcU/k2RYO3miLJHakDyKxTEJgt71Io8td8nBxXhuGwhFlAMH84MbigWErwMa1pfnbd1/7K2vee
	Uj+J9lpz/dPVQ3l8asnpCkJ5R5kTfx9nYcV8nSFoi49WmZXsPSPmzCLiJbjLmR5e3K4x24V8W8J
	WJAlVycecQb7m8TUZ64CS0ktMW29MQTXUq5JVl8PEBBXAIYrroHnswSkagaQT7gjhioDQai1yGK
	nB2tPjytAHef1mIIyZ7yCqAsAmQIVbmcu/ww0mX4r/5cPRlznjt7xvc7w5BFE5ptlIT1qIrgWqZ
	xnECGJpeFzSj0X+eeiSTXcN8h/TLmOGf4+XbhamvTNbyCatPRXyxp
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4b31d80cadbmr5813761cf.9.1756513398579;
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVN1muIBwmw4hoq9Rahodlm2w2ewntFQnkQICLUImr1NmaPx8XUeu2IF08fUmhex3lGfMyjg==
X-Received: by 2002:a05:622a:1a98:b0:4a3:fcc7:c72e with SMTP id d75a77b69052e-4b31d80cadbmr5813271cf.9.1756513398051;
        Fri, 29 Aug 2025 17:23:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f676dc52esm1019907e87.8.2025.08.29.17.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:23:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 30 Aug 2025 03:23:04 +0300
Subject: [PATCH v3 08/11] drm/display: bridge_connector: drop default list
 for HDMI Infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-drm-limit-infoframes-v3-8-32fcbec4634e@oss.qualcomm.com>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cd27TNKmPZcfQJ3UKiBSlNuQpycc1+LIV7BQ0LEWwY0=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Yml5RgLv0905LPmzQqxvhe2nOH5VfAIu5qjh8VjHPOT
 zjoMtOpk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATyTvD/lf0vs0N2VdxoewZ
 BlvKi1+Fpdx4oJ01g7fslfG8TE6f+kcbLJ81nku69W/mZz1rOe1Hpwyr3iWdED7Lo78x4ljX77t
 qdrbvpkZMmsBfof+pWKdBPm7n7qfFRk/ecfzsPf3tsOo3OxedX/aPmqNLTSbJlj7IE68q0jj3wj
 CxzjXZIePtS/dDOY+LF+rKV67NWGG73faf3I+mMv2ltctNV7jYC6ycModrTdPtj7IiBXlf9bZML
 bESv/3wA3NU0/3L6SLFdhPMn0xT8dBpkez0WVe51T+FcaO+g/iaSP24B4/aBMzOPihT/Sq7u8nv
 zDELdVPFCbyigqIpb1OvcIQxGLRbanuGOlkaZtyUK8oHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: aKVwL2G44AgUwbHUuDtM4zEIydDZEe3f
X-Proofpoint-ORIG-GUID: aKVwL2G44AgUwbHUuDtM4zEIydDZEe3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxFUUWgePooJ/
 FvnOVj8i1FfL36bfWIl45GsIsW4Gbk1BLtApNKf/9bshNi0+a3UTS8DvOEx+U4oAbwE1u5elktN
 M9t6hhmyO+/MlPxMR8rNDvZaN7O51RK4DX+Zf9Gm/wAMAa6CUE++1CH+WtsAAy6doSKAI28o7rg
 iFDGvc9CE3bP4WH+V6kMOEOz6FRyMNDD3brtA4zRdzZpZzia6GxvIxiL9Qp6OrsLlFDSbNDXVPM
 VuuPBBIbzseG5YwAmIhVW0+OqvnctLPVM/0x7WcgURecQdI+N9ugNjLN6D0PtGWJZZrNZAT9d+D
 4pZDHtmRQpS7RpKGOTBUa6W1vpe85A4ZrSThHGSPlVXiLSIGeyeKnT/J+PCOQtLCNkUbqhEhHLU
 0QI7Vri3
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b24477 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=-zYrYaJvJPDGblfDOm8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Now as all bridges are updated to list supported HDMI InfoFrames, drop
the default value from drm_bridge_connector_init(). All HDMI bridges now
have to declare all supported InfoFrames.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 944fb497ca339ddd63c132c2df0888011cc0487f..2eb7ab033cc84f8bf5816b5a608b2583226336c5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -786,12 +786,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       &drm_bridge_connector_hdmi_funcs,
 					       connector_type, ddc,
 					       supported_formats,
-					       bridge->software_infoframes ? :
-					       DRM_CONNECTOR_INFOFRAME_AUDIO |
-					       DRM_CONNECTOR_INFOFRAME_AVI |
-					       DRM_CONNECTOR_INFOFRAME_DRM |
-					       DRM_CONNECTOR_INFOFRAME_SPD |
-					       DRM_CONNECTOR_INFOFRAME_VENDOR,
+					       bridge->software_infoframes,
 					       bridge->autogenerated_infoframes,
 					       max_bpc);
 		if (ret)

-- 
2.47.2


