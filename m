Return-Path: <linux-arm-msm+bounces-69443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88606B28DDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 14:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 230D03B8F48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89F02E54CE;
	Sat, 16 Aug 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqLHGpE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3C2E5D3A
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755348081; cv=none; b=hY/kTuZJbo75YbBmbtrqIIQgJW/oI6KkUxD/RFA1j06HyweAWCfARXEfxBXjGruzg+rSwLv1kbMeltHQ5LeSMSM2sTyrgaSlf7Fm/OoQMNldlOrrRANiwHBx1IYsHpsVGb/x+38l/RgwkWvje4FsBZbx75cn1qHz4/Pjk93eK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755348081; c=relaxed/simple;
	bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBmnpE8VDeX1plrLEebMUQyWzWI/203SaBcyuEtE7lynjuk4/XmN1xFky4FGkPvvsNdeiSYC46mpiTR/+bMWxX78dY7CQXjgl673NbK6j8Tdp9NV7XY+GrxHzlaLWshzY2R3sx4csJO6OKVLqEifIfy/p9RLeLmx0PDkLHNZNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqLHGpE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G6e26w012941
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=jqLHGpE0SrHzaNJq
	HvY2s9Lj//kd9ayUo5T8OPj3AhPzFYl9txS7IMbRPU6RzZqt7+fOMKaxzl4F0JL3
	Md4gtCfPBc9J/5TRiTPEEM+9mGTQrg/qRYFui3MXwYXZxi3zPK8yoYlCfZb1HEbg
	XtlcCpSqyIK9ffm6ojJhBnZ5mo5CX+YsJNiTP83oDfa0EJQ+gkujL1jHhB/KvTFB
	0+vgn93l7RW6eJDlAObxdXaXQcIRrCfblub6BEsh4qUsvOUhlSJl702OXvDC8O4z
	15EzQytH+vqquTtxAYCXYM/iv1pXpBhw7joL77Ui1p9iv2lFToHf+0EgAxEhtHNA
	+ErGiw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxt8qy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 12:41:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88ddec70so26697696d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 05:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755348078; x=1755952878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
        b=pxOIE8vb1uvTuDDGvrIRIS4/NSj5hckL+MHx5D5kHWxuvr9lkcbEFizW44KSKx+WUL
         eGVIKPTtyWYci1QWdpbhBJwAUaPOXinoQ7+D71G1qniynzu8EBH7mQZe9hozwOMTPEIG
         FaJk12ghqbZ+1Y13TfS3er/d3GIY0O77I/JAX5fxjJSsx7SIc5qLVYszDCJiTd4XoINO
         NBqNAomXKEq6jeFbJs+1CE0ljPaIxgSeP0353Wpega85T2/6yJrjV/ug6PadKBLLUIV7
         HrSqj2bC3qXnUnOcgTA4y+9LHINRT/9Y45lmQrXQjogY7q7mzS4PfsnVJOQk9rnx+RNw
         vmvw==
X-Forwarded-Encrypted: i=1; AJvYcCVfWEvRA9IIlMVmzOkqPdLjcd150hBps5Re/HaOS5OTmXr9qTsDlHyKh/2JO/2LYAmlNg+g/jBtTXhCrAG6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2uc9BMvPTWkuITWj/V4crRcKAO7uhwQ3rj126cxZkbJ2ACQH
	BKZn5RicgKiJYSHrSQ1HpYlE7gjDOKbvMIZKo90K27fn1A2FJqagN60V0uDlVLp/q+eEKop561i
	JdFMq2SZY6Wv+E5cw4VvoccpejK2TxbIJmshz9mBTCGe4m8S/WsyKCPJxwYvtMko7mcUA
