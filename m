Return-Path: <linux-arm-msm+bounces-69812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5942B2CCA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 478D21BC39F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E3F342C8A;
	Tue, 19 Aug 2025 18:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIb0QRa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130F432277C
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629870; cv=none; b=Lezpkoh+J6TESkHwraymjIKt6qbSyycqru5TbWodOgh+htG4EqIXFSjxciXX0Aas8oOD3gj7DTHEye88zBeC6G8mAsKdtOtBUNVDqtjHbpgBD6P9W/iFyw/u7aMPstfogl2lmxCCNInCncXdDJS8l3uiB6aCSETR8HNrI4SJ6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629870; c=relaxed/simple;
	bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tVpmo36LdEPEsVBpSPvsq2X5HjCOSOleT6iVDeMhSakEVztVGsF6BNgZ/sLBj5XT8SzHxjY9PF1maAWX5DtYey3aTvgvduE1Jef/sHeTqbbsWupQitw4/cBVqRYPiCvCmvx58LQNxLBVMr4rlwIezqVZg249tSVeI+0Is5k2o30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIb0QRa8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGtk2V023357
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=QIb0QRa8heAIzrGP
	AXBqzKI4ZHoUfSR1eAb8IDNQwoM6dTZ8QzzO33m+pcHsZPU2mh4+8JDIOEKKfLD/
	RCin2Ol4oAV9CCWBL+mMoXJT3flTPK1uxYersHokYLdxrdouCcea743RP+Vrb7FG
	YkyrVHNrMgGE+BIrkqr485rdSu+CdoUFsZjZMRlWCYye4rHVYwG7pPAczwy4ODNN
	6ArnXqWbguFKRFZRoqcRqLjXkXIRooAx4kVaRlLV55sokedXGdRxH/arCJHkAtw+
	148WK3+3kWYxrgsAGsG5oh+sre0XUowP5XizgM1Stmk63+Ft68IehdKO59/HqOWJ
	9vmx0A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmmkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:57:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9384d33aso51792926d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629867; x=1756234667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
        b=wmaOW3RsOItF4322QGGQlz1W+wDKVk+7CQeRc4YDniqS9duoq5iYWuYwUqRf/pyz4l
         SnQf/pK8nzKmA3K922pkn7M0l+O7e+ik5R3K7gBmWndNB/6Sg0aZOHvGlsfgKk51VoMt
         o7JfG2NcWAD+BxBDGoy7ieCOjcVmxEW5heV2lzsoIvbeOknyj07AkWHw8iHvup4RVW9h
         ZFquwm8mAfXqcGgJcRi1GgEWbjm5D7NeYHbjAI5chzKjf2c6pTXGlLea5gGgn8fUMPnp
         b3YPeMIb7aIPVuXT+AP/iI7liq3hHNY5tN7h6qwMb1ZydTTUDdQtjTqMWWlP1sLmMT+d
         4iZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVLynx1HO88BHJZmmRqTDB458oH1IxCr4NHXXEv/FdMFvy3arkrzVTJ/hxA3l6ophw/kYzfkv52bVe1uVp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1KknPrTXE5nsDk7NpPg5ZIO9UaCBiJO7TCrqSfbhu+aRRfDV
	JCJ76XIJ98J3kHaq4EPTtKktG74BZSkHm4smCdqHO3zsXWgploY0Ah65YQdNWWQ9IcoRBEpY1vl
	6XXeJJSkje1WzXKofyYT72XljdsGtkhW/ICWCrCe598veaMOLOz2HosBvMcsT4Z7sbDwN
X-Gm-Gg: ASbGncs+YXfY/8b/6Elu87nNw5NIRaMJUrtYbulPY9epLbltEm1jH5SU5Xu3zhRQm4x
	MFfX0yR8Gjb9qWDQbmlU834AH2G7UAkBKq+Jx7NFPTh24fDNHWJaZ5PMt26ZHYghKV5UnXxSljw
	MUUT7BUcvehDIRsyJUZfGpQR+PKFMJb1GmlfadsNaXaexTubjR6EFqcCHrPzf4JSpG5Qtxc+aa/
	nilwwCdvCH9w2r/JC+sI6ybSCzrFSgw76xY3AS+0fE0hQVAZxz2d1dTx6owGCqcdJhDj6jtmy26
	3iMgH+95SPlFK30c44i+9Tb4oKkJkJlYEz1pzSXFPjWFpzNTjVw8UnY3GB5CVrJ3/RYfgPhf8M5
	UaTmHshE9utuyVD8DGQoPJNAPd0FJMpoi0gMuuFt1AiOdc7AKEfkV
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id 6a1803df08f44-70d770ebb1dmr764816d6.44.1755629867311;
        Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHHRhBEXHu7meuKjfvfUMQyn/xX4sNy+2tihw2l9EfepkouN6qL54x+P99KY0cIm6m4WW1Tg==
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id 6a1803df08f44-70d770ebb1dmr764446d6.44.1755629866811;
        Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:35 +0300
Subject: [PATCH v2 6/8] drm/msm: hdmi: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-6-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcjJzhrdtpr84jU23CUsYEilRvFhX2YX678
 OfZlm01HoqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UoSB/4jVjE0YR5wd+GnJ4DK5xi52Yuek7jhDdfrlSH0K80rX/NeKDdZbhLPORAVZ6CFMmsGvPw
 evXQXVUKHZF4ZuiuYTU4gmioVd6RB9vt5FPallgHoGlUW3qgaftCPXNKrZeH5Wovx396cpCFImt
 QfDLUlANeAi0ageLVmUbhJXpqnX242+4QNBYG9U5T8LvWXMljEEaSxbIashznRokT1+T4g6+sIt
 srqvF+4q1MJNHBUQkQYGmlT2/jCX6lrir1n57VxR5ZNFnhR9QrSUMvq7EgZKAfcL9yo11tVpDxN
 OUkM0U9K++rQnD+B1bCpD/MrmOIzhCArcz2/bcZQCfzch/Wd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfXyr5eWt69LhKN
 9FLV8/I7HeGwehi8fy/tQOEcxN9OeQtnZyrUCIz8CzRx4tT6yIxNin792XzSHCekObLnKkeku0r
 iEYPn4Fu2NQjUChi+hANLsteEv54PTA+6T3j7P7aH4YT1jh3S9v6PDb0AkWhPb1vTPpR1GhLHkI
 bnDjsT33a21dyjGWE/zBENy1q0VXqwOW/Z+IWa+KZUzfX6WZxcUVQWaJcGsMS4rRM2w++SuXFYC
 Fm2Ld3Pqhsa4flKFTp7MQRrWxFHHjiWAosnCBsNlVDPRdE9fG4FbbY4PmMotX9DOTYrs4G+Vljv
 1x3rO078rfSueoQXqeVXB3IjueRt3EsMKr7DmcIB1t+XsUn46czsVmNJ3qMMmLOXzrwoiB1ZHGc
 /DIfzWWT
X-Proofpoint-GUID: f8vX_aOAiM2cwcfsAfx5RjSuwGt9Djdx
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4c92c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: f8vX_aOAiM2cwcfsAfx5RjSuwGt9Djdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..aa36d203f38f0f5a197afa8493fafb20cdc43476 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -498,6 +498,10 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2


