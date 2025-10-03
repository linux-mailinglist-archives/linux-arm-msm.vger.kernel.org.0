Return-Path: <linux-arm-msm+bounces-75880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3454DBB6829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 13:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0FC19E212D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 11:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102F22EB5BF;
	Fri,  3 Oct 2025 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VCzQCWr6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478BD266B6F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759489398; cv=none; b=Kq1LQhZ+jge6tTxmAXYZkUDODeRkNNK7ay7L+8dq4oekPmtWqFkbMIQkz73A/abf+oTQBwFcVZdvt5O4JMWEEGUFkzWLWto/zVY2q+1Zuub2OZ0hB3ibVgV7s5rgcX+XxJvxEwDwZMo0iEYyc0m00+CgSRBVPuZSWAzc8BeNrcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759489398; c=relaxed/simple;
	bh=lDohWUoJaHynhH3MOxnjTG84dqnL1JRmy3LJv9eoMFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XT3nUeXeN2LIfrvx/PpNuv2XLkWwFN70kY1FGR56lbcJExRRD1XxkDwfdm+dMiNOwOGfr1QrXJExPnU8ypS5IPLWbi2NOFa7cj3hGjrys8Bnb1SC595u7q2PutVWAbJUuyKijotAZjpywQL6DhTpoLBBZi6ni5yA6xM82++RHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCzQCWr6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593AhNph024141
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Oct 2025 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dgfzgGOSasl+ZVV9PthYS1ZXTpTvDU0eLRzMEgLEu4=; b=VCzQCWr6uyQgXfSI
	NNaqdGIflelCuO02ZxAUSQDpsO161ngiqcbYQSvoTVIs5iTbv9P4pbisczplFKSb
	3Cfe/F0PykCSqazv6mnc8STSZQWUPU/T9MsWpi2Xkvn9poI9bekpiThU/uKPynrb
	ZL13/QXoGlBaNRbKi+TMwCpD6t1/6HhMZVNXvIPa87Q170lF2K70kbSyP+n1MjTl
	wAb7DPgs9xyekEAqPVRoCt8Wwp/RoC1ngufasqUXxTFl268F5FzQaxsyZ7z7tw8i
	ZJIK64lC2NcMTXzJmRFVsOiF/1nIAXdR3J4tFiX0PkwF9d3w52TIsI2DLQvAZK+i
	6P10TQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e9782d8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 11:03:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d88b669938so5157031cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 04:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759489394; x=1760094194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dgfzgGOSasl+ZVV9PthYS1ZXTpTvDU0eLRzMEgLEu4=;
        b=NwMvSHYm/0oFpm/Va+i1bTeRxgcARl9T2MH5BnEa65nDVl8Qy55dtRiO/BGtpPg/dF
         OZ02nG5Fk7uWvF9iX+bfWOy71y5x8Uxx7xWmwZ4VL6KGi3/Omsk1n/rwhSieapqEVMKi
         kzmI1Uld16kiOdLYE0PB39fMpUwjvTEBVi8IkQypnr6e0cAMCwRg4sCCWqNVVq4XbwKm
         LtA655ytfajCWx5Ry1OIDhUra4VeD9Bi815SN9vKC5Vy8QRDfLdGL6ymqGQBRDu/K629
         2e9V4qsTvUSdHZ4Mtzes+kOG+d8pCmKYGoU2BjR1K0nlOzRPOl5jdO7GXoVSs6GPqNET
         7nVA==
X-Forwarded-Encrypted: i=1; AJvYcCWM9g/SK6avam6laBFrvqXSdYhKXCzPVSxAAW2kUAvn2lbVtENYYvWrY7jcWPCvst/LwDfTBZ2UN9qHAtRL@vger.kernel.org
X-Gm-Message-State: AOJu0YyjS6wl0MYJQvDAwHgD6azRp/APtW2IVVBTr9faqUR8loVWF4Nh
	4eo4AvFPHsfnMlGwR0dgSci1CUWrfppQJc8eQRSWZQBL1jW1CW5LMpqL2uqGehlz6FHPLval4Wy
	6nLywv+qnf/uUaDQB8rkycT4UZ7hsHBXW35XMO1f6AAaARQAk8z6Ybs9MSN8OcH85Kd02FYYymL
	pK
