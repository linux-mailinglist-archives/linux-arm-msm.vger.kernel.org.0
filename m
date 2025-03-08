Return-Path: <linux-arm-msm+bounces-50716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63863A57C88
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 18:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9143D16CA87
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756A41E521E;
	Sat,  8 Mar 2025 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bp8AdKXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227211A8403
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741456221; cv=none; b=Zu0i9QLnaMmoztuvZMwHuq3JRg8YJH3fsn3QRFFDKew1k8eg1WA2YVWzVCrLOEf8yj2/Pc2QTnfsRIL3cuOaMEHDymRM1/Wf3bv57tZsEuwGX5yBf00bI7am2LwK3LsAvZCYMLyS38N1JFUtKDJGZ9Dnfw+iR3nYe45/ZjD1b1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741456221; c=relaxed/simple;
	bh=dQIUYzi4H3jR6gxsOng3CxQaSFYuj4bsVwlonUiWoN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpsHoYBRZtqdCIpxOepsDiokEr3BpImGdwLRd5+oaOZcttKdFght7ZsjqMrycsshjSH55tSZjLUnIXFnf9yuUajITh0GmRXxXt0YFN6Q6/SJ8UeUXRLPIaTApk6R4NCFBLryKof8Rj0Gve8AWmiSueTGTbJfSSRI8BTnw/5Ccd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bp8AdKXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528De1ev024731
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zj9BnuPodZObJbGZ4wO29xgzIU45v7SD9LP2K3bAeJc=; b=bp8AdKXKCQU0aZ+z
	PXGOaa0Y9Js0wMBIgch4E82UVeQPjB/LSmoIQwEVkoHq0QFZc4sq2BVX1BMXvR3O
	Ol2/jPgN8zedvuw5Mfa9En87qOZL4kWW+tMY//qZJx3/VjJzerFTUQPElWzCEpBa
	sICvlOE2rvqDzp6RF7C8snMchafCHDzkteSsYHE+BqZzROI8VUTjoKnxOAE3HENz
	XpYV4pU6ajPwS94hWnfb7JZvVo8uCCjAc1pmvogjSmcmSUxy1aYAXiYlKCyGMi+T
	BZq7mZLqLSTIU4xiTHjuMVmul2fS+V0sp1rqtGqfESolodSaHhzebSvd4mDdz19g
	U1Dbag==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rx0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 17:50:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e4546f8c47so7974246d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 09:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741456218; x=1742061018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zj9BnuPodZObJbGZ4wO29xgzIU45v7SD9LP2K3bAeJc=;
        b=h8rJQHM2SOqXZfE1X7js92xbO8lJ4fHZbxVE/4saXLEtSbd/2UbYGtcrp4v22trdlc
         7SLu39NNWYxY89UgGCAt48qVvCWhAW9nRJWA8DQe1gqytWYV9n+zShtmKzT5dapwvSL4
         ESljSNVV3IiQ4Se+TaYIJPzl9P0u6OCMxGgl/F2VdNoPGMHR6WhzWaehtj7wJP6hSNse
         KSFzyz5VhvLe61gVBc5uf/47tJHN8B9O+oG4SRqctf9PVqht0LdAM0BPrfpQzHVQzKfM
         jcImNldH2rwbFjQd7sDF5gswdAeZwdiJ7f+R2RkXvBmzNdOgzijqn9zOebWjx/YcuY3V
         qU1A==
X-Gm-Message-State: AOJu0Yw9m//B7G7w/GJkXuXuoibuX8a9bpd4pxAjlLkqd0SQ4KilkH/e
	5iJT5FuxeJBdWjzsFXUXLP+wZGad4gvathppv4duRo6sjnK4wgqZZZ7Wi6g8zqVfBtgXyt12qu+
	RS900YmJIUiKV1Av5//PWW4ClNNoQpsYNrHd+/avhR2VNUyZyej9oRs6KClNOEfq4
X-Gm-Gg: ASbGncuGNw4x3j8hpOsy8bwGFFasXBSfTrXTO8C5SXP5fI0DI7PNqOwem7nK0lMBYLg
	31jgYPslI9S06u+7tZ6LQh8Y1dhqWitEPbuwotU4Fml2VyoHu/HVAA++gBCQJjf9GH0T86i8kIF
	rUw+2jsIVtCRz/V3akb+iEiKCmuhltFlwmGS+tDYMZHA9DOr/4/f152ulna6AWIvdv+gB5vm1od
	ieiZOXA7BCFlFdrDW8wZWQo87PTeNytzLvZdHH/mayq2OecJ4l+udHhd1fvemhzGCxPdbX3zY2Q
	8lrWOnAyPyKM3/3SUULPZunFx6YWQKjKlmeSJHNxxBPLsvXHpal30evDQR14YedvSjdMDg==
X-Received: by 2002:a05:6214:d88:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6e908ca70f5mr20078166d6.3.1741456217892;
        Sat, 08 Mar 2025 09:50:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkXMzgQacIMxKsPPQ0qqQUPmgYGnLd1EMdHSa1p+AZWWj27YmK4io2DsVwwuxR16lQY4gJ9w==
X-Received: by 2002:a05:6214:d88:b0:6e8:fa58:85fc with SMTP id 6a1803df08f44-6e908ca70f5mr20078086d6.3.1741456217568;
        Sat, 08 Mar 2025 09:50:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988b64asm462789466b.155.2025.03.08.09.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 09:50:17 -0800 (PST)
Message-ID: <d2db3fc1-3889-4718-a905-9dba892be251@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 18:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc835b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=f9hqsFba6A7s5isENxwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NAedKml6Hke3oOtg6v2xlxDUt9a4thEo
X-Proofpoint-ORIG-GUID: NAedKml6Hke3oOtg6v2xlxDUt9a4thEo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=661 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080137

On 27.02.2025 3:25 AM, Dmitry Baryshkov wrote:
> Instead of using .parent_names, use .parent_data, which binds parent
> clocks by using relative names specified in DT in addition to using global
> system clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

