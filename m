Return-Path: <linux-arm-msm+bounces-69450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49916B28EC0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 17:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B94093B7FE7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 15:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE182F0C53;
	Sat, 16 Aug 2025 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o49DVN3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B82EA497
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755356828; cv=none; b=pV3UxttyqMxaZqkuvl5MaWC/HQOrTuoYRb4pkj/FZntSaS9Lvbnu5y0n9Tp2SPTPelVLPszPcNq93D6T32DdR2s361LnDOBsWi305Ap/4BJpsm73DnF8wrbRmvPAh0foP8JWwZ5xSC8X84TEqqUm3hXX3UTGoBy/fO8HqSODNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755356828; c=relaxed/simple;
	bh=3Ky2iU5L6Io9C+pCEp2jHJ3xZ0K8dqhYtHBlF2ADnh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7/HpWJhNc4WvCb247+9dAPBkj0bvLcXyGQD3zKNkkP9gvdFlWG8IBYfKvZH1NxMFZtdLNYvNaX1OWBoQ2kG8/D4LE/CQmOC6WXYQc14TAacaJT+hEx22CRbYDbGpXMpsspRNcUJQoIcM4jFgPmP6X0jqrjLRRV0Aj2O+RV8aHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o49DVN3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4erv9008852
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPARjqGQEXADRJTy3T66+FgY1XO3Wy0tKELjyBfIFxI=; b=o49DVN3h2y+E8+/N
	RF33OV/8hsHg35oiB2mjstGodiwKhSw4TRfBa4lmMm730v8rWtX7CoQ0RPe3rePc
	9L1u7ZYgIzjkIqf5VSVi5vGCwj6YduVSKFa9xeCJ9d3dUbxvdyLNm2exOc6WTS0w
	RCIJ21ez2tyHsl8yBKItvo/pUUDUfG0I14m0wW28CBkLF+38qUR+VPrjN4FJTx+3
	4AkJy/1ewV9KUwzAlJDdxSwyvyg5w/HW47fTmcj+gdEXowBIXAxOpBZVK8ETYFJ5
	UuDI9bbqxbZirKzScLVk3lsw8DUzfhUt0vieLJwPIf3TD0SMzs7YDLflDJKmpW7W
	4dYapw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rsgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 15:07:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a94f3bbdbso59058136d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755356825; x=1755961625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPARjqGQEXADRJTy3T66+FgY1XO3Wy0tKELjyBfIFxI=;
        b=XXaoJYXX5NgHdXSdyyr0+qULaqQtz1KK9jRlWLv0G/5bhZDx+HPrkQhvjm5MPDLFf6
         fi1yojIB+ePph6BhGIVfr16vkN4EKpFVmwktLcebWjFbMNwdyhndHD7Ds/vzgPBcVF4S
         3DbHSHO2gkaS4GUIzTnHluUn2yomoV3D3vALp0noAJrRE7TdVbxo/yC701ogFAEB8rLo
         reDryqb/pRd5TWscC3Tj03oIYA90RnNMNnrp1SvrKlMEK4QzmC+G+fbYSlur2kYqLfjQ
         nXBPF7sAsLJ4pTaSGuD0hX3Cara9I4XOr2ZKsbr+6lHS5zQU/NX59jU55xZH/dRl6VPL
         kzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8B1WRquo4DLeCeuBvmP+4ho855jz7jK7suOtPuJWOgTWkpkbkqFgRj+4xCx39yi4eUWOVteQsy0r/f/e@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyKFB0yh25ulgnm1vqSlrKQ5jr8biv2TtnXRhSxxdcHUX3jOQ
	gYpFlyp1CEiqbiMFB8ByCZtuQwBAuG2W0h42OCjx7GcQjCTphiFJ1pl4kjW6I6P8XLTg1eQMdyp
	VrLpDlIdG4mlkjaJrEML2t+GqHXfd1yNGazHQJOCPfsStRe0tduon77EffnkcLOEr+nmW
X-Gm-Gg: ASbGncvBMoeJqgNB35fMEi4QZHV5U1xrEdFzfJ6CT4XteaMYuaAwDUlQgTCZwcDUVwj
	zBZvCOu7dfs/dYgpifDKG8Zn+TFtnXdPGyHFITCnqFTPJfT3i0pi/SGP/d9GBG+KzKtD+RxU7aT
	We3fjoIMlwO64sqt5M7o8YLL+Eh6vojdLg7GJ6Z3ZsbyNMKwmhv5tI8QtYoOD/9WQQcGAlvKnxZ
	hyzKv3z/sgFiZOPHxXwHavKSS242t6M6VE5WxGhG79wJHDAXsUQJ0xW5H1RXfWcSmh+vn7IDUCw
	9+9pYzlBaeW904KAzjtcfjJjW3CVhFtvrj+3QpKYOc0GbNQ9tJIRSii+u1Od/xoKPuSq5QFyPVI
	KtGwk+oL68Ysgc4r8lWYB+Z3vdq+9U5yk8/4FY2/jes8466V2Aey8
X-Received: by 2002:a05:6214:5286:b0:709:b6a7:6226 with SMTP id 6a1803df08f44-70bb061f4acmr41921116d6.34.1755356824539;
        Sat, 16 Aug 2025 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGteGpeN0SYzXGMbCcsQLJ69y3P3FVG661/6VvE2NCO2IH44COnPW6Js0Ei0+mI85s4HgD/Ww==
X-Received: by 2002:a05:6214:5286:b0:709:b6a7:6226 with SMTP id 6a1803df08f44-70bb061f4acmr41920436d6.34.1755356824080;
        Sat, 16 Aug 2025 08:07:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a604194sm10403571fa.50.2025.08.16.08.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 08:07:03 -0700 (PDT)
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
Date: Sat, 16 Aug 2025 18:07:01 +0300
Message-ID: <175535681533.1839975.1951145166123046642.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
References: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfXy6NRfWL7w9lC
 c6aXZCxjpVxvdI6YM+vn+DP3cz4deW27Xm8WvNEcZOYE1dasPqKgyMzoKSq/OKmCaEsKB5110CQ
 3uDx50symW9IsC4ft2SsC/x2Fz55vLG5pESV/Y+BjAGFfATkYwi4Qm0MVBOETy0mSZP+NNOXoYY
 QZPP2vygFcAoczKrtKhmnQYDOdNJcpITraVwmSl6zt1/2zjxUcYK+hEgRruhW1qjCLtVSednK4H
 9FARKSyYoYRldLnL4xvHItq+oimcp0ZOF7UbXoWoSVZwxkMSVVrdSg3KFqd5j1O0dXLxjatStbs
 dF9+f4yeLnTCYSkMY50cEImDlo3wRPvi+nwdsaV21VnaxGvr5rRoYmNDqMHU4C29vrCUDA1qlQF
 ER3DPFCR
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a09e99 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=3LZpj7SCskOl_Lh2xeoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: wsIu3adIErh0gmXxyTJuDGXhbdLotYYe
X-Proofpoint-ORIG-GUID: wsIu3adIErh0gmXxyTJuDGXhbdLotYYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033

On Sat, 02 Aug 2025 13:40:35 +0300, Dmitry Baryshkov wrote:
> Detecting the monitor for DisplayPort targets is more complicated than
> just reading the HPD pin level: it requires reading the DPCD in order to
> check what kind of device is attached to the port and whether there is
> an actual display attached.
> 
> In order to let DRM framework handle such configurations, disable
> DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
> driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
> it is valid for the bridge to report HPD events.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
      commit: cb640b2ca54617f4a9d4d6efd5ff2afd6be11f19

Best regards,
-- 
With best wishes
Dmitry


