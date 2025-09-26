Return-Path: <linux-arm-msm+bounces-75295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27655BA3637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF2B3ADD5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 10:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228F426CE1A;
	Fri, 26 Sep 2025 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqpylniP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F2374C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758883546; cv=none; b=PepmIlvQyQNM6ohGvNnNTxEJ+4vjVDGxrLMpVkDYNqbGyeGeUTlFR2ApDFJ1f+fVHH5QLOkhL14WlutQLdkO7S+o2Nyahhe6Zq6Lf8d4ucvvQ19e7F4H9q+dLegWqq6lsTwUkE+9LoGWxvc7/6HGomDghPaFWHgVRHtEhtOSH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758883546; c=relaxed/simple;
	bh=J4ZX0MWrY3PhebLrEOpzMhccx9zlOlt69Zt8hECTugA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLEiuqQ7Z3pxx6QI/f6+fCeHQrieTFu6OVVty6c5FdMB3XJ+yqmn2dwUAsVyowoIsAcsvA/W/MIFXivs8NHPkRyjHfAV06gl/sIFhHEDqRfWp6lYKSidwPN2ArCyMQm9PMqMEGZC//8Tm78x8bAPiuh9O+lbCHYq1LD1o1zxb6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqpylniP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vcJ2002645
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o37iq3utXp9TlBS1thYy8/XMKpWTzL3E3iu0aR8tupo=; b=CqpylniPW51JYdRJ
	fhhXPYGozB/XcacuunHqGv1GywAbV79/1ywg5EkJA5QiZnluIhNyf/ffs4XxrhgQ
	nf1c25Lk1wdmju/+uAlCov4RreeCz0aXY8EhO0gnluTdRd8DbNCAq1nb1+sdzJp4
	tPrN8lODiDf6CeXIJAaozvG7QlXxkqvP7FrH9+XV/JY2cMynlauXjtpHryrLTVpH
	p/zif35uLqz3ZLtCyOnEeL/DcVAbZfe/3mzQB+UonFQSURcQ6JXJVemh4+jwnFRm
	ALAUiICj403sEC6AJ+vx4n9ofIkHQ4oRrVKvZheM6Rk5q6imqdIfjKlzyDBrQju3
	HoQidA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u2htu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 10:45:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ddf2a2d95fso1072281cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 03:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758883543; x=1759488343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o37iq3utXp9TlBS1thYy8/XMKpWTzL3E3iu0aR8tupo=;
        b=Iv5u7zgMuoJoeFTN2CIy3N/IX0m453rwh/uOY9MXweIXHlGyupOiBz1g3B46nlHEzv
         kfd3Q+SEs74DhT5Tp2820Wwqywa+5leAyB/sDtVMkJw/MUhQFCaxzBCcpdgEsgjBuZ26
         YlrecZ5iZ7EaFM07zoiDG1x+lqVFAuhv2QqKhBlOvvB59zHUp9NAtPjhtum3TePWUbIW
         TYr3HzQ31lasB6oQLFrjaI/kBh8kynVXraJklXWKGeZZHzGvsatZioKctMC2SKuefbju
         zoscRyz+TK8q1S6Ht70ZDVkOZW1rxXcQJfiTCih6pSypZwtEmcpp9+mYoP7VkKS3v1wB
         Fltw==
X-Gm-Message-State: AOJu0Yy6PIY1fCnT5IEDC7+WDDGbceKodOiyMcMFkPZSd/WwsdJ5U2dm
	M7WNqF5l+3P3kSsUFdydsvFabF0he6OlOxF6IMUnLxBz3MRpTt6OaZsQLiDdMMgB1ewdlacleq8
	ftLiK92PsRCm6OrDmD2R/0vwnDwhzLxBtXXk9SH9pdMs9ZC2vLUdFZrbmhIGK9u3m1NOM
X-Gm-Gg: ASbGncs1UEy70i56r/P0GbgfwiPoZNM3GXpa/xYaoeB9oiqYcJBUJd5beB8UZMQJ0TS
	wR9HP96PaCQEdFjmxGXf6rn8LwdeauK+w8aYPLtZu+9Vi1vC2aKHIvfUc/pYsiGaI4BuQSIuimT
	pjLwF8Eu8F4Pa4WMExIqnJJAUeRi0o0pOacG3/6QEuPvgT/GGO3bKVRXYxgg7TpjhXwMc3zEjoV
	3/5U94ZTA7wrLUvYCEAKLGUpm3Tb8XcndJ8VMoKgvxR0EMkH0FIDelBH/VI+VCSVjRHaQRik7v5
	+3Quvvdadi+T5uxLqMukudjrfmPX4wC988Uj8sKIrbVsCoiC3jOrYv6ShQuqIClZjtT+tkKJtNh
	mQR1G1uibFMESeMNxw2mRQg==
X-Received: by 2002:ac8:7e81:0:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4da47352360mr54646891cf.2.1758883542618;
        Fri, 26 Sep 2025 03:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpeGa04LShy34S3PksjJTcWsnlJiBTWqyL53wHPhVeyfkRWDwxP1iH4cDJtpYjWUnPOQvK7g==
X-Received: by 2002:ac8:7e81:0:b0:4b5:a0fb:599e with SMTP id d75a77b69052e-4da47352360mr54646461cf.2.1758883542010;
        Fri, 26 Sep 2025 03:45:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1671sm352124866b.3.2025.09.26.03.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 03:45:41 -0700 (PDT)
Message-ID: <f685f02d-9faa-4d76-b9ad-35f2fee0ebe1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:45:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PFu1bycaVWbZxv79b1NLOpnW60kB80Q6
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d66ed7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=ov-OtuGVHHWtkdtd7_0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzDBJEQ2bhsQ1
 3WTKcAB730xv9OXUXgdS5V8W8L2IZ3Dc3c1RBfmzUpQYw887Tu++V/qUnbEO8bWSUe977tpFkH5
 WaNgi2muGbWOJV/N7BLALjTQSU3O+vhaMlyZHgj60ToO8y5hNtPBP7OwV97vh0Y33tqt60MO89a
 oq1l9zgnL/13ZXy5qzcUiaB3cRyF0nxdTqeBuPUyDJtVr8d+/miEYpXyBphIkC9Ua7Inig5IxZ8
 oPY9q2/FOm2i7e9jq4q5brBImdWNbXWmQOo0jLVD0fYOx1dmK8Ca+D6hHHJMCjGxmmQmrOi5973
 HAcwO1Wv3qyjDjeMKrB0DuBsd9JRNeMnTqyQisXeW+cG+2zwm8uiL9dCxwkf62/QDqjC/jF04zY
 zKYOo1eEvEtxOLhh0I9Ds4DOLho2Fg==
X-Proofpoint-ORIG-GUID: PFu1bycaVWbZxv79b1NLOpnW60kB80Q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 11:25 AM, Ayushi Makhija wrote:
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>>> Add device tree nodes for the DSI0 controller with their corresponding
>>> PHY found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>> ---

[...]

>>> +			mdss_dsi0_phy: phy@ae94400 {
>>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
>>
>> Add qcs8300-specific compatible and use sa8775p as a fallback
>>
> 
> Hi Dmitry,
> 
> I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
> Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
> compatible string for monaco ctrl and phy ?

Because they're different SoCs and if it turns out there's e.g.
a silicon bug specific to monaco, we can apply a quirk to just
monaco this way

Konrad

