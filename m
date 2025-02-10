Return-Path: <linux-arm-msm+bounces-47450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5FA2F39D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 17:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588553A7012
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0118124BCEC;
	Mon, 10 Feb 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn0JoMwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C72D243962
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205146; cv=none; b=ruNDSrQEO4fjKpWURJDRsCg+b8d2Pj6Xr+lDR0TdgBQ+L9AAT98PDWTz6H0KDMAC9oWVVSCmsWyUmeF5Kt/o9k4cVcb3wyvxWeANCdD2v0D8YgJNgLSJolq0t2gVszw8jrYMDpMbeZbmZQU1s8WXdVpLJcQnYWrDeDQY/01o03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205146; c=relaxed/simple;
	bh=3JiJns+OUPcfmrUNS7GyiLy03TpqRQlFAZ/nTjInXaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbxaoCNwGtCYoTWRGSPlmixRRHxwSpg5ff1MhhSAHVPaogLNXjdr7xCOC7usBGhpAZW1ZaFM2ntp3zMVIPxJiEV3SGhBtwNmyxB8H9GRpQyoUoDPYRtGcxMJLDAUdTe21VQ3qNmyRGPHeJ/nDfwPL4v6ev+JpHIkIRky5tyGPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn0JoMwZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A8d4S4019724
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=; b=Cn0JoMwZEOyoPkef
	61kkoxfOO8ACryC6Dz0YVUUIuK/gbvwFhhTs6OuNOwazixlUJJCm+GW+Sgz4Bdev
	NI4OlSvfNmM0ilNyUagm/sBmSUnPrAb2ze7+t2hxVxFxsFLWp67rrppA5TtYa+aD
	5PwSa/SmbQLC67e45REnAoXtBBJnbXEXdLOMDqG2xYNI3I9pxn/ERV9iHyhF33yf
	qba+zQ/kZxr0L9AGSZw+SE8XImfJZ9wqxIHz0+dgB/B191xN9/fUGG/3dTC+9tVF
	zTjQcFrEL0y7wmafcq9tspH64NgPEzOok3vR9QuYI1kla+ullsQK0Hb1f3Ro0tYN
	uOaC9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxmy4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 16:32:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4718adef552so2349611cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205143; x=1739809943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=;
        b=eR6lE1cX/lTr8pqSlEWCaOUV6hdes48KQpKBGHu27XxCF/Sh4N47bRp8d+c1a4gSjY
         T4xx6gak1eufxOe1ShAdEfqPSj1XdGV/6JDROERn5YGsuHs+wZieCFhXO8zSNdOuYAEg
         j0OJAsZUCkv0hWH9244wAeAQlsIZ6v7ArZHXt43VDPIZ5Di+iWlcqeYRM6AGA5icxpv5
         TjtZMpMZYB1rHt7HcVhOw0yk/keXYIX/1dzaQJ3W9deP64S+U5RaDDs8seFw2EfkhxYw
         eWSO2g44wlw3gRoZspq3pbF0OOAOwyGR8YrBaw/iXVmf3ZB0JbMMzf1iff0FYOfcL9HS
         cXdQ==
X-Gm-Message-State: AOJu0YyK1Cr4Wce7DsipNMfl7I+/0NKWgi8p1O4WvqNQXA9jvk3OdABN
	c8iJ97kDkV70PwZj6Qk8v/eqjmBACbGIU+76CoivnFt1GOBlK4Y+3/KroJAe2eBOUZs1XohDoxJ
	h2GI+zdXCHKUaOIaNiOcT7kLZ9toOwjXOPlUwIiKyTrke6ThnOSNE3pn0ulscuDT/
X-Gm-Gg: ASbGncuQWSBSLOaO2kkubjwMkO1FglGysgJIfdNXHq+KNMml6Ar7T4/OHvDKHyKJ3HN
	jnHan5XqqNHxLaWbpZVAEYHA3pLJFxyu+O3C7GJcLZ0hyMM93tWaaKLRXcJYOvP1BlxEl8/ZxwB
	Er6p1ssFSbGarbsflp2WYogEu4YDk+vXzKPBvdKHFNdfJ78ZQFeapSvzB2YLmjq1+sxjsJNB+zb
	7BOT5/eMETTBo5TexeG4LugWToPh7oHL9YhykymNS6RB3DQNWs4DtoUs6yxYH5kk3JNx1FqNu7r
	Bcp5rGXvZ+BGDsbQU9uXhmXNdUdcQ8Gq54RWAXfyXu4leXu5aH2p/+yuXWc=
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr10935561cf.12.1739205143340;
        Mon, 10 Feb 2025 08:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5IbZNKFe36TXsRdBve9RfSnI6zfiiQRD265XZv9cUtcHZVy3F19fELt4eG6KVJYmaMFNtpQ==
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id d75a77b69052e-4719a289dbfmr10935441cf.12.1739205142905;
        Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa21sm8114981a12.68.2025.02.10.08.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Message-ID: <1ffe8c68-3668-413a-a289-51a0b6bbc8ca@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S6FRC-UMKDQ0VrQRuJmKgsgCrYuyX9YT
X-Proofpoint-ORIG-GUID: S6FRC-UMKDQ0VrQRuJmKgsgCrYuyX9YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100136

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

