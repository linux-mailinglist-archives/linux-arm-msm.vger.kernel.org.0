Return-Path: <linux-arm-msm+bounces-55589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8746A9C3EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119321BC0F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAA923F412;
	Fri, 25 Apr 2025 09:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5hl9uK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EA241CA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573756; cv=none; b=teKl8u18t9pWt8J7HbTItBgBkqRDqQ6RCW4oKUcbNSRbOTM2gbxTkwnnsrz33THP1kEzDpEHxwUX9vegIYavYWm0dH6aSGdXsEje7nfdLxeJxl783SfD2myPD2I2+G4iHRflarTR3Q3KKKWb4krOQDg9uoV23hYyj/pF4tHrqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573756; c=relaxed/simple;
	bh=sToWdQKy4Ilj8vtZl1fJZYV45WUmXfqIRGKxYDJBgAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBK3saEVNE3+8PPnPvxW8YK4UdEzC34feqAzdighjo403zwRV22Dq4eImDhsTcMTNDOflHS6SR40ieiMkm+A+VRSEyaIbsUcxs/tjcfZgCPLnRjIcpTPkmQXrJsgOCYXn+Pz6S1eUwepxbntS9xnPHjNQ6LMeESdxHA4NCtU4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5hl9uK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7qM016028
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=; b=C5hl9uK4YRXvDPx6
	U9Eaw4kphDAc62d/9ms3w+qqqJojv0NqT5rUazrhs4eo7M0bM4dLANit7ovWPzrG
	QNcZpuciVA6kgtv9STJZwENx1b16lMINP5UQiVO6pGrIHF6xDo8sQczChxxLV3l2
	ws/fZmbuq1ucBjV72OG0hrOnV3j4fqL7XjNkeJECTRudgZU0E5qjJ1iTMA9PyVgB
	Jv2qRJSrPORvsStQHksdH6rs0QAn2CHAYTEtwztzaSH51QwJUP4kf9g4bbXnqqqs
	uMr8tpHuIaTI8UCrAlVTHkqp88eM40HD1gRyTeL9VAPO2m/TYIMSuVEGMFOH0o8W
	4fs6/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08h7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:35:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so3471046d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573747; x=1746178547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=;
        b=IFiYE19SeNu0KmaBTj9nCc7eUQmjkTzomysZtUCINOZNATSMUS+DCB5Ub6xxRGTMtA
         hJiuyhhg5wUhdnE2KPxwBZNBZ7kvERuILypY3QhUVcBdw7GUe1VIhEex9umgtZd+VXYh
         6Ns+GK8jUqr+rIwi57D7BX+4ZGWKbFpb4AQaDcznJEGzzNmToSKIZLC4Z8Q5xCnMf8bB
         PAWysqtVb/ci+A+zzPtgfItheNtefT9eDd2onc5mRAjCBufjfGzePsj+YMmTZ3Vrjlks
         fUsV16eFw5tLu0zTNYWlXcb8bB7hhmdBk/yy37o9ul5P9Gf2YOiJvC/h4VoagaCRCxjU
         v/EA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wN7pTDnjXSjHe9iFylBDyI2Ae2Ex36I1v6EFVbPhBYkY59CbqDYHd049BbhNrZbrFn5Y60sXD38yc2px@vger.kernel.org
X-Gm-Message-State: AOJu0YwWUMaPJU7hUfDea3gG8+0Y4UlAowyuoRk9DqRNBUDFZ+872WxF
	/EM//fsP4djWDdDymo8t+c/6qxzmcBQkH3VG6IXxsrmUGzPpll7GDjutph72XAZ5NPH2OPXiMT3
	+pvmnrj8TeaAt4//nmrPjiTlNxVpNCeIBkaOIl2vE8qvQqkHjQa7Bt00jEB/jZuE2
X-Gm-Gg: ASbGncs/RuUoss6ljgroJ4tT61JugAQZPY4GEk92WEUzS5O2stabjl5F4tKxAGThiJi
	khutLeSBbPR0u3qoHbqqvY0e9fqLR1+V/Mhd1U3QPuc9qz9x71Ef2NdL+8PNvUdY30VWRiexdwj
	fyd1Tnmci2Kdtu2d2AoxdGptyoAtmABcLiRggvHHtRk+AB4Wj+zzgN05g/4/9KPdIuJhLM++Vbr
	sEXBeBP1D66fv+ob98pSd9cEYgPBX2T+eXkQz+XVxLcbrJkDUfVVcX2HCkTs9zw3KH7vN9DKF04
	vrzO3fLWKQyuAs7oHR8hBq5lhrTQY8LTYu2ouswkT3knlEw50vi6ARAB4gglVFbu
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12148996d6.2.1745573747736;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoiv4MlBzWT6NZGwE45WPs9WN6M0wjAeYYYXs2TXJ84tsBTXEo8eVE4CzqSua4OQ5eBomYJA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12148856d6.2.1745573747358;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038340b7sm982484a12.79.2025.04.25.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:35:46 -0700 (PDT)
Message-ID: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OSBTYWx0ZWRfXxkzDrTM00ucy itTRvX/vUKVORCkmf79RlDViRCU7zrJhSbp9gLXLMdenm6mxKZWEMPFXnQShEyZftVQD9y1zn9I lCnY2Y61FnHs+tzYNYkCKtj8/qUdsFlth0/3gjyF6NmF6gQH/kvqXAzx6BtMAeQ/DuuC9rbvN85
 cZLCjLLnFe65/lvmJIifj/7B9xehGVEp8CrMQOzApDJx0PDf6X90aTKD2t07WEJ/NA/lceNuo17 WWKuf28hv2636x0bfvOYp50OoUUEBye+6TVRruissL0u0qLzkWWcdzPt5egtm7D1RV4l85+cAln vst/lacR3ijyVvXlzfZkSVp9/8vNJvv+xX7WPdYqmUx16mvImUVbf42KEAgWSB93Wl5C807Quvq
 +twXMjfGfXByvN6lkWAprLJPjuE2Xp+ydudXoZa/qgTjZCC/MdveVxLufbvy7mbk533nRXgQ
X-Proofpoint-GUID: GfanDGYTpMd2T573InLCcDujWzjCIzeS
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b5774 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NoTk0SwpzZkwhluMIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GfanDGYTpMd2T573InLCcDujWzjCIzeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250069

On 4/24/25 12:38 PM, Satya Priya Kakitapalli wrote:
> 
> On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
>> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>>> Add device tree bindings for the camera clock controller on
>>> Qualcomm SC8180X platform.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---

[...]

>>> +  required-opps:
>>> +    maxItems: 1
>>> +    description:
>>> +      A phandle to an OPP node describing required MMCX performance point.
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>
>> A suspicious lack of clock depends here. No AHB clock ? No dependency on gcc ?
>>
>> You call out the gcc above.
>>
>> Could you please recheck your list of clock dependencies.
> 
> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.

Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
bindings regardless of how we handle it.

This way the DT represents the real hw dependency, but the OS takes steps
to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
because the clock is never registered with GCC)

Konrad

