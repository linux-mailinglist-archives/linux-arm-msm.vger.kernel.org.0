Return-Path: <linux-arm-msm+bounces-87368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F4CF2024
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BABE30022D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2776E5478D;
	Mon,  5 Jan 2026 05:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h8B9+KCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eFRr73xH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA4B22129B
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767591376; cv=none; b=gquej56GJmod5djaqc4Lcgm3S7MFbOPoFhOZuTgqzdEEQoizMNj/zf7sb5hhxvbUr9qSPEdhpVtEtIu5qHCFyG0YG0TLU9vhR/KRGCGjo8kYec8D+13ZnBGFgqJ81psdMoAZauf+VN/txFXdIcfFuD3A4hwn/+qyyu0nmfqLfsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767591376; c=relaxed/simple;
	bh=OjXIARhA04v7QTbluibCg1Ua4ca6hpySNteOveDpVyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rpsk4iRumHcGpipDHc0QNMxdZYR0/a5XisH4lgdtWlLpxxOwnq+evJXL+rZK9I7L/KRczFZ2/hn4FdaRz3fEyx6TW+5wj7WNWCo/pWKJOM6LAAls8i+dPhU9BKGQGDYyCPyWPTUArxwnXPDa5lKVajl26ZQnjTwFHFtjLFYTLDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h8B9+KCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eFRr73xH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604Nceex1207936
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 05:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vc/nABE+NCB330MJT+THBXID+Q7Gd2jX5QLHj0sow+U=; b=h8B9+KCR3b2nJtqe
	uCsudu9VZsmAv8GM1n65LesAvtE+xNm/6yEokBczvQjpVfXqHaYBqtyc/edfNw6s
	TPpy1TuLioanda358Vz+F5eU2Ucux7YvehhOgqM2t1dFS2Qny4w2lUxZY7XKn6Fo
	U/8Wc8fd4kYxs6OIKJgOyOieL1LDpqoD4lLUNlnF5TVORHr98B2urTpjO/47yy87
	Cp3OINwjQjytqDnHqZDOjR2N4R6AXswi7HpcmN+5TKWCaOeHLrxEvYTmSbsdDQo9
	SqM9DDohiEJUhA+DxJqzlDsd86V1SaFox/lu/xIFxtQ4jbv2CZ/2KBrExVoIs6PW
	5Wa5NQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9hb7h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:36:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89ee2c1a4so26730397b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 21:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767591373; x=1768196173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vc/nABE+NCB330MJT+THBXID+Q7Gd2jX5QLHj0sow+U=;
        b=eFRr73xHkgG+CbLakTwKdbB7u2vIjiN80jLJjTetUW+kw2QGukHXc5XypSO9ssi6uo
         LEFtBxJwomzgiLu8Jo+ZeQd/oNt6hdxQrnxPcHBLO7wURyNoGyNeOdb3xSLM+Sx+Rowb
         x7wyPzHMqJ6jwFVZ65iP97mwHBn/J3p+xivV2mHx9NbWJ7IIrbcxwgFkT+5Ol2MLWSXR
         MJ2MmtLh4FlerE9BBjMtpTMJ4tZt4Q25PMQhDJ4FCoy7gDq/hT1M6fh/1ndk+a2O6mMi
         DrzMHyxAr0D9Ma8sx1FycgEzTM5ieK4oS5MClD2XL+lld5HZwoEit9CokHtWBnGg1X/J
         JcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767591373; x=1768196173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vc/nABE+NCB330MJT+THBXID+Q7Gd2jX5QLHj0sow+U=;
        b=ChnphqOrBZw+J8x2n1oQBz5+aojuxedSJzOmHdb8kmK21PS/3w5cpAbYaHUyjxaAbP
         YwcAfQkJWDS1Hezh349R8lAoJ1qx2lekmy6jPRIH5ZONiFco9ayZJuP0QOigu3PUyA7B
         nyN+De4Qaw19Ms3lNvNzXt7Wx79Wy4Ui1sAsVNsy6j6sFK7NrTCxosoGRE5/4t7HFnjU
         UumFJpoWvFKyFpXGl8PVm+vBZKQzWbLkP7TXF3swa6mRbQ843+/fTS5CEItwi0CyPWhl
         59lmTZh5IIQ7iHuUCuw7irneAWFHZv1WnHa+w/qftJSFcAOLno2BiNzegYBcbgKW8lqY
         IJAw==
X-Forwarded-Encrypted: i=1; AJvYcCVvDZd4JuHxIRXrI48RazL6BUp335haXsCxLVETq8TDMIs4iHI0iVTE5s2aho6ND8CXa+GG6eF22VzarlkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy10tiRiBfMwHzmWbawx+cMrjxdOSuJMOnag0AbOQRmqnpBDMxz
	z5Xa8ewBNx/ujccAE0nxrsb+KClQtK3nGzJ336VF2k2MvfEh/cxmxkqdEypGtKviVfBJgUH7nhd
	zzJ0xCBike+pXVWR6ctiv0OabT7kwKuF/8GWUBZ81pjBro1WgVs7/UCsKzAx0aER4YYFB