X-Gm-Gg: ASbGncs7PcVTvn+D33mL89TJaEm65eXc5xa2REY1qMLMhQ0YLgL1/nIO6JH3hZBhN3W
	0FZ+nu45IG/1sSkEHqRUTBK7UGylWzurbHDecPoxta1+teF9gBAwT7/Eaywmj91sl6zgapb9/4U
	EH35m3K2YJ1msKJ1yOyrctwEOtsV2rtPim+7T8PukaQcyq1Tljsr6kVvKip5pkGIRV6T0zHGNZZ
	rawRzy1UsNCQgzo5ILhs8oa7IVJsJcrgll7xNLAnU3Qi2U41YvQuLb0rnPmhDGA6c95TteGDlxu
	cu0cGiMKyWTRFwyH5PcGwpwQ2xUB8Xw4ySbfZaIgT08RQMCIlI5hlfWM8a3me6szLGz1dZfZf0X
	tA2SqnW+l9UGCX6/TxYR+TCv2tjo=
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr22035671cf.7.1759489394532;
        Fri, 03 Oct 2025 04:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVIGJAdXZaVnplAq0s0yZvJ9e16SvUkJdruasG0YxlTSPUu9BhBdh2VSs9hy1ofizVbpdKTg==
X-Received: by 2002:ac8:5aca:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4e576a98c02mr22035221cf.7.1759489393901;
        Fri, 03 Oct 2025 04:03:13 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f314sm415721466b.69.2025.10.03.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 04:03:13 -0700 (PDT)
Message-ID: <a6c6c701-eb45-47db-936f-b02fc260ce51@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 13:03:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
 <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
 <175948770924.935713.8703906918697470771@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <175948770924.935713.8703906918697470771@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 67h6XsEGZ2gvpnW8uPydm2f4bGWC9hrO
X-Proofpoint-ORIG-GUID: 67h6XsEGZ2gvpnW8uPydm2f4bGWC9hrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX8F4A3XZwacCO
 YNQ36+pamRtK6GRcTwupu4XxGDTa5BQ34J13wzYaTzOHtZyYSDmBroow0OaOjbdQz6rMfVx12KG
 sG6tOA63uBOniybZU0OtKZr1ZfNyL/h8GiHTFcsfP4oMivuwyzabPBAIo8lAp9mjWoJakMmAwPe
 FNV9EcarYyRF8bXBp5/F/rk/FDHHps65OllQapH2q+RUqPl0uP1tdX2Zu9Wv5f4vhcr8JWGLPM3
 F9BG1H6+r2cSEgC9pG60mJxyw6moQrz1cr5J6/Nq+VOU9qC8BDHz4tgyaL5T9BMkx5t41qT9HxM
 4SQJXvdMJMv3xDrQVhHIhdPRBXHF7ZYBNnGtA0sHkxa7py07aa2HupfL6zsXiPJ8p8d4HeWDG1N
 O/jguSoTgOdN2MPjbKAGoQADa1tZOQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68dfad74 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=6H0WHjuAAAAA:8 a=q-YMejDa-k4cM9YibJsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_02,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043

On 10/3/25 12:35 PM, Kieran Bingham wrote:
> Quoting Konrad Dybcio (2025-10-02 13:45:49)
>> On 10/2/25 12:15 PM, Griffin Kroah-Hartman wrote:
>>> Enable vreg_l6p which is used as a pull-up for the CCI busses, to make
>>> sure I2C communication works as expected.
>>>
>>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>>> ---
>>
>> Makes me wonder if we should maybe extend the CCI definition
>> (or maybe the common i2c-bus binding?) to accept an external
>> pull-up supply, as this is a common problem.. (+Bryan, Wolfram)
> 
> I'm a little confused about terminology here. To me CCI is the
> communiation protocol (how to write the registers on the i2c bus). But
> here' we're talking about 'pulling up' a cci bus ?

CCI is unfortunately also the name of the I2C controller housed within
the camera subsystem on qc platforms and we're talking about pulling
up sda/scl lanes

Konrad
> 
> Is this actually impacting the bus - or is it more that it's /powering/
> the camera and VCM both simultaneously (which is what happens on the RPi
> cameras)
> 
> My curiosity lies in the fact that indeed we somehow need to be able to
> coordinate the power relationship between multiple devices which ...
> while independent for configuration - they do impact each other. I.e. if
> you power on the camera and it simultaneously powers on the VCM - you
> get the VCM jumping position if it's not also configured, so I
> anticipate various bits of complexities here if they are all powered by
> the same line.
> 
> I don't think a camera module should always be powered on for a phone
> running on a battery - perhaps on this device the sensors have a
> separate power down control ?
> 
> --
> Kieran
> 
>> We could then shut down the regulator when cameras are not
>> in use, preserving some trace amounts of power.
>>
>> Or maybe L6P is already used as a pull-up supply for more things
>> onboard and should be always-on either way? Could you please
>> check that, Griffin?
>>
>> Konrad
>>
>>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> index e115b6a52b299ef663ccfb614785f8f89091f39d..2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>>> @@ -749,6 +749,8 @@ vreg_l6p: ldo6 {
>>>                               regulator-name = "vreg_l6p";
>>>                               regulator-min-microvolt = <1700000>;
>>>                               regulator-max-microvolt = <1904000>;
>>> +                             /* Pull-up for CCI I2C busses */
>>> +                             regulator-always-on;
>>>                       };
>>>  
>>>                       vreg_l7p: ldo7 {
>>>

