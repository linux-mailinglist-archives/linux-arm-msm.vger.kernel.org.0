Return-Path: <linux-arm-msm+bounces-81368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F95C51779
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E16D189F1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A533A3043BD;
	Wed, 12 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tri/oO1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYyU5yWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E07302770
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940951; cv=none; b=I3xkuIjvDer3rhBsxHGZHcnitg6DKGmVyTkvUDCLIG3i0knpeJdQSADC9Y+jTnynbQmnx+9BjTT+eCVn6MBRjz8lkA6gCO3B3BsgeJ976OH2Thi8PBeXk5S31zp7OwqepgqHzASphfF1tIx9eVDUalkZwEJa9tI1WTkCeJ42Cqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940951; c=relaxed/simple;
	bh=wTui7CYgiy+K6A4DwIyIpanabpofRNM0sn205OFN0K0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVZV1uITCXm8/Z1xEjveaCEq4IRet53gd/W80QVbZLdtnMuk33aVhAjk8HtUzjPcpgAXwoIGagrzNHQ3hSrlaOJFew5toWqf9yV8E3B24rbVHNCmkIhJfDe+F7y9FFNuhDwOW9/6w14JXe7iN7ePMi2nv20W7oj486hMSThmaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tri/oO1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYyU5yWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9gg4f1109111
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dPJ4QZdBUlMpVPRyGvKtHV7b42+J5SfL4CezhrPsEM=; b=Tri/oO1ZEG/NXnXj
	LZ7eUv/Z4t5Xpb9bTEJ/YzsUOMgVtx55KaPtO6P1rg/gKKagVqtARxR66yqlMfXF
	Ba4NWIJ6sfBdpgI8Ci98+8p48bSh3al5LCHotjlL25X5gcmdgIh3Rq7Og1k+/kZk
	iwc3j8n/K+ztzRkkV/l4P8IVQfN1uSos8ObPgx8IA1b2epBcan8o5MBRhVb2wOhK
	nyROZc6CCrMkjRSi8+ZT/jQlxIWRS2smP8pgiut+sgB1SgR7Jm+Nxn0W0DSxjift
	76jWYAICf9fX95WAvBfZMrTQiNqq0mzoIBKG+FKdvb7yv7DCh+zAZzcqBdTA++3y
	d67QyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum01fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:49:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edace8bc76so2172751cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762940947; x=1763545747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dPJ4QZdBUlMpVPRyGvKtHV7b42+J5SfL4CezhrPsEM=;
        b=BYyU5yWAzNjmSjF0db+II+H5IL4CxtRMmKrta2O86LW9BoVRVca50EOlyJ1Csws1na
         VXIjg+0QOC3IYyRve5/R25xPOvBjiaKNnO9Mmcbz9J3VAoIQcmLRQ0Rqan5q82teMrhd
         KrmjkW4cs361zLjk0HgqlC05Utg4est/0lE+cK0QH8NtjpXMFk8R6qvSqDOkWFJZJvVl
         cECr9wkDrU7eUnZuiTeBE5YQsv1i8GtB18FuJkDfGY0FjUFdiiDzHEimoDgjJ77Iy21m
         YdZ2lc7SkYLhNwDBN385SlQpwt5jtfNhLp/l2naZJ+mqitQuyePdI6VqFpdiQCs0nR7e
         Vb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940947; x=1763545747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dPJ4QZdBUlMpVPRyGvKtHV7b42+J5SfL4CezhrPsEM=;
        b=GO+Rge6NM98baEx/DFmvUD6Dhi5cp+9+hSBYUWJH1sdRWnUKlmpxaiaVwchFk4UVsw
         NmSPbEbzeo4hsK8WMRb03re70lnFN2UrXxVCQv/MAgwHExNAWRGGO9Dinzqn8UJq8cVa
         +rfQWKFohAbMiJYyutINuEGiQJYCbxRKodtE+YcpabZh+Hb32s1coJ0W+sBFh0sC4icP
         PDZOzbMA/ZnaHvBXquvnouDwZh+Gl1Snht33PzHuZ38Yy59lpHP9ah8infPWjBmYn2WN
         4cYEEp5BHoSgFMwN0HozHuYExzYXBfM6vbTHzTm/Wzy27xD6XmWmr57P9OIC0w8DzPbs
         G0Zw==
X-Gm-Message-State: AOJu0Yxu1zCZMr6W79onU0yGshA8ZIMCnWMYvmBfBmTombSi/FphWLw2
	gvaGk3akli8OGeCFrBU3fTFBtlBL2e9IaiXESs17gwSef6MlksMs4Gp1eIVFD1BS30SrRvH2SzO
	8P+jbpfqhnNONUu7FYPlpA/PZo6Y4fXo3NaD9MVx/tP5tZGU0o1jJZhanO9t2GwTa+YHV
