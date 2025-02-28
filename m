Return-Path: <linux-arm-msm+bounces-49853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94489A49ACA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 14:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9C2172E8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 13:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5777F26B2D2;
	Fri, 28 Feb 2025 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MuawQ7rN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E459D1E4A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750195; cv=none; b=utamS73Z6X71MJXhZnJN6o0iNbP/arNwpUhk7m/BZPYyuUtlCFikDhdL72HtFETDIIWk3LDgXpdCtePfTWEPV4BqH3o39eDlEoEimzb0uK9MMbhC12s8FOJwv7nimhTrVKatYLn7ecSpc1HxxnSaKKC+t7uIzKFxZqFtSENeSa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750195; c=relaxed/simple;
	bh=+XyO8sFpM8E94WMAeS1cZhoVCsUgvUu22QZEQSyyoII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jh2/0+mKyyn41LzS4KS0dZf99qe58pNEi0i2VEsV9sHu7GJNqX5uS8NhDPp4FDUEcuBgIppDq8m60AC1w1I/ITm71dh+rQjv71bFZKxFAGsVwJBVBxHX91L35gYFERXnwsdtphNRlRivLwn8ucUnGszKM+FPpojR9Uwu2pGj5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MuawQ7rN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXGkr031882
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=; b=MuawQ7rN7uMY4trK
	9U0OV8+fLM7b3FJmBkcbWeksm90hjlaAt5uaKzIoNOW4ODG87JtUjOFXdrOrgQov
	jcFg0a0ag3EzpFSrFWw/XupXTOP+TG4u5eyKxcZkbCi/I28ej+sX2pt3cvHwOxc2
	Q9v1FGWvwapWWfx9d7I7tyPG+9dctZGWfoAziqDvsoYw+VWgqJMYfj0bYivCuDwk
	T5iivyqltIL8reAKTkomLwzNxoT1kLOXWed6X+CVGOXprgPcVusFRO6IxiTJjKYM
	RbexFxPM1yy7sLvR1J+OL6fQVpLbDzcypH93SDCJOmwqePLaNSzmoZFJyXUrEvAv
	j9M+HQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prksmec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 13:43:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e422f1ceadso4802216d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 05:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740750191; x=1741354991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUsBvFfhxrhyKEITeHg16SL90hIVl1i/tkcjRyAbRMk=;
        b=nWwufaIPBVWQI5hWjJnk/VxOO3eXewwxObVrXvHGvX+K7MSZ5jATL+pRHcrSM73ybT
         DBi2GS5HCsKBZdJZ4FW1EF8QrTRUzwZCPFNjvXAHPm03QLVQfNLEOiP8EDNrR4fCjLec
         yGNVQBGUwisfZ5LDTPVZWxJmWm/Vh0sEGwj1x35LawQtX+4r822Mm+t8YyTtTRXbCE05
         IPcTJxW7iKp40cbb5hrpDvz+2Z2/swvGURxTlmGunsoQ4O8icaxwXlQBAdXRqDsAySNG
         1WNydWdv3ok61TOmxbrFuxCGH3eSaTD8fS0v+YVsPrI68p9FI0Vhghj4QVewCmFP20DY
         7EpQ==
X-Gm-Message-State: AOJu0YxoFdpp7quKM1usea3yDe0XFU3wI5LQKPm/p1xuHVK9jC1xkuaf
	b8vp4rRFx5YjRTPXE4KgoYAHk0RsOnh3I2f9OInhwvz6dNgNZqRS9/S6mO9dNcgr7sb++DwXKsS
	Q8qW8ehyJfwvaQw3be/fONkBXgwCmxR3NwIkG4dBqTAwIndOga6255v3F6sKhPvGK
X-Gm-Gg: ASbGnctU/V4n+jNKI+nespaPvIr+Xf8hGhHchizyTkW7hQcpjccwQUP+RZ/kfXv9FF7
	PajdJakiM7KhCDQ2o3oASgRN8rgQv+qIKYw+pc4oFV3U375MiR3yL2S/6ULrLpycRjktij39LIY
	BXnxxv/0ojL5IkP6D1nnGG0W4vxz8a3Zv4gSE2oOIzmM6hSpCLf+Hir8dSSVPhPICxOZfc4wxRP
	Lwipijoyz9peBBayz9zOnCTnALMO2XchIWJsoMmuutYHy76dmRz5KQkxqtHLJMQ4lhTupcntTrs
	SWsdncETJQn6eJfp5SIXBPFRqkxc2BE8hze7f8u+YbzkUf3lgKXVZqJvlyMqsHByHWc6/A==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id 6a1803df08f44-6e8a0d82de6mr16983556d6.8.1740750191677;
        Fri, 28 Feb 2025 05:43:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2eA/mVAmzoZ00yrwl3fYZmJW1K5Im2B6KfwGP2t2rb3Y2cUvSzpqF4mUz+BIR54vSE5s4Uw==
X-Received: by 2002:a05:6214:2b0b:b0:6e4:3910:ecf0 with SMTP id 6a1803df08f44-6e8a0d82de6mr16983486d6.8.1740750191306;
        Fri, 28 Feb 2025 05:43:11 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0db671sm291962566b.72.2025.02.28.05.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 05:43:10 -0800 (PST)
Message-ID: <50cf6659-ae08-45a7-869a-2300f4d037da@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 14:43:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8937
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
 <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250228-dpu-fix-catalog-v1-1-b05d22fbc2b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kXRv9ncewBUI0DhlXBOue3HlwyPwNqXR
X-Proofpoint-ORIG-GUID: kXRv9ncewBUI0DhlXBOue3HlwyPwNqXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=976 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100

On 28.02.2025 3:40 AM, Dmitry Baryshkov wrote:
> The MSM8937 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the commit message fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

