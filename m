Return-Path: <linux-arm-msm+bounces-47924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24AA34B21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:01:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B20113BD749
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78C1547F5;
	Thu, 13 Feb 2025 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmR6xa6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3228A2D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739465252; cv=none; b=Bv59x4Vfmtv/GAa6qW5zf8OcFAZWGoOE0Tnoy820Dbg02PrHLzPYn76U912Nydt5oaNT/g/hoDleZS1FkSJBnq3Jn89KNDZ+AyPPFNVsArRG+tYtzV+ZQx2sdVPuxWzcDjYA/E3e1gRTd/T52uYERvdSiEqx1AYSzQpvtux5f5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739465252; c=relaxed/simple;
	bh=AMKzVi/B0d2Jn9OIPZ2LweH4Dmo3yJ/iCGhV8aOlMPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fU1AgQ1AW8FNSGxfhWz6dmc6YJM9plxAeJs0GYUM4LdyOVigoHlgBztQIdn2HYMkIXpNfVL2gp8qI+oALYXiebKI/uzQTmEERPqiRrcqOYvbm9F/tW42Lpv5AlEEAaEGmkniALRv+3yjGlgTli1zr+oOUI6CfbPwrhKUlIDxzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmR6xa6R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DBWPgr011927
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdPqwdhySUYtLxO6ZXkv3AyokTUz8gph0Rz4I17smjk=; b=PmR6xa6RZSIyGQYa
	1ohpI/2W5xKQVxwfYPJ0awefbsNAr4lfM/CAAqFZteBUfN/Hk7lWv7DgZJ67Q5J4
	c0rzp3k/0BDNkKkZbheK4pWx9AWAuimPWGQ2kl3MU6uY8pepcnELWRO2Utp+QssC
	3iJvGz1SVsAiFYPQZc2cFWZyG0Q1mQkeZU/+yhfEmsa/yNWF/2RnPo/YP4MLkElr
	mb9Wc4i+X9gNSB1zhyDWEAYcEG6eYMdgP87W9Jo+OJ0ZKkeAu5n8kB0Qxk0geN4c
	FBJ3kU3ek6CgDpgJv2DrnjUB3TCBNFMwvjiD6YLH3shOCg9/8l1ZfdjNV+Onap//
	GLxRbA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sfxw8sjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:47:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e45cd4145bso2867116d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739465247; x=1740070047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdPqwdhySUYtLxO6ZXkv3AyokTUz8gph0Rz4I17smjk=;
        b=j3cUzcj6Boy/WFmVVkP/W84yUr9H3Gp9zJVjxNx0WbeOkay9zLrK9HV3ApLBVS/oFB
         5zTlcMIU5VRtNGrPDmWraa23Y/gLfyQI8u22SaGieb2QljeumVgFQZFIADNG9i4vgFJU
         YYm6voo5l9dT47o0MVp0J/NnZb+TVsiZr5aEZndwngIeF1B4XetrrIs9J8QoQp980zKM
         Y8siUIM2KWB0+4ayre1/FNXHrXzs0GHrvQtbAJE8ivtz4f7M1brTrmkKyAZDJMjrAHp0
         L95+xCpEBRT74DDDzuwvSwoITHUqkHGKE3zJuh4ijcVQsLLx2C94N4SBIh08oDcJ1SPe
         a0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVY1r0U4Z2fMSnO6moONJG+PCMdwwtZrQbAvvo2RdOraCp/5RGHigxZ1s1aeNZDJ1Rz5IerKBUlTbn5GU3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwOl1Ik1XbI18rETJ7WHo1aa+e5l2NyOKRslbEKfydvcuPty2mJ
	smzaWJWqurCoFWaS2Y6RZokc74H6jbTaaQQej0KiovkgYfawTPodRnTCX1wdW5e1MDztjQqaczg
	I+Cct2WCN0ZBWdJ0ebFlCLP0hih1QW7mhy4Ehj8cRIDs32GKgLLhjfTqbaC8Gv5hg
X-Gm-Gg: ASbGncuJL/DkSJQO5Gj7ooLPW3Rw64mRD4stk62lmMmKoubOBFoqxVgm1OZ3xSHYt1b
	xYJhdOktHNPiVu9JqnAYkMGdxr6O1CvTHkVxGh57DH0Dt0YOXRZwhY/nnR9tpY7JK55LDtpTfD6
	ycrTvmko3+buZ/bhQxpgA5IMjlIDSg/ItCK8OfFb0gIlc9xmqkD1huymoMylS35FhGblsoX59ZD
	Cbbj1taBrtmpg9nZS6xixFsULsNlnQhRkLydfW+HOh5Uin1B4P/k4ZhGKAJCCiudOnjX5EDeY2S
	DZUuGoAOeTn2WC+RDrkh37FKDl/JWv6v3BmUzyz5oRfER0e8Ft8qKuKvAbM=
X-Received: by 2002:a05:6214:1d0e:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e46ed93ca3mr48905716d6.2.1739465247514;
        Thu, 13 Feb 2025 08:47:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEetTXePMyTND5uVB//0Cph5yyIkXDH1QnV5NVQnh4WczSnYALFJyWUjGFeD039hxpYavxng==
X-Received: by 2002:a05:6214:1d0e:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e46ed93ca3mr48905226d6.2.1739465247027;
        Thu, 13 Feb 2025 08:47:27 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533bee4asm162967666b.170.2025.02.13.08.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:47:26 -0800 (PST)
Message-ID: <eb7ec79c-a9d1-4d8e-975e-30f12bf583e5@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Print GMU core firmware version at boot
To: Thomas Zimmermann <tzimmermann@suse.de>, Abel Vesa
 <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
 <20241219-topic-gmu_fw_ver-v1-2-d403a70052d8@oss.qualcomm.com>
 <Z64fUjIfFzs4R8Im@linaro.org> <b8004a16-6130-4232-91fd-85d62c2b84ec@suse.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b8004a16-6130-4232-91fd-85d62c2b84ec@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mdvqIlkvMC3xOd8fmYo6xjahUqiXNlo6
X-Proofpoint-GUID: mdvqIlkvMC3xOd8fmYo6xjahUqiXNlo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130120

On 13.02.2025 5:41 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.02.25 um 17:35 schrieb Abel Vesa:
>> On 24-12-19 23:36:56, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Log the version for informational purposes, such as for keeping track
>>> of possible GMU fw-related failures in crash / CI logs.
>>>
>>> Intentionally not implemented on the if (gmu->legacy) codepath, as
>>> these registers seem not to be used on there.
>>>
>>> Downstream additionally warns if the firmware version is too old for
>>> a given GPU, but we already pair the binary to a given GPU, so let's
>>> not go there at the moment.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---

[...]

>> So maybe DRM_INFO_ONCE instead ?
> 
> drm_dbg() seems appropriate. Most of the time, firmware versions are not interesting.

Unfortunately, in our case they are, given users source them from all
kinds of places..

Konrad