X-Gm-Gg: ASbGncuRLTEnlV/POLh4008Mpr7WIAYpM6Nf9BKimctxSdm6WyuawmUbWSHWtK4IPF+
	ggUeH/4CDKL4D1Uc5dlYs2bPa7tgjBjfciZ/kuCYcRF8dadQEoaDNyEovPWBT6NTSq5h1buYV6P
	GndCUtHSSfX9YgPvSDr/fGbRxFUgX0uB2IcX/G6zfEYa7WHjFCy3UJqbfdl16i1NcgfEmg0dGVt
	53hhNnWZu4zwRKG9cHKJLruiH9cF7ttky81DL8MuercGhQpZtLRjuUn7bm/uYicTTKVwVHtconS
	sKAneGB1bdBaeO95SuVc80ElrNwuSP/7JGTw1EuMSxm89DgGpnuPkb8TNFj4j6CWlLI7ZAQUXOJ
	Ac90uUi6gwmly7vxfGI9qHp94cVWfWfOO+poFqk/C0jH06axZ0jWmlQnY
X-Received: by 2002:a05:622a:11c4:b0:4ed:b0fe:54af with SMTP id d75a77b69052e-4eddbdc11d9mr20202661cf.13.1762940947380;
        Wed, 12 Nov 2025 01:49:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPqrzdXmGbyKJf1zyUJ/6/lZ60CvdT07rxfc/WOc785KhcfTTcn2HopItZGmkx92ctB3AEQw==
X-Received: by 2002:a05:622a:11c4:b0:4ed:b0fe:54af with SMTP id d75a77b69052e-4eddbdc11d9mr20202511cf.13.1762940946968;
        Wed, 12 Nov 2025 01:49:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbc9656sm1568734666b.7.2025.11.12.01.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:49:06 -0800 (PST)
Message-ID: <2bde5922-6519-4b6d-9edf-94fd0e7dbc9d@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:49:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable Bluetooth support
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        stable@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_jiaymao@quicinc.com, quic_chezhou@quicinc.com,
        quic_shuaz@quicinc.com
References: <20251110055709.319587-1-wei.deng@oss.qualcomm.com>
 <28ffece5-29b7-4d6f-a6cf-5fdf3b8259ef@oss.qualcomm.com>
 <ee04e03a-ffd0-43c0-ba77-c7ee20aaac43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee04e03a-ffd0-43c0-ba77-c7ee20aaac43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3OCBTYWx0ZWRfX869/hmGa6U3j
 fI5eVtQ8KHA78dN0VkENflQRyPQko0kOem9vNuVW8eDcZYmnd5f7jWbVhHiPCzGyRkQhWwtqNHP
 2pBcEAT+zl+buFUy1LrekjbSCzkkju3AnaX9wbFIfDB1qMwktKmF0jX4MUMQv63g57YXx0Xukol
 YitxBD22XR4ycKzYhKCiDawNf47nSRE2SpgodwxhCrAK54qKI9BSlpPsb/S3dZojMqNR3/uVyQi
 LbOnYDmojr3Qg4BZTskwpCtmVV6B+87yiZy42gSGrXIEJVurLEKJwqLLSKzPlYvHACACdIWHYdT
 iN/A8Ea/cRpjVP6zbS3aLJ/YNW+wWYFao2m8s9tobXERtLpH8SzlDgxOeWX9meBrX95TryqCzgV
 j2Gf5VFg7hy8yYm9wcpo/grwEcjahQ==
X-Proofpoint-GUID: qZTCNZ2ZcxI7nNXAROu7_err4WSPN8Br
X-Proofpoint-ORIG-GUID: qZTCNZ2ZcxI7nNXAROu7_err4WSPN8Br
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69145814 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iyyYdLundppeB2c9LQAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120078

On 11/11/25 1:24 PM, Wei Deng wrote:
> Hi Konrad,
> 
> Thanks for your comments.
> 
> On 11/10/2025 7:49 PM, Konrad Dybcio wrote:
>> On 11/10/25 6:57 AM, Wei Deng wrote:
>>> There's a WCN6855 WiFi/Bluetooth module on an M.2 card. To make
>>> Bluetooth work, we need to define the necessary device tree nodes,
>>> including UART configuration and power supplies.
>>>
>>> Since there is no standard M.2 binding in the device tree at present,
>>> the PMU is described using dedicated PMU nodes to represent the
>>> internal regulators required by the module.
>>>
>>> The 3.3V supply for the module is assumed to come directly from the
>>> main board supply, which is 12V. To model this in the device tree, we
>>> add a fixed 12V regulator node as the DC-IN source and connect it to
>>> the 3.3V regulator node.
>>>
>>> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>>  &apps_rsc {
>>> @@ -627,6 +708,22 @@ &qupv3_id_2 {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&qup_uart17_cts {
>>> +	bias-disable;
>>> +};
>>> +
>>> +&qup_uart17_rts {
>>> +	bias-pull-down;
>>> +};
>>> +
>>> +&qup_uart17_tx {
>>> +	bias-pull-up;
>>> +};
>>> +
>>> +&qup_uart17_rx {
>>> +	bias-pull-down;
>>> +};
>>
>> This is notably different than all other platforms' bluetooth pin
>> settings - for example pulling down RX sounds odd, since UART signal
>> is supposed to be high at idle
>>
>> see hamoa.dtsi : qup_uart14_default as an example
>>
> 
> I followed the qup_uart17 settings from lemans-ride-common.dtsi. Since these configurations are not required for Bluetooth functionality. I will remove this configuration in the next patch.

This feels like you're essentially saying you don't know/care why you
did this before and don't know why you're changing it again. This
doesn't give me a lot of confidence. Are you testing your changes on
real hw, running an upstream kernel with some distro userland?

Konrad

