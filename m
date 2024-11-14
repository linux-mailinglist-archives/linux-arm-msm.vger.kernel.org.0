Return-Path: <linux-arm-msm+bounces-37914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD86E9C8BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 14:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E034B24A98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0A43FC7;
	Thu, 14 Nov 2024 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZhoFN8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBF8F9C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591147; cv=none; b=gMDW+FKO2h4dGvA+PWOBdR9jkBVaTYfTQyhR9lrrDDMwu7Nn31wVQJ8WgKmA2XAkXiF/tBz4sX75d9UeIrXOsBwBRroQsksnruZMrdWWS7R3CFaD4bWQAUsDJGJ+KVV/RPhnITK90WLZItVNhSFx6aL4uhZF1Ifo7fjsNLvoPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591147; c=relaxed/simple;
	bh=PZjIOtasjxvauZS0XePaLeb4uiWfPjPA1xKuE6TEp6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4qzQyYDvRy3QTgvCclQCog7Kb47ygUqv1uSwK0h1BtdweYyKpfeA99uwCPUl80y2/NDeHTp+1zK9f3YGOl9qezt9QaRlsbOjV5jkPbrJYgYuqzAXuRW1Zflt1WJcCAg+20Mrwr7h6G4ILNig/havlBtWgCYTRCFjI5zlN6lfr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZhoFN8X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE6LMgw001108
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=; b=FZhoFN8XHTnQqamd
	/nxIrUWsU75YE7NaNRGWURwc6SNDOr5O+9kglMUYMyC4G2JfngQE+6DSXgnneyQx
	ToQABXWo1khb5dnCT4ZMNOt4pK9t0NYqqzpZDRN7s31+vGRu/Nh55lSv29qWZbyA
	m+DaHkvTGiVGsfquypdYE7OOQRSMJweOXjaeYqIgBxMILGAiIkoO90X3goz/I3BK
	2WaEnki10k9bbEi7uF4+OFjRYp0AEoM1+SliwDUDeGPHxY+0npHMRTk/rz/WxvMM
	RJ83NoV9htJbOyz86YgWTkgz0GoYHs0/bU9dPb5A2acbEgZgHalEnH0gqRmuB8/d
	LRUO+g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vqbm5j4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:32:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d3f39d3dcbso1035476d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 05:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591144; x=1732195944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69aZun0GtiasFSLAFi5iK5p51tzghc9vHnuyXGjV69o=;
        b=riDe1EIh0HzGRrP3a+1EzQW3gJAFoOyShw0/rppiyB3a8qNUL9f4nn9X91sqTs2wcf
         MewoWeTs/9fc1P7nFggsV3Iwd3H1XabU6WXP8/6hRRI9uraSlQrn/phObPeZ3HQzLynX
         mKep4/wsL58Yti5iuvAdlGz//7qGBre+8O5kQ3NsYSHqQPd/o0Z2hheFsuFLENXECee3
         vzgtMZxbGMxOydjYn7JS3F5jcz4ychYfaTi98DuLByPV6npVMJxRdlQ8mrBgK2P78uJD
         kXUjseUWoQQcr2UR/Vnww0AD3VCCm9oyO4JfOYVI7qoc3qNhGpTNU31CNoI71c51c9MS
         JzOg==
X-Gm-Message-State: AOJu0YxCuGV0iKVPz4/sM6176p9sLN65AGH3Wg9/nmyxAH94NEfoRHSy
	ZRsqJi/KnFSVS5PredXgbfbVWie4aLVw50nHJnytXZFr32oUa4Cc/prSL1QGHyHy2Jt1NFlloBo
	zZBK6mj4tgVb6dkbR/hrW5uxybMaASkJIpQvDKskwUWGp7QM/P27MqXN0h4AdBETB
X-Gm-Gg: ASbGncsxobVVhr5cJZxCGcu3/SWfHhqLyDq1NaAWCH6DKIzWwmb+aYpLahZ3X3Ed2ty
	yGzGCATNWiBRjjyVkWSPAVDfzxxC8opEYIO+i2fmjRLLKJV8yKjTDvpLSZ47rvunhJHo36wjHB5
	bBC1LomPDYZ0XWS9x2/L6mP+vsPAYjobWjEXqjXiKNj/lAvi4Vw+vXQ9Eywbc0yNEcFx23SDdMC
	YbLzFeeE+G9ZSC50PmzE36LrOD1fDbLkauUpNRRXVnR+hmE67Z0doTVETI/ggkBMZwGWVMWH1pm
	+tSZFvJ7lga7SgoN9ccLY3mem2Njt3U=
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b331e4ee53mr1277583585a.12.1731591143580;
        Thu, 14 Nov 2024 05:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnnkk58laYKQusb97iyKgh+0oqbjf7UMfJRyrL+TYbBL3HaTdZUyxFrlTIeOPllvNOALq0Jg==
X-Received: by 2002:a05:620a:4415:b0:7a9:c0f2:75fc with SMTP id af79cd13be357-7b331e4ee53mr1277581185a.12.1731591143140;
        Thu, 14 Nov 2024 05:32:23 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e080a90sm63884566b.174.2024.11.14.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:32:22 -0800 (PST)
Message-ID: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 14:32:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3WvRBzDDD1JcmdHMoIMGSj6sbB6kuq5x
X-Proofpoint-GUID: 3WvRBzDDD1JcmdHMoIMGSj6sbB6kuq5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140106

On 13.11.2024 12:51 PM, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add support for DSI 2.3.1 (block used on QCS615).
> Add phy configuration for QCS615
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>  5 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>  	},
>  };
>  
> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> +	{ .supply = "vdda", .init_load_uA = 21800 },
> +};

I believe refgen is also present here and you can reuse dsi_v2_4_regulators

Konrad

