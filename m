Return-Path: <linux-arm-msm+bounces-47920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC0A34A88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38ABE1891595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D164028A2A7;
	Thu, 13 Feb 2025 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNg1ffw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D2728A2DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464590; cv=none; b=HXgnl4yKfwKJJvTUXuuL2W9OXI56y42aRUJplGJJoXJY3HzOpO5IFkkV7+9MnMfpzZKN7QyysOOPFzCqDsXil1CxmhGVV+J3HrhFlzgeb8bEb4towMWTc2tTQKL9jlQy48npK19j9MgemrBzUCwEsm0tDOUX1/+F8CpBKTWnEbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464590; c=relaxed/simple;
	bh=AQrazMltgXFOO4AhHLQxVg9E2MdXnYe8G96EurERGy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSmRrGbg2470wGcB/tNg9HOHvqCH39WFCaGAlIPz197QxuUudUfxBSu+3yAP13n6ccs4RJXoNpFAkQqWELXCQ6DDfcJ7Itq0KtlICmeSQHTgYwNhpMsGa9j4az1oGWlTYyctmr3D40nvKtOiVySSTo03nzEADR9VTqZU0Mxw+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNg1ffw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA6wwD031727
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=; b=JNg1ffw54vq6vn0N
	HjZdNMLtyascFWWDAvd3gRaNKL6yhM86wZdWNJMFZ4VyfZ1vTnz+U+xJoHIR5hri
	o2pgpR9RMJjggd+7MRVjOJjEh0d/uB8G8hdGSFtXp8WBOBnwnpQi6aN1kLbbDl9v
	manfatZU67QSLS/+Fs6iATNYhdOwxuwEyHJe85BeOjGh68DT9w+VZdt+nhLIpW57
	hhehWoXSbW5VzVcpMykCpR5IT4EK2rGw16kkEsfTpdxfb/Ern9bZ3iW//bQ6K2j+
	TwHglL3QsTigQrmqHvWYuDfsofyDVsolNFTp9H4L8AB0dbl8sn50XFqxmM83OPSd
	j/WOgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq00yq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:36:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e422f1ceadso3022606d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464587; x=1740069387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRC9JvP4VHXNyNMipFwDuEvtSP6Ksiyg5e611bESZ68=;
        b=GmGiVIisyMAby4oLDhu46yJXUHkzx8bIYTDg9nk0RiLPibXbMMZP3lEVl974KJmRlf
         FPenkQYk1UOXdc9AxeimC9NXQ7Yd4P6rUZYREofkcTjoKGWrrJJHudysMavQZ0rsRQq6
         QzDgCH8NE2mMPXFUNE2qxgw9glMDOYfQfKfDXkcjcgX2PiKmGpJ8Y8ZxQ3mDuhmayEsB
         9mE1SNK3lVREjmb+KCCYqnaL5y9QLVbsfk00j+TNtSyqYCKpL1JjJnkwEvgcUcOlhd3u
         M+Tdl7zRbEJA8tG3QaSwHxVGDQv/S4mDbYhUgMixGQmskFxVVrLGjIq/gn5uuHiHBpL2
         aQjQ==
X-Gm-Message-State: AOJu0Yy/4IdMhkyD4SfKO4t1lsgQX30CiuTfu32L9R2z/rWPrPISscIA
	8KIfRl6OGHK58ZiMLs/mT6c5MQecVUUUTwzGeP2K8v5xn2aldElBIsXnMc2lE+VJotwDsEwhQy7
	jdG3ofSFXB7Ln1AYBJm1/Cw3bnqscwntXjxOqqx6+iTy1gZEggyYsGiYdpHd2nq9y
X-Gm-Gg: ASbGncueiuHLTHDA1C9QJf1y/dh/nwLQe1p/aimEO13lcCxEjcGaCxX4XjtDBUFddMs
	alQiiHmJnSy2kQWtfKMWTt+FNzCaMUwjTitZNDRzT/ta6er1eyYSuQdY6WKEKxYin6hx8AAmwWO
	gXOrWryEwXKLGp0ZMrcCu8YQQL+/SFSMy7xywS9TrrcULvbEjI3xOxLXVaEcXGIf7YOnGxtU1Yn
	I356pVXii3sabvPo7FeWNxvayqxea84xypgCmRnuhn3drNbMpTb4vVmitxgMewoLHLIaGdbKANj
	XlXFR5lJEwQDbxhbx3cYfDwGhOj98yI7psUrl/ZLf2oJ24DD2CWSKLw2oYk=
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id d75a77b69052e-471afe57ae7mr39969231cf.9.1739464586942;
        Thu, 13 Feb 2025 08:36:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE65B4BdI80A2hYuehypNi18VnhTOKeJzxy4QZub8Qv8xnIyZZrKkYGRhBtPZp8LP3QGhc+eA==
X-Received: by 2002:a05:622a:1303:b0:467:5d34:aa84 with SMTP id d75a77b69052e-471afe57ae7mr39968921cf.9.1739464586479;
        Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d94asm161583966b.143.2025.02.13.08.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:36:26 -0800 (PST)
Message-ID: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:36:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vErun0CmgvUcO7jRMgS4nWNBpv_yzp6A
X-Proofpoint-ORIG-GUID: vErun0CmgvUcO7jRMgS4nWNBpv_yzp6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=833 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130119

On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Adreno 621 has a different memory map for GPUCC block. So update
> a6xx_gpu_state code to dump the correct set of gpucc registers.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

So GPU_CC is outside what we consider GPU register region upstream..

And I've heard voices (+Caleb) lately that we should get some clock register
dumping infrastructure..

So while I'm not against this patch fixing a bug, perhaps we can get rid of
dumping GPU_CC here in the near future

Konrad