X-Gm-Gg: AY/fxX4njcFGw0j8R8MkoqMQUS4+hk01AqHypnjjWgY1FUthIc0KuUqWWnyCJswlVwP
	bARwl3Rte62rtFAUtBrfFMy6tfCS2t6KvF5z0ymg4KN80FPgXeKUz4sXWw3qUZ2xB4NdBud0qKS
	fRAXreOgxZKpgIfyWvMLOAVNiSyLTs6oFn4WSnVTn6yeYcUKSixCR5vADJxsmTYWeFGuq4XhLLF
	OSBumHJOsM4jgIDx7tVAnN/QmQGZzBLCDnLJIa2aL3knf//ihskQRnk7JcrxzoapGjsxBnE8a8f
	IC3/yG0lEC3ZyHHKjX209gPUagkM4G+PC+03p3vvFH9mMBHqD3OZjCf6akyJAQD9bevr+CLu3wB
	fHIsmZUeUdrkAuKor8wuTw405eoh5ZpRruJKo5Hegk3S7ZJgSZtQJh+DesSJqbtUtRnIE3HSHlz
	jJqYPwxA==
X-Received: by 2002:a05:6a20:1016:b0:37e:43b7:5213 with SMTP id adf61e73a8af0-37e43b75332mr17253766637.79.1767591372895;
        Sun, 04 Jan 2026 21:36:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGHuMnlwnPCZ9NdxMzI/8mrigOk1wrLWItrvzXS/LeXU/Fo+Z5aoRx9bFGKuKk3e4kuTm7zw==
X-Received: by 2002:a05:6a20:1016:b0:37e:43b7:5213 with SMTP id adf61e73a8af0-37e43b75332mr17253748637.79.1767591372393;
        Sun, 04 Jan 2026 21:36:12 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776c1sm435005785ad.102.2026.01.04.21.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 21:36:12 -0800 (PST)
Message-ID: <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 13:36:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0OSBTYWx0ZWRfX3ZxQSNOP6H7p
 0E/W4HYpvO+JcTidLu17bBb5xZUe3Phnp+CEMzuE2ij0/qipGuCFyzV7JC86iJncrGueOlhTKd1
 /C1L9FmU0IpH9wOAQTupDLn5Ekn9lIbYeaNKNZfmJKlfIbR7u/U0Jp4BJDNcOdBOBSUQkW45Xdz
 fTUvdCytyFOogLad3kKexr27JVxzwRCJpnqc0hjYK2wuQRQ6yaPAa8JvJNUA9BtfOK+BYCPi7hE
 Fx/e8tJDDyE2DD+rJBeQGJYEZISeSaXyY1XEAS0MOW4UFR2dFeTttfJLmZ25OaTzQ9F7M5/s/wn
 sMHWmkMJZ7c9Sqi6H0NnpjsVMBpnSt3zKbrn/4/NtDw3AyHiAnUcIUNNAari+FXhiH7wBYGkmp0
 grarR9JvqTxdd+XqVvOrh9D2C5+HT27rHtNrTNmU18zKA3SOoNtvGqJqpjlCXxjlC4E0X28FR8B
 yxwXxDxJslYOe8pGnKw==
X-Proofpoint-GUID: Mqp26fqXB0yGEN2OaYXPNAb1poPbgmzX
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=695b4dcd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=WYiU0xuuXi8eZROXrnMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Mqp26fqXB0yGEN2OaYXPNAb1poPbgmzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050049



On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
>>> On 29/12/2025 08:38, Yijie Yang wrote:
>>>>
>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>>>>
>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>>>>>
>>>>>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>>>>>> the common components into separate files for better maintainability.
>>>>>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>>>>>> similar to you, but actually common parts.
>>>>>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>>>>>> has Hamoa on it.
>>>>>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>>>>>> actual feedback, not some other arguments.
>>>>>>>>
>>>>>>>> NAK
>>>>>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>>>>>> Krzysztof,
>>>>>> Please let me know your opinion on this. This could be a common case for
>>>>>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
>>>>> It's not the same PCB.  You did not really respond to my first message,
>>>>> so I responded to you - I do not speak about boards. Then again you did
>>>>> not respond to it and brought some irrelevant arguments.
>>>>>
>>>>>> would reduce maintenance effort.
>>>>> Does not matter, I do not question this. Why are you responding to some
>>>>> questions which were never asked?
>>>>>
>>>>> DTSI represents actual shared physical aspect and you cannot share SoM
>>>>> physically. It's not the same PCB, because you do not have a socket on
>>>>> the SoM.
>>>> x1e80100-crd and x1p42100-crd are different boards, yet they share the 
>>>> same x1-crd.dtsi. Why can’t we apply the same approach here?
>>>
>>> You should ask the authors there, not me. I presume that the baseboard
>>> is the same or very similar. Or pieces of the baseboard are re-used
>>> which could be visible in the schematics (same MCN numbers etc).
>> For me this sounds like a new rule, which didn't exist beforehand. We
>> have enough foo-common.dtsi fragments, covering similar phones, but we
>> never required the knowledge of those phones having the same PCB.
> I am speaking about it since 2020? 2021? So how new? Other people in
> other SoCs were sometimes speaking about it in 2016 or something
There’s no doubt that using a common DTSI makes sense when the boards
share the same baseboard.
I think the real question is whether the baseboards are defined so
similarly that they can be treated as the same.
For example, would swapping to a different SoC—similar to the
Hamoa/Purwa CRD scenario—still be acceptable?
Would exchanging components such as the display panel, a single camera
lens (not the sensor, as far as I can tell), or removing the 3D iToF
module[1] still qualify as the “same” board?
In other words, can we consider two boards identical if the underlying
circuit board is the same but a few parts are swapped out?

[1]https://lore.kernel.org/all/20221114095654.34561-3-konrad.dybcio@linaro.org/
> Best regards,
> Krzysztof


