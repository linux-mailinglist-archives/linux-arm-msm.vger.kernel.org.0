Return-Path: <linux-arm-msm+bounces-80440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D0608C3547B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 12:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE463349C44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DF630F542;
	Wed,  5 Nov 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUk7ZYPx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhrXVnYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4BE30DEDC
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762340563; cv=none; b=Spjgx+81CB9QN8WSsv7Gg5M6sr56O3g6N6mpyyTvaj8NzIfocqurti7EZP4j7m2DyztAX8ZeLwfk4ZszgXXA3iksNlGIvi1kIPWOeah4XGk7zvLbylLXnsYScxr5tP1qdeVrR0fbVh4Fq3/+UYmsiIPjOI/U+Mb4M98FWiuXxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762340563; c=relaxed/simple;
	bh=JyPp9KCYnthpWeUJqK159HmdzMb7RVz9NZ0LYCLk9dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFWFpu6yXDed9gVnBqEvPD3uPqkLp8MtYRyglU7uSQ4rPOKjL7AJoCzGKhISCFLZKITB5AzoaA99rV2LGwNB4w6MIzCvr/CX61S324DH/VE2aDc6eRz9ehfDaREDq5tGRcBWjCceKu072spdyy8WftMMqIec8EC7nonP4y+nSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUk7ZYPx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhrXVnYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57xCLv3164792
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 11:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=; b=LUk7ZYPx+kmvcJb4
	wae2r2tTTME7y+86bKZASPhTOxe5mKsslxPQQniTjcE2YEMC9PlLzyVQGhMpb8YN
	+uEzLQ7b/5ArhbeQy1/2PD2YTiP69ceTmdIkSp8sz33ebCWmfDwvC0wnsl9oyhzg
	6JeVxwCoFLIxd8HAZDZzpuPx2bPdh8dxnsWxdmG9jZBOqgC/CBoEXfaTCRXKZjfb
	eul3FM3QId/o9qdwE2BKt7X36W0U5vNNpSgDIWyUNJvnxYRA2nd9VkRtMZo14eyw
	vsIVpvAc0iYr/BtlvZIexhgrZmc32j4vP9macHtxXcqv1bSDLeNOBIQbEu61RcUU
	a0tB8Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ketkbap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 11:02:39 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93521a88d85so81479241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 03:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762340558; x=1762945358; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=;
        b=DhrXVnYKN6whB9xOy3DmTmnJAg3GSfz+qvMXrKOyJ+8ApZfzGqcxjjsfyHfw/y1MZe
         GMN5Eh41/GVQezFvv2rEOVNb/MwRTLRqX1g0hv3jpY4XSw5CgDZEuLZqw82nUFCfBnPh
         lYiqdlcxNYlNzivUOFUImAQJaPTYDPYf3tAmsHqwCnrO/DMYYg3lByx6nYv8qUSb87aj
         y0kVFlzVZ3DAOu8TG4T57BME/n9LdzFUkyFsthCZ/iNvqTNuVn+n8bmkvtHMqPQGLxqQ
         MCYYz1R0au5R+5NY37W2fHjCYVTLgBI2whb+VFlyJ5TSmHDH6OsOKyb1akDYQSa6WsUH
         2izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762340558; x=1762945358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cMehhhiS9nybtpsp6nbbPZsPsdC76f71DKdx7y8PZ2I=;
        b=iWWX7JOo7dnXSnQVJCUnbSprCIJfBqgVGzMRJbj8mmXNYwIHcL1S2WkF3yZr+rvZMJ
         Ro425gTGaahA0nu7DT5Vy/ZEngQvsc48/6PwEUEqaUQ5QOyubBSN90SiolMDifAPDTaD
         ESveDgjdMgkpxGiM6iP+QH4Fw32GK6dShdRj2agIR1Sk9sLcwzm2xq17Z5ufuX4DkMM2
         I+NWrBGGvQodbvxbO0RCj1ikCr/6+9+WhhqM8at6ipYZhjTUoS81FrMy5x9EWk/9jEu6
         cDzfmPBoo8ln1Vo04RiGBfIUkcCf2oht6CcfU42G2mAIp++IV3m694Y4NtIcnztjKVe3
         yixQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQRD38yjG/1dYY5u1U017uXSlf0IhSRXPH9k8mCq423RrlcHRbwZzVjGWjD1xNpbADh5JPhinp5k5TyyKN@vger.kernel.org
X-Gm-Message-State: AOJu0YylKsoieuDI+n18AHGWAd/HTgXP8pq1p4osA4F1qb+TxR3W3kbK
	7yuFuM6pheYbtfLrXdiMtbY9J+V36GKPlgwFlXr1HOb5ZjM1bjVkSLaHU41JmUpPdzwMc++b90B
	4mnaqkgAJxEIobBneNTk+zGL4JhAs/+82PDX3ID4RkBuSK4eQBu6w/itJH6gIAqjp/vbH
