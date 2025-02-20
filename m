Return-Path: <linux-arm-msm+bounces-48690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBEA3DC69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0844700C1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 14:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEFF1FC0E2;
	Thu, 20 Feb 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+FnlPVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43511FBE9E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740060984; cv=none; b=MLMsSJT+JkdcNBzwmZpHs23L6SWUTvhPT1QeZHE3Ekd0q/foHEiopYR7upe1TjCkSx/I6ZU3Nv3B4lH0MyUmyUbYGDYkaQAWTJ9znItwWhzOqe0Lw7YBSKSUDI9n+iIiCwHHZDbPcNzU8OjLfhZRAhXOLPrB4ZsD7WKoocED5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740060984; c=relaxed/simple;
	bh=YKoE3C8XckkPijkVeqGKcv6Cd5mV1W7QWYCHmbo0e3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW5uqeBncQhvKuN8NaZI6bigPlwoUtBWE02sBHc/WQrbdQBqDNAfr7nQBaUboiLzNr0BGOiBdHb01qF/ta4NOJF9YZiFDiPehBGgiOxskLj4uKm9LVw4xd9W+ESIQbkDEMHBUuAv/CYhzO6Ud/m8VYUrry8X+hLBfsAGoTm62J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+FnlPVz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KAk9d8011747
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 14:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=; b=k+FnlPVzYzdZ2PE6
	Kroj/0BmRoWTMqyMDL74lahz3z0gUJEHra+1atu0vb92f2OmCzhuUwgwubYsaH9K
	kZIijV8sXs4gJd9882zuZr9MDEh8UUUWfjgxceNdpuv0JkcEh1psJ72Vl57W8TET
	6uX9aq//ihEVPSyatHS9FU4PpQjNzu61Ea94TK3akqkIXp3VKOi08OHQ0ftKO2x7
	gFwI3B10Ahan1UtT6vu7pXJTpTM8rTP75+nznsOj+SdU7WYzjUDQ8dNc9e4JhVX7
	qNssf5RV1Li7Ii6Dx4PWwnJOTpW4S03QSjt4nNqlZMn9+Nhk3tKlqe0RUzvnIE6I
	1BiaYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xb8hyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 14:16:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e662a02f30so3123576d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 06:16:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740060980; x=1740665780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuYdE4dlbQ4IVCBmM2eClz9fsFF9FHokS9b6ozmwZV4=;
        b=lh/SOolsUENLADpvS6N2jf8TOS/OP3wLlEgmvohsGUvT1jDeCOUId8yXXza5jCqAQR
         YAjLuDMSft2KnBK9aXfnNJAzx6xCordzWwdENjSerjCsYp8M0sDCtG1/hl2n9pDxaCxq
         DERMC3R29jGHsRr3MJnJk05x7G9oKdeJZECi7yyX1daDTnvW0TjtBCd1fVSU2FEfzWwA
         ndUEYxJKAF9WhKp0wqxo5SmH/1QHk2pjc/E6dZ5Fx0OJ4D7C58JOETTAbpZTbFPZxve4
         NJYIJF89PwS+sI+4k1rJ5oBG044tMI19aqeUyHGgJ34C1P1+y+rP4K1He3hYNIzlvWkj
         s+1Q==
X-Gm-Message-State: AOJu0Yz/mivVvkcExLnIMsRkqtpJQOqPQHipC6kjqLKMnYmTJLQ3t42f
	9LKHQ+rtOFmMQHnZ8HmBGvRVtMWR90Qlf++hr33EQUjX9DSt4sDOOie6SXdTGW7N7PrSSnHypnh
	3qjrP//qR8AFRcj9YYzBz34niRcNgb5gx8REEHcprfp2Xo6osmDupv7hxCEjljHXz
X-Gm-Gg: ASbGnctHm6nwoe1p6hrBehvHXAs03tfcd6uS7ERV9o99lc3LAbNsL57BHRysd+amKUx
	axlCuYhkhx5y31WOBPG/wOQioqnCYanVNI8N/i0adu9w+4k3Gc0cV4Q2eB/qWMBVgg4DCs0t/0+
	cs7iEU4rZNu0rTtiLJZE4DrjyYvlAquXG1Vfh5hRFb4HC9iCRZFzbWKwM19/Q+Qa6/dxX0Sc3Pv
	R+dfmAkFqDvv5W1CX5Yx8c4EzWcVoP7c/JDbNTLc/BxzjAu+5i2fpA8SEyFxFmqjDUP24x+wL+b
	IrAhflDSQ01tLSkMjeYep+h0cWS4aDtzVHdiYZYCLjkUdidqlifPf+J0QYM=
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id 6a1803df08f44-6e66cc81ee6mr117329836d6.2.1740060980168;
        Thu, 20 Feb 2025 06:16:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/rtxy8V+ibsuKKWTYNnpHRyUUiiKw18tEiKCIKFtweF7nc0fiGiUTgniZ2kAyBjdw0RVwQA==
X-Received: by 2002:a05:6214:daa:b0:6d4:d1c:47d with SMTP id 6a1803df08f44-6e66cc81ee6mr117329606d6.2.1740060979770;
        Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532322e6sm1462102766b.1.2025.02.20.06.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 06:16:19 -0800 (PST)
Message-ID: <bbb099ae-2389-4b7c-9161-83d8fe94b45d@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
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
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l-1sZESJaAdhupVMlMDYQ-YXoRTIqW0f
X-Proofpoint-ORIG-GUID: l-1sZESJaAdhupVMlMDYQ-YXoRTIqW0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=802 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200103

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
> depends on COMMON_CLK.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Ha, nice bit of archeology

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

