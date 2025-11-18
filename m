Return-Path: <linux-arm-msm+bounces-82248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561FC68C66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 11:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 948AE38357C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033EE33D6CB;
	Tue, 18 Nov 2025 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LznyeuGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRunqAJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05A0335573
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460790; cv=none; b=BymwK/0oYGKvIcqIBgC/UtQyD2TCJSKRL+FjAGSyFip/37vbuN5xmYNV1xa6u4tnRUsB3O6lDtgF7YWkQM1JIVGawWoihNwSKgImPBY4joIxQGHUCFkuGtkaERj7Kwbx2tttEnAfYd/FWp2w8VxhACwBuiK05pHZGkiKGK3EzRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460790; c=relaxed/simple;
	bh=p86/dNjKPq5lQLoQprWClLEvLhcVBSWh72Ix5IV5rJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qlHsXbskkozm6+ef8heZPzz+CQBg+QCv5h1tEq66DsLKT/6OLJjcW4hGm0NfC2IZgsLz0dkhXv682C+u/2OKPwQuMFeuWU46fpziRD5LUGTB+Umv6kTFBYaDyOAXoRoxxpePDUtGvnN+WgYTngFvl0Lrcjk4MEnGI03633CPraI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LznyeuGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRunqAJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI8E3NI2194538
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ve1LAq4WF69r/C5IW6P+gb3usOYeN/dnDTjOpMaTMow=; b=LznyeuGps9kFw6l8
	lvkLT3xt9Q+Lmy1s4qs7u5R5Jbejh6vI4Abeak+OQhK4m/jZu7p8Rpe1/OouJWxJ
	8BzWplel2+P6ryR7EKxSq76mr+I4sWTnqZSebwQQIz/wIL5LG7tD4CbiU8GZZAG6
	/vTOZAku6Dqq/N8RENwMSVBWz+dpWFy/2e3ajTmoqQhsaPmxmBFltp4YABskRKhl
	sXvOik32XQGi1+8IP0zd72Q/+EXHiwHBZuDlILEHdWsINT0NUAmwKe9is66ukKP0
	ZtJRiQ0SfCN1vsrSLrnbJ9jofheQRVulblPplluwDDz4swWcZgYclHaWLEsfrYFk
	MQoLAg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y8cd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:13:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88046bc20faso12041586d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763460785; x=1764065585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ve1LAq4WF69r/C5IW6P+gb3usOYeN/dnDTjOpMaTMow=;
        b=LRunqAJCMAGIMkT6ktYcabt9TI1yqEMg/42mZurMqRmEdsG/PifxgmorktdZtG1JFP
         P3awFs+oaefpYzvkx82GHT/INvO8cFTRVXZAaW5MirZYEa/ntNNAuICwfWQC044g3lcC
         sKzUCWGeLK5iVqmyH6vvvvZY8tywTBjeFBBZMrQPnjrmGJlbtdE5gp8zB03NjuLS0tYJ
         WWng9G3nDoOyOKwP0EIURj1tq4DwPtSQ7k9MqfxIauj9cjsVVxjJ/u+edUWNmHT8KZ2h
         vpSf5kaWLd8AFSENxsX3rwZehaid0QtIuWXrxHkLb99pskfwkbgujctcGdITegHa+yV7
         zEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460785; x=1764065585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve1LAq4WF69r/C5IW6P+gb3usOYeN/dnDTjOpMaTMow=;
        b=ZC2rIGy3kM1MUhRugjSLZN8AL7W74pfTx73qUj1MOysycZwIiuDvvZZiUDn3g4qtHI
         7QdAso+XFeiSy2z5y0LnJos0GTk+uJjrUeq9EoJ8ecrbBsgb1heN1/hDDhXHnLeZUYIr
         oSDAWPG7LtqtEnK8oL0XQ0P87Pym8/dWYCnCCSjeGOm6Q0qAUuFir1XDkL7G+wcno+4A
         JFYaVKbVcTkv0Rwsqjj6stetxGFgb5Iy2cU0M01Hj+RJAqo906ODE6cUOz6fDYm+MIHe
         6lU2CmNmQrZt1hGxaRdKAp6YVb7GFA7jcyyQwd6hPt7aysLZzGM38/0fxuwqiWCcGrIk
         qiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYt2CpLms2jP3LUEJ0LFhbvdGcIqA0ar1gr3t38nnbydmPRHtVBnHv3LMC9OlB6bST6GW61O2Pg55SleI8@vger.kernel.org
X-Gm-Message-State: AOJu0YxnNo3Mlxz/9vDoMJCgh2M7PqzYKLQpmXObz6eSpURIoZbCc6nE
	VIohQ9EmvWt0gHKKJ6vD7FlOLA0qnGJwKXDnNVPh10D4lJxA7YN8HDBD2YnG6mZ3Fbf04APOk1E
	jba1vT4dvAkRMOhmFuktEB2o1cIuPucwPFg8h7tJCYhJMwy7Am4wquToC8S6W70rNULBB
X-Gm-Gg: ASbGncvm5Ac7J6WJixMav0YILBLGdqoGts/dt1Vx47VtbRGkDCjwiNE5yyqSQvqdWet
	vxeXEabZhojf5D5qcXPtIZ6vsXFWU6QME/lDMsQANX36DkJw4Kc05NIpQdsPK/8pFcHdDJxfuaJ
	9lcQQUPylqfjurzQzyoQ0ZayMDwfZn97zNoTfIQ775l2TR4YK2nPMDc1Y/PFg8LsCYyeHeHHdt/
	OgDTnEJu4pM+a40moDZzBbqpHpGw6kQEZr/7PEAq6N9Hb9c3tvjVSgezR5W5FHEsr2PMIMHfw3b
	iQehLh73WHCl/DgmLDPw3gDMn3rHWN2Ukjb4NVtwdY59UoQ5BP0c9ry4SRosRmj7mIAchYLUHlo
	HMdvPNBmoiiag7h2yQoLU3lGSI8xXHYYQZowgdopN+ZNvk3H27zlzTCV+qh22lSmVklU=
