Return-Path: <linux-arm-msm+bounces-66309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937CB0F3F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F333BFD0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DE3158520;
	Wed, 23 Jul 2025 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSqeGXi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2133DF
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277217; cv=none; b=WIy86eY6UXbUrAXg0OtkY5mV9K1KCEHCVEcPXOMSquqkeQeUWzNgQ1CZnPBYV17zUCJQqUd1oXx/gJKLknH/Wy0+dl9FMeN124jkGGG51StEL9eDNhxzJSVuBfbRNfBp3B8ByBJ+2gaIKf2/8JjUqUL03+qmonuO4KTrL5ziL7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277217; c=relaxed/simple;
	bh=l69WMMjrmPPmNmPc7QEi4cxh7DmmEGEO/ny7mE23F3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyqtahAO5gDnjp8bNgO8SgJi6usxhBX9MlYFD2dIqGMpQuca7qgaK7sJ/O6iSR13sFkE7a7yQmhWNHF1Vci2zpr4HHvxVvkqMbbWBH4Mk96l0jlqDy2Wa+QysHyL/vjuqN7VtikEP3MqkASbFpGLmyex6mmMV0phIgDhfHVuyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSqeGXi1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ekr8007879
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=; b=YSqeGXi1Vz8lf0zh
	KGMJFUY0vfZUHkLHZsEdKCduYiDKKcc3syvCxisEs91VtIwfAgZ0oQlDtE7xIgAd
	/45XoR8/s5x/ehKlNCD+hiWsYmffeysN0+TxsTkKhVogfKarr08MXEpf4SPz9DNS
	j9k5DVKvivbzdKzYyS5YMeh70JkrOXQSCsPj20/YlsaDDZjxh3EibolI7fJlvCNc
	xV1O036CZJq3YdxSZt4AezOTC/5xi/Dm76HXR/34cPadz9AP7B3vxYkjCZjnEVgq
	DLxytAUt71JiwyqoZdQtBQ9/8Vh8X2tkbblBG25/kkitU9t1VbkFhJfPO8KMig1u
	bl0MSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qd8sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:26:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso10085656d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277214; x=1753882014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v142A/UiqMfzDvaGD5c3CeLLc9g8lfXOT8p9oEHfIXY=;
        b=g9/8PaBozjSSBXqOy2k6r7zwj6GTDE4pTYgULveFrZ84Fjqyw6GMsFsaQCnm7cubW2
         Ew94LGPcgxns5pJtataOVfclWD1AgU5l6Up108kX/Yz72qv5SC+oOD+VYPQgLkwypk1P
         C2Kodd8G2P2AQ2ma3e2LXLqYiuwfJ+6Muee5xRV8Oq1hLfimzneuhWLL1c6JEUhycIoN
         TURg48826P93aMKE7pJIhkOC1joMb10AT7kCFtiLg3JRsgFcttAiN5KXhPabpXez+AwZ
         u5bLeSr4qyRpTMf+APIUCo7PRIynprYBIuXeW0stThghgKPqiko8E344S/11elkaLAbM
         vCvA==
X-Gm-Message-State: AOJu0YyZKX1AvshBwa5dcwx7ByAi4YNCj1qCTj9MKyYCTFtIIubTw8if
	YhtBYpTs40hNLidER+AbFD14aOwJqVNJIQCN2fFSefZBnXvDSfQFt12ZvckAm1G7vBf90yGcZvV
	oFchebDVrrsWF+rpy9+jfRaJ96au2nCIAENX3Q6I2rg1ud9EVaTWFD4U+MLEL9Bsu0jMf
X-Gm-Gg: ASbGnctW+Jo/XyjdbDOc9y1F1XXG9Rz3q4JOrCuPYGcylYxtH7DK21pmzYxDvuHfrIF
	fHf4RU2LPMzkkQboQTSHVPdqdiWcpznH5LP/z2vV/CniwZnB53m5jS0zdOOUtym1WXqVKqCwNMr
	v27p3T8gK/WvBR7YulleMLGHOOVHCRE9nJQFpTMJ0Yjm75mYCGVmnTma43frvUPMV2Ja1RktZSu
	mc5GgtzmvZNhXQDloAccwjQB2+IzzzO7eYk6zB0H4yxq4E7XECy2/66QGlWEfieKC4tAEXNQEHQ
	8X5Dfzrfxq+JFeRH/2I2oOdOsjUS5qUpnb06Jl0euq+Y59LOUoOTQRJ0JqqlxC8RmyMRdfBD+Fp
	504nGOjOy2K65DucJWA==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id 6a1803df08f44-707006aa41fmr15997336d6.8.1753277214226;
        Wed, 23 Jul 2025 06:26:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZJ8dwmCFipYmE82A1CvPITOOD58pCVlEI5f3YLgSgX6gVOcfR4jnt3jQebHNiXAgJLM3rdw==
X-Received: by 2002:ad4:5c6c:0:b0:702:d9d3:cc54 with SMTP id 6a1803df08f44-707006aa41fmr15997086d6.8.1753277213600;
        Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79a089sm1046197366b.20.2025.07.23.06.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:26:53 -0700 (PDT)
Message-ID: <242d4174-d01d-4a65-a4a6-1f4d4e2d4fa7@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723-ubwc-no-ubwc-v2-1-825e1ee54ba5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNSBTYWx0ZWRfX1vXEdsVeG5gG
 dvfaQqL6BWXS/dtab/ofPPOsnZ88l/mhRmz1fEC1SISrgwsyh+6cc4edWr2dMhPR4FjpgIUMQi9
 Afrc8cM6s3nkFn4ZMLhm3WlY0GKPTyt0ObLIfrzlc5fwwUg2xFuWKZyNC+KCWeHy+qiRGlKIs5V
 scDzfEjET47QNbL9oxls3xMNnOBizNT3e7WR6HNJ4FlLxb4isTcTipQ5AdooJiOuazH2eKr7kCo
 SZWd932Q4vdZNlpIbKAVPI9F6lQM8LVVjpkrMC0DSPXFraUbT7KzYEC4bqaatcIYcTnAWq8RdZj
 z3bAVuhpAh/0p4oF/JKKmmsi9b9JucYPBC+WEcBLD3R6vexztRTyQN/4vBeqk76jxfsAnP1NPN+
 4sJf/9iEmMTEi6ZybJ2+RVJ8aKnCbL3qPfyO7pjjXn5XQAwzIyaXDyF4NBNrT6iH4ksKiO32
X-Proofpoint-ORIG-GUID: aSj6vrCQ1N_o0AHPqh1Jc31XYqNO7CN9
X-Proofpoint-GUID: aSj6vrCQ1N_o0AHPqh1Jc31XYqNO7CN9
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880e31f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=736 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230115

On 7/23/25 3:23 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

