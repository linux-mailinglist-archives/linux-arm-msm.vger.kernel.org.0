Return-Path: <linux-arm-msm+bounces-53665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1BA829D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA29C1BC6977
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7534C25EF89;
	Wed,  9 Apr 2025 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfpnjdFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2719D092
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211344; cv=none; b=ZQ2Y3ve3P12kCipIO1K6LYwKMKDATyIzxIC0zYTXwx6MMpc/ZT9j7CY7DcR0PssCVpfOci5u1+BL7DbSXx2Xie1GE97RQIH1tRAfraosYmS/E+0wf0+VZi9v6fF7DHqoSM5e8NXj7S3gyfSDvjymMQ/UDoI6NzaqRDzHQWHyFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211344; c=relaxed/simple;
	bh=zcGWZwy+nuORNV+F/ThZjfFW0lE2rDvhpV1x9HexZ5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzh6nci6wS0i/SIIJxBxQMzQOV4kfs05K2XirOqOdYwitkCNZvvWZcCGx1yjnB2oYiAXljdHfPi6A90zXswKiolHRro71YQQPM443bAFhFsn6gX7mVxYc8z9/Y0eHc9/7S3IY0mbJsuRbwh0RSX+RvkKsqOp6vfzEM4pxVBWzMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfpnjdFK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398ZsnK002292
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 15:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=; b=EfpnjdFKzGCqHJEN
	Ma/mOBmSYSbE/oWDxhUGfjgKLsaLrT7haeMHc6DuaLFAaUTf1Rgmfr4kGnwJMNZp
	iIQxKlLT0tzeg8Qton673zuoj8X8AsnHcbwsDyXDdQG68/zAkephLqY/V1Yur2g+
	y1TBsGfnEznmvp/YydzaD0uxRqkpIiG7OG+qX/SPY3rXuoWCFbzky0bfRQBW8pfJ
	AJH327Xmon8PrmBGBoK0rLCOKaa9NDumDOv2TLVL8ipaiJQsWiWfx34CwiAvAgE2
	BPCcRA2Cbq9Bc/G7a4L00twnwaVQ93L2sLu4SQ2I0XSxMO67tiUMtBMC6PyuSJET
	0MTMeg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1knw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 15:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso167536185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 08:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211340; x=1744816140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=;
        b=XGb3vWe1DThoYnfe6pWph/r3R6PjwjxX5l+uLIY6Y2WVnMk2QHAnsqmIytWNeN3uAJ
         49+VlT65TA21ElbNbnsghS6bmr3QfR+gHiiuPmkTXVbcW4wHpwLkwx8KeEgYTjJdDk25
         /0Rsbw3IyttwPNx2AVLyZlLwfMjXdswNkW94plVyy61yhVTI+quRoNrragUDWVxdqszB
         0vnS5Vy88OTVxfWqChk86+yC8RimEUD/zkxqWAozbjEpp4xH0BJ85WEhsyL4VyXVfrIx
         svg87sAIMp48byvVoq8QUlh/K73zmp2W2saLLA4d2puVfhl7cxHQ1IHYY3An6Gkjppu+
         5f2A==
X-Forwarded-Encrypted: i=1; AJvYcCUkxehM1UsIuNqCV0KtpIS7IMmbvgVMyeySsx8qhVLlbe2nZBMSsWwwAaZZ9CmU+LUsa7Y0mLI6VvDlbFFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTFG5+QdmptZt7K/pWjN/tIYawlhYKapX88sPlU4w4+Faiw0Z
	pTPeW4UgJR/woOdpucx6t0Mh1dqVqqC7AOnx8smrJ+62+eEf83IJHmccg0Gi58NqUF1ldOGTKWT
	kVJ9vQuQRMJvYMCjw+8sdDALU809xg9mS5CF3dMVqj6e9evANxre4aP1MDXPJwBZ+
X-Gm-Gg: ASbGncsu728ILwFWZWSJ2YqCIMB+oFbnuFxJQFJlhkTXC2vnFY0dMh7qB8+WBY4d9ym
	P5ABIg9ZlShEknEJehlnQ7uzTtAmBJmRN/slz7+g6gqxdU4uWV2gwc1jigzE1dP5CPnBVm4Jwsl
	Bsqj77pP2idRn6oTDI5d80jhKjhH7wyIdn1l8EE+GDdEHjtlIaXhp6ac+ucvykhTpUTm9kr/G1b
	RNkXJNRKK8L/e5CcKQbQ05LEToPz46ZnGITFZgRDiI/K8/AG9Uf/zHRugMYsNipH36AieFvKLtz
	mbolfDh2jZMCgDIyG/28Y+B3n/YxrYiqCTZ3da8SAAkcBkXUDrE8x6sSzpCXd4r6Cw==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id af79cd13be357-7c79cbd8ad2mr156917885a.4.1744211340648;
        Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKqxp7rcrINyn8M6wMLr3P4dzZIUo2PduztsqFYTGLMrH5xZk1qXZ1BhuOXgUr9MLv4mhnXA==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id af79cd13be357-7c79cbd8ad2mr156916885a.4.1744211340304;
        Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb425csm110988066b.104.2025.04.09.08.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:08:59 -0700 (PDT)
Message-ID: <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
To: Anthony Ruhier <aruhier@mailbox.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cNkei6AAF40agOpmlaJ_jKlWRu88kGpt
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f68d8d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=vjlbkFh1sCUApBijkyAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cNkei6AAF40agOpmlaJ_jKlWRu88kGpt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=885 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090095

On 3/18/25 2:12 PM, Anthony Ruhier wrote:
> Using this patch serie on 6.14-rc (tested over multiple RCs, up to rc7) on a
> Yoga Slim 7x (x1e80100), I often get a video output freeze a few seconds after
> my wayland compositor loads. I can still ssh into the laptop. I get these
> kernel errors in loop:
> 
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1: hangcheck detected gpu lockup rb 0!
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     completed fence: 777
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     submitted fence: 778
> 
> Rob Clark recommended to me to remove the higher GPU frequencies added by this
> patch (1.25Ghz and 1.175 Ghz). The lockups happen then less often, but are
> still present. It is easily reproducible.
> 
> A way to mitigate the problem is by constantly moving my cursor during a few
> seconds after my wayland session starts, then no freeze happens. Reverting this
> patch serie fixes the problem.

What firmware files are you using? ZAP surely comes from the Windows
package, but what about GMU and SQE? Linux-firmware?

Specifically, please provide the GMU version which is printed to dmesg
on first GPU open

Konrad

