Return-Path: <linux-arm-msm+bounces-56711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BEAA87D2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41F977AA3F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E9A1F12FF;
	Sun,  4 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGGVODzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A001DED49
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375227; cv=none; b=LI7/BhsYiwRIgNffWsqFocwOp3Ejd9H1Lax/XNH4EJxBTO4gF40atG47CWxTOBFjAawSfdSFsvT6+uqU3qDwYHQTI4iApbwA1j7IMlx4wniey0+NckaKkmlJNd/BUCyIwysnrUT7leHF+hEi+PLto3Hce+5c8KUg2I9zsktjWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375227; c=relaxed/simple;
	bh=laU7zJS3YV56vTABXTYYyCyaK7vtQP0nr2IhS/ljwl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lU7EWwJ6YvStdv0DNKKXpeewsI45QN1O8dc/p2BlzR2TrbOJwGSJ2JRccMgRWUN0s8zad5Nx2pLADFQuZOKumBpiVeK2fyjmVUy25FPAMVkTIVLBG/1jd+ISdlCXUCXlsYbVTkUA+Aads9/rRSbSlf/QwzpjIX7+UvOcx95M3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGGVODzD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5444xSls004394
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=WGGVODzDyzMk5G2S
	mkY59L1kxpwBZ2j3zGyB9hlsatxZhWI3y17xKjPbWLyvMHBlQc81X1NlLMkSSEUk
	GPS47xc0CSyz/Lx+Kv75VOFA33okDO9YmWQL3xzwLLfDAE3B5ZyyvJsECkPC332M
	CgO0cO90tYitEJvzcWiyh+k0kfNFfJEhQBuWVKwke9chjD0xOosEhCFUvbIg+lgG
	QbxGMQ/veayEzFGVS9EK62iZRHxOzlxsovoh0KeIkbulhNyTuDljYEkGiPfAdEPH
	LxW+gq+Xr7YNfNj0OvrwKo5hDqVxG/yssC70FUd6SyffRTrOV+kzHdo+zuajr0D0
	XrmCOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5a6e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae8b206a4so70677201cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375224; x=1746980024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
        b=Zu1dZhr3sHdRVnKsPfIh8Nb8qPOZYMjwQ921+VO6U1a7HdJ/1Zf2n9mGfB+HqHk9Eq
         pBeyzz7T/hmX90jrZgcgwuaG/J5KwX9wuGw965CfgcZNxGut9/T6SV75lLMD87rAjR0I
         uCcGDLB6m//iuNdSbl1IGHeSsY15Bm2BG78arjKi6TCQwx2sSbXCrqIHCmx6CNIhzj0k
         9pdrYxjRi206a5DxFvGstNEwD7EMtfMJEONu9KLVO+92F8ajgeJID8sqAKZ6Rsil+utK
         zbgIrwE+9kVLLrT1LzmFpB6sGAdKjwwHmzcR6ZDLZbwgpDBC21AT20wNvNSyqgGorXpK
         aSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwRnO6GtqM0EjYPkVJt/nmMELGBXOahLdart6bgizz5tVSBc0cevTVmteF7sCPzq6DGdY4Z4IvelAEV+bg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzda0juxcyjufRQzJXq7SQQF0RsLKSRO+yV2QGqw05pcaZRhBmi
	0jYaB10JPIiMzVf0Me3qTlXMfmYh7yW3gQFcmvKmEHJyILFJjR233tQQWApnT8IRhnLaS7q+CCz
	7yoS6c0LQ05YTlSXP1zoKbvRPXmF3G7Th9fcc4Aczc0bTYg+C+zkgq1GijMVZez5G
X-Gm-Gg: ASbGncuf+B3YVOBtTAiWOdW9vH04ap30RQu6EAXGXvJCsDtjsKr1wwJ5R679NJV24/K
	IDvzIGwsKF80M4awVPDOHomERbk2b5sGdzQB3ZFlkfgxMQOdOJWpjVi6eO2w2nSw618gKnOseSg
	7AKeRXKByjJI6kJyQJ5gYhf74xBiAX61+mQTBtcNgcPOcKKAILS2Y4Q3NryGFxB2OeCIM644s0h
	xn2sJ6xrpi6BYfEqlwXaCq7VegulBemu5I3GbVHMSx+0HU7v3Yfjn86haZNVdQdmbtb5yL9QXBG
	18MZG0Zjly/lAjoIj8Y8q2Fr37KTASV5Us2+ftMvbw7Czn/NFlm4Vmcaw2VFQQMw+KbfyQmg6BH
	z+/eqr9i/bDsxdkp6WQRLdpeX
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id d75a77b69052e-48e0183cb3bmr54064731cf.51.1746375224157;
        Sun, 04 May 2025 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH71qwpN6e0AWx4hQF0CPbGvBpbvyols0nzZVR9KjxAriV0LNGtW7IHLvJUL4f75onAKh328Q==
X-Received: by 2002:ac8:5a8b:0:b0:476:add4:d2b7 with SMTP id d75a77b69052e-48e0183cb3bmr54064441cf.51.1746375223770;
        Sun, 04 May 2025 09:13:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Sun,  4 May 2025 19:13:25 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Bn2gwRADKxD-YlCajZ-AyMPMm9BB6wMQ
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68179239 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: Bn2gwRADKxD-YlCajZ-AyMPMm9BB6wMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX0G9ZkdJdyaHi
 00FpKZcMcc1jR6bL2hr7TnMLNQ7MBrGxokrgESmKwWUqHzhMAp/w/qDRg16YT5pf1g2JOXeMdAT
 wCPiAXpomYBKS1ZM2sY1qyED/Tz0yv0A2+LGzeIbC4JTFSzZkG5MVG19pFLgSJnATe6p2HsxNPf
 U51RNQI1v9q/OPzjND27X/RPgJFcN+UB45/1MI0dUzyG9f7e5Z9KYyW9dW17j3glMfCbypR0C6K
 GKc01K9RrVjPOcml8RLNjNC/d9sqsUyClb/TpmfIL5K1Sc/DZrhCGH7lukem8b5NkIsCvoce9AS
 YeomYB8p5m5+WYfM27E9wnlifP7/T2k67PqxMORl+moSsDq4yrdHfQ7454s9hvQ49OgCbb5hPlc
 4Qmav0Qv/XWAH/ZvtB7yMgKsWzg9jjWCQSvi4XtbblfQHtuuf8/ZOTiNLvhdtZsQfTH3M5ZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=873 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

