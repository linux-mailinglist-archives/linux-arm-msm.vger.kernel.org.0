Return-Path: <linux-arm-msm+bounces-39988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F749E11B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D91FF283337
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 03:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9FE15C140;
	Tue,  3 Dec 2024 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mDoDrl9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B80E364AE;
	Tue,  3 Dec 2024 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733196510; cv=none; b=ck4QuJa+H/Wz/TpRYO6I5wWyRP/u2GclVYrjeu0y9ClSiV4K4I6GOC3zpa38IRmYHtOS4qfJkuwFGyn+C4/x0NOW72/9Hg1g3+3lZ/SZmCHWpkjN2ILZ0IlBdSfiI56IdWRxQuI5ycqJG+vl5nwlxxJ496ut+gU6OdvcjqX77qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733196510; c=relaxed/simple;
	bh=IslJyGVILTCVPP55SiuQqC7ZB0p+F0lKnNIxou42yZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CoTwZU83AMjzZMGobMbbgrKI3bKVsRGxkRMBDnQG4YQBCpWjordn44qxaOlEvzfzRjCNYYbJsTm1Lx5q9mf4hrBB/vC7etCPI9L9F7749X+x0x5EhdSTVTtfrsOGbpnGZUBl/behZZvpCCTSqA0TrfTSIj8CPTn7UF1taOr2/sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mDoDrl9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IadO4026954;
	Tue, 3 Dec 2024 03:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3do15TM/01v0tfnkTmNk9UdI0h4hTydTuWGplCcKAgs=; b=mDoDrl9MBvje1RWg
	5a1TiZAIECle3nhejpjrAfDd22WB4hChqRkC/JTYykb+mThyRPW6o5IB6kOhxqeK
	Chnln+qyFyN3/4bM2EdX2z300a9ow2PpzbJOLh9o4jwgr3u0lxolS3kXxA//41WI
	Xvz2cP/2ME6I+S0EuZP0ZCGxH+Pl6g7SX0jF84PMJtwpYCiKXNkiaX+cIO4iV8dB
	0AqGCScYo/T+n1jHd+JPoi3Hr0ETKgsNn/uAmUMeIaKpp51dwxqOiLQbd8RmBADk
	f1ZLbEnyUTXBkbKRwRZ5Ek6P0Q1h9j5bJLlSvYF8lDh4wHcnA5NDtCz/wSur5pxb
	XBloQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2xnnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 03:27:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B33RnsX022822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 03:27:49 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 19:27:48 -0800
Message-ID: <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
Date: Mon, 2 Dec 2024 19:27:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo
 Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Alex
 Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Xinhui Pan <Xinhui.Pan@amd.com>,
        Andrzej Hajda
	<andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert
 Foss <rfoss@kernel.org>,
        Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej
 Skrabec <jernej.skrabec@gmail.com>,
        Phong LE <ple@baylibre.com>, Inki Dae
	<inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park
	<kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
	<mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance
	<kernel-list@raspberrypi.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <amd-gfx@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <intel-xe@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HL-Emd7veaMtK8fWL2IAcFLfD8t_Evj_
X-Proofpoint-GUID: HL-Emd7veaMtK8fWL2IAcFLfD8t_Evj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=959
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030028



On 11/30/2024 3:55 PM, Dmitry Baryshkov wrote:
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
>   1 file changed, 2 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