X-Gm-Gg: ASbGncuG3ohsYISsvR0xWuW2qrE0HknHb0MjDeRVTr6oD3PNlvnMWsoncdh0UIFDPb+
	EjCQAQm4nqobWt4snJXaLWKNCH5/hPmLzJoMonpqSZQx9ds9BkWcwPvvn/KWKp8iqqrjLwvA8co
	8zrHyM0aLN9SLwn5OPgbkVYqURBLlY3xKq49f05nXiCu2BYm1OLu1iriJ2OcvCPuDj+5awJqZIj
	gUPcDMXs/576u86DVNGZdze6KZZJk6x6gJW5Rxgcx9eBUMOrIRXGfrSea3DJLC7iOQisSYxOXtY
	vpDBjh2wEYo3ODAeV7ALXpiU+5kSqAgNuCdLCIBjEryr0f3PTdHYAv8w23YtsspIyZSvktcLVU1
	mfho1+1hQ1ceLBtvNYEnuWbmoIonI9NvC5K5VRKP3Qb7sCZOTJLgNpmQn
X-Received: by 2002:a05:6122:e005:20b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-55986364f8emr344843e0c.3.1762340558460;
        Wed, 05 Nov 2025 03:02:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESU12qH+Px3/WZaGSBLZjSXFZOo4eg2UqbetAoBXWf3Muv4D8gi1IQrPyHIRpaxiR3PVGOoQ==
X-Received: by 2002:a05:6122:e005:20b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-55986364f8emr344818e0c.3.1762340557848;
        Wed, 05 Nov 2025 03:02:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b727ebaa351sm30419366b.55.2025.11.05.03.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 03:02:35 -0800 (PST)
Message-ID: <7f7179b7-73a0-40f3-b921-888b3e21537c@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 12:02:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com>
 <20251104-topic-8280_mxc-v1-5-df545af0ef94@oss.qualcomm.com>
 <1e464f5d-f4ed-4ee5-b966-fc7de586340a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e464f5d-f4ed-4ee5-b966-fc7de586340a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4MiBTYWx0ZWRfX2G4tpKD+GYUa
 v2eAeR8+rMZNh+7utZduSMpEH1LK2FSX1x8o36BEd3PJSV9+VmXmGxDOvpW6zwcCGsUETtBgZBx
 QKumAQSjiB3MzPcSwyN0p+7dRAhlrD4bQiuhmktuKB7ATjWYD7iPr1KPHxLA/f033JaTHoMXSRf
 Uasa57DgYGUeu/8JGOM7QYQwbqEuZZIuvHrVqeg7UcKSVNdEJ0OZ9+9bQmwjPCp5kNF4/26VTRK
 6hY1O3PpF6rWzRmtXiwpp8xW4KPaBtfraOdcIrakUkEPJGvkn3Wz6+h0ydv7csnZqF2h9OSSkCD
 vwfp4HKcyy6XdfdV/oTJ+mqTK1F7m5zYqCsKxj0a8ytDabfE/R20rpRr0XNmO62lRfdW5vbtH7I
 WdJaYG5m88dPY2dvSLb20uG+9bCfdQ==
X-Proofpoint-GUID: c7RxFhi2ah_1u4xofImmyauwSppeHvnu
X-Authority-Analysis: v=2.4 cv=IdSKmGqa c=1 sm=1 tr=0 ts=690b2ecf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aElX1GfIA-y7BHMLUgcA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: c7RxFhi2ah_1u4xofImmyauwSppeHvnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050082

On 11/5/25 10:21 AM, Imran Shaik wrote:
> 
> 
> On 11/5/2025 1:01 AM, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> To make sure that power rail is voted for, wire it up to its consumers.
>>
>> Fixes: 9bd07f2c558f ("arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp")
>> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 5334adebf278..643a61cc91b4 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -4586,8 +4586,10 @@ camcc: clock-controller@ad00000 {
>>  				 <&rpmhcc RPMH_CXO_CLK>,
>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>>  				 <&sleep_clk>;
>> -			power-domains = <&rpmhpd SC8280XP_MMCX>;
>> -			required-opps = <&rpmhpd_opp_low_svs>;
>> +			power-domains = <&rpmhpd SC8280XP_MMCX>,
>> +					<&rpmhpd SC8280XP_MXC>;
> 
> I see that none of the CAMCC PLLs/clocks are on MXC rail on SC8280XP target.
> So, MXC support is not required for CAMCC.

Hm, to the extent that camss is supported upstream, I could indeed
boot without pd_ignore_unused and the camera actually kept working..

I see in docs that there are links between MXC and various IPs within
camera so I'm a little confused. Would you know more?


I wasn't able to test venus because it locks up either way..

Konrad