X-Gm-Gg: ASbGnctH5DhETgmb61kjuU+ymJGObYvdPX0GtkAP0CC075WU1kTW+uC4jHSiRADJqpD
	KwEOWOVTvytToQ3TJFQ6Cg/LjsAjD/ML6zYVsDbJVwyYg+7NiVb8jnuqX8F3mW3k0s2N6o6Db8h
	Fh7gdpFEfOt1z9kLHsyF3iV8ypmZBe2AJ8tN/4RHdfyofLk5qFla7I6AKX1vQ8u5LEszFf2SVC8
	Jx2bdCfk76YVSsXVgJF+FksHbOuDvWkpp14CsUd7BN6Qr6s8pZAvWB5YZpScUKm8uw5GmpMXpK7
	BRBrJ+Pn4x1FhZGB8Mm4aFC07GNvsh51ow+YojaMSToR7dbBaVFfrnbnfJEl2Q3UBGV/FEiNOgO
	4y2I2Tmew6XSd97DPASrp16ANTAiklYDEjeR+RvUAbChk5wpnXl3X
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id 6a1803df08f44-70ba7ae7e3bmr68367086d6.11.1755348077594;
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYA0jwLaGI60dgIdc5xLLC6MrgAPeHvs5XeZskw9tq2JN3MW49DplYWInTes5Xz+UumyLaw==
X-Received: by 2002:a05:6214:c43:b0:70b:a22f:cbe5 with SMTP id 6a1803df08f44-70ba7ae7e3bmr68366726d6.11.1755348077082;
        Sat, 16 Aug 2025 05:41:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3cca21sm856554e87.104.2025.08.16.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 05:41:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 15:41:06 +0300
Subject: [PATCH 6/7] drm/msm: hdmi: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-drm-limit-infoframes-v1-6-6dc17d5f07e9@oss.qualcomm.com>
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
In-Reply-To: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooHxffZfdznR46omAz//o0FIm9ItgOJjoSW5dR
 tFCoAWaxwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKB8XwAKCRCLPIo+Aiko
 1SJzB/9MbWkK1MsjNZOw3lcgrUqwdBEMotBk7PI88jIMb49m3q6pi1Ic+1OcZvMxbYHJ5ytFdOB
 99dkv7TMYuHpQwf5giIywYfwW0VuZrDAcFtTbCfvYKHASIQirPoDKIEhTcdtUUOtb2/ESl2OGr3
 yx1San5Qryx+TcnSV2oMfEjDBWqbisypv5F1qp6+85hJmN+eLfDeUNpy9whi3ZoY68pGFz7lzsi
 oCs8KusSv648XcZU8I8UwAZJVJBCPgNenSw72lah8u8Xd/o+1ZjHr39EmwY5SvvgFZNkRmzZSBy
 H/EjRxLrBHRVWid9aiI3/8ORFSsfpCh8JNlsgRLNo2FEBcrx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TDwTzI4GIGr0S6b6xSl94rWAW9k-VGIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX6YCgrV8lSDe3
 sl3oNWZhr4IgGfN5mXqmXdQ0THHjgBJumwZWd0xvU9054VrJ6rg++c+jRLWLIfHfuWwc66lXfQQ
 LYkFYBxAmqIzY2gh/iYsCmGkWDfYjc7gqS6D1plojofvVnUq+TR6qGSh/ZyEMwcoZk4Uo6oBpZY
 e630fEfeukCBr9yphRh5bBWtHMnW8qKaXXAQ0Eu1KejKrGC+hBEvdq3h4uccRBJNFGuacLvjhmL
 fypJeXPH0XRvSx2rN0Q2T+XLX4xyyhLN09LsAMvz9a5dd62YV8tjTkE732z2hHf5amgoPNDdY49
 EJHKfIQzf8f0sSW2LGDQBleMN5iooUqTwjKCN/ViaUvtvfFA+9hhKG3GUd7VV0h+ZQ4uhcJxJpM
 2Rzak/Fe
X-Proofpoint-GUID: TDwTzI4GIGr0S6b6xSl94rWAW9k-VGIj
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a07c6f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

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