X-Received: by 2002:ad4:5d44:0:b0:87c:21db:cbbf with SMTP id 6a1803df08f44-88453c2a232mr19108286d6.4.1763460785193;
        Tue, 18 Nov 2025 02:13:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/EhHlt6Ki4hhnzn9S44Am3/H6nFH93Enx6MUQ7U4vQdXdGOzshdKlAoHMNnN5bcG0G7cesA==
X-Received: by 2002:ad4:5d44:0:b0:87c:21db:cbbf with SMTP id 6a1803df08f44-88453c2a232mr19108106d6.4.1763460784712;
        Tue, 18 Nov 2025 02:13:04 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804057b0sm3772266e87.85.2025.11.18.02.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 02:13:04 -0800 (PST)
Message-ID: <d0bd3084-a1e7-4fe6-b540-0919d1674ab4@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 11:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] power: supply: qcom_battmgr: improve charge control
 threshold handling
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Val Packett <val@packett.cool>,
        Sebastian Reichel <sre@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251012233333.19144-2-val@packett.cool>
 <faa9d74d-63d3-4569-ab36-5e0ee0241794@oss.qualcomm.com>
 <02db51aa-6e19-411f-875f-718b8215c373@oss.qualcomm.com>
 <d92cb96b-b398-45c1-964c-0ab551ca135f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d92cb96b-b398-45c1-964c-0ab551ca135f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA4MSBTYWx0ZWRfX3tbi5iBbocsf
 lquDQm0ulMIjlQ8UgAT2iPE4VBZDFPu3qBCoKcTrNVarPDpU0R2xAx2RguALDaJt7f0crj1Fic7
 94jS3VkiHVqUlSgb0GQYsY7F1jVZPyE1B0f08bHXkQB/IaL1s62KchvhO9OWVwQPwMpx39CqDGP
 kMYDhvK/bEDHf+4EByIr72znrhOcq2ktPYHqwFKaQRkDrSyF8ES0kSsXVd2BYr4vQtW2PR8wguV
 NwwkFF8Jo8Ph7ExJ0GvfwPWRsFOHcgxymQ4jBThB0gePFVtZZfhqvc3RDNsvcJJx1N5abynxInt
 WKZ7Bk/UAm4bzA62W4YSub5XxjxJG20Mu2YS2fXtSbyUdmjTrm5jsGr8jJcjdKYByiI2F6Azrpx
 NHLskGXUx+KFnr7MtnvflSs6NeWa+Q==
X-Proofpoint-GUID: tGj180DNuClgvvAq2GiJruEf7z8cIoLG
X-Proofpoint-ORIG-GUID: tGj180DNuClgvvAq2GiJruEf7z8cIoLG
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691c46b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=c4AfajmopHP_h9yQQvAA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180081

On 11/18/25 3:29 AM, Fenglin Wu wrote:
> 
> On 11/17/2025 8:45 PM, Konrad Dybcio wrote:
>> On 11/17/25 6:12 AM, Fenglin Wu wrote:
>>> On 10/13/2025 7:32 AM, Val Packett wrote:
>>>> Currently, upowerd is unable to turn off the battery preservation mode[1]
>>>> on Qualcomm laptops, because it does that by setting the start threshold to
>>>> zero and the driver returns an error:
>>>>
>>>> pmic_glink.power-supply.0: charge control start threshold exceed range: [50 - 95]
>>>>
>>>> Kernel documentation says the end threshold must be clamped[2] but does
>>>> not say anything about the start threshold.
>>>>
>>>> In this proposal I've special-cased start==0 to actually disable the
>>>> functionality via the enable bit, and otherwise made both start and
>>>> end thresholds be clamped to the acceptable range. Hopefully that's
>>>> fine?
>>> It is fine to clamping the threshold to the acceptable range. Thank you for making the changes.
>>>> Or should the [1 - 49] range for start actually be rejected?
>>> The minimum charging start threshold was set to 50 to improve user experience. If the threshold is too low and the system keeps drawing power from the battery frequently due to a large system load and a weak charger, the laptop will only begin charging when the battery level falls below that threshold. If the user disconnects the charger at that time, then the device would be only having a battery below 50%. Setting the threshold at 50 ensures the battery always stays above 50%.
>> So can we set it lower?
>>
>> Such decisions are best deferred to userspace and/or the user, which can
>> limit what the kernel exposes as necessary/deemed useful
>>
>> Konrad
> 
> Yes, it can be set to a lower value.
> 
> However, I am still having concerns that the inappropriate start and end threshold settings would cause a very bad user experience if they are misused, since these thresholds are stored in nvmem and they won't be reset until battery is unplugged or completely drained. For example, if someone intentionally sets the start threshold to 1 and end threshold to 6, and if the laptop was shutdown with a battery SoC less than the end threshold, I am not sure if <6% percent battery level would be good enough to boot up the laptop successfully, if it is not, then the laptop may not have chance to charge up until you hot plug the battery.
> 
> Also, from battery management firmware point of view, the charge control feature was mainly designed for battery health management, to slow the aging of Li-ion battery by preventing it from being frequently charged to full state. Having a too low minimum start threshold setting won't help anything on that.

Perhaps 50 makes sense then. Maybe we can encode this reasoning somewhere
in the power supply API docs so it's harder to make the "can't boot anymore"
mistake you mentioned

Konrad

