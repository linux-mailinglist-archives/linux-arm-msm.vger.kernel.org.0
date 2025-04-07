Return-Path: <linux-arm-msm+bounces-53373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E43A7DE89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD65188A68F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A6523A9B6;
	Mon,  7 Apr 2025 13:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g6DAHguz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB423231A5F
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031350; cv=none; b=cgtMDJkfD9oZcvOWfEhz74YVx4rYwzfkGmoc8msv/QC5AqiK2dNM8bWIpb5ce0ZW/6C9tjpdxyg9jBzA+FKCulNMaV9KhGqsHOv7KFxVUF7/7hw5LWQOU7Si1W9h6KyHuY62hljNMTYqasuJ1Vc1pbYoWQFeHzBetqw7zlLox98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031350; c=relaxed/simple;
	bh=xXCuFVww/NlUudV8SgwoqY3CZ2vPEw38inrW5lB3lLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DgB9vbyqTm9HYNAfU42Jp96JahbZU1EfrXHFtsAsxK+YTceVlMLdQ85ZRaJbMrO3APZklcZbYQZ5gIBMXvuryDz+L4kiLOpa83UdzUNU0yFl/oa9Ihld4QSISQLjpDWEl+BNZ+bpmLIn/4UbV8QttTJSXvH+seE5Fa0OKNVoYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g6DAHguz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doAx017440
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Apr 2025 13:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAFJIGd25SE14xpwa+KhUSRa80h97UsYN+TeQKpPB9k=; b=g6DAHguz4Gq0/Frx
	Mz1CwKecDhKrpZn6+rg4Xq9oRH/S3CdY2l1ELTu0/ex2PkqC5IVXTsPYh6klLHKi
	YRv0W1ToJBAz5/8kpaS6Rm+ifSI3Wam8NA+Lmk3bxNoAfgKpXmu62++ZFJLXghTV
	K4Dp3tCgQrD5ImfBLRQ95hV2s9KuRbHu6K0VaJ2ZYv3nXRfrutNn99fZ+V4L0z+P
	B2BpE8Dq3X1a5OvaiDlllrN6/8zaXXJguUOEYkficfhZ7SzVfCYyMCGcLk59+ZPa
	i3jpvWBoQa8k/h2x+53IsY8jj9U0GK++z/pfqIRA1UVmnS8ZzzyJnn00Uv7UbW44
	GyOBDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3c8p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 13:09:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so449888285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 06:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031347; x=1744636147;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAFJIGd25SE14xpwa+KhUSRa80h97UsYN+TeQKpPB9k=;
        b=LD1QF5d7ZE3d5b+ZqRT48xVU1DPo+h0fFK2ruMxxFY5l58rauvPgbX9dQUBnqcSU/x
         mryPBngVUercanPIrWj59zppk4QiMcYFU3klzOs0KU7seqAZO2+XfP9DEtPlSVZQa5Ik
         soO0o3VNl5MpTgz/BhH0saIowmUvbVR+iK7lkk3+8FIJsxAbgNLngJsIGohUoEWPiL5I
         gZ2hrrNiv3spqdqbCyi5q/jQvCL51g40ZmuPr8wQde/cdzSHj/6nmqHpnHnjeyGbJK+C
         VYlU2Cm20PZqVKJgUziNF69sThewczTAGO2zibIXROCAGIoDAKewxWQ+VPq9o45HmJub
         ZJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCWRu9ZY4CeAR3ZBFnR4lMc6hcF/eWQOCbaNa0NDwymPXpatDxvtdOT5bnZW6Qmw1ttNFCc8okXEmbiXhVhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzos8+GvMeFBwBd6vtmooEh+C0qOXluXLpMx59bFCgKnfYR8CkH
	v2AtLof+haZGBkUDmydWkKnotwkQs8DGmWWgkEaIdiodOwY0st1QH/0m/4xP99zyF784usyvGna
	mNVQtNFAk5r6w1JUAMs7wVYh9JS8q77ck6YyjeCKosGhSa/QEkCq+9AOzznYwhF7L
X-Gm-Gg: ASbGncs/2LbSa0b0OLMpe35NcUHghI6w0hTZGQTpI/2ASQ9cAfa5lzmIEoPnQYUYdmZ
	KOb0EI1L0zCHE/x7tSuIRg1m29MlBFIewQe0EVa56WoIUDkclP/ctNT6U2mKX/t15yqLrL/Li9u
	5a07VefC4yA4w9Wa7nasPQC1dVwyMDz8hfoG2SBlXSyD/sslyNQxwj4OGLow69y65C+Gxmw+dnr
	seyUU0p162/YPJAbAKz+pabycVscMw24YTTjXB5EcZAPARQr4nkuosTWE+frm+fLtEoHyZ2YhRn
	Qwkwaj2RKyt9GuhM5gFb//BUKvtvFzrhplW12Zf+wv9DUcAxkbRcl0KILh9GDLiGRDFSfuGihI9
	t+JY=
X-Received: by 2002:a05:620a:24ce:b0:7c5:e226:9da2 with SMTP id af79cd13be357-7c775ae9e54mr1621402785a.47.1744031346755;
        Mon, 07 Apr 2025 06:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe7KohhBIGgD1fDaoNscLqxmlrmjcjcccMAiZ1cn7+YLrzEZrX0CHRA3Rk601QkVQkjPsAvA==
X-Received: by 2002:a05:620a:24ce:b0:7c5:e226:9da2 with SMTP id af79cd13be357-7c775ae9e54mr1621397985a.47.1744031346391;
        Mon, 07 Apr 2025 06:09:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e67141csm1293819e87.224.2025.04.07.06.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:09:05 -0700 (PDT)
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 0/4] drm/bridge: reuse DRM HDMI Audio
 helpers for DisplayPort bridges
Message-Id: <174403134393.3385678.13559826981567818455.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 16:09:03 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: VVi6UdQw_dAlxSK18mFMwGwQkwbXw-ot
X-Proofpoint-ORIG-GUID: VVi6UdQw_dAlxSK18mFMwGwQkwbXw-ot
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3ce73 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=5uxiH3rk7msUY6mfsOcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=996 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070092

On Fri, 14 Mar 2025 11:36:47 +0200, Dmitry Baryshkov wrote:
> A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> support. Present DRM HDMI Audio support has been written with the HDMI
> and in particular DRM HDMI Connector framework support, however those
> audio helpers can be easily reused for DisplayPort drivers too.
> 
> Patches by Hermes Wu that targeted implementing HDMI Audio support in
> the iTE IT6506 driver pointed out the necessity of allowing one to use
> generic audio helpers for DisplayPort drivers, as otherwise each driver
> has to manually (and correctly) implement the get_eld() and plugged_cb
> support.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      commit: 5d04b41889596adab613b0e2f27f76f6414cda66
[2/4] drm/bridge: add function interface for DisplayPort audio implementation
      commit: d87ecc232706ace682a900a45018d843f148da56
[3/4] drm/bridge-connector: hook DisplayPort audio support
      commit: 231adeda9f674ece664b09b75b68a4c023180fb4

Best regards,
-- 
With best wishes
Dmitry



