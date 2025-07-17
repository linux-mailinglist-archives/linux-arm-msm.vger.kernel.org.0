Return-Path: <linux-arm-msm+bounces-65498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5AEB08F6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C0C95A302E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A8B2F7D17;
	Thu, 17 Jul 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrcjY3dA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A912F7CE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762522; cv=none; b=r3jC4DYRFyp8VfCJHhAQg4ACAUjsZ0Ig4MDcOSWMmAyMByjfQR/pN1YGNY3+DtKR1zYZnf5YbiXDgrgkcBVWW1dh3HrQsdYlPA13x1VCJIHRwyGNu+Vst+eXq9vC3G6dEhnWFzgo4tZjSj2wE6zx4qCMh/4EQ5M9xSWqu0Zih64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762522; c=relaxed/simple;
	bh=v3oOU8PVA/bqEGOL4lt720q1ULAXf932Qx4T5j1qZUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeUFc2rRzhsSY1SMKwtSol8LMH2GkgT2qeRw/AUqX1uaW1rH5OXNqyFBxdaowIPNnJ/BwLIlLSILieMMsJT1yskVxsxRW7pnPQ/TOAZQP0Ql36Mf+hh0oiP4mklXlBoq7iDXILyINQdqy6XQW1HqGMqgR2WymnmoJxQzQkMnHnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrcjY3dA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCOknq015738
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQ+icyUZ+5njb3VMCS4dcZ4gTJQBpU0JDW0kKoJZke4=; b=KrcjY3dAgvQxpZ2X
	SMRvmyBueyY8pan1IHX+7wEItcc/wW0tECSzxGIEY7zGxXLrtiQau/oRZuOCXfAv
	b+FR8rX9FoTh3FspCf/ByO3lRmRlMdgzMvTW1dsuPrfT1YjYlqVzNvziQ2JjbmyN
	Sl0bDFQ+M9JW8M3Db+hCdCtO4iIx9jBaX2tKjXaWYN7x/7Z+U3OZkISrnID0zuKf
	x0saciahfZ5n0jBLTypGLgmd+yKOVDefaqEaDwEAEhuDXzwYPe7SLSSnSgQXvZMd
	kNDr1+9BW2b7wIib3HR1Wn6+pQlZtssH2UecczqIrRvzr61TIcZTQ/6V6nuhXF6j
	UdHDDA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyty1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:28:40 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facde431b2so3018596d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762519; x=1753367319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ+icyUZ+5njb3VMCS4dcZ4gTJQBpU0JDW0kKoJZke4=;
        b=WbzqR6YxeyCNVzSksoaVdFGDDgu8aKw8YWh3qfFQ4uADzdvWSeKOl6ONBC66llLBUR
         lLEsqSMs7CxZpRn4OQjPLRDJEFwh5HyT9hybMf4Adi6h6/B2bDBRCR4J+pgP6L3gPrJc
         asyWB3OSFrfWC//b4TQz4uERV8oYRuMwqgmeSv/RGWKFBgVLU6fFXjYikk64PQhfgkzM
         FmrxgDFyld8Y88IQkMNwZ5RQOqHjEHI2snV+VRO9w84ppun66LC2+a+MAc0MlfSTPPRn
         WbdQOvj+gwERysYKOWd293vOvFc7y4dEqqjnx8B24Ik04LYOtR/ekAq9/ygbsv4lTaRx
         d9KA==
X-Gm-Message-State: AOJu0YwYkv1lzwLkfM1gtLZyLUOQu5W7ZuZqEWXNQEUGBamTgbY4F3ak
	Y2JnP2ghF5gQiHvHVrWNW2fBy8+Ku+hqxUWPKKsEijqZrYqGDDWuoTBrdkdC5ysSmmvfukkm9LU
	ONWp6G0uLHCOJOZY/PgenPWVcTa8sLsiVJHarVw5XRZNdSnm7iAHhwhjhLntbrAiyI/uP
X-Gm-Gg: ASbGncvnw3gydzzYs1a8E2OTNPnz4Cyxi98kjD22RaFs8u3HKLAdssb9EqxiF1bK34I
	IyXkH5lPLm+8opIf2RHEgp2wELtiUY3fsgZEUCaxGVH6lH3VPMdGVNYld67wEUazCRkvigQ3QhM
	dhFI/DhyTucnS8YzibAwccIlXNg/+ylbueJ2dN+kWdCEQybT0i5qAifSvyiK4eu+RjOORGQXe8F
	f3fGM8G2Gwsks3Mr3D++InOamzEisQMuaAUm6KgcsnQGmPITAfgXuIJ13tAlmHFW6K+a/8Nz+af
	xsONihACPBIztFEeWPPAQ4RJS1IiIBjGrs0QdRJl+GyCvKj4avS+BzIoJcBoOXkKwBApwpxdwYA
	kInfPC5tcxJsEWj4ZxMBA
X-Received: by 2002:a05:620a:1a9f:b0:7d4:4353:880 with SMTP id af79cd13be357-7e342aa89e3mr435817985a.6.1752762518775;
        Thu, 17 Jul 2025 07:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT/4SwF38PAfg0B4c9eWQ7/O/SGHhZwcsWSCvKWkBoYrLT6UHikWMUgn/PtK4mB6zV9GV53A==
X-Received: by 2002:a05:620a:1a9f:b0:7d4:4353:880 with SMTP id af79cd13be357-7e342aa89e3mr435815285a.6.1752762518275;
        Thu, 17 Jul 2025 07:28:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c973439bsm10331941a12.47.2025.07.17.07.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:28:37 -0700 (PDT)
Message-ID: <2c1d8048-7ce4-4fbd-8af5-88d1afb5577a@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 16:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain
 indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ling Xu <quic_lxu5@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com>
 <20250717-fix-rpmhpd-abi-v1-1-4c82e25e3280@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-1-4c82e25e3280@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Glugkcy1GYZPaI-IwwhKph7OGKCHmkbc
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=68790898 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NamI24IyYu8Bov36B24A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNyBTYWx0ZWRfXxjBAU//fmQvH
 V3JZVhfB7Z8NSnouhZN0IiAAf4D2kYMwWFtrKGv1MSO3Yccmo8Ra3RJQDHvlPrHoQP5r2tusN6K
 dusfJaJo11rUTSkDBJgdoPLJb4l11XS6Nd156Vr//+UhPN9/TL87YIDOfQ4VAv3US+IK/heHjdl
 iNOGUv45pof/czKQykvQ+YQ4mmNMJWMzFIC5agBgBFi5E/siGnqMx6yrWVbSTMeWyVKvLgJHv6p
 oh4bGU3xFqlRfWME/AljkWMhii7vTAnHzwO4vUtbczVvJm1ycEzv1D62aeNs48HgH9krh1bvkyt
 kmpl05OCfHye6e93Bq3gxHEz1+zmnMXsk0cnO5loFj4py+QiFMn0wFnwgq1X6HuphJyS/TD9WcV
 bSpw0hdWq/8WZIiexTSwAbDYPJBp1DH7vxWKdj45LFxQ62MAolyUeqzKNEdUlTE2RCv2KV+z
X-Proofpoint-GUID: Glugkcy1GYZPaI-IwwhKph7OGKCHmkbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=771
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170127

On 7/17/25 2:48 PM, Dmitry Baryshkov wrote:
> On SA8775P power domains device doesn't use unufied (RPMHPD_foo) ABI,
> but it uses SoC-specific indices (SA8775P_foo). Consequently, all DSP on
> that platform are referencing random PDs instead of the expected ones.
> 
> Correct indices used for that platform.
> 
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

